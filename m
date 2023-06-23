Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp114268ejn;
        Fri, 23 Jun 2023 05:22:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ59El0gMFsJzuBgoocVPCA3etoSvztrB53hkOijePYqSKqN7if2jr6gfAPIMCGaq3Pj53X7
X-Received: by 2002:a05:6214:260f:b0:628:6ed3:109f with SMTP id gu15-20020a056214260f00b006286ed3109fmr24075700qvb.27.1687522971368;
        Fri, 23 Jun 2023 05:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687522971; cv=none;
        d=google.com; s=arc-20160816;
        b=P/nHQhCjqmWKUnl8qhD3ES/C4TgCP4Yvmk0FdLsYLZoHsmznTrDZyk6cuyRa/9tjzj
         ulwZtVVhDtGERTgKpei/bxEU3nHkJrlrKQkAJsKXySS+4cxgnuKCx1pFSpNHVSeTpH83
         DFlnpItJiajAQ9Hj7yvhQNDfY8emlWNGMFgBcfDm89BR8c/0HGVXUh5FlS4JhKmgLK3d
         eBxUJd+DyKhsqNHo8+nsY6xQLaW0UIXeynY9bgbjXYcVaqdQ8i6uKSpdutF0ImowgSU9
         IsMUcQEbqBGG2b49x3GLIrPqv65lOoc+CxSrgns4gmxoq6vWorAVB3h4JC1LmZlRy7Ea
         hbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FrY1SQ3Yj748vZYwX+qtv1yxXYFJfWvl6z14L8OHuKE=;
        b=g6sCN+ZcKIkhdo29HFnkt8frruP6rJ3lqpW7/+/o53UkE5V8Ry841Wx9K3Nk57JNkx
         LvZ4wtmtURM8CTl2VbKOcGvFRtqrxXJfzcp2dSOf4+pz4PgQdwRzj3o5ycjGU+AVtGnE
         EZenPr0xTYPjMtNkAiyyY/qEHEBKPS9i9yBimh2r2t4z4VXDc5oCp3hTp4u26XLbYgtP
         UY5suzTYHgBAr8BqKlv1Cv5vapSLqwEXyFVPH+3HdoSCxJatKn94QMkNTywbi+4MOJ4K
         WIK+rNBJLegyXzKb392zE+6FyQ0Io/r0ZufJ+V1+R5FlOkEzCxuaPIiZKqJuAtqWkKtX
         JB7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vlrk3G2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020ae9f30b000000b00765288a826dsi1446074qkg.674.2023.06.23.05.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vlrk3G2a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCfoG-0005bv-8B; Fri, 23 Jun 2023 08:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCfn7-0003rb-GS
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 08:21:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCfn4-0003pg-1B
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 08:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687522879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrY1SQ3Yj748vZYwX+qtv1yxXYFJfWvl6z14L8OHuKE=;
 b=Vlrk3G2a66VyQmfwtbWTmsrsQS2JePFxWtTTuiczEp6CJsW5CsClVosy46pf3MswIMFfdt
 ARZjgYyjGiOqUrd3goQwhIjU19Rf5XhNmy23J7zGGDmMJt3aO9+7BNTxP//lwXgPMtOGTi
 mb+3FI42h6IK9Bnc3/6ZJZ6Pbd1hTgw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-M_bOkhEZNnSpGhsVAjVVRA-1; Fri, 23 Jun 2023 08:21:15 -0400
X-MC-Unique: M_bOkhEZNnSpGhsVAjVVRA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73ED71C06EEC;
 Fri, 23 Jun 2023 12:21:14 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D26840C2063;
 Fri, 23 Jun 2023 12:21:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v2 6/7] virtio-mem: Prepare for device unplug support
Date: Fri, 23 Jun 2023 14:20:55 +0200
Message-Id: <20230623122056.374312-7-david@redhat.com>
In-Reply-To: <20230623122056.374312-1-david@redhat.com>
References: <20230623122056.374312-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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
X-TUID: un9nl3SzIux3

In many cases, blindly unplugging a virtio-mem device is problematic. We
can only safely remove a device once:
* The guest is not expecting to be able to read unplugged memory
  (unplugged-inaccessible == on)
* The virtio-mem device does not have memory plugged (size == 0)
* The virtio-mem device does not have outstanding requests to the VM to
  plug memory (requested-size == 0)

So let's add a callback to the virtio-mem device class to check for that.
We'll wire-up virtio-mem-pci next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-mem.c         | 25 +++++++++++++++++++++++++
 include/hw/virtio/virtio-mem.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 538b695c29..f32f95a7dc 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -1468,6 +1468,30 @@ static void virtio_mem_rdm_unregister_listener(RamDiscardManager *rdm,
     QLIST_REMOVE(rdl, next);
 }
 
+static void virtio_mem_unplug_request_check(VirtIOMEM *vmem, Error **errp)
+{
+    if (vmem->unplugged_inaccessible == ON_OFF_AUTO_OFF) {
+        /*
+         * We could allow it with a usable region size of 0, but let's just
+         * not care about that legacy setting.
+         */
+        error_setg(errp, "virtio-mem device cannot get unplugged while"
+                   " '" VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP "' != 'on'");
+        return;
+    }
+
+    if (vmem->size) {
+        error_setg(errp, "virtio-mem device cannot get unplugged while"
+                   " '" VIRTIO_MEM_SIZE_PROP "' != '0'");
+        return;
+    }
+    if (vmem->requested_size) {
+        error_setg(errp, "virtio-mem device cannot get unplugged while"
+                   " '" VIRTIO_MEM_REQUESTED_SIZE_PROP "' != '0'");
+        return;
+    }
+}
+
 static void virtio_mem_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1490,6 +1514,7 @@ static void virtio_mem_class_init(ObjectClass *klass, void *data)
     vmc->get_memory_region = virtio_mem_get_memory_region;
     vmc->add_size_change_notifier = virtio_mem_add_size_change_notifier;
     vmc->remove_size_change_notifier = virtio_mem_remove_size_change_notifier;
+    vmc->unplug_request_check = virtio_mem_unplug_request_check;
 
     rdmc->get_min_granularity = virtio_mem_rdm_get_min_granularity;
     rdmc->is_populated = virtio_mem_rdm_is_populated;
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index f15e561785..ab0fe2b4f2 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -98,6 +98,7 @@ struct VirtIOMEMClass {
     MemoryRegion *(*get_memory_region)(VirtIOMEM *vmem, Error **errp);
     void (*add_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
     void (*remove_size_change_notifier)(VirtIOMEM *vmem, Notifier *notifier);
+    void (*unplug_request_check)(VirtIOMEM *vmem, Error **errp);
 };
 
 #endif
-- 
2.40.1

