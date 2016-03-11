Received: by 10.25.208.211 with SMTP id h202csp974123lfg;
        Fri, 11 Mar 2016 04:07:21 -0800 (PST)
X-Received: by 10.66.190.40 with SMTP id gn8mr14409363pac.64.1457698041846;
        Fri, 11 Mar 2016 04:07:21 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id un9si13531873pac.14.2016.03.11.04.07.21;
        Fri, 11 Mar 2016 04:07:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752168AbcCKMHU (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Fri, 11 Mar 2016 07:07:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51031 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752073AbcCKMHS (ORCPT <rfc822;kvm@vger.kernel.org>);
	Fri, 11 Mar 2016 07:07:18 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id B2987A3B68;
	Fri, 11 Mar 2016 12:07:16 +0000 (UTC)
Received: from [10.36.112.45] (ovpn-112-45.ams2.redhat.com [10.36.112.45])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u2BC779F031554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 11 Mar 2016 07:07:09 -0500
Subject: Re: [PATCH] Replacing (and removing) get_ticks_per_sec() function
 with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
To:	Christian Borntraeger <borntraeger@de.ibm.com>,
	rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
 <56E2AFA1.5010201@de.ibm.com>
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
Message-ID: <56E2B4EA.4050305@redhat.com>
Date:	Fri, 11 Mar 2016 13:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56E2AFA1.5010201@de.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: E5Z9AvDgdYGa



On 11/03/2016 12:44, Christian Borntraeger wrote:
>> -    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
>> > +    s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
> [...]
> 
> While technically correct, I do not like these changes. The interfaces expect "ticks",
> and the fact that this happens to be a nanosecond does not help regarding 
> readability.

Actually, I think usage of "tick" in this file is just for historical
reasons.

A long time ago QEMU had a timer that ticked every millisecond and the
timers were not in nanosecond precision; rather they used
cpu_get_ticks() which was tied to the TSC.  This was changed in 2006,
and since then the number of ticks per second was changed to a constant
10^9.

Usage of "tick" to represent nanoseconds is definitely the exception.
It's much more common to have code like:

            now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
            ...
                ticks = muldiv64(now, 32768, get_ticks_per_sec());

(hw/arm/omap1.c) that converts nanoseconds to 32768 Hz "ticks", and
using get_ticks_per_sec() is very confusing in the latter example.  You
would think that get_ticks_per_sec() is in the numerator (second
argument of muldiv64), not in the denominator!

Most of the time, get_ticks_per_sec()'s result end up being massaged in
some formula and passed to timer_mod which expects nanoseconds, such as

    timer_mod(fdctrl->result_timer,
              qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
              (get_ticks_per_sec() / 50));

where you have nanoseconds on the left of the plus sign and "ticks" on
the right.  NANOSECONDS_PER_SECOND makes it obvious that the timer will
expire in 1/50th of a second.

> If - for some reason - we want to replace a function with a MACRO, then
> please introduce TICKS_PER_SECOND which just feels better when reading the code.

This would be wrong, for the reason mentioned above.

Paolo
