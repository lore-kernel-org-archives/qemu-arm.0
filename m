Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15CDCD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:35:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPe-0007yI-1I; Sat, 16 May 2026 20:31:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOp-0007FO-2v
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOi-00051r-NN
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:29 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-838d0b7c950so756057b3a.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977820; x=1779582620; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wl6+4I26v8HYA+JJlHEMinIiz3qcncuhnbxRtIcqZ1g=;
 b=vhy+qo4t8cACiidz1/LgBP3W0ZSUqXJJB06eclbYEG4/LrrKE2FCNtblUrH68pg3ao
 KK/EjaNbgOsEmZgSSZyu+kDCscg1xAHbi0DffGK9zgdkEOsDF5RfZYnzWUotHvdwxADo
 T1xJ8Ya6TeRnYbY9JnLUTLJJY0WsXfd1aL6WUQtY7lbMHXLV2DtZKK281Gxu8U2BXW1s
 CcDAE4YkPp/hVyyeZYibGO0iyRdA/pOypHjDIwK2TC7wHgXv4zGmJlDZAIUT7m3xHGiv
 wfcbK12vKcpMP5KPOyNLjz4l7DtZgWxeTuq7YKzCY+KGZl823CKQJLZKJjSTH3ehdbf+
 ZAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977820; x=1779582620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wl6+4I26v8HYA+JJlHEMinIiz3qcncuhnbxRtIcqZ1g=;
 b=sCWWwJeFITwPRk//ZwCrB+sNZq63jKa1FyJU2gQSZbOdyr28lCv8Rz2RrKtSCxlmd6
 c/Utd4DyIwgj5OZYkObVwLlMgOl534V94grP6awxVFoVS+a++rmONITLAqomRK0yn6x4
 vx+uSCF9804NCNxeZmYoud6kzGPbk5C4tm1zxv55AQKoA8SUZd6H7LGL3GQijweHAO62
 8FSzY8x6Q4ba+4flW6oTrIw/LT8KaV8z24cPtr5LhHPpj68dxHfsMVY1Yd3rOyHALau5
 K0B7Z4vqS2u7EbQO8Icn23sYH8NtmDYnbqyHYVpW8tr+EFEUO10ELumD6t7jcbCFWis/
 /u5w==
X-Gm-Message-State: AOJu0Yzxq0+CrwXhaZ5nnOR1VqnbejupVPtMrPyQQKZ6wWJHik06yH0i
 rMm2PMI88dwDUmNF3IotPcBKvueJke3eCrxxf4nrkSKem4YpRxbbjPHh4SNZ8VfWE/TDPuJDQSc
 PcFiz
X-Gm-Gg: Acq92OF0DXw75DzYhOgmn4qupK7sKihqJhYTW/ie7/WIps3C5zhmYMseuXcaiMvc6Qm
 OywtA0WsfaEjT8xFqSZzn9fG+LuU8nkLpJvzwoyn9077WcyxrfzKtrTak/YsM3+JykpJ6eaXaJZ
 WKWIVmi0+rk2/s9ZfMCK0gxsrWM6+fypro4I0ZEUKntcf7TQXGCLyREMR4+02uGNR1O9TsCV2up
 898Ky5HjIKSWxXZRbSsu5QsYoKlkqO0nrM+8KgrreTeHDpwn8+XfH0qSyQQCX1gRyfIP0Y2F+WZ
 x0o7CzD40WzRMpiEJAMSevxBwSCPHsAL6XHkyyhy0lBSSUd8hLGOntOUpmRLj8f5VOUfSEYv6X8
 7QG6MIe6ySPe7QcSoQggfOawcYdLNUidq7aEi0kmUJw9FmtSNqP56ENJihVF5cqw1iJYH68oulm
 Bdq1QZrd0tnR5fdQyP5o4twqJGkiMs
X-Received: by 2002:a05:6a00:3014:b0:82c:dfea:9e2a with SMTP id
 d2e1a72fcca58-83f33c4d95fmr10807174b3a.2.1778977819880; 
 Sat, 16 May 2026 17:30:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 18/63] target/arm: Add isar_feature_aa64_f8cvt
Date: Sat, 16 May 2026 17:29:17 -0700
Message-ID: <20260517003002.321430-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
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
 target/arm/cpu-features.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 1bb77d78da..1fde3e9231 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1569,6 +1569,11 @@ static inline bool isar_feature_aa64_sme2p1(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) >= 2;
 }
 
+static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
-- 
2.43.0


