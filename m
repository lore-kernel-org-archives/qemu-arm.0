Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp272982ejv;
        Tue, 7 Nov 2023 04:25:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAc2sIOhQy3aoIRgsrKGxz4GNSxnI7APyUNYEgykNClaHkX4Au+GLLVWUISMXWfXpmrTOh
X-Received: by 2002:a05:622a:256:b0:419:5b97:2fbb with SMTP id c22-20020a05622a025600b004195b972fbbmr34515039qtx.34.1699359919716;
        Tue, 07 Nov 2023 04:25:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699359919; cv=none;
        d=google.com; s=arc-20160816;
        b=bqvLbv7NyH25R+qIEfK56bpyYTXGKBM7h8NIIDeK0q3CCLHIOfWlRrz+T7+6oF9xSv
         3d0eMLYvti5X9lj4ASUwxylXFJlkMIESLV1flOlck90DC2fU6699P9oRtpEPxXCh2NrB
         mszFiahEbHxNaKbB7EJ5sSpnFfOM+8IJFTODS142W66lAsRoLQSeCVlJgrvaCd4sVyxV
         ldCkN5/O8fahcT90uogfh6MbyBZWHZ8Iwk/67A45YBDuyCk7NN8qR/oLqwPVBfQJfDeW
         H9dLcy78xzuSnzK84au+75TaaaP/CX87MO5EEY3Bx5N5DCzUb3YUu4d3GgRlC/kK9c09
         SYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vwIwGURbiF//KmePmfvAI1hLU80w6lpRnRx+VzJZixg=;
        fh=zqCJK/GNKinD327RpwX+nzDujFsGQ+TAosBHb+QbdKo=;
        b=GsKmr9MRI5N9CiL0V+KhEzrqvRMtSNNPZU9t6H6neYnph8s2KVwujHO4hzjmwVvqai
         buOlcKATnSRwqIfufTAw2dBy2JaVwK0kaj/+9V3HmY9TN25N7aYdXO44m2/s3DIPwc1u
         UTG8AVXOcnTb+HyeYbgMJvk/fH8aQmfLZ/XBinfhSqRsu6R6I3sXv5ZOd5FcX/Ws7M/N
         mz92LYn7kpLyolHzNqICwfEudDzuhMUOYlZwPqh0QVVEGLZzjyhrvOUFit4L4elx3TK9
         TajiaISAFqOZxHsDKPRJnfwfVuxpxX0Te1v16Lt/qEfaZM/OiMf985t/h9DBxYuE5xwq
         V5og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IeYl6qcm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30-20020a05622a1a1e00b004195f6ad06dsi7150116qtb.56.2023.11.07.04.25.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:25:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IeYl6qcm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0L8s-0005OG-KE; Tue, 07 Nov 2023 07:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8q-0005HY-CL
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:12 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L8c-0004gA-N3
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so39130695e9.1
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359897; x=1699964697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwIwGURbiF//KmePmfvAI1hLU80w6lpRnRx+VzJZixg=;
 b=IeYl6qcmsiGdXJ3fA/WTi60MmAgpFTr4FccCKum2M6LxtBIec6ToYB6VeCFPeKB+8M
 n31PcXB0kwC8XU15ICxlh6oqqLLm63ApN97jW5r6LGJWo4rePYB7ylcOuaZMCNlkX562
 P9OrAyruFZ19tK7eeOMXL0GdLTuNhq3R7Y2HG9lKxHURqQYVrq12egIyfREa0YLE2lwi
 yyv1R33ruKyVlZVRfg91QAn9BSFaq8nvhIJJMjyKogiS8iOk2f/nEffkeEYPJ1tjqucc
 jaAZei+Xuh6lKMuBze1gH4nqjU6ThR8yYlY12As8Ele0sVDpfMWks9IclGNhf561CmcP
 R7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359897; x=1699964697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwIwGURbiF//KmePmfvAI1hLU80w6lpRnRx+VzJZixg=;
 b=gpc7xNtCIQDlfv0rm6xJBC6yghAPXNVnO4/VQ3t3gpxqmNzLlPvmM9NRDenW8/Bqyk
 miU0PlALQPM6vRozI6M7L5E2I9CMsl7cwH0PIPGNCAye8HL8gxhYexqF5/SF19d6lmbW
 03KvNrvJn54nwppSazgER6R4VQT8f3zYpoidPizZVis3Q7KGdDdUGWrr7brVGuasO2Lw
 5GD8xzrG5vm7Cl+NzDa0243tfm6bO6DcanykKUJlUbZXLPGLUwFKnHJQB+bZstk94mG7
 vybPal1oPs4AeBjGEdBa7mfTAtYUjsQwbBDk+/VosKn7RK+mbhSWDlBp5UX7PfKuxTVN
 f42w==
X-Gm-Message-State: AOJu0YzJyAtCv3nMWScR5S5ZXHA7jlusEHQ7lwEjAMilqkB/4Jy3br7Z
 Lk3GGbcwPcl6HqNHvZcaKUQuYry85qy1ROZGQXY=
X-Received: by 2002:a05:600c:2191:b0:407:4126:f71c with SMTP id
 e17-20020a05600c219100b004074126f71cmr2988795wme.6.1699359896987; 
 Tue, 07 Nov 2023 04:24:56 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 az34-20020a05600c602200b004076f522058sm15891852wmb.0.2023.11.07.04.24.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:24:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 37/75] target/ppc: Move ppc_cpu_class_by_name() declaration to
 'cpu.h'
Date: Tue,  7 Nov 2023 13:24:27 +0100
Message-ID: <20231107122442.58674-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 1Fnx9PsttaSs

ppc_cpu_class_by_name() is only called in target/ppc/,
no need to expose outside (in particular to hw/).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20231013125630.95116-4-philmd@linaro.org>
---
 target/ppc/cpu-qom.h | 2 --
 target/ppc/cpu.h     | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index f681bfb4a6..0b8dfa5fee 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -36,8 +36,6 @@ OBJECT_DECLARE_CPU_TYPE(PowerPCCPU, PowerPCCPUClass, POWERPC_CPU)
 
 #define TYPE_HOST_POWERPC_CPU POWERPC_CPU_TYPE_NAME("host")
 
-ObjectClass *ppc_cpu_class_by_name(const char *name);
-
 typedef struct CPUArchState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
 typedef struct ppc_dcr_t ppc_dcr_t;
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 02619e5d54..f3ddfd7a26 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1342,6 +1342,7 @@ struct ArchCPU {
 };
 
 
+ObjectClass *ppc_cpu_class_by_name(const char *name);
 PowerPCCPUClass *ppc_cpu_class_by_pvr(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_class_by_pvr_mask(uint32_t pvr);
 PowerPCCPUClass *ppc_cpu_get_family_class(PowerPCCPUClass *pcc);
-- 
2.41.0

