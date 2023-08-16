Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp364882ejs;
        Wed, 16 Aug 2023 06:42:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:14d3:b0:686:bbfa:68e3 with SMTP id w19-20020a056a0014d300b00686bbfa68e3mr2657246pfu.15.1692193322251;
        Wed, 16 Aug 2023 06:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193322; cv=none;
        d=google.com; s=arc-20160816;
        b=bEgMppxwENoQgxcewfG5KEQu7ghKdWvY6BvMaMfFXnfiJl0Jh6yIPyWh/bwC3Oilvu
         ptS6J6YEKm0PSahBNvTfv+6PARXXA4XKX7hCEm29uVEZUchfyE4MKmTsDCVfbM+FPpn3
         5HUGkgYd0wzwHUUPDsrTU4yEZYLmUyEag8CYU6BfR+DohDZvmpOuv7LsgfAs7e4cShlx
         HvNiF2ySQ9tU4WKjUQpePHahrCdgKAux5ET4VVtKWIwY5St0SH33pBE1GFuIdzSmFdG6
         LJt3D93+x9N5X4ICJun0+H/XMFxKufKNPFGl7p5IbOfra7ny5x8qAJmexleA4q7A44wR
         4Rag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=06lruvuER2JmmjzWPkvhn7tl3HrqMHtHO/EfWEPYAug=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=YeBaPIWp7KqM3LEH74a0GXh97mQ88QCi52kSH1+mEr9Jym9ij34/T60DAy8Hw93pSF
         v+oeUSyQX5K0xkqFziXe7Urh9hl1By8rlIgQAaIWG/l2B7MViVIaOYKFuoCgGoXBzAjH
         6yyItAQbf8ABprydriJkZSR4Ablz9RsFd5vRiUomqE5wq5Cwv6wGm+AjmlmQCcVr0SSX
         TPqAZHb66oNDHwDVGcdTp7OgXBk6fbnmFnnFBjLQhSabsjqm816UzWN4vFoqjGMmCrFn
         ZhJ4uBnJLj/SlfQxW7EIoasX71SBo4vS8dRS5U0rocJRZJtUcZcxW5Sj9845q3S6TteX
         0w5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=KHgEaARY;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v6-20020aa799c6000000b00686be6e227bsor11824987pfi.4.2023.08.16.06.42.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:42:02 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=KHgEaARY;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193322; x=1692798122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06lruvuER2JmmjzWPkvhn7tl3HrqMHtHO/EfWEPYAug=;
        b=KHgEaARYbzVy5//3CQO+8mLbySWKl5KXD+/DxQlrlW3n1VVyT/EX5Jk+/dYZVxlx/Z
         mFKdLnoV2S8qJ+wZ6OQsTgSf6ZhIPNq5WNdT6KTMPPYtl1Y5IWF6ajl5fKq62/O32/KC
         6xTCakQxdKWmHrYyqOvF460ZMAXqpxj72A5OzoCbAce5e76z3yzMiDp7OHh0WEU+Ljo3
         4SZV3Xw/ogdAE7MVsxQQ8Q7j8C3UHy94NWymKV6/CuYLkDtQidttqd0AlK516b5HecAT
         wahBy8I+XtGqybbRBEGhNBh8AR7EbP0MLy86veISNKqUoCPAv2iecGgP/tV/YFD4+6Vf
         dxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193322; x=1692798122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06lruvuER2JmmjzWPkvhn7tl3HrqMHtHO/EfWEPYAug=;
        b=lnbIB/iOZVM4RO89tCMdkYLY3yIZQqbFbmYBHYDhiT4jbaCFu/OITjeFJ6rF8AN1O7
         cprYnjJ9U8LRJtp73l5IDfJ4lS2GbylyTclpN9oCKp7eqnhs4BlSsGKTNkUOUVxkC9kG
         s3z6l+hky52DGzc+IZIXgDwbMyoPwSIPmzZFSRxMcI8Qml7fEshs88fxwN0QBESf1xdo
         +ys7fmzLt5XZjEQrRZDCMbdBomlajCC0pgJl2Klw51145VlXxyX6n/1ELNgR2LcP22NS
         ge5e1nxMkrCDGxRjXsJutOUX1kt5CFupjGnH9oQ67LE0yU0Tgb5zCMjVXMQRrJaY1uO9
         3DUA==
X-Gm-Message-State: AOJu0YwkKMYH9zRdXC7KgJ/yeunkGF/bdV54YAsi/iwzicWDdyaIug6c
	ehRNZOEHA6DWfAU8mi6mi5m22g==
X-Google-Smtp-Source: AGHT+IGNro2yIoJ0WZ8sctDWlgSib5Lb+HgRigNfIkyW3NPrJXQ8shmsCYWNtyqJjfol+h5imo2xtw==
X-Received: by 2002:a05:6a20:2587:b0:134:1011:8582 with SMTP id k7-20020a056a20258700b0013410118582mr2718835pzd.47.1692193321696;
        Wed, 16 Aug 2023 06:42:01 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:42:01 -0700 (PDT)
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
Subject: [PATCH v3 12/25] gdbstub: Use GDBFeature for GDBRegisterState
Date: Wed, 16 Aug 2023 22:39:22 +0900
Message-ID: <20230816133938.18310-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: e1qr2E5qxwSS

Simplify GDBRegisterState by replacing num_regs and xml members with
one member that points to GDBFeature.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/gdbstub.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 7fa4b8b51f..7a4775633e 100644
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
+                pstrcat(buf, buf_sz, r->feature->xmlname);
                 pstrcat(buf, buf_sz, "\"/>");
             }
             pstrcat(buf, buf_sz, "</target>");
@@ -497,7 +496,7 @@ static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->get_reg(env, buf, reg - r->base_reg);
         }
     }
@@ -515,7 +514,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
     }
 
     for (r = cpu->gdb_regs; r; r = r->next) {
-        if (r->base_reg <= reg && reg < r->base_reg + r->num_regs) {
+        if (r->base_reg <= reg && reg < r->base_reg + r->feature->num_regs) {
             return r->set_reg(env, mem_buf, reg - r->base_reg);
         }
     }
@@ -538,17 +537,16 @@ void gdb_register_coprocessor(CPUState *cpu,
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
