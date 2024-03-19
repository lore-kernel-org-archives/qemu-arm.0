Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1360884ejb;
        Tue, 19 Mar 2024 08:09:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtKpBH0q0JP04RFptOPlQqJ9SU97Adaoy4/5DqDbf7OuO9KAEmQE1OnJsuRHSVIeqWKfcavMQvAt/xTbMotAvZ8i8jBd6w
X-Google-Smtp-Source: AGHT+IHM//XI4sD4bLM1j3q9fsk4bDCGhoYMb8dmCZrEGMdvy647i/qOPqNp9Go4PRRQPBvk7bla
X-Received: by 2002:a0c:ea46:0:b0:690:d9b8:9596 with SMTP id u6-20020a0cea46000000b00690d9b89596mr15912489qvp.62.1710860981837;
        Tue, 19 Mar 2024 08:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710860981; cv=none;
        d=google.com; s=arc-20160816;
        b=b5RPpr3GmeRqlrCNW5hKpVEsYwYv3mq74IU1xuqHA2jHYcv5HE5uo50BnBchUl1k8e
         tsdSvjemguglhJ1M6z+NuHJdrhcOsoNITwTT0HQmC9qotpIQ3gi+emMXA3D0kXERYk8n
         Ro7vQW2DiyJ3JTiuoWrHppk0W7rJpFoWy/uATGBvXW6YhCgX2t324uCmVUPV8tEykDWU
         rH0wduJq3gpMzbasQSEZrVktxvbNaiU7yoOew3SHiMqZbovn0K8/9zl2yaJ1iqAnzzQq
         UR8PxHYR2CHpyy4lZBwD32o79+INBS7ryft0Ii02SEKenQ8Dv6xw0HdrBTwAPCFVn6Un
         N76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NhudlERWk6dnXQ2Jdmg4v0cXkiePpnE9T8/9TR0+dK8=;
        fh=tSoTT9wLQQrO4JvdYzZDbAp21r95aRVdo5duUGAXbCo=;
        b=k7Sv+UULNUWxzRYjbCE+7n7tt/9xjmW0sjpwzZTYiqIp93ripxsPrj87n0gGj0xf92
         rY0+TyHn5PFSNO9sZ3KiQqH7aDQE8ovGjy18aSrhKDrzj90+IM7pSHK44iLfaGcbfXHm
         +PjP+1hZOgg7uKDLbwKTBwzzetHG63y+PtVu5XmiVnpUodfUXvrvo4N7nrCSkA7Ac0RJ
         cH5KjfIvTonCzeU+iKEA2K5mhVNROlLQrPgyGKaVYMwCeqdCrzpTE+nKAFubkyjcfT3n
         NUfSF5UL6mnbeeSs034erjILNU9ib8AP9IVf4SsBYVLtTxiVXz53M4Ywn7asdl5DZ7pD
         dXsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g7BXHJ8n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kl6-20020a056214518600b00690af36fa13si10655626qvb.338.2024.03.19.08.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g7BXHJ8n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rmb5l-00053a-LW; Tue, 19 Mar 2024 11:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rmb5h-00052D-P4
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 11:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rmb5a-0007JG-Uj
 for qemu-devel@nongnu.org; Tue, 19 Mar 2024 11:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710860958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NhudlERWk6dnXQ2Jdmg4v0cXkiePpnE9T8/9TR0+dK8=;
 b=g7BXHJ8nwqHd5QuWGHV+P8SdLhi/vTDHZZ50dy1WFrVfJQLcqM8HG5XX+3UO7dO2YTXjHh
 lgoHksWDqLu6t4Gy3iwmGAWo3ZA3ClRtWsIKklMwqcy4h7eCJAWBvb8gMYmuL5nasu+JmO
 z580MLPcQp91nOTAjf4cm8K8PUgVlro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-52T9qj5fOXiVQ-W4ncRb7Q-1; Tue, 19 Mar 2024 11:09:13 -0400
X-MC-Unique: 52T9qj5fOXiVQ-W4ncRb7Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9837E185A78E;
 Tue, 19 Mar 2024 15:09:12 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE872111E5;
 Tue, 19 Mar 2024 15:09:10 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] aspeed: Make the ast2600-a3 SoC not user creatable
Date: Tue, 19 Mar 2024 16:09:02 +0100
Message-ID: <20240319150903.413662-1-clg@redhat.com>
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
X-TUID: ZejAulPaKpI4

Aspeed SoCs are complex devices that can not be specified on the
command line. Fix that to avoid QEMU aborts.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2227
Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast2600.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 8a47d82d8371..03d115846e4d 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -743,6 +743,8 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
     AspeedSoCClass *sc = ASPEED_SOC_CLASS(oc);
 
     dc->realize      = aspeed_soc_ast2600_realize;
+    /* Reason: The Aspeed SoC can only be instantiated from a board */
+    dc->user_creatable = false;
 
     sc->name         = "ast2600-a3";
     sc->valid_cpu_types = valid_cpu_types;
-- 
2.44.0

