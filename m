Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1431091ejo;
        Tue, 12 Dec 2023 22:42:06 -0800 (PST)
X-Received: by 2002:a81:6e0b:0:b0:5d7:1941:acd with SMTP id j11-20020a816e0b000000b005d719410acdmr4910049ywc.104.1702449726170;
        Tue, 12 Dec 2023 22:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702449726; cv=none;
        d=google.com; s=arc-20160816;
        b=DQFY8iqSs6pZCRb/L69iNqOYAKhPIAKVLTLieehZhscRGKs+CWM6r563GGLXAKP5BT
         JDct/c8qJ7PuW/FMXPYs8J7/sJMUzqBVxaRgvB3u1vqFEN9gAWbs0FY7ozwp/m5KXM4D
         ZaOr2R1h3tCSJqZuSbz0cAgWu49tYtErGLfFAOxwIKprRoRfIp86uHf/af4WA0TQKdXF
         +BDH4WbWUMqQbARWHLjipHPeFVjnjGvITFtaxeaDkuxxDLhCRk04jVPwzl+NiLlPnRjJ
         6XPGaZguI9baI2Y+HXT2aDtxOveZy6cNh+9mRF/5n4UtpsUYeG1oNGf7Hv046isGGTQr
         w+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=OAupFqc1JBzPkUxJAR+qiP/3aZYcWF4MicDMF8EiQdU=;
        fh=HE3HFS1hEYtTzJ0gsfroCOJ69k1mn8lcAqBvf3V8Iho=;
        b=EM8TdwQCqmGmUyjsOJmpTuVWzRWdEiXx124pOGCFb1AmYmVGU7OoYiT6JWHsI+9D9M
         jGAUoB6/Imak6DzTlhTPx+yo8kZL+FhQwGo5iQcYKqobIRt22qh1IYgzGpYN+xRIr2Gn
         4D2YgJqdr4QLCaK2cZ/zmWGh4M1lTpydCRi8+kxAXfcOENR1G66k/vH1YyqWCZbvoMlr
         p59r9BSHb6o9jl6o2pwXwgYOnz7LSme6QIECqM9xNrpBBKzwmjsS3/1fSDqAKdPZgG+X
         5532lbHLYitlFQCiFwM6sfA+F8b7lyA9V+LPZ6ST9uWFhDAbl+QepeD1wkvAoAVMwxES
         u52A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=yTuxR147;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w65-20020a817b44000000b005d361fdb1c7sor4462728ywc.17.2023.12.12.22.42.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 22:42:06 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=yTuxR147;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1702449726; x=1703054526; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAupFqc1JBzPkUxJAR+qiP/3aZYcWF4MicDMF8EiQdU=;
        b=yTuxR147kDOL3QdpdMphLiXWfl5giz48p7/bgPXVD/QM44b3Ik34d2xTwRab+wILA0
         wPHe95oPVF3/esDo8YjMnEnUcXwhKty31B1WbV+xZRZp1z49ZSRkDxJMLu2MzP9khazd
         E/y0OPuVRGTyUJqkerojEAtdw/8icMGDYhKzMgpAdFcZ2/sRPPYwdk1aBo2Dau7LdLpJ
         Vz0x8IH9VLSJQzKYJ6FaQ1dyHUQS/rKTJ5q9lLUHn0/hKcDqVg1jRrjhdAXkcGvPFNZ1
         BYaLx8SD7jUG0A9IOZrKkygRzMeh3xk9oW6UsxQDzNzZ8VkcWi3beX9yD5W/HwGyI3jq
         +lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702449726; x=1703054526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAupFqc1JBzPkUxJAR+qiP/3aZYcWF4MicDMF8EiQdU=;
        b=ETI3OWA3qt7fLhU++CdsSRQ+kn9DXyo/6/UTcSo7zl6gemjRF0te5ozJrVeOjqsvMJ
         OeWhLmY0tP0tsvb4c8CZhy0+wNanL08dTRIXc/DAJp9qw+Qv2BVY8X06NR1KP0ZnTFOj
         LPUNeatbeZuPzGjUWLPefpjhySvRdxcIEGHXP3waOcDyIcpJBIw1TfxkghIGeMwmnmQt
         pK23CIqU0ulSTbA1HtSADDMvjpwKUY5bjvl1iusjpzIQ++lgNQ6iCNHuKs5lp/OG8jdM
         2gY1N8cwfMHeslWRBbbjDzqc6tbXlJhUeoxXPusIZ5HT1GMhshOnqHI1kePGm7TCiWgD
         MVVA==
X-Gm-Message-State: AOJu0YzpTQ9M0hH/rFydjfpD6yT/f5wTP1V5ME4sGIuX1n4SXvL1KOch
	SJOeqIcYFLL4Bsr35TunT5Y/sw==
X-Google-Smtp-Source: AGHT+IESOLNQJniqWJf1VGq3fudMOlCr1Vuv7DttmgTkagjY5mkXu8fPIIWNTeun9E/fBkSKtKAowg==
X-Received: by 2002:a81:8487:0:b0:5e2:6005:4d4 with SMTP id u129-20020a818487000000b005e2600504d4mr1251523ywf.8.1702449725699;
        Tue, 12 Dec 2023 22:42:05 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from localhost ([157.82.205.15])
        by smtp.gmail.com with UTF8SMTPSA id k9-20020a170902c40900b001bc676df6a9sm9716213plk.132.2023.12.12.22.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 22:42:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 13 Dec 2023 15:41:04 +0900
Subject: [PATCH v17 05/14] gdbstub: Use GDBFeature for GDBRegisterState
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231213-gdb-v17-5-777047380591@daynix.com>
References: <20231213-gdb-v17-0-777047380591@daynix.com>
In-Reply-To: <20231213-gdb-v17-0-777047380591@daynix.com>
To: Peter Maydell <peter.maydell@linaro.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>, 
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>, 
 Mahmoud Mandour <ma.mandourr@gmail.com>, 
 Mikhail Tyutin <m.tyutin@yadro.com>, 
 Aleksandr Anenkov <a.anenkov@yadro.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, 
 20231213-riscv-v7-0-a760156a337f@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.12.4
X-TUID: ihrUBJy4zZC1

Simplify GDBRegisterState by replacing num_regs and xml members with
one member that points to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/gdbstub.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 068180c83c76..a80729436b66 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -47,10 +47,9 @@
 
 typedef struct GDBRegisterState {
     int base_reg;
-    int num_regs;
     gdb_get_reg_cb get_reg;
     gdb_set_reg_cb set_reg;
-    const char *xml;
+    const GDBFeature *feature;
 } GDBRegisterState;
 
 GDBState gdbserver_state;
@@ -391,7 +390,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
                     g_ptr_array_add(
                         xml,
                         g_markup_printf_escaped("<xi:include href=\"%s\"/>",
-                                                r->xml));
+                                                r->feature->xmlname));
                 }
             }
             g_ptr_array_add(xml, g_strdup("</target>"));
@@ -513,7 +512,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     if (cpu->gdb_regs) {
         for (guint i = 0; i < cpu->gdb_regs->len; i++) {
             r = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
                 return r->get_reg(env, buf, reg - r->base_reg);
             }
         }
@@ -534,7 +533,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     if (cpu->gdb_regs) {
         for (guint i = 0; i < cpu->gdb_regs->len; i++) {
             r =  &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+            if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
                 return r->set_reg(env, mem_buf, reg - r->base_reg);
             }
         }
@@ -553,7 +552,7 @@ void gdb_register_coprocessor(CPUState *cpu,
         for (i = 0; i < cpu->gdb_regs->len; i++) {
             /* Check for duplicates.  */
             s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
-            if (strcmp(s->xml, feature->xmlname) == 0) {
+            if (s->feature == feature) {
                 return;
             }
         }
@@ -565,10 +564,9 @@ void gdb_register_coprocessor(CPUState *cpu,
     g_array_set_size(cpu->gdb_regs, i + 1);
     s = &g_array_index(cpu->gdb_regs, GDBRegisterState, i);
     s->base_reg = cpu->gdb_num_regs;
-    s->num_regs = feature->num_regs;
     s->get_reg = get_reg;
     s->set_reg = set_reg;
-    s->xml = feature->xml;
+    s->feature = feature;
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += feature->num_regs;

-- 
2.43.0
