Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1258050ejb;
        Fri, 16 Dec 2022 02:12:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5K1S5s2gFuid9lLKlSIssttrnokj3cDmfZGcwGRc3sc3/cmwHGYSjXduN7tqqmy6mJxAPR
X-Received: by 2002:ac8:544b:0:b0:3a5:3136:6be8 with SMTP id d11-20020ac8544b000000b003a531366be8mr40983475qtq.45.1671185569759;
        Fri, 16 Dec 2022 02:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671185569; cv=none;
        d=google.com; s=arc-20160816;
        b=LT8u8IG3EUwNig4LOsVUH0Si+e3Goy33BdjIsJDX4W//DEN/62Yo0HhqjeWqbj2Kqz
         Ul6qsL7T4QQe8r7MxUssi4HlcQ9vg3eqxMaV2K1QqJV7FJryWGNF9GGmj1LQk8rvqS2R
         jx/13c5dDY1UNvCf2371pRGfhVN0RZQ4/BQXLjRMP1SZ4eHmHswPT1AatBj7a2/ebZfS
         b3SQ/zcAJLRuo/4kKU8Xh8/GU9+++ik6GgLaf6/4+4AQmnk0ZKSUH0xRcAkIADMoNJc3
         Vnljvo7QqieYbh9VZlydZNg1gqCOGm5xTy2VY4FIJQQaVUR4BvJ6I3l6CBj+/N/pV9AE
         isuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=30j1/r+lLCiHNMK+QxLSU6zJ0uTEAXQJZLTxiZMLmnU=;
        b=ojj038RtpcQmVN8ZAgZkLhmla8KZZKQDXvsKURLE1Cwhg6dXzdqAVeuUDJVV02EHHE
         5/BpRDQ/2QouWIs1PAWCnqJoHrewY6OuHx1c7sLz0B7M8U2wfvwDp6ZDdOHdxFNcL99P
         Cc1JGXzj6y6pJi1VWsnbKdrcH+OlmKGfUHNilR7/RKnm58xHq2i9B97JhmVtYdH9nbHL
         nSTaAMSQOqxInmDsU2cTSG9iIz9lYIuJYCT/xz+SPJnN/CJ/6ynCzl/a/sxSr7lyhJN4
         AmN3toyvWlhmEkZxXJSSbP5fMb1tTXcd8qDFaLp/Bo/gG3D9sky/7Gf0JbR6VZ1NmTL0
         cMLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L0WI2ggb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ac845d4000000b003a6a7728c2fsi801749qto.753.2022.12.16.02.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Dec 2022 02:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L0WI2ggb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p67ht-0006R3-LA; Fri, 16 Dec 2022 05:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p67hs-0006QZ-Pm
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 05:12:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1p67hr-0003DP-92
 for qemu-arm@nongnu.org; Fri, 16 Dec 2022 05:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671185562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30j1/r+lLCiHNMK+QxLSU6zJ0uTEAXQJZLTxiZMLmnU=;
 b=L0WI2ggbL8rNXbOA2CCijCUaqJBLt7+nboEWhWJ/1+L87KNSXKMmGqLZBV0k9bYQt/ykmw
 7Wford+NtY3nFIiCZolpR+2dfWtCuTfQ/KRjJpAo1aj82bQ4cx1X8FeCaKi7ccpCEt+L/p
 xb96TQ81fRUM9mtFnoKxlt9SJ0EffkY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-ukVZfKnJNvO97U8vbpp4Zw-1; Fri, 16 Dec 2022 05:12:39 -0500
X-MC-Unique: ukVZfKnJNvO97U8vbpp4Zw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC434858F09;
 Fri, 16 Dec 2022 10:12:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 72B1E2026D68;
 Fri, 16 Dec 2022 10:12:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E6C401801B2D; Fri, 16 Dec 2022 11:12:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kashyap Chamarthy <kchamart@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/2] docs: add no-padding firmware feature
Date: Fri, 16 Dec 2022 11:12:34 +0100
Message-Id: <20221216101234.2202009-3-kraxel@redhat.com>
In-Reply-To: <20221216101234.2202009-1-kraxel@redhat.com>
References: <20221216101234.2202009-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: n149pDz55Drw

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/interop/firmware.json | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
index 56814f02b3c0..74f404d745b0 100644
--- a/docs/interop/firmware.json
+++ b/docs/interop/firmware.json
@@ -191,6 +191,8 @@
 #                  PL011 UART. @verbose-static is mutually exclusive
 #                  with @verbose-dynamic.
 #
+# @no-padding: The (arm/aarch64) firmware images are not padded to 64M.
+#
 # Since: 3.0
 ##
 { 'enum' : 'FirmwareFeature',
@@ -198,7 +200,8 @@
              'amd-sev', 'amd-sev-es', 'amd-sev-snp',
              'intel-tdx',
              'enrolled-keys', 'requires-smm', 'secure-boot',
-             'verbose-dynamic', 'verbose-static' ] }
+             'verbose-dynamic', 'verbose-static',
+             'no-padding' ] }
 
 ##
 # @FirmwareFlashFile:
-- 
2.38.1

