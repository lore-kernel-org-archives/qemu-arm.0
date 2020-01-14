Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5468481lff;
        Tue, 14 Jan 2020 04:54:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyn9sOn3pO1ODZMCdH4YvepYcOrnNNzvZXjs8JoSkOpL8PXxAI9AyZ9AVgKu+N4giuFd7od
X-Received: by 2002:ae9:dc82:: with SMTP id q124mr21727933qkf.20.1579006470725;
        Tue, 14 Jan 2020 04:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579006470; cv=none;
        d=google.com; s=arc-20160816;
        b=z2bzWwI7DA0sf6nBl8I6iuBZ+mm/rHrRH1WwTy3GYInfL3vPT6m/qJu1AbSel5XEy0
         qb6vrazcUf47GD/1m9TQd3+MwTgmWAIob6rbF0e8E226jTIj3lpxo3jtFUSTloDrSFzI
         FbHBRo+loXSNHlP0+jdGdiru/imKgTHXxundPVwCn1ii3S3CoK6HJjUTAE/kHDudbJY3
         Nc4oRZaRH+FulBWuV44F8O7r0pL5SWIRdqObjeI6toWbzgaPgwotPZ7YjuY3lQfyQy2y
         wfeVDrJqSqTlvUAzzbtt/GdrCjS+Ni1rDjNFvW2uqMTAWxMTBjJQ9+ByTo/pP5wB0aZg
         jc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WncZoYQhc4fyVcSeQQg7aX50Ge+MvO1i8vxboNCbIRE=;
        b=tXxidaxY7whmlaWzWEdDaUIcf04ryPrBL+hWhbZb/DIZfgrOu/FMRnE2tNp8yQ8bc8
         wzZAbH5zewyTW8sjbXHAzQ/jHCTdJU5zgkGANbdBhAuy1r/Z3SiD+AmFKaA+e+UGhGFG
         bKEFDqX4u+KOA1aVdPYCqybMaGWy9YUDeVvx20w+kJvBQ9ZpHUJuLTWqY6PCGsNtLmrb
         d78D+lmhJMNTbAIhKky4Fkm2M1COKG++fIYcrmbBg5g5SiqgXkBtCnSxH3KlfcyyjboY
         VoBOXaLzyjINVyXm+r7ukrdUVkLmYxqCd1LBK5SLJ9BQiDsLXfMtPSRdidVUJ+exMouX
         oDoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KJQb1nBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k29si8107038qtu.321.2020.01.14.04.54.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 04:54:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KJQb1nBQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irLiH-0001ka-4f
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 07:54:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLht-0001Om-DD
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLhp-0001UR-Dr
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:05 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40463
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLhp-0001UA-AT
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 07:54:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WncZoYQhc4fyVcSeQQg7aX50Ge+MvO1i8vxboNCbIRE=;
 b=KJQb1nBQL0Ekc0LC+unHqsdCpZpVff9MOT+dpniBcCEz9WXbl9U2tZBqTG7VmAjV1Bztep
 tGAlZ8RTr4L9eAnj0MgU/KDHR5t8Vaa7brJT/bf/ZgRF3gYHuTolGR7zQer2VDkDMraY0r
 zY4OA/8i70LUuJmKdLRQeUnJelcQZjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-4F9FB2kjM-SG4yMSqcjNRA-1; Tue, 14 Jan 2020 07:53:59 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67E20802C89;
 Tue, 14 Jan 2020 12:53:57 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6DDE5D9E5;
 Tue, 14 Jan 2020 12:53:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/30] migration-test: introduce functions to handle string
 parameters
Date: Tue, 14 Jan 2020 13:52:29 +0100
Message-Id: <20200114125254.4515-6-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 4F9FB2kjM-SG4yMSqcjNRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ZTxvdTfFlm7

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/qtest/migration-test.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index fb70214f44..b0580dd541 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -356,6 +356,43 @@ static void migrate_set_parameter_int(QTestState *who,=
 const char *parameter,
     migrate_check_parameter_int(who, parameter, value);
 }
=20
+static char *migrate_get_parameter_str(QTestState *who,
+                                       const char *parameter)
+{
+    QDict *rsp;
+    char *result;
+
+    rsp =3D wait_command(who, "{ 'execute': 'query-migrate-parameters' }")=
;
+    result =3D g_strdup(qdict_get_str(rsp, parameter));
+    qobject_unref(rsp);
+    return result;
+}
+
+static void migrate_check_parameter_str(QTestState *who, const char *param=
eter,
+                                        const char *value)
+{
+    char *result;
+
+    result =3D migrate_get_parameter_str(who, parameter);
+    g_assert_cmpstr(result, =3D=3D, value);
+    g_free(result);
+}
+
+__attribute__((unused))
+static void migrate_set_parameter_str(QTestState *who, const char *paramet=
er,
+                                      const char *value)
+{
+    QDict *rsp;
+
+    rsp =3D qtest_qmp(who,
+                    "{ 'execute': 'migrate-set-parameters',"
+                    "'arguments': { %s: %s } }",
+                    parameter, value);
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    migrate_check_parameter_str(who, parameter, value);
+}
+
 static void migrate_pause(QTestState *who)
 {
     QDict *rsp;
--=20
2.24.1

