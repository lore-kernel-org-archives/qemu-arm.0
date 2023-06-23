Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp124693ejn;
        Fri, 23 Jun 2023 05:47:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7iIEcaKHNMtS6mBuakdBSb8YPty+4kxiTgzEQSVlMV/oHHDaDd0VgzCYZxLANAeJKdLtOZ
X-Received: by 2002:adf:df04:0:b0:30f:a938:6d5d with SMTP id y4-20020adfdf04000000b0030fa9386d5dmr18067455wrl.56.1687524463633;
        Fri, 23 Jun 2023 05:47:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687524463; cv=none;
        d=google.com; s=arc-20160816;
        b=mmto0CBN8Rjm+FeaszQsoeH9smZ/1V0Kznox8aaMe2i8UAM/dEAnoy0c++O+zb5Yl0
         Vue9+o9soG2zzHnaKFz7OqfBlo1K1mDHj01CVkU3/7iWJpHs9R0i4aK4QrHknRk1Om7G
         XUwWrTt01B1+qiUQ/MXNusDdhoPHuaEQ/fHV5QssL1IsAMSZFvFR9GhljFRUO4xHAz5k
         eYiWHeX2MnEJfo1k7FgF3zn4GlhmyJYopaaQiBoM1j0ZBuImTzedHPEXppE/1oGwaTwn
         xYreBGUNhG8WXkzhN6LsZoRtkYlxwHZUbRB70BHC1VAx7YK8Vexa0D3iDa5JX/3hkcHv
         A9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=T6lLbn4wAevaYNir88uHLSoS3ayt4mzOGJLEgmNI+xk=;
        b=eF7NTwFStTpVsVEF3f0khIBoTJyPo5v72nQowmHcdxaXb7oAs1/pBpkJqqaXhq+6O1
         zIWms+r2lrkhse1auV+CT2iR3c7brtF1DE/LL07/hXehlL9poAh/d0rjAe5zK+dbxb/s
         qBzyDqteL4u7nfq939K5+ysBpWUtf3JLbvR43pg4tWqZCYBp8j2iZ5PSefVH/2/biijZ
         8GwxGIKXw+Jy3CBW/5qi+xZVMxdieGLUBQKcIlwh6Ynl5QwgbVXe0OqJTuo8WAXb5ZLe
         WLTszsMgZARvLGwYmz9b5I6tGCu2IV/+1hLi1Oa1P8stIqRUddShsx0HD9IRna6WeDTU
         xkng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IDhW7KnP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020adfedce000000b003112dbc5ed3si5522335wro.146.2023.06.23.05.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:47:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IDhW7KnP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCgB6-0001Yi-Q4; Fri, 23 Jun 2023 08:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgAz-0001TL-RR
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgAy-0000kb-8n
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687524367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6lLbn4wAevaYNir88uHLSoS3ayt4mzOGJLEgmNI+xk=;
 b=IDhW7KnPQRLGi4uzRigq1WlY6jqAKYljjy0kC86Tzqn9lwTkXWZw+2KKooRlqWFFnEeeWk
 cvYaATIQ8DfnBJGoTAMGImkdIh9eCq/HQ4mGAaDltgZ0f3Q+tRSZ76OvICk6APGQHRcXqc
 9B8Dn4M2aFyHjJCEiZdUbFMICA9uiIo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-iXuqt_pvNKSFIp741b79dQ-1; Fri, 23 Jun 2023 08:46:03 -0400
X-MC-Unique: iXuqt_pvNKSFIp741b79dQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 892C28E44E2;
 Fri, 23 Jun 2023 12:46:02 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22721121314;
 Fri, 23 Jun 2023 12:45:58 +0000 (UTC)
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
Subject: [PATCH v4 01/10] memory-device: Unify enabled vs. supported error
 messages
Date: Fri, 23 Jun 2023 14:45:44 +0200
Message-Id: <20230623124553.400585-2-david@redhat.com>
In-Reply-To: <20230623124553.400585-1-david@redhat.com>
References: <20230623124553.400585-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 47FJQiN5QDer

Let's unify the error messages, such that we can simply stop allocating
ms->device_memory if the size would be 0 (and there are no memory
devices ever).

The case of "not supported by the machine" should barely pop up either
way: if the machine doesn't support memory devices, it usually doesn't
call the pre_plug handler ...

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

