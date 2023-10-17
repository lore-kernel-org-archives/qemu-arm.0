Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3942095ejc;
        Tue, 17 Oct 2023 07:03:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7S5F/GmoX/Ze/cEu8NeX+C9Ib0F8wlFj2qfhOmcL3n2Jt2mdTu7kDDx66sMMilFT93aBi
X-Received: by 2002:a05:620a:370e:b0:775:7be2:8c8 with SMTP id de14-20020a05620a370e00b007757be208c8mr2638021qkb.61.1697551380716;
        Tue, 17 Oct 2023 07:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697551380; cv=none;
        d=google.com; s=arc-20160816;
        b=uHn6kfjjgWmY66gXtopmzYj3MT9yNYyYHgv5Sw42M8cduxVTj6Wo1am2P1wTfKCwzB
         KXLChqbPLF/asbPex1yoZfS+WQ/MB51Ao3g4E/HPAXZgLWh2oim6v9iXozezHVSNoN3g
         PSmT3I9k+qqNpINYlA4JHPCwndX/0dlKab5qsYWMVN+nQwdoZ3gcPFy1K1G8qVIjyDg4
         TaExKHx05D1AJeLnAORkxJ+ob76zn1saEYFs/n3zLPVRdv2IP1+THIpZ/82g/ydEpGEO
         QdsglnlkovObjFc8dReLYf0eOgTh4uz1UNxQmv79MpsiJmUpmBMTPtuARqL1QGBxJfBG
         58WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NToGoJ6Wynf9U+JMhRHgYhmueSEj1NaVzBYgpFOz3E4=;
        fh=PkQUf9c5shm23GEgSgwIjaGjrTFXVTBGToef+bFaIfM=;
        b=jHziQNDAKq1fhDs50pav1BWbLbKHF0WY2N+Ke+e7VAm8AZORuDRQsSX2qiKoGnMsx5
         YQC3tGBA4biVTQZ70EKJpbACd54xAEUtQK5JxQGpNUA9oG7UKJfnWbo9BzdRTOZuVClO
         JScIXl5VKfkFZ1162YkypWWvgD4+qjPA59ZSUCJ7J9CNYdbgpwvVG4xzgSDWQdy1Htlo
         6od7W45tB84lMuuiNfL4WHj7+A4bm+yaKQJn6V+KAdYaSmYON7hLstgzLp6wZqVnQ8Wx
         ZyNiz0ejsF5Emht4AqDFxIndQPBD1ZKsPqfek4hcJiStE65ebx1NVM8g3sWthEZwonVF
         +Evw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ud+JuwQq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a05620a015100b007742286b280si1101945qkn.457.2023.10.17.07.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 07:03:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ud+JuwQq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qskeu-0004zj-28; Tue, 17 Oct 2023 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskeo-0004P1-Mg
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:52 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskem-0008RC-8C
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso2280389f8f.2
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 07:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697551359; x=1698156159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NToGoJ6Wynf9U+JMhRHgYhmueSEj1NaVzBYgpFOz3E4=;
 b=ud+JuwQq1dph6KsVXgWvspTQVI7sdDS3ycspcbTA4YwwurxLANaNIB6FsnvepHr7fX
 2MYfvF49fVzTptSTTeusr5O6e0Egr0RIeyUhmVpZ32V5p+uB0/Nugd63oD/4wkb1Kqk/
 J8eOjbsWY3XgKRsRBebsK4nCGhy2E+uKev06hDx+EWV/urBhuBzghfqd5alMcQxIfw2B
 c4TENnQhggLvnnaMQhecFUMDyDJnWG/6N8rNtG7lkt1hythIW5Oa7EyVGbs4wOpJtYjn
 JxIRdtQD9fzS6HzIXscCLAN+keWIVrLYbmP1VStmLbVSUDmoHDpxosQqEBXBeFSiSFYG
 +IJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697551359; x=1698156159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NToGoJ6Wynf9U+JMhRHgYhmueSEj1NaVzBYgpFOz3E4=;
 b=N57vZdo3WFvIhARKmtPkciaZ5ySGkBVQIqH/cKs1e4o1RQ8RyIflmZNlGuBpqIKYTR
 xiQF1B7eLHlUBUxnet9Jwwezxd+IsKS+Kj/ZQUAMhAvFNWtZTzYgJJggl9OcQdSazkos
 0R0Luk3e4Jqh+7zeY7qS1CqYVRlw0sRGMEuQKypmG153YWsgdV01e0RW0jgOEpeku/n5
 V0B8opuxdUBQG3ya+oXgKIW30i4JFj4tjkDL27UW77KE/Iqt9Jg+Qu8gjAZFlUkdVUcf
 AuNrOQPknjgvjtDMa/iOsHygmpbcEi591s3A1Mj2fdw+spTnl3eNqAWhiiWGuRekmvA1
 B1Sg==
X-Gm-Message-State: AOJu0YyaKjzTNwVM6gv1AyZJdUFjJIENdgULjua1ZPNOM7NM6uax4lX7
 0NHFlR6g3vqmZZUrzNyXyw2JzQ==
X-Received: by 2002:a5d:5107:0:b0:32d:937c:9ac9 with SMTP id
 s7-20020a5d5107000000b0032d937c9ac9mr2373929wrt.31.1697551358060; 
 Tue, 17 Oct 2023 07:02:38 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a5d6751000000b003200c918c81sm1735455wrw.112.2023.10.17.07.02.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Oct 2023 07:02:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/7] hw/net: Declare link using static DEFINE_PROP_LINK() macro
Date: Tue, 17 Oct 2023 16:01:49 +0200
Message-ID: <20231017140150.44995-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017140150.44995-1-philmd@linaro.org>
References: <20231017140150.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: 6z4sOuZCWwdY

Declare link statically using DEFINE_PROP_LINK().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/cadence_gem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index f445d8bb5e..37e209cda6 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1654,11 +1654,6 @@ static void gem_init(Object *obj)
                           "enet", sizeof(s->regs));
 
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
-
-    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
-                             (Object **)&s->dma_mr,
-                             qdev_prop_allow_set_link_before_realize,
-                             OBJ_PROP_LINK_STRONG);
 }
 
 static const VMStateDescription vmstate_cadence_gem = {
@@ -1691,6 +1686,8 @@ static Property gem_properties[] = {
                       num_type2_screeners, 4),
     DEFINE_PROP_UINT16("jumbo-max-len", CadenceGEMState,
                        jumbo_max_len, 10240),
+    DEFINE_PROP_LINK("dma", CadenceGEMState, dma_mr,
+                     TYPE_MEMORY_REGION, MemoryRegion *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

