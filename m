Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1786549lfo;
        Fri, 4 Mar 2022 10:16:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUwvQeORnEaQtXiojzBm9h6HCEeBBEPas6sCbA8NA4hvn6AKEg3Gl7iMWmrb96yMwpwTS2
X-Received: by 2002:a0d:ccd6:0:b0:2dc:2bdd:ad5f with SMTP id o205-20020a0dccd6000000b002dc2bddad5fmr11468838ywd.205.1646417782307;
        Fri, 04 Mar 2022 10:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646417782; cv=none;
        d=google.com; s=arc-20160816;
        b=jPqncu1h48pLpjTW6XwbitW+yE2dinfJqPYk6e98zzwRkaYTd9NwpbgBVTK9AQ7pvt
         nYLR8ku2J5F4rE8KAPTFAB99V76VxSe7aRgU+nhaRLwNH1VjoJfWjLOoeNTBO5QN1y5g
         Xxjl7gkFTl6ZGv6SuYMw4FwRMm7hjmw9nbZwQwa6bJ+DDC0lMfQTczZGqNrMbV0cOo1M
         JPD2+Mz9UfHsp6pAkT84CXux33nfwMLr6by/yVgBuQXenT7+l9OPaM1Xi/2nkyTCLMSc
         o9PiRACqnUKCc2NdoN3ijPjM5y4ChqVyXmUor5PJOFJpr1dl/UxWhCEPL8GxJcEpDwAL
         ArdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7nv2biZSgEAimGz4TdIQjTFrLBElgXwLSI6iJaqjUH4=;
        b=IiIs9/kH3EVXl/V8ikTDJWKxrAfGrictXl4qvhA+t1jdTqKGvLFDuHWctqWK9iJca8
         3ekZXq/EuSrPXvLjRzIzpiEGSQvnQIhf9I+zq2XQekj4iwDmCaeM3GjZFWnLBFZQoJ0V
         vTgZXxeG9+rjMSJQyW+0p9LYKXPfPDSWCnda13mAXRKYlLh/RHgQDXuwVV01CzG5WiaL
         5H+pbjoLE7z/4Zi61m/sVA/DF26S6U9q2oajb/Ldy1tiw98RSx6/2f2P5q1F+ISMWBae
         6ELYKOtIKn7CNCxPT6pOA4vl3v2XpRqCxQa/Jz/taXH5hZYPLnrVfnoD61RRL5852zzV
         Zb8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELJ5B7ZI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11-20020a056902108b00b006280559a5easi5077643ybu.235.2022.03.04.10.16.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 10:16:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELJ5B7ZI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQCTV-0006PD-JM
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 13:16:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nQC0c-0005HF-5K
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:46:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nQC0Z-0004Mg-BF
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:46:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646415984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7nv2biZSgEAimGz4TdIQjTFrLBElgXwLSI6iJaqjUH4=;
 b=ELJ5B7ZI3vT7izTK4T7akldzXbud7bln5h+LLmE77oRnTTGMJs8TnkBJ2uJrLxoQi6jO7p
 GYUxstkBal23VvNWS080ubDgWzXn7uC9Zjm66ilFCW9gnGUiSOh9VfwGePiBayX+UGiOQX
 YP2FfkEXzzB750w7oSRUw2Zv4TH9h1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-FYC6UZwnMT6bQfloCOBeMw-1; Fri, 04 Mar 2022 12:46:20 -0500
X-MC-Unique: FYC6UZwnMT6bQfloCOBeMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE91A824FA6;
 Fri,  4 Mar 2022 17:46:18 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3D8C1062254;
 Fri,  4 Mar 2022 17:46:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
 drjones@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] hw/arm/virt: Fix gic-version=max when CONFIG_ARM_GIC_TCG
 is unset
Date: Fri,  4 Mar 2022 18:45:59 +0100
Message-Id: <20220304174559.55645-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 37wyRE8lToqy

In TCG mode, if gic-version=max we always select GICv3 even if
CONFIG_ARM_GIC_TCG is unset. We shall rather select GICv2.
This also brings the benefit of fixing qos tests errors for tests
using gic-version=max with CONFIG_ARM_GIC_TCG unset.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Fixes: a8a5546798c3 ("hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector")

---

v1 -> v2:
- added Drew's R-b
- dropped PATCH 2/2 for the time being (requires more discussions)
---
 hw/arm/virt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 46bf7ceddf..f29779c951 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,7 +1852,11 @@ static void finalize_gic_version(VirtMachineState *vms)
         vms->gic_version = VIRT_GIC_VERSION_2;
         break;
     case VIRT_GIC_VERSION_MAX:
+#ifdef CONFIG_ARM_GIC_TCG
         vms->gic_version = VIRT_GIC_VERSION_3;
+#else
+        vms->gic_version = VIRT_GIC_VERSION_2;
+#endif
         break;
     case VIRT_GIC_VERSION_HOST:
         error_report("gic-version=host requires KVM");
-- 
2.26.3

