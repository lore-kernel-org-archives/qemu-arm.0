Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2284775lff;
        Mon, 14 Jun 2021 13:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxartvzbSoFqi9K/5PSEq0N9xyn2zD4ceb6WmFZXfK0tLhH+oAhVgPTGg9mosHIckads9Fo
X-Received: by 2002:a05:6102:a19:: with SMTP id t25mr1055454vsa.3.1623701616281;
        Mon, 14 Jun 2021 13:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623701616; cv=none;
        d=google.com; s=arc-20160816;
        b=esSmtXlKlbQfZEVp28RAOkQ/H/v988NQu9ZkQGrJkneDeU+1iTgYLjy4+3PIj5TANQ
         Q972/PuZ3bEiS3TFU1a4Prq28f6TKaQ6O3FsQQ7TBWxbsmxgdSbxQiyY7VTQ49cOMrHL
         VZ+/g+BZT3jO8FiPKS3UI5hl2rNfeVPW9TaAjR3wxZgYWvoxOwWrDwy/uPLcWmwAz+/p
         iW0vjghXaEeXjE/j8bJvp8NHfu+QV1AI2hHq+OYIvMxWVSDtDetn5/NnSph62gP3zPuj
         jrhHC2qKK6OwtPaUvpJUXVDsSy2uuFf+L8fEwyqzbLExRDipdDG2LeaqHusNyFMnn40n
         Rc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
        b=vS/2vqk20PqLvo8LLF4ZsQNr5N3KNh/ld3TSFIHmdjgE4/Mao8PQzGOFKHDiBBFymF
         bb8DgDsRXx5jT4mXglHht2AkMSDUECzCB2Fa3It3ObASweCVnmOjx2LbFqO/YYNSRnmX
         tnn5clp4lvx7+pjTFRHJGpyYPXdvHrjlWQlu9GbzFnYxRuFsuh33Db/zjufMkQl4baPS
         02rWOHUN6x8+sibTDmcw4AZDmwn/boLyTaqA/sd/1j3IF8rFjmVfaQo61jg4z4Ti58yG
         GPGyRL9JKDI8m+ws/DP3oU5xak/sXsbcj8Y6Wj/IjyhqZO/NT2fEd1qPggv5vgBqtfY3
         e9sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iME3OMRt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si712926vkf.77.2021.06.14.13.13.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 13:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iME3OMRt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lssxj-0007Nz-GY
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 16:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuL-0001oE-Gs
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:10:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lssuJ-0002ys-7n
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 16:10:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623701402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
 b=iME3OMRtFPbpEyXHFD+D12MbqHnsbwsach/DvWXAIMmYlgCJS58URYCpLRRqZkEzuDINAL
 YPCiwnbiVy2tfPgXEKOCvcxOOeO8YmZX2grrwdjYhXIPC0oY9L9i/np54WPNaURj9hpwrT
 Zu2TKjzlFM/XPheRvyfr4XOdzdsDTM8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-CeW9pJwTNaiekAgJHKlZwg-1; Mon, 14 Jun 2021 16:10:01 -0400
X-MC-Unique: CeW9pJwTNaiekAgJHKlZwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g14-20020a05600c4eceb02901b609849650so30753wmq.6
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 13:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hIM4nZ+edtMSEGqYdtBltxWEdrhiKauaGSD/ANl7HE=;
 b=pErVgoeAmb6Iwq5EeILZ/ZnYZESHHvIMOTYJboNwcupJIT6mV5TyjCJQm3LMKu1V2B
 HtBscHoOqkPm/t9C9wkHR4H97ee1e+XL5v5+pinWFDQKs70xbUr63/uXq/f/w6h8cGbN
 WxAlcuqNKbxRLZTjTPKSO1lRFkdRGvYJgI7hJ24ulVufWrbXVHrnJAhqSbduAFJXzF//
 4iTgPIVlEySAfbMZnAWei7GZQWBcWn1sDqkes4r3n/kbff+S9dzJcv+pGk/BUzPhSTMu
 HspeOeiJgUWcEdS2ry5m1EZ+c22DG7RWl5cTktnDQkq33umkGysZ9JEDTdB8JF71AU5M
 kJfA==
X-Gm-Message-State: AOAM531+rSCRJLBw9RfnqqrTo5+MMUrsnSTcqiL5qaO7fgWGi8IOPSgs
 ihwLKBBQf6PdRch2jrb91ce5FSVKyHLuwSQ9kL+cYylCNDw6mfOmm+0PBOVVYz3pEKgJsJP1Q5B
 QKCmKqi/VDsz0
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr908276wmi.9.1623701400292;
 Mon, 14 Jun 2021 13:10:00 -0700 (PDT)
X-Received: by 2002:a7b:c20b:: with SMTP id x11mr908261wmi.9.1623701400118;
 Mon, 14 Jun 2021 13:10:00 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l10sm16558905wrs.11.2021.06.14.13.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 13:09:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] sysemu: Make TPM structures inaccessible if CONFIG_TPM
 is not defined
Date: Mon, 14 Jun 2021 22:09:39 +0200
Message-Id: <20210614200940.2056770-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614200940.2056770-1-philmd@redhat.com>
References: <20210614200940.2056770-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wxjblhjZiWUF

From: Stefan Berger <stefanb@linux.ibm.com>

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210614191335.1968807-5-stefanb@linux.ibm.com>
[PMD: Remove tpm_init() / tpm_cleanup() stubs]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/sysemu/tpm.h         |  9 +++++++++
 include/sysemu/tpm_backend.h |  6 +++++-
 stubs/tpm.c                  | 10 ----------
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/include/sysemu/tpm.h b/include/sysemu/tpm.h
index 1a85564e479..68b2206463c 100644
--- a/include/sysemu/tpm.h
+++ b/include/sysemu/tpm.h
@@ -15,6 +15,8 @@
 #include "qapi/qapi-types-tpm.h"
 #include "qom/object.h"
 
+#ifdef CONFIG_TPM
+
 int tpm_config_parse(QemuOptsList *opts_list, const char *optarg);
 int tpm_init(void);
 void tpm_cleanup(void);
@@ -73,4 +75,11 @@ static inline TPMVersion tpm_get_version(TPMIf *ti)
     return TPM_IF_GET_CLASS(ti)->get_version(ti);
 }
 
+#else /* CONFIG_TPM */
+
+#define tpm_init()  (0)
+#define tpm_cleanup()
+
+#endif /* CONFIG_TPM */
+
 #endif /* QEMU_TPM_H */
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index 6f078f5f482..8fd3269c117 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -18,6 +18,8 @@
 #include "sysemu/tpm.h"
 #include "qapi/error.h"
 
+#ifdef CONFIG_TPM
+
 #define TYPE_TPM_BACKEND "tpm-backend"
 OBJECT_DECLARE_TYPE(TPMBackend, TPMBackendClass,
                     TPM_BACKEND)
@@ -209,4 +211,6 @@ TPMInfo *tpm_backend_query_tpm(TPMBackend *s);
 
 TPMBackend *qemu_find_tpm_be(const char *id);
 
-#endif
+#endif /* CONFIG_TPM */
+
+#endif /* TPM_BACKEND_H */
diff --git a/stubs/tpm.c b/stubs/tpm.c
index 22014595a06..e79bd2a6c2d 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -7,18 +7,8 @@
 
 #include "qemu/osdep.h"
 #include "qapi/qapi-commands-tpm.h"
-#include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 
-int tpm_init(void)
-{
-    return 0;
-}
-
-void tpm_cleanup(void)
-{
-}
-
 TPMInfoList *qmp_query_tpm(Error **errp)
 {
     return NULL;
-- 
2.31.1

