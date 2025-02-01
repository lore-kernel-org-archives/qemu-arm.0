Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp942684njb;
        Sat, 1 Feb 2025 01:16:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXalqvh/Vs1N2YP76cNA8A0rwwxmG5oMzkQgYqk0mAuOSB5yOR5o6hzAKuoDWIPg4SAq1B1DkOIEd3V9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGrMnZKljKk9vsMfCHUMWrpnL1Ka27rpx5umDQEgSfRUKluscl8trxeZi/VTsaI4EKb6Yea
X-Received: by 2002:ac8:5f95:0:b0:461:5571:5cc6 with SMTP id d75a77b69052e-46fd0b9958cmr199899561cf.46.1738401418673;
        Sat, 01 Feb 2025 01:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738401418; cv=none;
        d=google.com; s=arc-20240605;
        b=kRRjkDeREmTRaJicDKRsQBbApomh6kpr8h5cpWT5qkuCh9IUEcycgIlC6EYwwa1QKQ
         SehNuWp3agM27g07HvxmJkalG1uWDcLhnHTDrdGvQcnDFlHmDsCWUl49QvWPkD0ufpdC
         GuTxQElN8qmXmhAn8joxLOUbuB3lSraX1ogq+US0GYUkBodPlA+FV6b5DVZXTcu2Bn4j
         l2OALY0BiZA6BuyX2W5pvKaiqcRPh8ChFLS/kZWEKuKsmrRU8J+CmQkueLcNqRoJKKkF
         K7l4UnAIIPt9X6aV9UuPRhtJ2cyfcynBlx1G5A2MydyUFLQXMXT8qvHsVUZsweG/b9tn
         icmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jNWPuDa8TGdgIkgMQ7fmGixmIo8d3RAnXJJCGYAmUDI=;
        fh=s94hSPwJJe/RKXtMu+IGH7tuR2mR4OAzZQlEZ1eWThU=;
        b=j8TRbTq5Wf0ZzYLelh0P88wSBN0wMmnCunOu+hdo1pl9cpD7JzW2x2HhldMqEQka/C
         PgDH6vyX8muhsHHtECgB5HecAc1NcJK+TWlywzVkT3Qi4I3ARIZ2aVw9zSm/hapu+d2b
         9LzLi41yCmFj1lT+HoE19GOV1eD/Ju1lR5s1izf3dpyaq2q7GvhmtfMUXQ/9jomKd4P5
         aI5XQ9Ohz3nFX5HJOw0p4pd3v4seDFf9sir9+SnWSabVb2gG5iwvlyd3f20SlE8HVPl1
         X5Ttp0Vir13FwVT4Y59aqBqfTMp1fl9sSjFmclNXKfaazqlZ3R3YkFHZjIAamG+imApk
         fweA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6Nuu4IZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46ff5412acesi18872871cf.180.2025.02.01.01.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 01:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q6Nuu4IZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1te9bd-00013x-R3; Sat, 01 Feb 2025 04:16:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9ba-00012n-EU
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:15:58 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1te9bY-0000cz-Py
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 04:15:58 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436202dd730so20008845e9.2
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 01:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738401355; x=1739006155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNWPuDa8TGdgIkgMQ7fmGixmIo8d3RAnXJJCGYAmUDI=;
 b=q6Nuu4IZenEvIhSnvawAbLMDj8IQV2vLfiVBaPTdwvUltZnpJ1XdabcwNj5pkN5isS
 Ixf8UEqi83kg2NCJZ8CesOZF52vG8sTFG526vFgQvdYQz3nZv8Kzc6xwWy3T60XjYnpb
 3oueHnj+mz1bQGuE0zOwPXix3fCd+GWz/zVtMusVnmam7SaXE5u+MH8HhAdqmmfuaHDU
 27ZlFre203AzoNWWMk/+z7/Zv7jRaTbk4YslHzFNG/p3g/Lu9H3sGM4cOK2Qe/N6nKH8
 57FTvR7GGx77ZYAmQJVMa42VDOAf6uCAO423K8QVK+bThGMOvuZqjVzg6dLg3RCa7ZSo
 1/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738401355; x=1739006155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jNWPuDa8TGdgIkgMQ7fmGixmIo8d3RAnXJJCGYAmUDI=;
 b=cY23JDNQtH+VmZDBAJ9CJlpV2kKdvsytvJ2Ir0xPz3duCFyYhnOPaGiUsYUkBphhoc
 baFChqeWmhgfJZVAl4vEC0ZOdlf075slzMM1qd1i3cseFHktfebls3KDD4pwUSsVnUkD
 512MXBCwkaH0+Evi8XQrcu0CQdw/yZ4LP7VIqZ49/JGPxIfY5Ms6RkDmXERwT+8efsdP
 I9Wuoc+GqZPwaqT7tbN7XSqsxjBfN6vg3kDGyPAK5hkWNETIN1P6/CylMDNuSOO10/xG
 UcKR4E6xRdjdBTM4xjcpuInBuzKtLvBuGKaufQI/irnyFLuMytVir5Gq944uQgL3orxn
 N6jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/3N4Pcw2HADOL68nBzxub3Oj6+qfpiRvHhzK9/9Z36gvfcx9by7U8iANaTEDuTckPjLYpar+2xw==@nongnu.org
X-Gm-Message-State: AOJu0YwhrdNnEKXHJzLSGJz3nJZFIzGlOPQHuawMTDAfa/CsZvsUENn7
 7CS963tJMPecy4LW4wzNAer6zPVVYXxU8vof7NaWCJTX3+VWMYzvkD+IiE1evBs=
X-Gm-Gg: ASbGncvZMD8pRzedOgt9zLOXrxALVdc/kNJp7JLrlA4sN3j99HN88muBNKkD1D33tOs
 f1yYVOm8ndIq6BWiBZAXIsnOBhFV3lzXu1gUXIrXslvzH+RQSkav3JFcM0lYQv15EZg0U3ucF8z
 PpUp1D7KnEYusaS+1MD1rsKk8BL9N4a4od4jNrJCaaDHSgj5itriPJryMA2PLEVcCpzDHuIRl3T
 8RKl5jExwc3cOhZPc8pcn7rATNw0YsWXt6O7zf04DwEQOR0IFRJaMzMbTaqMLL8j7bOOJ+uaV57
 73aV/q2ZSuBrb2Mtzheb2Nnoy7bK8beDr6n3JOAb16pcvTys8VRfwiGnHnpdL86ZBg==
X-Received: by 2002:a05:600c:458a:b0:436:1c0c:bfb6 with SMTP id
 5b1f17b1804b1-438dc40f2c7mr111656295e9.27.1738401355492; 
 Sat, 01 Feb 2025 01:15:55 -0800 (PST)
Received: from localhost.localdomain (232.170.88.92.rev.sfr.net.
 [92.88.170.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf571sm6680720f8f.82.2025.02.01.01.15.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 01 Feb 2025 01:15:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jared Mauch <jared+home@puck.nether.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/7] hw/arm/raspi4b: Rename as raspi4b-1g / raspi4b-2g,
 deprecating old name
Date: Sat,  1 Feb 2025 10:15:25 +0100
Message-ID: <20250201091528.1177-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250201091528.1177-1-philmd@linaro.org>
References: <20250201091528.1177-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ps1A0wCrYDXq

On 32-bit hosts, rename 'raspi4b' -> 'raspi4b-1g' to clarify the
machine has 1GB of RAM.
On 64-bit hosts, rename 'raspi4b' -> 'raspi4b-2g'.
Keep the 'raspi4b' alias but deprecate it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst | 6 ++++++
 hw/arm/raspi4b.c          | 6 ++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 4a3c302962a..d635bd60d74 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -257,6 +257,12 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
 Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
 CPUs. Big endian support is not tested.
 
+ARM ``raspi4b`` machine (since 10.0)
+''''''''''''''''''''''''''''''''''''
+
+This machine has been renamed ``raspi4b-1g`` on 32-bit hosts and ``raspi4b-2g``
+on 64-bit ones.
+
 Backend options
 ---------------
 
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 4ea79ec7092..713b4693a49 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -117,6 +117,7 @@ static void raspi4b_1g_machine_class_init(ObjectClass *oc, void *data)
 
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->init = raspi4b_machine_init;
+    mc->alias = "raspi4b";
 }
 #else
 static void raspi4b_2g_machine_class_init(ObjectClass *oc, void *data)
@@ -128,19 +129,20 @@ static void raspi4b_2g_machine_class_init(ObjectClass *oc, void *data)
     rmc->board_rev = 0xb03115; /* Revision 1.5, 2 Gb RAM */
     raspi_machine_class_common_init(mc, rmc->board_rev);
     mc->init = raspi4b_machine_init;
+    mc->alias = "raspi4b";
 }
 #endif
 
 static const TypeInfo raspi4_machine_types[] = {
 #if HOST_LONG_BITS == 32
     {
-        .name           = MACHINE_TYPE_NAME("raspi4b"),
+        .name           = MACHINE_TYPE_NAME("raspi4b-1g"),
         .parent         = TYPE_RASPI4_MACHINE,
         .class_init     = raspi4b_1g_machine_class_init,
     },
 #else
     {
-        .name           = MACHINE_TYPE_NAME("raspi4b"),
+        .name           = MACHINE_TYPE_NAME("raspi4b-2g"),
         .parent         = TYPE_RASPI4_MACHINE,
         .class_init     = raspi4b_2g_machine_class_init,
     },
-- 
2.47.1

