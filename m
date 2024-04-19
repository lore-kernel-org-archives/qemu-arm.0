Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2568964ejd;
        Fri, 19 Apr 2024 10:50:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsJHvc5d3UQeTALTMVVnT+UEhKai0opl4HlCT1eNuLi/lE+PESzXjzZaY6tThk3RXGJ8Wgv21Iqk3U6Aw9UXjlOXloyVJ8
X-Google-Smtp-Source: AGHT+IEnVxfZ8XQXYAcNIswGtEOf0Lqu7cgKLIxcY8d0LF8D4BswcKDf5bTdkXZfkXI5QYHGmwTK
X-Received: by 2002:a05:6808:6282:b0:3c7:203:789 with SMTP id du2-20020a056808628200b003c702030789mr2703817oib.37.1713549033404;
        Fri, 19 Apr 2024 10:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713549033; cv=none;
        d=google.com; s=arc-20160816;
        b=q+7Mv3Ngk6SWGsCvJv3Qu9QinrlQECJ32lDYLrku8NuiDzfh2Lz36d0E8WI3KIfSWu
         dPHUfu6bGYl0a7KGEewaXeZW+a6DMLS9elUP4zGye8RmF9erMhA2dtcuv3L45Jo2pscF
         iFHFYYhu1YRPU3k531W19/Qfe5cofh4xnztDMAlBGeFbwJ+wmw9hICh8slLRc8Buj5pi
         4OnGrFhXoN8gWyX0OE5RQ4NRLGoO9Efgg8BqjW0ZkNusO+kFgvEFlTmBav+krPXRUGR9
         oxsO1N0r4qKrC/QEpUEmWVpC3jTVjwwe75NzHivmn9n/1U5qHD4Vpou+9ShXxUS/jDBi
         HM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :from:subject:message-id:mime-version:date:dkim-signature;
        bh=WvFrw9B/LRIKSTXY6uL8wpuIl3i1cDCZOl5nntBZ/kE=;
        fh=XKXuzXNZyR/MAuIFEqce9fnewJQ4VhlQPeCpYjjDpaA=;
        b=tXQKJyi2BtOIrxA25ZNIUK+IkpnGDeOAQopG0yN6Y4GY/fA6trb7xepEAL6I7s40PU
         fju11UsU+oUPJY+J1qZGcGkBSE5Pr1GuhqmezUY9QqlzL87O83F+sgdGfwUFzuhC1bNU
         QCv+QMywlbd1v//aiVKc6N59ahYenBmOh1QJP3NafhC0wZrWFHARwUQr8w494mFYki/C
         32nnYZ/r8TBl/mpGIYt94iZUL6TnfPPMVheMITojdnKxg/U/HaCEVoAW3dItT+R2ZCc8
         T3wze51IA3Vsup9THQljbE2/6bvpvQ5FKBWgkZ4lUDlRe35/0eKkxPU642c3rkaNbcsG
         pUOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jTZITepO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a05620a404400b0078a3a95c3dbsi5100406qko.106.2024.04.19.10.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Apr 2024 10:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jTZITepO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rxsNU-0007ie-GN; Fri, 19 Apr 2024 13:50:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32K4iZggKCPcZqca+fhsfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--ardb.bounces.google.com>)
 id 1rxsNS-0007iU-34
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 13:50:22 -0400
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32K4iZggKCPcZqca+fhsfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--ardb.bounces.google.com>)
 id 1rxsNO-0006Aw-65
 for qemu-arm@nongnu.org; Fri, 19 Apr 2024 13:50:20 -0400
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-61890f3180aso47171887b3.2
 for <qemu-arm@nongnu.org>; Fri, 19 Apr 2024 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1713549016; x=1714153816; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WvFrw9B/LRIKSTXY6uL8wpuIl3i1cDCZOl5nntBZ/kE=;
 b=jTZITepOA0A9o4kg9rPNPOnA5B3Jk2TARvbT9KQTMZepZhiZ7mHsxBoP7JPlmEq4aF
 ui6c/9IbIZmt2wfuvkn4ps1NaIQ84hfWbrGFzIQFJVuvrFnDPxVF+cDr95XkVtCVUSy4
 kW96j83fB2ZvE2ywxCXuOylZhpZ0FlSfpMFkEzCd75xHSgfacH/keWv8NvA5VXYlAyyV
 czgWWGHOhDgqfsmEtWLu92v4yosqJaQhBXuoN/QkwDzOegC/Ftf3pLbODFXfQu87iXO2
 9fMIQF9/bODV7AmYf9RWVhhydtNjgh3FyAiPk/N2rpy93M0P/RdxTLAdlMalvhz9Ct7Y
 gNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713549016; x=1714153816;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvFrw9B/LRIKSTXY6uL8wpuIl3i1cDCZOl5nntBZ/kE=;
 b=ZQJuuhB8+0ENtcr/LTXeatifi85B+mnU47v+4Zem80Jeg4Fln+l2vo8d4lS3SIgvq5
 ZPTBDZITVJFi8Svs6E5vijW6NlGnSbskpWv29LUY0w2uOWuWoA3SKD2KRvjIJfQHBm7x
 V0U7bgP+8/ExXPBcXiKbr2yymISa00JaTmpvIZ76HCa+hKAzpk5HFYiTy/T+3IAxx0FD
 rBxexI6YHOZcSVMKS5t65ghvpGOR6bFrriWJEZ2SA2/V+CwcDsOO72U5HRzS5HIR17u2
 5ehV2I9p5xBvDQ08wvhxOwpjVPwrbfECPiwV/MJyHUGGO6y/Hy+J4pOjPJPfhuRPrGik
 casA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWce3em9e4isIYGPvO3Sqw02tU3HGM3rP/SzGPitd0wvOaLZ7RJEq2CMFm9ENyDINakZuXFKvanSQOGJfU/wx+WwI4
X-Gm-Message-State: AOJu0YzgvFcasmJPDVbiJozhtAqAB7PdgLIWFm2MZTpfTXzR1VL0yRDU
 ZVS/O4V6qTyVIfpTTSo5YvPEo5SNh+a/zRoFUAij6fZPn4d2kqc7asNNN6MMAZ0qZYCBrw==
X-Received: from palermo.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:690c:610e:b0:618:9588:e9db with SMTP id
 hi14-20020a05690c610e00b006189588e9dbmr722562ywb.2.1713549016211; Fri, 19 Apr
 2024 10:50:16 -0700 (PDT)
Date: Fri, 19 Apr 2024 19:50:13 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240419175013.3983824-1-ardb+git@google.com>
Subject: [PATCH] ArmVirtPkg/ArmVirtQemu: always build XIP code with strict
 alignment
From: Ard Biesheuvel <ardb+git@google.com>
To: devel@edk2.groups.io
Cc: quic_llindhol@quicinc.com, Ard Biesheuvel <ardb@kernel.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=E9?=" <philmd@linaro.org>,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::114a;
 envelope-from=32K4iZggKCPcZqca+fhsfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--ardb.bounces.google.com;
 helo=mail-yw1-x114a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: E3ZQEFmTpltm

From: Ard Biesheuvel <ardb@kernel.org>

The optimization that enabled entry with MMU and caches enabled at EL1
removed the strict alignment requirement for XIP code (roughly, any code
that might execute with the MMU and caches off, which means SEC and PEI
phase modules but also *all* BASE libraries), on the basis that QEMU can
only run guest payloads at EL2 in TCG emulation, which used to ignore
alignment violations, and execution at EL1 would always occur with the
MMU enabled.

This assumption no longer holds: not only does QEMU now enforce strict
alignment for memory accesses with device semantics, there are also
cases where this code might execute at EL2 under virtualization (i.e.,
under NV2 nested virtualization) where the strict alignment is required
too.

The latter case could be optimized too, by enabling VHE and pretending
execution is occurring at EL1, which would allow the existing logic for
entry with the MMU enabled to be reused. However, this would leave
non-VHE CPUs behind.

So in summary, strict alignment needs to be enforced for any code that
may execute with the MMU off, so drop the override that sets the XIP
flags to the empty string.

Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daud=EF=BF=BD <philmd@linaro.org>
Cc: Idan Horowitz <idan.horowitz@gmail.com>
Cc: qemu-arm@nongnu.org
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 ArmVirtPkg/ArmVirtQemu.dsc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ArmVirtPkg/ArmVirtQemu.dsc b/ArmVirtPkg/ArmVirtQemu.dsc
index e48c75b5e99f..f6f78359552d 100644
--- a/ArmVirtPkg/ArmVirtQemu.dsc
+++ b/ArmVirtPkg/ArmVirtQemu.dsc
@@ -124,8 +124,6 @@ [LibraryClasses.common.UEFI_DRIVER]
 [BuildOptions]

 !if $(CAVIUM_ERRATUM_27456) =3D=3D TRUE

   GCC:*_*_AARCH64_PP_FLAGS =3D -DCAVIUM_ERRATUM_27456

-!else

-  GCC:*_*_AARCH64_CC_XIPFLAGS =3D=3D

 !endif

=20

 !include NetworkPkg/NetworkBuildOptions.dsc.inc

--
2.44.0.769.g3c40516874-goog

