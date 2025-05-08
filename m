Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp432312njb;
        Thu, 8 May 2025 06:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwdAk2ETR77CqX7y4HkxDYXCMZGOXkRQWexNk33Hwt463rW7hPMlCRn7M9pRVA7Yya35uMGbkJVVc+BQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHzxyO3j1voVqN7jOYdjumnFfMhOMi9t1p9ZnLVw+sHak7Cz9R8dWP+LAC0Kx0T9/+HV8pA
X-Received: by 2002:a05:622a:20b:b0:476:a03b:96ec with SMTP id d75a77b69052e-4944961c861mr52163691cf.32.1746711949769;
        Thu, 08 May 2025 06:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711949; cv=none;
        d=google.com; s=arc-20240605;
        b=GF7Fis71dYzhD86U+5WOnHHjeikYsT6ShIbjadofGe6rDZlEGfrIO4z31yJYxLKT7d
         ErYIKDon1Et7RuVbNR2oL8lfzuEtGcml9//FFmU+vbCDxntENk6lgdNz5XKIcEsfIerE
         4pqvtI8jL+UYKjSnYYHQPb0aD064g935evtXUSeuzou8FQaN2AlscP4hM7Yl8pMMxXn4
         4+S6WH6Bc2FrODSb7pKWc5f+h6g2RWHZawFbktoUs2zI31xl078CQivEFwJJF9mZbPcc
         0YS06+1dMO58GHM1yoTyV8lobZv/GQs9UqJYOuGBZHSBZo/KT7ra3kXjZfvm6syf7z2C
         2cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OvirrR3TiqgBPme4BwNGSV4VqzG47GBw5DwB3TzFavY=;
        fh=/1TEvvELovpBoX4mv9Je2vpoxowriUj70IfnlEXKYPY=;
        b=k4n2KOvCw08OOUr0wedP7DguqMdxmNFw2MdHiVYKIXCAFJTnTEuykSZwdTX9+YNP4W
         ve5yluuLBW5qZQAYPgS3gD8Ik7mGjHtJaS92+lRy91PSORgek23ydDzJMUo6qEhTjSU+
         KWmLsNXReEuXFfQvKi959kilszQ5yVybvEuDMukQkkX3EDEHMDweRSddMEo+uCQNxfT6
         +8BtQ0vtodeH13XT5loC8jSzPldjWAtBOJK+NRgBpUtfFKpRkDfI2rFpXRWf+IvDDDuy
         +kycLxcoUXQQCL3/nYUjbeBNfQELtixnF7AYnWy/mMXTIieonRkB+oLeYFiapIFu4VW+
         WBdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNu66OQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-492229a697bsi45708961cf.322.2025.05.08.06.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vNu66OQf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1ZD-0003TW-OZ; Thu, 08 May 2025 09:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Z2-0003EJ-62
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:45:28 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1Z0-0005EA-AE
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:45:27 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-306bf444ba2so1010621a91.1
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711925; x=1747316725; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OvirrR3TiqgBPme4BwNGSV4VqzG47GBw5DwB3TzFavY=;
 b=vNu66OQf3+aYtHHWTde5LBQ5T1cLOvD4h6+ypqUk6sMt7mqEYt7jXZ5Vn7NDo/R2vY
 l/SYIsYNP0BMl5IXb598aL4rweq94/FOadb4Ng6GVxHTlyCk97eEDjR25wonlgNO3Gd3
 5Va73geEn8xLRz5paluIFukReQYAq4Xk4kuwPJh/8JW+vrDQTPo5+2mGL4wRY/NBppxT
 sUh1PQ5n3E4zXIZRhawuA1CocV4OjqoxipPrXuosR9nnX6LDUS7r52FOhI+ReouFAsDO
 C07SvOCgOpjcb314jNaD6OU2HYdInP8YQVtFvB79OyIGcSMEubiKkTh62XJfKps1L5QN
 Vjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711925; x=1747316725;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OvirrR3TiqgBPme4BwNGSV4VqzG47GBw5DwB3TzFavY=;
 b=bIOjbkFwdp185X0AbAeX8BtWU+c5wKWaPPSSupoSCom5ccbOSkys/ly8+B4pKCMwcM
 3gj4gByLR73SwEHfSzfQMLKHCykX1n4SgNjc8uk3H/zg0VJetb81Ux7YPZv/hFqcTG1H
 bVQmbJEFfNlGADOW4lFT3JqFzReGOG23wmPFFyYMBAPkHlTF4Vx/RLe+1X4yrNdvhted
 mcXo8XRZY30bSznsrYZmD4TvF+eZdBYkg4NmGWzm5NOgIiTkGosdKM6+Vxi5ZQlclkgt
 U8pzCGz2s8vRqVCc26+wmwmIBN0uVPc7Y0pbM7o5fSlNFJyyFHxmOPrdinMgrYgmhSzy
 yIXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyy3oY/3iNMNRPJWLLZEfDJtZuI+CsKBB9vmSsPkJF1KI6KGsREVGyyCEDu52hsOsESlxAlGqxLA==@nongnu.org
X-Gm-Message-State: AOJu0Yzu39+KHVoK3/I0bTJAwzVwQPeSBKH+svLRoC8DUxrrcQf6EacI
 IGwLsPu0EbWcLEZtZ0cLKMsMVsl8UxZ4oZjgeg6vJPU/Vu42MbMqm1S00orzFpI=
X-Gm-Gg: ASbGncusT3UeRmde7kzbN2KawSw2Pjilvi7gXPzz+/SdTsVcirtdn7CX4X0ydZvUZp4
 nACtALU5AcbFJ8b3SfQRu9FlTTyu/PfxiMKrRqdP6zih+DM611xY+bAGg/w7CH5isFJvbdDFS1b
 aI2NuUViqDU3mN6osstRb4FRsEOrUlMY+nzdATAW50b7BgagA1+iChGzYOhFl5JMXoZr99JWPv5
 BqolH+ES7mR7/mESCMAg4BvflddsUZWoa/kUU2/0OzI2FQapaKygXGQRx6Ao9AFRGS3yl5rul7X
 8RZhfLUC1xa5sGH4V6PW8kg6Boa5Ux4my6XfubZpF5BRKKz3sFyUL/cI73TA3G3/V/DGnU6sLXT
 6toXdhffHnoPCwoDLbuwUe4cCgg==
X-Received: by 2002:a17:90b:1a91:b0:2ee:ab29:1a63 with SMTP id
 98e67ed59e1d1-30b28cea048mr5022708a91.3.1746711924724; 
 Thu, 08 May 2025 06:45:24 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1522f0c3sm112275035ad.209.2025.05.08.06.45.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:45:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v4 25/27] hw/virtio/virtio-pci: Remove
 VirtIOPCIProxy::ignore_backend_features field
Date: Thu,  8 May 2025 15:35:48 +0200
Message-ID: <20250508133550.81391-26-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philmd@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: +5ctWsS2ylPV

The VirtIOPCIProxy::ignore_backend_features boolean was only set
in the hw_compat_2_7[] array, via the 'x-ignore-backend-features=on'
property. We removed all machines using that array, lets remove
that property, simplify by only using the default version.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
---
 include/hw/virtio/virtio-pci.h | 1 -
 hw/virtio/virtio-pci.c         | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index f962c9116c1..9838e8650a6 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -149,7 +149,6 @@ struct VirtIOPCIProxy {
     int config_cap;
     uint32_t flags;
     bool disable_modern;
-    bool ignore_backend_features;
     OnOffAuto disable_legacy;
     /* Transitional device id */
     uint16_t trans_devid;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 8d68e56641a..7c965771907 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1965,8 +1965,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
      * Virtio capabilities present without
      * VIRTIO_F_VERSION_1 confuses guests
      */
-    if (!proxy->ignore_backend_features &&
-            !virtio_has_feature(vdev->host_features, VIRTIO_F_VERSION_1)) {
+    if (!virtio_has_feature(vdev->host_features, VIRTIO_F_VERSION_1)) {
         virtio_pci_disable_modern(proxy);
 
         if (!legacy) {
@@ -2351,8 +2350,6 @@ static const Property virtio_pci_properties[] = {
                     VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY_BIT, false),
     DEFINE_PROP_BIT("page-per-vq", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT, false),
-    DEFINE_PROP_BOOL("x-ignore-backend-features", VirtIOPCIProxy,
-                     ignore_backend_features, false),
     DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_ATS_BIT, false),
     DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,
-- 
2.47.1

