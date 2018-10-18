Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2800586wrt;
        Thu, 18 Oct 2018 13:05:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63jnhA/D6ODZafqDjs317pDC4p2jxDFAZAPCZh8eekledC+T/sYjl6Ahy1Z1si/ueMFQKeH
X-Received: by 2002:a37:bcc1:: with SMTP id m184-v6mr29932980qkf.227.1539893101783;
        Thu, 18 Oct 2018 13:05:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539893101; cv=none;
        d=google.com; s=arc-20160816;
        b=mTREcYvwiyieQy/vrnAQBGMRr/cFfupta5HdER+IRXOEtvE0udaA44zG9VMOOlTguZ
         NqNt9oaoxev4BBrfFQM/CoxuEY9HOwaXXBWulR/Q1ZBY1ctW8dN3eXnIaH9EtrT1Qty1
         pJAGtbPk0N05KL8+jPR9DGrVgp3MnvHUHWhWk02mEqTP25jm9W4NBZD394DnCJEGJ/Jb
         vnSPpDcEzCt0WtoDTG0hFjaaoPLl+aEkJA80VU+f9g3b+chxA0F4GsgP7w3EnwjO9zqz
         4f+quR9548wIFL54p9Cl2U5KSgiMf2NBfCniHrFOQqzta6aMqH/iNCEbV8h9EjWTmZ/z
         n90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=IB/MJR4rU/9ka+BSQ/PEnz0mwRjM6n1n+T9pkkxOwQE=;
        b=RHyEffyIreHhxTDSLB3AFXhx9vdpKx582p/KuTWmF5O99KHuFQedSUe7l/fUY6Sjc7
         HBR7/9cqLaCFZ99xKXpLL0usUAjKRjOVHN++7fsafexiLkgM1WmCe5cM6V2Y2dWzym7G
         ShDBXvRy0UMxvI2UmI7FkE0gOKM5loja21vnJJ+kbSfaerS+qBDBN9d5PPY99/7L0mqI
         frGGLap7g8Qox6741xucxAVHRIRpQAJaVqcX2Gjy70JGeP1GYhsvTtrDZyt1RZrj/TRG
         z2Qn9oSZo2SL8hK8cH65jsQCoQpDjGZWT/HaLnxDQ72S6z+hY7IN/1maKoogu6511WgR
         hY8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l25-v6si1615052qtn.308.2018.10.18.13.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:05:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44249 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEXV-0007Qw-9q
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:05:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEX9-0007P7-CB
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEX8-0006m6-F2
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:04:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEX8-0006ki-89; Thu, 18 Oct 2018 16:04:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A9703082B56;
	Thu, 18 Oct 2018 20:04:37 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 028AD71D45;
	Thu, 18 Oct 2018 20:04:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:03:38 -0300
Message-Id: <20181018200422.4358-2-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 18 Oct 2018 20:04:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 01/45] hostmem-file: fixed the memory leak while
 get pmem path.
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
X-TUID: +AEW4Xuqndi6

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

