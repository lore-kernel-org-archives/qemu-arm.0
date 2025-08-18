Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BBFCA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 04:25:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1unrQE-0007z2-4K; Mon, 18 Aug 2025 00:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrG7-0005nn-NO
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:12 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1unrG4-0002Bv-B9
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 00:14:10 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b471738daabso3509250a12.1
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 21:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755490447; x=1756095247; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=64+ahYFh4IwC51HUbhtOgwf0sNLEsCS04TzU9ll5HPo=;
 b=YtX+rVXs+nLRp2Wj6iuSD2Dhs0COJkCZQI9IT1CEFM8ekwBJwJZyUloas/s4LeDxH4
 XS/NvSmVpDubciR90rr6K3/ceQBwSgqJUZOruQLnPDMdBCLDbhJ2VEgShI6Ekq/UuRO2
 HC3NTVtppikhMFx5sjztVAc7bp91Dj0mMeNljlNh1b0matbPUsjtzhQtPkR2SBLYuPmT
 5vWshzRFan4jFeCKTRaTonSYVPGMgU2Q1RAR/45EBuMoGuDBGzsUgqHdQVyIIWcW1Ukt
 5MLEpUx8bEC2kpljt0xWbbg+OWhshwF1PIVDKiZQyzpL9R8qRrc173A2Aj+Ww4vz1Ffp
 frbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755490447; x=1756095247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64+ahYFh4IwC51HUbhtOgwf0sNLEsCS04TzU9ll5HPo=;
 b=i2LpdB5EhqvhRWC9ub9XkkX11iEikUjj8/QVcsvAWNKqI9vyTlO+uhqZqyqqT9Ux/M
 YXS92uv9IXv+/nsZIBpZOudxYiqz2tZ4AdlJCMsA2EJvFm/5VYbKEJ2K8Rg2sUQ4IkZe
 OZegkwOcVK2QrJ2NrB18nAEzrEGBCjOJiDmCuj+t5DVg17TB33MCpLw8CVezVukacfHb
 9Y4vKaIrLounOJKlCQ0iXaCYrpUmuBOuVInWmPEB06cOElznGePCCJp3Lm1xmLDF6QLT
 ubmzNcfOSh3wH5Lbo85+UKQ6g9/zX8FI3MC5R2PywQ+v+9wrO8YyRbFzs5zwMjNnqRn+
 ZfaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqJ7O5+dmaLX7Ukek1EXVoDXFQmeFybwxGCHBpS6FBhCRn8k8irEAGtmSoIvmWUl4DFSS5ISRzQg==@nongnu.org
X-Gm-Message-State: AOJu0YxCNEDb5Lu7hLoKLvtEtvIDZek26T88FfHlZJHjXQKqRuUH2jLv
 ngU5FyqRdZGS6VqNNPlu2cCH7JyYLcnVGpt7omPs1qk/WrwnfYM7Fe+fEmG1l8FlLAE=
X-Gm-Gg: ASbGnctq2oVVoNMrUp2LyMGgyQkVqopt8fKW6GGPj/GaV55DcSVueimhUjXng95Nqe0
 fhItQDExrIGFGg5/RFyWaBLz5nZ/eZM3QS0N5r0oaUKjQplPwj7fOSYv7sRFL+MQ7JvpVHcRf3B
 wMJ8dVr3OPeBIwflgcB7K4g981Ont3Vn33cgUVj1ohzGl+X28dh1rS+5o5JP5XirAZIqVVCQfmb
 1luvwOPnh9xqUDTHcGFsbMxi4Q0b5dpeYG+O7RY+nNU8suHTxOgUJeGY8mHeGKqQTVxlUzp0YiG
 aqARe1StB1d+F0rP3VhB4VLaz3ORLF84YmCubxLvLr3sBWo0AnTXPXN8nXqo6S474vW84eSYJD0
 dl3K+EJ+JYjGbht5jtJxyei6AnBbmMGdDbcaJZl71ZysPJ6M=
X-Google-Smtp-Source: AGHT+IHrAdJ7dmciH2Py8pMjYvuvihH+V7uvt4TmGTyTFH0eaKLqq4XSUopGi+zLQaPMCnM1Vm5iqQ==
X-Received: by 2002:a17:903:1aae:b0:240:3909:5359 with SMTP id
 d9443c01a7336-2446d8dcccamr147351265ad.40.1755490446765; 
 Sun, 17 Aug 2025 21:14:06 -0700 (PDT)
Received: from localhost.localdomain ([206.83.122.207])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3232f8c8e4bsm5498344a91.2.2025.08.17.21.14.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 21:14:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org, philmd@linaro.org
Subject: [PATCH 1/7] target/arm: Introduce KVMID_AA64_SYS_REG64
Date: Mon, 18 Aug 2025 14:13:48 +1000
Message-ID: <20250818041354.2393041-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818041354.2393041-1-richard.henderson@linaro.org>
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

Allow us to create kvm ids directly, rather than going
through ENCODE_AA64_CP_REG + cpreg_to_kvm_id.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm-consts.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/kvm-consts.h b/target/arm/kvm-consts.h
index c44d23dbe7..90d792ad42 100644
--- a/target/arm/kvm-consts.h
+++ b/target/arm/kvm-consts.h
@@ -180,4 +180,15 @@ MISMATCH_CHECK(CP_REG_ARM64_SYSREG_OP2_SHIFT, KVM_REG_ARM64_SYSREG_OP2_SHIFT);
 
 #undef MISMATCH_CHECK
 
+#define KVMID_AA64_SYS_REG_(crn, crm, op0, op1, op2)    \
+    (CP_REG_AA64_MASK | CP_REG_ARM64_SYSREG |           \
+     ((op0) << CP_REG_ARM64_SYSREG_OP0_SHIFT) |         \
+     ((op1) << CP_REG_ARM64_SYSREG_OP1_SHIFT) |         \
+     ((crn) << CP_REG_ARM64_SYSREG_CRN_SHIFT) |         \
+     ((crm) << CP_REG_ARM64_SYSREG_CRM_SHIFT) |         \
+     ((op2) << CP_REG_ARM64_SYSREG_OP2_SHIFT))
+
+#define KVMID_AA64_SYS_REG64(crn, crm, op0, op1, op2)   \
+    (KVMID_AA64_SYS_REG_(crn, crm, op0, op1, op2) | CP_REG_SIZE_U64)
+
 #endif
-- 
2.43.0


