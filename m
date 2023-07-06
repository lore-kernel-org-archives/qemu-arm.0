Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4426272ejy;
        Thu, 6 Jul 2023 09:57:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHGdrhoJ9dyzq6TE1DNi/Nx32pwivW9PHeffLrHPlWoi17Lu/hrDGiFDrr6mq0Qsmp1T00M
X-Received: by 2002:a05:620a:4092:b0:765:591d:9d22 with SMTP id f18-20020a05620a409200b00765591d9d22mr7535198qko.0.1688662635590;
        Thu, 06 Jul 2023 09:57:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688662635; cv=none;
        d=google.com; s=arc-20160816;
        b=YgOjRLPQH+XPGiVKyH4XKc/08UVzfJbr56f0AZVaFCRMI2nrxvXoeo/D/gSTraxp1F
         aHmuRC5rWQOtSe5qAaLAe/A+mFK6sYDkQYN7Js6BM3w2ybuC/agAUQ6ZaSRX46anW3+o
         b8Jp9KG277nYOI/CGs3jSzO+8KJnLChMcL+LDYplEl4uuciBN4VAtM3CuEVStkB7wKDX
         9NSR30gIvRnACmUphXkgwdpM0KhlCpG3Lpo4SoGkVtIJbR2Uge+SteXLZtiKCRjdugeS
         is6OMB10PcV4aiizhXcvEdp0iudb9oUXAEsI9uCsxBZviYDsV+/nFoJN5T62KENsvEIp
         UgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=R5I83YucBrBX2K4hN2bLCEo1zQVuHT8H1qc+tkINFk0=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=YwakCHJ6TVPVjvv8pw9XF7/9rwSCYMM652iojbzwyvi+mA4zwSeyYbXWn9oEP2DNRi
         IYQpZW0S49jtzd4j88+1piEhqAiND4WaTp/Br5HQr6fEDFhHsWKrcPJSDTJdyQnN6tOG
         OK/Ky8aSdYik0pHpUoUUpbLK6eNMJke9CcS9eyIILSfovInS3BB99UazpDgemwAFtRXX
         qaSghdS1JPtmnsg6tKRmtV5Qo3R2yTur1UBOX8Xn7kdFex82rbnPuKWX3EX45IBlOV0k
         FZ0Y1R+98OkEB0o0SYoRr+EakcClvWNJFKYEv8LNPwvpg/elPYZjIXFurEmQIRij0/Ww
         pJQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFCALSbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9-20020ae9f109000000b00767185b2dfasi1281410qkg.622.2023.07.06.09.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 09:57:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PFCALSbP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHSHr-0004fA-6s; Thu, 06 Jul 2023 12:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHSHq-0004f2-MM
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:56:58 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHSHo-0006lK-FD
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:56:58 -0400
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6a6f224a1so14229711fa.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 09:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688662615; x=1691254615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R5I83YucBrBX2K4hN2bLCEo1zQVuHT8H1qc+tkINFk0=;
 b=PFCALSbPCIMVOnZTaulqhz+eORR2Gco7umZSDkPV6aQhKOoIwRYheyb9aPIzhhJ3+6
 bWUM8StysJlJhKlJASHUzp1Zy4Nuqb36WSwX0/6lLPXVb7hyV83zFaoPCaHxmRNVAvHw
 9QmJRaoyYw2FA7RdIJZvqNGwAIzyT3hegU3RfxrpPJZT+OvGiDLXo+uBHNyzHlG+L1Ja
 WPMHoizwoeBQ1s/XD452QsbeeJlg+XRJd+YcDB9iHos+yaZSQxorvTLWvSql1DkqmGSZ
 RYfuGdwHcswgAcNXiwP2HLQ4Y8h66CqlgvuGfeQbdvTxSFkzh/0o98Al76IaIcz70S9L
 RbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688662615; x=1691254615;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R5I83YucBrBX2K4hN2bLCEo1zQVuHT8H1qc+tkINFk0=;
 b=QVjeUMUcj03I1P496K5cFH7tQJeCQbZQkSknt7W0xImHWF8lqbI/shw9n2csCE94cm
 dV3byEWhFVyiurYXFZaBb2w+l7UZc2IvZDgoqP+U1dHMRsvfvfmHUq0nsgANwu+DNVDw
 19l5DecG03ZnPKXPAYZEYB8fDiGW3fqBjTT9jT3GVlmMwMaGe6nXMU4tqoRKeJmXuUdv
 vuK9+0qL9gDkdQCmHo1iYmBgZjpRpx9JbaDgcti4HINT68XI9qHsKM+LjkE0CMMFWjot
 MMPoiJ29tc7QiMiARCfYlYhGmr+RJ0CELexRSMvrVTvGb5b4T0Ecw+nAkGa3bC/bSHh4
 pE9Q==
X-Gm-Message-State: ABy/qLZlwOiNT7JGYhk/Z9XL8yTdurMNkkJaY+v5zrgStuHakOuhSpfM
 UEPq5ta5eMLD3McVKefiIfZfe/egrzJswQMNn1tuXQ==
X-Received: by 2002:a2e:a0d7:0:b0:2b6:fe3c:c3af with SMTP id
 f23-20020a2ea0d7000000b002b6fe3cc3afmr518213ljm.27.1688662614728; Thu, 06 Jul
 2023 09:56:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230706140850.3007762-2-jean-philippe@linaro.org>
 <CAFEAcA8h-VXZkD0SBrjOYg-FFVk5AW0RrAs4AL4w6RXWZzWUsQ@mail.gmail.com>
 <20230706152543.GB2570588@myrica>
 <CAFEAcA8crpS3SBoCsmxaj4isMcGYrExOTDU=m5u8-gOkrrjERA@mail.gmail.com>
 <20230706161016.GC2570588@myrica>
 <CAFEAcA9VsCfa4_PY+HLkER02jzwEEhX20rVCtVXTp4SgDLeHSQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9VsCfa4_PY+HLkER02jzwEEhX20rVCtVXTp4SgDLeHSQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jul 2023 17:56:43 +0100
Message-ID: <CAFEAcA-XOO-yPdY1x77E9K7J0J5=+p=1Jfij-Qj0U=ePSCaEOg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix ptw parameters in S1_ptw_translate() for
 debug contexts
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 29CHnvPbLJ/J

On Thu, 6 Jul 2023 at 17:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 6 Jul 2023 at 17:10, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > On Thu, Jul 06, 2023 at 04:42:02PM +0100, Peter Maydell wrote:
> > > > > Do you have a repro case for this bug? Did it work
> > > > > before commit fe4a5472ccd6 ?
> > > >
> > > > Yes I bisected to fe4a5472ccd6 by trying to run TF-A, following
> > > > instructions here:
> > > > https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/qemu.rst
> > > >
> > > > Building TF-A (HEAD 8e31faa05):
> > > > make -j CROSS_COMPILE=aarch64-linux-gnu- BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd PLAT=qemu DEBUG=1 LOG_LEVEL=40 all fip
> > > >
> > > > Installing it to QEMU runtime dir:
> > > > ln -sf tf-a/build/qemu/debug/bl1.bin build/qemu-cca/run/
> > > > ln -sf tf-a/build/qemu/debug/bl2.bin build/qemu-cca/run/
> > > > ln -sf tf-a/build/qemu/debug/bl31.bin build/qemu-cca/run/
> > > > ln -sf edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd build/qemu-cca/run/bl33.bin
> > >
> > > Could you put the necessary binary blobs up somewhere, to save
> > > me trying to rebuild TF-A ?
> >
> > Uploaded to:
> > https://jpbrucker.net/tmp/2023-07-06-repro-qemu-tfa.tar.gz
>
> Thanks, I've got that and can repro the failure. I probably won't
> be able to get a patch sorted before Monday, I'm afraid.

Tentative patch, which works on the test case:

--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -449,7 +449,7 @@ static bool S2_attrs_are_device(uint64_t hcr, uint8_t attrs)
 static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
                              hwaddr addr, ARMMMUFaultInfo *fi)
 {
-    ARMSecuritySpace space = ptw->in_space;
+    ARMSecuritySpace s2_space;
     bool is_secure = ptw->in_secure;
     ARMMMUIdx mmu_idx = ptw->in_mmu_idx;
     ARMMMUIdx s2_mmu_idx = ptw->in_ptw_idx;
@@ -457,6 +457,9 @@ static bool S1_ptw_translate(CPUARMState *env,
S1Translate *ptw,

     ptw->out_virt = addr;

+    s2_space = regime_is_stage2(s2_mmu_idx) ?
+        ptw->in_space : arm_phys_to_space(s2_mmu_idx);
+
     if (unlikely(ptw->in_debug)) {
         /*
          * From gdbstub, do not use softmmu so that we don't modify the
@@ -465,10 +468,8 @@ static bool S1_ptw_translate(CPUARMState *env,
S1Translate *ptw,
         S1Translate s2ptw = {
             .in_mmu_idx = s2_mmu_idx,
             .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
-            .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
-            .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
-                         : space == ARMSS_Realm ? ARMSS_Realm
-                         : ARMSS_NonSecure),
+            .in_secure = arm_space_is_secure(s2_space),
+            .in_space = s2_space,
             .in_debug = true,
         };
         GetPhysAddrResult s2 = { };

But I need to check whether just using the ptw->in_space
as the stage 2 walk space is correct, which will have to
wait til Monday.

-- PMM
