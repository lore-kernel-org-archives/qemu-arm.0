Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4182906lfk;
        Thu, 27 Jan 2022 07:44:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDEUap/CgjfiBa6I8IVuiLzXzE/5NXSk8uCVi2XHkpzh1t9MHCWjhX8GlpvMPhhPklaLzX
X-Received: by 2002:a25:bd07:: with SMTP id f7mr5956720ybk.131.1643298243472;
        Thu, 27 Jan 2022 07:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643298243; cv=none;
        d=google.com; s=arc-20160816;
        b=brnxZ+OZzD3Z6XtDFW+4PiOrRqsdYf+f9kzAtGt2zTRi98qxUwiD8FkCLv8irm/h/y
         dDyDTFLO1Apxd/7sPREiCGmihR+/iUhquYwnX09ICkljImLogaUmBfXgY4ccmNvREMmi
         ZXLll4SDh9OLbGZhMtS4volkwATr2sTGY/JpvmS/xZKjkqEtLF5Cz4U50cwTsOHYDoWL
         UW9/pXReaJuZdlpiQbl4Eqt985NjaLr8cfBpq19P+/S2zm/wp6nsOMiUJD75a8kG/wqn
         yEqRSUO5FksHoFeeOQY//eFl8YEgbk3M5DXykg5ygzRbfXdvvsVUentjY2orhj6Tboov
         ci2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BxZJGFjvzfnO4nc8Ezc/UIUx/16McbMtv5t6g3KJrHs=;
        b=KpcroMUVIixmIJbgtyhQObxcuxX05X7OP2kly4Oh6OtbG8b7R9hJQNfZdNlx3VFxTP
         +2iFakocqsrN7U7QvngTy9i0AVW/fZRMUGyxIe9yPG2wy+oxYwujAzzkbVtFsH6gPbLf
         jAyiFq8OoJ7D1B+anoftj1yf9NZYry97rLHq0SOweK3CZKMjVb/xGNBpszWoV+50THxs
         a6ObrZxYdGsKbdN7RSLYXKz9urFPXB56JkJQHCsE8Jv5KcYMiZGyXjGXe5BQ8ao4wEyG
         Vqw8uZ2GCLpmLqQlooZNUgXj9leiCKNZy8msIf79KC6eRLAP/OvtxgVbUpOMdVTC8Kcp
         5MPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HHq1PnHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si10269352ybh.588.2022.01.27.07.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 07:44:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HHq1PnHR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nD6wM-00014u-TB
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 10:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6V9-0007bG-N9
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6V6-0003AN-I5
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 10:15:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxZJGFjvzfnO4nc8Ezc/UIUx/16McbMtv5t6g3KJrHs=;
 b=HHq1PnHRjMVDrckf4s7tL2mJxBrCDOiDms2VuT53Rme+1y76dlKAJiuXrADtQLBTgvAGnu
 zqW8ViSWqjBLIV8Fq2bpKptETA4lBHSp15BLC+qx6+xurUXdq6974C9388NGSmrbAs2A0N
 0QK/WXDrhfDcqxWlv8C9NlJMLOittoM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-KmQOE7eVM9aeyUuW0fnETw-1; Thu, 27 Jan 2022 10:15:31 -0500
X-MC-Unique: KmQOE7eVM9aeyUuW0fnETw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9079101F7A3;
 Thu, 27 Jan 2022 15:15:28 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAC6270D2D;
 Thu, 27 Jan 2022 15:15:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/38] migration: Add canary to VMSTATE_END_OF_LIST
Date: Thu, 27 Jan 2022 16:05:33 +0100
Message-Id: <20220127150548.20595-24-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric Blake <eblake@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Vikram Garhwal <fnu.vikram@xilinx.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bQZTQspbWkQR

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
given that the current check is only for ->name being NULL, sometimes
we get unlucky and the code apparently works and no one spots the error.

Explicitly add a flag, VMS_END that should be set, and assert it is
set during the traversal.

Note: This can't go in until we update the copy of vmstate.h in slirp.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h | 7 ++++++-
 migration/savevm.c          | 1 +
 migration/vmstate.c         | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 017c03675c..b50708e57a 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -147,6 +147,9 @@ enum VMStateFlags {
      * VMStateField.struct_version_id to tell which version of the
      * structure we are referencing to use. */
     VMS_VSTRUCT           = 0x8000,
+
+    /* Marker for end of list */
+    VMS_END = 0x10000
 };
 
 typedef enum {
@@ -1163,7 +1166,9 @@ extern const VMStateInfo vmstate_info_qlist;
     VMSTATE_UNUSED_BUFFER(_test, 0, _size)
 
 #define VMSTATE_END_OF_LIST()                                         \
-    {}
+    {                     \
+        .flags = VMS_END, \
+    }
 
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id);
diff --git a/migration/savevm.c b/migration/savevm.c
index 1599b02fbc..b17e624d3f 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -620,6 +620,7 @@ static void dump_vmstate_vmsd(FILE *out_file,
             field++;
             first = false;
         }
+        assert(field->flags == VMS_END);
         fprintf(out_file, "\n%*s]", indent, "");
     }
     if (vmsd->subsections != NULL) {
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc..181ba08c7d 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -160,6 +160,7 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
         }
         field++;
     }
+    assert(field->flags == VMS_END);
     ret = vmstate_subsection_load(f, vmsd, opaque);
     if (ret != 0) {
         return ret;
@@ -413,6 +414,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
         }
         field++;
     }
+    assert(field->flags == VMS_END);
 
     if (vmdesc) {
         json_writer_end_array(vmdesc);
-- 
2.34.1

