Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2107653ejb;
        Tue, 30 May 2023 04:39:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62u8MOhjRB1VGBq8jJCw7CYaGNXa465ZkFcZZTFJJ9P+gTH0Pqe0LIWoG0JI32M/pfgwmL
X-Received: by 2002:a05:620a:268b:b0:75b:31d9:3d72 with SMTP id c11-20020a05620a268b00b0075b31d93d72mr1937678qkp.44.1685446762081;
        Tue, 30 May 2023 04:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446762; cv=none;
        d=google.com; s=arc-20160816;
        b=ONTXti8WORFQQhrwi5/xS2sTQbbeiXYvheLQlONnEatY6t2qQ9qEz1gFUD001G+w/a
         xSWOcfRWg8fiurfDEoDGxbFnI9fyL1QRdXl40s+pefcFbqyRDBEhvx/JWuw3IgkPojn+
         sWl3RBz02DFDCMqrvlgNl62BWXTXxM3YsNnn//sQtmysmZvYQM4sKaG7/fZ76OsdnSub
         D/vHFnQ5r2jTQI7bDxB859tlTLBrksVmFHGrSHCmpKdVNLSPL4i2ZcQfyjtnaCKich0y
         XUtfTarIg9oDylfXCE7laEEH1QJ+v9kH2+F3k49pu0GVHeXm9d26zX9+dxBfpSVWzuZg
         1PJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LO6y5tkfgNged57O731G9ECwYnoNXu48Izp7SYxqk34=;
        b=AUkuL9U8AD/v1WEtQE5U0223VF1Dak0K+CxEHlAaZadHCY8tXWwWQTq9EjA6ivnyy+
         0+D3XxpVS5+I6oBD237hzu6vdkKfIjcpuXu7B4RpE7y6Y5YnomR2W8krKYtdogBUPs37
         xZUNUjGV6FQwFS/GRNhRE3l0WteRSA8JRLVXwWi7AcbMPXz48zmb2G6xGexJALzmbLcS
         +vyHs9icUD6YBMbn/EgWraql+PsGn5PAFpTaYh9C1wTkQd0d0/maDAIv1WHMWeehD2Kn
         Ugo7gdJ8M9CktOjUe22mo4c/CXRnPKkxrQzUjF+HL6YwKdAQO8yY6ofORTUAqSWd/xIl
         pavg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S+lnNuyV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj40-20020a05620a1da800b0075cdb8ff755si3651866qkn.435.2023.05.30.04.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:39:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S+lnNuyV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3xgs-0007sH-Bs; Tue, 30 May 2023 07:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgn-0007rW-MW
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:38:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgi-0003yk-U0
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LO6y5tkfgNged57O731G9ECwYnoNXu48Izp7SYxqk34=;
 b=S+lnNuyVC1BTYYtG/hCP+ruyEhB6w0P0giq0Cmz+axkFjkRPe97vNmY2tuB3qQbSf6Q/a4
 LFAou4ASBw0O+5ClieUAh/5FBYKEjON7605Y2O3R7gd2hrUjzDuOYnrXBizHI/goK6x5ib
 w0B9gaJ86pNtn+15+dsA6bwAk5RpHM4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-rjPf2xe3Oo6cI8Z-FOWwzA-1; Tue, 30 May 2023 07:38:49 -0400
X-MC-Unique: rjPf2xe3Oo6cI8Z-FOWwzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 496ED1C03DA3;
 Tue, 30 May 2023 11:38:48 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0D0F40CFD45;
 Tue, 30 May 2023 11:38:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH 01/10] memory-device: Unify enabled vs. supported error
 messages
Date: Tue, 30 May 2023 13:38:29 +0200
Message-Id: <20230530113838.257755-2-david@redhat.com>
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ryefawv8WcPt

Let's unify the error messages, such that we can simply stop allocating
ms->device_memory if the size would be 0 (and there are no memory
devices ever).

The case of "not supported by the machine" should barely pop up either
way: if the machine doesn't support memory devices, it usually doesn't
call the pre_plug handler ...

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 1636db9679..49f86ec8a8 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -104,15 +104,10 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
     GSList *list = NULL, *item;
     Range as, new = range_empty;
 
-    if (!ms->device_memory) {
-        error_setg(errp, "memory devices (e.g. for memory hotplug) are not "
-                         "supported by the machine");
-        return 0;
-    }
-
-    if (!memory_region_size(&ms->device_memory->mr)) {
-        error_setg(errp, "memory devices (e.g. for memory hotplug) are not "
-                         "enabled, please specify the maxmem option");
+    if (!ms->device_memory || !memory_region_size(&ms->device_memory->mr)) {
+        error_setg(errp, "the configuration is not prepared for memory devices"
+                         " (e.g., for memory hotplug), consider specifying the"
+                         " maxmem option");
         return 0;
     }
     range_init_nofail(&as, ms->device_memory->base,
-- 
2.40.1

