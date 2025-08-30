Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A30CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:07:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNyy-00078a-ON; Sat, 30 Aug 2025 11:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERg-0007Zh-VQ
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:48:14 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERe-00053s-RR
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:48:12 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-248cb0b37dfso26143145ad.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532889; x=1757137689; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bac99cWBoODM0lZjzPV8FafpKsc60jTDKb6XVoHXo24=;
 b=n8iVZXGAFq/SZyurglApvl+Sook3Um1klhvTQmlkti//w4G6PW3yGOduOKwayHSmAz
 xHY6e7n6ILnY80f0MwMqOxdx1dBR14rzJjazzmaP8AKI++ngDcfJiUFHiuhRaQQSHiJL
 AI0Wc7SBtlztTaPcPqJEIhogvZXGQ/BqnPvVxLR0pRdT05hXLr4Z3vSq38LwtA74E9MN
 aYwARVJX0WrSkNv57oFSsX42XGGWcSAqiQjdN8UggW50SH9ICqWV3mEPZcqrYeLJ4N6c
 VLZB6CLjA+OkSzTT6peCnObaDVqnywqyc5PG5Rhh5ZEQ9oCbs4gQDtCyb+UuBIfoqu0i
 1Wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532889; x=1757137689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bac99cWBoODM0lZjzPV8FafpKsc60jTDKb6XVoHXo24=;
 b=a9zRFkivMERiOLMoonvLl70zceLTg3Eokh+vqMOJkACH63QhQuHNOECQmIHiCLTBH8
 wBqG1/i79wRksdylR9QmOPbmwNzZZsSlBAd4YOzBl55JzeGLAtcmuKek9JsOA/+O3/k4
 WkGiPVpbkkTKVLJQvA7tDbSlsLjlt4tdT3haV3bNx+KHhEKNRJaAuAwjDfDCrRYx/clR
 VOWy/BbqeLcvYLzpOr3qiCFq6tEsMru7/FHU+gkowfe66wih3RVDqwURczoVe9Gw+epR
 WVvp5jH5DME04Ca/q7UAk0L6MSN2YWWXvGnd98gcqD0YmewUruVwIWvtmfCGP+Z7Gl/1
 P8SA==
X-Gm-Message-State: AOJu0YwTKzOVB0N0ckA9WyMlngTjnXZGqsbbPJzspw+gPwQqpBY0YYwt
 XpER7fMaEms5bQq4LXqiBqaUUL4OermyD0NNxPSJx6BNbi+8y7H9vX0fKVkbu5g0DWFd5CYVQZ6
 n0XC00KE=
X-Gm-Gg: ASbGncvh2XirVmvvpl50MMBAN4O0AA1iSPeTORz0wBVXzCpkzCtn3HtqHJj+FLYJPPn
 PZqFUgiAyaT4HCyD5xuTwvtBHxhddhu1Re1anq0GvoMCXpwhyYLAVRmSsPScRyEO2IpWyK7zMGp
 wAjPXWhqdScSetO0WGHwHo7t4sDbVVTRHGZBnail5cRXzIm3bnVTPcsxkle0FR/qtnCgH+MaW92
 mGiucRCuSpeB+H3eUWQjeiZrgSWadNTf4Z4P008lTbBjbhW7aHXeyaZNKKeLv2Zy5xwWFaeXrcg
 MHSoXArvMtrt2ZKsRJcJ+UkdqZljmZ5DcOhKXEt3oumjjVSBvDOZF2WXIiFBGP6WYOi4cE+Pq3s
 Lx4BpjFPQIPVXjqCpkfrXgWgkXsytJU+fhX92IkaqXnthsBES91/VZY5ugrXd3MM=
X-Google-Smtp-Source: AGHT+IGXaQpscm7/1zUhEeaoZ9ooDyQHhqZN0Z+WC+sNrG55TUaAuzpT/bs2zdf6XbdLvnzkq4mM0w==
X-Received: by 2002:a17:902:e847:b0:248:9c98:2cf4 with SMTP id
 d9443c01a7336-24944aeebf8mr15656665ad.46.1756532889443; 
 Fri, 29 Aug 2025 22:48:09 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:48:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 76/84] linux-user/aarch64: Release gcs stack on thread exit
Date: Sat, 30 Aug 2025 15:41:20 +1000
Message-ID: <20250830054128.448363-77-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 91210775ed..dfe114ceb3 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9309,6 +9309,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                              FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
             }
 
+#ifdef TARGET_AARCH64
+            if (ts->gcs_base) {
+                target_munmap(ts->gcs_base, ts->gcs_size);
+            }
+#endif
+
             object_unparent(OBJECT(cpu));
             object_unref(OBJECT(cpu));
             /*
-- 
2.43.0


