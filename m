Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8412291wrp;
        Tue, 1 Oct 2019 09:25:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOl47UI0TthmvPEypSquj8v6mJ3AOEics5l27muLDq95CZoRX8sjQOSAfb7R/an7vgZruD
X-Received: by 2002:a17:906:ecf6:: with SMTP id qt22mr24920164ejb.212.1569947102658;
        Tue, 01 Oct 2019 09:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569947102; cv=none;
        d=google.com; s=arc-20160816;
        b=BxiC8x3RdY3EvHc7Kt5XIgOdEqtd0JrVoDQH7aloiO+o1D7AY8oKyoQmWiECfs+TXl
         UR6sbToCqbyaKT4U/k8GeG0M9FUG/cH/LB/rANzu7eMrpJDX4xJ1A/qXg3jQ8i88WT7M
         Wqks8t9X8k1BEsxQuGFLxvPHtuot5I6Yb3Dd6v+Lza32XVNN2PrwwNEMPVmATT3WznJX
         ad7v7VX3xST+vxJslcHsmn/vRN4m0DPfZhhescxJe96tmFG7fuSEvYLQajXdm/bPEGFv
         29xj8QtW7s5W5apdsJvhNBJzz+wKeEBO1ovhC4fIk885jRpmuxUCL+sNYhNLL/gGeSfB
         0QRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=iOR1wPucok67SIc9AtGi38LPajjE+rCnTpIVcEkmZro=;
        b=No3hlHtdstPS6korXCAO4DyAJ/G8k2gA5tfAqvkjcVS+AT5dSchkonXU1QrOy2r5cm
         tpHMuiMvdBL4X43ToUwE+vHZmbEK7YoU3XCzrYYebqMdYpa3hgajaWufSTSlzQZjU/Gb
         j3bgO/oL2eJoaa6WRyXQa2/U18LLdTzktfAly1+yh4GUCGJsH5+TxsxK2vhqWHfDEAh1
         sAPb+NnB2vNmOgUTYlNlgnoycnocIR6hQHnRsVw5NuzsQxQAqzuBZIx5wb9lbVDAu0Kt
         ZoZ+mPQJX28nyzxp9co5m0gciHZSERzJyCr3pNb7C9QvD50a7EP3577xrv0zG3QrZAP3
         6jjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si8909814ejk.23.2019.10.01.09.25.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 09:25:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFKxR-0005eI-0E
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 12:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFKU0-0000jN-C5
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFKTy-0007Ec-5G
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:54:36 -0400
Received: from relay.sw.ru ([185.231.240.75]:38470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFKTr-0006Zo-8W; Tue, 01 Oct 2019 11:54:33 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFKSw-0004xb-Of; Tue, 01 Oct 2019 18:53:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/31] error: auto propagated local_err
Date: Tue,  1 Oct 2019 18:52:52 +0300
Message-Id: <20191001155319.8066-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155319.8066-1-vsementsov@virtuozzo.com>
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, pburton@wavecomp.com, peter.maydell@linaro.org,
 codyprime@gmail.com, jasowang@redhat.com, mark.cave-ayland@ilande.co.uk,
 mdroth@linux.vnet.ibm.com, kraxel@redhat.com, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, quintela@redhat.com, arikalo@wavecomp.com,
 mst@redhat.com, armbru@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 joel@jms.id.au, marcandre.lureau@redhat.com, rth@twiddle.net,
 farman@linux.ibm.com, ehabkost@redhat.com, sw@weilnetz.de, groug@kaod.org,
 yuval.shaia@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 integration@gluster.org, clg@kaod.org, stefanha@redhat.com, david@redhat.com,
 jsnow@redhat.com, david@gibson.dropbear.id.au, kwolf@redhat.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, berrange@redhat.com,
 andrew@aj.id.au, cohuck@redhat.com, qemu-s390x@nongnu.org, mreitz@redhat.com,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pEwejedTlV4o

Here is introduced ERRP_AUTO_PROPAGATE macro, to be used at start of
functions with errp OUT parameter.

It has three goals:

1. Fix issue with error_fatal & error_prepend/error_append_hint: user
can't see this additional information, because exit() happens in
error_setg earlier than information is added. [Reported by Greg Kurz]

2. Fix issue with error_abort & error_propagate: when we wrap
error_abort by local_err+error_propagate, resulting coredump will
refer to error_propagate and not to the place where error happened.
(the macro itself doesn't fix the issue, but it allows to [3.] drop all
local_err+error_propagate pattern, which will definitely fix the issue)
[Reported by Kevin Wolf]

3. Drop local_err+error_propagate pattern, which is used to workaround
void functions with errp parameter, when caller wants to know resulting
status. (Note: actually these functions could be merely updated to
return int error code).

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

CC: kwolf@redhat.com
CC: mreitz@redhat.com
CC: jsnow@redhat.com
CC: fam@euphon.net
CC: sw@weilnetz.de
CC: codyprime@gmail.com
CC: marcandre.lureau@redhat.com
CC: pbonzini@redhat.com
CC: groug@kaod.org
CC: sundeep.lkml@gmail.com
CC: peter.maydell@linaro.org
CC: stefanha@redhat.com
CC: pburton@wavecomp.com
CC: arikalo@wavecomp.com
CC: berrange@redhat.com
CC: ehabkost@redhat.com
CC: david@gibson.dropbear.id.au
CC: clg@kaod.org
CC: mst@redhat.com
CC: marcel.apfelbaum@gmail.com
CC: mark.cave-ayland@ilande.co.uk
CC: yuval.shaia@oracle.com
CC: cohuck@redhat.com
CC: farman@linux.ibm.com
CC: rth@twiddle.net
CC: david@redhat.com
CC: pasic@linux.ibm.com
CC: borntraeger@de.ibm.com
CC: kraxel@redhat.com
CC: alex.williamson@redhat.com
CC: andrew@aj.id.au
CC: joel@jms.id.au
CC: eblake@redhat.com
CC: armbru@redhat.com
CC: mdroth@linux.vnet.ibm.com
CC: quintela@redhat.com
CC: dgilbert@redhat.com
CC: jasowang@redhat.com
CC: qemu-block@nongnu.org
CC: integration@gluster.org
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: qemu-s390x@nongnu.org

 include/qapi/error.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 9376f59c35..02f967ac1d 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -322,6 +322,43 @@ void error_set_internal(Error **errp,
                         ErrorClass err_class, const char *fmt, ...)
     GCC_FMT_ATTR(6, 7);
 
+typedef struct ErrorPropagator {
+    Error *local_err;
+    Error **errp;
+} ErrorPropagator;
+
+static inline void error_propagator_cleanup(ErrorPropagator *prop)
+{
+    error_propagate(prop->errp, prop->local_err);
+}
+
+G_DEFINE_AUTO_CLEANUP_CLEAR_FUNC(ErrorPropagator, error_propagator_cleanup);
+
+/*
+ * ERRP_AUTO_PROPAGATE
+ *
+ * This macro is created to be the first line of a function with Error **errp
+ * OUT parameter. It's needed only in cases where we want to use error_prepend,
+ * error_append_hint or dereference *errp. It's still safe (but useless) in
+ * other cases.
+ *
+ * If errp is NULL or points to error_fatal, it is rewritten to point to a
+ * local Error object, which will be automatically propagated to the original
+ * errp on function exit (see error_propagator_cleanup).
+ *
+ * After invocation of this macro it is always safe to dereference errp
+ * (as it's not NULL anymore) and to append hints (by error_append_hint)
+ * (as, if it was error_fatal, we swapped it with a local_error to be
+ * propagated on cleanup).
+ *
+ * Note: we don't wrap the error_abort case, as we want resulting coredump
+ * to point to the place where the error happened, not to error_propagate.
+ */
+#define ERRP_AUTO_PROPAGATE() \
+g_auto(ErrorPropagator) __auto_errp_prop = {.errp = errp}; \
+errp = ((errp == NULL || *errp == error_fatal) ? \
+    &__auto_errp_prop.local_err : errp)
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
-- 
2.21.0

