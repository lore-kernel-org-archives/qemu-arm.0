Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp317195ocg;
        Fri, 7 Oct 2022 02:22:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KamumoLJnNPS2TIoWOp44OdNKMAQjFR+rRCK0pD7K7IAjkezYvWbCT3KuEdxJjaorcgl5
X-Received: by 2002:a05:622a:5d2:b0:396:d2df:5957 with SMTP id d18-20020a05622a05d200b00396d2df5957mr349415qtb.318.1665134533021;
        Fri, 07 Oct 2022 02:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665134533; cv=none;
        d=google.com; s=arc-20160816;
        b=WI4ixtMJRa5r32mFLpwNPwiJ614BANE5WSDSgMi90RX5cxU5LtWmx9qStSShe7mecp
         1rHWIPi/PN4C8sncnHUSvV8fDQleC7yDzOdsPkNmfe1O9oB+YmvSDWmpXV90hlm6mc44
         N/mieGyNqDNULffBewX0/8TAWBRjPdpneoc21YWIjdfpaT9M+SzeYnHY/5TphZjSS7Zu
         c8WLmdTEnR81FFmydNLS7C/dr/RvKLP0VbpaTrDpHBUJcVHVK3Siy79QK6w72A9tt2ht
         SdZXnSTgIC5v18uLzpQQ6rY/jFmG1bKmr0esZqf9qzgKxpbxfGx/Nggc8VclOAtUop4I
         GJlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZArFZNwt8giVPR1Jvf6NB+35PTYnfpXFC0XpvHrkmpk=;
        b=w+x6c4V2wQ397SN3PbER2t/8vXHF6HPNLeC6N3doxeKNpqxfKZlA6DOjNM781Iv3uq
         QBC66EeHp8dHFpigdXdRHUQ42zhZYbM3zErU274S/Zp156DvKurhd/tUREe9syTtBKI/
         4ExHAFNGRoVmVK6ABMRso3UBdQyL5FbBak92eIOaN+5dKbL/wG+TnVhTnkCANzeGWHe4
         7Jj+k66pDK19+8fqS0Uryf2S0rjB6vfXNWR1QP5vMCI013tqZRZz7v/39t/h5K7hbTLn
         fZW454RmP2ux0eEdM4YGbVwS4fnsWCs17GKFNCpEMtC467cCJ84sXK9njVj+xLJBCre+
         MHew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYT7buln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84-20020a370b57000000b006ce1c482c6dsi561705qkl.758.2022.10.07.02.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 02:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYT7buln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogjYa-0005LG-HW
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 05:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjW2-0005Kz-CF
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:19:35 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:35474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjVn-00077j-Gg
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:19:34 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 i7-20020a17090a65c700b0020ad9666a86so6738480pjs.0
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 02:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZArFZNwt8giVPR1Jvf6NB+35PTYnfpXFC0XpvHrkmpk=;
 b=HYT7buln+tGUZZ/POZOSInwK0kRTfht5xhKQIS80ySCy9vk7RRRtXzp6dXE5geQ9C7
 Lh7RfgZ+LwNxcNeQ0urZEpJYNKaIZFZRR2XGyUfEgPpd4pFlXkV1ex+MhW30JkguQQCj
 mH/x0d77r2TTe12kGcdQ0K8vpumkqklPMkjbRLzy88Z+dKtSmc1m9UOlrbdDb0RIZAcW
 ayMVRO/cQ1V8MXT82Ojax1sD37/HhgUKrA+p1nEzyjJwqG2OjuvYQULykrDiXFrXOsBL
 ifX7GycKSU7EYVueRZabng3ZNYMeRXasT/56S+L6PDeCK5s6wPWA4jIwivfI73Yfmz5N
 sqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZArFZNwt8giVPR1Jvf6NB+35PTYnfpXFC0XpvHrkmpk=;
 b=YuVtz8TswTgW5YJTSNGCbWdWjpG2DMtdMVnOXOj+w4g/b254IwN4P3mRWsmPT2V6LK
 vl1Eiy0aaCxgitWbDyq2rLZE0lW8OBUpr+5KM18B9/qPS+dai7y7YdphnMEVU09BmZhJ
 nDXImPSXOQ0iCstD6AJRI3gOwOjxu4pAXNTcyfdCsq8LdjHvtGqu/OpOmpMpk7D8/qGT
 LuUFJrJg8op8wgKGHgh/7U+kjITPK3zHQdQnzExH4tWFOT7f7pXKGau4gYRsGOmzNJxv
 vFtsNgPIu0m8YxomQd2E5Fy0zhUx/j2mX33O3mp/FPqsRJCwX+D/Hf14Ls4pXfIW1rDf
 9GMg==
X-Gm-Message-State: ACrzQf3nNyYpX+BFA9FeCeKGIQntNJFo5jeWF60B2K1vCUf+tShT48r7
 ZsJskfTXcXk/zQ8wUtrfoU/7ZlAP/HxDR3X8fABcaA==
X-Received: by 2002:a17:90b:1d04:b0:20b:cb40:4b3 with SMTP id
 on4-20020a17090b1d0400b0020bcb4004b3mr1119832pjb.215.1665134356748; Fri, 07
 Oct 2022 02:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-31-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:19:05 +0100
Message-ID: <CAFEAcA9QrOyx8V+=5F-UhtVo=LaE_uHRkAmaSx0kqB_MGbO=YQ@mail.gmail.com>
Subject: Re: [PATCH v3 30/42] target/arm: Add ptw_idx argument to
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILVGzJMcFCPq

On Sat, 1 Oct 2022 at 17:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_secure_debug and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
>
> Pass ptw_idx through get_phys_addr_{v5,v6,lpae} and arm_{ldl,ldq}_ptw.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



>  /* Translate a S1 pagetable walk through S2 if needed.  */
> -static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx, hwaddr addr,
> +static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
> +                             ARMMMUIdx s2_mmu_idx, hwaddr addr,
>                               bool *is_secure_ptr, void **hphys, hwaddr *gphys,
>                               bool debug, ARMMMUFaultInfo *fi)
>  {
>      bool is_secure = *is_secure_ptr;
> -    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
> -    bool s2_phys = false;

I don't think this works, because the s2_mmu_idx is not necessarily
the same through the whole of a page table walk. See the comment in
get_phys_addr_lpae():
    /*
     * Secure accesses start with the page table in secure memory and
     * can be downgraded to non-secure at any step. Non-secure accesses
     * remain non-secure. We implement this by just ORing in the NSTable/NS
     * bits at each step.
     */

Currently get_phys_addr_lpae() updates the nstable bit in tableattrs and
passes that to arm_ldq_ptw() for each level of the page tables, which in
turn causes S1_ptw_translate() to select ARMMMUIdx_Stage2_S or ARMMMUIdx_Stage2.

Alternatively, maybe our existing behaviour is a bug -- but then we need
to separate out the bug fix from the refactoring patch.

> @@ -2604,18 +2643,17 @@ static bool get_phys_addr_with_secure_debug(CPUARMState *env,
>      /* Definitely a real MMU, not an MPU */
>
>      if (regime_translation_disabled(env, mmu_idx, is_secure)) {
> -        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
> -                                      is_secure, result, fi);
> +        goto do_disabled;
>      }

I'd prefer to avoid this goto back up into the middle of an unrelated
switch statement.

thanks
-- PMM
