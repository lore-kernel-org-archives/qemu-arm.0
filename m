Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp432520njb;
        Thu, 8 May 2025 06:46:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdWB7dyoU6NoX7NBKzEA+2CRKks98TKDFrbGmbZZiXFqo+tskRhL9p9I64v0gqSbmyu4O7fmM27ZzJcw==@linaro.org
X-Google-Smtp-Source: AGHT+IGtgAJX2wSgZ5oQNKf5X09q7nE5Je+0eAnLfYDZwpz+AF2V0I8oRFzB/KQE+qWzubE8slrH
X-Received: by 2002:a05:620a:414a:b0:7c9:5602:1314 with SMTP id af79cd13be357-7caf73ac0c2mr805626485a.33.1746711970233;
        Thu, 08 May 2025 06:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711970; cv=none;
        d=google.com; s=arc-20240605;
        b=UA82DUcTR1HYINAqLmstjRI2JT0wVhxv6r0lcIYKOyK7l9MFOOPXkPGwcZH8FDgA/K
         ZueXCLfCLtoAg5Xc5qO4lmbdmF8X/UBDxkM3IogN/beHDUgOttEdGYNEc5o9wR9UtJN1
         LKkGOnZnamlN2iegGaGvycpmfg/OB+Lr/79587COXg3uCEIFwZJvqFmCCzz4Miwx/Lcq
         86/LFO8wL9LB6Vnn0819xU8n/12UvmzbmdWsZB4O9JRC2F4YLFQ/XXGVKqIKwKC7h1m5
         EyI2Mqvypw4qs4wbxM8p6+XqzXmR9VOh9cpmPPJ9WBBI11jM8JxCytoXoBq9mIOxLje1
         TReQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ns6abkUGaM6ukyij9Yk70LzU+Vns27nmI4rpIretkkk=;
        fh=7zfwmcqjKUF/WUZh3IpJJ6h6t/T/K+W1T1VC/fT81nA=;
        b=YrIUZYtp5zUze+/tksTYMqBjdpzdudM+PTrEYXB8rblNhwu5zlWzV3W0ncFS6OfMbB
         TUn6ww/nOOM6aKR1jrFrFA3GTnPdenN1yhIPKxjuXB2amnwcZE5cL2IODtKgQjtFZcBZ
         H+ojNbZDpIoK88Kj8WbaiixH+TXDcQ6oLnlrWD/37xuKai478ywnNaYiiaqkaIM0BgfD
         NTZtBt+PcSYGzjRCnXPs6bgrm6vAyFcEz83aKH0gfFLlIahZYnDSE3xsi/M/Hu4qLjAa
         Tj5QvhO7RWVkxQQQQx4jbL+GzS5GmC1QnNiDRfJwYTUv+CFVsZDq1zeouOlPckSHFNv0
         P2BQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNlazke1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75c94casi470368885a.506.2025.05.08.06.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNlazke1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1Zc-0003wS-6u; Thu, 08 May 2025 09:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1ZS-0003i7-1T
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:46:02 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1ZO-0005GS-MT
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:45:53 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7399a2dc13fso1325532b3a.2
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711949; x=1747316749; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ns6abkUGaM6ukyij9Yk70LzU+Vns27nmI4rpIretkkk=;
 b=mNlazke16ALaUd8t2RkCgyJwVgJjB6wDJxZTF87bSEJQJtAblaEUE+hwvQqipa0nW7
 P71o79IjwizeovFb+9YfEezBbx/WWvX1Ab5zDhZTrtq/9GCvzjNGRO5Ymh2/6nPVoDML
 H/52zO4PaWH74jRwLpGTETT/JUNrGqPXeApZ8jMSnogG5Uvz8bL+PyUTFF/SV+0x37TV
 c5FpzpsG00rKRP/CCBvMyG5+NZYQQfwLdquncTiL+8fVZJCGTOttV5fq/cQDLMRD3X4Y
 C9vVlj5QpShBsB8OxjoRh6YMqSAv76pKz/kMnzpg/FDOiW2EukskpRIsqA0g9jmM65JC
 YxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711949; x=1747316749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ns6abkUGaM6ukyij9Yk70LzU+Vns27nmI4rpIretkkk=;
 b=VV7n7wBNxUAGw1Yq3EYOhA+jQokPX5KTbesFqjRqkTTo2crjk28YG+OhgfCCMGvdKn
 KReUh16KUI46TpafT5iCOt+fWOnPuwMqw7vdQHFBOW6Z2z1u0iUIEFBbTRMBCtU2J2Cl
 z+V0Gj1D6fLBIehDo6ASDb09XvtaH6sJ6mVjH8+8sNI+DQTHNGOacfDopGkz+yVawS9F
 EuiFr9+We98fyBpJxwVA6gckK8i3MBlQd6w9vyv4XwKbOfRAMjnMYDIjm5AFLb1psZvX
 W2HyBxrda2OakyKq4STBMlPnUae0+Wml8HeAxLT7t5aTXPuEFyL39Vbhh94BbzUnGeA4
 foBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW27wqg6/iV1aJC+xchKvy98xXvpY8HJhNoAvxtlRyjZnPL6TzSLWbZ8GdtMZPvG+zMcmOJmh5oqA==@nongnu.org
X-Gm-Message-State: AOJu0YwzJZ7YQG85Dq8eOnIR6rRSkaX9QnP60He5InFNGGGPhT3Cjkfy
 SHlsabVKaFiTKeZN6oOpV9/Z6Yc8zSfb3tdEKdXZtwM/v+AWJky1mvkHyqBHEtU=
X-Gm-Gg: ASbGncvChIAFd9uIHwvjvH6LmKNDqLs9eBxw31CKpXnvJKhdyqV2ekUOCmDsxz6JYVE
 HfhvVQdDWE0Rn8BzlyckFXMFH1c8thBIBYjywNBmetSWCNNOF6UjjxT8zZlDML3w1PhVVvVPzvO
 SW0pEtOrsdeeFfz59IidhApJTFTZqOKzuTff5YyzGfnpOhedcOLDNOjAwESBneLhCeln5LTKJJG
 +obLkCQh+v51XEWtLUCpUe5NtYi1FlDsr/KKDsfnSz/4sTv7tg+h4RAR6lvAhtY7nIPh1+GFZuk
 BAnT2aRoUoHOengQdOd0Sx9DDi9yJNFNBM5uq9wNBcIWBMsSEt9ex18rHGnAz1GIrfcdVNpy7+p
 yFrnM0BchRCMCYGk=
X-Received: by 2002:a05:6a00:1308:b0:740:a879:4f7b with SMTP id
 d2e1a72fcca58-740a8794fcamr6118097b3a.18.1746711948529; 
 Thu, 08 May 2025 06:45:48 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7405906372fsm13690156b3a.148.2025.05.08.06.45.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:45:48 -0700 (PDT)
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
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v4 26/27] hw/char/virtio-serial: Do not expose the
 'emergency-write' property
Date: Thu,  8 May 2025 15:35:49 +0200
Message-ID: <20250508133550.81391-27-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5C0V926D/2qw

The VIRTIO_CONSOLE_F_EMERG_WRITE feature bit was only set
in the hw_compat_2_7[] array, via the 'emergency-write=off'
property. We removed all machines using that array, lets remove
that property. All instances have this feature bit set and
it can not be disabled. VirtIOSerial::host_features mask is
now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-serial.h | 2 --
 hw/char/virtio-serial-bus.c       | 9 +++------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-serial.h b/include/hw/virtio/virtio-serial.h
index d87c62eab7a..e6ceacec309 100644
--- a/include/hw/virtio/virtio-serial.h
+++ b/include/hw/virtio/virtio-serial.h
@@ -185,8 +185,6 @@ struct VirtIOSerial {
     struct VirtIOSerialPostLoad *post_load;
 
     virtio_serial_conf serial;
-
-    uint64_t host_features;
 };
 
 /* Interface to the virtio-serial bus */
diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index eb79f5258b6..cfc8fa42186 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -557,7 +557,7 @@ static uint64_t get_features(VirtIODevice *vdev, uint64_t features,
 
     vser = VIRTIO_SERIAL(vdev);
 
-    features |= vser->host_features;
+    features |= BIT_ULL(VIRTIO_CONSOLE_F_EMERG_WRITE);
     if (vser->bus.max_nr_ports > 1) {
         virtio_add_feature(&features, VIRTIO_CONSOLE_F_MULTIPORT);
     }
@@ -587,8 +587,7 @@ static void set_config(VirtIODevice *vdev, const uint8_t *config_data)
     VirtIOSerialPortClass *vsc;
     uint8_t emerg_wr_lo;
 
-    if (!virtio_has_feature(vser->host_features,
-        VIRTIO_CONSOLE_F_EMERG_WRITE) || !config->emerg_wr) {
+    if (!config->emerg_wr) {
         return;
     }
 
@@ -1039,7 +1038,7 @@ static void virtio_serial_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    if (!virtio_has_feature(vser->host_features,
+    if (!virtio_has_feature(vdev->host_features,
                             VIRTIO_CONSOLE_F_EMERG_WRITE)) {
         config_size = offsetof(struct virtio_console_config, emerg_wr);
     }
@@ -1155,8 +1154,6 @@ static const VMStateDescription vmstate_virtio_console = {
 static const Property virtio_serial_properties[] = {
     DEFINE_PROP_UINT32("max_ports", VirtIOSerial, serial.max_virtserial_ports,
                                                   31),
-    DEFINE_PROP_BIT64("emergency-write", VirtIOSerial, host_features,
-                      VIRTIO_CONSOLE_F_EMERG_WRITE, true),
 };
 
 static void virtio_serial_class_init(ObjectClass *klass, const void *data)
-- 
2.47.1

