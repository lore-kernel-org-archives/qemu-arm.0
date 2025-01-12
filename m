Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1414206njn;
        Sun, 12 Jan 2025 13:03:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4EvukxnHXi0/Yxlawv4LR2LRR8h0qyy9BKI5hAAT57osWtnPTwotPsGTpJPtpdSbsmxXVFiA46qvdrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHzri2EfO5RvK+zql+UfXWkjReVGUFNoQ+T17J6gu3tXnZOxlcSRb1TJLSAtBN5Dd5oTPVH
X-Received: by 2002:a05:6102:5120:b0:4b6:15fa:56a6 with SMTP id ada2fe7eead31-4b615fa5c84mr11936935137.22.1736715812570;
        Sun, 12 Jan 2025 13:03:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736715812; cv=none;
        d=google.com; s=arc-20240605;
        b=WxRH0skhXQNriwT3hXtiN071CNCCuWn5HtPXEC9HHN/USUenBgoXWMfytXB258Fot0
         x2buJQopDZYw1eYAhpZjiRJfjTbaLlj+PkpCKb0e7RR7sAuoMbxP2BorR8JIaIoYtwMS
         7NPNIGI36gDSi+9NurKXsLbsUUFCgFoVpOEUy7y/DHB4/8DiBa9RdwENV1BJwqXpHl2C
         /lB9ceOZoSwWp4Uo6vFINB1NVk3fIYm8ueHAReFiLhxS7AZ9zx1Cf75zz/A5WtGuliqU
         2O8CRHNzeQNPD5P7EO/u8/Lv0ZMaGJppZSFQKuSYlybRP+QJmcdffRl4UszQVV6km1rO
         FOeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yCll5w6Y3h75LA54Ck5Ksah/JGL+Wp/RXIpJEp+i2Ls=;
        fh=mJl2L6ifkzfFtESnTKnKf1cWfgBgdHeucGLkV0ymPus=;
        b=ab0SoCT+FpmT14Z1t40tgjc1vsydkckRqKrwsFumdCiWckvFuQulyJS2VSnTU5gFEN
         /fGygEItY9fRSYNdpKlZSVsBWM59+3TwFt879h6MUExwEuIpFxCpIcLX+cmnpUBrOYJV
         mlpfBgtltAU/4EzuOXgAX0OyRSb5TVjuEga0HR5/nNm5smygHMI2HM8dsFkwlEC1Zl0I
         fvdpyGu+w0QYW6kb+y8ZtNRtvROXlMlBG03l+3epwpOaqO2/XMNLnpqcQJ/gJoe2hsYO
         LzTiwzbVq9nflz95wRP2DIn9SpKNKDYz9dtb1QY2ksQEdnXAZydgOzxLNMrX9cnYOLpe
         7PeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=U9MgSGwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b6092fb52fsi2638485137.410.2025.01.12.13.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 13:03:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=U9MgSGwR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX56u-0005RT-B7; Sun, 12 Jan 2025 16:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55d-0004YV-Rf
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:53 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tX55a-0006Qh-Ik
 for qemu-arm@nongnu.org; Sun, 12 Jan 2025 16:01:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3ecae02beso4748052a12.0
 for <qemu-arm@nongnu.org>; Sun, 12 Jan 2025 13:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736715701; x=1737320501;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yCll5w6Y3h75LA54Ck5Ksah/JGL+Wp/RXIpJEp+i2Ls=;
 b=U9MgSGwRL+lDEenQJfaZi7o3GhyffHiKB6zA1KqA74QfKPxEFIsUJnvWyHpVagpwzN
 IAmwH022JqfRbkARA6rGGXKf3asGfQYqq+l3vPBdavgUL9+94NP6aP3cOVEHqGxhIjZu
 eYPVWU/8rSL4ZCWEpmtFiSJJAkaMZi71LERrUsEdbRL8mCftcl0SxNa2qi3JFiOqqvVL
 uLLtQahT6U1qa+5MGvc1Jrip1I1x/sX5dHjHGWjiFCrxE2TI1Keh8sIxO1m5PgPBHdG7
 DD6gkTqxIe9QNwpzHj+9GSL7WaJUq7kxly54U9nJjUqFJNuKrZoE6PuV32ADdGHpGdr2
 OZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736715701; x=1737320501;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yCll5w6Y3h75LA54Ck5Ksah/JGL+Wp/RXIpJEp+i2Ls=;
 b=LnaGke2FixVXGmjExGKCPZjYx74wulmf0eyBYOVOav1J9uHaW+zXqa09NKhZfdVVqK
 IYuy/z22/wcHlsbuzOSorcf0EYuhvdUVR/tyb7LFnxxD7eOf9B76OlLwhTyKnUEX3JoN
 fgWMm3zkbjj5yhSgFeX/eu/Jbsiez09eDxT2Fx8oZz6bV8GJ7YHuWbOA40q8pL0dOxbG
 VS4/Yxh1OnloFrQ84ISKiKtl1hg6CpWmdMCABRuere1vOXeCoksbIm1rpbu+v2IiZobM
 HQ6wDs72kQxq++N3PUreqF2C9KDs/lhtYWG/q6bfR7g5N8dkdPESJ5H/G7Dbrce3KPKM
 AAoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUH4boitKeZrThCPrMnyWX4xSlXRkn4StloXlEWXGWWPFfNNqJzJYBu83e4rtKPCtqFf6De84niQ==@nongnu.org
X-Gm-Message-State: AOJu0YwyK97ERlF0c/dbKKogFrOqA10NDD8xHvIxlp+vbC5EFxz5cbnQ
 GM+Y/6IxifmbL1jwPZkgVF2ZgqRVTlM+j5JE6RX/rrZof0cO/X2CBYFwmS6TtQ==
X-Gm-Gg: ASbGncs8QAKR1Fh0NcrNlOb5GcANafHRkb6DN3clibsCPZoKEhT9fx6JsQGXsfjELRa
 MdD6vSBtYA2kz4RgFXKJadY9zBY+WGae0E1FkVyTZUi9JmdRC+hsEJgfJd8L1Kk10YAscrliLqd
 8B2VVvOTO73VlaiD8rNB4J56ufOOUo38e6l99OT2GDE+CoTRARavtBL41YTkZNRdrO5hqNgvFXb
 m16RNrtKE42XjCWi4n//Lm46TR0qpJIX+O4sf77bDNTodbcJhzU2P7QWmbCNPmJBKI9vgaetLrR
 Zpc8OnGcqdC/ywA38BgaGAD9ZQ6XuZM3
X-Received: by 2002:a17:907:3f92:b0:aa6:5d30:d974 with SMTP id
 a640c23a62f3a-ab2ab6fdb8cmr1617214166b.28.1736715701176; 
 Sun, 12 Jan 2025 13:01:41 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905e283sm418276666b.31.2025.01.12.13.01.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Jan 2025 13:01:40 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, mst@redhat.com, stefanha@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, marcandre.lureau@redhat.com, philmd@linaro.org,
 eblake@redhat.com, armbru@redhat.com, qemu-block@nongnu.org,
 qemu-arm@nongnu.org
Subject: [PATCH v17 10/11] hw/intc: Remove TCG dependency on ARM_GICV3
Date: Sun, 12 Jan 2025 22:00:55 +0100
Message-Id: <20250112210056.16658-11-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250112210056.16658-1-phil@philjordan.eu>
References: <20250112210056.16658-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::534;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: Dti/sARZuf2P

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The TYPE_ARM_GICV3 model doesn't have any particular
dependency on TCG, remove it. Rename the Kconfig selector
ARM_GICV3_TCG -> ARM_GICV3.

Fixes: a8a5546798c ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Phil Dennis-Jordan <phil@philjordan.eu>
---
 hw/intc/Kconfig     | 6 +++---
 hw/intc/meson.build | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index dd405bdb5d..7547528f2c 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -23,13 +23,13 @@ config APIC
 
 config ARM_GIC
     bool
-    select ARM_GICV3_TCG if TCG
+    select ARM_GICV3 if TCG
     select ARM_GIC_KVM if KVM
     select MSI_NONBROKEN
 
-config ARM_GICV3_TCG
+config ARM_GICV3
     bool
-    depends on ARM_GIC && TCG
+    depends on ARM_GIC
 
 config ARM_GIC_KVM
     bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 510fdfb688..602da304b0 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -6,7 +6,7 @@ system_ss.add(when: 'CONFIG_ARM_GIC', if_true: files(
   'arm_gicv3_common.c',
   'arm_gicv3_its_common.c',
 ))
-system_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
+system_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files(
   'arm_gicv3.c',
   'arm_gicv3_dist.c',
   'arm_gicv3_its.c',
@@ -39,7 +39,7 @@ endif
 
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
-specific_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files('arm_gicv3_cpuif.c'))
+specific_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
-- 
2.39.5 (Apple Git-154)

