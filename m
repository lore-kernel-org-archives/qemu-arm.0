Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59189C83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 16:58:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZuaw-0007Na-AA; Thu, 10 Jul 2025 12:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZuL3-0003R1-UJ
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:41:37 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZuL2-00018G-8Z
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 12:41:37 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-b31c84b8052so1528726a12.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 09:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752165695; x=1752770495; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=NxrXbiQN9yu93AEExV/fCjmH6OgZB1JuTjSsrV7nUW3jopBDcojbK+/zETaCuXFO5u
 +bEPKPmggEIOQeqSZgoZPzxcmS3iXFde8Yjihq3K8WdfMxCYP6T2xQy2s0G2XShi43eA
 xjK26EEcNq/gB4UVei2HCA+e7Brd5DbeMT/FRyV5M5usM3OTXNtGp4naZsHqZ5fHzrRw
 Yo7WCUF8Gh6W3xg0wFB4hJj6oHvyTsRpcSl/GvWes/Pt18E1vHUgx3Tc+TcC6efCJeqw
 Tk/8SkhY2DpA8URs9z4RnKEaFMgULIPIf2v4oVSiiu3KKmYpgEM+0WuutT3g2ecyOPud
 ptzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752165695; x=1752770495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=GGWdPJYLuBtU2qO8/K952qr944+u+m33lxDrOr5paZOsDuFjUhVjweWfmBfE9imtGr
 fwLKRgZYGauwfKc22G1WEUwEmjjVF7eNfA9CawxDso3mlc7xro4Mcnuuck64HvI3WCy8
 Ou75DFge6Unxv/Cz4yeHb5r4X6AvGn1ofP4JejUEvZOKl0lra83ZQ3RSrJ49gkPawg1s
 bIPhb1cElWNHgNmMLUdjatYNH8ZF9WPnTHZB6/lSva0+K3aCeFgxn8MQgaqQH1JLAQ2o
 mnzY0OE4ELAj8J1lehWEvIeCfPGtZ7lXup0lzCIxvTNpEb3AXMxDXNPMB6FEOU2f6br9
 FqIA==
X-Gm-Message-State: AOJu0YzCphx8Uw/3pdg/VBNESWdJJpF5brx6119s9BAFOUnktBZ4b3+1
 2DJtTzKjaiRtihtpx6QO3zIUV12nmM/PT+oNgmrTsMXTLGuqY6fSFkS/46d6LFMGh1OXAhIdfVd
 t0sjhFgk=
X-Gm-Gg: ASbGnctqPy6I8SqEvQ0u8W9hSdPw0Z3UdGWP8T679a1CusuZFlI7HZ+R3D4TJKI/c5y
 L0pUFW4pNt3PlJjZxB7bx9AqiZAMy0hcQbWjXmiwE/8yoiSOdysGSYFMfLncH0azDbhQ2RprW4k
 p1WnERXuwCMfV7GMgBGWpi8b0auyXhlKpqkscCmlq0bc3cjsab6v+OWfeK31YGNUEo/x25Wcaig
 eLJ90flCBxTAxIIyp7KSStbcHT9i3GZ/5LPWTVs/1n8v0e545monJeir+aEBJt1tMJVh5rFEnl2
 Hz3vSdm7mkFx09WdORhxx6l9fe4NO6Jix9matVKOPoPG1VlPBswYfmG0+lZk7t0apDEFFcsiGsz
 3XaSjT+C+DeILrIW3xYYSxQ==
X-Google-Smtp-Source: AGHT+IHB9V2Vzu7afu7FqCHdjS/MfXtdEF5v+MV/DVnXUBFRlomNYDMZrcS7AKccHT6yeSWFB275eg==
X-Received: by 2002:a05:6a20:ce43:b0:1f5:889c:3cbd with SMTP id
 adf61e73a8af0-2312050277emr89472637.35.1752165694709; 
 Thu, 10 Jul 2025 09:41:34 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f5c7f7sm2919119b3a.142.2025.07.10.09.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:41:34 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 1/6] target/arm: Add the MECEn SCR_EL3 bit
Date: Thu, 10 Jul 2025 16:38:54 +0000
Message-Id: <20250710163858.1094780-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710163858.1094780-1-gustavo.romero@linaro.org>
References: <20250710163858.1094780-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x52b.google.com
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


