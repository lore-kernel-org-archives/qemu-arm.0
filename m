Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2298763lfg;
        Mon, 2 Mar 2020 02:56:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqyL4GMkGZ49OOv4E+q2b6sSZVAhGXooKGUWgS+DIlhKSZiO7wDNwXRcTQ3+CoyzbIxHXYEY
X-Received: by 2002:ae9:edd8:: with SMTP id c207mr15733240qkg.244.1583146608894;
        Mon, 02 Mar 2020 02:56:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583146608; cv=none;
        d=google.com; s=arc-20160816;
        b=kOnR+r5wMlVrIwYoX60doQ+hBS+B1uN7V9sLFBIFoQJZc/vd7OBrXmrv3s/Xn9U6h8
         HsV3qIF2xfP2NomkjtSUQoxlTJEx5+to3Ksatlt5XbIl2DUEG9UTSHQDPyb6LaOBN5dn
         1flunXLpeOz4lB99q9LSTirtnHb4S/6yWQnWDv5YUOlUO9BSNq52MT37nNJxXVQ52bdg
         +kQe4ldcwLEajPiVwxbHQLApZsoiUmLMlwpo4BDqY6xeoDZfrJSeSeeH8BmnMkBwjERP
         H+l0c/UX6a+0KwfxI81USyVl25Sl6dqLP5XVqPpQoQtbgxznL9bETd0daFGeDJfkiCN/
         O9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o8JR8h25+qqPDpSpy/rwOdQseCxZrmvdC8Vx9YBwn1o=;
        b=FNAkrJvO7wSYx3rivUIDiCDf631LpuC8bihr1RWYTf7V3MktSYV79f8n3l+4EfAp4Z
         pbq2IyONbzWqPUQtzdH79YEh7/+jkYYfCsk+/vVcqgRs4PLA4gz+hYMC15pxBacw9Lib
         /HDDmqjXCZfLHYEdIirYzEeThQvIebuTVmMXwfNIzkqYwsGTLUfES0SaGhGgCPCXoxhx
         VZxOB4INpiaaXnBh1nV+n/LEv6RGEPbhPwlumOtnOddRzpk94jQWsQA+uuSO5UA30VoY
         9QnDrfytoQfiAVTh8R0jzC1H2YeSVnON46A9vcp0IckBGB4jhzbCrszF44jURl0pY1FZ
         kf4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AURE392W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si5775270qtm.309.2020.03.02.02.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 02:56:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AURE392W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58505 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8iki-0001an-AQ
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 05:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijR-0007j6-Tp
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j8ijQ-00042I-U3
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:29 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30996
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j8ijQ-000421-QA
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 05:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583146528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8JR8h25+qqPDpSpy/rwOdQseCxZrmvdC8Vx9YBwn1o=;
 b=AURE392WEvX/Ny7xquhr7vyq/jXZwgBejQIOakHy7v9eWgnTOKGSbW69VCZI45gnaseYwL
 zbvVeqURBr1SB8EZ0tCwAguTQGCzRMLgE78OaM81tvkQJs3ClQYZ/zE0WWEjhyewYuWaql
 55RQXmlZvAc3/JKHgx1glmKWh06NV2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-fQoKlPw9PqS1ecJhNLm9XA-1; Mon, 02 Mar 2020 05:55:26 -0500
X-MC-Unique: fQoKlPw9PqS1ecJhNLm9XA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8518313FB;
 Mon,  2 Mar 2020 10:55:25 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B51682719A;
 Mon,  2 Mar 2020 10:55:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v3 1/6] hw/arm/virt: Document 'max' value in gic-version
 property description
Date: Mon,  2 Mar 2020 11:55:11 +0100
Message-Id: <20200302105516.5972-2-eric.auger@redhat.com>
In-Reply-To: <20200302105516.5972-1-eric.auger@redhat.com>
References: <20200302105516.5972-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q723SE06kikA

Mention 'max' value in the gic-version property description.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 856808599d..c093f0ab85 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2144,7 +2144,8 @@ static void virt_instance_init(Object *obj)
                         virt_set_gic_version, NULL);
     object_property_set_description(obj, "gic-version",
                                     "Set GIC version. "
-                                    "Valid values are 2, 3 and host", NULL=
);
+                                    "Valid values are 2, 3, host and max",
+                                    NULL);
=20
     vms->highmem_ecam =3D !vmc->no_highmem_ecam;
=20
--=20
2.20.1

