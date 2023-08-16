Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414000ejs;
        Wed, 16 Aug 2023 07:54:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c3:b0:688:43cf:7253 with SMTP id s3-20020a056a0008c300b0068843cf7253mr2533850pfu.31.1692197679999;
        Wed, 16 Aug 2023 07:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197679; cv=none;
        d=google.com; s=arc-20160816;
        b=OmiA90/kVU0MzXwLdOuvpRX6jL0grFGvs9Qcp6G0Hp7MIxMKfwFLNL3vEDgTDpHHyS
         h4ft+VlGv9+bMlWRNuNFfc3pTdVtKshb/mZKRlUITfB8AaQa8PBje9/TwW0h3gQPN5kD
         8q1M7+7Shx0YFC9z/OX+OYZCeSlaPFYw5oXz5NJYgzCPr3uv02gQbVnbCBNILrUv399M
         eQXBMgr8AWG5eQotXc5LfqWsoBU2J57MGmm7eKBfr9+kMDZm7OXXZ/YlXGQ7mzvs4gzX
         l0u31CCJDZ+uR7iicB6ol3ntCH6lxcJz97Z8SaLBYvZzZxY5QIaE6s/SrkRQ4vR+hy/9
         8X6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=kdtWYFcLaflDFbWiQAOBKgj3H6rAjQC6hwi7LOrHsVe+JLj+oU1RFx4noWfQUFtTpi
         87PkTE2HrpTzQ6bZ+CH4htlWa493xQCBIythMLpim5MxUgz0bQkP4PDZoJuTGQujYkr2
         7FX1dpjSj6VxugCcJOzfW+U+R2CE9UFSlxZUt9w/1aOoNpzF6mNPZW1689RswIPp2e9q
         kpGbfGet1EvlfhM/C18s/rViq/bYtdzch4LdHiyiOg81FdrpaAieJAsHFlKyi++oz1u5
         PpUP6Lu7Kw8JqZz3BLwL7dRh7071Rhpg29BTP74QeyGlxGjs8XfrSYdBHppPZ8JG2dvM
         6T3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=nH9UgICP;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i10-20020aa796ea000000b00687b0cc28efsor8554542pfq.10.2023.08.16.07.54.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:54:39 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=nH9UgICP;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197679; x=1692802479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
        b=nH9UgICPSZPMBB2TAomDXd61ub61DSLwDGgUQoSEJktzo6LJlfceql7QkgJUIP1FXN
         8G1hfxPctzwTB1/8C97mnY/qHlLviw/jO53Pl4vpIWcBavasylzrb+yoUceA9sHFLBv0
         S1X3QzSujamv4neruk/LEHKZu6xaGlc8Mu6vRV7jUCjTO8+TqNikIkDczv+0V1mI5BTs
         2lgvc6ip+yqbLo6UcYaevT8VCIzJDkE6sswVwD6dC9Q9UnUQT8famLevNKXMLK7vATcQ
         I46L2/kUGvTtTycGT4fZCwXvIfhsNDoTTOGQjY3/xd+eQtAjHmhNeEZfXNtYQl1huh/3
         2Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197679; x=1692802479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
        b=ZIuwOOuKr639u9M1dxsGynm+2ayLqO1Pri3ARBQZSFHzuciFyAKuBE1gG6fha24EFw
         DJPSf05Y1kZkRh+bg79TgHCpPoSGZtkD1zLdfYtAvQYMyx6bPNECLysxnmKH532fleks
         Mg2s5pWWpt6CHHRxZ5PwzzrYsvLaPEte+wJCzFKdCRdTyPDGz1JLgQuKS7+QLyVR6YkY
         Ld1NhHhbavRS4O6wZVhEbt2+9kyZMcp2TQdeHW7XstFN/RITlO5Iyv03i/6vGQC8yX4L
         iVYMBDc5HfXCI8YTY8Ofm2sHz8gew5H3eGvTDZnjPf8syazKNy954WVbh6pAggSzHstA
         sTGw==
X-Gm-Message-State: AOJu0YzB6LMRIEIcSKYC6lhbJLXsZG/Bo4OfLEPb6JFbwml+zbbWNseY
	i3F6AfbGNHnYvmNObLSr3pprMA==
X-Google-Smtp-Source: AGHT+IEr+MipfTzGICMdOQPRyXw9XZy0/xK4s3F9uNvZiKuAPhCcA2HHEFaTcsN4wEbaC4QLks/meg==
X-Received: by 2002:a05:6a00:22d3:b0:687:2be1:e335 with SMTP id f19-20020a056a0022d300b006872be1e335mr2448422pfj.2.1692197679494;
        Wed, 16 Aug 2023 07:54:39 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:54:39 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 15/25] gdbstub: Simplify XML lookup
Date: Wed, 16 Aug 2023 23:51:36 +0900
Message-ID: <20230816145155.21049-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: z81pjNVdbCEs

Now we know all instances of GDBFeature that is used in CPU so we can
traverse them to find XML. This removes the need for a CPU-specific
lookup function for dynamic XMLs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 452b5bf0ef..ccb4ed9d4b 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -354,8 +354,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
                                    GDBProcess *process)
 {
     size_t len;
-    int i;
-    const char *name;
+    GDBRegisterState *r;
     CPUState *cpu = gdb_get_first_cpu_in_process(process);
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
@@ -364,7 +363,6 @@ static const char *get_feature_xml(const char *p, const char **newp,
         len++;
     *newp = p + len;
 
-    name = NULL;
     if (strncmp(p, "target.xml", len) == 0) {
         /* Generate the XML description for this CPU.  */
         if (!process->target_xml) {
@@ -398,21 +396,15 @@ static const char *get_feature_xml(const char *p, const char **newp,
         }
         return process->target_xml;
     }
-    if (cc->gdb_get_dynamic_xml) {
-        char *xmlname = g_strndup(p, len);
-        const char *xml = cc->gdb_get_dynamic_xml(cpu, xmlname);
-
-        g_free(xmlname);
-        if (xml) {
-            return xml;
-        }
+    if (strncmp(p, cc->gdb_core_feature->xmlname, len) == 0) {
+        return cc->gdb_core_feature->xml;
     }
-    for (i = 0; ; i++) {
-        name = gdb_static_features[i].xmlname;
-        if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
-            break;
+    for (r = cpu->gdb_regs; r; r = r->next) {
+        if (strncmp(p, r->feature->xmlname, len) == 0) {
+            return r->feature->xml;
+        }
     }
-    return name ? gdb_static_features[i].xml : NULL;
+    return NULL;
 }
 
 void gdb_feature_builder_init(GDBFeatureBuilder *builder, GDBFeature *feature,
-- 
2.41.0
