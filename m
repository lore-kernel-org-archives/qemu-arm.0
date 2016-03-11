Received: by 10.25.208.211 with SMTP id h202csp1017281lfg;
        Fri, 11 Mar 2016 05:22:33 -0800 (PST)
X-Received: by 10.66.191.225 with SMTP id hb1mr15134129pac.78.1457702553357;
        Fri, 11 Mar 2016 05:22:33 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id tw5si2706747pac.131.2016.03.11.05.22.33;
        Fri, 11 Mar 2016 05:22:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752735AbcCKNWb (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Fri, 11 Mar 2016 08:22:31 -0500
Received: from e06smtp08.uk.ibm.com ([195.75.94.104]:54870 "EHLO
	e06smtp08.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752272AbcCKNWa (ORCPT <rfc822;kvm@vger.kernel.org>);
	Fri, 11 Mar 2016 08:22:30 -0500
Received: from localhost
	by e06smtp08.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <kvm@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Fri, 11 Mar 2016 13:22:28 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp08.uk.ibm.com (192.168.101.138) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
	Fri, 11 Mar 2016 13:22:26 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom:	borntraeger@de.ibm.com
X-IBM-RcptTo: kvm@vger.kernel.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id CE4BC17D8056
	for <kvm@vger.kernel.org>; Fri, 11 Mar 2016 13:22:54 +0000 (GMT)
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com [9.149.37.228])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id u2BDMP4u61931674
	for <kvm@vger.kernel.org>; Fri, 11 Mar 2016 13:22:25 GMT
Received: from d06av02.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id u2BDMOPA028230
	for <kvm@vger.kernel.org>; Fri, 11 Mar 2016 06:22:25 -0700
Received: from oc1450873852.ibm.com (sig-9-83-187-232.evts.uk.ibm.com [9.83.187.232])
	by d06av02.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id u2BDMLje028096;
	Fri, 11 Mar 2016 06:22:21 -0700
Subject: Re: [PATCH] Replacing (and removing) get_ticks_per_sec() function
 with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
To:	Paolo Bonzini <pbonzini@redhat.com>, rutu.shah.26@gmail.com,
	qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
 <56E2AFA1.5010201@de.ibm.com> <56E2B4EA.4050305@redhat.com>
 <56E2B629.7080405@de.ibm.com> <56E2B984.2050300@redhat.com>
Cc:	kraxel@redhat.com, samuel.thibault@ens-lyon.org,
	stefanha@redhat.com, kwolf@redhat.com, crosthwaite.peter@gmail.com,
	rth@twiddle.net, mst@redhat.com, imammedo@redhat.com,
	peter.maydell@linaro.org, balrogg@gmail.com, jsnow@redhat.com,
	alistair.francis@xilinx.com, agraf@suse.de, jasowang@redhat.com,
	blauwirbel@gmail.co, mark.cave-ayland@ilande.co.uk,
	cornelia.huck@de.ibm.com, lcapitulino@redhat.com,
	armbru@redhat.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, kvm@vger.kernel.org
From:	Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <56E2C68D.4010502@de.ibm.com>
Date:	Fri, 11 Mar 2016 14:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E2B984.2050300@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid:	16031113-0033-0000-0000-0000063BA276
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: TXVne6260CAH

On 03/11/2016 01:26 PM, Paolo Bonzini wrote:
> 
> 
> On 11/03/2016 13:12, Christian Borntraeger wrote:
>> On 03/11/2016 01:07 PM, Paolo Bonzini wrote:
>>>
>>>
>>> On 11/03/2016 12:44, Christian Borntraeger wrote:
>>>>> -    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
>>>>>> +    s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
>>>> [...]
>>>>
>>>> While technically correct, I do not like these changes. The interfaces expect "ticks",
>>>> and the fact that this happens to be a nanosecond does not help regarding 
>>>> readability.
>>>
>>> Actually, I think usage of "tick" in this file is just for historical
>>> reasons.
>>
>> So in essence the patch is ok and we should try to get rid of the "tick" word in future
>> patches?
> 
> Not necessarily.  The patch stops overloading the word "tick", so that
> "tick" means "whatever the timer device counts".
> 
> In fact, you and I were both confused by the appearance of the word
> "tick" in get_ticks_per_sec(). 
[...]
> the plus meant nanoseconds.  And I got confused *despite being the
> author of that line* (commit b0f2663, "pl031: switch clock base to
> rtc_clock", 2012-03-30).

Given the confusion, the patch description should contain
some of these examples and an explanation why this is the right thing
to do.

