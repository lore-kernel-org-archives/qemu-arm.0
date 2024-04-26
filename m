Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp637234ejb;
        Fri, 26 Apr 2024 12:44:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDYAe1rAXOa5uifablKoKMbP16WW4sE3WTKKwergKTrzvg6JaYwFVVwoSy06nVhXXfRmBo5m4XN7mmqVLed2cTkYZuBOCX
X-Google-Smtp-Source: AGHT+IG+iKc46DNYv1PfPheyHn0wLodVTRlUYex6poepNjpuRiaBm+OBvejeWfP8QdvhP6RoVou9
X-Received: by 2002:a05:6214:19c5:b0:6a0:8511:98e0 with SMTP id j5-20020a05621419c500b006a0851198e0mr4442751qvc.22.1714160650820;
        Fri, 26 Apr 2024 12:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160650; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff98Tl1M/f+5hVCeQVSyjyNFbMdHX/7no0dJnHVtoWTbcKRgx7uqvPSYwkTm4a3dXa
         YG/ies+UnZ6aOJk4Y7jJUfVdvGTwMB5vloGMY+bpqMT33dvO8fkrngVtGyhx2+RKYqf/
         9G3n23ujryBtvOCIUUqPboNXF9QWUkE3x5uw0A5UPyDNSov2o3eCxUmTOQv093BoLgtK
         IJwcrdyarfJYRy3YiGmXjNAqJoyE53G2xwgMk+s5VDazmwgPC8bTFGDkuQqkcG5UdGRw
         W/3/xj1ld0wVKr93ggIfEe29Hz3XWLaXZJZ4lT9cuP2D2pMl5XrAt3zKkx9BWiwyY62s
         9fKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D/VvS2kWTA4rqEGF0JfFrfE/nD7tnjsws7S2+jUi5LY=;
        fh=kT+SWCKDHpOvENEFJ3mTYKt+7Tos+RGOymTadbn3wMM=;
        b=Paz4bD24b+qTjGd6hs2Ts2N0E7cubWoSNWITY+7A89Y2FMtsyFS9nRLR5uDd9UCRFk
         GMm6YOt+GTjhHpS98w93yWqgk0zXYlqHZmH5C7jG69waQGUfKkSyoLS+JFx6DgW6TEpp
         hmaxL0tyXn2pnJLXtFGOtPmQ14uaXrh+07PSJ1Rt0q49tL+7UMBaNMcMzol/kUkTKzKf
         6WeEtoRerZSamcf/FMeraWxpkATpLvrpAOV/IrzzUPEV7YGTcxj5z/WopbO2DfDZxa76
         CcmApClxzm5cSpkOm0wXjpxSdxkhv4eZ/NGqc1wh4MnLYuKHVsshS1+naE455gOisCTI
         3KTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLZ5gaaU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a056214202600b006a064ed6508si18828029qvf.614.2024.04.26.12.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LLZ5gaaU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0RSq-0000LI-VY; Fri, 26 Apr 2024 15:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSm-0000Im-Ic
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:28 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RSc-0002nK-30
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 15:42:23 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51ca95db667so1527334e87.0
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 12:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160536; x=1714765336; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/VvS2kWTA4rqEGF0JfFrfE/nD7tnjsws7S2+jUi5LY=;
 b=LLZ5gaaUImzu1QoiVR+g9ULSvAhAyfPWE8DzzB248TJP0C6FPFUTy5tiP0Ih4ImyvE
 LxpCpcYjVLMocCj0VpcLU2/fJGCxjC1RWB1RaQGx/rk4uAFhPcx1S9ANdyGvF4giUA7k
 hqNMsI1qLvDrtyZZeFh/zaoMUAQNLIHsC+nD8MRbgZwTpT/nfLxaFk4pZs10iXgcGxX2
 XfUrHI922nC+qibQPhyJTJJq5Pgnfcfwve0XBXz5MhSbLK89aOdGwgeTeO3gd6Wiwimg
 fyXNGAhLIiPI4d4f7tU5MmPg0tkGBGEtNNXflEiutuD//pXgRaQSKz8JbsCzcDNKcVvY
 gr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160536; x=1714765336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/VvS2kWTA4rqEGF0JfFrfE/nD7tnjsws7S2+jUi5LY=;
 b=kLwmF3BjrroJ6M+6DAbvpWDv40vWctxo8r/4lgZw6v+pGWyFX2AiI/+Ah/TX1raiY9
 tweP8myr8X4Cv+Cnd7AiWp3W29joDUj0Hhcr/Gn4wwgXLRHLNqLIMM1rloXNrKwV6aO1
 quJeePoz00KmD2Nu+tkhricfiIzYr4LXeJwxCYTz1GA55JPTZs6T/p5cVVccDP4JeRAp
 5eZ2khiMNfM5v0oP2QWT9aiB4dH/iywUEXDNBbTawK0s69VMmcLuGHIOmp9BUvAUjwvk
 uS70bx8mYM3QZ0kQn/DS+S8BVdCA3WJtrh1x4gfERTd55j/eOUxuUJbu53C02W2ZS6jG
 Ua6A==
X-Gm-Message-State: AOJu0Yz9dxWIizLBsDD/cV2zA2Gx0FDMr4Z1+aPQAdveBBVwqhYzQDFO
 7TKL/VyW31T8Olv3X36zW5LoeEmOT9f9HcMYAJIQkeIogAVy6tveBuFuLCdNXsE=
X-Received: by 2002:a05:6512:4806:b0:51b:6366:3459 with SMTP id
 eo6-20020a056512480600b0051b63663459mr2820804lfb.67.1714160536378; 
 Fri, 26 Apr 2024 12:42:16 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 c26-20020aa7c99a000000b00572405680e8sm1789128edt.21.2024.04.26.12.42.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:42:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 02/38] exec: Reduce tlb_set_dirty() declaration scope
Date: Fri, 26 Apr 2024 21:41:22 +0200
Message-ID: <20240426194200.43723-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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
X-TUID: QCvQroHT29IH

tlb_set_dirty() is only used in accel/tcg/cputlb.c,
where it is defined. Declare it statically, removing
the stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240418192525.97451-11-philmd@linaro.org>
---
 include/exec/exec-all.h | 1 -
 accel/stubs/tcg-stub.c  | 4 ----
 accel/tcg/cputlb.c      | 2 +-
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 3e53501691..9599e16a09 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -654,7 +654,6 @@ static inline void mmap_unlock(void) {}
 #define WITH_MMAP_LOCK_GUARD()
 
 void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
-void tlb_set_dirty(CPUState *cpu, vaddr addr);
 void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length);
 
 MemoryRegionSection *
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 8a496a2a6f..dd890d6cf6 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -18,10 +18,6 @@ void tb_flush(CPUState *cpu)
 {
 }
 
-void tlb_set_dirty(CPUState *cpu, vaddr vaddr)
-{
-}
-
 int probe_access_flags(CPUArchState *env, vaddr addr, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 93b1ca810b..e16d02a62c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1039,7 +1039,7 @@ static inline void tlb_set_dirty1_locked(CPUTLBEntry *tlb_entry,
 
 /* update the TLB corresponding to virtual page vaddr
    so that it is no longer dirty */
-void tlb_set_dirty(CPUState *cpu, vaddr addr)
+static void tlb_set_dirty(CPUState *cpu, vaddr addr)
 {
     int mmu_idx;
 
-- 
2.41.0

