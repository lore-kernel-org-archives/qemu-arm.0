Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1080297ejb;
        Fri, 20 Oct 2023 02:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVEFBkDUVLaNZ+iEBRIE/mOAS7Epn2DmyO/XgrK4rZFFrJrArZ55Sy/CPn4xmBi6YsFw6z
X-Received: by 2002:a0c:f383:0:b0:66d:8184:dd8c with SMTP id i3-20020a0cf383000000b0066d8184dd8cmr1503784qvk.54.1697792966516;
        Fri, 20 Oct 2023 02:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697792966; cv=none;
        d=google.com; s=arc-20160816;
        b=E3SnTK0wf48SQ0fQ+SrhY1AVnqGpXc42UtCjkPgOb8rXrfz97MOG2VAUpJLVy+QmNP
         Tru1NorGQpIxe2YmpfzlsT4AO3rjJlINDa5FB8yD3EyMzbtKwrmpw0ltOsN1SxavdWAV
         BBlwI5IeLoleBoK0XmKSesf/1qZpp7BeXU7X2Bx3jNEXIhCfrI7O0yFW6uU7E6FvKPgE
         HLGc9Fd7tN8UWsEA2yUc0DUGdSzReWE3EvxUnF9EAIDrJ+nWvuBVIYICM1BLXe2crtOC
         BuwDkGJlvKm7cENgf9Ivk33X0IuM+DjQbhxHKL2Ws9AjeyhyfiBNjn6Gj9W15P4zDmt/
         QPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dPFKFxb8DJz95gYXEG9Aat0SQ82S3bVS/JwdgKLCTKE=;
        fh=k0EjN9tR7Wi3crGVOHXL3NqxEtxIu+/9fR/CbRp+kPw=;
        b=jhw2v0OPQC/wOIeaWtAAJmcW1YfmDgVC34BIpix243ftXxIQOxgH8HxTu/MfVgGdMV
         4ad9CkTSk2fslaQqYf4BfsAsRNSxsI6NFEgvOIUV6J3XyFG4RAPqk2r/rDtAUJMos5m+
         0GhceQGouMgy+5ipthxm+MrCMGKC+xi4O4XiGcZRAW3mZbYL0yaYUBqUGKsAWPq6/O41
         BR7/GYP/Zx6JCRtm6H6ShHdgW78M25v4Vm/a60tzSXH2dcRssEzU0h25LBG8F3Vs+wLO
         SudwijMPQk9ImfzYbI2BPHXlW7sK93/lL6ImSCj+Yg9zleWgV6o9KVcRam6yvJW1OH0L
         WOVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6hNXomA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020ad4424f000000b0066d066a11f9si1042335qvq.228.2023.10.20.02.09.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6hNXomA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtlUr-0004Xh-PF; Fri, 20 Oct 2023 05:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUl-00049S-8y
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUi-0005SN-LK
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPFKFxb8DJz95gYXEG9Aat0SQ82S3bVS/JwdgKLCTKE=;
 b=D6hNXomAwXdK+5DJQvkzXrVK7l409h/y0A40ZRXxnqAuwCVRQ8Z1E+unr8IWYaomu6hTml
 sDdZ34gSA/H+MbuhIU8/b3NstIkFRrQOY/xiDgRzOaAKWH18d3q+Gwmjc0GdyXRWxBexD5
 iQSFXTS+/2W/VV9Ze95dYbqpewrsEsU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-N70mnJKLN5uo16UnB-uv1A-1; Fri, 20 Oct 2023 05:08:27 -0400
X-MC-Unique: N70mnJKLN5uo16UnB-uv1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 786C9857A91;
 Fri, 20 Oct 2023 09:08:26 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43A6F2166B26;
 Fri, 20 Oct 2023 09:08:21 +0000 (UTC)
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
 Stefan Weil <sw@weilnetz.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 09/13] migration: Check in savevm_state_handler_insert for
 dups
Date: Fri, 20 Oct 2023 11:07:27 +0200
Message-ID: <20231020090731.28701-10-quintela@redhat.com>
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
X-TUID: cysgFXdCV9bP

From: Peter Xu <peterx@redhat.com>

Before finally register one SaveStateEntry, we detect for duplicated
entries.  This could be helpful to notify us asap instead of get
silent migration failures which could be hard to diagnose.

For example, this patch will generate a message like this (if without
previous fixes on x2apic) as long as we wants to boot a VM instance
with "-smp 200,maxcpus=288,sockets=2,cores=72,threads=2" and QEMU will
bail out even before VM starts:

savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=apic, instance_id=0x0

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/migration/savevm.c b/migration/savevm.c
index d3a30686d4..3e0ece84e8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -237,6 +237,8 @@ static SaveState savevm_state = {
     .global_section_id = 0,
 };
 
+static SaveStateEntry *find_se(const char *idstr, uint32_t instance_id);
+
 static bool should_validate_capability(int capability)
 {
     assert(capability >= 0 && capability < MIGRATION_CAPABILITY__MAX);
@@ -716,6 +718,18 @@ static void savevm_state_handler_insert(SaveStateEntry *nse)
 
     assert(priority <= MIG_PRI_MAX);
 
+    /*
+     * This should never happen otherwise migration will probably fail
+     * silently somewhere because we can be wrongly applying one
+     * object properties upon another one.  Bail out ASAP.
+     */
+    if (find_se(nse->idstr, nse->instance_id)) {
+        error_report("%s: Detected duplicate SaveStateEntry: "
+                     "id=%s, instance_id=0x%"PRIx32, __func__,
+                     nse->idstr, nse->instance_id);
+        exit(EXIT_FAILURE);
+    }
+
     for (i = priority - 1; i >= 0; i--) {
         se = savevm_state.handler_pri_head[i];
         if (se != NULL) {
-- 
2.41.0

