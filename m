Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3293777ejc;
        Mon, 23 Jan 2023 16:01:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskACUnbxtcIRlAETPxtwomd0zpUigObHNphb//33E9pUWkp0N5jI9syHJRkRidj7yxA2tu
X-Received: by 2002:a05:7500:610:b0:f2:58c7:57d9 with SMTP id bc16-20020a057500061000b000f258c757d9mr453069gab.29.1674518463322;
        Mon, 23 Jan 2023 16:01:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518463; cv=none;
        d=google.com; s=arc-20160816;
        b=Jj8LwL1zrAifyxrOnHYBVadeYAA4gN0d2O1N2P6uY8WlaU51Ze/52T0270Haryg8KY
         hyrKFfP9wyxW2YTnO1m03Cj464ZqaEsvAbXvDwntxQ8e5LX5tK4jFuyx8iZ4kGkvgaB1
         CyQJRIn8sZmY8DYtNyPwLgMvDJI8H9Y6BZPkW5XnSeSkUc2fxfeostKtDieoIs1r0dIe
         SU4W0AEbs0oGtun2BsbfdwT3v5Sy8sSxexq4Ts1WbaMjX+WW3ZEoeG7QqxjvZ73b8QqJ
         34GmUX8r6Z/LEHEw+NUvbCGQhJE+dH6cP6dRACQZFIiXIw3JZ2O/v0VHwXRY70zdcuiZ
         Gq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=roMq0cKqYUSuqmepPgcMOSqHad1ObHN98rGJI0Zfrfk=;
        b=NG25mO5V3I28jlKefrFqcm/FdACdYlt9ndRY1FgLL2sZMv43fPbiAVSJhCD/gOrzx1
         RRS2llZZWt6TGkGPY7ZWX7WS+yGpVUO1ta1R//w6sRbt8Za6qTB5wsXOn/6T/JSVp51S
         /SPH5XRNJ1YnTCtFF5OzGRwhqKMUKPy//CJXNhu6OsApvgRAs4d+O3/uOM+H6sar4/0s
         MLDTYvA8c+UIBQxOy89Zuaa/I/cAjVIW0+W77c/iAn4r4y/0AESEpOLN8YrRsJCdBbGK
         VqSbZz6r99YWXhWDv5hTxQ9pJhfwIKePEY4yh0/4rWFr5V/8bv5tfbPyCJDt7OMJlwrq
         yZmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfJC03gq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05620a0b0c00b006fcb40a3e79si487650qkg.111.2023.01.23.16.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:01:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZfJC03gq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pK6kC-000856-De; Mon, 23 Jan 2023 19:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kB-00081q-Nb
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:00:55 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6k9-0001qr-LE
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 19:00:55 -0500
Received: by mail-pf1-x430.google.com with SMTP id i1so10117030pfk.3
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 16:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=roMq0cKqYUSuqmepPgcMOSqHad1ObHN98rGJI0Zfrfk=;
 b=ZfJC03gq9ckBR1NFci4XY0r9zkl/MW5c1L0ShZw7t0ZlcqnHicBTjqd3paqp4D+7zH
 OWh3ibRbbB+IB6g9uorJlOhushVCZdgXpmlkNylnj1Uc3fT7N5I+JU3LVjn2CTkTz5YN
 5DRa6CdmNHdugGHW7FP2Lt87Gj56HhxAXsudaacnMybZ5hNI6zhQiQumEYWAhL9mqr/K
 i7k40Jn0KYHoGGzWyvxJ5KkYxPh3qmCD7p6bo5018SFhuXa1tIqU+7IZZQIP08glbuiR
 WiXyD0yX4n7iEBtKFVrSIgXhinOMoQhOE0DLOvVsYu99jxSvk1SR9LbCv3Cn+Ryx1jRQ
 zDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=roMq0cKqYUSuqmepPgcMOSqHad1ObHN98rGJI0Zfrfk=;
 b=uxownJdQP7s+8lX+J/6dZP1ww7zXcHBmmhn8xwcQjfcsc8NZmCLgVkPmQRMpUjNYlT
 5UZviJEjdDRWq3TKn8DBje0CGNJMIDLlxZSkbrxN35kBxqg0Vq5pZ+c0ZN6LHB15Syfb
 KeuXEHauz139XgeUMb23y9Z9lg7+gGztiY6Ok+UDu6cC1j1yDyfjgoqCyuv+U52FOqJn
 hdKM0zuLBS+2452NLRvgdgER1X5HBt3i+BXVp6QylqbXnPX/+BL5gfL11uYW0tXeAF/b
 RTZ473+IgT10P08LrhU7dLAP+pymEAtZwxgQatHFfYJEFKtkhJyl82Naz/hJrM2+urMJ
 zizA==
X-Gm-Message-State: AFqh2krwO3dGz/viLXIxudFzF/8D1LKCcD8aWrcKVEWx3qeOC6AHEZgJ
 jIwbskhMuhaP2BFpCSPlUALjkg==
X-Received: by 2002:a05:6a00:3020:b0:58d:92ff:8a2a with SMTP id
 ay32-20020a056a00302000b0058d92ff8a2amr25340215pfb.23.1674518452051; 
 Mon, 23 Jan 2023 16:00:52 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:51 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 03/22] target/arm: Add isar_feature_aa64_rme
Date: Mon, 23 Jan 2023 14:00:08 -1000
Message-Id: <20230124000027.3565716-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 16yKYuF0Poif

Add the missing field for ID_AA64PFR0, and the predicate.
Disable it if EL3 is forced off by the board or command-line.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 6 ++++++
 target/arm/cpu.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8cf70693be..81d5a51b62 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2178,6 +2178,7 @@ FIELD(ID_AA64PFR0, SEL2, 36, 4)
 FIELD(ID_AA64PFR0, MPAM, 40, 4)
 FIELD(ID_AA64PFR0, AMU, 44, 4)
 FIELD(ID_AA64PFR0, DIT, 48, 4)
+FIELD(ID_AA64PFR0, RME, 52, 4)
 FIELD(ID_AA64PFR0, CSV2, 56, 4)
 FIELD(ID_AA64PFR0, CSV3, 60, 4)
 
@@ -4001,6 +4002,11 @@ static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
 }
 
+static inline bool isar_feature_aa64_rme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RME) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..b10ace74cd 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1944,6 +1944,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->isar.id_dfr0 = FIELD_DP32(cpu->isar.id_dfr0, ID_DFR0, COPSDBG, 0);
         cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
                                            ID_AA64PFR0, EL3, 0);
+
+        /* Disable the realm management extension, which requires EL3. */
+        cpu->isar.id_aa64pfr0 = FIELD_DP64(cpu->isar.id_aa64pfr0,
+                                           ID_AA64PFR0, RME, 0);
     }
 
     if (!cpu->has_el2) {
-- 
2.34.1

