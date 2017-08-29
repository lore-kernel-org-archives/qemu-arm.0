Received: by 10.223.188.70 with SMTP id a6csp6303977wrh;
        Tue, 29 Aug 2017 10:56:50 -0700 (PDT)
X-Received: by 10.200.63.124 with SMTP id w57mr6683234qtk.43.1504029410607;
        Tue, 29 Aug 2017 10:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504029410; cv=none;
        d=google.com; s=arc-20160816;
        b=tIJWWFkCW5cWN2EgB7z5D89oPJ2CvLMRFuvKz+0SdWHruR5s1IPa1AK2OE5t88otGP
         ++gIN2wCH6shD5qq45iMCnOaiBAnd+TXNUHlrCgd07amKO2IVN6C385ezys+NxZZMd3t
         ii25n2fmnERyn4L3uZ3yjHK8jBBGIJasGvrFpcIn8OHoCRqqs16HtxLlBfWE+spLmKdv
         KUKQ/MC6uEGwfoLuRYDZk6YKdUOdrcfxSGgjHJM+V75qwj3gk3qEwb3QoZ7IhwVTOsmk
         YmOcrCxs0WK/LWYY41uAHUatq91tHbmTtp0EiokdLDB0lLHSuG2QhCcXMEmdlWrj5Cge
         BK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6CIsojfZPX1L6DFkMiwLmYU1O1TJMQZKXTbC+QcUu2g=;
        b=mNtdLH8sbNTonQ3m/tXAgwid+jAJXgMH++jdj8Q5smSXqmEfTuni4zgchbzhDSPKsV
         v35EhL3yx46kdQ6G3QTdBl6wWhbcQzEf9/EALJ8zZGD/p3I/SukdFEOMkGs1qWSAT3LA
         F8MW6j2LylXv8znPr5gpcVmLk0i0uL1mu+tAIYaGhn2uvyko622vi4zXD78CEgTBV0PN
         9yLDsrcRWZaCRxNmlyTY44WCM6WKmXr+jBMfDH8b+3eg3CsNq3nIatjQKV4ti1GobmvP
         lVqpQ/LTak4Mezr1BM+FALd6V9GHWCeN67Kv//AOahmjv2BOcID7bK7LMqkHnd5ewIFm
         wuxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hkNIrXNg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si3520412qkd.282.2017.08.29.10.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 10:56:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hkNIrXNg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmkkq-00019q-9x
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 13:56:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1dmkkg-00019a-LK
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 13:56:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bobby.prani@gmail.com>) id 1dmkkf-00007Y-RX
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 13:56:38 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:34012)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bobby.prani@gmail.com>)
	id 1dmkkf-00007C-Lg; Tue, 29 Aug 2017 13:56:37 -0400
Received: by mail-io0-x243.google.com with SMTP id d81so3786426ioj.1;
	Tue, 29 Aug 2017 10:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=6CIsojfZPX1L6DFkMiwLmYU1O1TJMQZKXTbC+QcUu2g=;
	b=hkNIrXNgL1j8PtISbBJv/Kb88xqZlZ3pEp6o01RWV8AmZl6AcCZcZLlpFv2y5+y0Kk
	zkevnVYpYaaEYNgjOJRzFYVWpMOQTU7YyWcZd8ns39EDkaiXk/iScnlJkwVRPGpbwAQX
	7vRelx0cJlahjewDvLO1XoNCXAEDkB8JsKTUUdew1X4k4cUHoJn5OQ4ddyyxPn/ml+FS
	c6OUH2h4tFZQ3Feb4eGdUjs5yuhJtIBOrkekumEY3denbqRc0lm10ReGxLPmRjXQLoAl
	bile3PUyBkaETtLGLo4x/xVpnY5NWouAs2GWgsSI/heUkcF3sQY3FT09TI9oCSh8plUH
	Y+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=6CIsojfZPX1L6DFkMiwLmYU1O1TJMQZKXTbC+QcUu2g=;
	b=S13nm1W3hohvqz6wFsLaMEB2xMq5PtUPmZie8mzIUEFeSoPAy/ux3/smkS/6BE7AbU
	/LeDg0zcvIjhaVivlpfD5oqAjAQEl7Ceg25tg/4T1tE8G+zOP4IZqYWww/CTK/7Vlnie
	891/qIo3OkaTPysxiMBI5hHJpM90KEEYXJJZuzniF1DHSSpdfYuuDs7nZxKKbUtuybZb
	PV3c16Mf2L+j3QL3sn+rZVFK1rMtPdjj6UD0wDIZx35vhoMcG2o6afOVV356cu6KV+nC
	ij1q1KTjImxrSX+pjoFDlBxKwO/ZQbca9g1KcLY6b1RVeM+ispMZ0/4bb0Z71WsErxW6
	7eiA==
X-Gm-Message-State: AHYfb5jnGDyRBB+QZETdXPmS7SRVy32FU+mcc+S8dtIMnR/y3p0Vs7nO
	Hr9BSS6uUWtqwcJwyW31/gX+xnImPA==
X-Received: by 10.107.205.194 with SMTP id d185mr4801617iog.8.1504029396678;
	Tue, 29 Aug 2017 10:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.166.2 with HTTP; Tue, 29 Aug 2017 10:56:06 -0700 (PDT)
In-Reply-To: <20170829173226.7625-1-bobby.prani@gmail.com>
References: <20170829173226.7625-1-bobby.prani@gmail.com>
From: Pranith Kumar <bobby.prani@gmail.com>
Date: Tue, 29 Aug 2017 13:56:06 -0400
Message-ID: <CAJhHMCAEGv6k3WNHGhm=1c9XLJKdApw3JDD3dVJ5TrZ2AQBmiA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM cores" <qemu-arm@nongnu.org>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-arm] [PATCH] arm_gicv3_kvm: Fix compile warning
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IogBuqB+qfus

I should have worded the subject better. The warning is pointing to an
actual bug.

On Tue, Aug 29, 2017 at 1:32 PM, Pranith Kumar <bobby.prani@gmail.com> wrote:
> Fix the following warning:
>
> /home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
>             if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
>                 ^             ~
> /home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: note: add parentheses after the '!' to evaluate the bitwise operator first
>             if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
>                 ^
> /home/pranith/qemu/hw/intc/arm_gicv3_kvm.c:296:17: note: add parentheses around left hand side expression to silence this warning
>             if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
>                 ^
>
> Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
> ---
>  hw/intc/arm_gicv3_kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 6051c77705..481fe5405a 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -293,7 +293,7 @@ static void kvm_arm_gicv3_put(GICv3State *s)
>              kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, true);
>
>              reg64 = c->gicr_pendbaser;
> -            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
> +            if (!(c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS)) {
>                  /* Setting PTZ is advised if LPIs are disabled, to reduce
>                   * GIC initialization time.
>                   */
> --
> 2.11.0
>



-- 
Pranith
