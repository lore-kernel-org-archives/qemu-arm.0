Received: by 2002:a05:7022:639b:b0:92:a90b:6588 with SMTP id q27csp158066dlq;
        Tue, 21 Jan 2025 06:32:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCJVBOeSL/NHRrjRWoWS4HGw7msoexLtpI6/aOaO/ZZTT+gIj2qiIooz5Yh0pUZL/BS+YAj/XLqgYkjw==@linaro.org
X-Google-Smtp-Source: AGHT+IFKuhfU7kaBGiPSrpMVm+E+BRmx3ScQPLM2UtvaHQIZ9Vr6sDg1KsSkl5gO1s73sKjaZMb9
X-Received: by 2002:a05:6000:144d:b0:385:e01b:7df5 with SMTP id ffacd0b85a97d-38bf565c2d0mr18978756f8f.14.1737469951424;
        Tue, 21 Jan 2025 06:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737469951; cv=none;
        d=google.com; s=arc-20240605;
        b=SHW6Zd5qbImjvcwZcHDCeBUJSuLI+vrONhwip8B3g6laBU1RXi9oh6kxZip0JO4EWt
         88WcvIFX2FtSNeBjcOMERoWB8FaA0OLUnDmPFTvrig7km17x3dgYcGLsu0dFTwiNfkEv
         tI3bR3O3HPt7KuGJzu+6RqKT31K4d55ySEKbG5Tf6B4e1S+J4Q5NicGkWTWUnujvD7sR
         o+oej6nIfVVdc0pWGLR3a+xLiFIl3mk7MFRLEHEPnsIzCUDaMvtcLa7iJcaBJ+0LOHfL
         xOgY6n7k3D4ObboXFk8Mw6eIfdUGF6//X0PbVtJmz9SQX2P7AzjkCvpsbZOALTP9wbgi
         iK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xJiPCCG+WztNHXWvHaN+Ou3cngv4lAHFeGfB5H1KSFc=;
        fh=T9nLPmYdz8kSl8qI33evWuh/VVTqN+U2Q3T/ETy8raQ=;
        b=LvUAoE6St9NXDmKmheppQPR+WNR53DWxxM0GCjqgygKwwvHM9FOxcjhJTh15AKKg/h
         QYnyYIisNuzLTK+/n71Shabs0Tg10zduFVbGlk2PJ3mDUE7FkAiXigd8UqiQinSbAHkS
         s+X54lrcQ++ZaUAqvxzq8QjHuljXLCHbAc1z8BFJ1EG6XopFfzwUTAEzCL2FuqlJsVj+
         ux8mrAsLJDKQ3yT65NKF0fDTfHKthuSpRhmAaX6MMJPgUUDJ00HCklYTs4adlMyql3pa
         TGtvfiE9vWqsRuANDsabAaQSHxfXfVhuIPdxpRuDbViddW9WOTMZ9WFN0d2FzBVl+JPn
         1qSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Joru2x0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38bf3278c28si8074697f8f.392.2025.01.21.06.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 06:32:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Joru2x0U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taFCy-0003QZ-4K; Tue, 21 Jan 2025 09:26:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBh-0001r3-U6
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:15 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1taFBd-0003HQ-Po
 for qemu-arm@nongnu.org; Tue, 21 Jan 2025 09:25:03 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso20288145e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Jan 2025 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737469500; x=1738074300; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJiPCCG+WztNHXWvHaN+Ou3cngv4lAHFeGfB5H1KSFc=;
 b=Joru2x0UA3WreeWp+RBvbTrkrChHpMH82jQbL3XY+oz0Rs/Nc9fFt20Uev6Pw1pA7K
 v8VOpg9yhviE2BlGj7d9i1BaKh7H90FQ/2YorG0Qyx7J2jn5i0kjWm2axRi7GxnreN0T
 OMhoYGayn4xSAU8DViiSPmGlcOy8v4SMRz0Zv5kOG9cEL+IcDKPbTM67B81xyE9fH40s
 MsUX4gVtuRWcygi8L8oByP6N/HIDt24aV9URp/oWHLRhcEyCIpYMzYNcLY23WddWUP2V
 kp5WbcdqpzPUaEQbzDjs3elOBTyYPvWkEjDYhGBWT0T/dESbTV7LrwWEsKABFewO9/LJ
 f4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737469500; x=1738074300;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJiPCCG+WztNHXWvHaN+Ou3cngv4lAHFeGfB5H1KSFc=;
 b=EFyPhY70g7o4wzMBIyHjQQFPFjY+zScDd4y8eyTH48+jzYqKuffXdEOHRn8CKtLqfn
 hDZYdEzM/GVbqUoj9/XGSq70EsZhFPPnKdYjx4NK4ab07x03WF3JICDAFjFb+UZt8YlD
 fQGT+/V+AN9VThNDpYYS7zlkIorz8/eXXhV0JJ2WvqaMiz57y1DiFHk8N2mjdiQw6E5M
 d6V80l0u3F+fKplRGWxRVD0Rvf8Y/fjrQcG04ZZLWRYEqZYgtS99w1jV7n/SiDWS92pa
 R9NwpBjB22ejm/WIHvLL0AHadQQZ52y52AdHfSLqB0AGYGBlM+BOVerYDymIiHChiyKU
 04QA==
X-Gm-Message-State: AOJu0YzXQ/1AJQBTZQqeqrhiuzWAJtK4/gvDAUgaP2GIXXbc1iCc6xPO
 8WaTuEPksEbvRr2XuJqSrmMAXrAzOIaHXjrWefV3F0PDkGlrD2/afe/nT2Mojp0=
X-Gm-Gg: ASbGncuWOUZPwlwe8oM/Pf5IQSQNIcSJhlbPcCKSMF0z7WHfmgI629jocgZcSwwQI/I
 +iRPWH/baiVu6wGtpdVJUNRPm5D1xMpi8LsUDlRehfSEELN/Y2Q/P1yw7hoSMtVHSt85oscSo4j
 ftOsM8MAsdrN/8gSndhkl7ND+bcXSLjjxTmziFTY7JyFefui/hyLGhgAsM1n6jiJIS19/HQi3J3
 x981ktOLhwZVj9zYNjoWxS+hzXRoFyh0qkWwca8s39CNGPTdQXO03Cok4nck2CIErSaDq+ZdzeN
 ZK2U7I+v6SOZj3LEGnLCtXQsaIiWaagLjMPkiYo7lmGd
X-Received: by 2002:a05:600c:1987:b0:434:a7b6:10e9 with SMTP id
 5b1f17b1804b1-438913e2fa9mr173391555e9.17.1737469500271; 
 Tue, 21 Jan 2025 06:25:00 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041f7e9sm184241255e9.23.2025.01.21.06.24.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Jan 2025 06:24:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 16/28] target/microblaze: Move has_work() from CPUClass to
 SysemuCPUOps
Date: Tue, 21 Jan 2025 15:23:29 +0100
Message-ID: <20250121142341.17001-17-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121142341.17001-1-philmd@linaro.org>
References: <20250121142341.17001-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: Nklvqeu+2Qia

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/microblaze/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index f114789abd8..7a90cb3016b 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -115,10 +115,12 @@ static void mb_restore_state_to_opc(CPUState *cs,
     cpu->env.iflags = data[1];
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static int mb_cpu_mmu_index(CPUState *cs, bool ifetch)
 {
@@ -415,6 +417,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *cpu_model)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps mb_sysemu_ops = {
+    .has_work = mb_cpu_has_work,
     .get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug,
 };
 #endif
@@ -450,7 +453,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
     cc->mmu_index = mb_cpu_mmu_index;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
-- 
2.47.1

