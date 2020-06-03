Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp31927lfc;
        Tue, 2 Jun 2020 18:15:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZZFSQxZyuTqg1zEB7IvPfdPJ4+MEGEAfG0DJmVyGMhN4LatOvM2R8Y+9EG2s5KjWQ9nph
X-Received: by 2002:a5b:40c:: with SMTP id m12mr44384204ybp.501.1591146948226;
        Tue, 02 Jun 2020 18:15:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591146948; cv=none;
        d=google.com; s=arc-20160816;
        b=tkUxEfUWTCYNavp9YiR+1DmmmGkmBxALvpvxUOu0MB+9kes8i07qeNRt8/95mq9r9S
         lR4jxoVjNRBDNZl4YdmUkW/D2PRzJxtAzpdbsWH0Fp3e8x1RnEbbEq6VGAejjgqcszln
         sDGc2qcvh/K2yrCa6jx1nZYohWJ7bzB9f/qvId60mPbcnTsPTsYou6Q71EfwqS6+Y6Rg
         XSvKCLzmB6QvPqCzwPt7Ges4wbZKm0RjDnyEh0MH0eQcpNnN1wGTuTxvu5EwQfvVvTI7
         tyhbEPBbEQ9vruByOMt6D2XQfdkA4fdRx/bCKkgFV4phqS5DvSZk4asjpfz65c/LsSME
         VpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2dMQqpeyi0XKIpauyWT1oQVejUj1nmYGROEX25a4OR4=;
        b=KM71ai4Gx2PEmOQ7ly8MQZ42NNw/UZRb/jd/OLSA53w7q4ar8t/U4uT/YrzQIpypPO
         exwe0U7Z4fynECQ8AT4fLq+YwdkGlKZXlQQjxKm1xYJ3j3bpwqzLB6NjzmWVbmcQu3TC
         AokJqgxJGrBUd8zdBxs73DgvLWAUcSC9xt/4+SUuZti3VWe8EAnjdmm8V2zzzj6K12/h
         tukx1lEAWeTA5htPI0Dm8SlDWu9ZzeMnL4cHv0f83jfF+T7DAicBpQkz5QhpoFMwc0Ia
         d3i5Vs7VezkcdITBglw7xBBGpiWfeKFxfNLS6iWDpBLEWVKDaEHpG98I60cSJ/ja0yRd
         OU4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P7yUf7QQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si291296ybm.484.2020.06.02.18.15.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:15:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P7yUf7QQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI0R-00087z-Iy
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyC-0003Tw-JX
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:28 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:43510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyB-0003X1-KH
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:28 -0400
Received: by mail-pl1-x644.google.com with SMTP id g12so191064pll.10
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2dMQqpeyi0XKIpauyWT1oQVejUj1nmYGROEX25a4OR4=;
 b=P7yUf7QQBE5+/vpm46q5Q4PrJEeyCCeg0Ufbn7DdA+si9Qoxr68iS2PL0j0ei/ftZC
 iY/l9i84a4oJOxaSHwQIaQjot8cFBR2Z/zZXRKtbJ6+D8bNKKoaD91JYfzisB74MNwAR
 2ZAvKiYG4SF0H2WaMVyg0MC3EsgN8eR395IsckgidIoPo4jke2cWeDTDtbnQyYwMCRSp
 IPv4dbhVsORCd8x1SovWN7d5IHLQSHzOMTCQQh59Z8Mm1T6UkIECXhPFlNh+BI9/X1zi
 y6V1+t6id2EfsWXZ86bArKfdfVctHF9p3zFJT/GxzxQ99KQKIy1iJX4t2f1eHgKJD0EP
 L+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2dMQqpeyi0XKIpauyWT1oQVejUj1nmYGROEX25a4OR4=;
 b=Fu+kR3MeEb06UGAfujCEyeB/P4L40l51hQ7aXOedkqA6jcgszMcvfMAV1VbveJtMTh
 U/Bwhbu1lbj4Rg8pwNy5vY99RikiaqfkdDyzsAlhysp/r69L6GFeb8h1tk53mfHCu5Vd
 2tAqrCAq2CCMQ8P3RwTzFvP+n344heIrM1nuZ5MPFEs688cXsFN5AxDjiWvIvwztwdNv
 msYRhcDwoudW7sISkj5/oLIhe2tMlX2/nHQDtjbff1TsP3zv+3uJN2goVT+xK6O+Y0Xn
 xZ6elfOftVG7mTlIyp7DLRQhbTbAr7hqETJpXjXNC3HbFS0qovdqwAC8XVuQgMF3avEQ
 CFAw==
X-Gm-Message-State: AOAM531VCqLFvLR51zhq8c6qM0yd4mYRbu6S2TCSf06jPmhrqxgkOcfB
 8DCwvnben7BQhcMQWeufFWkqNQ==
X-Received: by 2002:a17:902:9f90:: with SMTP id
 g16mr20197123plq.146.1591146806315; 
 Tue, 02 Jun 2020 18:13:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/42] target/arm: Add DISAS_UPDATE_NOCHAIN
Date: Tue,  2 Jun 2020 18:12:41 -0700
Message-Id: <20200603011317.473934-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zhhyevUC3Gqy

Add an option that writes back the PC, like DISAS_UPDATE_EXIT,
but does not exit back to the main loop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.h     | 2 ++
 target/arm/translate-a64.c | 3 +++
 target/arm/translate.c     | 4 ++++
 3 files changed, 9 insertions(+)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 68a55251c3..81e47677c7 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -173,6 +173,8 @@ static inline void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
  * return from cpu_tb_exec.
  */
 #define DISAS_EXIT      DISAS_TARGET_9
+/* CPU state was modified dynamically; no need to exit, but do not chain. */
+#define DISAS_UPDATE_NOCHAIN  DISAS_TARGET_10
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 430f1867ab..d4d2f69d87 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14340,6 +14340,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_EXIT:
             tcg_gen_exit_tb(NULL, 0);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_a64_set_pc_im(dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr();
             break;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 00a6fe6752..460be11f31 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11085,6 +11085,7 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_NEXT:
         case DISAS_TOO_MANY:
         case DISAS_UPDATE_EXIT:
+        case DISAS_UPDATE_NOCHAIN:
             gen_set_pc_im(dc, dc->base.pc_next);
             /* fall through */
         default:
@@ -11108,6 +11109,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         case DISAS_TOO_MANY:
             gen_goto_tb(dc, 1, dc->base.pc_next);
             break;
+        case DISAS_UPDATE_NOCHAIN:
+            gen_set_pc_im(dc, dc->base.pc_next);
+            /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
-- 
2.25.1

