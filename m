Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0F6C83030
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:04:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsyO-00084Z-Nr; Mon, 07 Jul 2025 17:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLZ-0005Rg-Ih
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:22:06 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLW-0004ON-Pc
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:53 -0400
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4a7f46f9bb6so44468821cf.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919709; x=1752524509; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1dN+jHhreiyd8r0k++CMedUplUxYHL5uF378IW34go=;
 b=ihJ1GELsI8TSNfgYivD2oQJnlJeSLLIM0gJfFbtgnIi7vUJKt3qUd2EfpsjB4bZeNK
 VGtotiEHOdGtkc6aq9zePiTo2PHnJa/dq2Twb3hVI7S47Py3KnF99ajBOI5Rj+Ggi0jT
 s7wE3hteq5i+0O8TcPotupHITYOBUtLNxtrQOEjdURAegkHArYLEN5GKUkZTlNIInOs+
 n532k8wK6KyRU+Vls4yAM6GWlpjUHrVNd+18Nebj/wmymfXs/mqUE/N4m5QQV6exqEes
 iIIFqVCJD4dNLUUasWUR08veukIE+68H8Zvx3KgQEO+fe1tmAwxwb/+AJmUpYtb8JuQt
 yoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919709; x=1752524509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1dN+jHhreiyd8r0k++CMedUplUxYHL5uF378IW34go=;
 b=SJlTJs/1XAsZi6glQQhHE6ZTS4ug5KHdF4jHpbznUlbgK323ZtPUm4XYRX38FXVWyp
 oiy6B4m2gue2LcSPhiYlj2z65yuMOxgPkA+MddOb4YiBP1C7tuYpJFT4kV66/QwE25L5
 VKtth6YDbdge7+k0Ne0gJqTwJWjYe40pbHIDL9dZPXnzQif6eOdlt7K1Grhd2424R6xi
 3ChL9VjNN+OLxmAbpPCh51ylAQgVxuMCS7iZS3do18PDETmOw/Fur6w/13HNkACkCqw+
 KV7Xe1/qRMgdCIORmEXPz/tGXEo4Y1T5gKOH8nhUju/wTYhOL6Prp5OMClBi03P8PnPG
 7Aww==
X-Gm-Message-State: AOJu0YyEj5O+d8UmAZRz7v6Iiu3eUd/BrCcbw0cw53ac0co1M33kAtms
 WhJXptw8NJYVe5yFkJzbKkKja3Rlc8D1Z3KNELS2kXzCXMGj/G20zhuhs+bbsg1OMoQ=
X-Gm-Gg: ASbGncvwpZNDfDVGdmeZuyEFiiQlZWQIeopR5suGM3zRiNkxpwql7gt4M7BVLuK7Xbt
 BPWNFj8HkFaBzRAWEl9J0iUl1z9uB+NgtloIGvjZOVfkSiSN8U8HzoJ/zav/1/Dq3PDavspQ9LT
 pX/zbLHkub8rZgnr/NqZotDkFIOQHBzRnfXakAe6A8RRNaL3WA0BgWiyFlDCHC9vYw3E1puvt2a
 SsisVNWbjPJQbEHclN7WiHcuKmiG9j6ReM6mmhWaezv8/Siw9D0Cnm79JcNL5KnUptLwhAX84VN
 kdAPyVVAGk3J6qttCzkL3D9pm/X+h5KjzYxV5MghUZ3TTwVYS18rysWKkKC34ndliorbw4JuSAk
 04xwDbxV52rT0rPk0
X-Google-Smtp-Source: AGHT+IGo4Kyvy+fjrB7If19eE5TCJb9sGzmg0NN+UyiUIB1nHGmH3/hFe3yO73RFLdCSsD2T8FPB9A==
X-Received: by 2002:a05:622a:198a:b0:4a9:c3ae:ab90 with SMTP id
 d75a77b69052e-4a9cae7b5a3mr25859431cf.3.1751919708882; 
 Mon, 07 Jul 2025 13:21:48 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/20] target/arm: Fill in HFGITR_EL2 bits for Arm v9.5
Date: Mon,  7 Jul 2025 14:21:10 -0600
Message-ID: <20250707202111.293787-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index c9506aa6d5..88b3d63424 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -512,6 +512,11 @@ FIELD(HFGITR_EL2, SVC_EL1, 53, 1)
 FIELD(HFGITR_EL2, DCCVAC, 54, 1)
 FIELD(HFGITR_EL2, NBRBINJ, 55, 1)
 FIELD(HFGITR_EL2, NBRBIALL, 56, 1)
+FIELD(HFGITR_EL2, NGCSPUSHM_EL1, 57, 1)
+FIELD(HFGITR_EL2, NGCSSTR_EL1, 58, 1)
+FIELD(HFGITR_EL2, NGCSEPP, 59, 1)
+FIELD(HFGITR_EL2, COSPRCTX, 60, 1)
+FIELD(HFGITR_EL2, ATS1E1A, 62, 1)
 
 FIELD(HDFGRTR_EL2, DBGBCRN_EL1, 0, 1)
 FIELD(HDFGRTR_EL2, DBGBVRN_EL1, 1, 1)
-- 
2.43.0


