Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp219358njg;
        Tue, 25 Feb 2025 05:41:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVO8N3NC/51Fdo6LtwTc0O6Y5UVObzTeIOUUNKAa1ZXkPDoeaPROzR/G2wdBWnLVJA3Iz0ZmDpuTavf4g==@linaro.org
X-Google-Smtp-Source: AGHT+IGwc+q9KPeQuY9XR7KnSpEbIl1wgRxo52CWqs05/mJNNdnIRhZpmeYpwSZSfk0KFCcQ53ei
X-Received: by 2002:a05:620a:4606:b0:7c0:7d34:6a7b with SMTP id af79cd13be357-7c0ceefe59cmr2432096685a.19.1740490903973;
        Tue, 25 Feb 2025 05:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740490903; cv=none;
        d=google.com; s=arc-20240605;
        b=CjvctnoM16EuCDKKMpJnIyiYz3epRX2BUGbD05/yMp5frZSiNbZgkPerXTNAF8yxRG
         JXCahsNVybywv2n3bJO6le8PWQWmTfWpTg4eeY6FfM6FdVtzaYwOpSrVtCNLkB1rYJlv
         AfTtHCyfh6QXFugSc1fUYWYkpdUqFKggYs/7cW95nTtdesR6dqvgY1pT1B14UMdtQ9uk
         IM7D436W6/lvoLdRSM2fMUrkuDeMiXoErJVZSuY/7GXReh1ed3/evMMU7B+/4kNeVT1k
         uD5lN6JLeO6hQ+wKfNFO2Kk2/7Th3g71v/GAurqRl9SaSZHoc3pB1mTfJj15bEJ0iNlC
         D4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=0Pi79nxp9yRcvsypxDsQKDeReeaW2VFDHpsIWhblTY4=;
        fh=FghvMk1I0xHXFsPOEvGPlQglbpl3NzUVtPeDk9N2VRk=;
        b=cVxBzXhMHw9VlpuHoT9JwSgPHjbRKWBHkuMoZ0w3FLcbNO+98+381IBFNsNgusgKo/
         ZKImRgEcBc82D3uhRgfPodwbBtB+DBOwJjtsXhtz1Tfm3Z7b8H9Naeq2alOcCpA0FrEa
         WoZMnxascYcm2R+Fm0z6tpo93uFTMc1uvbGVE2jc9Igstr8Gu0l8/qdQrkUWoSNwsJWH
         lRIgfnIkDWMn92bu8igHrTfJm3OWubT/D2i+AP0OIXv7rScREhZa/U5mJPaeHLdNXeMo
         HoI/bWDMvsvP+Af7xIwlFmeQId+979/Ww9kHrEn1BiGkQnOxMrOuSbC2LjtkXatVtsc+
         harg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PR1pVtwf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2d8da3si172759085a.401.2025.02.25.05.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 05:41:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PR1pVtwf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmvBp-0001T6-JJ; Tue, 25 Feb 2025 08:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvBl-0001Sc-74
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 08:41:34 -0500
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvBj-0002SL-Lv
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 08:41:32 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6ef9b8b4f13so49017987b3.2
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 05:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740490889; x=1741095689; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0Pi79nxp9yRcvsypxDsQKDeReeaW2VFDHpsIWhblTY4=;
 b=PR1pVtwfQzMczGrAHTMp7/UPqsfR/+MP1RulRFS2cPEc0m4JaC7chBeXGAGb+D+FoS
 AdArjnd7bLdMWAac6QCgFsdmSfBs2MNG+NSuyDQ773GNWUAeXcyU2Ahgot/eji2KR5Du
 6kJu2MovjIw13NfUonFc2ttdpVW0GCCL0zYsl1i9MM1Ab9uqNveQ5FzTlHfJxXPyV7bk
 i9prh45dlEHz2fyb657a55PuD1XZXB7/y+K4XYKkNnFS4EcEMlerXT3F9g2iGrTHphEV
 dkIEqvNlTPKtvdnw8BRrlzjiTPX0ODaNyIQGpqJnyut+am+EVo0RsckeH51ooE7wrdXl
 vvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740490889; x=1741095689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Pi79nxp9yRcvsypxDsQKDeReeaW2VFDHpsIWhblTY4=;
 b=pqNTV9lk3Xr6pXxvrZu4LL00xO3pW97tzdsu00iVOy5O31EURQ92XCHzEtJBW+APBq
 N/aKguseTUHBUcVPj1J8ZEFfuQWFgWJIpKesZwDFV3dB5DDRgIDhmKvmMISdinjMpTZb
 x9zZqNg5CzxctCp1mElu8ZHPGt17CrzfJqpNoiW8a+4qYXLij/4eD0QFB9oBQGep7xvS
 RZdQQuQGweCxfZIf0mqyIYqpmlauGWyGaONos+BUz0rlVdzyIfM4ysDaTrxIMz7arjUi
 mVjL58PhhR3hU8HbeN7GkarSA4Xu76put3de/3Z9P71sYiHW3xl8qiRR/KnBpyp61fIg
 m4QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb94aZ35/j5VqIhz3++zEMDmuf8nzhiy/hZTCEMYmrxwSbSg7qKQqDEiwU/V6s7KiQgTSOrLmwZA==@nongnu.org
X-Gm-Message-State: AOJu0YyOhUhE2NVZTAmsYsn4U8VGBTyl4sbZtc3w/fMMrrRW3XZnZs6I
 Qs+nsY31GvLc7Q5jj9knqGQxi/fvBNitp8H8S+Of4EnpQEJhGSVN0SzUt54JsYIrFs48UCf4Jtf
 USrE6o/kad6BEBChgTIK5WAbpcOkHspDCM//TJw==
X-Gm-Gg: ASbGnctuITxiPC/K9NTs5K+PxV6k2nGbR2jb+YbQFk8l/EBdlCenKC75AYd+KccAteD
 vD9m667CzS3T6kCthYpyiVAeiqblDUicFVmKxxI0yuHtwjKMqWzcVMOJzoidZUrPvXAGBozDxA4
 1vc3qL5jBe
X-Received: by 2002:a05:690c:7306:b0:6f8:cedc:570d with SMTP id
 00721157ae682-6fbcc1ec613mr157750227b3.6.1740490889274; Tue, 25 Feb 2025
 05:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
In-Reply-To: <20250224205053.104959-1-pierrick.bouvier@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 13:41:18 +0000
X-Gm-Features: AWEUYZn2_0AGYG0NJBtP21sNGm1KEn1x-rzEPAgZUmackG5pDveJCDIo4syuXXQ
Message-ID: <CAFEAcA_sz-_6WGCQ=4kC2vtK2RUBXbAtMVzh3iZsp0xmNbgaxQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/npcm_clk: fix buffer-overflow
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, titusr@google.com, hskinnemoen@google.com, 
 wuhaotsh@google.com, qemu-arm@nongnu.org, Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UT+vuCDBSpkG

On Mon, 24 Feb 2025 at 20:51, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Regression introduced by cf76c4
> (hw/misc: Add nr_regs and cold_reset_values to NPCM CLK)
>
> cold_reset_values has a different size, depending on device used
> (NPCM7xx vs NPCM8xx). However, s->regs has a fixed size, which matches
> NPCM8xx. Thus, when initializing a NPCM7xx, we go past cold_reset_values
> ending.


> diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
> index d1f29759d59..0e85974cf96 100644
> --- a/hw/misc/npcm_clk.c
> +++ b/hw/misc/npcm_clk.c
> @@ -964,8 +964,9 @@ static void npcm_clk_enter_reset(Object *obj, ResetType type)
>      NPCMCLKState *s = NPCM_CLK(obj);
>      NPCMCLKClass *c = NPCM_CLK_GET_CLASS(s);
>
> -    g_assert(sizeof(s->regs) >= c->nr_regs * sizeof(uint32_t));
> -    memcpy(s->regs, c->cold_reset_values, sizeof(s->regs));
> +    size_t sizeof_regs = c->nr_regs * sizeof(uint32_t);
> +    g_assert(sizeof(s->regs) >= sizeof_regs);
> +    memcpy(s->regs, c->cold_reset_values, sizeof_regs);
>      s->ref_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>      npcm7xx_clk_update_all_clocks(s);
>      /*

Whoops, thanks for catching this. Applied to target-arm.next, thanks.

(Looking more closely at the cold_reset_values handling
in npcm_gcr.c, that looks not quite right in a different
way; I'll send a reply to that patch email about that.)

-- PMM
