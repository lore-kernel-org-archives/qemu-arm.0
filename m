Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp631668lfc;
        Wed, 11 Mar 2020 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuqEIQ+kf3EmqF6aXPgot0LtK7PXRLakQXed1jlTldFrqXm+tre3gNTZ2vdqaNrr9ncskI0
X-Received: by 2002:a05:620a:10ae:: with SMTP id h14mr2217979qkk.170.1583925415069;
        Wed, 11 Mar 2020 04:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583925415; cv=none;
        d=google.com; s=arc-20160816;
        b=NDnalsNvVgywB82e3deACK8UvCqEkdd+uPaig15GI80Duie0CfleXszCv2tXzbi/nY
         VE57Feq419IEO2W4ExRXeUaUsbdQnE+XUCeXIdPkQ3dF0ZtGhMc3EGIqii4vKYdi0W8/
         lav/NXqj3VBgI9EiKqO8VAjBwCvYyLOEpnmbOaP3hDtQMgbHaA4sg83VewK5IPxjUAnv
         RCpXACI7IaTerqH+IB33vahceaG3KfwMR2ODDs0pXqHNxorw+sQ9+8pd6BmLJQvF3CFq
         dWOEvq3gRDP/S0kJiFE8zM0G2cESIuYgHNfg1aykBYnlQY+EVwMGkmuNa6lG91e8X8II
         5++w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ciFZ44sKcymmMsByHtfMv1caU+62zP76aEdlZZZJYII=;
        b=Dh4eDLONP1jut3y5Iv9EcPlMiPnjN4r0CMm+DW39V3pCGFEtrlFEGmQr4T14liMxVf
         Dm38ooHKYdN50j9VCPn+HOyed/BNSRzzIRrRUMGxdXyQ6hVArVzM9RSmk4nldmQEoguV
         yLTm2oYBfzteMd4DrDh1wt4aMJUSVxJJDP1tvn9M8RZSrPd6daa9ahvmfRWzrNbOopgL
         +MJWgZ0jxmPn/7AwUlY9Z5yZ9LikTI/AC/a2JCneQA0kbMJUZ7+FYX3aEryyEuYUz8JP
         07+Yq4FKRzBUqEzMqhYQqVVIG1+bsRFXD069xFQNMHLwsWGmwr6CUKVGszDRAp4G0TmA
         P1Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZNPfoxs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id em8si693707qvb.72.2020.03.11.04.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 04:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZNPfoxs9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBzM6-0001fU-Dc
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 07:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55505)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jBzLv-0001dh-Nt
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jBzLu-0000FC-PD
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:16:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25276
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jBzLu-0000Ey-Lk
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 07:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583925402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciFZ44sKcymmMsByHtfMv1caU+62zP76aEdlZZZJYII=;
 b=ZNPfoxs9z3p9lv4cKO4FtRwVBDtomvcB3H6ESEqUDtTCFlQ96CjXU3Qg2O6N6GR3Mt79UZ
 3wk3MpYVR62IOpHqMfs1G4vkG23BreYHxD+sbnoRBop/lnhKm2uUZJgrnYABpwQtuKH2w/
 D6KMVLBRaeV72MGH9eK+v/EC6Ql2imQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-YHHCSZh3OEq2zOIzMWW7ng-1; Wed, 11 Mar 2020 07:16:41 -0400
X-MC-Unique: YHHCSZh3OEq2zOIzMWW7ng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB707100550E;
 Wed, 11 Mar 2020 11:16:39 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ECFC92D24;
 Wed, 11 Mar 2020 11:16:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 1/6] hw/arm/virt: Document 'max' value in gic-version
 property description
Date: Wed, 11 Mar 2020 12:16:21 +0100
Message-Id: <20200311111626.5705-2-eric.auger@redhat.com>
In-Reply-To: <20200311111626.5705-1-eric.auger@redhat.com>
References: <20200311111626.5705-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: maz@kernel.org, drjones@redhat.com, richard.henderson@linaro.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T6A+c0vEn3nN

Mention 'max' value in the gic-version property description.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 32d865a488..7c38c6c7f9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2146,7 +2146,8 @@ static void virt_instance_init(Object *obj)
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

