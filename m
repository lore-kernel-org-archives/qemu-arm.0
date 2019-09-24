Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4340454wrp;
        Tue, 24 Sep 2019 13:13:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAnvFfvUmabyPgUZUNFCfOyxvBGkv+vwEEgtqdHG2qZvhCkYVNprYuRevLNalrkJ3oP7vY
X-Received: by 2002:a1c:2c3:: with SMTP id 186mr2181549wmc.172.1569356030171;
        Tue, 24 Sep 2019 13:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569356030; cv=none;
        d=google.com; s=arc-20160816;
        b=cIpfa1Sb/75rWkDwzOyFSQ+V+kpWAf8Aw7z1VlQu5BoKJoSHbO2rXeBXYCIlxx4u0e
         wBhcbRFkt/aT1dsbBQVeW/Au/zc3tWhCFoNFDB29syxeEzJCp2GCVEgwwBQGR0kSXz74
         jKQvr1ATmDh7X8QGtrH1zNbfI/Wz9wR/gMSCVz0EZflHoYOYK30QPl12wVnDjRpK162e
         BkBpG70HYTNqHnrmrDTQCQo6vo7E6vrUVNwR58UWWeVA9f2GCThpuVarwR1vNG9K3d2W
         KmKIqomKumCsM/tOvfvarQL920vS6zbBm01iNwkUf9cTG+q0vP0reO8kdiyPs2Y5hUS9
         2Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=0DDkKryWT5zHfOjjqi1h9tDcxvEBQFi3uITvSx28/HA=;
        b=xJ60CMA25CAGBG3dZacvhXWBRwLJLWmg089kafW9Tclhm2L3yyxHlD6FMGPFmqkfP0
         rHCeqw3uXlmpnXmnDem+mta1P9XdUK28DCwEpi+RhSGxUA8UG71WoiBlgKT0OdUlCtWX
         pyr3yeCbqAL2we+HE1t6wVdHUSsJXWbmpTyeJu1T8qMBjIfQCOJV8kX/jFNyhCUMXiUp
         D3d34txfCfamcKbcJbBUCKLdZa9Xu183Z2n3cw7VZjqebFoosgOTWG7e+4Yk+NNyobPZ
         uuSrWZFLMhflHFz2IJBE3p8mi6eym9fw7L4ALqG6TfRNdZaQbOYL56f537/jnORf8/1D
         Xvlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qu18si1505621ejb.80.2019.09.24.13.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 13:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCrC0-0004ox-HR
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 16:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43743)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr8B-0000XG-0L
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr89-0002ru-0V
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:38042)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr88-0002qu-Nm; Tue, 24 Sep 2019 16:09:48 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr86-0001Mk-Qn; Tue, 24 Sep 2019 23:09:46 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/25] error: auto propagated local_err
Date: Tue, 24 Sep 2019 23:08:41 +0300
Message-Id: <20190924200902.4703-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924200902.4703-1-vsementsov@virtuozzo.com>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
Cc: Fam Zheng <fam@euphon.net>, Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CbW6Vu+iD7vV

Here is introduced ERRP_FUNCTION_BEGIN macro, to be used at start of
functions with errp parameter.

It has three goals:

1. Fix issue with error_fatal & error_append_hint: user can't see these
hints, because exit() happens in error_setg earlier than hint is
appended. [Reported by Greg Kurz]

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

CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Jeff Cody <codyprime@gmail.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Greg Kurz <groug@kaod.org>
CC: Subbaraya Sundeep <sundeep.lkml@gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Paul Burton <pburton@wavecomp.com>
CC: Aleksandar Rikalo <arikalo@wavecomp.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Eric Farman <farman@linux.ibm.com>
CC: Richard Henderson <rth@twiddle.net>
CC: David Hildenbrand <david@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: Michael Roth <mdroth@linux.vnet.ibm.com>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: "Daniel P. Berrangé" <berrange@redhat.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: qemu-block@nongnu.org
CC: qemu-devel@nongnu.org
CC: integration@gluster.org
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: qemu-s390x@nongnu.org

 include/qapi/error.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/qapi/error.h b/include/qapi/error.h
index 9376f59c35..fb41f7a790 100644
--- a/include/qapi/error.h
+++ b/include/qapi/error.h
@@ -322,6 +322,41 @@ void error_set_internal(Error **errp,
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
+ * ERRP_FUNCTION_BEGIN
+ *
+ * This macro is created to be the first line of a function with Error **errp
+ * parameter.
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
+#define ERRP_FUNCTION_BEGIN() \
+g_auto(ErrorPropagator) __auto_errp_prop = {.errp = errp}; \
+errp = ((errp == NULL || *errp == error_fatal) ? \
+    &__auto_errp_prop.local_err : errp)
+
 /*
  * Special error destination to abort on error.
  * See error_setg() and error_propagate() for details.
-- 
2.21.0

