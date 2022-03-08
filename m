Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2561890lfo;
        Tue, 8 Mar 2022 10:28:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPQ4yux3BN4n6E8tqz7KSDaWa1L7FmQwIEWpLbovYtcBw/ekhl0BeXKKH6OVJ3n7BorG1V
X-Received: by 2002:a25:1506:0:b0:62c:141f:d4ea with SMTP id 6-20020a251506000000b0062c141fd4eamr1412449ybv.205.1646764084550;
        Tue, 08 Mar 2022 10:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646764084; cv=none;
        d=google.com; s=arc-20160816;
        b=wWaq9fcSTFOPeYe2M12SjXIJ9AAfMngm81z8x75W8vvsqUeABepRyq5oG/Cp3NWFOv
         Z4rckhsgddS0Ub0T7joYfNxgZKthO8RiE7mClLCQ2+GfyFNnk64HGQeH2DnQfK0TjE66
         IxGpwdJEZf7urS8rtp+lHorJpC53u1Uj6CqVjvSBU4dYoLXIHK95JQ3iDN1rgLxqYY0Y
         vxojeD/D4CCDSuTgfK9AUtWI/TUIW8B1R2THw841h2bEdXsBvPK01bFhqTpj4YivPHX5
         mcDDR78Z9Kx9ZLj2RhIkao635/zd+Dc7Y/ZZ75QT3/W6BPI9hZmN8gjpmiw3BECqomu2
         HZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ietZbyI29vSajRMQnOuq1MmdCcl/JxjvJCJZnRqbAYI=;
        b=dcFJ+pY2OuxJudg7+4sB2ZFaaDokYcM3l3hC4akYrkw+3Xj+mFuXdEk8nnCw5eoZra
         jmcXjJ4ynytQm4Sbp8kokPeXYBxly0Ok0HSRCHC+ZqPyKx7FqO+VqwytzIvIegkc+Q73
         ieR0iAl/jifDT728bykFYPE4qo7BFQhvLTVMtqtkanmDqy0CPutx3umOWjh4NUTJjd9z
         Gtwh0bQYNEx0yIZ8F7mqJDDnpap7gUFYpqJliNNJKqKrMfoyfdeIub9rwClMMOznwsUO
         TqHDYAu1Jkg5ERZ3YPg107b9/Rq5Uik/rf4adfkaSY3RtAuI5IPqVD7c9hqGxS9IhPsN
         wHFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZNTAH982;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a258485000000b0062933e63ab5si4581813ybk.651.2022.03.08.10.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 10:28:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZNTAH982;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nReZ1-0003kF-W5
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 13:28:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReWB-0007cZ-Cl
 for qemu-arm@nongnu.org; Tue, 08 Mar 2022 13:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nReW9-00041h-Tb
 for qemu-arm@nongnu.org; Tue, 08 Mar 2022 13:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646763905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ietZbyI29vSajRMQnOuq1MmdCcl/JxjvJCJZnRqbAYI=;
 b=ZNTAH9828qzmsz/Cv/TdXlAORQtg+424qBmdItyjEtgt7UrsKU8ZoiE2T0sIi+XGhVehOk
 xKJnLKhbTnZDyNzBNNg5OYObYCHjsjiuQWKq5btRoPtSaAiTWquR1yUEpvlhvh6uPkKZiQ
 E+2aQ5UosGk247vL47tPSSceOEJMGDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-qRDPGujSPdKEew95vIBxqQ-1; Tue, 08 Mar 2022 13:25:01 -0500
X-MC-Unique: qRDPGujSPdKEew95vIBxqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 994DA1800D50;
 Tue,  8 Mar 2022 18:25:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D606586C53;
 Tue,  8 Mar 2022 18:24:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 drjones@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/virt: Fix gic-version=max when
 CONFIG_ARM_GICV3_TCG is unset
Date: Tue,  8 Mar 2022 19:24:52 +0100
Message-Id: <20220308182452.223473-3-eric.auger@redhat.com>
In-Reply-To: <20220308182452.223473-1-eric.auger@redhat.com>
References: <20220308182452.223473-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7L4XU6HlgQGi

In TCG mode, if gic-version=max we always select GICv3 even if
CONFIG_ARM_GICV3_TCG is unset. We shall rather select GICv2.
This also brings the benefit of fixing qos tests errors for tests
using gic-version=max with CONFIG_ARM_GICV3_TCG unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- Use module_object_class_by_name() and refer to the renamed
  CONFIG_ARM_GICV3_TCG config
---
 hw/arm/virt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..39790d29d2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,7 +1852,12 @@ static void finalize_gic_version(VirtMachineState *vms)
         vms->gic_version = VIRT_GIC_VERSION_2;
         break;
     case VIRT_GIC_VERSION_MAX:
-        vms->gic_version = VIRT_GIC_VERSION_3;
+        if (module_object_class_by_name("arm-gicv3")) {
+            /* CONFIG_ARM_GICV3_TCG was set */
+            vms->gic_version = VIRT_GIC_VERSION_3;
+        } else {
+            vms->gic_version = VIRT_GIC_VERSION_2;
+        }
         break;
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
-- 
2.26.3

