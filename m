Received: by 10.25.208.211 with SMTP id h202csp984123lfg;
        Fri, 11 Mar 2016 04:26:58 -0800 (PST)
X-Received: by 10.50.43.161 with SMTP id x1mr2878355igl.47.1457699218744;
        Fri, 11 Mar 2016 04:26:58 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b27si13620174pfd.82.2016.03.11.04.26.58;
        Fri, 11 Mar 2016 04:26:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752239AbcCKM05 (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Fri, 11 Mar 2016 07:26:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54530 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751975AbcCKM0z (ORCPT <rfc822;kvm@vger.kernel.org>);
	Fri, 11 Mar 2016 07:26:55 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 1D0265A7C;
	Fri, 11 Mar 2016 12:26:55 +0000 (UTC)
Received: from [10.36.112.45] (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u2BCQjHE010922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 11 Mar 2016 07:26:46 -0500
Subject: Re: [PATCH] Replacing (and removing) get_ticks_per_sec() function
 with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
To:	Christian Borntraeger <borntraeger@de.ibm.com>,
	rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
 <56E2AFA1.5010201@de.ibm.com> <56E2B4EA.4050305@redhat.com>
 <56E2B629.7080405@de.ibm.com>
Cc:	kraxel@redhat.com, samuel.thibault@ens-lyon.org,
	stefanha@redhat.com, kwolf@redhat.com, crosthwaite.peter@gmail.com,
	rth@twiddle.net, mst@redhat.com, imammedo@redhat.com,
	peter.maydell@linaro.org, balrogg@gmail.com, jsnow@redhat.com,
	alistair.francis@xilinx.com, agraf@suse.de, jasowang@redhat.com,
	blauwirbel@gmail.co, mark.cave-ayland@ilande.co.uk,
	cornelia.huck@de.ibm.com, lcapitulino@redhat.com,
	armbru@redhat.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, kvm@vger.kernel.org
From:	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56E2B984.2050300@redhat.com>
Date:	Fri, 11 Mar 2016 13:26:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E2B629.7080405@de.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: MIQFnfdFObNS



On 11/03/2016 13:12, Christian Borntraeger wrote:
> On 03/11/2016 01:07 PM, Paolo Bonzini wrote:
>>
>>
>> On 11/03/2016 12:44, Christian Borntraeger wrote:
>>>> -    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
>>>>> +    s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
>>> [...]
>>>
>>> While technically correct, I do not like these changes. The interfaces expect "ticks",
>>> and the fact that this happens to be a nanosecond does not help regarding 
>>> readability.
>>
>> Actually, I think usage of "tick" in this file is just for historical
>> reasons.
> 
> So in essence the patch is ok and we should try to get rid of the "tick" word in future
> patches?

Not necessarily.  The patch stops overloading the word "tick", so that
"tick" means "whatever the timer device counts".

In fact, you and I were both confused by the appearance of the word
"tick" in get_ticks_per_sec().  In the above line of code, the unit of
measure of delta is nanoseconds, because it is computed like this on the
line before:

    int64_t delta = qemu_clock_get_ns(rtc_clock)
			- qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);

therefore s->tick_offset_vmstate is *seconds*

       delta   /  get_ticks_per_sec()
       ^^^^^      ^^^^^^^^^^^^^^^^^^^
    nanosecond / (nanosecond / second)  = second

The code after Rutu's patch is easier to understand because "tick" now
means uniformly "whatever a PL031 counts" -- which is seconds.  Before,
"tick" on the left of the plus meant seconds and tick on the right of
the plus meant nanoseconds.  And I got confused *despite being the
author of that line* (commit b0f2663, "pl031: switch clock base to
rtc_clock", 2012-03-30).


Paolo
