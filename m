Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1138804lfe;
        Fri, 20 Mar 2020 10:11:19 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsnCSnQJWDQCkfebTCKuha2wgS1M/o2aCVcpBFgzqMdVEYJ0samgSjXIiABqoYFCSf3e7t0
X-Received: by 2002:ad4:4703:: with SMTP id k3mr9420621qvz.63.1584724279218;
        Fri, 20 Mar 2020 10:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584724279; cv=none;
        d=google.com; s=arc-20160816;
        b=w+dXmQGbWGm4ke1AP89Eo+1HFna+T5/5BVrK7gMLwkVxQlVCpHBlH+zw+qViVcbIMi
         DflZpZWfTiFChjIbmPUm40ssiy2jfH3juHtgx9E88iYtZoLLZ7hoOdKqb33xMWwCt2lL
         U9OT65sBhPz/R2nE2/pYm/DSXikLFWbZ4awvYCBjJxeSaUo1D3qL4ilrcgrntrjw7KmQ
         AZlFTrfqwEnEqyuBUp3ZYlBMlTy/QuaFJS53fK1BQXUiMuqCjqgmLoKgW1yzRQ6aJUOw
         hDOzQO6jkHVZqg0LJV2K5li2NJ1eAZ1BM6b9sfrnv7ax32I67xKQppY8YXTfFYjfTzf0
         dpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=016ut+V6yY3eGoPHopHqBeJFDBrwCjqVJX4h9Y5WIsc=;
        b=QUfOqthFpPy4wNsyGehRrdtTBliiQ2vGd1f7fQ7NVoHwWKr8U0YbpwjD+5sPpsZjHR
         svOpWcBmWEnq3cjUsS1g/QHpfUrj3h3+2ofh+Ywdckzj44XkRfUXwMQBkAVfwLg2mpy1
         +zq+EkeCWIKN3XxTAqgu1jmOcvMU4plBpfPiuXrFthbDN62NI19LVaefmTxjpQf8/Nkk
         JrgUh7t5J0jGFFBRzQCKRvw2WzMewjMxyzErFuq99KEk74dp71JNjDPDi3tVHVTv0c5w
         WPqfl3kU+7P0FwwUW6Zsvyy3wob865MVQ/DBhzGlidxNtWwGyvWgxjWG+OQjsu6lIm77
         /ivg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HuH9rjjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si4137831qkg.379.2020.03.20.10.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HuH9rjjZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFLB0-0005Sv-LD
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 13:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFL32-0000LU-EA
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFL31-0008IH-GS
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:04 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:41300)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFL31-0008Hh-DO
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 13:03:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=016ut+V6yY3eGoPHopHqBeJFDBrwCjqVJX4h9Y5WIsc=;
 b=HuH9rjjZHotr6S0iu66tKAMy9xNJNVj6LTucWAFBUaqteN08HOOubtCqIl2xUrU9jWE9Jy
 5VMDErjTfNoY78TDn73Fd9uYOrp6jA03+/65UJKxq5WCpFLpwgNIGvURqq0ovD8awZGEBv
 dMPCKc/qpEMAYa/0uCVFqlmQZD3CK8I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-NDug1hIDN2-E9aJFzqahsQ-1; Fri, 20 Mar 2020 13:02:59 -0400
X-MC-Unique: NDug1hIDN2-E9aJFzqahsQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7FE931005F61;
 Fri, 20 Mar 2020 17:02:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 684F819757;
 Fri, 20 Mar 2020 17:02:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 18/24] hw/arm/smmuv3: Advertise MSI_TRANSLATE attribute
Date: Fri, 20 Mar 2020 17:58:34 +0100
Message-Id: <20200320165840.30057-19-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QzcMBrEvuCq6

The SMMUv3 has the peculiarity to translate MSI
transactionss. let's advertise the corresponding
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/smmuv3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index e33eabd028..9bea5f65ae 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1515,6 +1515,9 @@ static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
     if (attr =3D=3D IOMMU_ATTR_VFIO_NESTED) {
         *(bool *) data =3D true;
         return 0;
+    } else if (attr =3D=3D IOMMU_ATTR_MSI_TRANSLATE) {
+        *(bool *) data =3D true;
+        return 0;
     }
     return -EINVAL;
 }
--=20
2.20.1

