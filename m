Received: by 10.25.159.19 with SMTP id i19csp686280lfe;
        Fri, 12 Feb 2016 00:48:48 -0800 (PST)
X-Received: by 10.55.76.134 with SMTP id z128mr356569qka.90.1455266928246;
        Fri, 12 Feb 2016 00:48:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w198si14710691qkw.58.2016.02.12.00.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 00:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aU9PD-0005FX-Qi
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 03:48:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aU9PB-0005CQ-0P
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 03:48:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aU9P6-0006zK-1X
	for qemu-arm@nongnu.org; Fri, 12 Feb 2016 03:48:44 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aU9P5-0006zC-LJ; Fri, 12 Feb 2016 03:48:39 -0500
Received: by mail-lf0-x241.google.com with SMTP id e36so3814945lfi.0;
	Fri, 12 Feb 2016 00:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ZObKfzna8rY+FBjIYYJ4Jeiv8gAP1Ug0zsfFdhnua08=;
	b=GUT5GTF9CQqRoycW1v4AC2hWDlhRoIMjVBa97Bjsjs/JJQiRhazXhmgI61pLoDwY8y
	+/bkClfPuCg4DvAPO2691kJSwIBgDw13xRWu1Cq1fDRrcSPnxr0BO8D4O329ctaAQx4q
	mAiZzM4ckghFjJsTETgfbWw/8qFprFjUGKJUy23KtNCx1/xrn86DeCXWnM3zMdavrSjN
	TCx5691AnG9gj2tdYz5osqCrCgVB1MArA45U4m/mQhitzXBcwXt4VF+otciqBOtH7Myh
	6T0+7u61S73HDevD/1VZYDaMAeHNWbKDDTYmTGUOtV1exEZsnlHyp1ZvAo+GzI5NxSE8
	OkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ZObKfzna8rY+FBjIYYJ4Jeiv8gAP1Ug0zsfFdhnua08=;
	b=k9eNOHqjmN/vguZGiSeesjYhaKb5TXYk+VTrXL1BEsQLlkJ8rINdAHALXb7lzCagn9
	j+4piysWQJQgHyxsuwfyyKxfr7t0bLj0XtaR6fjbLWqbbAZpVu/R5cQ6gZT+1PA2kZ4J
	uuX1N5iNX0/bML/gD8vX6aodqoVB7MbauzSa2HyWivI5FFZvNWGVKsSwDKEggHYZSTCs
	+Ff1v9ebGWupyPNMlmGLSFZ289kWWzKIn/pw/yJVzM9KGHQ6chuoUCXbjDK3g+GUC8BC
	hd5fDRGmuTDBcnuWaqcQhFtbepbAVBKgWXojzLZqiYQIqLxj6/m6xZbABx/GxC+eoHKL
	9GdA==
X-Gm-Message-State: AG10YOTZw2u509gGG9Tss+2XrnAXszcyEe1GjrAffzzI7r6h85nrDg8TOhSdfFXKbQxVpA==
X-Received: by 10.25.206.135 with SMTP id e129mr171624lfg.46.1455266918762;
	Fri, 12 Feb 2016 00:48:38 -0800 (PST)
Received: from [192.168.0.71] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.googlemail.com with ESMTPSA id
	87sm1795026lft.20.2016.02.12.00.48.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Feb 2016 00:48:36 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455217909-28317-1-git-send-email-peter.maydell@linaro.org>
	<1455217909-28317-2-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56BD9C64.5010000@gmail.com>
Date: Fri, 12 Feb 2016 11:48:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455217909-28317-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 1/4] target-arm: Clean up trap/undef handling
	of SRS
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NMaJAgicsOUw

On 11.02.2016 22:11, Peter Maydell wrote:
> The SRS instruction is:
>  * UNDEFINED in Hyp mode
>  * UNPREDICTABLE in User or System mode
>  * UNPREDICTABLE if the specified mode isn't accessible
>  * trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
>
> Clean up the code to handle all these cases cleanly, including
> picking UNDEF as our choice of UNPREDICTABLE behaviour rather
> blindly trusting the mode field passed in the instruction.
> As part of this, move the check for IS_USER into gen_srs()
> itself rather than having it done by the caller.
>
> The exception is that we don't UNDEF for calls from System
> mode, which need a runtime check. This will be dealt with in
> the following commits.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> ---
>  target-arm/translate.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 61 insertions(+), 5 deletions(-)
>
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index cf3dc33..7bceb05 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7578,8 +7578,67 @@ static void gen_srs(DisasContext *s,
>                      uint32_t mode, uint32_t amode, bool writeback)
>  {
>      int32_t offset;
> -    TCGv_i32 addr = tcg_temp_new_i32();
> -    TCGv_i32 tmp = tcg_const_i32(mode);
> +    TCGv_i32 addr, tmp;
> +    bool undef = false;
> +
> +    /* SRS is:
> +     * - trapped to EL3 if EL3 is AArch64 and we are at Secure EL1
> +     * - UNDEFINED in Hyp mode
> +     * - UNPREDICTABLE in User or System mode
> +     * - UNPREDICTABLE if the specified mode is:
> +     * -- not implemented
> +     * -- not a valid mode number
> +     * -- a mode that's at a higher exception level
> +     * -- Monitor, if we are Non-secure
> +     * For the UNPREDICTABLE cases we choose to UNDEF, except that for
> +     * "current mode is System" we will write a garbage SPSR.
> +     * (This is because we don't have access to our current mode here
> +     * and would have to do a runtime check to UNDEF for System.)
> +     */
> +    if (s->current_el == 1 && !s->ns) {
> +        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(), 3);
> +        return;
> +    }
> +
> +    if (s->current_el == 0 || s->current_el == 2) {
> +        undef = true;
> +    }
> +
> +    switch (mode) {
> +    case ARM_CPU_MODE_USR:
> +    case ARM_CPU_MODE_FIQ:
> +    case ARM_CPU_MODE_IRQ:
> +    case ARM_CPU_MODE_SVC:
> +    case ARM_CPU_MODE_ABT:
> +    case ARM_CPU_MODE_UND:
> +    case ARM_CPU_MODE_SYS:
> +        break;
> +    case ARM_CPU_MODE_HYP:
> +        if (s->current_el == 1 || !arm_dc_feature(s, ARM_FEATURE_EL2)) {
> +            undef = true;
> +        }
> +        break;
> +    case ARM_CPU_MODE_MON:
> +        /* No need to check specifically for "are we non-secure" because
> +         * we've already made EL0 UNDEF and handled the trap for S-EL1;
> +         * so if this isn't EL3 then we must be non-secure.
> +         */
> +        if (s->current_el != 3) {
> +            undef = true;
> +        }
> +        break;
> +    default:
> +        undef = true;
> +    }
> +
> +    if (undef) {
> +        gen_exception_insn(s, 4, EXCP_UDEF, syn_uncategorized(),
> +                           default_exception_el(s));
> +        return;
> +    }
> +
> +    addr = tcg_temp_new_i32();
> +    tmp = tcg_const_i32(mode);
>      gen_helper_get_r13_banked(addr, cpu_env, tmp);
>      tcg_temp_free_i32(tmp);
>      switch (amode) {
> @@ -7739,9 +7798,6 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              }
>          } else if ((insn & 0x0e5fffe0) == 0x084d0500) {
>              /* srs */
> -            if (IS_USER(s)) {
> -                goto illegal_op;
> -            }
>              ARCH(6);
>              gen_srs(s, (insn & 0x1f), (insn >> 23) & 3, insn & (1 << 21));
>              return;

