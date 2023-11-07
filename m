Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp274031ejv;
        Tue, 7 Nov 2023 04:27:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKuexvEuPkZdba+Z7mc+SVAZdghkhU0YEfbIKfOusS3XvEjGU4BS3l3DCkwEDQSPcZ+PnP
X-Received: by 2002:a05:6808:f15:b0:3a3:b39d:a8bf with SMTP id m21-20020a0568080f1500b003a3b39da8bfmr37994649oiw.45.1699360041226;
        Tue, 07 Nov 2023 04:27:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699360041; cv=none;
        d=google.com; s=arc-20160816;
        b=eThiTIid0XiauW9bIN3S6TrqDYAvRUNTVgd9GRfHFQkkaYjldmuqfpm0ClAHl7tZlc
         Ec6sjqQvSK6lGzzTw6ZRUSs3asMI9DD+cjfnCxy9DPLxVqa2Jp6sffk0MP+cJNefVapW
         YEF5KyoDx2d1HWJGtqs0Yapi6cgsXz18sNXr/00xds3BdlQSn5N+ynku/KYAdXdLsi41
         PXLDmTtOlkZSPyr5PzUx6twSrs70N3RiYTDVlpJLLIVSdBOE2I1sAYemP50Zo21edn6x
         eZH6sYtM4gfY9OYkFFBRrPeFaYFSUfpSWsb8/26CRG5r5ToYJtAPwvcphynP8a1C0ujh
         he/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uzHw9gxC37cDWskQ8Q09i1BaQBpN31WzD4SH6IynXXc=;
        fh=fIxgkU9hKSKE+S/E1Sv9exqhyypVK9uhZLhwSHjMAp4=;
        b=YS9IEZKZpX7W7rRoQcwyeVOk5q2GZLI0h6Ccs2c8HIBhIleIZPNXo2ODVbFtiMMABO
         E2xGPBurUWIlJ9CEqs5TGzJrc2QR2jjvmLs/H2O2OUzYROz95D5PiFTW80SXvh8uvtHA
         TLcGBS0RB1e5Ha5VBA7leah6vsw/RX0smRqQfqp8CR9eQKF5QUsPn56f3tRt5KoR1nvh
         pbRFK01FFicWVsvqqHrknS9GVW3PXSVliycAO8qbFZy3X6KAHOsaGJWQCiGKTwgO39Am
         PyyTD7BZnq2KfEPeYY3kpZbGDB26qqM6TZPEop5BabCO8ykjluQDv19XUpM8TJJp+Rg3
         4E0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvKBMHhB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vr15-20020a05620a55af00b007759399e39dsi7021640qkn.692.2023.11.07.04.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 04:27:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CvKBMHhB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r0LA6-0007G3-Kp; Tue, 07 Nov 2023 07:26:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9d-0006Fv-D9
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:26:05 -0500
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0L9I-00057S-MB
 for qemu-arm@nongnu.org; Tue, 07 Nov 2023 07:25:59 -0500
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so80414171fa.3
 for <qemu-arm@nongnu.org>; Tue, 07 Nov 2023 04:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699359939; x=1699964739; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uzHw9gxC37cDWskQ8Q09i1BaQBpN31WzD4SH6IynXXc=;
 b=CvKBMHhBGXTLC6ew4HjO2vX1SrgW4YEzhsR/cEtPTzKXNJGY/F87F7afNw0jSdQvRX
 ibvrxSO27zkrDE0gafJSNnh5tpCD6+K2nT31rLFKbA0QpkwwvHEt/6xnwr2OuhEzZiS3
 dEzudWcDJhSga5FzeRVYsaienTSX0lWUuVQufwpRnBW0e3JJJm6Wbps9hEQBmKCb89AC
 d7v0mwBUq6qTzXS+1L/CDJLlkxDq9cj2bKHm7/DgAMBvb0CX70thTkiZhwetqGRYYHOP
 CdJTSQ1nMBc2ZaHN1Q2irxZAEL8dph4kDEQvNqKLmeChXXMnb+zA3N85CwHsiijJ3qe+
 0wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699359939; x=1699964739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uzHw9gxC37cDWskQ8Q09i1BaQBpN31WzD4SH6IynXXc=;
 b=v2iqlS9EqtpqmbPlyKkGGQesOTwsHDv4S41gBEgdOAaKcVjuKaxIOHRpCqiyV17pXN
 sMtP3sPvQXFVlA+gNI31HRnkePZHNd/3IGzpnUKsCp4PKf6lyZC7aYgPatC+NCBp3WxR
 nLBq3gaGMQvut3cg6SQBNlNFmumCR41HvJpEbQCaKDFKnfLcZejz+ct1NIiaw0Bfbt2g
 zmTC0jmrcyPmnFBQJgf3SzNQfxYXixBTryyo14rfeQ4h5X/p3xZ6NSQg+8dav6xarmcS
 vg+W1SD0yGGtgU4wAjhtBvALkc+mLQCgP+utTeXaMXJa9qWt2yxexRsa0PYE91g9jspB
 vDtA==
X-Gm-Message-State: AOJu0YyureS8et0H7FdT/Vcxac6eNSm0kV56A70Dmjh5q2uPVh1UxfAH
 15w+fFWConf4v0nx4UI8LuNcnA==
X-Received: by 2002:a2e:3910:0:b0:2bc:d8cb:59fe with SMTP id
 g16-20020a2e3910000000b002bcd8cb59femr22459267lja.8.1699359938985; 
 Tue, 07 Nov 2023 04:25:38 -0800 (PST)
Received: from m1x-phil.lan ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a05600c1d1a00b003fef5e76f2csm12701908wms.0.2023.11.07.04.25.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Nov 2023 04:25:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 44/75] target/s390x/cpu: Restrict cpu_get_tb_cpu_state()
 definition to TCG
Date: Tue,  7 Nov 2023 13:24:34 +0100
Message-ID: <20231107122442.58674-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107122442.58674-1-philmd@linaro.org>
References: <20231107122442.58674-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
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
X-TUID: 3fCwMp/LDNYf

cpu_get_tb_cpu_state() is TCG specific. Another accelerator
calling it would be a bug, so restrict the definition to TCG,
along with "tcg_s390x.h" header inclusion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231106114500.5269-4-philmd@linaro.org>
---
 target/s390x/cpu.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index 38d7197f4c..110902fa3c 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -29,7 +29,6 @@
 #include "cpu_models.h"
 #include "exec/cpu-defs.h"
 #include "qemu/cpu-float.h"
-#include "tcg/tcg_s390x.h"
 #include "qapi/qapi-types-machine-common.h"
 
 #define ELF_MACHINE_UNAME "S390X"
@@ -383,6 +382,10 @@ static inline int cpu_mmu_index(CPUS390XState *env, bool ifetch)
 #endif
 }
 
+#ifdef CONFIG_TCG
+
+#include "tcg/tcg_s390x.h"
+
 static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
                                         uint64_t *cs_base, uint32_t *flags)
 {
@@ -405,6 +408,8 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
     }
 }
 
+#endif /* CONFIG_TCG */
+
 /* PER bits from control register 9 */
 #define PER_CR9_EVENT_BRANCH           0x80000000
 #define PER_CR9_EVENT_IFETCH           0x40000000
-- 
2.41.0

