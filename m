Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5206122lfc;
        Mon, 8 Jun 2020 09:05:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvVFzfbdI0cQRtXXnvE76xDBdpyzwR1HEeml/HWE+5CYFsxuT3JS8r/xiaU7OcqT3qRun8
X-Received: by 2002:a25:50d5:: with SMTP id e204mr14251301ybb.72.1591632336931;
        Mon, 08 Jun 2020 09:05:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591632336; cv=none;
        d=google.com; s=arc-20160816;
        b=a5rcFDqH0P5+HfnEhD/bbOaraCAfVErjh/YN8Z91agP8yyHf30VuyyapqzQP3FT7cA
         67EY68Veyumkld5MPEujKkO2fAKHiAtPfDYcJIWceDmwhACL4zoEYmWSq375XncGwwPQ
         pFlhMFXE8+/wqS7tN8fqL+Nh0wS95i2lari2avjTkcC7UBxINSSDA1mHxjrNT9OmSb9L
         lCSEVFhmEIYPXZLuBRQyPjwunHtyzM5K92I+wvjzgWz3weL5ajuqd6YjtQRqU8aSYr5N
         UQit3tRkeTDpC/DU9WNkTRLYbVZgFrnT6GCLN5ANbF8QrGoPUJMVs/z5J4cUdh+I9jTH
         gzmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
        b=abqtJJS/uRBUdOmrx1Xfz1RpeOdvXZHI0vfRD9DHTSqaT8crllzhgsTa8WfI8uow8o
         RZ8ounx2ayasEr0UeT5akInZC90oiQfhFkRlQK38EkuZX3ZZDCA/SKhRRTv0PP/k/dzu
         FE30UyqoTVPdPCTgEqPzdc4hPCcRnrkLEee3ohL3/FEYWDGU7wT27Y0EsUIo6fKDakow
         4RqB5k/uWoGbwxFppedr3NmKkMkGnqFjuvJuJFhSXHZD2LGpCWnDh1/RhdNcsrZh8Zow
         XLIVmdEXU1EorAuFDLm+5cBA20vhNgNRJRzhgzOzT2gxG7fvG5KdMlauaQwlYXCeLB1Q
         6Img==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Z85/E7ak";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si52631ybt.389.2020.06.08.09.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:05:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Z85/E7ak";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKHI-0001Cs-7L
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCy-00060G-5t
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22388
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKCw-0007S0-GC
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
 b=Z85/E7akE3u3nSpvlbcTf1BrW1ETVjVBbwriFvhR1HljjRtYygc1QMW0gi9gvoE4N48vdP
 Cj94hkgnoMzjIV47S98mT3XMIH9wTlUGvVSzzc7E+K2ptek2yo7y+FhcVqZK/oCIPDPRmr
 Z8ZqCFo2oJ8eM9vee8fAGRhlzFqxHNg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-tuZZ2pNuOiaCEPA7o5GHLg-1; Mon, 08 Jun 2020 12:00:54 -0400
X-MC-Unique: tuZZ2pNuOiaCEPA7o5GHLg-1
Received: by mail-wr1-f69.google.com with SMTP id i6so5741670wrr.23
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:00:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awCHYAXUOGkS+dWmNDQ4SQqbGqK/3LMSf+67fZKCnc0=;
 b=i2bShNlrgn6Qtfj8Z5NkN5A4nrZdn+BrcJABVA73C2TRzwFxuEUM1Dwh/7sDHrWK55
 lqo0Nk55IXx9qq0e2Zt03CkAOAQopaaS/oD09LgtNu1mXMbtAr7r4NPw9BxlwD+MrSGq
 txZBUtKebePVA8DwRcjk+T/rASmDUcS3WLQ+MmZenro5lOfd9+SspKvvMCA66hukwtQA
 J1g/MRFlrtAI3FzxF/eymK+utETYih863btHaWvCl8HhpdSpiZqRKgF/u6YcOsu1wITU
 exVDZS3H1R1M4UShW3lH7FMVQm/7PlABsSTide+FH3HO7s+vGtxHNibQ4p8NwJrz/ADu
 cjSw==
X-Gm-Message-State: AOAM531vv/AadZ3oMcSPnQkpiHSFLgfV3sPaRmGGfM3GyRLqCxeRmhgH
 a+TklFtObul9KwdcusyMbJdj3sDXklUzeJ/Al1lAS1MoncCzkCAIF/FXhoTkqHDu/LDbSGhd5Hk
 KPSGyyMVye9XE
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr48574wme.152.1591632053817; 
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
X-Received: by 2002:a1c:a3c5:: with SMTP id m188mr48526wme.152.1591632053569; 
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id w10sm187197wrp.16.2020.06.08.09.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:00:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 01/35] qom/object: Update documentation
Date: Mon,  8 Jun 2020 18:00:10 +0200
Message-Id: <20200608160044.15531-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 05:40:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IUzCcHvWEIm5

The documentation was introduced in 2f28d2ff9dc, then
0d09e41a51 and a27bd6c77 moved the headers around.
Update the comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index fd453dc8d6..eb560bf32f 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -45,7 +45,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Creating a minimal type</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * #define TYPE_MY_DEVICE "my-device"
  *
@@ -146,7 +146,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Overriding a virtual function</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * void my_device_class_init(ObjectClass *klass, void *class_data)
  * {
@@ -170,7 +170,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Defining an abstract class</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * typedef struct MyDeviceClass
  * {
-- 
2.21.3

