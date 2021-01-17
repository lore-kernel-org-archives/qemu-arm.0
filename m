Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1970211lfq;
        Sun, 17 Jan 2021 11:34:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVaA8Dkc5YkxSHI3aD+sjeG5lrrygYrpumERe7fFOzDm/zzexgWafcbp122t+ZKBHaX8qJ
X-Received: by 2002:a25:ae49:: with SMTP id g9mr4506480ybe.381.1610912071284;
        Sun, 17 Jan 2021 11:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610912071; cv=none;
        d=google.com; s=arc-20160816;
        b=s7kCw1E2rLOSkFaGzQ7XS4tt3U9hlqs+H5ZMmDy9mkeApV5pTHJ5Ylq2ZdMDLVRjOl
         wjq9jr9mTIkoUFF55FeL5z+tkJsK21LpvbmISqivrQs4Zl/5jufF+C0cv3CnVE6xwvKI
         gs7fG4oDsF/LAoTPJA+CHKP/xbJKALILiijc7bzbSKXhsHA7wv0ZNHJ92htN3LU6ylbO
         9rTFEw0yL6zl9Iz10b4BJTUtH4icpn/llAy6wP3xsePJQFYitzLrTxveAk52thGELEBZ
         1CxvFxcWg6o6mBZ7DjaGZpu0t6eyFHkLU+25AX4G68TLlPheCgZp3M/XS6cFIXMXKmC/
         mRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OG4UEEhgrdnthw/7SfhW0jpVgnxGKL48F7b84mxBL0Y=;
        b=EmDmfjnbaXSGUcF4ZUZzku0e387Jh9SmVrj+agDaH3GZeZ9ANCoxWCGzz9Kl2lBiRn
         0Gw84HnK+KbxkCLSmCqsJ1Q7ZKBoTtmJN7OtKpvsossiEFay7G1sSJJ5Gj5iuXl5y8g0
         kNs/PFUuaHZf4Ja3nVGAeNCvo8LItL96ebrBh8sZoJRC2KxsVvWiP/tcD/tpQdATA9xR
         j/nMJiYvL6q7GdOdqzPfmoYnx1fEEvCeo+1LB3Mm6jIJafZ2HQ4IkrJU5tu2kkhCi19O
         UC9JnXoP5/jMaZpU0oblWHaCkfT0g8BtMSDKql7gsQOdcw7IGXTk9449q3DMykql/fzA
         Ljbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1hCPPD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si14058705ybk.283.2021.01.17.11.34.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Jan 2021 11:34:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=d1hCPPD2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1Dok-0007bT-In
	for alex.bennee@linaro.org; Sun, 17 Jan 2021 14:34:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgn-0008N5-Tc; Sun, 17 Jan 2021 14:26:17 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dgk-0005PB-6z; Sun, 17 Jan 2021 14:26:16 -0500
Received: by mail-wm1-x32a.google.com with SMTP id r4so12028771wmh.5;
 Sun, 17 Jan 2021 11:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OG4UEEhgrdnthw/7SfhW0jpVgnxGKL48F7b84mxBL0Y=;
 b=d1hCPPD2xD1wJ+ELj4EXKXvHf5LWkdVFuJ6DUWt6j6JneNcQ5YKxKbitQlO+YmW+vO
 EnGhR+vcKbFIoe5cCUn/VYx+ycAQesN4/1eQKKGJ8aRaJ3O/iFxgq7XOsEEJGgOLFfVu
 1Pv9HxD9KNv3eutgax74SADs46HixAvEknnx8jGCMz/i8NO+1YLgYT1z4s4Xuh5XHYTo
 E+XV3hrJ7nzNIE75qSqNrcxBlqp8dxtgsodEkFx93MEaPGLCxMpRyrRxLVglDI05Xl2D
 iU9v6VRnloJr1dHA5Xn1doJe9TcNhoTdsJY7MJOMcT3W8wGR67ygmXeqUHe5UQx4xmNN
 04ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OG4UEEhgrdnthw/7SfhW0jpVgnxGKL48F7b84mxBL0Y=;
 b=kgXJcf0UfVvKcTYTvGqOYbgvl9S67JbiIJTe68UISCFcD+dLZdseMgNQwMDtT0oGJ7
 IFk37QPj7fnuCqCvp5heTCvwnB3ZpMYchX6vKIgG5An/PpnmytjiJeSi5QzxYZMmo+IU
 74ayC+eume0HFvrVqP/2SMn6ymPiPRWCoVyRNeHsoFGDfFkulXpuO1QoWy3FPKcSljIB
 W7TJvMJwUF+oN14zGUGnKntBYmrzg0f1GfIiIMqWriwyZfuwGZN5nGBsB4XpcFyKTwv5
 syAFqrT1lpHDKoSwyPJ89L1IvqIQWRg8KAYW8Ok+i57X1bE8F76Kw+ANAdKa6uqlMeZs
 DZDw==
X-Gm-Message-State: AOAM532yEctNGjBclFblL+ld1TAzseKBAz02h93WD7jO0dR7gNDIjhiT
 +TjBycO6EtwN6+0ffxJsrQs=
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr721232wmc.158.1610911572131; 
 Sun, 17 Jan 2021 11:26:12 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v20sm27021723wra.19.2021.01.17.11.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:26:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 15/20] hw/nubus/mac-nubus-bridge: Mark the device with
 no migratable fields
Date: Sun, 17 Jan 2021 20:24:41 +0100
Message-Id: <20210117192446.23753-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3rFyE4TtvFRL

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/nubus/mac-nubus-bridge.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nubus/mac-nubus-bridge.c b/hw/nubus/mac-nubus-bridge.c
index 7c329300b82..ede36ccc5dd 100644
--- a/hw/nubus/mac-nubus-bridge.c
+++ b/hw/nubus/mac-nubus-bridge.c
@@ -27,6 +27,7 @@ static void mac_nubus_bridge_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->desc = "Nubus bridge";
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
 }
 
 static const TypeInfo mac_nubus_bridge_info = {
-- 
2.26.2

