Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp797098ejo;
        Fri, 5 Jan 2024 07:53:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHuRo0WvU7Zp/t2nsRGTO4oYuG71WG8ADSB7UBIyPVVZEQPz7jiPE7HL1ixbX5SSxP+6ey
X-Received: by 2002:a05:620a:859:b0:781:afe:b8f4 with SMTP id u25-20020a05620a085900b007810afeb8f4mr2285875qku.2.1704470033264;
        Fri, 05 Jan 2024 07:53:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704470033; cv=none;
        d=google.com; s=arc-20160816;
        b=d9u1ArhbF3TjH/S8tabEWeXLCLTFdwq6YhPAp98QKas0BSvJRqTaMNT1cvO9T/N6Jb
         kjB3abyEFANyJR4+pEt4bAh1+J38hoc8SiwBjnE9zKO28/zKOMoJgLBy4sRsUxqtxhMO
         S/dUXCnWaN2hrau9cUVavEjlW3uvB0ELK8LgKrJER3d5zv81shFmbuKePr84HJB/LgwH
         qzO+h2LvzIEb9rHsyN4NC69C9vAZBwRN2kO9p8oVrj+U4G8rGexstShN0H31HFlGtXtt
         v1ApKwuPWBwDKtd9WJ9gnhRot2AeH/pOLs7DBTGPS9Sp0P3JO9ypOl+XtFf4LQfV3RK6
         B9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SDwxzH3vS9V/d1nX5dyRUP+IK7/Bx5gX/AEs8zKaqSE=;
        fh=53R36PWsaLGjmBMV7qE1Lee5gWecQsJJ7THKvSL8AFs=;
        b=v1HAEWcv/qCgd+bu4nSzZWWWSmUepRoCnXb2Cx4ThS+ZLF6M/GJQ8aiXp9vbrTozwN
         mX8RARoh2UZZjUs3BoeJEjqkHtqZzIPliKyta1seROY1JVKVDoQW83qUHgL6I94kSs2G
         pa7MH5nhuT8FHEh8b8LHNzVv0b0j2uQZzEeXogltyhM5pDgGK8gm0DEKQAjn2Qk2p/X5
         mWbPWJ6jAMhqb/XY0vVYlCoTdnMcEyNYto+kkzx74MOswJkt1pHYHEIXWFTyBFd8ZSVU
         Zsu+AusAKnwY1lpzhehfDCWcF138VypI+xFZ5Bvb0ZrC+agKC1CHPu1pY7i2U3OsTlsb
         oL2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=serQmlLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a05620a294400b007813f726858si2060471qkp.281.2024.01.05.07.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:53:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=serQmlLI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmTY-0003ph-1t; Fri, 05 Jan 2024 10:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmST-000061-Ma
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:50:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmSR-00011V-M7
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:50:05 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso18044145e9.2
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469801; x=1705074601; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SDwxzH3vS9V/d1nX5dyRUP+IK7/Bx5gX/AEs8zKaqSE=;
 b=serQmlLIe01mZ/Q4/bElvfh9EQf7ZBvIKcZy4qmSldLsvUS859MG0lwpZ6amaLkSp3
 uDJIkL+28oYOdcbODmN9PVgUBfF1NFIJ0Pr8yr4HOODW3jDzAI5hbQx/ZhGn1LPXtHDN
 Y7X0uuVB0zmqSs1qOoMWZOff5Y2sQqgKu3IQTwYs6HSVIAmc+Pfr2wrA/KaI4jcqOqO3
 t8TbqnqowaqijPSJDiZOrg7B9XHEENzZT+JjBvWjrnpCabOBrAkiO+DVEQhoXS7q22/O
 6PdULmvbzC5lG13RZEK7cYrqfnAlnzG/iQ2nBEXaCaJ84PpcomS+B7Bl6jR6UYLXMiar
 Vjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469801; x=1705074601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SDwxzH3vS9V/d1nX5dyRUP+IK7/Bx5gX/AEs8zKaqSE=;
 b=EHfyiLV7J3T8x+Ey53kCpmrxCOlr3lO3CGEeLvyEhFLC4ZjZxGOelTAPF/RzCNp/c7
 4FW6HbNj+9thbimvmiDb6IcZYndri9xcfFpJUP0SMWiiKvdOYBDeyEwuB+HGwoelkRD+
 N1PDjCH0mg8cWvm0AcPYc4oO9o3YSVygpd3n1K7YUjjQqGuw39DZdUVfZAyx+LUkGvqL
 rOwBOI2KDGX/82XoJCmNPn3ahrVMM8NFcCfKgovxANLg0TWgs8sZ3nkLpmQih11FpsEp
 1XaEbIdrhJFdBVFqQWuyjceOWVSaywl0xinsGgKdnXct8SmgTJ76N0b956dZeW66npgw
 4nXg==
X-Gm-Message-State: AOJu0YygEDei5usvQUY8/WEP+JHSgyjcRTznahjC442yrAOLE3MRj/rS
 My8ky1inF7V+l/zHWhSFRoeqCE/gK/ZWNw==
X-Received: by 2002:a7b:cd96:0:b0:40d:5821:5148 with SMTP id
 y22-20020a7bcd96000000b0040d58215148mr934968wmj.67.1704469801572; 
 Fri, 05 Jan 2024 07:50:01 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 b1-20020a5d4d81000000b00337405c06a6sm1621048wru.48.2024.01.05.07.50.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:50:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PULL 68/71] hw/pci-host/raven: Propagate error in raven_realize()
Date: Fri,  5 Jan 2024 16:43:01 +0100
Message-ID: <20240105154307.21385-69-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: s/NxB38BC0l/

When an Error** reference is available, it is better to
propagate local errors, rather then using generic ones,
which might terminate the whole QEMU process.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-26-philmd@linaro.org>
---
 hw/pci-host/raven.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index f71d4872c8..c7a0a2878a 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -345,8 +345,10 @@ static void raven_realize(PCIDevice *d, Error **errp)
     d->config[PCI_LATENCY_TIMER] = 0x10;
     d->config[PCI_CAPABILITY_LIST] = 0x00;
 
-    memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios", BIOS_SIZE,
-                                     &error_fatal);
+    if (!memory_region_init_rom_nomigrate(&s->bios, OBJECT(s), "bios",
+                                          BIOS_SIZE, errp)) {
+        return;
+    }
     memory_region_add_subregion(get_system_memory(), (uint32_t)(-BIOS_SIZE),
                                 &s->bios);
     if (s->bios_name) {
-- 
2.41.0

