Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp150069ejj;
        Wed, 22 Nov 2023 20:44:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi/V6KRTvt+gAqXDCeFhpa/wX0NrXbn7NVH0pb1uRfjlTQzQawrmhQMMBf+IJ7DtykhEyB
X-Received: by 2002:a05:6214:acd:b0:675:47ad:3be with SMTP id g13-20020a0562140acd00b0067547ad03bemr5892837qvi.45.1700714678296;
        Wed, 22 Nov 2023 20:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714678; cv=none;
        d=google.com; s=arc-20160816;
        b=BWsYIjG+RMwEGuEtwM/JavI9N/3vdtk0UKmX6U4w6wisf9LfUv+DYMjZ/Vo/DjqOO/
         DBDzLLPKr9GIat52BvavO8X/E5iAlDITls6VIv+rCnAs/B5mIZ2lZmuVOn3mjXErq/Wz
         2mzZArCWzB0HpDCURtgcS9eanLcb2aLSwkSi0OHB2oF+kiV15DXnUPSefmBOv0i0Y6Qa
         xPxJH/rj2S3OTkBZ+x0pFqBm0Yah6lBTCTmo0/IGcf6rjFtjeu4MarjIaYCPoM6RJfaI
         8sm0pp0C2y8XgVvHZuWoDnM9SJ1VQjHLWLQbunHVLJ8XBet+wF8ddjtmoSTYlA8MiFTu
         DbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TngP5H8NgKVtRrs3cV2eef3xZ01hrk4ilINuJfIwbMU=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=xnuM3MxYbjxEX2ufjUjGrk2yPDP4gXwbS39Ht7OrwlRZ9t0ohTTzzNFT0BJc5aQbcw
         t9GZiBoA/uC5nVV3m8IiYbt/rbxynGMvN0tBSUBYck/IpzdmnS6pMR1rXItIeMtWXTRh
         bMprIpLFN9jOzpyg/H5qwkTQwKGCCLLjCI1sbEIHZJKRYbJbXuW9hWCiGXwGHEVCF7PE
         OasjSwT1r0xubkTqpzrneBp1DOpYzzRQrxuRY8yHHZftduI7LgnYsi+ASu1ZaOKkLNQn
         eyiQXq3w8d5NHE7cN91q6hhOXli4NwWv0SrF10WQNdxwzqWu65GCqN6JWh/9Xr5ew5YB
         Tm2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pKJ/O4nj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16-20020a05620a449000b0077d6a185ca5si410025qkp.683.2023.11.22.20.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pKJ/O4nj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r61YP-0006fb-IT; Wed, 22 Nov 2023 23:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y7-0006TH-F5
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:48 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Y4-0006I1-4s
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 23:42:47 -0500
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3b83432ca31so365817b6e.1
 for <qemu-arm@nongnu.org>; Wed, 22 Nov 2023 20:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714563; x=1701319363; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TngP5H8NgKVtRrs3cV2eef3xZ01hrk4ilINuJfIwbMU=;
 b=pKJ/O4nj9LiM72l+6N3miXDNQABKIEsXBipI0o1p4cNOAgYqV9x3ZeBkSKMzHjqk9g
 RdP+V5jqEcRdReLbFphRMK2/grvhpi41gPvK22FtNA2lilylpnVmt7BcddpkzAwR2bl5
 vDZM0JtnQ3uqOdSCzDbTbAXDbzq2Erko3GMCxy2/Hgf2eHbfDxNQCRUI+v30F99vLOby
 e5+vMVJbzeSGxXb2Oi/QlYq2CC8ppEO8xIgUcTFKYEP8PjiAK3WYLo9ZJgHgksZaAk+C
 v4NQchOOsaKGjMHEDNW3e7BYOmllssA1v5crKsMxSO/EVuZmQgsXd4AXuM1vNikQ+15e
 6bNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714563; x=1701319363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TngP5H8NgKVtRrs3cV2eef3xZ01hrk4ilINuJfIwbMU=;
 b=ty3ODBTkvDOjY9uI/V1O7mD3OycW/P9Al9PFoP0F6YCcI8CbkaNV20c7LN9smbJd1W
 /qzUTqHKvEx6+/mnmYWSQqA2vJlh78dS2kK/sTQw7A+U9klHARhHaF4hYRIbPr6y5AFU
 zoU/E/efNn2tqWmjs3qKBGlYsT+oDME0DyOd+tfgz8DsYskNyiGTCJr4ivVNo+ziUFb7
 vtjsxlDkQDQ5Xpc+gOFW6mhQvpyhVNphtKXrFbMvr8sVm+bQ7zo8dcw+cfihiWsAylJP
 LJig0tq9j0p/SyKcUEBKgNQx15bOIg0X2TYN5M6C9QQx+1t+dUmIRTaS23oS3aT4EsOc
 KOiw==
X-Gm-Message-State: AOJu0YzW+MtQwXg35UtIB3854HubZV/CM5ksL8rby060ysNpMM+VW/Mr
 F9BW45ak+UWVyxMi8qtl3i+HuOI4MV+xAttmP9hWLOuf
X-Received: by 2002:a05:6808:5c4:b0:3b0:daf8:954 with SMTP id
 d4-20020a05680805c400b003b0daf80954mr4578312oij.49.1700714562882; 
 Wed, 22 Nov 2023 20:42:42 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/21] target/arm/kvm: Unexport kvm_arm_vm_state_change
Date: Wed, 22 Nov 2023 22:42:19 -0600
Message-Id: <20231123044219.896776-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: /cM+xFcgmGsa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm_arm.h | 2 --
 target/arm/kvm.c     | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index 8a44a6b762..2037b2d7ea 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -200,8 +200,6 @@ bool kvm_arm_sve_supported(void);
  */
 int kvm_arm_get_max_vm_ipa_size(MachineState *ms, bool *fixed_ipa);
 
-void kvm_arm_vm_state_change(void *opaque, bool running, RunState state);
-
 int kvm_arm_vgic_probe(void);
 
 void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 19454f432a..6e3fea1879 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -1290,7 +1290,7 @@ MemTxAttrs kvm_arch_post_run(CPUState *cs, struct kvm_run *run)
     return MEMTXATTRS_UNSPECIFIED;
 }
 
-void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
+static void kvm_arm_vm_state_change(void *opaque, bool running, RunState state)
 {
     CPUState *cs = opaque;
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.34.1

