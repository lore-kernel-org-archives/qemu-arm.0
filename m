Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7F7CAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:48:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jQ4-0004er-H0; Fri, 03 Oct 2025 13:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jLq-0007uk-Jg
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:51 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jKE-0007ro-0I
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:13:49 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7811fa91774so2103704b3a.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511520; x=1760116320; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrZwksIyS9womuNg1WIqxqIe6QDKycTf62pUXwQ2GGs=;
 b=vcTv8842a+s18eIvLuu7+7QtSoy2205ysOXvq1oCvleWTtSnHrS6vcV8zYNJa+BAh1
 +TFKWM9C/AfNBravYGZv6lh2IFjKnkT/NIZXGFkgoDSCjDUJTqhPdSlmFpTz69xnBtlv
 OwP49vJ6cNZeS63onp9E0C4OShMNK2fwOWQo99m1sq4F+kbIvhCSOcNia8KosOYUfkbj
 WoADd9Yk+DzilLQBIHlBC4wysz7WSnIRpWV7CDlgMfe3vcZ4U5ZpwHdEHKutU8slHUZ1
 VNBa4V/19k0pKcNvWz3KDqWi1asjJjev363oA6ilF134NvLSrRid4yMifJatj9iHLFOn
 wKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511520; x=1760116320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrZwksIyS9womuNg1WIqxqIe6QDKycTf62pUXwQ2GGs=;
 b=qCBoAKiBlpqGPSMMzH+sxxR0xSymvMDS93JXx4rWkx20aSxgrWQ950kSOKMwMj39lH
 JtcxMKeNwr/ObMLIzwbEShGX9GnzY1W/kFggt635frREoHJo2ttzu33Vpx3RximZy1XI
 FltRntVmCplQIKKa+9sJTdYq0Vjf+cQxh/lVoYq3S+LAZpubsZloNKQXSyg2LC+O9+ra
 QtWlqpG17TSgn9yyOtJ7nAztUc3eAJTo3XT+uZqZ9n9x8ZkLvj0e94MOgGafEfvJxgFh
 bFLBw7U4lmDAw7ZqYkiBtmKr/cjEW4fKTfcZLGjlzgxC7dHjG/YpVLHLD/jayUfuCemy
 bwBg==
X-Gm-Message-State: AOJu0Yx7jL9X/t5bIDDcd0PjLx0hEhhKTKx0iQ3SsXDXbFSrsexMKkQT
 ElgZo91zrhJtK2Zj8JeO6Japn4r/EqobDfak7bhVS36l7ku16h39kZgj0XFmyzIvdMg=
X-Gm-Gg: ASbGncsfrOnt15SBPpVzDo4VKacRHv1jJ9l5MLgI1ZFEORhd8s6FpQcVDJY1U+y+2zb
 zFuQ4/X34Zs1187W38ttAoHEvuHGkljK4/uAJ2ir7GTDdqQZ+wfaI6m6y8kRHAsLvekk3hxcJCJ
 m4QcNxKxFx1C1twzM+UyRKaO+qW1K551JHj3Sm2ehio9SjtAXSSDwbNGhId4gguwsCqCNHztnM9
 +2aWhnhU3mRhFwv5lhrXhmQJ6hJU8eEHGgw/tULi+Y9GSJEkM9YmodQnPKNm2KRc1nh1RjqOz40
 ToPpip0wxDCY89K34ZotdfJSdDm0pjdmy+DnUK9JOj4N7ablCodszTqT54MHcu40TNTGahkbu4o
 fDXRy0Y3C2R4JgirkDJYv91LP7HWlQOKiiPJ45yYvHKwndV0rE+esQxuz
X-Google-Smtp-Source: AGHT+IHi1Eavz7/nY5mRQSjvvwiivGo/BRTUGOEqsH1vXC9cSCmAny9S+QtO7kft5DdfbiLWesovtw==
X-Received: by 2002:a05:6a00:8c6:b0:781:2538:bfb4 with SMTP id
 d2e1a72fcca58-78c98d5cb4cmr4121329b3a.10.1759511520177; 
 Fri, 03 Oct 2025 10:12:00 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b02053a51sm5418769b3a.46.2025.10.03.10.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:11:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 65/73] linux-user/aarch64: Release gcs stack on thread exit
Date: Fri,  3 Oct 2025 10:07:52 -0700
Message-ID: <20251003170800.997167-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
index b09ea4b0ff..39b139b0bf 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9340,6 +9340,12 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
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


