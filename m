Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365103ejs;
        Wed, 16 Aug 2023 06:42:30 -0700 (PDT)
X-Received: by 2002:a05:6808:8f:b0:3a8:1e53:547b with SMTP id s15-20020a056808008f00b003a81e53547bmr2054153oic.21.1692193350216;
        Wed, 16 Aug 2023 06:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193350; cv=none;
        d=google.com; s=arc-20160816;
        b=Bw5pFjLgsWBueRcqNsd9VWy5sNJmRzga9H7KhkPf6cZX5cIrGod4zqTfSlRNq7YczW
         cmlWygnbe4ch8HQUXbfdXtifBWwdu5uD2kEHXsC+ipZZV6ZDIQa2nyfl7kle0uNwI86T
         DV26Eq4RJsqxQieOhHPDEmlo1dsujDrU1fhS0t/qR1CwjnxicmEEPs8GYT+btMbzfG/V
         B8cwsgJv1K1XZAp9gvVEaX1DF3Z3grwLbQJuSPgY7Brky8yvoist118ycyP0jq5zGhtm
         hzw1xISLyVG4uWzjOULBmY9xCLsL1ue/M34aytF4DdVcwIYPzY/cEqQEHIUC1FlyX24M
         TQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=t7MYN5uUdWMjYUe7JK/vZ2dWXJ2/3R/a46kZnqjbZDllcHxhWB3hK0+BKc+AdUorIh
         X57zOprPHz6hLeACY/CG/l6LFmyvRlrn9KjeY2WB/DELWrmDLp9nVhQwMDlQdAK6OiTg
         3kai71XlalntKculRwFB3P8Izy+Fi+DvgHFMqouoSQp/sqKJegxVRQHw1qdqIXucGnPb
         T27ZL36stpWtLghK2cqkpjTCmOyIE6Eebgoutr3k8WBQKbNuf8PLNCN2EyCKOAsCn3zA
         G3WGE4CINI8dh6YtbM3qv7YzwtRyjIcABMM7wNXvt6A9Va412+JljI8q/eh9ObDkp1h6
         Ue4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=0ASrDq0r;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l187-20020a633ec4000000b00565f2746423sor1188231pga.0.2023.08.16.06.42.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:42:30 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=0ASrDq0r;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193349; x=1692798149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
        b=0ASrDq0r9JysnWjn9k1w4ooZZqYKSKcLGqqvkvzezH2N09UIG4iehrElXzPXHOnkQB
         S4cig/tcVryiytc5Z3HGOrRuVAjrrS3Ab39DN/xmqlpmpofznpHyeDSEX/wFRk4VReCn
         34/mqHbQ60UpZyH629jX0X6MzqPCZ5k8LbYlt2GnSfBac1scSM2ANxO8n4gtH1F11ygC
         61qESBXy6bmx+EMUjGqg6dW9GQ53miBycB0v9EvoOLQJKDbpLJZKmZdUx5RoxGWy0e/U
         skPiQT2ldMYz7BWAes1ON64aOc+UjRXh+/SIpT4V5qD1Sf1DH5yHlsLB3dhzkWhh9/we
         rWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193349; x=1692798149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43Yk2hXc6r+OrDwdQwqhs9KvazgS/8QnDpHDJGpmDuU=;
        b=jJn/c0PpmwnyF0TnUWl+PZc4oBlIWEo+dqUrENx0oNuO5BkeBvOYT2PKfTfucFsWVr
         SVE/LL38WdRPiP/TYH4b91Gc1OBX+pLpS5XKDR2C/89ZPhQyRIXqxnOCUT8AZjS33GQz
         fC3PbWdEP4Bqv3dozs4lho+RCpxDhUTspVTDJRmM9eQNXcsAiwEmagTIMsSOH3VDwB9P
         CrHWfMsTyKeekkuVLpqP+jFuxruyforqDUJ7ZFP8LIOh1v4O+uF33BeWiznaceIghUBm
         QLtUNgd0VdDx8BZsWLrF7fc2jp7EGf84VWEisvIzvYc2rzKdVeyDGU+W5TxzUZpF9DE8
         lS3Q==
X-Gm-Message-State: AOJu0YzOhglv/Lym7XjkNt/zYrdPToiqfTc7vG+WJ0bz5EYY0bh0Q46s
	yYXoCB48oTc5GODkPXHiKb8A8w==
X-Google-Smtp-Source: AGHT+IE2yHozSLxxdi7bHea3fIA9c6K4gdSPYAbmb7Ge/3f7H0CfUdDz5XgUsWgHwnrb7J1kutikAQ==
X-Received: by 2002:a17:902:ef92:b0:1bb:c69b:6f6b with SMTP id iz18-20020a170902ef9200b001bbc69b6f6bmr1686515plb.6.1692193349728;
        Wed, 16 Aug 2023 06:42:29 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:42:29 -0700 (PDT)
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
Subject: [PATCH v3 15/25] gdbstub: Simplify XML lookup
Date: Wed, 16 Aug 2023 22:39:25 +0900
Message-ID: <20230816133938.18310-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SI1ANj5aE2fW

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
