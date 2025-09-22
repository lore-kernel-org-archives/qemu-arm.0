Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24F2CAC5A7
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:41:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0s-0004lZ-Kj; Mon, 22 Sep 2025 05:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czk-0002UW-9P
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:08 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czC-0000gB-E2
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:03 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45dcfecdc0fso36728555e9.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533846; x=1759138646; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S4WNTy7QbDl7ReDD5PUvCAXuciU8b39SjZqZspkFta4=;
 b=n4iXFapDqjeBYZkvriC0g4xEVvmtxf38qkhnvbVIF80WiBsVE1KHBKJJoLnsRssTL3
 s5NDCbLXuwB07WR4Eq2KfrZVEn5mjRK2AcvYQkBBWaCvMV58XkzH3hbyUqjVE0wp00TK
 bXryvpOOwEssa+pVGshIgGmEYLgg6WBM8vrRjujUg7GcMjbfymM4PgsBMhwc9/kzuIup
 L4h+7wMVtwQ0w574tziTvdbJIGA8I2lJKAjWnuO57dkYalTzgvcyHMMytxFQ0J0ErgQu
 scMHevg2lwT+ChlX33O9jOCid+ObLdX+fNGJNcFSnqACvgJXs6AGGSps+8qivaHe6wfh
 JcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533846; x=1759138646;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S4WNTy7QbDl7ReDD5PUvCAXuciU8b39SjZqZspkFta4=;
 b=dTLHWyrbwSKrI4CdriNDT1Qd3VeB1awdndAhJAT14FwupxfjXsCYjv/XTsCdPaelxZ
 KRVa4xt932ziRVn47Tx3Rvk7IMs18MjHHZKqL67ze5eMkJCZL//N6W7xQuqYQvHfgFT8
 /qjTBDBObVssItEVXiNOueyxxlcoGyMjaEid+x5F2BZ8eAgrOl3v9Bcu4M0dgUJUSPZ7
 LObEs5XFD5So122YuQL6u+dZgpRU96cRZXE0oL21C5Rl6vsA6a9s1uY7V9GUFyzqp2mf
 dS1EJWWMqHZ6bXy0TJxMBdDtWcTrOxAZF4spueL28REfbunJ35ba8Yv60ZAAd2XGzpUk
 ONWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkW16TKpMqTO6iCyMo1/hnwkHbQjaa4RUfnrd4pS/2uf/gd+LYGw9WuliWNyn9KPR6MAirphCtcA==@nongnu.org
X-Gm-Message-State: AOJu0YxL4jq4NmPFJaviISMYkCzZLI217a+m2RgExkEsX/jnZXM8U7eL
 D4uZcaqF2jwCPk5PU0xZQSKrzUcjPCaUqlr4rhdWYcWnrA+NS1lI37BpSGjhvAc3NZk=
X-Gm-Gg: ASbGncsx84GadArXEgAtBxcSTXT5cWcXJVysqzZEd2JDXrgjFCua75tdO7jPTFaQAdr
 qkKiGsrrfzEheou8gqMc0mDa287SO1tDhdOLJvuoI3oaxw1lXOEUvnVi00t5NA73JrkuJQ98VCg
 NsBv5D9je6mEtGl/MVBttWDmVD188ocvGggPzGlHieFofAUw4aguUH75pqF9L0wXkpQ0rblw14a
 kcGHf+AIvlXMWB8aSERWKiX/l6Svu7HARfz3qMvilJzUW08d0bJ5f8rK2ImA0c5i2duJPCOOVrX
 BYtrfEXNU9M/PnTQhACWolhip5XI8Je7mNut/1TVMdFVNXStycE26Bfc+L/p6D5iqdxsdRca0zl
 FmkNWIJtRMADYmbhsStLmW5o=
X-Google-Smtp-Source: AGHT+IEfOfsj70NV5OJ38BPB3oBvQ/TSHt5ZiCzF66U4ZGiQdrLGPQXZxesF+PGJ4gx11C67PFSoyA==
X-Received: by 2002:a05:600c:1c05:b0:45b:7a93:f108 with SMTP id
 5b1f17b1804b1-4684c13ea94mr118734105e9.3.1758533845869; 
 Mon, 22 Sep 2025 02:37:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-460942b6c3csm131375925e9.1.2025.09.22.02.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id C4F2D5FA14;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 13/25] semihosting/arm-compat-semi: eradicate target_long
Date: Mon, 22 Sep 2025 10:36:58 +0100
Message-ID: <20250922093711.2768983-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We use int64_t or int32_t depending on ret size.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-11-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 29cdab66f73..3c9192d8684 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -501,10 +501,13 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_ISERROR:
+    {
         GET_ARG(0);
-        common_semi_set_ret(cs, (target_long)arg0 < 0);
+        bool ret = is_64bit_semihosting(env) ?
+                   (int64_t)arg0 < 0 : (int32_t)arg0 < 0;
+        common_semi_set_ret(cs, ret);
         break;
-
+    }
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
         semihost_sys_isatty(cs, common_semi_istty_cb, arg0);
-- 
2.47.3


