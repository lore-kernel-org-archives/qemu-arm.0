Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp326022ejb;
        Thu, 19 Oct 2023 00:19:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKjnot6YmFA3vMbv29lAf6lKosS1LTwlgjjBgCVxkcXOZLiD2ni4mT5ooQTVhu/kX6sP5f
X-Received: by 2002:ac8:5742:0:b0:40a:fc6a:e87b with SMTP id 2-20020ac85742000000b0040afc6ae87bmr1754219qtx.22.1697699968699;
        Thu, 19 Oct 2023 00:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697699968; cv=none;
        d=google.com; s=arc-20160816;
        b=nK6YfDlxbKvxHPkkvTYOVPYUAIVUnwbP1QDKtybeQvqhVBas3nKWTlUYqlyJhZVe0x
         1xvfqd17Oo9Ros01ILK9JzV458otcN0kFP5xrBLw/MEndZEH5bBVvyYmREtN3EIecWOn
         LmCy8u7zKR8x22AFEnIE9kTKo4gql60fk+gsG6oIDui+l4A1HXHQ8uEgcB7FCNXz4mX7
         CdGDWU9GyxC71FABYdbiW5fmbnPwCWfX0zz/LmOwogRvs7meqX4hTFho2sEpX1Lox5f8
         3RIJN4nTFDhr97VgVxM9n7ILinON8dMQhD3WeUpisthoJuSIH7ZW3QI/3LBVWgJ1XVy+
         eFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tjy4VY50gso0Sthhkiy2414qiUoINUMpVZWnAj6oAWs=;
        fh=6jYKO1R8PvzdW4tN+W/XYlQifBf+lht0eG+bQc5OUAg=;
        b=hBGdspYRlLZ9JImNMAMoNihuPNegsyHxqlBF8lRLhRQybnqcHJke8ifLwaX9FvUGFy
         K1r5TVKNRew67kKU4YV9gkLvHXdWqoK5HoUof67FbPtQu7RfcAFqfkxHTbcAmOk5ohGx
         8+cX8pq2eZVI2OMQ2n6o6lyuG2UBX5W/5H0xZ3cjdhRgUESZWRuSuZZd671cyu6UhL+Q
         25iDQwh+yLqe/dS6WMxkm71hPt4I47pMG0JJn/tOK2YbsPxmeEUTgb0aK2Ha2ajm60U8
         rVfOP8ZdCSlIkj+JiHGyl+qozyrkuVIoNgq6jqjJJ5PZCRNZJVQVIzZ19LJoN2PbSX2Y
         N4jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYp3ovF0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u29-20020a05622a199d00b00417d78906c7si1209517qtc.292.2023.10.19.00.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 00:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wYp3ovF0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtNIw-0007pT-2M; Thu, 19 Oct 2023 03:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNI3-0006Ce-Vf
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 03:17:58 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtNI1-0003LL-HN
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 03:17:55 -0400
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so88911981fa.1
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 00:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697699871; x=1698304671; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tjy4VY50gso0Sthhkiy2414qiUoINUMpVZWnAj6oAWs=;
 b=wYp3ovF097Nwnp2LC2J5uFnGlBk+1uRWZlFJkFCx4RMAMiXC3HNxfLnrtP8ci5hFAd
 GXL+It4pxeKlGD3o5b/FVoZ1+RMoKLI3/Uirhz3sbHW4oYsYPyLi/GTJysGHBSmkJzFk
 gyKrMWg73i5bHnv/+tKzMzEteUkMJKKvYJngqyx0QcLsVsWKHAKzjguPY7bu25LddIeg
 qytnhG3sUaVuV5Ri4pSro5mniaUVjm0kxsqS5Lnn5frTwFmwvwlpJwKkmRJmbkL2if/S
 aFfucJkv/+S22Vb+ut8QyHXeO0UrcnNPNRgY8OJvtsBO2xRbWJswwqT95cu8Q4RASKkw
 H0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697699871; x=1698304671;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tjy4VY50gso0Sthhkiy2414qiUoINUMpVZWnAj6oAWs=;
 b=cO7nRENxuU1Z96mvjeYgacou7r/SmO1JINFxMKpJGGptqeTuutf6UL5PdN9E2a0UU1
 7zrTSQVYDe4O+irtj0aN5dqAd9Um4lCzTwb7tA08GAXVNDoGuQcVz2Ut0UVwQqqwJp31
 FKWn5i1NwjF+VonZG42JImgRUBRKlzs4eLeKwnLh59rk7a8RJa64SqaqhZI9jCJKHHKp
 g8mUtm0MJxpk+6GKOsP4INByGK16lAIcQPbdi3Y/Ce5ensJ0d+oz6TM2edRekxKYk1EF
 Ck5acpK8re03SLnQbHveRB1xOax/GZW8GWD6mGlTa3/4Y3tlHdamTIhUO9DVvuaiLVmJ
 WPDw==
X-Gm-Message-State: AOJu0YwQNCD0hLhEmL37yyKf4p/nGcgKHnxFcIsAqBbPBiXwhNsslCgX
 fRIfZQnNaVd8Icsksw++NTMouWRI8GtTgm4ETNw69Q==
X-Received: by 2002:a19:5f57:0:b0:502:fdca:2eab with SMTP id
 a23-20020a195f57000000b00502fdca2eabmr812219lfj.37.1697699870247; 
 Thu, 19 Oct 2023 00:17:50 -0700 (PDT)
Received: from localhost.localdomain (92.red-88-28-12.dynamicip.rima-tde.net.
 [88.28.12.92]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d480d000000b0032d9523de65sm3741200wrq.48.2023.10.19.00.17.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 00:17:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-s390x@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>,
 Sergio Lopez <slp@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH v2 09/12] hw/s390x/css-bridge: Realize sysbus device before
 accessing it
Date: Thu, 19 Oct 2023 09:16:07 +0200
Message-ID: <20231019071611.98885-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019071611.98885-1-philmd@linaro.org>
References: <20231019071611.98885-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x230.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hC4FJabyU2FQ

qbus_new() should not be called on unrealized device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/s390x/css-bridge.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
index 4017081d49..15d26efc95 100644
--- a/hw/s390x/css-bridge.c
+++ b/hw/s390x/css-bridge.c
@@ -95,7 +95,6 @@ static const TypeInfo virtual_css_bus_info = {
 
 VirtualCssBus *virtual_css_bus_init(void)
 {
-    VirtualCssBus *cbus;
     BusState *bus;
     DeviceState *dev;
 
@@ -103,19 +102,19 @@ VirtualCssBus *virtual_css_bus_init(void)
     dev = qdev_new(TYPE_VIRTUAL_CSS_BRIDGE);
     object_property_add_child(qdev_get_machine(), TYPE_VIRTUAL_CSS_BRIDGE,
                               OBJECT(dev));
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     /* Create bus on bridge device */
     bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
-    cbus = VIRTUAL_CSS_BUS(bus);
 
     /* Enable hotplugging */
     qbus_set_hotplug_handler(bus, OBJECT(dev));
 
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
     css_register_io_adapters(CSS_IO_ADAPTER_VIRTIO, true, false,
                              0, &error_abort);
 
-    return cbus;
+    return VIRTUAL_CSS_BUS(bus);
  }
 
 /***************** Virtual-css Bus Bridge Device ********************/
-- 
2.41.0

