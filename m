Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp648007ejy;
        Tue, 21 Nov 2023 09:42:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGNHBM2ST/EhkzUZ+WSD6OLKv8h1XgVCrUKAAz0okvDWFAQSN4jQrebHA/c8eEXMvKr+3o+
X-Received: by 2002:a05:620a:890a:b0:779:f544:a45f with SMTP id ql10-20020a05620a890a00b00779f544a45fmr13834941qkn.49.1700588562656;
        Tue, 21 Nov 2023 09:42:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700588562; cv=none;
        d=google.com; s=arc-20160816;
        b=PsEv6ZlVcvQ3JstfOJTU6pNp7+AglsTovlyzTrWq5w4HSLAHV4xIaxPVPizYvUjxkt
         at92L3fkc8MboM9vgfyqteBqAAatMVpSaOg2fgaeuwRoHLFCQGKvSn+hoOwkZL5DH4iG
         ZHeqJ8fZTwQ0uTi/ax5/eOitpUqrmb+qC8Z4/CXrKyS+CpxCdoqJQtPezSy0iAoRn1OR
         h7qNx9dI/cmCE7ql7OyEMLXgnJYFQSfx78R+K/fQFigk5SnsLnvEHhtlOcjxYinvK5KM
         LtwbB2P2/XTB7UoV64EbFaff1K6SSNzpy5RY3ksF0yJ5nMOwX4jUUhARLSuZwe2DP2b1
         pgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gXPnP9OotZkXe8sn/bINkpH4C8HDZjSGF7IOUTkUbPk=;
        fh=cL0kZojwLp2/+GG3A9WvbPyWHrvsxnhr8acLawhZl1M=;
        b=UbcTjjEjD0I40b6oHcXRNLq8gfviAJEHgqkqypPwhcwTni0zipeVFJqipIk3sb83KS
         3ig+Mej56MZS/4LDBRad+7bhDplTcIUSLcdNqotAmIGAWHzxTDlBSY+zRgnAw5CSF2hX
         fDoR7QxTdnffneymv1ofD6yuqcssIzZckcVA9mfCGTaNieuXuhKpY9x27UsWthsdAVqU
         Uais8OY0JnQvigdP0r4cMUig4sdU/Zaw/jCvOooUcCdDYhdMAX489TPTDl+MgB/DlMWW
         Y87eXzpgLVgTDlD1kDozLqd1wi+oGMn2o38QW2m2A4pNr/ad5CAwTw6aZCr46YXG40yj
         Na6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pfCxfaM/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1-20020a05620a112100b0077438f60e5esi865743qkk.211.2023.11.21.09.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 09:42:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="pfCxfaM/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5UkW-0008JW-VL; Tue, 21 Nov 2023 12:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkV-0008Gy-O0
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 12:41:23 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkT-0001I6-0a
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 12:41:23 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so72868311fa.0
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 09:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700588477; x=1701193277; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXPnP9OotZkXe8sn/bINkpH4C8HDZjSGF7IOUTkUbPk=;
 b=pfCxfaM/Iu4cjgXIz6vPbUyg3Xiuntw3jkcVU6Az9/mEJLI/Kd7Katklybn/Vx0xhc
 8l9SaDCzDXKAx+f/0uUpdM3Qfxye1fKYXeDsGtjf9Q0qf2QC+iIWdGmg7fb3OT17Ksn0
 peZqedRvrxtDH++swZa8ULdVJczFpr30yEJmDLGy8jadHR0G6OzFaNmiO0rXtXLfMpuF
 3HJTplHXmyg7FB86KUacgD2ul7aoNFhnAJ97Io50KXVQDCneHhWplI6uMyxLgw9xhs07
 Eq4F0z04lwFK70mWo6owotPCnmGRIFXAM5+bcmqzH++nt2GI0rSUlngkbMQ4fpc5KoEK
 3CKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700588477; x=1701193277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXPnP9OotZkXe8sn/bINkpH4C8HDZjSGF7IOUTkUbPk=;
 b=tvVkbJtUHY1SmzteHocdPkt7hegt+JLvE0k+8Rg08/hvwxSNuGCQhYX4BIc4fF0Z4R
 WUCb0nDEWkEJUNZbbgy3x5jHDin9ja0QsdaKaYcarR5RD0HWGC5NGy6MY10ep2GHpgnj
 j7KI2n6h/RAfzacUiaBHtJSO7gEemxbrhThvHmBxXbAk24ireyo3VKdbzuE+U63mw4x3
 6sxu/aC84WzsmOW+jfQdZiiGwvm0whoCZUGRQc9SfbLM3iF0Wras1Q7nCaMcye4D07PJ
 SYAjbwaMZdk7n22HkTUFdz69FJr/NLuo+oL5yyZ4EWlXDFv0o/Y+IRi0Bb1P48NH18RJ
 oPlQ==
X-Gm-Message-State: AOJu0YxPDhllJ87zKF4uFVwikNZ2cW5rUCvnph0dDr/fDSqNeJFjv2vD
 cMcLMZfF3dEeAAfiO06AeGw+HlbfdF3cQRX4uIY=
X-Received: by 2002:a2e:9b95:0:b0:2c1:9a8b:f67 with SMTP id
 z21-20020a2e9b95000000b002c19a8b0f67mr6777111lji.1.1700588477006; 
 Tue, 21 Nov 2023 09:41:17 -0800 (PST)
Received: from m1x-phil.lan (lgp44-h02-176-184-8-219.dsl.sta.abo.bbox.fr.
 [176.184.8.219]) by smtp.gmail.com with ESMTPSA id
 q3-20020a05600c46c300b0040b2b9bf321sm1973474wmo.9.2023.11.21.09.41.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Nov 2023 09:41:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-stable@nongnu.org
Subject: [PATCH-for-8.2? 4/6] hw/nvram/xlnx-efuse: Free XlnxEFuse::ro_bits[]
 array on finalize()
Date: Tue, 21 Nov 2023 18:40:49 +0100
Message-ID: <20231121174051.63038-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121174051.63038-1-philmd@linaro.org>
References: <20231121174051.63038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8L2L8xoxS+Zw

Commit 0be6bfac62 ("qdev: Implement variable length array properties")
added the DEFINE_PROP_ARRAY() macro with the following comment:

  * It is the responsibility of the device deinit code to free the
  * @_arrayfield memory.

Commit 68fbcc344e added:

  DEFINE_PROP_ARRAY("read-only", XlnxEFuse, ro_bits_cnt, ro_bits,
                    qdev_prop_uint32, uint32_t),

but forgot to free the 'ro_bits' array. Do it in the instance_finalize
handler.

Cc: qemu-stable@nongnu.org
Fixes: 68fbcc344e ("hw/nvram: Introduce Xilinx eFuse QOM") # v6.2.0+
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvram/xlnx-efuse.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
index 655c40b8d1..f7b849f7de 100644
--- a/hw/nvram/xlnx-efuse.c
+++ b/hw/nvram/xlnx-efuse.c
@@ -224,6 +224,13 @@ static void efuse_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void efuse_finalize(Object *obj)
+{
+    XlnxEFuse *s = XLNX_EFUSE(obj);
+
+    g_free(s->ro_bits);
+}
+
 static void efuse_prop_set_drive(Object *obj, Visitor *v, const char *name,
                                  void *opaque, Error **errp)
 {
@@ -280,6 +287,7 @@ static const TypeInfo efuse_info = {
     .name          = TYPE_XLNX_EFUSE,
     .parent        = TYPE_DEVICE,
     .instance_size = sizeof(XlnxEFuse),
+    .instance_finalize = efuse_finalize,
     .class_init    = efuse_class_init,
 };
 
-- 
2.41.0

