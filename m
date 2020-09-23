Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp469958lfq;
        Wed, 23 Sep 2020 06:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA9nfoALBwXFidnRO1srGpqb4WwEGGb0Ii1GjMIY1x7hchlUCuCCpeqqHXlx4Fnd8ALouj
X-Received: by 2002:a25:aaae:: with SMTP id t43mr51528ybi.404.1600868399863;
        Wed, 23 Sep 2020 06:39:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600868399; cv=none;
        d=google.com; s=arc-20160816;
        b=AES9TrRtD6x0Dx1E4O3fF7DmmbM5CWLNrmSYLdCTqXYavT4BkAiAuU8om8lugsDNT6
         54ps3cD35ZratYFyZD36W1GAvVB6kzH5NT90WBzXK1Y5EFrGgNl/4yLGxZEPAib950Hm
         yuXe4AkqqdkGjGLnIXg/XGW8cMx7lPKEER6MvBjelYKu7XPNT4ohEu+woiE5RzKjgQIL
         m+HjTEv+diW7nxKX4HpVSKUgerkmElQWRUcRW0UYjBG121gD3/GCVrI2UxPXHc+EtV+9
         eb+DELDQ+TOOiUGCuHs7hcs5OqYSbgp5Q1UFj2jrTIIwdSYa3+Bp2gA7kexieHH0C0M6
         YkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EDE6eBsh3chMZ0FNGkujCwNo1vodnt9g5073aQhFnCU=;
        b=fHAqqSMO36DxUUI7nQdfrKbPOp+CBLrHZEhZAR0WFLvRM7YTXienGRxk24FcZaP41o
         28y1lQlXKrWz4HWkqjsMua6KggaY6ePiAgSb6/ie3neGWg5GPu9a7+pu17YH1bczFmze
         c250GgrJ02Ix8H+ePEB9/UQE8wWHbUHxN2i7ySBzLZ7dQrT52DlBe7Zevel2TO6rnMeD
         EIWTdxiTlkeBYgDseyE3EoJzkuSeepdsEl+uz3y5m5mSA5mQqUuhJxe0TqNuIyVDLKmr
         H0Vp/sQrV9IvyBdhpIloJAUI9+MgzMBUuWUGKZlW4qheEVWn2gsxXDbCd1XtpdXi8AuI
         YiNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UdoV2/Np";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si18929ybl.436.2020.09.23.06.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 06:39:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UdoV2/Np";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kL503-00025c-88
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL4yg-0000QK-62
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 09:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kL4yc-00060Q-IF
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 09:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600868308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EDE6eBsh3chMZ0FNGkujCwNo1vodnt9g5073aQhFnCU=;
 b=UdoV2/NpAtnbWkZr5vWDgoyYgsyTnj1GImYX5B0VEv0xP5hg4wCId2lZpmjB1sT128Szzf
 irMe9cms0NwqgTbnX67RsOW+O32R+dpAfL99pdg6KkyhqH5gjuqSHh+IKp0d4Fngns3AvI
 iP4S5qfuo/PCq5N7sb4++ZYs2nWgXug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-fI3PwGO5NJClLokGgI-heA-1; Wed, 23 Sep 2020 09:38:25 -0400
X-MC-Unique: fI3PwGO5NJClLokGgI-heA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58731DDEE;
 Wed, 23 Sep 2020 13:38:23 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-73.ams2.redhat.com
 [10.36.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2BE60BEC;
 Wed, 23 Sep 2020 13:38:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] hw/smbios: support loading OEM strings values from a
 file
Date: Wed, 23 Sep 2020 14:38:02 +0100
Message-Id: <20200923133804.2089190-2-berrange@redhat.com>
In-Reply-To: <20200923133804.2089190-1-berrange@redhat.com>
References: <20200923133804.2089190-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 00:53:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 79/gh4Cl3JtJ

Some applications want to pass quite large values for the OEM strings
entries. Rather than having huge strings on the command line, it would
be better to load them from a file, as supported with -fw_cfg.

This introduces the "path" parameter allowing for:

  $ echo -n "thisthing" > mydata.txt
  $ qemu-system-x86_64 \
    -smbios type=11,value=something \
    -smbios type=11,path=mydata.txt \
    -smbios type=11,value=somemore \
    ...other args...

Now in the guest

$ dmidecode -t 11
Getting SMBIOS data from sysfs.
SMBIOS 2.8 present.

Handle 0x0E00, DMI type 11, 5 bytes
OEM Strings
	String 1: something
	String 2: thisthing
	String 3: somemore

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/smbios/smbios.c | 71 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 13 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 7cc950b41c..d993448087 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -110,7 +110,7 @@ static struct {
 
 static struct {
     size_t nvalues;
-    const char **values;
+    char **values;
 } type11;
 
 static struct {
@@ -314,6 +314,11 @@ static const QemuOptDesc qemu_smbios_type11_opts[] = {
         .type = QEMU_OPT_STRING,
         .help = "OEM string data",
     },
+    {
+        .name = "path",
+        .type = QEMU_OPT_STRING,
+        .help = "OEM string data from file",
+    },
 };
 
 static const QemuOptDesc qemu_smbios_type17_opts[] = {
@@ -641,6 +646,8 @@ static void smbios_build_type_11_table(void)
 
     for (i = 0; i < type11.nvalues; i++) {
         SMBIOS_TABLE_SET_STR_LIST(11, type11.values[i]);
+        g_free(type11.values[i]);
+        type11.values[i] = NULL;
     }
 
     SMBIOS_BUILD_TABLE_POST;
@@ -940,9 +947,8 @@ static void save_opt(const char **dest, QemuOpts *opts, const char *name)
 
 
 struct opt_list {
-    const char *name;
     size_t *ndest;
-    const char ***dest;
+    char ***dest;
 };
 
 static int save_opt_one(void *opaque,
@@ -951,23 +957,60 @@ static int save_opt_one(void *opaque,
 {
     struct opt_list *opt = opaque;
 
-    if (!g_str_equal(name, opt->name)) {
-        return 0;
+    if (g_str_equal(name, "path")) {
+        g_autoptr(GByteArray) data = g_byte_array_new();
+        g_autofree char *buf = g_new(char, 4096);
+        ssize_t ret;
+        int fd = qemu_open(value, O_RDONLY, errp);
+        if (fd < 0) {
+            return -1;
+        }
+
+        while (1) {
+            ret = read(fd, buf, 4096);
+            if (ret == 0) {
+                break;
+            }
+            if (ret < 0) {
+                error_setg(errp, "Unable to read from %s: %s",
+                           value, strerror(errno));
+                return -1;
+            }
+            if (memchr(buf, '\0', ret)) {
+                error_setg(errp, "NUL in OEM strings value in %s", value);
+                return -1;
+            }
+            g_byte_array_append(data, (guint8 *)buf, ret);
+        }
+
+        close(fd);
+
+        *opt->dest = g_renew(char *, *opt->dest, (*opt->ndest) + 1);
+        (*opt->dest)[*opt->ndest] = (char *)g_byte_array_free(data,  FALSE);
+        (*opt->ndest)++;
+        data = NULL;
+   } else if (g_str_equal(name, "value")) {
+        *opt->dest = g_renew(char *, *opt->dest, (*opt->ndest) + 1);
+        (*opt->dest)[*opt->ndest] = g_strdup(value);
+        (*opt->ndest)++;
+    } else if (!g_str_equal(name, "type")) {
+        error_setg(errp, "Unexpected option %s", name);
+        return -1;
     }
 
-    *opt->dest = g_renew(const char *, *opt->dest, (*opt->ndest) + 1);
-    (*opt->dest)[*opt->ndest] = value;
-    (*opt->ndest)++;
     return 0;
 }
 
-static void save_opt_list(size_t *ndest, const char ***dest,
-                          QemuOpts *opts, const char *name)
+static bool save_opt_list(size_t *ndest, char ***dest, QemuOpts *opts,
+                          Error **errp)
 {
     struct opt_list opt = {
-        name, ndest, dest,
+        ndest, dest,
     };
-    qemu_opt_foreach(opts, save_opt_one, &opt, NULL);
+    if (!qemu_opt_foreach(opts, save_opt_one, &opt, errp)) {
+        return false;
+    }
+    return true;
 }
 
 void smbios_entry_add(QemuOpts *opts, Error **errp)
@@ -1149,7 +1192,9 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             if (!qemu_opts_validate(opts, qemu_smbios_type11_opts, errp)) {
                 return;
             }
-            save_opt_list(&type11.nvalues, &type11.values, opts, "value");
+            if (!save_opt_list(&type11.nvalues, &type11.values, opts, errp)) {
+                return;
+            }
             return;
         case 17:
             if (!qemu_opts_validate(opts, qemu_smbios_type17_opts, errp)) {
-- 
2.26.2

