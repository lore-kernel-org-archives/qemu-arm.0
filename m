Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp714165wro;
        Thu, 25 Oct 2018 06:36:15 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cEzIUSPcmn+MEhAAnXHIna81XJmS3xgzw5ReVLtqJYNdbBZkXs+KxMzez7zQbbBxDQoGQo
X-Received: by 2002:a37:8a05:: with SMTP id m5-v6mr1450758qkd.170.1540474575218;
        Thu, 25 Oct 2018 06:36:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540474575; cv=none;
        d=google.com; s=arc-20160816;
        b=AdKDCjCmkYdq30AlTMGN0KVGohvqH5JB/eib5PwYPrjfjg+AvbWnb4w1veH/xlJW+F
         UkE9s+lonpE5tzFPVKU0OpOpGTZEzHtD1XILGY7uTIdYDanYNtgGeGLApxOG6xKM48AF
         ZFmO+nXCok97j1I/CAiUX2p2Q4Ba0m53SHFa8D/9IvI5F83ngjqyC28PqbtVxVVXJHiB
         3ExrrqXrb1thk0Vhsp9FiEKJ4yVedZfOKIJJX60YWQVUjMf5uWGAE3qmYdR62BXddPXi
         RGWN1ThbxO8H/JF/4C0nKB0Wbf3iQNeXnaSMwMChLTygYGnEew6lKIytjGjzV0GZ6gsJ
         D1zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=IB/MJR4rU/9ka+BSQ/PEnz0mwRjM6n1n+T9pkkxOwQE=;
        b=aHLU1Jns6q8CQCNLU/K5EGnANwoPAQfiPJ9I7O4gVqjGFnuZ0/wO3FViGhZLwcHxFG
         afWj2emZyfWvWME6/iakenppCvLIV1LRtvU4tJ4cZCaRkxau6ffONkMTCGZhJWrO77Ry
         iChlmWg2z46TfLBFE2ZkqciupkETneEb41Qb3r9AjDd65bKEVqEOJxMe87RzFAml+Oux
         Qfph/c4eqzPTyAy/gBU7gNxO1TilqlazDlrPVGj+Db/nSdk/YbkSA05O8irTbEuGtM6+
         u+OZY9P8ILyGDpRA2ziX+kufsAff/ZnbQO3+SCLel95Vdj5AZGXDbMg4265lAZtWR/3o
         GQww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4-v6si111819qtd.154.2018.10.25.06.36.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 06:36:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFfo6-0003EN-7M
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 09:36:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfmu-00028V-D8
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFflL-0006eA-C8
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 09:33:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFflL-0006ao-3V; Thu, 25 Oct 2018 09:33:23 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D91F98830C;
	Thu, 25 Oct 2018 13:33:19 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14BC81974A;
	Thu, 25 Oct 2018 13:33:13 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:32:19 -0300
Message-Id: <20181025133301.16578-2-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 25 Oct 2018 13:33:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 01/43] hostmem-file: fixed the memory leak
 while get pmem path.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>, Zhang Yi <yi.z.zhang@linux.intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USiK52BiBql+

From: Zhang Yi <yi.z.zhang@linux.intel.com>

object_get_canonical_path_component() returns a string which
must be freed using g_free().

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Zhang Yi <yi.z.zhang@linux.intel.com>
Message-Id: <7328fb16c394eaf5d65437d11c2a9343647b6d3d.1535471899.git.yi.z.zhang@linux.intel.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 backends/hostmem-file.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index e64074954f..639c8d4307 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -145,20 +145,26 @@ static void file_memory_backend_set_pmem(Object *o, bool value, Error **errp)
     HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(o);
 
     if (host_memory_backend_mr_inited(backend)) {
+        char *path = object_get_canonical_path_component(o);
+
         error_setg(errp, "cannot change property 'pmem' of %s '%s'",
                    object_get_typename(o),
-                   object_get_canonical_path_component(o));
+                   path);
+        g_free(path);
         return;
     }
 
 #ifndef CONFIG_LIBPMEM
     if (value) {
         Error *local_err = NULL;
+        char *path = object_get_canonical_path_component(o);
+
         error_setg(&local_err,
                    "Lack of libpmem support while setting the 'pmem=on'"
                    " of %s '%s'. We can't ensure data persistence.",
                    object_get_typename(o),
-                   object_get_canonical_path_component(o));
+                   path);
+        g_free(path);
         error_propagate(errp, local_err);
         return;
     }
-- 
2.18.0.rc1.1.g3f1ff2140

