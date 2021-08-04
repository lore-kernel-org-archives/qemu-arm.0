Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3529485lff;
        Wed, 4 Aug 2021 07:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrUf77RVzbZGlsIwiRrx32P4bmvL0yjTTQspp5iV/HjL0TKITGCTYmDfhaP3gs8dH+iU81
X-Received: by 2002:a17:906:6d56:: with SMTP id a22mr25349363ejt.95.1628087924391;
        Wed, 04 Aug 2021 07:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628087924; cv=none;
        d=google.com; s=arc-20160816;
        b=M/i4Tv7+KC5xUDwnH3oAIWh3MmuQEKqngUa/WaR1dXsXv9e4ojkEsLi8IRUme3AWig
         KN1tN7KyFOKcvCsM67WVZtv96vIeDfAGf9w9Ee7LDwON7mFRqn5Fne9T97kOLkXl44mk
         slsJUiA2YxvmfWZDmTa4dihhMmO4XoR8a3b2UbOylfAGhhh7GjgoaD+UP3NKO9QMwSxE
         7BM2asgNdFDvRRYIz0KeXFuD8lC79gNY7xWD7krfXSlhmYvT4kt5tp6WiQqhutD542yf
         1CVsVoCWUTbWyIz4XxdgwJ0czAEH91oDb5Pkjhz7goD7BnqDBdldrrrFKMqR8pu31Yrb
         egOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/+bxiSHimRiYpcXZxGdOcnOJfTSfsz3hlx2jOddl6Pw=;
        b=nWkaTtvEYwvwCaQ7y5Q81brf271iSnkGiXF/G5GIoXFpr8Y4DOZNHIjN36udJt4diG
         g8CHbVq7qILgQnNOqyNByvXlzQbMc3Wz1qo4CFgo+AhGzKILQBaV8XnO9v8kS4Po5JPa
         dlQ8OPoSp+GpV2pvHXjnojXGOoH6CrBgvy9xO7RtuLZzDLceFaJkQjFSJuLurgLvxKeC
         lMcYNeyVFB3AZsFVIXgUU2z9tZ02izroIsfHFUuucUtyMFItU61D19woofjFucGAvz6K
         voQ/DfgUwKDXQq/VAY9n8NCxcriJJ3t2BlGdkYUjhksXmJuMYyI9q+sY3h1xx2TKRpsf
         CTgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FfzDXORX;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i19si2420720edx.178.2021.08.04.07.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Aug 2021 07:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FfzDXORX;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628087923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/+bxiSHimRiYpcXZxGdOcnOJfTSfsz3hlx2jOddl6Pw=;
	b=FfzDXORXlBPQ5pHsM7+jiJz1hGeRLhbYOPQczjVWH71etxgT9JDJ/mMhyBrk4q5pXX8K5/
	eIEQB/Lm9xLKeErUacu+h2DLq6Q1tLQRNuztNhJKqclZPAGrxaNX/XKkc5i+oRujhTEaQG
	2STI7EzYCBjSf54ZSkdySsfQigqE9Qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-_SiDGjwhNNa5K4TLLO5HXA-1; Wed, 04 Aug 2021 10:38:42 -0400
X-MC-Unique: _SiDGjwhNNa5K4TLLO5HXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE4F9C73A2;
	Wed,  4 Aug 2021 14:38:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DA6466FFF;
	Wed,  4 Aug 2021 14:38:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3899A1800986; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 1/7] plugins: register qemu_plugin_opts using opts_init()
Date: Wed,  4 Aug 2021 16:38:20 +0200
Message-Id: <20210804143826.3402872-2-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: QsTUFPIvj6q2

Little preparation for building tcg modular.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/qemu/plugin.h | 7 -------
 linux-user/main.c     | 2 +-
 plugins/loader.c      | 9 ++++++++-
 softmmu/vl.c          | 1 -
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/qemu/plugin.h b/include/qemu/plugin.h
index 9a8438f6836c..57bdcdecdb42 100644
--- a/include/qemu/plugin.h
+++ b/include/qemu/plugin.h
@@ -37,13 +37,6 @@ struct qemu_plugin_desc;
 typedef QTAILQ_HEAD(, qemu_plugin_desc) QemuPluginList;
 
 #ifdef CONFIG_PLUGIN
-extern QemuOptsList qemu_plugin_opts;
-
-static inline void qemu_plugin_add_opts(void)
-{
-    qemu_add_opts(&qemu_plugin_opts);
-}
-
 void qemu_plugin_opt_parse(const char *optarg, QemuPluginList *head);
 int qemu_plugin_load_list(QemuPluginList *head, Error **errp);
 
diff --git a/linux-user/main.c b/linux-user/main.c
index 37ed50d98e2e..f9d2c6e2de31 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -661,7 +661,7 @@ int main(int argc, char **argv, char **envp)
     cpu_model = NULL;
 
     qemu_add_opts(&qemu_trace_opts);
-    qemu_plugin_add_opts();
+    module_call_init(MODULE_INIT_OPTS);
 
     optind = parse_args(argc, argv);
 
diff --git a/plugins/loader.c b/plugins/loader.c
index 05df40398d62..71b03721dffc 100644
--- a/plugins/loader.c
+++ b/plugins/loader.c
@@ -53,7 +53,7 @@ struct qemu_plugin_parse_arg {
     struct qemu_plugin_desc *curr;
 };
 
-QemuOptsList qemu_plugin_opts = {
+static QemuOptsList qemu_plugin_opts = {
     .name = "plugin",
     .implied_opt_name = "file",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_plugin_opts.head),
@@ -403,3 +403,10 @@ void plugin_reset_uninstall(qemu_plugin_id_t id,
         plugin_reset_destroy(data);
     }
 }
+
+static void plugin_register_config(void)
+{
+    qemu_add_opts(&qemu_plugin_opts);
+}
+opts_init(plugin_register_config);
+module_opts("plugin");
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4dee472c7942..ea87c83db347 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2725,7 +2725,6 @@ void qemu_init(int argc, char **argv, char **envp)
     qemu_add_opts(&qemu_global_opts);
     qemu_add_opts(&qemu_mon_opts);
     qemu_add_opts(&qemu_trace_opts);
-    qemu_plugin_add_opts();
     qemu_add_opts(&qemu_option_rom_opts);
     qemu_add_opts(&qemu_accel_opts);
     qemu_add_opts(&qemu_mem_opts);
-- 
2.31.1
