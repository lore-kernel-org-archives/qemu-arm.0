Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp165231wrw;
        Fri, 9 Nov 2018 10:16:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5dp5vlsCkzEOsxPtjEs56HiDqxrVkMq8klxO/H3I2/jXvQM3nITNtxkakdPxF0saGN3UlTG
X-Received: by 2002:ac8:468f:: with SMTP id g15mr9564382qto.363.1541787366571;
        Fri, 09 Nov 2018 10:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541787366; cv=none;
        d=google.com; s=arc-20160816;
        b=YtVN0+tHHGvMQOHACqqPnLKotvkU6NshsvMnBzx82lfdKmLVWAhQL/j9MH6Rme9YMj
         ZCTv5DMsq+pAiApp97GYEA58qRDO5Er7LyLTsqEP4wSwgeD9kSDMih9CRk63mJsk5/ca
         si/Z76Aqg7xRA+gTPuKXbVjhe29qdkGP8dp+dw68sG+SJ5BEzLQruE73JTWh+a1em1nT
         PXDlQ5HpJ6TG5XSHTmQi2T+eL7obEDKj7y1vfdwNgXMddYz58Gx7L4DgP3IKlbnoaBem
         iH24IgK4U+lC7VlAosEpgBW+yr/do95ld83LP+xHVanIeA9QgNSfkQOBR10ziVueK3Eh
         7VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=QGMzOlKLhnc4CRS94zcx8TzjgCQAaVx9WftTGaEtuHA=;
        b=KdPhBwCR4ZFW4cpa/15tUmAZ/UNPcjxg+Ez94dnHOj9dEdMpmCpyAfyltYpdSGJXe1
         FQcczayc9MmCaYipigU3fG7hn+6NV+SH62sEXIKKiDJbL/UV9mGSJpCG43KMdEgctYis
         DXsj8mlIbbRmq4ZBrFzlQ0W5sgtsR0AW9dXeLaA2aVpwrHrzMH9KOuRTrQgh+xjOh9zs
         X5dTHFKPbPzdvD3S8ZhKv62oA82TraVxfXFLo5SD8nt/xYqFMFYDdWoVYUK5OVd0zHEO
         woNmzOBWp2xaWQ9kRrYxVebCTQkw2lQKeg7z8L5G3+UipfNRw/tRKkBXtCkLi1nPTXJ0
         uQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJSB5gt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25si303642qtt.10.2018.11.09.10.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 10:16:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJSB5gt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLBK9-0005VL-Vp
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 13:16:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gLBJz-0005Uv-PB
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 13:15:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gLBJw-0002Kw-Uj
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 13:15:55 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gLBJw-0002EI-1s
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 13:15:52 -0500
Received: by mail-ot1-x343.google.com with SMTP id f24so2449499otl.5
	for <qemu-arm@nongnu.org>; Fri, 09 Nov 2018 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QGMzOlKLhnc4CRS94zcx8TzjgCQAaVx9WftTGaEtuHA=;
	b=HJSB5gt88ZMMxtFlxnHudCptNyObwjjz0nxSTSQDArHD7onyoNt33dnpIKd+jqZESw
	kzeNbVXgembRLN+Eo5amfUale/48I0kCEqpFJ4SusWxLmflXNWt9zr2XqAvNIF5ZFB2s
	dsi/Q0D5XUxtskh0BWsLk09QXtQP+EGZrejpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QGMzOlKLhnc4CRS94zcx8TzjgCQAaVx9WftTGaEtuHA=;
	b=oA+Po66smbKatwORBrBQXKsTRUR7OIcgbdaoxutqBKRFfXwhAzWnBPxoZd6D1FdmZU
	+h/Ca+CvOcIPBSMwvqf85EsaXFK6j0FwJlh89cQNjeUI5JE7J77Nhd85iEih7k91n7iC
	45kg1ZvLYT+fHH+/WAvjdOuvHHHfXkh9JLfaXwtyIi/n5Jt51yVY1+blFomRObApeC7p
	Ti9+8/uwAhSToSPWPfqkoXimyHJOeRjdWyOMmrcsjHYbegZ1RuqT/GOE2IV248AoCqOz
	tPSUPKqaq+cggJeu03nbLOF0D/7R04C5EdQhhp4kPY/Rim2ro+pbpXpmfyGfc+zO9vVT
	dU3w==
X-Gm-Message-State: AGRZ1gKIEY8UlTUYjfYzmP3y2pdUb0cCE+wYnoCXq/39oKgZSgrL+WpB
	esxSUmr1IIjsp/5AO3NW0Z/SMkE5ufyp5a/CL+UiyLPlpFc=
X-Received: by 2002:a9d:2cd3:: with SMTP id e19mr5435597otd.363.1541787341321; 
	Fri, 09 Nov 2018 10:15:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Fri, 9 Nov 2018 10:15:20 -0800 (PST)
In-Reply-To: <20181109173553.22341-2-peter.maydell@linaro.org>
References: <20181109173553.22341-1-peter.maydell@linaro.org>
	<20181109173553.22341-2-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Nov 2018 18:15:20 +0000
Message-ID: <CAFEAcA8pbw-D_9P3RYGMZbFXBFD6PzFNgrVLEb_RYQ11YuFdOQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Hyp mode R14 is shared with
 User and System
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Adam Lackorzynski <adam.lackorzynski@kernkonzept.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D0gXb+n7VUbK

On 9 November 2018 at 17:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> Hyp mode is an exception to the general rule that each AArch32
> mode has its own r13, r14 and SPSR -- it has a banked r13 and
> SPSR but shares its r14 with User and System mode. We were
> incorrectly implementing it as banked, which meant that on
> entry to Hyp mode r14 was 0 rather than the USR/SYS r14.
>
> We provide a new function r14_bank_number() which is like
> the existing bank_number() but provides the index into
> env->banked_r14[]; bank_number() provides the index to use
> for env->banked_r13[] and env->banked_cpsr[].
>
> All the points in the code that were using bank_number()
> to index into env->banked_r14[] are updated for consintency:
>  * switch_mode() -- this is the only place where we fix
>    an actual bug
>  * aarch64_sync_32_to_64() and aarch64_sync_64_to_32():
>    no behavioural change as we already special-cased Hyp R14
>  * kvm32.c: no behavioural change since the guest can't ever
>    be in Hyp mode, but conceptually the right thing to do
>  * msr_banked()/mrs_banked(): we can never get to the case
>    that accesses banked_r14[] with tgtmode == ARM_CPU_MODE_HYP,
>    so no behavioural change
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/internals.h | 16 ++++++++++++++++
>  target/arm/helper.c    | 29 +++++++++++++++--------------
>  target/arm/kvm32.c     |  4 ++--
>  target/arm/op_helper.c |  2 +-
>  4 files changed, 34 insertions(+), 17 deletions(-)

Rats, this bit accidentally didn't make it into this patch:

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 2b62c53f5b5..eb6fb82fb81 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -725,7 +725,7 @@ uint32_t HELPER(mrs_banked)(CPUARMState *env,
uint32_t tgtmode, uint32_t regno)
     case 13:
         return env->banked_r13[bank_number(tgtmode)];
     case 14:
-        return env->banked_r14[bank_number(tgtmode)];
+        return env->banked_r14[r14_bank_number(tgtmode)];
     case 8 ... 12:
         switch (tgtmode) {
         case ARM_CPU_MODE_USR:


(it's one of the "no behavioural change" bits).

thanks
-- PMM
