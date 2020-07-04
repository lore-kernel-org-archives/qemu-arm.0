Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3422957lfm;
        Sat, 4 Jul 2020 08:39:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDYRSEgV4fHiriJJ5p+bZ3gqhVns0KWte7rUFNW8VdPSgif4GAewJdPSC3MLdjZoE6uuG3
X-Received: by 2002:a25:bf8f:: with SMTP id l15mr65768706ybk.453.1593877199509;
        Sat, 04 Jul 2020 08:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877199; cv=none;
        d=google.com; s=arc-20160816;
        b=HmQql4pwlS745KcJsYncH5ZBNN9YBn5mGRHuwFw2I3YLPa5NfrIBO7O9BoRGG5jtq6
         AR840TSW2PmuanoM4fTbjhmhQyyVITrxirqfn7N2h0eFHpQXAsEKKGtQfyR7c3gjH/pj
         0U0BicBS/54JPQq75C6Lql4gG1NjEOqk73CXPmgVOk891HaX1GgiEBb5alfXYGQiFioV
         kvL3YeMWpNCDrq/9zrJOZfo7qwV1tb3VdRLwfqLZeZyVfb3+yUO1C7S1m8csszL1kT24
         nIwbgVVRxhFk3BuCTWkJcNCiVJXETBfYtbnf8JVPzoyMAwTlgqo9jceiKusSGek+j5Mw
         sBxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4VxXE4SCiQENXjR0p5gMwHzmkYsDqhVYN6kqXLwme2s=;
        b=EmBEtCAmMCDLnzmodGV6vBu6X15xtDJZWcNJtCo2MjNkKOSB4uRJZ8fBxfDH2mAjji
         65M74kHTu8C7eaefMP8GZPfiNdNfGGYIcRcxUVKtxvbBG1o0MAC2rKs4H4jm1Zt2PsMB
         /iimd7mCTUcwVhUABcSetDO8MBvg8AOCA7OYWbBL+SGP9mik0xJH2NMA4AH/WtAQ54hE
         CuEzhORDjVsXl9MUweWJ1ayrHmlQI2a0MAKeM2AFe56hxZEoemaRJn3S5jBgi3bgjKXl
         UbTBdr6hg7K67WSg4twjy/qrU6nron0zibzH5fR+JCD4N1wRNk2II7tl6b9chmKhm5qB
         L9zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OZ7x3F0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 23si14419374ybf.120.2020.07.04.08.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OZ7x3F0K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkGk-00012z-Q8
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkGB-0000ga-92
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44438
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkG9-0007Sm-0K
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4VxXE4SCiQENXjR0p5gMwHzmkYsDqhVYN6kqXLwme2s=;
 b=OZ7x3F0KfnBBeJLBGBYSuRS4OwXUIkoslH2dy+3a4HMwnQ77x9699ExR1sJz6nY59V/Ot2
 dpArIDx9FLxEgFQq/C5ES7oKzfBaEC94rZ4sRkJTmmv9oR8MUiuEG1FpZjazzoaSy1SEz5
 GmWjp07TcZKqcnxNGwsjtUKMtbGmaW8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-klUsNQPGOfeQ81pkV0trkA-1; Sat, 04 Jul 2020 11:39:18 -0400
X-MC-Unique: klUsNQPGOfeQ81pkV0trkA-1
Received: by mail-wm1-f70.google.com with SMTP id s134so39746064wme.6
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VxXE4SCiQENXjR0p5gMwHzmkYsDqhVYN6kqXLwme2s=;
 b=M3nF/n2hPp1QRhB+vSOVLNK5aC7A75CBKywZCe/z3+8oFM9EEQrohMnQ8hJY+c6R6l
 IzBFeIQbNYl2TWzR0iV9Rw/aCGWdPPbQV/ffBg2vXFlb6ItJvFu615NuSu+f25dPXmuI
 kp5uv4fwCR1GeS0il3RyOfCnzsk9rrIQSS8DHXY/tkjK0F3I9ffEjbej0YYBGSjWdZCu
 K7nNOkwxWhZgGJmfTWGgm/+3Lm0qv9PytMZI8KXSiy0p/J2/MqWYbAbacZNygHqOE7qG
 cz8XGjd42SbZyJgn4Nrr8caPNpah9LMWHyA3vtTA4CwgiD/PA64eh25DQ4y8AjC3+lEI
 fl7A==
X-Gm-Message-State: AOAM5329h07Db5MnAiBYvzoJWRHI6Mc40DpNFe2tD3Yw/F6TDh0k+JFz
 bliSJC327r/2qCIdrNv5V2W+dM69XLT9PFJB9H/HGfqosKfw3qMaPxGV/d+6OSONDsrIpWNx2QN
 itFO1FTtEnR6d
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr41861940wmg.93.1593877157279; 
 Sat, 04 Jul 2020 08:39:17 -0700 (PDT)
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr41861890wmg.93.1593877156946; 
 Sat, 04 Jul 2020 08:39:16 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id m10sm17446986wru.4.2020.07.04.08.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:39:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] qom/object: Update documentation
Date: Sat,  4 Jul 2020 17:38:46 +0200
Message-Id: <20200704153908.12118-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +6MpYqzDotod

The documentation was introduced in 2f28d2ff9dc, then
0d09e41a51 and a27bd6c77 moved the headers around.
Update the comment.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 94a61ccc3f..03dcd3623e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -43,7 +43,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Creating a minimal type</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * #define TYPE_MY_DEVICE "my-device"
  *
@@ -144,7 +144,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  * <example>
  *   <title>Overriding a virtual function</title>
  *   <programlisting>
- * #include "qdev.h"
+ * #include "hw/qdev-core.h"
  *
  * void my_device_class_init(ObjectClass *klass, void *class_data)
  * {
@@ -168,7 +168,7 @@ typedef struct InterfaceInfo InterfaceInfo;
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

