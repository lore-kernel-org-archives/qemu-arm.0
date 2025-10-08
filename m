Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02A7CCD184
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:13:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cEq-0002Wn-6N; Wed, 08 Oct 2025 18:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cDP-0001O1-Dl
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:57 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCX-0007QE-PJ
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 18:00:54 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so333470b3a.1
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960798; x=1760565598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lTKzFsxEh1g5nw3IQ5A0hf1nPRnygZE/fIp9mQ9w54I=;
 b=GFvsDmLEDnGfNvHJhv0EHDb2PRi09SVMM0btE8Vk1G5MhmwIKbPxTavUjma9OilddO
 27vdYz6pVKX7r3vvmQIBVwW11NQ23y1+t1TUNRB15jJqX998fm/af6nFw5Uw6qV0LfuL
 0dPnh385r+rZDuReOZKUGVTysAyWalphZKNjObkEe84VsfDLgtIIuyHY1hqD4WBDaeOt
 j3QYcsTMF1OXdd9p1o6KNBqHb2tQ+W1XEYdPwIeocp+XrHpVaPUI6CUJGJQb6s3dvK1L
 sHoJSuo9g3UNYUKM7zt6u3kxMOagRRNJPioYGnpAUM6OI1JxU/1l0WuUdXIJufGenvyB
 N//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960798; x=1760565598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lTKzFsxEh1g5nw3IQ5A0hf1nPRnygZE/fIp9mQ9w54I=;
 b=Ux1Xu+9RbhBCXjt3Dr/M7yfflclbOks63we++8XUj3f5nNm9Npit0lgxSZ6+ehujCg
 MucSeztRl0b4n4UZ3M2q2skrFqYaS+t7VAArZ4lsJPSV1GErFiKzjmCl7+GCCZppvblw
 vRyTqjlbNSApfvbnM306Ajz8rc1EmfAhVDHELdxtwt/Qn20wlPTBcvS2hFsyBFhZli5W
 4wPkOn4f3vAN620cyOOMxwniX1lvCrwGUMAPGS17s+xAHbhPIoAZtXdJj3TGpMZvKyk1
 pOib9SpaCOo/7AHURYnJc8IJFiaN9ba3xnRMa6IfUMt7uBdpKkZoFbpbONP4dc5ZBPQF
 aH5Q==
X-Gm-Message-State: AOJu0YxjrVt2xvXcgY0rt3C/6V27K+ZX3KFW/ZMt2fP1RMWopI+aXbn4
 DnBZz+iJYtHHJaMFQnQjMcYKhHfHy0kTmGiOeI0lLU9PH8mqInh7orq/QYIvOn7QpMP2AdsWSuA
 IRz92PEY=
X-Gm-Gg: ASbGncsNCw9Y8BEYOBr6vcGiJ8v+WonHd46vu4xg+4j1dwfGTnNB5Dt//OF8loWA2gS
 cOf1QHsguVc5X8ju/clz5Ze7Q66wTYqCSVVU/UOJ0WtnYuHVsEnGS66wP8UqM3y39msSUbt1F6E
 Ce6r06TWyK8vsyuMmF31XTR7HnepvtvNClhHfot+CWyQaUV35mf7jNRAQLzShxpoOe3tkagbR7Q
 QlD+4x7YnpyVeaxPHW1PPNTnVgx9uFaq1PSo19bk8eaY7h9yyBHtIYp4NenkusMaAXDIncuAU9E
 UeQIGgtVSIyeNGL3QUmqMfAWsNYgLTIGGKp/zv0DeQk0WvmN6J6Xk/d5BaJ3LRAXgmNKYhLrUo5
 2hRhwNn6ODUNw14q4gOZ14LjI6qtrR0MoUIjJnMJm/Uc3nZy+KB6IHEBn
X-Google-Smtp-Source: AGHT+IGPElA6LyKGONa2uJy2l1RySpApELCF5vOSTiV5b5YbzEOMxqdgnMKg6XQnysJoXGAxldVX/w==
X-Received: by 2002:a05:6a00:14d0:b0:77e:d2f7:f307 with SMTP id
 d2e1a72fcca58-79398c9763fmr6093297b3a.9.1759960797592; 
 Wed, 08 Oct 2025 14:59:57 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 65/73] linux-user/aarch64: Release gcs stack on thread exit
Date: Wed,  8 Oct 2025 14:56:05 -0700
Message-ID: <20251008215613.300150-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
index dffe6c2016..47a6b58cf5 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9429,6 +9429,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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


