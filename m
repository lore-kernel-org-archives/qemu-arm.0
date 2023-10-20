Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1028447ejb;
        Fri, 20 Oct 2023 00:01:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAZpcwqg4lN1abpVSl/DMVatGqCwrx/ykpSD1Pgh/yX4ZYd7EDB9RjoApyItA8PbZrz/hl
X-Received: by 2002:a17:902:fb03:b0:1ca:8abd:6b52 with SMTP id le3-20020a170902fb0300b001ca8abd6b52mr879059plb.69.1697785268442;
        Fri, 20 Oct 2023 00:01:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697785268; cv=none;
        d=google.com; s=arc-20160816;
        b=uTh00mRwsn+iQ9N68LYHMuLNPldHOfFLmEEQjev4Ig3JJYAj1nqCknVBwei9YnWrcd
         GoTnnLJywwCDNuiLaPNayPCTxahvdChCsqaEWLstZM932+ZwgQ6t6teIGH5ApClyXb0J
         vjETSk/eKTF0GlmGwJEcFvoaF+R/CHynLH2JHVGlXc9QzW4KHqiWJ3HZREplEy9FOVvA
         GQDPsNq9fo7MMS9QNjpKrIfByxuZI2CcjO0MKAGNGavW0J4BmPdJZjexYW+2Fua/hXkv
         /I6UabsnQzItmAXqx0L9uyijBmW34YZ0qWEXlgMy3DRN+L1bstj53sY5a1z7slFOSSRF
         S6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=TnYw+YU1jFZePtxi6Q8YXgpyNvkRnDyLIi315klT6xM=;
        fh=fTjRJWWf32rfQWm8ROIsswmsB54Y1g6a+adPg1wBxPA=;
        b=kBig6XHpJsUYas7as7GdsK7lEDLdFHrWkqi24mfEVd6/+iVW05iYR5DJSH6NeHCsmh
         fuZbx2HBKvJ9jJGAWMMJkcDCrPoxzO7VnY30EZk2VYzHG7MqcJP5H+bLuQ9n0zX16fJt
         ZX0KGYQM1Sy2XnNAMLw9h4PdNrB1sGEoDk6oT8SHlgPOc1nbLqXz78+ahMsqgQx0r5QE
         yjNyfmLtKNgfvqbGeLeeQoW8DFfcVIGX5yW7AmP4v82Qq3BOLyJTWEAcsmHCynlzJ0x0
         a/MSbW0hCqoNj3poT3kSX1zi5MsmygaX02sV8ik63SmSPV6zQUuIlh4XuKrZIQUy3xaL
         ZLoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aEPMVxLg;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.37 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from snail.vger.email (snail.vger.email. [23.128.96.37])
        by mx.google.com with ESMTPS id a14-20020a1709027d8e00b001c61817e049si1163588plm.67.2023.10.20.00.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:01:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.37 as permitted sender) client-ip=23.128.96.37;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aEPMVxLg;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.37 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from out1.vger.email (depot.vger.email [IPv6:2620:137:e000::3:0])
	by snail.vger.email (Postfix) with ESMTP id 347018047473;
	Fri, 20 Oct 2023 00:01:03 -0700 (PDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.10 at snail.vger.email
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376418AbjJTHBC (ORCPT <rfc822;mathieu.poirier@linaro.org>
        + 2 others); Fri, 20 Oct 2023 03:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376398AbjJTHBA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 20 Oct 2023 03:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847D7D5A
        for <kvm@vger.kernel.org>; Fri, 20 Oct 2023 00:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697785207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TnYw+YU1jFZePtxi6Q8YXgpyNvkRnDyLIi315klT6xM=;
        b=aEPMVxLgiqs3xqSYgRfy2sNbftapGvwSQh8wl0LYPGcUbUoMX+galUaNX5Wys1SnuyQlRe
        UJldJYibfh2Er7eVYQnFSvgLoxa/F7xYmL078wAsqeUHGeUlD0V1DEcVa+AUHg3WFEh+0h
        vb6aWBaMnPzcmr096lGcCw2RHyF/pss=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-683-3IgkL9QzP5KrLCFHOrqQ6w-1; Fri, 20 Oct 2023 03:00:01 -0400
X-MC-Unique: 3IgkL9QzP5KrLCFHOrqQ6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88A9488B772;
        Fri, 20 Oct 2023 07:00:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ED04125C0;
        Fri, 20 Oct 2023 06:59:53 +0000 (UTC)
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
Subject: [PULL 17/17] tests/qtest: Don't print messages from query instances
Date:   Fri, 20 Oct 2023 08:57:51 +0200
Message-ID: <20231020065751.26047-18-quintela@redhat.com>
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
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.6.4 (snail.vger.email [0.0.0.0]); Fri, 20 Oct 2023 00:01:03 -0700 (PDT)
X-TUID: J3JpYKMq6MOU

From: Fabiano Rosas <farosas@suse.de>

Now that we can query more than one binary, the "starting QEMU..."
message can get a little noisy. Mute those messages unless we're
running with --verbose.

Only affects qtest_init() calls from within libqtest. The tests
continue to output as usual.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-ID: <20231018192741.25885-13-farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/libqtest.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index c843c41188..f33a210861 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -91,6 +91,7 @@ struct QTestState
 
 static GHookList abrt_hooks;
 static void (*sighandler_old)(int);
+static bool silence_spawn_log;
 
 static int qtest_query_target_endianness(QTestState *s);
 
@@ -405,7 +406,9 @@ static QTestState *G_GNUC_PRINTF(2, 3) qtest_spawn_qemu(const char *qemu_bin,
 
     qtest_add_abrt_handler(kill_qemu_hook_func, s);
 
-    g_test_message("starting QEMU: %s", command->str);
+    if (!silence_spawn_log) {
+        g_test_message("starting QEMU: %s", command->str);
+    }
 
 #ifndef _WIN32
     s->qemu_pid = fork();
@@ -1508,6 +1511,8 @@ static struct MachInfo *qtest_get_machines(const char *var)
         return machines;
     }
 
+    silence_spawn_log = !g_test_verbose();
+
     qts = qtest_init_with_env(qemu_var, "-machine none");
     response = qtest_qmp(qts, "{ 'execute': 'query-machines' }");
     g_assert(response);
@@ -1539,6 +1544,8 @@ static struct MachInfo *qtest_get_machines(const char *var)
     qtest_quit(qts);
     qobject_unref(response);
 
+    silence_spawn_log = false;
+
     memset(&machines[idx], 0, sizeof(struct MachInfo)); /* Terminating entry */
     return machines;
 }
-- 
2.41.0
