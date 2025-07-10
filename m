Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627F1C83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 21:13:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZyXq-0000VZ-MC; Thu, 10 Jul 2025 17:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZyXl-0000U8-Kn
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 17:11:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZyXh-0006c9-SJ
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 17:10:59 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-235e1d710d8so19659685ad.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 14:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752181855; x=1752786655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=ofyjf90Pg16wJUTe9NEO9WaOKWpdpYOn6/j/AkYngzHXeU+RC7Ipch0A2yYjEGSKVr
 BVmdBTQpk3R7eviHbjE0O74zw3DcDPirfj8i9Ovnfs6D1l462B5PvLLvaS0by4UlArcn
 jxyu5Snn1Tim77qmeZf8Z6aSaEJEqwGnViMa+GKYvIRjq4cYWWLsxNvvN2bLDTNCKhtT
 q7BdGq9ZWEnOxxdMPxJmPrtZuDxsX6Z+zUCjOUbW/W8kmB/aS7HzVwP39U4bdIkQHw/s
 RhR9GQv4Qjdcwvbgm2eComA/8W38tZGODzGdEvM780qDsbk/4fUAoUorBaRf1pKexlya
 UM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752181855; x=1752786655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=A3qc/Fu5IGq83hvaY2rb18oeBMrP6R3rgX3PO9WDbfB+zSUDAtaQYMc00h60noqxGs
 bv7LcqfF3wyeJpjjW4xSmrM5WyZJlbTCatnqE3WE7VWudgkbNuoWnvNSCUKiILQxjgVD
 5UVDxpctAYyN51dTpcuEAIfBB8ZtOFWSbXhSCMQjJzTEUiKYFN0tRx617J8TEqniITa0
 TuNQldIQdxwsZikxF9oTbp7tAcQKPZehVuAMIP4C4lYU8K/ESXgoYpM75B8CLabbFdO/
 rKN/mM0VFmITrJrQB9sHq9mmQzfIeXU1GG+54C9tfWDGd8ApYcfAnEvj++tbb8GvjhB6
 ogrg==
X-Gm-Message-State: AOJu0YyUlip/9j5W1RCa2XedFcU4UWlQxv40gVBinP/jAxAJy1SbAAzg
 8PscKU6DuRd0Vc55wH6mpKNV78CrpYbZUT+hNkF1YLs5PRKJyt6+K4ERBoPpZWEtpMDxKPX4+iw
 IRM9JH+Q=
X-Gm-Gg: ASbGncsY0bHv3HISlVEaBK1gq6ho4JaoIQtyDde9jx5VC50S2laFdN2qv2pcLctJaKA
 pBoWpcUZdN9g9+BOUOJojuMtWVENFgOgI8zBXqeUkxFo6aAf6ja9dx/+f5fzfw3JB8lSsDOb/1u
 8+qxk3qyoGfT35k9WBEpyPEv4aXYmnnBDTqx78KUdkE8kekMmTxm72cxxchjHD/sO7SsUSU1tN1
 q5cgy3Eenbq3maV7eWsCKA+Gx2mXWcHIoD8aI81o1I1p6EQ90ys98QkVudA2vnX09ez7XP72wHX
 n4Bx3KEmknK9JGq1SHb/JxPqcd/mkIJ1B235cHrIz2rai2lrntqzx79I+gnpTrgxxe6rmlILYfF
 YGpZ38ZtnNJVfFFL6Ah6XdJBSkcmT6p6glVqjXrCxWFwpkU/eMl7tQcniFw==
X-Google-Smtp-Source: AGHT+IFjvy9s/b0/ogkYqDCs3lNQdLvnHAhV4Ukb9EsKXMqntoyQEQ+tOFyDtLocoOIiMfcaUX+vsQ==
X-Received: by 2002:a17:902:8b8b:b0:238:f2a:8893 with SMTP id
 d9443c01a7336-23dede984b9mr5877645ad.42.1752181855268; 
 Thu, 10 Jul 2025 14:10:55 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de434d6b0sm30447775ad.203.2025.07.10.14.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 14:10:54 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 1/6] target/arm: Add the MECEn SCR_EL3 bit
Date: Thu, 10 Jul 2025 21:09:36 +0000
Message-Id: <20250710210941.1098088-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710210941.1098088-1-gustavo.romero@linaro.org>
References: <20250710210941.1098088-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x633.google.com
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

The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
EL2, so add it to the SCR mask list to use it later on.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8cf0ab417..0f64c7b163 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1717,6 +1717,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
 /* Return the current FPSCR value.  */
-- 
2.34.1


