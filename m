Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp879509ejg;
        Fri, 19 Jan 2024 03:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IED+lm/6VgWQEX7l7NUzg21SUe0k/6AE7M5uYDTAncTMKbGu7CO0mLm7kpl7XDf+EwPU2VF
X-Received: by 2002:a05:622a:20a:b0:429:9e60:4c50 with SMTP id b10-20020a05622a020a00b004299e604c50mr2565630qtx.114.1705664318686;
        Fri, 19 Jan 2024 03:38:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664318; cv=none;
        d=google.com; s=arc-20160816;
        b=E74e2rrdxEh3sdgAEh1lGITSdM6GzquZWCnbBCYhLZjCwtVYgSN4XZotoB6pxKNrSP
         9x/h/p/GGvebRUNMD3fa1WK1O9ps5R9edEBrbTxXuzDmy/Zs9h+W3ze1yXTcfwu7Kx8B
         xb6ouCMO0/8k9s5RgYhGnBDSums+yA8tq5uNVCA417gFja8GYvXbs+4EyLTgwDwxEj/4
         EzwTSZX/8YLoOSfaKuNOBR5QaBBtBNg1E6yWDKBo4ov8xFQ/Ct1w10d4diJ0svwoZnRr
         hcz9GXSEa5L335pHa6uvf1UVF1IPyJ6f0DZbsxzYf/Qg6I/2J72iDnykqGsQcHYxDfiy
         YvqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DBo2Z7Ku5vyeXLs2uqKJ4IlgAVFUCbWhBp53AWDvWSA=;
        fh=6tP4L9XjCvdhkEFVfS9C+TY7ruUfmb06A1hD+CUqGXU=;
        b=WHx1SPP6eq/LuQ7+z6YSHiU6k6vnUlFxQ5R5y0UXBL2ClVcLU/I4H4Lyb/eexdWy/E
         wSCpUzngKSii5dlMWJ6DKDQLhB8hY6aSnTzpKwrhjEs9AOkjyZKt86F76jZ2dUfOHafs
         HJCt59VCDzrJ/nOugPj/Wb3KVHD2h2Onox841TZ6ctMlb6xQwx8UP+LHOCsiwtcG+pMb
         nc3z2FG78Z21X0SFRTXJzZJT7bCgr5tyOgUBYHxUXyWdBK8XXufJsAp6L5WJnYtnza9r
         3qiXiX7Z2Bv+spSC6rLfdz9HG8x3Sv585eEVg+5s/Vo7dBIJUy+aORM94VUBnKMOvzB5
         L4gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVkbTjHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020a05622a138800b004298b431d3csi15928009qtk.591.2024.01.19.03.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:38:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RVkbTjHp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnAE-0002Ab-9k; Fri, 19 Jan 2024 06:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAD-0002A0-6A
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:57 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnAB-00011w-Iq
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:35:56 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50e7c6f0487so680513e87.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664154; x=1706268954; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBo2Z7Ku5vyeXLs2uqKJ4IlgAVFUCbWhBp53AWDvWSA=;
 b=RVkbTjHpw6HYCktUCLrc06V6zdfSUu+vDrCtMdt0c1ZgkbIsnQmv1PQrwMUZmKnG2H
 6TmYvnvXI5KK3E+SEkmPiJxvHy1z6yY8iv61qiU77xTKqbklQLqY7LfDPabn6R/bJ/FF
 CAEccApMIYmqp1UrVvWmF5PD8YsKJqdQ88rOa9rHagzEqgYeSv0F0/5lOhThe4SOR1km
 iVV+ujEwRZ19Nc3e7UKRLMbLRAfIZxmSGVodB8iQn1c2AYJgVnSj5rbe9POKKyga5P/7
 757l+01IaQfLkApH44ZgRODMzqKvSorVEj/K7PYDgF2oh830r9gONZs6lin3AbT7OI0f
 wj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664154; x=1706268954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBo2Z7Ku5vyeXLs2uqKJ4IlgAVFUCbWhBp53AWDvWSA=;
 b=UFBuMoqGI5Vn50I5iV+hC9uQnMSosTO5qhV7VMq5gjdzkYASBVjNbATJvLC4dKXc79
 hUcU6h43JcQ9SPSsdxaS5pkQIJrdwcDhfDNqUD4+3V+8f3sp3d2+x5GrMWschud6NAit
 19a3Q+TMBQoM6XYnbDHo8c8ESe3Exs60NRaZvOVkEu/3EeIPDoisPe06ywGCOZNU4QSf
 cjxZoZhOLlFvtuAJLt/Tyv4fOTafAulUtsEh7VhKr0/xkauyp30XZf7lbLw05daYOZPJ
 IhPu5K7BIO+/HLgo6S8XB5NJ2fy/nEETK0758OnyPO6i1dzdwUQcntNFPk7Ir8tIU+9m
 Q6xw==
X-Gm-Message-State: AOJu0YzU2m34NbIfi84QTfo0Lbvmmulri/ePP7wO+o0Fc2jzlO6LnDoa
 ciOaR33iSIXzV6mbom/BE7j+Kpn9qgLQe42ZyZdtLUNejt9YRzLKsa4fVjpkygU=
X-Received: by 2002:ac2:4e81:0:b0:50e:b945:fc98 with SMTP id
 o1-20020ac24e81000000b0050eb945fc98mr325094lfr.170.1705664153935; 
 Fri, 19 Jan 2024 03:35:53 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4a82000000b00338ca0ada22sm1400094wrq.111.2024.01.19.03.35.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:35:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/36] target/alpha: Only build sys_helper.c on system emulation
Date: Fri, 19 Jan 2024 12:34:39 +0100
Message-ID: <20240119113507.31951-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: MdQWlIlmLPcM

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231207105426.49339-3-philmd@linaro.org>
---
 target/alpha/sys_helper.c | 3 ---
 target/alpha/meson.build  | 6 ++++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
index 98d9a0fff7..768116ef32 100644
--- a/target/alpha/sys_helper.c
+++ b/target/alpha/sys_helper.c
@@ -28,7 +28,6 @@
 
 
 /* PALcode support special instructions */
-#ifndef CONFIG_USER_ONLY
 void helper_tbia(CPUAlphaState *env)
 {
     tlb_flush(env_cpu(env));
@@ -74,5 +73,3 @@ void helper_set_alarm(CPUAlphaState *env, uint64_t expire)
         timer_del(cpu->alarm_timer);
     }
 }
-
-#endif /* CONFIG_USER_ONLY */
diff --git a/target/alpha/meson.build b/target/alpha/meson.build
index ea252c99a5..7dbbd55717 100644
--- a/target/alpha/meson.build
+++ b/target/alpha/meson.build
@@ -7,13 +7,15 @@ alpha_ss.add(files(
   'clk_helper.c',
   'int_helper.c',
   'mem_helper.c',
-  'sys_helper.c',
   'translate.c',
   'vax_helper.c',
 ))
 
 alpha_system_ss = ss.source_set()
-alpha_system_ss.add(files('machine.c'))
+alpha_system_ss.add(files(
+  'machine.c',
+  'sys_helper.c',
+))
 
 target_arch += {'alpha': alpha_ss}
 target_system_arch += {'alpha': alpha_system_ss}
-- 
2.41.0

