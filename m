Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3234162njb;
        Tue, 9 Jul 2024 04:54:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpKjyXe22LiCVJYqOLIvPv/xJO15o7wyJnarwnivanGk2jgZv8B1zyzfzE2tGQmStK6hHurMpqDnC2vAHrAcbvbQm3wGPw
X-Google-Smtp-Source: AGHT+IFQU3OFeyQzGNOYxeyqAn6tex2k7tNDVRBVsaIgFX/TxbtPqj3YMTeqDieJ9+PBEcUmZG9f
X-Received: by 2002:a05:6214:76f:b0:6b5:832e:d999 with SMTP id 6a1803df08f44-6b61bf26141mr25654216d6.19.1720526057796;
        Tue, 09 Jul 2024 04:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720526057; cv=none;
        d=google.com; s=arc-20160816;
        b=gzfcqJtSx+EnRV8VJBEX7nBYE7Uqd0zaohcx7t34YcYMg22b6gwb+GCMhD4JpRWn20
         5yrF5lEvStBcMKfxur5AMDjKdHDn+iu0yEJt6cv2LuYOLHi7vDdF42D9RPhxpZLqp4Z8
         iUar91ty0xhadd8eMqsMEVwKGdbF2wBefoYpqsgwd9RsgWyxJqbRKwHarLNBlnYC6aQY
         EIBtfolZKZYqGMLuIX7vf9b3gC1bPbcBNy7OWxTYIctCpWP5LE59QsAY0cqQLFOhr+i1
         Adxcwq2IyDof9/j2QIGm93ohrPpktKxdU+MlqNM5FvzWF7L/6Fb7AwElrfeQ4h7q9AfI
         45gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=svIcaXHK27RzfNtuAn/hisq37sbQwbX9TAHyCJG5++Q=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=p3Qb2WObi3SUKxgbzQB7FXPBnRemWezSsSI3eCzcRvLjj6oT4H7WZApCSERxSA6Wa+
         FNocqrIW9XV0yCBXtKGblWunVWCAzHb/vJPZ7hWjCUXy66dlAVhriiTcIPDVSuAJWsSN
         879A+30et+dUsT4uSAGlQDz9N/O4JF0Pqlbe4WddJMTdZAnty6yOqp3FjfiH4IxXv5Fq
         kgkuQoy5v2pmnrKrnzoV7Gr7CrqB210lczvaXClmkNp0eIrE0MOC4Uy9AE497LXlxySX
         dQf9tjX5jC2vgvVIv0HzzuDk3wf+SJ8RImFOgeqb/XXAdTqopLNJfva+mHLr+eRnFRua
         6UHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hHi3e/Nz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba18b78si20202576d6.137.2024.07.09.04.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 04:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hHi3e/Nz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sR9Oz-0001QD-B6; Tue, 09 Jul 2024 07:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9Oy-0001Fs-7j
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 07:52:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9Oq-0006aC-0M
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 07:52:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720525966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=svIcaXHK27RzfNtuAn/hisq37sbQwbX9TAHyCJG5++Q=;
 b=hHi3e/NzqaUia4KX7gNbyDRRL1+lTvqZBom75zjJxFvHb1L+AMG3TsiODQbrD2bYFmy2RU
 E+MNDvaYJG8qAU6Eh7k3OY9dJwhC3nIYkO9yEEoNDorUKfOEG5iiFYg/ebE7ehuB4fjXd2
 /xWQ5uAAUtlqAuNd+KdDaeaWoKxOgg0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-T7q4c_hQNc-ToJiXzuFtUg-1; Tue,
 09 Jul 2024 07:52:44 -0400
X-MC-Unique: T7q4c_hQNc-ToJiXzuFtUg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CAE1F195608A; Tue,  9 Jul 2024 11:52:43 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.243])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BE21C3000184; Tue,  9 Jul 2024 11:52:41 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 5/8] aspeed/soc: set dma64 property for AST2700 ftgmac100
Date: Tue,  9 Jul 2024 13:52:25 +0200
Message-ID: <20240709115228.798904-6-clg@redhat.com>
In-Reply-To: <20240709115228.798904-1-clg@redhat.com>
References: <20240709115228.798904-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: CQfitMpqZJ5Z

From: Jamin Lin <jamin_lin@aspeedtech.com>

ASPEED AST2700 SOC is a 64 bits quad core CPUs (Cortex-a35)
And the base address of dram is "0x4 00000000" which
is 64bits address.

Set dma64 property for ftgmac100 model to support
64bits dram address DMA.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 18e6a8b10cae..a9fb0d4b8874 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -552,9 +552,12 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    /* Net */
     for (i = 0; i < sc->macs_num; i++) {
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), "aspeed", true,
                                  &error_abort);
+        object_property_set_bool(OBJECT(&s->ftgmac100[i]), "dma64", true,
+                                 &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->ftgmac100[i]), errp)) {
             return;
         }
-- 
2.45.2

