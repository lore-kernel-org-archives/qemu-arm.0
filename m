Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386C2CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:27:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqb-0007v7-UK; Mon, 05 Oct 2026 06:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmW-0002I0-2n
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:57 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmT-0000zk-HN
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:51 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f635552aso1126369f8f.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195526; x=1791800326; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RMh0wnw3agFF2IsElQcMdXFWf485YmO8ORQx8WUZoWU=;
 b=qKNrbwO+LHyxFxMczEgKPswMfvWEVMCZN5kVGPecE/eyL7XhxUf9tiwzF/6dW4Z2Xi
 cLbliqiYv7EVC46jim67DdJx6jjiF83jZLOm60czw4YsXqCLsFAiExPDFbPoALW+nwHy
 CtzC7UFsUpWpXnaAwesyragaN8REogTK0/Gx8e3FBW0owedgU8H1ubIhc6JjBdK1KFwH
 61lxrzYQYzEuo7TPXAQkKu1e1cCPt0nR12Pirzh1MvzSMZhw0cYT+AP69z3a5W9V2k5K
 fRVs+5MhDqZbPwN3RqhXUuoS1K0iT2XpnoOgr7laiIp9geyfeuUfhq285GmcJjprH82S
 GzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195526; x=1791800326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RMh0wnw3agFF2IsElQcMdXFWf485YmO8ORQx8WUZoWU=;
 b=SzaPxo0rlS3NnOUO1qkxpRoIw4jx1T1cLsrG5Tx6jiNtPrbCDl/vIrt6kb+qN8CCFj
 7yNPPU2hxbh9vpPkREfVE6+7nHSW5vsB76m2p/Pos3j4sYkidtNjsLmdSCxx+O8Xq4uO
 2vdxAmHvdTA8cw85NSDAdCb6N2iA+hksTp5xm5Ol8zll5ffl5scIb8eFcCVWcibS0A7P
 w9P6ihUqaEtHCtzo5BlI7TyXYSgrbms1Hvi7y9qZG007RC1Lm/+xJxZnM20/1J7XFT/Q
 cojtX7vwCouWvnlq/JWVTzUjPBuwn5Rhd/tlXKoxpd1msEtsyBfWxe9GS5vX37hzzWmY
 GrDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBz6o1RreU3nwP6qFEUmm17CgbkU25hDYPV45XMyxt+T94Htn29IzScA8Fg+iAOzD+VwPcsnKNTpTA==@nongnu.org
X-Gm-Message-State: AFq9FYI9OPlYcih0Nil6crpMZyhZa1VTewWR59yYoaJP0sNolUN+KSbi
 xRZoYofgXSZZTkwvIkc0lz8d3hM9deYxkRZxN2aUucwjigwxzxJovdgg
X-Gm-Gg: AYBFou0ddk1bdl6ziT2aWQvq+m8sQ1A/8rAPxFr2R3L4J4X2SYe7e1UX8gWx/O6URdh
 2IvY+x46mrvfAWP5pqSVlmkW8XKs4xa9IpZK+Kq33FmqEqwulFANJbtntPhrNkCQUFwCBKSStlS
 J06ITpbKiNVzZCKKnPflBKOsZvIVXVJMON9jsMAOIbh4TOUswk3PUihlj2xl2fB2eg5miaoAzyc
 3S9MVOc24xDUOaIGPpkU0V5oILxrgy9H60D/c/0wMEd9uHed4q36YU5gx1MJs7ojsf4F08T4ocA
 Hp8M8SDBoJTSG4Ox4Ga5GalHTs+b2imp7FpauhkLxQVNzuFwsbHxbvdG/6up6KEe7Ypg+qBUIYv
 7NmGHqCBblezsROLgKCnjpqVDN1yuQb/5Um0YOgAMojS49xHjnetzI/Gqr+rO+uHx58EXVX78Rr
 RwMgyOI4FGXuS9LG8Y6zQMm9mhyTlGUo83jmQmpgjpzwZv2Rd1AY18LKRS+qprHGa+aBg+wTQTd
 T65xNSCvuu4IgCYuRxKfAqKpZfxq1jdm3L7vgJuQFHsUvpO
X-Received: by 2002:a05:6000:40c8:b0:48c:5785:9b77 with SMTP id
 ffacd0b85a97d-48c5785a1e1mr6214528f8f.27.1791195525257; 
 Mon, 05 Oct 2026 03:18:45 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:44 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 17/31] hw/misc/Kconfig: Remove redundant USB_EHCI_SYSBUS
 from config IMX
Date: Mon,  5 Oct 2026 12:17:44 +0200
Message-ID: <20261005101800.10821-18-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Since commit 464ce71a963b "Kconfig: Extract CONFIG_USB_CHIPIDEA from
CONFIG_IMX" all relevant i.MX SoC models select USB_CHIPIDEA such
that selecting USB_EHCI_SYSBUS became redundant in CONFIG_IMX. Remove
it.

Fixes: 464ce71a963b ("Kconfig: Extract CONFIG_USB_CHIPIDEA from CONFIG_IMX")
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/misc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 46e3c03cc8..d1711433ef 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -93,7 +93,6 @@ config IMX
     bool
     select PTIMER
     select SSI
-    select USB_EHCI_SYSBUS
 
 config FSL_IMX8MP_ANALOG
     bool
-- 
2.56.0


