Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp810821wri;
        Tue, 5 Nov 2019 06:44:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxOFZ99Tm8XWkoa0/qFNy9WGMAfKtCzObX3ecNeRnuC09+vZdBXlWnGvu49pHwdgj4DDPH5
X-Received: by 2002:ac8:6641:: with SMTP id j1mr9616055qtp.48.1572965077922;
        Tue, 05 Nov 2019 06:44:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572965077; cv=none;
        d=google.com; s=arc-20160816;
        b=WDJS9jgvT8Sd8Jy0FltWA5iBLNpHkiUHRdi5qM6t/gSAScpVfrjlYg4O/qsTQoQqco
         X0owu+6+JlDaWzR5hKEWtQAU0Kdanbv2MLJtw//fRy7E46uTVdH6e85SYWorUAhhgx96
         MkIVhyltDH3bOS9Anv1pqTg4PTJLOA59mnEFeMlm642tQXrvXT4PcjRaKfhiarKJjoxl
         tD9/l9AS8bJD6Es3WQVNrko/xHVKHWpyo9armbpxMKP+a55HKAaFA18Rs1wWp41cFqhy
         gbSoxkNDQXZfzBsldMep1bT+kA+MYrP/6sQzfX8Ufy7rN273tmQWIIx9nz4Ee96U0lFU
         WTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yyVbY34OUXsHlGWcLPD9+CNZd8yEajYVwQtfTff+z4A=;
        b=OHySnb4InZRJsOq1mcmrmtqZJARvtzjrNQrUaPLkH+BI+Wnt6QyJQ6MrpcjKndiJFJ
         MzTKNzd3Y8WHqv0+DtJasaNuBzbja3x8lrL0SjYwdcZwyhSY4FG+tm78nm4aLqr8QW2R
         APJhPL8Zlk10nSuBF8U8x75vmCi5ixPDhVF6TEQxoCXPkFLPujfTlQZBybhbocYmZZBW
         mOxKVacCrQsz1riJJHu9eEPb2SFA4gPoOawoe9h1zxMbuv2wFhXjvwAEN/EmrhsQxsDX
         kWZQLbWg40BoUGv+dYqp2woeFCzdz4nXg8fLd1vNR9rjuguTPP+kif6puCOcWPx+DENT
         aZBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f31si4957487qvd.18.2019.11.05.06.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 06:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iS04S-0001Ft-UV
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 09:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS03O-0008W6-R8
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 09:43:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS03N-0002l3-OC
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 09:43:30 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:55037)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS03F-0002fa-0J; Tue, 05 Nov 2019 09:43:21 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MNOZO-1iHcpa0A94-00OnFO; Tue, 05 Nov 2019 15:43:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] qom: Fix error message in object_class_property_add()
Date: Tue,  5 Nov 2019 15:42:46 +0100
Message-Id: <20191105144247.10301-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6lLJMzjHAvmf+zbwEIjFaYmgyD4Xp9wj/yXBg2phAoLtjGTLNyf
 jFjRccWeRNCD3ubmrfEp6pKPVm7zFgjB+CKCqYNlLfEM0oSrYgQF1m5aP+VPUibYsU/asll
 l0BTqu8MMLy2rC5IlFC/P74gFDbdiPqYjDS81gLzgE669CpGIkKZX6QpwL+i+h9nd3ihAHs
 k0aU8H/oBeIugwumgO8KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9IzBdaTOrfc=:WVe7Hft7P5ufdiP75OVziB
 x8KctqAt8Cv13LcM75gj++4dutEn1v6LhQCSchEOYg+3tcCUGhIt50OpmFgITwSRxocBrT6e1
 bLP2HAWKwgcU66M482GnlsGwKAOwQSJubLVIpHxdSfMoOFUbTgySaV4aNsT8/NXQ44Ekpb6dj
 fkHmWUkptVIFOgHWCV8k7MOqOuGhzS4yhquR6JINooEiJtgAdBX7i7cYnis4JxR90Rq7mGqcm
 r8TB5sXsaFdr2oMLgWl23Fv+1rChP4I+6k371AwGaZIom+FcxtKUVlK9SnhPQErgGNMr0eaKv
 exQ23WnT7L0Q80b1ybigTikE0TmleJRNc/kVNs/6G0L9AQ6yIZpFpWoDb8rBApCbyt4ShbJPU
 ANLd4+KPQn2ALCD9oXPCD7JYQEAmtSclO/2X9fYeMaRedVAseex7WifatctvkBWGZ1NbpXfpD
 VJAmA+VGKVzMy1hC7r8S19oX6SnbiFpS6KrzdL+UBRPD6cYUfU1TMWr53tI+RSeydqA6CF7d+
 cI0ZBSSQ+ydwV0IgBhHd90uy2gMyoxuwEn2wacAXtC6zUy/R8Hdu1de7EpV6skhW6Dzb+TXyq
 nHnuwiwgIrNcSkeEn44cN7ThC6TWlXbVEo2lK+e/FtwcX2dLjRb9+7BAMOFpVcc1jnv03IeI6
 Y2l5mm0yZ489zSr+dbjUHxYaHF2spJzvD7vxmkeDD3V//U+togeiqoOm5AXdQJAcBcH1zAy3D
 b6tewJkju/xecXIYUa9kGmGwLWBWI1IMTK2wQ6W8+NQpz2/P78nHKQuxG6cQwqQI/rPdhAViP
 QWZcUcoFU7WV3kHIckvdm551ETQMMONk8tpB6dkM4yh7dSXhZjSapaolihSSiV7SlsFh/jcva
 rfBzTogkwOQAHn9mOXYA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.135
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 Claudio Fontana <claudio.fontana@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Fabien Chouteau <chouteau@adacore.com>, Greg Kurz <groug@kaod.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RId6S2e8puzI

From: Greg Kurz <groug@kaod.org>

The error message in object_class_property_add() was copied from
object_property_add() in commit 16bf7f522a2ff. Clarify that it is
about a class, not an object.

While here, have the format string in both functions to fit in a
single line for better grep-ability, despite the checkpatch warning.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <157287383591.234942.311840593519058490.stgit@bahia.tlslab.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 qom/object.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6fa9c619fac4..d51b57fba11e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1106,9 +1106,8 @@ object_property_add(Object *obj, const char *name, const char *type,
     }
 
     if (object_property_find(obj, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_get_typename(obj));
+        error_setg(errp, "attempt to add duplicate property '%s' to object (type '%s')",
+                   name, object_get_typename(obj));
         return NULL;
     }
 
@@ -1139,9 +1138,8 @@ object_class_property_add(ObjectClass *klass,
     ObjectProperty *prop;
 
     if (object_class_property_find(klass, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_class_get_name(klass));
+        error_setg(errp, "attempt to add duplicate property '%s' to class (type '%s')",
+                   name, object_class_get_name(klass));
         return NULL;
     }
 
-- 
2.21.0

