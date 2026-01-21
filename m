Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB3AC44501
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 11:00:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viVw4-0003Rv-LH; Wed, 21 Jan 2026 05:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw3-0003H3-Ah
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:39 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1viVw0-0007vq-7S
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 05:59:38 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so52609515e9.1
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 02:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768993174; x=1769597974; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RG50ZDgzoQMcE4uqnHhEtV8fGmPFdMbTDjZdAlEHaA=;
 b=mlFR+aWG7aUnPIrLfhtK1eGfHamk64HfYUv+enKxCyRovEbRe3IzhDRscjT+OTauie
 J6PVsMMlaf8WiiOGEKycp6nF81Bst9KtI0CfbB3Ih553kVyYc38XJyDh1t2WzA4PfBDn
 GNT+QJOifEge0ZKZvF1DZQRKE/TpZiTkAWSgkFvFC35bCTPgkix19Ck1OR7u/+le4TTD
 tgmG17u8hAnxh6nPkf10SEV5hZZ6j3kWCZkeQP9LrIlqCn/KKkukyNCxaPLwgfaERznT
 k/kkXVy/1OiJn4DmSatYeKAysK1LfWj8czi+SkvMAf140cy4Q/TnN8Z4qSCL1qodvtdr
 8kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768993174; x=1769597974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4RG50ZDgzoQMcE4uqnHhEtV8fGmPFdMbTDjZdAlEHaA=;
 b=En+xpejRr8Ux6JpQqrR7Rq8jpfQBdVAFXXPCYlUqViiMtpdxyfx43gFFsJnn7SJQ2R
 +5aQX/C1kukjwSopMG8IHFNYPfBz27Anll+DydCj1f09ptY6Nak9g7wi9vDHQAJ22zky
 VhcX6Sf3p3HotUz0Osrt4wa+VYlTKBv1HzhGRrzJ17AG8K6WxfZh0P8ECOH3cdK8kki3
 XMajKUAW3VWqiUajckFifNpbz4Q1bD6Nflh2MDosZ+oIa6AmnmGUea+nwo+K4VQBotsL
 e46Je590n4zORG9XTGrw+3jIK0/1L9PE+eG6EIcQLsNJ10+jkre8VkMfV/bvsXjgo+CQ
 zBQQ==
X-Gm-Message-State: AOJu0YwoCHBA5t2/AEOxjyjXXBUtMYw31mmy3OPEBwfCkk7VwUdAz2uV
 9KcFRsJnCQXtDR04CSOAlO/0VHttBl1s2bcK0TLDGDoc/C6zoOVx5yQEiLmTos+U9gs=
X-Gm-Gg: AZuq6aJAh0C20NX05huTRKi93+ZuYaZbxlL5KegcxVmDDuXmavqARA5oliANAF06Zik
 aRp6HScErc5kQTNwcH1Lho+aTSyvZYCYtzHF8d7yGYX9zLEvgHGHcHry+K6w0Ae+Oe3Y7N9U5xc
 cV/ZmLUhv3WvXqMWAW9qzPNpj7kVFx0lj9RAdVYP8c8261nSXSL3Skc+ta8S3NaHb4d0HuqNr4Q
 NC5vNA2vSL8tEF2yXEPoDnMzcVDK3zm56Cacpibw72llK/s0NRSW77fMlQin+G11sS3iLYJOnkZ
 Z3YIskB0NMtsca0ZO2PY2AK1uYJG2z+ctJgY4kAP49ofT5i4vhh8p/n7IBpKUfr3Mi1Ii2Tqh7E
 UZPlyTg09ENTKtBqFL6J3FB6AqOBOSMMgpNyyOH0c4te3r6DRY7wXux+lj3MHTOc2Mxeik7f+WK
 C9KgxGB1mmsybw
X-Received: by 2002:a05:600c:1c17:b0:46e:761b:e7ff with SMTP id
 5b1f17b1804b1-4803e7f18famr74927105e9.28.1768993174424; 
 Wed, 21 Jan 2026 02:59:34 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8c0499sm308709885e9.9.2026.01.21.02.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 02:59:33 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 77B565FE3E;
 Wed, 21 Jan 2026 10:59:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/4] hw/intc: declare NVIC regions as little endian
Date: Wed, 21 Jan 2026 10:59:29 +0000
Message-ID: <20260121105932.135676-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121105932.135676-1-alex.bennee@linaro.org>
References: <20260121105932.135676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

The NVIC should always be a little-endian device as big-endian
behaviour is a function of the current CPU configuration not the
system as a whole. Indeed the Armv8-M architecture reference manual
declares:

  All accesses to the Private Peripheral Bus (PPB) are always
  little-endian, which means that the PE assumes a little-endian
  arrangement of the PPB registers.

This should have no functional effect as the NVIC cannot be
instantiated on a BE system but will help the single binary efforts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/armv7m_nvic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 3a31eb56f36..28b34e99446 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2467,7 +2467,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps nvic_sysreg_ops = {
     .read_with_attrs = nvic_sysreg_read,
     .write_with_attrs = nvic_sysreg_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static int nvic_post_load(void *opaque, int version_id)
-- 
2.47.3


