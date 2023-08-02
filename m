Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp206557ejb;
        Wed, 2 Aug 2023 01:48:22 -0700 (PDT)
X-Received: by 2002:a05:6808:f8b:b0:3a4:f9b:b42e with SMTP id o11-20020a0568080f8b00b003a40f9bb42emr18929352oiw.26.1690966102405;
        Wed, 02 Aug 2023 01:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966102; cv=none;
        d=google.com; s=arc-20160816;
        b=crxir8guy540VVv+ajErp2MATIhgEorv1yYKmYNLYE1JjXcaYZBLMR5wO7aO9IIH9y
         0q1TmenZ/JYMMtt0qptPxQZqzjCEPZg3MCogmhl16TCCPaebW5FOfn9WwKFy3JVQhTjM
         kzYxH+WtR0bQXqoM0Q4rfiolKTL2kZLzK3xvP4JVNYzymvCtQ/uBCGAaS7DiVROhyOq3
         Nk1Emz3GUYo7ebyY0Xb6PUPwDxWvG4H14OTNvddH4vu1k1pNEcYeKyVhNqgOh9TupFYe
         h0gWnToVhzdCqyO4SOAltJ9ggjlfK4DuhgKbpOibF5UI398P9nlqma8fi/meC8eZEzvB
         /dCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ruJ8d/vSVZrm7sThl9nP3ObIEeEirGTreGnkmjoxCvs=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=aamsYIqldUbKcEtfnaFsx317d1WzaInKmT9GxfZzb4H6JrU00Vt/ua1SOQVfPp0yXp
         HrfSTP4zzQ2vonWQOu+mf15dq8fFnJmEHN5wQtJ7zBJHrRq2gjjxuL3ipT8Dh2STvh1Q
         f0HXPgAvEVWtJx+3hOSKGgwQOGlHfA3Ba1Q3ooukt6DMxzDyu0+g+Z3BZ6RLAGMeAk6d
         /qWxBC+GqjRGjeoOHPVow5BOIqT8bBgMkcVFidmAxUGGZ3eCx/eyeRmHccS9L5PhM8C4
         lKwPSOW3yRjbhQEH0N69YnfQVsJa7SSFU2XItzW+/kl90oxGk0y61t8nnOktPSEZ2Rdk
         Gc8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=myF+MsNu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w20-20020a056808019400b0039edf2dffcdsor15535560oic.13.2023.08.02.01.48.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:48:22 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=myF+MsNu;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966102; x=1691570902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ruJ8d/vSVZrm7sThl9nP3ObIEeEirGTreGnkmjoxCvs=;
        b=myF+MsNulhFlcFL/pZTfIFTUemYarjMi9vYPVfJt7laosn9DLrGWrSxinaN9ZP7u/+
         V3Dfyk+jinhb8PJual3MGLlzXi5tDj4lLmLD4YvQmNUfXk0hCyYTaCGe0i80HVmqwISZ
         mnnl4+VJWGJjICUzQWkIksXIdfFQU2xj5wgxDDSRAg2rkIv7yIX7nmYXaKqpiVzvaLn9
         iTz20kDzh+dyrUCRFsDEhGo5LLj4w9cxobKrLq6jkgz5UNUWMcRTPeAIN/1Dn63mZC7l
         ro8tWDUJK1QnLdP3I/ipI4ikx1v3evK8B5L4/S+TsKkfqCwZBhjV9DXeBQyfOkWFtR0Z
         tPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966102; x=1691570902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ruJ8d/vSVZrm7sThl9nP3ObIEeEirGTreGnkmjoxCvs=;
        b=Ulk9JrZKVqWjpVYEYkpjYAmKAFs8vEuzeHhDmXf6lqKzWK+CoOgBGMn6WyhjEq7bWD
         FomtiydVb0KzYSZqcoSfqYRJXVqepHjyY8GD8AGjAHz4eYcnWrH0/E9/o0JjVH+QxvNi
         qYwgWY8ErbdZY+nPAsQX+DJeOJRw3p55OWv23XsJjfMs/wrj2D+cHWEPaGLnePggwb2E
         tuNdwJGXQMJp6X+ldkU1SY00EmnSyw7TJ2xNLl6u3HYzMbBOt2wgIms3aXxa4d/VEEeI
         cWappcvkQQZDneCPozFpPW5m90pBcxlwww8O7ya+pef3h/YWa4HH6DrXTYy/knYZG02E
         cVzw==
X-Gm-Message-State: ABy/qLaoVf7fWZl+CRDubRcMYHVF4T3tKpTnTM1wDh3sZgVFq4e/1u7Z
	tnHYPS8wa1Y0RNzj63n//qw8Cw==
X-Google-Smtp-Source: APBJJlHVDqS0XAai+VQcv+DxOoG+LOTZT+DhNpQbZTqaU6vEQVV/Kyk6xdh5C8J+c/zX1mm2xFUP6Q==
X-Received: by 2002:a05:6808:2111:b0:3a7:aa1:f883 with SMTP id r17-20020a056808211100b003a70aa1f883mr14880724oiw.29.1690966101830;
        Wed, 02 Aug 2023 01:48:21 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:48:21 -0700 (PDT)
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
Subject: [PATCH v2 11/24] gdbstub: Use GDBFeature for GDBRegisterState
Date: Wed,  2 Aug 2023 17:45:59 +0900
Message-ID: <20230802084614.23619-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: kPEL/l6wydcc

Simplify GDBRegisterState by replacing num_regs and xml members with
one member that points to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index e84364e97c..e49bb06a6d 100644
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
     struct GDBRegisterState *next;
 } GDBRegisterState;
 
@@ -390,7 +389,7 @@ static const char *get_feature_xml(const char *p, const char **newp,
             pstrcat(buf, buf_sz, "\"/>");
             for (r = cpu->gdb_regs; r; r = r->next) {
                 pstrcat(buf, buf_sz, "<xi:include href=\"");
-                pstrcat(buf, buf_sz, r->xml);
+                pstrcat(buf, buf_sz, r->feature->xml);
                 pstrcat(buf, buf_sz, "\"/>");
             }
             pstrcat(buf, buf_sz, "</target>");
@@ -438,7 +437,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->get_reg(env, buf, reg - r->base_reg);
         }
     }
@@ -456,7 +455,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
     }
@@ -479,17 +478,16 @@ void gdb_register_coprocessor(CPUState *cpu,
     p = &cpu->gdb_regs;
     while (*p) {
         /* Check for duplicates.  */
-        if (strcmp((*p)->xml, feature->xmlname) == 0)
+        if ((*p)->feature == feature)
             return;
         p = &(*p)->next;
     }
 
     s = g_new0(GDBRegisterState, 1);
     s->base_reg = cpu->gdb_num_regs;
-    s->num_regs = feature->num_regs;
     s->get_reg = get_reg;
     s->set_reg = set_reg;
-    s->xml = feature->xml;
+    s->feature = feature;
 
     /* Add to end of list.  */
     cpu->gdb_num_regs += feature->num_regs;
-- 
2.41.0
