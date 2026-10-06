Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE79CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:48:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENA8-0002Of-6B; Wed, 07 Oct 2026 04:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIHv-0002rd-N4
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:26:10 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIHm-0005Tj-IF
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:25:47 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c2e2db5e8e4so605077766b.0
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791343533; x=1791948333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sUBUYMm1004qLffoBCfnxHxkOtu1Deu7Cd7SJnpSF68=;
 b=I5Um5MIT4dUwuQzUFpI0JJYIhRc5ZEIWOJOcB32WFeWW52JZlloTsXpCv44bWOztTU
 tWVfTBQ5MD4kse1tRwstzgMplgRRyhVNM2WBu3Zx+gFAWX1MXkiROIJl3IwJN7xxQf1r
 h7xvRGktdnot94yOdtkxv6xr+lUodsqmg/xLdckh1TYZ6ZrUtpliYkxYKJZWs1njsSM4
 PGdFdHcEivC7Rqry2Rt6AfKk8vyNu7KW97IiEpMeX0MqDLq6twWk636R0sLoTBLU5AU5
 TNbaxFdiUkEqaSOApaEFX5+p1+koNaVf992LlBQd/asLOzEG3EBJW/Kscb8p8oGoPjcw
 TXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791343533; x=1791948333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sUBUYMm1004qLffoBCfnxHxkOtu1Deu7Cd7SJnpSF68=;
 b=EVnHKaMnS1xhqjwl16Hb6h4eaJgsgsVam1L3xvCZLnR37x94HXUNVIOmM/+j+qpEsr
 Owxy4XP/25DmIis5vhyQvMGb9tJrQjH0iWyrvafRbzEYuskzMM5ES++7G1gWGhbbese/
 P+A4qOnLTcOOBn6gpgcKsZ6NKWcFt3mKDFt/8/tDVo20KX2hXEFk52x62asm9xMFHzic
 ateYiDnnqRBwZAMqf3qCUkKywRWiH396XgK6G73nby1VUOZK0bIk7Sg4fneU/k+ztKEG
 7Kcr52BKMjwc0GvanqfVt6e2yg4vWU8GR/mR9vre+JG0B7k/E4zzuNbwoApPPb/Sgwkb
 WFcA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwwVhaaKQeAp1rg6orM+T+EOGKR0ywgOQ8RH6GO5jMSbDtnoUHQ7tBd/aHow6HbCo5E/hVquEldzA==@nongnu.org
X-Gm-Message-State: AFuF++lb+Cu2igL71VpKEfWrk7+4yqKn5jaTGgYEXPSBb3m53lTBviSx
 nScv9U+WRyJSilrvVqd9o+eb/Ok1Hw6nF8kp6Xs+GiSmwFTPoJjLTxfQWbjJ+g==
X-Gm-Gg: AYBFou2tWv9ZcmeJF8FaNUwrJPpJUgSKWgnTnD0pnaljSCrupdFJGS47VY8FBMXVuO5
 97deevU0PUlk8CScW6ZZX6/Rd+KocAp//JhifxtjPSq8QKu2lGiRdM9WcyH/Aev/Xb15EqOq4vo
 zKdEYFIZsb0d6SGio0pmaFdUv/sAnIby5L5V1IY1+WTFyvOIAIOSqx2kPjmxGgKxauVu0WR2FWs
 8NDrz7cT8/8YYw73zOlH1IvOJ3KqM5JIuKFQdicek/u3vXRYFituESJ6kPHKOyXVYwjl30Eqgav
 kjqKwspGylODm7KXFiGBKhSAOrtz4mISpsczhhUE7KEFDpiIl9cYtPob1+InORZXS7VHLunRRWO
 t6MDJY2K+RZoQtkgJC00IGxeT8q43BtfsV4dXNjSbBS/wIVVGuIysMGeZM2tYg+VPRtrpAi4u/K
 pFUAMwxB95RupMJwny4mjkQIqy94b77ACJc/PO1AZabvvM1F4uWgsWDcwEOCg38DBR+i/JaNC4Y
 ZDrPkpBlGQTL9EXrLND48SxtcMBSDJKSKgN92KgwALvDZtF
X-Received: by 2002:a05:6000:2610:b0:488:5852:6ee3 with SMTP id
 ffacd0b85a97d-48c47fe7a12mr16297550f8f.34.1791275725864; 
 Tue, 06 Oct 2026 01:35:25 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:25 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 05/31] hw/arm/imx8mm-evk: Fix reference count of SoC object
Date: Tue,  6 Oct 2026 10:34:17 +0200
Message-ID: <20261006083445.30362-6-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

Using sysbus_realize_and_unref() requires object_new() rather than
object_new_with_props(), otherwise the initial reference count is
subtracted twice, i.e. ends up being one too low.

Fixes: 7bcd1f30bc83 ("hw/arm: Add the i.MX 8MM EVK(Evaluation Kit)
board")
cc: qemu-stable
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mm-evk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
index c3215b11cb..6de0d9c4a2 100644
--- a/hw/arm/imx8mm-evk.c
+++ b/hw/arm/imx8mm-evk.c
@@ -83,8 +83,8 @@ static void imx8mm_evk_init(MachineState *machine)
     ims->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
     ims->bootinfo.modify_dtb = imx8mm_evk_modify_dtb;
 
-    s = FSL_IMX8MM(object_new_with_props(TYPE_FSL_IMX8MM, OBJECT(machine),
-                                         "soc", &error_fatal, NULL));
+    s = FSL_IMX8MM(object_new(TYPE_FSL_IMX8MM));
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
     object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
-- 
2.56.0


