Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3446810ejn;
        Mon, 24 Oct 2022 09:54:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5FJXIwacPYrgcvE24N8qQsZ+W2uguYZyEq0xwDxpjSvnsiXIhnzqPcp4ODO4FVTlAbYtEY
X-Received: by 2002:ac8:5d91:0:b0:39c:a12b:e38d with SMTP id d17-20020ac85d91000000b0039ca12be38dmr27937004qtx.250.1666630465233;
        Mon, 24 Oct 2022 09:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666630465; cv=none;
        d=google.com; s=arc-20160816;
        b=Afnt/hAGisujezguWW2tcJdogpVnd5HFNlIrcgf/o2PvEX6mTloTTr5ODyqK3eKFdw
         eobR7CkxqV1twJZLMDaxFhvEKApis7555n6YB8KCv9MFZZWB75L1Blgq+QuNGVy9KnVN
         imR0PSlteV1MXbBGKMtWeF9VO+CpHrw77yA6/0slZtvy5DPgDMHyv5FuC9fAMcu+DKK+
         zX/oS43GzNEAToHFZF9ztQ6KEGieMHHqObJkS2ZYg7hyIFfNh3T0C6Yb8M/1LmalIV2j
         tRDDTpEkAitXayeP/jeuDn1aN+koKtzvpkf5NvMF3zj4zrUBE2fV6tPDb2OfD0AzYbuD
         JfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MrCwu+eqwdsVgBk9dvsRU7MwgqUcA3AMQc+6ZiWhQq0=;
        b=Ao9CU9HNSEMzA4DW+w2W6tFHy8FipZ6uyim25bEn+vOEtqxPwflB7U+o/BcHOzJ8SV
         W6QpjfU3Z7tlwkyRsEzOTx/beCkJMEdTQNyui7bskEDmaWIDah0xMyA9/9lO/6RXABpt
         3dxS1nN6YhFpiOjWDljFhtGQUrmXJlrWJlU0Gg3xDVfU8I+iQbb7Qhr1UQM/3ZiKNwTm
         nMiygTzVsFXQ4IICiprnF6VInJriS9iHFDmUmXTXJI0bVQg/LKR9QOFbRdgoEcoWKDSl
         Eq/RYIc1ufpN5zPuFil/AqP9aIXPntvRfmNhZ4aw0p1usLQe8o4g1ICLMe097REif7B0
         LyFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/aWNRtq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5-20020a05620a284500b006bac23443b0si285957qkp.443.2022.10.24.09.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 09:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/aWNRtq";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1on0Sb-0007dz-It; Mon, 24 Oct 2022 12:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1on0SY-0007dP-58
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 12:37:54 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1on0SW-00044H-GP
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 12:37:53 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so1920361pjk.2
 for <qemu-arm@nongnu.org>; Mon, 24 Oct 2022 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MrCwu+eqwdsVgBk9dvsRU7MwgqUcA3AMQc+6ZiWhQq0=;
 b=I/aWNRtq/WSBhgTOQ7M0sfV3tSf5sv/M8KaILJV+MLPb0lmwqQv8yrkn+uNyAqCCz6
 Ver+XS9/ViyvWC6ALmLPokqc7NeE4JS56IVHjpqeZ/UHqqalazHlXbdN45DM/v69t2Gu
 AZ934Xx7r3SP/zZELlLptde/oetupDZ6WVr8QxvtbobMB0EQpgPvp4kVJOOWp62yDNtg
 rHbL1s9ulciGnYayOWg9un2w/RvjmUXlYzK3U//YDR/1mNFGlpoyS34nkP+27ZP5dSV6
 TBz1aH+2k/yZ1O6Eq4N1APrK86JuT5ChfY436KFUFrRhbPXnPvO0jNH0wbsw5D3VAive
 APDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MrCwu+eqwdsVgBk9dvsRU7MwgqUcA3AMQc+6ZiWhQq0=;
 b=mXRNjQb/nDx3lf161YvwWv2GGF8AqOGTLxnQLQI40lZ/HTSvj73uKUcR3EkVzWUbJu
 /ntYfC6s+w/lzLZiglLgFVB4EEPap/ilkQmE7fPPEmEJgteHXI7DVMRHFqbkc9AXKK/H
 0d8FGVhM3dmdRpscZTx2Vm1b4yGh+ZlZLN1YJEv2QQ4BbDy/qQRLMrcAspuFfnUjg4ZR
 H7XBOqiPSyTSKHsxovBXv/R7a9ON7Tn2LOJYh1/HSQOpb0Ti0WvzPc5Tz0KKu3306wyt
 4bUePTrijUXgLJ3HuGlvjp6PLXG3yqxtiuFPcT9Y+hK8yTw5DWGsHQPrE5ydU92DvvXZ
 GmPA==
X-Gm-Message-State: ACrzQf3EKmx9bXyQAnKdUxdiP22Qo6lwaCOWpMET0SmSYvyiisjnA9AR
 deqlnSSz1wtAusVNBbKWVEfPoYLa3SvVpf0R0D7Wr9kI3pXkaQ==
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr38646037pjb.215.1666629470535; Mon, 24
 Oct 2022 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221017092432.546881-1-ake@igel.co.jp>
In-Reply-To: <20221017092432.546881-1-ake@igel.co.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 17:37:38 +0100
Message-ID: <CAFEAcA9sQ-QJCw_P3OAp5O9o7pHcpz1kwmSi+=Dg4qqMfYt1iQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honor HCR_E2H and HCR_TGE in
 arm_excp_unmasked()
To: Ake Koomsin <ake@igel.co.jp>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PZVZwjCLehrx

On Mon, 17 Oct 2022 at 10:29, Ake Koomsin <ake@igel.co.jp> wrote:
>
> An exception targeting EL2 from lower EL is actually maskable when
> HCR_E2H and HCR_TGE are both set. This applies to both secure and
> non-secure Security state.
>
> Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> ---
>  target/arm/cpu.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 94ca6f163f..86d3377d3f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -561,14 +561,24 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>      if ((target_el > cur_el) && (target_el != 1)) {
>          /* Exceptions targeting a higher EL may not be maskable */
>          if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> -            /*
> -             * 64-bit masking rules are simple: exceptions to EL3
> -             * can't be masked, and exceptions to EL2 can only be
> -             * masked from Secure state. The HCR and SCR settings
> -             * don't affect the masking logic, only the interrupt routing.
> -             */
> -            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
> +            switch (target_el) {
> +            case 2:
> +                /*
> +                 * According to ARM DDI 0487H.a, an interrupt can be masked
> +                 * when HCR_E2H and HCR_TGE are both set regardless of the
> +                 * current Security state. Note that We need to revisit this
> +                 * part again once we need to support NMI.
> +                 */
> +                if ((hcr_el2 & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
> +                        unmasked = true;
> +                }
> +                break;
> +            case 3:
> +                /* Interrupt cannot be masked when the target EL is 3 */
>                  unmasked = true;
> +                break;
> +            default:
> +                g_assert_not_reached();

Hi; thanks for this patch. You're correct that there is a bug here, but
it took me a while to work out why it's OK to remove the "don't allow
masking if we're in Secure EL0/EL1 and the exception is going to NS EL2"
check. The answer to that turns out to be "the target_el could never be
2 anyway in that case": because arm_phys_excp_target_el() uses
arm_hcr_el2_eff(),
if we're Secure and SEL2 isn't enabled then the effective HCR_EL2 bits
will all be zero, which forces us into the "targets EL1" or "targets EL3"
cases.

So I think that's worth mentioning in the commit message:

"We can remove the conditions that try to suppress masking of
interrupts when we are Secure and the exception targets EL2 and
Secure EL2 is disabled, because in that case arm_phys_excp_target_el()
will never return 2 as the target EL. The 'not if secure' check
in this function was originally written before arm_hcr_el2_eff(), and
back then the target EL could be 2 even if we were in Secure EL0/EL1;
it is no longer needed."

I'll apply this to target-arm.next, with the commit message
updated to include that.

thanks
-- PMM
