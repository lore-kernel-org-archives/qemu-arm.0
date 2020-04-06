Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4239962lfi;
        Mon, 6 Apr 2020 10:52:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJx1VeyqJQhjNmbq9R4GqATXG/7ax1pQC/ae56zH1FgZEK3Z8Ddv+WqE65xk5TqG4YjlIpq
X-Received: by 2002:a37:bd41:: with SMTP id n62mr21878089qkf.127.1586195538131;
        Mon, 06 Apr 2020 10:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586195538; cv=none;
        d=google.com; s=arc-20160816;
        b=rdJNkW1lNWSRhUZFMamJ/t9UfT1CPoQ7prE/j4vQ4wTuKqwz5IoX0ubMTry+mGPdtu
         3TFBMJIXFP8QIbxb+Gt46hf7G8lA6BU31wPEkS1ZQ7nA7AeZL434iAsNaAzVTe95/00e
         OBuS3Qh02US+ZBt70+JYogV/hmDmfaIXeP7T+/v8ULR4nnL3ABfdAbNGZ6g/EVVq81DX
         +aBALxE7EBl0iskR5DptSfczPP+5DSdYzs25s61xHcjuqCN3K44YiKygkDrOlfhfiJIR
         +sI/YM8mvscoV7xsanzgHD8dhcN3VjZEaR33BXGFsUBlGW7OB1P/lmoUfv2UAqr2D/f8
         qJSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zYpWb46Zb3WjHhWYjAhvTjDn7e4H1J5r3AnlR5BkDdA=;
        b=P+4LxSxdrw1OPJsgegoLJcdMfN0c1zNaVCFUAoUXvxNqDW0T5kiS3RiviRSZB9HJE7
         ZPZqsnqseBUd25leC3BbscxZCZZiuxC7B16lMwbeIakp6fc1BA5FdmnkizPXsvERrUE3
         Fq/rD9vXzdpG2YZXgQU4GCL0v7uHmlZT9V3gy7A1XwywzP9cHU7c24IUy03REVwSATWB
         JixvO0zx5SgfRekAvYaaQ9oqaNrac/fX7t7WlV09I3VQH2+L/ya8RbOdtwLb3pdEG8Jc
         yY8gL9A2W34LTDet18IiLSRoqYyk+zw1LeZvAIoeSJnxNXD5Y4TNka8U43lxQh3L2oNp
         2PHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=koP1HxoO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q75si332780qvq.150.2020.04.06.10.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 10:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=koP1HxoO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLVuz-0008Gf-AG
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 13:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVql-0001Tt-VC
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:47:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqk-0001Yx-UZ
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 13:47:55 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38917)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jLVqk-0001T2-5T; Mon, 06 Apr 2020 13:47:54 -0400
Received: by mail-wm1-x336.google.com with SMTP id y20so305235wma.4;
 Mon, 06 Apr 2020 10:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zYpWb46Zb3WjHhWYjAhvTjDn7e4H1J5r3AnlR5BkDdA=;
 b=koP1HxoOe+IJv1RQ3fCFQAEZSOvw6wlwL/SCXUKZhAeCZZuYMB0jG9um6nWoiuCTo9
 kxIu1UszPucOy1Qkdgr81e/B8udpNOc4uRShRk04JCDMIui6SAUC3tu4tPeCndbYGLLu
 A+vf1TbyyAgPh7nDuWhkecv6YZEo1X+RXRJP8x42fNSi510mH90ALerwaVZd2n8Dwnds
 yZZrkhLm9Iw7Cc0oaUgqR9dWT+WnYD8NLRTNI34x22U7zWat1omWjb2OzRC50kIJnXLy
 P0N6qwCVqTmzZvlKF7GlVcjpxFufJobkI4HLhROsZLiOOz7TmlLtoU2SoDc6NTicQI+D
 b4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zYpWb46Zb3WjHhWYjAhvTjDn7e4H1J5r3AnlR5BkDdA=;
 b=XIdAa94uXkImMK80VktLEbdkGS2tDbq0xgByJnWOZb4a7NjrADz+VGRFKgkJw3tuei
 NkpRjkZ2gsZX+zEzh7FJsy0xfZVa348qKp8PMlt/CKo0YF/13BabUUjy4WxnhcqXlio1
 nw5r86vvffKOC76iE3g3tNgBpeW9QJaY3zLz8QZrZMB0e2mZ5KGZ5mAEDsmBNNq+s3+r
 PRH60i/pJ1a6BXc3dlMPNWIqii+I7eNFWEzXPnuLG+tXL9W430FXZ2w7A1y8PmByq/HY
 tfw3KTNpCQCewsrpb7eYn7Ro8FvRCFjseUeIfm9/I4d+YoTTPgo/zQvNUY/nYXDggaI4
 bzrg==
X-Gm-Message-State: AGi0PubOYlgQ36RgU9Mk5dtERLHPsGV/oknywZjOZsi+S9BTv7t/R8dC
 B+VDjXAEvL7j/B38tZXu5tNTAVIHTes=
X-Received: by 2002:a1c:2d41:: with SMTP id t62mr181523wmt.128.1586195271901; 
 Mon, 06 Apr 2020 10:47:51 -0700 (PDT)
Received: from x1w.redhat.com (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id a67sm364880wmc.30.2020.04.06.10.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 10:47:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH-for-5.1 v2 04/54] hw/arm/aspeed_ast2600: Simplify use of Error*
Date: Mon,  6 Apr 2020 19:46:53 +0200
Message-Id: <20200406174743.16956-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406174743.16956-1-f4bug@amsat.org>
References: <20200406174743.16956-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8XkVXwLVtYCk

Coccinelle reported:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/aspeed_ast2600.c
  >>> possible moves from aspeed_soc_ast2600_init() to aspeed_soc_ast2600_realize() in ./hw/arm/aspeed_ast2600.c:243

While reviewing we notice we don't need two different Error*,
drop the one less used.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_ast2600.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1a869e09b9..b08359f3ef 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -245,7 +245,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     int i;
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    Error *err = NULL, *local_err = NULL;
+    Error *err = NULL;
     qemu_irq irq;
 
     /* IO space */
@@ -418,9 +418,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
             return;
         }
         object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
+        if (err) {
+            error_propagate(errp, err);
+           return;
+        }
         object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
-                                 &local_err);
-        error_propagate(&err, local_err);
+                                 &err);
         if (err) {
             error_propagate(errp, err);
             return;
@@ -472,9 +475,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed",
                                  &err);
+        if (err) {
+            error_propagate(errp, err);
+           return;
+        }
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realized",
-                                 &local_err);
-        error_propagate(&err, local_err);
+                                 &err);
         if (err) {
             error_propagate(errp, err);
            return;
-- 
2.21.1

