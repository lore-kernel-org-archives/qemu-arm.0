Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1080897ejb;
        Fri, 20 Oct 2023 02:09:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMEochp2mfLsGhja2cq0B2BZl3QXIP7Jryaew30zCKiyXwE3cjZC+LeAI8MvxXYlT4AQYW
X-Received: by 2002:a05:620a:d8c:b0:775:dabd:a234 with SMTP id q12-20020a05620a0d8c00b00775dabda234mr1212288qkl.22.1697792997150;
        Fri, 20 Oct 2023 02:09:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697792997; cv=none;
        d=google.com; s=arc-20160816;
        b=zcq9QiJoeFFT8zWxIHE7zr/Zyr4UVFTYZz081ECpegsrsoyWEsphDONHHybOzrlh/x
         k9JJ1ATlY9tPtdFKdfTM25wNhFLsWRytc+xhaFFXeWblmT9oeeq/ZcTJ0SFlZXtu6TsD
         p6aWmDHbmQH3vZsWqnV1rSJzG+fW9s2xAdnTVjiz4t+bb2u6MJL49oPIZMjKXOZmiFqD
         Mb0sw/P0eyjz+yLK1qro/kLr+Iyb0157A4B/lKWDdp6zGLukkr6GNYkTk2ij+R1BS0Wk
         /O8dGo0kHlt1dH6H0EIzTPXAqcGTZGG1+ExDPr4aPi+PJQirPs3fpLSn0sK0BTnLECKp
         Cz6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=FM6X7w+5oEHqp4TUVIta1dJnlWHKe/701qVSkH3Agxw=;
        fh=uvmVDvHFt8QecZIhJCf4pbHhdYJlsPqsK2l+QaGoVa4=;
        b=kHYCpsPdZATuDLqqBehP40d4TzGttoiQK4GqFmrDtFjk8fDb2gCLsxwUH0GdSCkMG8
         4bUd3KfXfm+Cc2oGXjv2dMFKQrFIVpGPBxgp7+6FweNgE3KCglkrE8v1QFboB3EW+plJ
         sL+mTQnyjOKMhnEMzEpe/UG5UHjRckeHNY57AyCxEpNwI5jCU+u6/R61yiDx5OkEqL7B
         p9AXr3Emqnbgh4VbAJOyh4OUJu2xLctGo3JG9TG/GJlJvbGBnucboohkqP38qepCn9DI
         ETPoG4LnmIcQb3LKeNsm1pgc8x0omkLos8hknFmTL6vq69uVzdB9NP0O92jc8d3m2wMA
         St6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gzSfS9sQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a05622a018c00b0041999744a78si942283qtw.335.2023.10.20.02.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:09:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gzSfS9sQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtlUl-00049Y-83; Fri, 20 Oct 2023 05:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUZ-0003Ym-BS
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:08:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUX-0005Nw-LT
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FM6X7w+5oEHqp4TUVIta1dJnlWHKe/701qVSkH3Agxw=;
 b=gzSfS9sQo6C40OdFTxxUzonPfzKaNbO24fZCsyviV50zU2P2tpwQzWkV6c9dgMpqSjziD/
 zLKTqsTEsgkBkUXWQAvRXr5xesQ28DDY4eHTA25fyNq4lgjfTPN9SId2BhTIZjpMU03IGI
 wvqHXKeTq2v8Ee3Ukm5Nbr/w+egrgig=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-4IOZ77zUNRmbeS5ae0fzJQ-1; Fri, 20 Oct 2023 05:08:17 -0400
X-MC-Unique: 4IOZ77zUNRmbeS5ae0fzJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ED4510201F3;
 Fri, 20 Oct 2023 09:08:15 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75D852166B26;
 Fri, 20 Oct 2023 09:08:10 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Leonardo Bras <leobras@redhat.com>,
 John Snow <jsnow@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefan Weil <sw@weilnetz.de>, Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 07/13] migration: Hack to maintain backwards compatibility
 for ppc
Date: Fri, 20 Oct 2023 11:07:25 +0200
Message-ID: <20231020090731.28701-8-quintela@redhat.com>
In-Reply-To: <20231020090731.28701-1-quintela@redhat.com>
References: <20231020090731.28701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: W7A9vPyEz2Dl

Current code does:
- register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
  dependinfg on cpu number
- for newer machines, it register vmstate_icp with "icp/server" name
  and instance 0
- now it unregisters "icp/server" for the 1st instance.

This is wrong at many levels:
- we shouldn't have two VMSTATEDescriptions with the same name
- In case this is the only solution that we can came with, it needs to
  be:
  * register pre_2_10_vmstate_dummy_icp
  * unregister pre_2_10_vmstate_dummy_icp
  * register real vmstate_icp

Created vmstate_replace_hack_for_ppc() with warnings left and right
that it is a hack.

CC: Cedric Le Goater <clg@kaod.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Greg Kurz <groug@kaod.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h | 11 +++++++++++
 hw/intc/xics.c              | 17 +++++++++++++++--
 hw/ppc/spapr.c              | 25 +++++++++++++++++++++++--
 migration/savevm.c          | 18 ++++++++++++++++++
 4 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 9ca7e9cc48..65deaecc92 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -1230,6 +1230,17 @@ static inline int vmstate_register(VMStateIf *obj, int instance_id,
                                           opaque, -1, 0, NULL);
 }
 
+/**
+ * vmstate_replace_hack_for_ppc() - ppc used to abuse vmstate_register
+ *
+ * Don't even think about using this function in new code.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+int vmstate_replace_hack_for_ppc(VMStateIf *obj, int instance_id,
+                                 const VMStateDescription *vmsd,
+                                 void *opaque);
+
 /**
  * vmstate_register_any() - legacy function to register state
  * serialisation description and let the function choose the id
diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index c7f8abd71e..a03979e72a 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -335,8 +335,21 @@ static void icp_realize(DeviceState *dev, Error **errp)
             return;
         }
     }
-
-    vmstate_register(NULL, icp->cs->cpu_index, &vmstate_icp_server, icp);
+    /*
+     * The way that pre_2_10_icp is handling is really, really hacky.
+     * We used to have here this call:
+     *
+     * vmstate_register(NULL, icp->cs->cpu_index, &vmstate_icp_server, icp);
+     *
+     * But we were doing:
+     *     pre_2_10_vmstate_register_dummy_icp()
+     *     this vmstate_register()
+     *     pre_2_10_vmstate_unregister_dummy_icp()
+     *
+     * So for a short amount of time we had to vmstate entries with
+     * the same name.  This fixes it.
+     */
+    vmstate_replace_hack_for_ppc(NULL, icp->cs->cpu_index, &vmstate_icp_server, icp);
 }
 
 static void icp_unrealize(DeviceState *dev)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cb840676d3..a75cf475ad 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -143,6 +143,11 @@ static bool pre_2_10_vmstate_dummy_icp_needed(void *opaque)
 }
 
 static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
+    /*
+     * Hack ahead.  We can't have two devices with the same name and
+     * instance id.  So I rename this to pass make check.
+     * Real help from people who knows the hardware is needed.
+     */
     .name = "icp/server",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -155,16 +160,32 @@ static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
     },
 };
 
+/*
+ * See comment in hw/intc/xics.c:icp_realize()
+ *
+ * You have to remove vmstate_replace_hack_for_ppc() when you remove
+ * the machine types that need the following function.
+ */
 static void pre_2_10_vmstate_register_dummy_icp(int i)
 {
     vmstate_register(NULL, i, &pre_2_10_vmstate_dummy_icp,
                      (void *)(uintptr_t) i);
 }
 
+/*
+ * See comment in hw/intc/xics.c:icp_realize()
+ *
+ * You have to remove vmstate_replace_hack_for_ppc() when you remove
+ * the machine types that need the following function.
+ */
 static void pre_2_10_vmstate_unregister_dummy_icp(int i)
 {
-    vmstate_unregister(NULL, &pre_2_10_vmstate_dummy_icp,
-                       (void *)(uintptr_t) i);
+    /*
+     * This used to be:
+     *
+     *    vmstate_unregister(NULL, &pre_2_10_vmstate_dummy_icp,
+     * 	                    (void *)(uintptr_t) i);
+     */
 }
 
 int spapr_max_server_number(SpaprMachineState *spapr)
diff --git a/migration/savevm.c b/migration/savevm.c
index 8622f229e5..d3a30686d4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -846,6 +846,24 @@ static void vmstate_check(const VMStateDescription *vmsd)
     }
 }
 
+/*
+ * See comment in hw/intc/xics.c:icp_realize()
+ *
+ * This function can be removed when
+ * pre_2_10_vmstate_register_dummy_icp() is removed.
+ */
+int vmstate_replace_hack_for_ppc(VMStateIf *obj, int instance_id,
+                                 const VMStateDescription *vmsd,
+                                 void *opaque)
+{
+    SaveStateEntry *se = find_se(vmsd->name, instance_id);
+
+    if (se) {
+        savevm_state_handler_remove(se);
+    }
+    return vmstate_register(obj, instance_id, vmsd, opaque);
+}
+
 int vmstate_register_with_alias_id(VMStateIf *obj, uint32_t instance_id,
                                    const VMStateDescription *vmsd,
                                    void *opaque, int alias_id,
-- 
2.41.0

