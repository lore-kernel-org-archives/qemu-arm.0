Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp811422lfp;
        Wed, 5 Feb 2020 17:20:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+AKu7VLtaL3Uecla1RcW+ysXKhaDPDyR5NknzzrAncF7kWp4dqrcobfTEhzXmbtU6mGgt
X-Received: by 2002:a05:620a:1289:: with SMTP id w9mr482567qki.290.1580952008525;
        Wed, 05 Feb 2020 17:20:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952008; cv=none;
        d=google.com; s=arc-20160816;
        b=xEih2u4ANu8lAGQ7W8JE2O/wR/0Up30QIy1+byyg9Vxwc10Q0gVjbEVlDNSdSKvScS
         JTV693uN/Xgg3uWkxqdvS1ucUITN5WGR2Vglt3RR4qTdNwgrdUPtnfF+EomVZjiiV7Kz
         UTiDT+XjyEBWx7S+xGC7y1zlePgmhk55E5GGwMSFIT4RonrqcmBLWF4gP7hJk6r2UjUO
         VNQdxnzMCrpD5l42CgHmNEBAp0k10F+Sj7WsL03KByOj/4pyxGr0/mXmrpKRyN2sNni1
         fUB0ZAG9ONKGVNS3C3uQhC5PD4QfQYMS+VpOK/NHPDopX3Bs8Wf4aayT0hUEKIHBs46e
         6OVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UVyn7DVfh5CLRBiwnsBkNYjNqPu43cXEQWrJu301xpo=;
        b=b8l5MBVU4xI6ExYleNxoK/SxaQHyIzuN9//WP7rBi4R0PPIzVSRM+OP4fDk6SOj8x7
         KTj1lxhUHJnNxC/GvVFhrHvegV//s689DrEeQSFIcIS9wrJKGjHVTU/V7Q2bLnGb+kkb
         suHJNkCx+kK2JfoVvFGb4wOlX7/f/7waZngi0lwmutgsvB269a+/oDdewGUtEIoVihqx
         ATbx/g0KiVDrQRtQry1j6//0iUjmQA6izOyvHkEdggQdG8vdxFvo5KlRfVWPtkCNFu8o
         6Qj4l4ZZkrA2qKakDovbfDJtNs+b02OqWYvULQdqYVWYakXbWrGqHBNV+TMd7let6TdS
         +1Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="AUfo/W9t";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si648149qth.68.2020.02.05.17.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="AUfo/W9t";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVpv-0001Ro-UL
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53471)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo1-00007c-Hp
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo0-0001bO-HY
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 20:18:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34210)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo0-0001UC-Af; Wed, 05 Feb 2020 20:18:08 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t2so5155344wrr.1;
 Wed, 05 Feb 2020 17:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVyn7DVfh5CLRBiwnsBkNYjNqPu43cXEQWrJu301xpo=;
 b=AUfo/W9thrhMxSoZJdlgMGst/XPuRov6AzY03twTPbptlnh83vKxw7aXmVjSc7HfA0
 8rPqSC+jXwvq77ejRibs8QAYj7qdp9E9Ba7aEjyCbtvcjAeb5UiEdrk2hmZxtdueavWH
 xDUQAqWsubgJMeOGZf7VNneqpPrQTERrZBHN7Iw+01OKutZKrMuDbiTA/yI5YkCldFkq
 7SgHeDDasfqD0atmxfdIwfzOYfBwwQRVVxZHIFE+sZYPl0619ZxgCdHQpGALYOKR8HuY
 bJbK/MSeDRZXgMCTsv2abPaQ+1WfY9VJAULlx4UrR7R6/+OrloLWHbKvB0/ec9OLZF/I
 3ybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UVyn7DVfh5CLRBiwnsBkNYjNqPu43cXEQWrJu301xpo=;
 b=JywsU4aloe7b35++OV8LRJbuesfdnONZsC/QYPKgu8LVQU/8FXumbkw+6GN4rcPNk4
 ixWF5i+B8zsftFkPKE0OXqYC9CIDnu0Fk0kt+QgGyYOUiMOju6t3buU+Mk8Hyp5YbY10
 9bTHomLs0Vkwv37M68D9iuXedFnV2KsAN6xrvxfJS8tXD6t6Vnpc3pPojwR4qBAtOyR0
 Q58DqziHRlTuTNvh1ennknZD4QD4vLJkO8IwufCr2KpTIWT0elmUS1ifFE34m6YA1AMX
 ERneah34a4rR28AHYnrapXSO217Z5OkR1GELuHLv9ntlqtE5RxZmsnyNu7/gT5FXgjTA
 ahtA==
X-Gm-Message-State: APjAAAWrNzwbKyumFirg4NyOuhBoovYK5RCvuaAGdpT06kmgObI0RTlD
 7O5AzMdUJ4beKbnRHeB/LAoH4isK
X-Received: by 2002:a5d:4687:: with SMTP id u7mr363985wrq.176.1580951884832;
 Wed, 05 Feb 2020 17:18:04 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] hw/arm/raspi: Correct the board descriptions
Date: Thu,  6 Feb 2020 02:17:28 +0100
Message-Id: <20200206011756.2413-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
 Joaquin de Andres <me@xcancerberox.com.ar>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LpXwUw4v6JCA

We hardcode the board revision as 0xa21041 for the raspi2, and
0xa02082 for the raspi3:

  166 static void raspi_init(MachineState *machine, int version)
  167 {
  ...
  194     int board_rev = version == 3 ? 0xa02082 : 0xa21041;

These revision codes are for the 2B and 3B models, see:
https://www.raspberrypi.org/documentation/hardware/raspberrypi/revision-codes/README.md

Correct the board description.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index ef76a27f33..3b892bb509 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -220,7 +220,7 @@ static void raspi2_init(MachineState *machine)
 
 static void raspi2_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 2";
+    mc->desc = "Raspberry Pi 2B";
     mc->init = raspi2_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
@@ -242,7 +242,7 @@ static void raspi3_init(MachineState *machine)
 
 static void raspi3_machine_init(MachineClass *mc)
 {
-    mc->desc = "Raspberry Pi 3";
+    mc->desc = "Raspberry Pi 3B";
     mc->init = raspi3_init;
     mc->block_default_type = IF_SD;
     mc->no_parallel = 1;
-- 
2.21.1

