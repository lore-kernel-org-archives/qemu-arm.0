Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp614999ocb;
        Thu, 6 Oct 2022 09:45:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4COg39oGLmGw2pUs4RoTQtEYWQFcVZqqbKmyxUrPOvhdupCLr46jSuUro8FsBz4gu3mCPj
X-Received: by 2002:a37:b03:0:b0:6e3:a748:7570 with SMTP id 3-20020a370b03000000b006e3a7487570mr767742qkl.735.1665074718871;
        Thu, 06 Oct 2022 09:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665074718; cv=none;
        d=google.com; s=arc-20160816;
        b=B8Ni6adPfn27b5IuyMp/evthT6GBow8MNiNM7prWlvVzXxbOgt+823ScsbgCTwbiMS
         Egi/UxrBi7cEACOKg+HFomzYcbt7AoFw/nYU1ENtByPgTqFuB01t2j+eNn4HMJsgR7pr
         KeQi0Vm7hCBsExr7F0ehzpfudX8FLD0OqZu8yc88kscGEKSDF2FisCECIN0vAazUAIZL
         KmOcG1M1TKWwFtdpK6AtyxI2/PjETW7AnEpZiuNdsr/xERfZpfljccYykz33PE4YvpSY
         SzSpne9qaZnwCD7z00myS+C/BuJZ0lp15rjgShX4JWSv24M53nT+silZedoSVJ3sURrt
         DgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Xplrc+NNw3RJF2krTn+7x1TEWwnzUFNRXxP1cCUE8oI=;
        b=M/n0V7ZnttXpWfLmBAlk9H0ppjk4gfJrrUUfH/bMnJDuBMoChOTTddHCtvFIeYJvSn
         90yhVQMMDQhnitCCRaRYpdZLsnGqB9RD2jtek26ZjnjgQJ2aSsaG0HcOeN6y8BIusLSy
         D+qGWprbn2fSaIHGuAae7mB4JVVP1n7KE7mf2Eu4QcPmiVk4ciO0dhTZkOjhT8nxch9f
         quI684QZoMkeKjzBdKLuttWDEgRL/vSsjiMXAKc94CZLn49k1hvYpC58a624hxTsC2b3
         yMQoSdFyo0xDGXuX8N751ZB80MlhlTzoo9TmVj0k55qTwpm35jluWQiSL0tDQIxHgKnt
         K9Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qg/JgLjX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020a0562141d0600b004b1ab83dd14si4484902qvd.497.2022.10.06.09.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 09:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qg/JgLjX";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogTzq-0006UX-DH
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 12:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogT56-00051J-QS
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:46:42 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:43721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogT55-00028t-6p
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 11:46:40 -0400
Received: by mail-pl1-x633.google.com with SMTP id z20so2051369plb.10
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xplrc+NNw3RJF2krTn+7x1TEWwnzUFNRXxP1cCUE8oI=;
 b=qg/JgLjX84SRqvvPVxUzLgvs5Jqk+xG0HQgmASGBVpJ/XrpidWwJh4LX3lGUG7Wysz
 zShXFh5oTW2TM38oLuUQCzQrtBjpupUORuuEg/8jt4m6LodLc789593Mgb4MRH8ydHv5
 KTLSd/FH/+nQEOn7Eo2mQS9hKOLrj2ahBM/PkdRCHTGMHnlWe6/+CdHdJv0HOd4iJplC
 dyTN5d1W96Nts02ujZw8CppIvuDonoHE3+mGsZMMqmn7Ng7007pUPdu0eJAC65a/2Rvy
 sMXH0H3D+cslacjRFzZjzhKm0lkyfM/SItu5KVtG+BGiPBTXeBaGVI6ZNS6pNxyMKh6d
 30OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xplrc+NNw3RJF2krTn+7x1TEWwnzUFNRXxP1cCUE8oI=;
 b=XrMJ50logKyYHduZPU+EbH8Q8CTSKyQbJVpRT3atcXGb+ePoRtD2LX95hk7lADWeCE
 XDFn9NVCzfPLe9PNpG1DmKPlURYMBtnHwjt/SbypgUGz0j16jfMta0AtaEsa3HwlHmqg
 TllZyaAZZFajpvFiUcgihZEog0gAOAUvx5Dcd/2yR5L25Cnh3C0WNqoMcdFdOOUrxR+F
 jblHs/ax/DWji4EYoQwCSm9OcR1E9gGreh80vVVc3faaPcwiLyU7HZYuzcV5BY7Tq2E8
 TpVuz3tKo2vujBHFkIR+zWq2zXnhaHrZ+2/HV6i8BTnAN7rXJuhPIzqVrdcR1X5Qa7aQ
 LHAg==
X-Gm-Message-State: ACrzQf1SpxFdbtFBQtKt8rM1v5UfndyLAzsftF4Ps0jJpp4oEWPXcz5N
 WOWPJ0lAtlDAkh6zcreut4MBAJEKkO35xl51MDHxTA==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr485431pll.19.1665071197542; Thu, 06 Oct
 2022 08:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-26-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 16:46:25 +0100
Message-ID: <CAFEAcA_iLb=T3Gwy6WSRzrW-LFck7rmjv=Y2yNFOwOGjP7assg@mail.gmail.com>
Subject: Re: [PATCH v3 25/42] target/arm: Move ARMMMUIdx_Stage2 to a real tlb
 mmu_idx
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AUsNfh40Ruhd

On Sat, 1 Oct 2022 at 17:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had been marking this ARM_MMU_IDX_NOTLB, move it to a real tlb.
> Flush the tlb when invalidating stage 1+2 translations.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -2977,15 +2987,6 @@ typedef enum ARMMMUIdx {
>      ARMMMUIdx_Stage1_E0 = 0 | ARM_MMU_IDX_NOTLB,
>      ARMMMUIdx_Stage1_E1 = 1 | ARM_MMU_IDX_NOTLB,
>      ARMMMUIdx_Stage1_E1_PAN = 2 | ARM_MMU_IDX_NOTLB,
> -    /*
> -     * Not allocated a TLB: used only for second stage of an S12 page
> -     * table walk, or for descriptor loads during first stage of an S1
> -     * page table walk. Note that if we ever want to have a TLB for this
> -     * then various TLB flush insns which currently are no-ops or flush
> -     * only stage 1 MMU indexes will need to change to flush stage 2.
> -     */
> -    ARMMMUIdx_Stage2     = 3 | ARM_MMU_IDX_NOTLB,
> -    ARMMMUIdx_Stage2_S   = 4 | ARM_MMU_IDX_NOTLB,
>
>      /*
>       * M-profile.
> @@ -3016,6 +3017,8 @@ typedef enum ARMMMUIdxBit {
>      TO_CORE_BIT(E20_2),
>      TO_CORE_BIT(E20_2_PAN),
>      TO_CORE_BIT(E3),
> +    TO_CORE_BIT(Stage2),
> +    TO_CORE_BIT(Stage2_S),
>
>      TO_CORE_BIT(MUser),
>      TO_CORE_BIT(MPriv),
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6fe85c6642..19a03eb200 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4319,7 +4319,9 @@ static int alle1_tlbmask(CPUARMState *env)
>       */
>      return (ARMMMUIdxBit_E10_1 |
>              ARMMMUIdxBit_E10_1_PAN |
> -            ARMMMUIdxBit_E10_0);
> +            ARMMMUIdxBit_E10_0 |
> +            ARMMMUIdxBit_Stage2 |
> +            ARMMMUIdxBit_Stage2_S);
>  }

This isn't sufficient. As the comment notes, you also need to change
all the TLBI ops for S2 invalidates which we currently implement as
ARM_CP_NOP so they now flush the stage 2 TLB. I think that searching
helper.c for 'IPAS2' probably finds you all of them.

alle1_tlbmask() is also only used for the aarch64 TLBI ops -- the
aarch32 ones are tlbiall_nsnh_write() and tlbiall_nsnh_is_write(),
I think, and those also now need to flush stage 2.

VMID writes also now need to flush the stage 2 TLB as well as
the combined s1&2 TLB -- see vttbr_write().

Side note, looks like we didn't update vttbr_write() to know about
the EL2&0 MMU indexes ?

thanks
-- PMM
