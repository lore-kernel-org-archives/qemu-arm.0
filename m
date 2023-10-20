Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1027617ejb;
        Thu, 19 Oct 2023 23:59:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpygFLcueLGMogANy0p9OZQAy8AbFkS3XB9LTt6eqqsg+TNI7J864QIOnOP7q5UYD/icIQ
X-Received: by 2002:a05:6a20:54a0:b0:13d:17cc:5bca with SMTP id i32-20020a056a2054a000b0013d17cc5bcamr1101591pzk.18.1697785194206;
        Thu, 19 Oct 2023 23:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697785194; cv=none;
        d=google.com; s=arc-20160816;
        b=DcsxbY9U8uGVTweDpwugChxxEVfbjF04ExUVMfiWYYJFj3qgPDjvo9TGBZwHICNKgp
         QEiBBLmnl8AX0rtYlGD43/C8m10kLkguzSKPuCeBoMg5t6Bd12ko+z0Cy0RbcnEUx2eZ
         R2LEuEREsI64Wt6/2dBsKEUURQ7pwY+BEiraBnDBcb8LORJhFz+dMHgAD20IuRTwk0tl
         MVjq88V9zVb01MfF7J23Jt5ZNWzJuWRgBsUStEouoMTWreKz1i3IeccpJO1oILAT5k6D
         Q5hP3aSknBpMOcEY5cf3RqSCYCcN/T7iB2iwlHZ8UYKjcLzd8O1eAebmmjrdQ0VIwcT6
         P9tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=62Wx7d+hUDk5LG3UXJEzcN6iBAElK9cZPEKqQ1pd96A=;
        fh=fTjRJWWf32rfQWm8ROIsswmsB54Y1g6a+adPg1wBxPA=;
        b=iEMxZfgtsh/YuxZ8aQ2zjKz5D0bdppjBurW8vCAEvAT5kGq03AjTV/2ejwsI7iUEu9
         5/9DDjca1qZUWts05YSHEh6WJCHlEVR7A17B+jwhz7MdBZK2b+dfp/IuL4TtNt7qebdC
         7Nvgjf8jg8zPn47qPC3CB18/s6P+sfMu/sfravhC54m4Q45D/0pE1n7Gz3PUGak6IJnA
         rS8WGpRI4p68KATrdWbBp7Wmq9cztMxjIVMbt6noCR7sx3rlQW2v5JTJgam/fB2eXzK/
         uCsuKNpavDb3YbvRcqhSD36fmWluQ1qscJKOXjbf+drgeCabh032JNLDRNhCdF9OD1fs
         Tz8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UZyvDEtv;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:7 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from snail.vger.email (snail.vger.email. [2620:137:e000::3:7])
        by mx.google.com with ESMTPS id i13-20020a17090acf8d00b002791b62066csi3831436pju.38.2023.10.19.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:7 as permitted sender) client-ip=2620:137:e000::3:7;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UZyvDEtv;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 2620:137:e000::3:7 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by snail.vger.email (Postfix) with ESMTP id 6C73C809502C;
	Thu, 19 Oct 2023 23:59:53 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at snail.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376409AbjJTG7w (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 20 Oct 2023 02:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376381AbjJTG7v (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Oct 2023 02:59:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31058D4C
        for <kvm@vger.kernel.org>; Thu, 19 Oct 2023 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697785147;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=62Wx7d+hUDk5LG3UXJEzcN6iBAElK9cZPEKqQ1pd96A=;
        b=UZyvDEtvOY8ZtXLBU1imts2ScnPDbohc7d8tTD5xuTY3rBKxRaM/bXCD7uEL6d4hHtk4XO
        LryGzwsk0zwVjh6TFRUDGpBcQVV0r4a9sD4H0KE4ZZzIh45lG46UVJpZNxDCUapR+9zGOb
        iI6IEQThqFeppDLdUl0pbSiVMsA2sF8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-67LFWRorOMSgATgpK2Uo5A-1; Fri, 20 Oct 2023 02:58:59 -0400
X-MC-Unique: 67LFWRorOMSgATgpK2Uo5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B20C2810D47;
        Fri, 20 Oct 2023 06:58:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9EA9425C0;
        Fri, 20 Oct 2023 06:58:50 +0000 (UTC)
From:   Juan Quintela <quintela@redhat.com>
To:     qemu-devel@nongnu.org
Cc:     qemu-s390x@nongnu.org,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        "Denis V. Lunev" <den@openvz.org>,
        Juan Quintela <quintela@redhat.com>,
        Fam Zheng <fam@euphon.net>, kvm@vger.kernel.org,
        Harsh Prateek Bora <harshpb@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Kevin Wolf <kwolf@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Jagannathan Raman <jag.raman@oracle.com>, qemu-arm@nongnu.org,
        Alex Williamson <alex.williamson@redhat.com>,
        Reinoud Zandijk <reinoud@netbsd.org>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Elena Ufimtseva <elena.ufimtseva@oracle.com>,
        qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
        Stefan Berger <stefanb@linux.vnet.ibm.com>,
        Stefan Weil <sw@weilnetz.de>, Peter Xu <peterx@redhat.com>,
        Christian Schoenebeck <qemu_oss@crudebyte.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Jeff Cody <codyprime@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Hanna Reitz <hreitz@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Leonardo Bras <leobras@redhat.com>,
        Fabiano Rosas <farosas@suse.de>,
        Daniel Henrique Barboza <danielhb413@gmail.com>,
        Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org
Subject: [PULL 08/17] tests/qtest: Allow qtest_get_machines to use an alternate QEMU binary
Date:   Fri, 20 Oct 2023 08:57:42 +0200
Message-ID: <20231020065751.26047-9-quintela@redhat.com>
In-Reply-To: <20231020065751.26047-1-quintela@redhat.com>
References: <20231020065751.26047-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (snail.vger.email [0.0.0.0]); Thu, 19 Oct 2023 23:59:53 -0700 (PDT)
X-TUID: 1HnddHeoUJwN

From: Fabiano Rosas <farosas@suse.de>

We're adding support for using more than one QEMU binary in
tests. Modify qtest_get_machines() to take an environment variable
that contains the QEMU binary path.

Since the function keeps a cache of the machines list in the form of a
static variable, refresh it any time the environment variable changes.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231018192741.25885-4-farosas@suse.de>
---
 tests/qtest/libqtest.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 9eebba8767..3cc7bf3076 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1468,13 +1468,26 @@ struct MachInfo {
     char *alias;
 };
 
+static void qtest_free_machine_list(struct MachInfo *machines)
+{
+    if (machines) {
+        for (int i = 0; machines[i].name != NULL; i++) {
+            g_free(machines[i].name);
+            g_free(machines[i].alias);
+        }
+
+        g_free(machines);
+    }
+}
+
 /*
  * Returns an array with pointers to the available machine names.
  * The terminating entry has the name set to NULL.
  */
-static struct MachInfo *qtest_get_machines(void)
+static struct MachInfo *qtest_get_machines(const char *var)
 {
     static struct MachInfo *machines;
+    static char *qemu_var;
     QDict *response, *minfo;
     QList *list;
     const QListEntry *p;
@@ -1483,11 +1496,19 @@ static struct MachInfo *qtest_get_machines(void)
     QTestState *qts;
     int idx;
 
+    if (g_strcmp0(qemu_var, var)) {
+        qemu_var = g_strdup(var);
+
+        /* new qemu, clear the cache */
+        qtest_free_machine_list(machines);
+        machines = NULL;
+    }
+
     if (machines) {
         return machines;
     }
 
-    qts = qtest_init("-machine none");
+    qts = qtest_init_with_env(qemu_var, "-machine none");
     response = qtest_qmp(qts, "{ 'execute': 'query-machines' }");
     g_assert(response);
     list = qdict_get_qlist(response, "return");
@@ -1528,7 +1549,7 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
     struct MachInfo *machines;
     int i;
 
-    machines = qtest_get_machines();
+    machines = qtest_get_machines(NULL);
 
     for (i = 0; machines[i].name != NULL; i++) {
         /* Ignore machines that cannot be used for qtests */
@@ -1549,7 +1570,7 @@ bool qtest_has_machine(const char *machine)
     struct MachInfo *machines;
     int i;
 
-    machines = qtest_get_machines();
+    machines = qtest_get_machines(NULL);
 
     for (i = 0; machines[i].name != NULL; i++) {
         if (g_str_equal(machine, machines[i].name) ||
-- 
2.41.0
