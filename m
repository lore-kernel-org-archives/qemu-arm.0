Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1360908ejb;
        Tue, 19 Mar 2024 08:09:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVK84efUWGBeyDPcWuAwEXWHw/+VmBKOGPb+i2LuL4/gBfQAxBlEkOjoigWwiwTSVeQVoF5JEeKodZtq3fSDR45GJVLtfBg
X-Google-Smtp-Source: AGHT+IGOdA96uj2yNQvlNEw5QzDcEjSxfMrJmIC0OjrRk6h2VDHMQvmzYw8bQFMdfQOA9cWdYZvc
X-Received: by 2002:a05:620a:11a6:b0:789:dc1e:3a52 with SMTP id c6-20020a05620a11a600b00789dc1e3a52mr17249928qkk.28.1710860983361;
        Tue, 19 Mar 2024 08:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710860983; cv=none;
        d=google.com; s=arc-20160816;
        b=ifYK+ldFCpWZ8tmBlgT5I6DxKp3b9/VhuNaxQOW63OSquS5VNUSnfJEjWNXfODRge6
         RtTUJZhb5RtWOZsWNdw5cNJRRTc8Iq1l2D/cGAgK5C1PYNnj0fpxP6B6jOI4I9MqiPNT
         BVk5w/r0TbvkWJOKaforqdx5mpUEliTvdkQiotuu2F+68MfOkP3zljGF91kRFdkUBCUk
         uoqHaN4eZLjDBqMTw6aEuVGpOxGfOPg//EoqAUeHCKqOO7VR094xzzWlugBx2E7bqNgf
         03Kd2OmC9laleselbtGX0jztZ7lg+2oyskeZeyPoucLxU7i/xTDSlFblRqKyFEebfEcc
         HIbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uvrpbnD0Yd+fDRyI3eLqTFqopxN3X4BjUMqgTcKoxMA=;
        fh=tSoTT9wLQQrO4JvdYzZDbAp21r95aRVdo5duUGAXbCo=;
        b=DLsZZsMIXYUTWX1QPCt5mL8M5obmbKLhEUDGjSlohjopzBtHMLLeU8f57DKDJO6wkW
         57snKKaRNYGxi/2FH+oZ8JYKXPGWPa6fPv3mn0lKNiFQUhD4xPcHPcADBlZAjjC+gbRY
         rCSeH2uxcX+nXM73iIWSoYahmkG9oOKqC99QFbGB4oafdTlXYJTEicD3Lrqr7TfBSMzN
         ix0++KMFy+54D/CLT+1B3UHbezDn6H5F0hME+uUh3Hl8nDZ8XzpxyRL51f6ndCmniGa4
         98ay3SMJw2BqtuJ90c3vc1cm7QOu87pjWcAbsp4Aj1h4ib8orT+AyHSwVxIuOrtYfnsK
         RQmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V57keAF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020a37ef15000000b00789f3536aaesi6551072qkk.529.2024.03.19.08.09.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:09:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V57keAF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmb5l-000544-P5; Tue, 19 Mar 2024 11:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rmb5h-000529-Ob
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rmb5b-0007JT-EI
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710860958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvrpbnD0Yd+fDRyI3eLqTFqopxN3X4BjUMqgTcKoxMA=;
 b=V57keAF+kgYHHdO4POIpLI3CqsGlnHwp3wpriJ47Rv7MLsYe66d8xA4HrqrH7O1aJJv2TU
 teZ9tteCg5wQ9g7TrFhfYNsTZpFojHgsoYQW5s9eesxADCqPBTHHtcJu29i3GgdWMWKlV/
 6aXR0MZ5ghCiC2JdpCLZZPTFElonQaM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-5KBV-ZHENTevJBN2du2FIA-1; Tue, 19 Mar 2024 11:09:14 -0400
X-MC-Unique: 5KBV-ZHENTevJBN2du2FIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 528B89011AA;
 Tue, 19 Mar 2024 15:09:14 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E130610E47;
 Tue, 19 Mar 2024 15:09:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/2] aspeed: Make the ast1030-a1 SoC not user creatable
Date: Tue, 19 Mar 2024 16:09:03 +0100
Message-ID: <20240319150903.413662-2-clg@redhat.com>
In-Reply-To: <20240319150903.413662-1-clg@redhat.com>
References: <20240319150903.413662-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.422,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: EPG7JLOxUWUE

Aspeed SoCs are complex devices that can not be specified on the
command line. Fix that to avoid QEMU aborts.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2227
Fixes: 356b230ed138 ("aspeed/soc : Add AST1030 support")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast10x0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 2634e0f6544e..9f98ad8e87ae 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -424,6 +424,8 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(dc);
 
+    /* Reason: The Aspeed SoC can only be instantiated from a board */
+    dc->user_creatable = false;
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-- 
2.44.0

