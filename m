Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1642731ejb;
        Fri, 3 Feb 2023 10:10:36 -0800 (PST)
X-Google-Smtp-Source: AK7set9UyS6S+0AgnaJIReMIAwAHvADf5c4MykcpnhvDUA3nGo+2qe9q9pTelRbOR/TYlA8nZRfZ
X-Received: by 2002:a05:6214:2248:b0:56b:4e51:acd4 with SMTP id c8-20020a056214224800b0056b4e51acd4mr882677qvc.3.1675447836361;
        Fri, 03 Feb 2023 10:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675447836; cv=none;
        d=google.com; s=arc-20160816;
        b=GvMFuK0XS8cq54WUsLGClJRZpWtI+IwZrjEiycx5psgybQGHXpR5fFmlWNMoMZS8uP
         hKzSEIaSDAvKaHAdlUJCWNrazm5UT2idrA1cFk/jkspwtvO0j+9tkRr379FNseGZZBzt
         o46jXddLx0sweF4tgHgJe/UI6gsHg202KNqkYMqurK85phvlIkqyZSaDBkuoWpd9WTYU
         Ei6AhS1k2R4JuNEWZuVCr6LjzSRiJDnpzlmDIDsQqbK8k/HwGCdphvN12iBa+5PKK0Kg
         bB70KGR8+Iz6tTFmR89IbpVrN3o5eHwJRDFQfrlpWCHdYjBoDlI1zesBxGPoDQXGyAQ+
         Un0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oxYMqvC2WwLHgUmtCJqkqqMYVUSw0aYIth92XOROakI=;
        b=tROLXs0AL3YHWlFdPOD9RjG4Cr8xj7cK0reZMCd2AezYfjGcEtGbN2N7Fz0YZ+pVHO
         dNYyziI0uGvHhueJXsCkkN2wez0rz8Hp0YtYf8ocM0yDUD1Hvses6dujhNxfCuHdMtel
         8L4Ye0W86jQM03JASWW5p7ulbHJZDQhMRvs89V9r35CjyDnqbDbYb3VbLaxpj5V1xAFp
         gzt2DGAFUBJkA9VgBS2hQP7dIMMsB2QAifqBg3LKF3xn2iGbwFMtS3qx5itHch/Gymvt
         jLEXjGp53yGn8yv7ggN9064qacShkzloTUHqg/3WCrXheLhujxB1aZJVLj4JLCFOINdV
         IhdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIxg0fdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z128-20020a379786000000b007064a9efcd4si2292545qkd.595.2023.02.03.10.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 10:10:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AIxg0fdT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pO0VK-00077Y-1P; Fri, 03 Feb 2023 13:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VH-00075U-Kl
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:39 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VG-0008Dd-1a
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 13:09:39 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so3025426wms.0
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 10:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxYMqvC2WwLHgUmtCJqkqqMYVUSw0aYIth92XOROakI=;
 b=AIxg0fdTM3g4GbWU+rbgaYy6MBg9x/HWSj4LwdVg6hkUN5Tk8cpDNIHMsJ18d+0rA5
 DZprUxgdCUagbFoOEvwxiWh4gPNFsTDESYZ9/5V1kPRoFjLJ+CRsD+L+9tAMz0G80nif
 aG05M+Mk0aCLYSRRcxHNwiBuwhQuNeCzLnyVtzd9I5/fxQyS8hz4sSQ/xi8pW034Bi8m
 m31tIvor7j/KEwDqTUa6CvgSRnLo6eUVoo1h6oLhWVIJDcO3jEJu39wDJIg/dXWrMQzd
 +6EdkUOPcV/dhI/KhSZ+XDs5MPeB16cwsQ4su1HiebHuaA0DShpYCQt4AJzHIJb8cpfI
 uDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxYMqvC2WwLHgUmtCJqkqqMYVUSw0aYIth92XOROakI=;
 b=yor4MyYx0rDDTqq3LqUNbOsojC6yl9vjS5PEIFQlxigIfCCgO80o/FkxB1ZPjPyG8h
 iY3zCZWrvKOhnXxuRZDaybeAvJsuOF0oxremDNhkVIfLMc5QG4HMZ+WeKnKkn8Jshc+E
 x2fxLjtAtIyrg70F0a7uL3wtceE2qMuj9kl2OfRV7rXDsojMEwPos4EHX3rcc7bLJj7A
 XfYo0PD0FI5hfmkegRq4f8tp+jXg9cPOj0AqD3KFKIrFyWt+okgqtSkjMGw0b2bgBABi
 /e90QZE9xOLkwOg5MvLG2to1dT0NE9VT6w662UaDziVTzjc2nH3RFgHONFoMxXB4voJU
 eWSg==
X-Gm-Message-State: AO0yUKXp4Eu4a8sYjcNIxJMIqVx4rmob5iKEWMpZoVDQRqx51v9rEKiJ
 8EFvczZcnE8mYcahTOyaORoQo9GT6Q64rTeA
X-Received: by 2002:a05:600c:225a:b0:3df:12ac:7cc9 with SMTP id
 a26-20020a05600c225a00b003df12ac7cc9mr9619906wmm.15.1675447776870; 
 Fri, 03 Feb 2023 10:09:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05600c2ac800b003ddc781b1d4sm3126424wme.33.2023.02.03.10.09.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 04/19] hw/audio: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:08:59 +0100
Message-Id: <20230203180914.49112-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: qRUC7sZCIYgB

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/audio/pcspk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/audio/pcspk.h b/include/hw/audio/pcspk.h
index 9506179587..e18ca08fa0 100644
--- a/include/hw/audio/pcspk.h
+++ b/include/hw/audio/pcspk.h
@@ -33,7 +33,7 @@
 
 static inline void pcspk_init(ISADevice *isadev, ISABus *bus, ISADevice *pit)
 {
-    object_property_set_link(OBJECT(isadev), "pit", OBJECT(pit), NULL);
+    qdev_prop_set_link(DEVICE(isadev), "pit", OBJECT(pit));
     isa_realize_and_unref(isadev, bus, &error_fatal);
 }
 
-- 
2.38.1

