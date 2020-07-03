Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2779951lfm;
        Fri, 3 Jul 2020 13:21:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5dpnu+UrpCej4aHHjR6c4KQA+9uNhsg4G1AjWgmg+i+2kD0jl0kFFCm6+2Hdu8fyFkbqj
X-Received: by 2002:a25:d8d5:: with SMTP id p204mr59167510ybg.28.1593807672303;
        Fri, 03 Jul 2020 13:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593807672; cv=none;
        d=google.com; s=arc-20160816;
        b=v3enQ0ZMJ/7fmb5X+IAp0b52DyDPbnFVLpLcQ98+ALXcsUStYXF11yiduqtWeJ8mL6
         21WqiOXlquV5DhEK5IAFneNaMQcuAbOpvlMfnfr5PBz6GcV/0Jg4m+Tj9JmXa1DXui76
         S4wFe+w5vQoYGxPj6OsSkuM2xcnNWMSFmvk7V3vSYaakl0N5tfEY8Gt02yYk3pQNQf4y
         n1VDExecCyvOl6AMJ8Hjn/P4mRqkEUXzUVOgic4BI1OQxiJvLTLazTbUot9kyfdZIdBK
         PV7zUbO6CN3/A293CdgdYudVKemvWXVH5/X6dp8uaj7POJlcatW4/c13nvknexEC5zXu
         rBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hDAjsWCo4muYV2UGuHt56RhWysQG9sjw6uJx4BVOBUQ=;
        b=cBkmA/rKN3lH+VEsU+K4sEakJeaVxj70OEfVbNFaWuE97yaadt9/OqIZDVjA8kzIfC
         YAFudm3yPVmHdf3aijUp608yCurwjLS8hJrrW2VpTP7Yy9C67JgniOuQQ36gWzGqBtjI
         gHx3sCNX5fAv27TWJbW9F6LKWY2gTc/+HrIdHD3pz0E3wjADDf3yY5k0bpgzOzesAfYa
         RA+mpwMMkS1FccjvrLMd1fjUu6C5R0PZNXSe6VzDLR8A6MtN9M5ILIM1ZjyDRIh5U4rm
         xVWXMi8xAIhqK8jtAdVsMyH5KCtZmlHZUPmK9dPzQN2Xygvvi4GmaEgXuSmKyHDY849z
         J+dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T5deevcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k6si16762395ybt.52.2020.07.03.13.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 13:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=T5deevcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSBL-00036s-LS
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 16:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9c-00080f-4S; Fri, 03 Jul 2020 16:19:24 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrS9a-0001V0-O8; Fri, 03 Jul 2020 16:19:23 -0400
Received: by mail-wr1-x443.google.com with SMTP id a6so33946289wrm.4;
 Fri, 03 Jul 2020 13:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hDAjsWCo4muYV2UGuHt56RhWysQG9sjw6uJx4BVOBUQ=;
 b=T5deevcTXhgqKXgllHmkBGEkLA9yEGSlNTkrTEWmGqAibvBGJXinmQw7EaBFlyTNcX
 N0sRPe0rSHqTYpHtPhOf39NM378uLokFNzcYPeOuMcHDGluWC6EUmzK3bMaJLaqkgw3T
 MUbCA+wfdNOV+ZOP0ifhVZ5eIO/KBWY38sKtMGjZzyt0iT08x5XxyYp6woFtAFKZrzHx
 UcSyT4BvtjLQm70bi/4V8MeVmqsp3bPeEGbVoD1GltkmklBrJL21wcqb4TaHVhg1+gFt
 2pXauzM2Z6kZRn9d0fuDY5WLfJJQ3g/0H0qO/B7u2y5oUmcBSN9Z4OGGDvOZsUmFE7Ac
 mERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hDAjsWCo4muYV2UGuHt56RhWysQG9sjw6uJx4BVOBUQ=;
 b=mnMDt4FO5AU2sfuFPbiepoF1CQhxWK+4wZXeg/+PhN+dE/o/BRyjHig4TGajz+VJA0
 ng+ff2RuvDDyA4iQLRBVq03m+OpTsJACtWqsas4+7Bh2d+ut8pKGAsg7Txrsly6WjIsN
 h/Rv3scdgLvlN/s4ieSAontiIPoUxg2jIFpKzC5kj6DZRZshavup1lILjOgVNIzz1xMP
 6Z5dL/BWW7R5B23GMdQNeEQpSW+wDnTyswXyLdBbQcYqe2yNpHgWWVWqkJPqq+DmWZzG
 ne65Mb1nTTlGo53ruG0SsHBe+JrsAWOGkLSFn6vQk1sQ6+9ZxQpsDG/F7D0SWRamb7oh
 MAjQ==
X-Gm-Message-State: AOAM531ky9GF+ixjyZKF7FyxpO4hn+eNC7g8m+3up7q2NNtVllpOyY+a
 +SUPLPPfvxWtLIjCg4EnF1h+OlLgwGA=
X-Received: by 2002:a5d:474f:: with SMTP id o15mr35354909wrs.306.1593807560975; 
 Fri, 03 Jul 2020 13:19:20 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id u65sm14229625wmg.5.2020.07.03.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 13:19:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 05/18] hw/arm/aspeed_soc: Mark the device with no migratable
 fields
Date: Fri,  3 Jul 2020 22:18:58 +0200
Message-Id: <20200703201911.26573-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200703201911.26573-1-f4bug@amsat.org>
References: <20200703201911.26573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XeYEwebk+aoB

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 311458aa76..b15984e4d3 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -442,6 +442,7 @@ static void aspeed_soc_class_init(ObjectClass *oc, void *data)
     dc->realize = aspeed_soc_realize;
     /* Reason: Uses serial_hds and nd_table in realize() directly */
     dc->user_creatable = false;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, aspeed_soc_properties);
 }
 
-- 
2.21.3

