Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4121756lfb;
        Mon, 26 Apr 2021 12:38:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4lsESUphs9TxHsYx0axa55gQmoEwzrO0utChjlXUDWFDLl10n/8+1PJV3st6rvE3/DG6f
X-Received: by 2002:a05:6e02:1b8f:: with SMTP id h15mr6615516ili.151.1619465916547;
        Mon, 26 Apr 2021 12:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619465916; cv=none;
        d=google.com; s=arc-20160816;
        b=H1HYaB8V0pDqittwU89krFOsT3ON4GPPbXXJupPArq4bLdJRWr5yYpFYWRTZTF8HYI
         K4z3imubvdvy5cMcHl7/QyDXyQ/zi57UKtgQmGln1cuBJYQTvwljjVP8ild88DCTXpO2
         5QDgb0GgSaz3FyGDDgVcUK69yAiB3G3y7AA9YlBQUITN7KWvqObl+gNZeycb20M/WheU
         zWqQFHLaDe0o6phHYxLjLA6vDHJPT/BXlHm3EubEyG909uMLQLzEe8SCw9ly19/BkFXC
         hvJBUKNSY7zGjhwcY5+mw1PcWdRYaHBy4/7IJnwsbfjLQ314d1Ia4sZ7BdXhzkaoAwOM
         PY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=m3J2o1342PI/Nwq9CiNtPMcwkrmRbYFAeBct1A9GlkY=;
        b=OWFV4EQjenYMwyWkpnvdJwgxx3DQlZ0gAItWYJmSH/vRCKF4qRxM5cppqXw7797H+2
         13qYD/CXVPp1Y7mM5EbebROgeS4baLE5+38gUOfkDtqRpma/mxX77P02LXA5lczt3o1Z
         1l58gg0SZD4+UsxjJDKfiuhTSTiSF/Bqwupphwe+ZPPqwOft+2R0aOVy6XmN8pMqUhCM
         Pw08S1VhqdFiVL+ClGyt5HSNBnFpDAq2XDvXGDGZEAKahGBXtbNJQCnUzGYQId4pxSAN
         P6VBqcOhWFjPO0Oe8HzViv98UHpzBsRUQHb5l6lgDFMM22Pkp/LgGNoAL7hG1fobltGa
         ZW8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ARCUG6HC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si17802770ioh.64.2021.04.26.12.38.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 12:38:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ARCUG6HC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lb73z-0001pI-Si
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 15:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb719-0008MV-K6
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb717-0008SY-1b
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3J2o1342PI/Nwq9CiNtPMcwkrmRbYFAeBct1A9GlkY=;
 b=ARCUG6HCTCM8kbuI7KMPQ6bPGBFFd2UshP7XIYU487in/wiLznWPEry3RDEwlrUMzvHks/
 fqgZItsdUdlxq1MRb8lse4IZx7+kDWxXPnCNXELRCtpMbvRxmFJyB8Rk/9KLr5yEb2E38J
 1IVqzrLsId15Cq3m8qfdumjMMHxzULE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-0qRbIjXOOR6pkvji7HNfwg-1; Mon, 26 Apr 2021 15:35:34 -0400
X-MC-Unique: 0qRbIjXOOR6pkvji7HNfwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 t7-20020a1cc3070000b029014131bbe82eso1480559wmf.3
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m3J2o1342PI/Nwq9CiNtPMcwkrmRbYFAeBct1A9GlkY=;
 b=e2vjpFqnA3FV7v4ov4g6W1LqGb3/GvnJjJIzciDz20KGKMBMXDg04SNeL1qY45VpDD
 8839eE2WzxcbCyPCcsrgR0cFLzFnI322y9XZvReE0XZslTi6ai3drE18acAvViJRBoRp
 br2uW8p62hkOMju1ZSCWIDGHdGf88sImaAGVWJwZUgV+XKsB8xLTcfqqzsmzw1Ve6oTi
 WWIYXnLD3VtDHvzbjs1cmEacJjvS2FcKfc6FmqkjJD6UkB8Oxkz3GABhuB/5FSdMjGa6
 F9la+ICTcpo1sXvmMJ9/h0LvgW3bSlucMbZIih3SsQmqdWQuHPn7IAEp74POiQJLZbJl
 q33w==
X-Gm-Message-State: AOAM530lNrA/f9sic5bWY/Z1MtuhXzToGyNRWyZWYOdf3ElT2PUwq93o
 tBwWXmpjaqIqK6fKhnyKZ/A6w7bWONpFRmYTp/63uSpN2Tb5NQy8PId6VeMW34b5mkNr1yEcYsj
 RZ398oo5hhQ1+2BvpNanGxo+7BuDw1UkwdH0D4Qsc2bC9d4OTKEJGZM31hIxhrpXR
X-Received: by 2002:a05:600c:2cd6:: with SMTP id
 l22mr14768517wmc.160.1619465732195; 
 Mon, 26 Apr 2021 12:35:32 -0700 (PDT)
X-Received: by 2002:a05:600c:2cd6:: with SMTP id
 l22mr14768489wmc.160.1619465731909; 
 Mon, 26 Apr 2021 12:35:31 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i11sm1269242wrp.56.2021.04.26.12.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] hw/nvram: Rename FW_CFG_MIPS as generic FW_CFG Kconfig
 symbol
Date: Mon, 26 Apr 2021 21:35:15 +0200
Message-Id: <20210426193520.4115528-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D7FOmPQectqG

Targets using the fw_cfg device might have architecture specific
keys. If so, they define the fw_cfg_arch_key_name() function.

The use of FW_CFG_MIPS is not MIPS-specific, it is simply the
architectural implementation. Rename it using the generic 'FW_CFG'
and move the Kconfig declaration in hw/nvram/ where fw_cfg code
is maintained.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/mips/Kconfig     | 5 +----
 hw/mips/meson.build | 2 +-
 hw/nvram/Kconfig    | 3 +++
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
index aadd436bf4e..bbc6b9c1d11 100644
--- a/hw/mips/Kconfig
+++ b/hw/mips/Kconfig
@@ -42,7 +42,7 @@ config LOONGSON3V
     select PCI_DEVICES
     select PCI_EXPRESS_GENERIC_BRIDGE
     select MSI_NONBROKEN
-    select FW_CFG_MIPS
+    select FW_CFG
 
 config MIPS_CPS
     bool
@@ -50,6 +50,3 @@ config MIPS_CPS
 
 config MIPS_BOSTON
     bool
-
-config FW_CFG_MIPS
-    bool
diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 1195716dc73..893e56f7453 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,6 +1,6 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
-mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
+mips_ss.add(when: 'CONFIG_FW_CFG', if_true: files('fw_cfg.c'))
 mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
 mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
diff --git a/hw/nvram/Kconfig b/hw/nvram/Kconfig
index e872fcb1941..cab1070375f 100644
--- a/hw/nvram/Kconfig
+++ b/hw/nvram/Kconfig
@@ -1,3 +1,6 @@
+config FW_CFG
+    bool
+
 config DS1225Y
     bool
 
-- 
2.26.3

