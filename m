Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B7DCD4F3C
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 17:49:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wP24i-0005VD-L7; Mon, 18 May 2026 13:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24X-0005SI-Cp
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wP24S-0003ls-IL
 for qemu-arm@nongnu.org; Mon, 18 May 2026 13:48:07 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b4650d5f5cso9690605ad.0
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779126472; x=1779731272; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sUSmtVvY1NQk69uLXjxtFtfhPh/zNM2c1Alkm2srAIg=;
 b=TZXjXWE2yGvlDHFlo50NTC6BbTWLibvMMj9x2DM91Oqjn3177shQXyYWDuIq3RiS18
 jdl363Kq+nvT41QNhoHwEGRhjc0+pvAWd2UhXv7iNohBXuxxYmufnb7DwaZLvTshgeBv
 6nMV5VdRGqkJv5nSokZmYDUUyzq2SOFc9YjhBZoEEiZTIokZ/ufoqXEAmzaGULW+YZhx
 lf365I8vpLvilwTdYYoabwHtHBXOjlq2ROifyqXZW4LqwbAShXpu4uOXMMhT9WgcKI8x
 uNVuwSczlXn2Scjq+d38dKFs8ytasgIAY0xQUh8AlQckPv7+q5y3gQWnfgAQdeUxE8gD
 PzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779126472; x=1779731272;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sUSmtVvY1NQk69uLXjxtFtfhPh/zNM2c1Alkm2srAIg=;
 b=ML16KhkUG7thFFnbN/WJxxwq87yz7ERc4azbhfhhhOH1C3dh7sotFapl9LkUz+hhsw
 VL+qBMSwY78fOS1097XJKGEdB98dsEts0HBnozhL8c/W9unHtIwGwdjyilAhB3rteqZt
 k7PtkTqSZDY3oXpmtV5OaiTTLQlum0zkPZ1a7p1OO4iL3Wyf2FVv9FxjvLNfd8RZ59MQ
 eiuaeq6ap89CDmeJ4fcTAV6E819kuHzxRC+ACX56l92rGNUK75tbYydkb1K+MK/aa1oj
 6GhCCE/dxOniHP5OllDwGLoHKWB0wYF+VIQEZiU6b6NyIZrJp9TPud1XmlqEscKeFuE6
 LCng==
X-Gm-Message-State: AOJu0YzfQ2oKLjWZfqjfABk8wuvlzOF/9t9JTSRkV5JzmTuctzFJhBkn
 qOW/ELzRlBVqOAYChe366ZD7sj7WRDKXibGD/DQN5EUnimfxekpN4NAnRngtD+aVHts=
X-Gm-Gg: Acq92OHRNFDSgB8uVoEdKcKv8c9SNjZkEiHGGcHBnt5ZxkRL78B9uwEAcRlO6CXVro/
 VbLvG4FH2Eb5jX7MD9Hhq1lnop+6F+8JPqtUNd8Ks5svAbHbm2GzbL+jbca0RDX7fUDUY0z0WfK
 NZ55NKmV2PO5Rq7XbG9adLPIc2uYwMq0eqW5sTf3tV28ATYm0EVHTZMxANwiXwbM3yA7wVjs9YU
 6WaTBvk/1FOnE3wUjQkTcpwULVL0JKHLvSdiwi8DD+yiy3C9QrO+DEJlqHLt6fL7abeWU7xeUmC
 pVedyZnQCChUDBUjwZJMEFkcZCUtg07A+qoU7fgeiGBQ8dHdR3P/qTIQT46j+g0TmURoc5MGX7w
 whaQFGFqbpOzdG3lcLQYmwvTqbfMWoYTR/3fLtj+h3QOLqbcwqx1kLONKsnUJkpCiiPdDLnKR/x
 6W66IPLPvSHXsbJ+QV7bZh4bF93I6a
X-Received: by 2002:a17:903:13c6:b0:2bc:7d5d:e2b7 with SMTP id
 d9443c01a7336-2bd7e9a7de2mr181034645ad.36.1779126472308; 
 Mon, 18 May 2026 10:47:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bd5d12e38dsm157334905ad.77.2026.05.18.10.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 10:47:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 1/4] target/arm: Add feature predicate for FEAT_CMPBR
Date: Mon, 18 May 2026 10:47:47 -0700
Message-ID: <20260518174750.660258-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518174750.660258-1-richard.henderson@linaro.org>
References: <20260518174750.660258-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4e44245a8b..217ab29bb4 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1043,6 +1043,11 @@ static inline bool isar_feature_aa64_cssc(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) != 0;
 }
 
+static inline bool isar_feature_aa64_cmpbr(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) >= 2;
+}
+
 static inline bool isar_feature_aa64_lut(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, LUT);
-- 
2.43.0


