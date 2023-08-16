Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp413732ejs;
        Wed, 16 Aug 2023 07:54:12 -0700 (PDT)
X-Received: by 2002:a54:4791:0:b0:3a7:1cca:f99f with SMTP id o17-20020a544791000000b003a71ccaf99fmr2234310oic.34.1692197651951;
        Wed, 16 Aug 2023 07:54:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197651; cv=none;
        d=google.com; s=arc-20160816;
        b=GTdvLLUho9TGx5lAhnCiu71jbOww8v38y/+FVZF6balhhNqrKEGEAVdrwWFeeca+rh
         hrcjXhmgESdoZWeesYfcjzj5TE1dF79HfpTZA2uBc0R/gP1uHayd3FgPnfi2hwJkEtDe
         INLr8Fkbmfai5khqbdVgrPbFM/dgw364WMjXrLedW98FOa1BldrqJF4AbLByJtUOokox
         4prDCX+va4Pfy3bH4TgrHC8AK7sdxLv6M2FC72bLj6C/3BvQSHWaxwW4DiWJYMWnfovw
         PFM2IG3/D3RZQArfQBFoMklRfkl2jFllyb4KtNa3rzVsDSq4JhKozZRPg3u3WTBLml8O
         iu9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=06lruvuER2JmmjzWPkvhn7tl3HrqMHtHO/EfWEPYAug=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=ge0Z1nhUjAJS1Cwv+HYqzcZOq9SS/IvG/0VFTVMghnBSvWSpHNEKFnCai1ICUFbMvK
         oVRkiYfBP3uSsX7vyHlWyPhga7b1R+ndBFbCvOS/oPcWfBbpc4dW7Mnm/KSsVrQKF293
         yUT9pcF4raXMbuQzVKuat7iHzIFWImbuy030GRVCvId9rTZOrRqaCLBvpDnItXa/QpEM
         KlrwgQth4iBRXe+VkItSDPfQCVvv0X/Qn7ZlgL41FEGQxE9pmBBINnotmX7lhyiJ5+jf
         G7HCPnyRmfIJ0ylLo7EppJ557OdXLOSAh8oPaorPI7y6GG4LfyXqQapCr9CicYpoEuW/
         HyKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Rx1Bfyqj;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p11-20020a63950b000000b00565132c7d03sor8676977pgd.10.2023.08.16.07.54.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:54:11 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=Rx1Bfyqj;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197651; x=1692802451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06lruvuER2JmmjzWPkvhn7tl3HrqMHtHO/EfWEPYAug=;
        b=Rx1Bfyqj41542uex+VPI4aGu0lvRXaDqdWplXr2QPoOr85I2DcJhaNpSiwxIYeDrXX
         zUae+GVMeLTr+pjLfabmWIbPOOU8pwCi//v2P8wGVrzy8AFGpwnu4A1I67TSwxeBMY3C
         g7tiuCMwMCrBS5xzp2F5NQUDCAgPH2MND5jID2UAjO4YxKWNWTwjZYHfcl+bAzY84Cp4
         DbHKZvbKIm4+zGfTal9r71hx49SE+BSGlSrna4veZvC1d1n+JCI/cDT/2ZqCyBXKVWmB
         ZTvqRwFzShAddVWv+lKADLAgIdVKensSPNoEGMx2ATXi4xpBqzHeN8tpvQGpX7rXJ7uR
         xurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197651; x=1692802451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06lruvuER2JmmjzWPkvhn7tl3HrqMHtHO/EfWEPYAug=;
        b=ljT38NP/bl2r9i3I9uQIco7okVxxQ09pgbQ7UbS9dhnOGa5hyLPqFIpiilrUOdEih2
         JlYMuSA+ksk5mElTSoJzj8qyK5OpBEvUSweIdmRNJF0vDrR7G9KJOqf4HYRjJbc09fsa
         W0zqYFSHNnKl2ECD6ghvwSL2mrhKDlfbV7gTm8fhQ8hJo4ZBC6GteTAbfUnHq2gCVGDf
         h8p41nWfOaXiHXPpCuNtT2wCKicH2uR+fp5lPL5/iA/TDBxWX5klxVCwv9JinwU8aQs5
         HmxF12oul5M90f1eIZXXwjOAkmOXJB2Oa4eM0yX3wXkIfmTWHXIoe5LssgRIzBEBCb8z
         EELw==
X-Gm-Message-State: AOJu0YxXYmRuDq0yBtysIdY5EHZxinwDPqOYjKgSqo1VOtGT75nBzRtf
	ZajQX0WQEp/Hx/yc7zENGaGbdQ==
X-Google-Smtp-Source: AGHT+IGNi1WnSDyEFaWSAnuE5JXmQGx9lONzm6CcNOGws+VTx0jUXZ9NMfg/hTFNrnDcImP1TBnYwA==
X-Received: by 2002:a05:6a20:7f8f:b0:134:8d7f:f4d9 with SMTP id d15-20020a056a207f8f00b001348d7ff4d9mr3395955pzj.52.1692197651399;
        Wed, 16 Aug 2023 07:54:11 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:54:11 -0700 (PDT)
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
Subject: [PATCH v4 12/25] gdbstub: Use GDBFeature for GDBRegisterState
Date: Wed, 16 Aug 2023 23:51:33 +0900
Message-ID: <20230816145155.21049-13-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ERBvgVdyqhpx

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
