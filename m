Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7537790njc;
        Tue, 12 Nov 2024 10:17:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX6yCNhb8VFwZhGVO/8TMMJdTdw/o0WIu9q2rvN/NG/7j9PIYVCVDU6ygan6Rm89rN27BOvpj/eWrZL6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGLTokxmzSpYDUIt+/WA2b99QhVSO9hWPoRrj9RzhvslbggMe99RfpxCHhtoqqOXh+sahXd
X-Received: by 2002:a05:620a:bc3:b0:7b1:ae59:47c4 with SMTP id af79cd13be357-7b331e95ad8mr2284699085a.2.1731435430929;
        Tue, 12 Nov 2024 10:17:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435430; cv=none;
        d=google.com; s=arc-20240605;
        b=MWg3kBs7Y7or9PvVsxJshWxIKP1vCS1kq/SAE4EDeT6iDPMz7P3UC/VUVIysk4D+o+
         ieauRPTOq9ILCJkVSLyY2+/mcJjLKSbs59LVHWFCBPSl5Qlc8GTLmCyRoZgK7CUSuO0n
         5BHNHC+73Hy5aJJ2H7GwAsWiBRdug8wDuVxYHx+06i6Y0y1rm5T01ye0jYixvRdu/nNc
         Aenrp0EgeD6zvoMIm4WQWzq4C25qnLTuyV073xRfizAtiAKXgSatWMuyjM1AT3OkoHxp
         bl6T+/7yOW26BrKZseG40XIpDaEvHxJaRBX28IJXEpXrZWuY58W3nk8sqSAwYcLOpLa7
         tKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VgOSNR6wPQJECLaWUR0U2aDVp6+TXCTXj/l4QB6G0rU=;
        fh=z8Zkao1ZMEr2+SNgtsWpaN/AFRDHanCUV/cf6iACw/g=;
        b=KtVr9WpIDhRGQe3k86m7r9gzpMLAMIzFjUjqOYjck0P4YTyNL96qQ/OfJctKDnwuEH
         t+JP6CDrmHhznOiwDfgt+oKhoznR/vtrOG0KGTkS1Kg92w9VNOEzuFRz77FEoTft9AbT
         JnlNGtMWB0WT9BEhQm/m3Z2wkvjzex2TATruq9vqeRVIkX2RXcGoP9Ir1kncq0AfvPfX
         ZAvohdaXuLLuzqOV50UE18RnH+SiXwXuIgXYmZhuIPtd8skDxpfMhbaW9Djmmm9B8rPR
         DCM9BD0CzySJCVeh1GgIYePC1wf69ZakGHjQIHy/HXZejv/qvdjiZfkEBk2BDNo16x9F
         waZQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPaVWrNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad1ef41si1577661985a.598.2024.11.12.10.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:17:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mPaVWrNO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvMi-0005EL-Tf; Tue, 12 Nov 2024 13:11:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMc-0005BY-Cl
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:42 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvMZ-0001wW-7Q
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:11:41 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-37d4c482844so4080280f8f.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435098; x=1732039898; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VgOSNR6wPQJECLaWUR0U2aDVp6+TXCTXj/l4QB6G0rU=;
 b=mPaVWrNODwimrCiGaStTIfjh9I0CStiqM58LF9XK2CPnMtnU5Q1SslHCil/76ryTIM
 jsXMqMpAUYQeVTWY0b2A8gwvxRP645VkwzKhfDd1bG87nzsNQL0Gw9s5NRnN+kQaTd9h
 viPYr/r7RojLUWwndqrsSZs4tXQX7/AWK9hLdPTNXtlE2JlORdANyX0etCm9MrrM/oTj
 gzWqmKujHS3cPtGGNe4suw2GvFAikpQ+U+FfzCJz6PEJ+ICiHtU0VNxG/WPpnn+0Ad+8
 qfNuCSkKGbI1FoRMFnAGgbl4GEhggZsUjL+w6CQq07NCMZG0p+U5y7fOO7pbbWEnRX3k
 PR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435098; x=1732039898;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VgOSNR6wPQJECLaWUR0U2aDVp6+TXCTXj/l4QB6G0rU=;
 b=ku9N4Nszp5zEln8sKHqVj+W3jtssJudQ/sah9N3Fu2UpEl75b8opj64xmMnoOhBHYo
 3poimANOAF1cYFHoPCz0TKN5z6/Cl+GmkeIY8mDKSz7u9x2pOI6JATuBlWsw8NqfiIon
 Xaq/g1UsEPu907xvs/9zE125HSN/VScz4Jhvjo53rvjY1cm3APA/GRIqOtp4OiEdcx0S
 d4loC1wvD87RD8Qj60hVtA/uouZEk/3JL/yfy6HDm0Jpm01OuKxGMvvRBcKyXO5m0vwq
 qqLVu24bKthvpiRBfeE68rwly8XD7Fk7/i0Zyu1vlOcdP7L2qXNQGgz1zJbzdpZBXVJ1
 fuVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfNo3Zn4gDqP1xFImFGZuKRzCMGGWQyuwkv4dIVF7n1ptpJNR20+oaZhzCDCGOEzVgMJm4TNQmCg==@nongnu.org
X-Gm-Message-State: AOJu0YzMSEEUv1tAwhZmgpSlXrnwUTYxPwEsKCtZ2+fZAdyEHrROF//p
 c/vKcsOMJ5R/CAOD1IJFai6oqURWKAD+ZkogEezT30bWvcfGRJ/7OgK8bf+LVWKxv68EcWbuVZ5
 a
X-Received: by 2002:a05:6000:4028:b0:37d:4cef:538b with SMTP id
 ffacd0b85a97d-381f1872621mr12245629f8f.26.1731435097732; 
 Tue, 12 Nov 2024 10:11:37 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04211sm15991976f8f.94.2024.11.12.10.11.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:11:37 -0800 (PST)
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
Subject: [PATCH 08/20] hw/net/xilinx_ethlite: Add addr_to_port_index() helper
Date: Tue, 12 Nov 2024 19:10:32 +0100
Message-ID: <20241112181044.92193-9-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112181044.92193-1-philmd@linaro.org>
References: <20241112181044.92193-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: 068SywyC7Opl

For a particular physical address within the EthLite MMIO range,
addr_to_port_index() returns which port is accessed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 20919b4f54..fe91891310 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -24,6 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qemu/bitops.h"
 #include "qom/object.h"
 #include "qapi/error.h"
 #include "exec/tswap.h"
@@ -86,6 +87,12 @@ static inline void eth_pulse_irq(XlnxXpsEthLite *s)
     }
 }
 
+__attribute__((unused))
+static unsigned addr_to_port_index(hwaddr addr)
+{
+    return extract64(addr, 11, 1);
+}
+
 static uint64_t
 eth_read(void *opaque, hwaddr addr, unsigned int size)
 {
@@ -190,7 +197,8 @@ static bool eth_can_rx(NetClientState *nc)
 static ssize_t eth_rx(NetClientState *nc, const uint8_t *buf, size_t size)
 {
     XlnxXpsEthLite *s = qemu_get_nic_opaque(nc);
-    unsigned int rxbase = s->port_index * (0x800 / 4);
+    unsigned int port_index = s->port_index;
+    unsigned int rxbase = port_index * (0x800 / 4);
 
     /* DA filter.  */
     if (!(buf[0] & 0x80) && memcmp(&s->conf.macaddr.a[0], buf, 6))
-- 
2.45.2

