Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7534276njc;
        Tue, 12 Nov 2024 10:12:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUO67jD1qHL1MiIXDMFM6ErVbYrCS+N+05+Eao/mA/sDxPi9/DAcdcfq5Mf2I/9jPMcDnJs9PUAHGqpRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFqfjKBRSvFmWd1mGn170BZnALMHaBlZ2OUVBj0feb9gmYmCgbwJ0RXMevHCl8QVyH2tNt+
X-Received: by 2002:a05:622a:588:b0:460:8d5c:34bd with SMTP id d75a77b69052e-46309322da6mr261092331cf.17.1731435124540;
        Tue, 12 Nov 2024 10:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435124; cv=none;
        d=google.com; s=arc-20240605;
        b=aAeDdPDHdKVYeHuvzzqhtOW276gQmOKpohvkCvx7m4lWgovIamjoPTW8d4rmKySLWl
         6Xc9ppbRs0lEtT1cR0f1QJoA7hYp/VA29sAzZgcGbO+QQf9qCf1p7nVzr7vxZlOiByAf
         o3XBaTe5DWZ+a8qnrGy0+QnFG3VDpyey6Iw5ZPapqTZPOkTel919lbMXZXjWxB+bBGK9
         Zr38p7+s5htYE/2OLZCHnM+oqFS04IvXmmpOHO9z9yYPWdWEZKKcXBmKUIMzn7tWQzs2
         ngkbCJTfMyeZtC9YlVebqmyGj9497+o/dkf3bH3KYPGP+fGFlo+ImrFyzRIsvTDcOWCy
         LFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qd9qxHlovWjmh8ObGWU7tF9VLM9MT0KfWhMQvBKNL6I=;
        fh=GQwhXWeulapoVeMUP1ZYRVPhBhUfoXQ/2Uw+Ek3dkQ4=;
        b=YCBuYh8m8hTo2X5+BalZq413qHJGjbFoZbJ3YD9GHca8QlFjIoJixKGTrxL70Fq8R0
         gVh3LbdiXLCLujLXDTjBREeIg8SqxLv33CDy9Y0cSY07ReNRx3ir+eW5dZ1kRD7OFv2H
         JdVG/KevezybsZ+MFAyoYHb77pIVgHIbYQHpHtsRZHaquzlPOhf0kv4G0VX1se1TUSva
         2cVj/gaUXbST1xm0oVJWZLYzyUlbWg5yGXTR8ONvba1AWcGmzYOpJJSy+2AjlbxGz3Ct
         jKW0g4IcO7RgJghGY6or+dNq1pncvC1UfkpKoSeBw8WTODsXncJ+zZs+17VsFdPs2tdL
         qV5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kt84ReZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff677961si148289241cf.580.2024.11.12.10.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:12:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Kt84ReZ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvMV-00054h-GH; Tue, 12 Nov 2024 13:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMK-00050x-Kl
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:29 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMH-0001uX-B5
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so52860065e9.1
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435080; x=1732039880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qd9qxHlovWjmh8ObGWU7tF9VLM9MT0KfWhMQvBKNL6I=;
 b=Kt84ReZ/6DIX+8ABwBG38Mtlg/aIFM274wqIVOEhwPPgKY6fPLUglZBkSGPyGeq7D0
 rMvtWHHDhsifmPb578v7lbQRaTbVOhgZ2YOiMC1MtBdkA8zF5qK/ZyexieYvPiSqU7gw
 SUavSVUDizQ+lR4Ok2bKU08lAXYD0ggXLKp3xPsgbIgJvlMx9SzeEGu1Fg8+MuY/TAFU
 hWzOYPL2IfGvIMBBbeLbZ811wIsrs2SETFXfYU1YM8kFZshPDRBVPrAnXIx2An44O4k9
 +wt7+YTApTZyCj8zJjStwFxJkM3TvmVOOA/ny/1GzahgYpbuAjnT+3LpdCrdzqWPlrlf
 AEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435080; x=1732039880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qd9qxHlovWjmh8ObGWU7tF9VLM9MT0KfWhMQvBKNL6I=;
 b=CSvIPo2fqPXxxLoMbWnQlZ3h9U0OKECkvRV7epAeshqAqGY+112rn0Aw4G3uPhUZUU
 AXHmDmpwEGnolizNUMq27htfj36MtHiZrQZ8wtKzv/JYw0c6Q8W2RvSqYp74u+v0fVXU
 xveVDgLssZCrCIkv+qmY9fhanWPp5MQZ0GcPiUvKVRm3anTELyg8X68xl8EogsWgEhVV
 fVi/dsdRPSvGA3YT3ZlVMML9BpRl+g8urx3Jxz9GwtSmjGGJIvxQ22Zn6jJV4xSj8nEc
 26PJxPlEJ6X759zMj1UxD0+xhoab7WD0sMO86YFXjR+0ZkRWCHs6xxMe844suLoF3VZd
 2kGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv5cZHlyNi38dpeAoziOuQYaEM/txdciI0GI7nhct+urZc7/8lg4YzRiWJtpm0EyCH8oC9khhyGA==@nongnu.org
X-Gm-Message-State: AOJu0YyX+LbOSwd2bYOz1/J1FG/8EWFbqcq/qB15Rutt5a1gBSVSyiwM
 VPLR+zzvfJYTEZ52+4+wjmkiYGy84YITo4cjNwT8AOfco/AlPBG+SDR4Ml6yozQ=
X-Received: by 2002:a05:600c:3d05:b0:431:7c78:b885 with SMTP id
 5b1f17b1804b1-432d4aaa11emr816505e9.4.1731435079902; 
 Tue, 12 Nov 2024 10:11:19 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05e5f82sm222757955e9.42.2024.11.12.10.11.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/20] hw/net/xilinx_ethlite: Correct maximum RX buffer size
Date: Tue, 12 Nov 2024 19:10:29 +0100
Message-ID: <20241112181044.92193-6-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: Bhs/ejPqzZBh

The current max RX bufsize is set to 0x800. This is
invalid, since it contains the MMIO registers region.
Add the correct definition and use it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 0f59811c78..e6f6179fce 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -46,6 +46,8 @@
 #define R_RX_CTRL1    (0x1ffc / 4)
 #define R_MAX         (0x2000 / 4)
 
+#define RX_BUFSZ_MAX  0x07e0
+
 #define GIE_GIE    0x80000000
 
 #define CTRL_I     0x8
@@ -195,7 +197,7 @@ static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
         return -1;
     }
 
-    if (size > (R_MAX - R_RX_BUF0 - rxbase) * 4) {
+    if (size > RX_BUFSZ_MAX) {
         trace_ethlite_pkt_size_too_big(size);
         return -1;
     }
-- 
2.45.2

