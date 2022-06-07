Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2412647lfb;
        Tue, 7 Jun 2022 13:59:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6objqtSrS8pQi2N36ok5ZnDDl23yRBxr6Am+W0VCxVAb9VNy2k45kxQx52oY0hTXHtk3F
X-Received: by 2002:ad4:574c:0:b0:464:482e:33ef with SMTP id q12-20020ad4574c000000b00464482e33efmr39809239qvx.104.1654635556868;
        Tue, 07 Jun 2022 13:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654635556; cv=none;
        d=google.com; s=arc-20160816;
        b=FPjyx8C+OopIc5NsSjm2tWx+vf+fBEvfWQb5kIMitGFSblD356gWAqEIyp6FK87Pci
         KNVq5SN+9cZFNcSYVlD+S87J2B3d6mYrr+wvmPKbKVgILpIlIrB1VWeENrq3sjyOB8M3
         HXQEt/7UTDeykZkeheMmZf2KPOy029toHY6Sj6B8SvHu91r4Oyt75/vB1hgEP/+TwNIr
         empQidMx7JK18nGEkLM65gVG0I7fS8/yJYVkkspTj7ePcIP2zqSHzMw39HT5PGhpMWOG
         sXsWvmlWNm7O0x4R9ViVwHvWrv+Pb8hD0lbU/WSERGe1IB2Q8eqQJQIjGtNUQMsiVcan
         1VGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lr8nU07ATHOfF6fXY/tNxkqqDhGq3qxiduBu16rymxM=;
        b=PjhjURLuZNWFYvKeDD98pYJcyN2f1SRtB8iaDBG8sW3FtFygN0sDXLw2vgGw0NYDz/
         c5rIE6TDeUlKJA4O7AvFo5Nnnfd0ogNlCWBVODnzUkIUR8e0BjAUSDK+rDW6b4Tuz+w3
         NSY2V3uUzxO90xYfB9UzCiIjhpjJv9Fvd2dZ3kzc80fwt8NQLz3HOJ6WWCX8Ncfba9bx
         rM7PVSFiWnxMtYLRVoqwTCwfZuP0aen5rpSjbdFsS0w16hLuPJKoVvyK89b0vKnMJXML
         skgZC2uS3y61pMyBy5dl3bi0Ws6U5P4d81pX/YdfDNUu3o3HBKaEzNBWOvXvawprn5Dm
         oaXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NV6/dE+r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17-20020ac87f51000000b00304c1bfab97si9324257qtk.71.2022.06.07.13.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 13:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NV6/dE+r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygIG-00081s-Bu
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 16:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfte-0000Mx-7R
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftV-0007Iy-JP
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id e66so16931344pgc.8
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lr8nU07ATHOfF6fXY/tNxkqqDhGq3qxiduBu16rymxM=;
 b=NV6/dE+rxePGYSNNSPx0QSoT9PYlQKsOvAAYE9It/RcORdGiNZiKJf+YvBNdykBatE
 kjeTFKW1aTTZf6Z0fLwcdnQPtkBNJTuYOhezoM4xbk4leZxZwIjAmieboJgT0vlYZTJs
 mj/WQWCRKzZeTXJkNgPlCz05aTXCPNOdlHZGRfYu9rQPA+DYNndOZFq5PDK+fIy1OMiK
 /jcEHDAqe5W7G3RhbmMmxvKATbNjkTFqiR3/G3945A7RvIuHDD9S2txCpjOR141X5NUv
 FKzH3dlWp17FdAe6T1JS7Ps/mkJcIKbvu5gRURsukvkinJzH6Y+M2uSzuNloUoVTs+R2
 9hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lr8nU07ATHOfF6fXY/tNxkqqDhGq3qxiduBu16rymxM=;
 b=P9bz+NfesJ9IeuvZ3/XhSOjuRUlUcSZIYXQ+XIJWWT2u9Dr3e1+VKe3ifdnbLs5jpp
 vt8+YKOj3krAOc8fWmNN5pgoLs9M3pmTKPEeq4oceF04FKy85vBjxZLpGPU1gqzJHWik
 j+djw523N/IrhMPTwDSyO+BDFBFPZXnziMR5HivgMpnkszBN++dAZJFYFbPO8gj0IpmS
 a+SpAldVwW5wWxdoavPb9GcuIbaVuSluE8yVgcrKYgWHTJT9Dy7SfUaZPekugpiiJETS
 2QlgTCV9+3AcWK0wYWwBfQM3mrAlptoNNAF6/VKKHhUsuOWqHDuQodIxTyp/bUEl3fC2
 OPxw==
X-Gm-Message-State: AOAM5309KTtMdl33ehgz18rAnktGHus6CBT5pw5Rj34QEpgjqNA8alhx
 lp2AzwnCjJn6TAsB7vfl3gyDgd8F5O2WzQ==
X-Received: by 2002:a63:480c:0:b0:3fa:7277:bf34 with SMTP id
 v12-20020a63480c000000b003fa7277bf34mr27186216pga.35.1654634020767; 
 Tue, 07 Jun 2022 13:33:40 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 36/71] target/arm: Unexport aarch64_add_*_properties
Date: Tue,  7 Jun 2022 13:32:31 -0700
Message-Id: <20220607203306.657998-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SHfACxNLHfVH

These functions are not used outside cpu64.c,
so make them static.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h   | 3 ---
 target/arm/cpu64.c | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 25a77ec676..8a89548cb9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1097,8 +1097,6 @@ int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 void aarch64_sve_change_el(CPUARMState *env, int old_el,
                            int new_el, bool el0_a64);
-void aarch64_add_sve_properties(Object *obj);
-void aarch64_add_pauth_properties(Object *obj);
 void arm_reset_sve_state(CPUARMState *env);
 
 /*
@@ -1130,7 +1128,6 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
 static inline void aarch64_sve_change_el(CPUARMState *env, int o,
                                          int n, bool a)
 { }
-static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
 void aarch64_sync_32_to_64(CPUARMState *env);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c5bfc3d082..9ae9be6698 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -689,7 +689,7 @@ static void cpu_arm_get_default_vec_len(Object *obj, Visitor *v,
 }
 #endif
 
-void aarch64_add_sve_properties(Object *obj)
+static void aarch64_add_sve_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
     uint32_t vq;
@@ -752,7 +752,7 @@ static Property arm_cpu_pauth_property =
 static Property arm_cpu_pauth_impdef_property =
     DEFINE_PROP_BOOL("pauth-impdef", ARMCPU, prop_pauth_impdef, false);
 
-void aarch64_add_pauth_properties(Object *obj)
+static void aarch64_add_pauth_properties(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
 
-- 
2.34.1

