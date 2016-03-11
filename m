Received: by 10.25.208.211 with SMTP id h202csp963070lfg;
        Fri, 11 Mar 2016 03:44:46 -0800 (PST)
X-Received: by 10.67.6.10 with SMTP id cq10mr14399407pad.120.1457696685994;
        Fri, 11 Mar 2016 03:44:45 -0800 (PST)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id kk8si1306466pab.26.2016.03.11.03.44.45;
        Fri, 11 Mar 2016 03:44:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1752049AbcCKLoo (ORCPT <rfc822;tyler.baker@linaro.org>
	+ 7 others); Fri, 11 Mar 2016 06:44:44 -0500
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:49633 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751455AbcCKLom (ORCPT <rfc822;kvm@vger.kernel.org>);
	Fri, 11 Mar 2016 06:44:42 -0500
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <kvm@vger.kernel.org> from <borntraeger@de.ibm.com>;
	Fri, 11 Mar 2016 11:44:40 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
	Fri, 11 Mar 2016 11:44:37 -0000
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom:	borntraeger@de.ibm.com
X-IBM-RcptTo: kvm@vger.kernel.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id EB8B61B08069
	for <kvm@vger.kernel.org>; Fri, 11 Mar 2016 11:45:03 +0000 (GMT)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com [9.149.37.251])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id u2BBibEX58589250
	for <kvm@vger.kernel.org>; Fri, 11 Mar 2016 11:44:37 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id u2BAibce011576
	for <kvm@vger.kernel.org>; Fri, 11 Mar 2016 03:44:39 -0700
Received: from oc1450873852.ibm.com (sig-9-83-187-232.evts.uk.ibm.com [9.83.187.232])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id u2BAiZPm011440;
	Fri, 11 Mar 2016 03:44:35 -0700
Subject: Re: [PATCH] Replacing (and removing) get_ticks_per_sec() function
 with NANOSECONDS_PER_SECOND Signed-off-by: Rutuja Shah
 <rutu.shah.26@gmail.com>
To:	rutu.shah.26@gmail.com, qemu-devel@nongnu.org
References: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
Cc:	kraxel@redhat.com, samuel.thibault@ens-lyon.org,
	stefanha@redhat.com, kwolf@redhat.com, pbonzini@redhat.com,
	crosthwaite.peter@gmail.com, rth@twiddle.net, mst@redhat.com,
	imammedo@redhat.com, peter.maydell@linaro.org, balrogg@gmail.com,
	jsnow@redhat.com, alistair.francis@xilinx.com, agraf@suse.de,
	jasowang@redhat.com, blauwirbel@gmail.co,
	mark.cave-ayland@ilande.co.uk, cornelia.huck@de.ibm.com,
	lcapitulino@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, kvm@vger.kernel.org
From:	Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <56E2AFA1.5010201@de.ibm.com>
Date:	Fri, 11 Mar 2016 12:44:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457638209-14218-1-git-send-email-rutu.shah.26@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid:	16031111-0009-0000-0000-000008009DC7
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: xzOrs74bGffE

On 03/10/2016 08:30 PM, rutu.shah.26@gmail.com wrote:
> From: Rutuja Shah <rutu.shah.26@gmail.com>
[...]
> -    s->tick_offset_vmstate = s->tick_offset + delta / get_ticks_per_sec();
> +    s->tick_offset_vmstate = s->tick_offset + delta / NANOSECONDS_PER_SECOND;
[...]

While technically correct, I do not like these changes. The interfaces expect "ticks",
and the fact that this happens to be a nanosecond does not help regarding 
readability.

Lets look at the snippet from above. The variable is called TICK_offset_vmstate.
so, the first line (-) makes sense when reading, the  2nd line (+) does not.
A reader that does not know the timer code will ask itself: "Why do we use 
NANOSECONDS_PER_SECOND to calculate ticks?" The reader has to know that a tick
is a nanosecond to understand that line. So the cleanup makes the code harder to
read in my opinion. 

If - for some reason - we want to replace a function with a MACRO, then
please introduce TICKS_PER_SECOND which just feels better when reading the code.
It would also fix the >80 chars per line problem.
On the other hand get_ticks_per_sec is a static inline function:
- it will get inlined, no overhead over a macro
- it will add type safety if we ever change things (e.g. somebody might introduce
a tick_t)

So I would prefer to not change things.

Christian

