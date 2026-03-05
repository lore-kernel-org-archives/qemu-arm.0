Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7554CF513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:10:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGst-000123-Mv; Thu, 05 Mar 2026 17:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsn-0000zI-Cy
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:25 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsk-0002Cw-8f
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:24 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4836f4cbe0bso73577345e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748560; x=1773353360; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyEy/g1PEDGl9OT2R7W8yjv5uTeT+1EIBQ0lv6lijmM=;
 b=fdim6hrI3t17YZ2DdIjHL5Hml9aWGFOBGmgjkRXdiGOBc+ANX73CqjMjQudUPoX2Ue
 fh3RWgEP5HNOGLxlhAM7xR2HVc5K1SfhKB/kLOqWUm0agDRUqlMB0aJ2lTfr/yzpS+7r
 CY7J3W7cdlZMR6oD8oxVjhY/GhItYgu2UIifom1vb6oxm7lOk/jt+xUJ6eElvNv1TH1M
 bM+4DRGWZ2Gh8yxT/K4edZPtxSPwXJ6k+5N3ELvmBvrqdMulkiAuiwQgtjzEREko1mt5
 Qkr+4BoVS3h8cZR0oe8WHZuTdICXdz2ZfNOQFa78Qe2tdt8Htjfi2B+RmwbTdRCUY8df
 U+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748560; x=1773353360;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UyEy/g1PEDGl9OT2R7W8yjv5uTeT+1EIBQ0lv6lijmM=;
 b=RiLI+c7ed1RP/NZfiG5dSTAs3UvNwF2+l3OJqKf5B2F8iNMpqRDcB5wCOgkmZQzotO
 IyVk8MBIsykf/h2yzP+dmG1SJR3XwucNKhcEspUjww/H/1QjxvL5TMOb4Ypq8sry48yR
 0tL9njNneqmEvEH0anuYPB3UGUootbVyEwQ2JCo+O062dKNC9Rca+wsN5EFbnSE5pvmJ
 W7MhyGDVtOvbHxoQoaP/6xljUpu3evG/qn9pFvHOJrqOx1bksSetNIqe9pELo4VSMV3e
 051I4fUvL9CzhSZlSknHIeDvbo0bb63h0M+huU5y0I3dIheJ5TlmbvOvLLh366PWpE7L
 Dqvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGq1S21Dtq/xpC+i4SdPo/hv9U2Y++zdBFreNobu700W/Yb8MYNNVCt0i+we5Uhz8nUXtmlvYgQg==@nongnu.org
X-Gm-Message-State: AOJu0Yy9yOSY+KMsZ2VL7UGIE1sNwhl1lMve7zi9Smj89oUw10z1PaB6
 fxBmiPXAgFktN0DkewEtkD0p8846O+U/HFu0cgxoTdut6ytI7k1oJxCy
X-Gm-Gg: ATEYQzwICSWCYe0jkM6uPVWR6j9jQ/rzmS0oOko3BWq7+IIURkFrDATpAMUi7vTT+h/
 UpB93mTLqiCKeBXEXykQnGyHWtp5oGgfPJ/pSoCMEjCioeq2wPt70bFSDfydb8ZRjmAYDFMiE5W
 Z+S5cnBWmh/zeFzRaRj0uzEe1nPou3qIp8vVT06wizvXz3Do+oJveIlR7CYlyrD/yKxonLF51SQ
 ggE5OmAYN+atIYN7JxrmG+WdcKn8lRuxNs0kpJqWeYzxCBVEdMIe73Ej1mIjDd/n8xGK+FzofDN
 wjM0X+iBfDvZJdYEHWvDO0CRw40/P9BgDOcENZazN9sSngf6Fr+HePvxD48NUbSv0UEu7791YOl
 VxHMJANGfVejtnCaPYzfyPjHfGBuClRUo0+/jo6WJHyh4j/LE77urtZ4pvdGFh4Z6A8zczanimY
 nAG3q2fqDiwL4Il3DUQVBhuNMqD4kyCj4Y0wAeZLsDjDM06f8hGClovLaUgzJNy7KAQQ5Z797mS
 7SgBYEpZMZCI3JZJF/dLKW+kWrThqtFiEG03ssfsv4S/go=
X-Received: by 2002:a05:600c:34c8:b0:47d:8479:78d5 with SMTP id
 5b1f17b1804b1-48523592d6amr17649355e9.7.1772748560440; 
 Thu, 05 Mar 2026 14:09:20 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:20 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 01/14] hw/arm/Kconfig: Fix serial selection for NPCM8XX
Date: Thu,  5 Mar 2026 23:08:58 +0100
Message-ID: <20260305220911.131508-2-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

CONFIG_SERIAL selects the internal TYPE_SERIAL device which is akin to
an "IP block" that needs to be integrated with glue logic. In case of
NPCM8XX this glue logic is TYPE_SERIAL_MM which the code uses already.
Fix Kconfig to select CONFIG_SERIAL_MM which matches TYPE_SERIAL_MM.

Fixes: ae0c4d1a1290 ("hw/arm: Add NPCM8XX SoC")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c66c452737..20e99e52b1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -493,7 +493,7 @@ config NPCM8XX
     select SMBUS
     select PL310  # cache controller
     select NPCM7XX
-    select SERIAL
+    select SERIAL_MM
     select SSI
     select UNIMP
 
-- 
2.53.0


