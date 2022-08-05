Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1106865lfg;
        Fri, 5 Aug 2022 08:20:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7wCJXAYNrebFmeoZzL8zgfOL9yNeM6swNGqiQICV2zxIFyGX4LrgIhcjHMEjNu4xuvDdL/
X-Received: by 2002:a05:6214:2625:b0:474:742b:a59e with SMTP id gv5-20020a056214262500b00474742ba59emr6014701qvb.126.1659712840408;
        Fri, 05 Aug 2022 08:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1659712840; cv=none;
        d=google.com; s=arc-20160816;
        b=rRg27E95gx5Kz9Myr9TinnzvNr6OmmmwAls4lxXnnk7jxG1beTqeAd/gqLgTEBV+md
         5tWJ0rN6hUen66+rSlhHin/VqVZgqKs2rLjmbM21DxPu2DIzfa65JVoi0KbScMKhVL3K
         qXLYPF6oVtKPzlVMMYni+KBjQiFCvyuvTrDyso4Vx4lKWGQpNXSAC+KWjyWSwpSZ5kB+
         wuiOVn9iLuiGdXGMIS/yI11WMVOsQUq5bEYGyAbQtjkkNC5j7048U9DSI8wTqi0KfGFQ
         jkCJqQAfluDZt57dEKJBBDvMCBhV4aa3c6lzzaeasDTkmZE+xVIB4LBA9lOuyxovF3h7
         NsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=7iraYkiYx8+NSuanjcxylNLIVSYr1X7Uv5zr34EkgLk=;
        b=n6IhWgERFWtnMxKMlTaBFj/SImYBVzjasrwBk21LKSS1E6Iphv2P/986mf6TIZHTyy
         z8un0oBRV7FzVQbwygPorIlzxil0sT+tJgce0dkOn6o/HnahTcspMIXzQkzlhTGXc37n
         mhikUikKD7RvawPeot+dSu9/roPQbegAChKPZ0Ns8g5ZhS8FaMf5Rvzf/1tWZRTk4R+I
         YdfQONhyCIn5upTputsk0CkpO+679v6bT5g+YGCCzgi6+q/UZS/hhYtxEUokxZYUc9zH
         tZ6RQ7TkqXbcaxIGtJ4zMljrOBXIROvfWia0oXbnf+6rIl3MbyolcX/zt1d0mDqQ7uDp
         3OXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aS7AxF+a;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u16-20020ac87510000000b0031f05e7270bsi2183010qtq.369.2022.08.05.08.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Aug 2022 08:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aS7AxF+a;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659712840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7iraYkiYx8+NSuanjcxylNLIVSYr1X7Uv5zr34EkgLk=;
	b=aS7AxF+aQpDkw8pdbmoDRMKNgwRkrePI4mWB6T9u3X4MWCjaQNGm/lMegXm32xp4zHDhaE
	qHPUrTrW0P+nmEFoDOIHimR6mT5kSKlBwsRa8pMU0NI+WihKpnnhUBQmMJoaJPSTGp+dcv
	lppF4+qWo5+KHfg95voTCRN8B/3kd1g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-cl670GDlPHaZiIl3aSOjRQ-1; Fri, 05 Aug 2022 11:20:36 -0400
X-MC-Unique: cl670GDlPHaZiIl3aSOjRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09AFD1032963;
	Fri,  5 Aug 2022 15:20:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD2CF2027EB4;
	Fri,  5 Aug 2022 15:20:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com,
	Beraldo Leal <bleal@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL 4/6] target/s390x: display deprecation status in '-cpu help'
Date: Fri,  5 Aug 2022 16:20:12 +0100
Message-Id: <20220805152014.135768-5-berrange@redhat.com>
In-Reply-To: <20220805152014.135768-1-berrange@redhat.com>
References: <20220805152014.135768-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-TUID: YPEI5pOnhF4v

When the user queries CPU models via QMP there is a 'deprecated' flag
present, however, this is not done for the CLI '-cpu help' command.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/s390x/cpu_models.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index 1a562d2801..c3a4f80633 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -334,18 +334,31 @@ const S390CPUDef *s390_find_cpu_def(uint16_t type, uint8_t gen, uint8_t ec_ga,
 static void s390_print_cpu_model_list_entry(gpointer data, gpointer user_data)
 {
     const S390CPUClass *scc = S390_CPU_CLASS((ObjectClass *)data);
+    CPUClass *cc = CPU_CLASS(scc);
     char *name = g_strdup(object_class_get_name((ObjectClass *)data));
-    const char *details = "";
+    g_autoptr(GString) details = g_string_new("");
 
     if (scc->is_static) {
-        details = "(static, migration-safe)";
-    } else if (scc->is_migration_safe) {
-        details = "(migration-safe)";
+        g_string_append(details, "static, ");
+    }
+    if (scc->is_migration_safe) {
+        g_string_append(details, "migration-safe, ");
+    }
+    if (cc->deprecation_note) {
+        g_string_append(details, "deprecated, ");
+    }
+    if (details->len) {
+        /* cull trailing ', ' */
+        g_string_truncate(details, details->len - 2);
     }
 
     /* strip off the -s390x-cpu */
     g_strrstr(name, "-" TYPE_S390_CPU)[0] = 0;
-    qemu_printf("s390 %-15s %-35s %s\n", name, scc->desc, details);
+    if (details->len) {
+        qemu_printf("s390 %-15s %-35s (%s)\n", name, scc->desc, details->str);
+    } else {
+        qemu_printf("s390 %-15s %-35s\n", name, scc->desc);
+    }
     g_free(name);
 }
 
-- 
2.37.1
