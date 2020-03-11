Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp758332lfc;
        Wed, 11 Mar 2020 06:16:52 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuWUkhGIFa7Gh5V609GoO/NiOnfMv1r33Re9jaJqwMAT+6PJeAqbL0RThE0+61zm9JB0+e2
X-Received: by 2002:ac8:197c:: with SMTP id g57mr2694614qtk.264.1583932612102;
        Wed, 11 Mar 2020 06:16:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583932612; cv=none;
        d=google.com; s=arc-20160816;
        b=oOcr3ougYNYxzWnS2bN208WA5ClasWAaJeGn2onxCnXjVgI/INpC9w6KhteoV2ZFE2
         KT/eVWMyv+FDaPlDIkbih97DbGPdATAf3MsLDpzroQ6Z23Vi52do+B8ndU6NqfNcjUPM
         i+DLySKqMtl0iJX9Pz7iub7OG3Em4I10YxA96+Zti/xG2sQr7o5JFgEmUgsdlUAcySQ6
         M5FT9o0tP+16O9LWpflYq64IIlhxKwDWuR9QeTTJXhI2RkaB8QjLCbeXAIsPXeBkJW1u
         5T2KJaowIs4joqmH156vU5EHRoQo1ohdT4nLHLaH1AUQEwPCYl/s78YlrK/28rYYEf71
         jnlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ciFZ44sKcymmMsByHtfMv1caU+62zP76aEdlZZZJYII=;
        b=oz6ZMtG9JP/9gWAQmtN2FBHRoNtEj+vI3zXOh2IyA2Rq3cZWZBwo64RqQQhbZ05m+L
         ZOQD3x1lWhkwQ/EErBz2fThC+tF4K+xi0G3rTt6eerYzPYq4Y5rUbRTjydwwgqL7UbXZ
         M1GqYyk1quSiIM51yFkyRVMuzK0nY/q578AJt5uUoBhTb7+vZdi+trkWZF9iml/O8yLx
         8iGZyNEMVYzYtuzCGnumgeHcrjQwgGZC4/otxjKNFALzcNF6L/PMAE2qG8fewxs1yerh
         ZMFa+bJciqcxGHMRtlggoYQ3IcDkibnfrjj779zyZsKUJ30oAgawJW7t7gCMKYL8qHBr
         8zSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d1Q33j1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22si1022122qkv.372.2020.03.11.06.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 06:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d1Q33j1h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC1EB-0001SE-Ap
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 09:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56531)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jC1Dz-0001OE-GV
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 09:16:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jC1Dy-0007gp-Hx
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 09:16:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38395
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jC1Dy-0007fX-Er
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 09:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583932597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciFZ44sKcymmMsByHtfMv1caU+62zP76aEdlZZZJYII=;
 b=d1Q33j1h8Nqtw+B4SHmDdvcjIn/kUgBBi6xdmVhHVt2tdshGisX1xvcjhYC5TOMMm/+55j
 339Y+BggajnY21Y38p38w1Z0gxw5tky1sda3cbFu+hy/5DavDliavDMfcm+DZX7ua/p8hB
 rntj6joNggnwINir/7bKn/rj0WYDhak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-nXnx5U1tOdSoneBb42Imxw-1; Wed, 11 Mar 2020 09:16:36 -0400
X-MC-Unique: nXnx5U1tOdSoneBb42Imxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0619477;
 Wed, 11 Mar 2020 13:16:34 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7255484779;
 Wed, 11 Mar 2020 13:16:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v5 1/6] hw/arm/virt: Document 'max' value in gic-version
 property description
Date: Wed, 11 Mar 2020 14:16:13 +0100
Message-Id: <20200311131618.7187-2-eric.auger@redhat.com>
In-Reply-To: <20200311131618.7187-1-eric.auger@redhat.com>
References: <20200311131618.7187-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-TUID: rFQ3BCuKJDfA

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

