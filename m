Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026224ejb;
        Mon, 31 Jul 2023 01:47:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:4313:b0:137:a9e8:1422 with SMTP id h19-20020a056a20431300b00137a9e81422mr8469438pzk.42.1690793227791;
        Mon, 31 Jul 2023 01:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793227; cv=none;
        d=google.com; s=arc-20160816;
        b=beyW8NRw9Y9XzWybdF4hFgqmLoJZ/m5BO7e0mC7DxlQlB5hwP6otoYJKDKs9GHvIbp
         OeOjFITQqQDiFDW6OU3R5UB4li55OnW18ozVZJGT1iMb8AzopYTwMiAIQd3beJAx1AaR
         H0le+2+D7XZdk/IPt1SMRFcHY0/Pbb5CdBTp3d/xZ4If+G6R6dXd+JiMhOHyX/so9wmF
         hz96J7CcbwqOUoNMlzEQb7Lku0poPmi+SRyBIerUwrsSh52MX1NCixTsDy1HZIrbaGEB
         IbFWLx6Rpsa9ljWxoAtrmXEpOxRHxQas4jBsxIj3iUvS2J/n2gNTXI+9w0BhbczlnFdy
         5oMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gMFQkURIt+B7Z40RIh76WBFgtW+t214r6i/VW2pjKYA=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=EPx+qd9lexJXDn90dqvlwRcoW+YCv177H4VB9AqyYo3wu7J7u7rTjjl732DU4S7aNl
         kTYa1Pz63SALt+3CT+sUtgQ+qLwaMkK2efuI1Dt5+Jv3cBL1i6Tt1ZzL7s7qh4q8PZcP
         171a2lj9yxzCkzn2frv0FH4j/JDP2e/qN2dcG/IrahcsRDumjXMHjzpg/utaxJHwRfdt
         WWpwE+B0R84RUlfXOnNBvQlI6LyDQ8TzsmQD0QNc+tTYSOSegUQpHM2rkex3wLgWrJwR
         QOhZUWMOYc+sOiQRLStyp3p8X7PrTvnUwUrRrfx8Bhrv1XChK6NY8813raXv6fYdOQsq
         3VvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="vX/uDG/V";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a27-20020aa7971b000000b006828efba288sor3315754pfg.8.2023.07.31.01.47.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:47:07 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="vX/uDG/V";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793227; x=1691398027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMFQkURIt+B7Z40RIh76WBFgtW+t214r6i/VW2pjKYA=;
        b=vX/uDG/V67JjXpDvQqFGigdALwh1rnSEaO1QjrZ7QnWYxlqXVmSZ0LNzPcE5tGKE4/
         egmnWAbx6wYRGX0WCDys8rgaNNl+Uh6EVJg5f95JZj5mCnhNFbc008LR3wCWun7tc62i
         xAvy5By5M6rwEUYKcy6a1CwzY2Ett2phfKrfgfe/E+NELvHN1ru6jRsnP3JvFM6BYIFH
         rEhBcpGIOaou2icpefra6aqyafhvXCoST5PDaB6jGR/ncn4LzlonIjjFqVzNENCK/QDY
         7kOl2aPIz6nMKuCXpY6vlUspbYVQd250gdRzXUwYdcf62L2Xs+ehH/HsbMG4lvYAggkB
         71Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793227; x=1691398027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMFQkURIt+B7Z40RIh76WBFgtW+t214r6i/VW2pjKYA=;
        b=QN7nHUqoTFeJq8DCXSXsSDJ/jdb5UiWhDSIfTXYlkscGLdJ9a5IZmRtstBiXnxsaGg
         I6RCWd3qvumVb7pDpHEBpcnJ2Yr2vg29wPK+ORvXPAg+3E2V1EJ9T84KtR7+0Vj9Gm0j
         xUIXcT9LIs1qF6oFyji5uy1AlaRCaZzwt4xQBocLIZHj+pn1tQi55tcoEdL5u/ZhQRWS
         0HVZyStqZFvFs1XiXU8nBbSjKifgbto+sY9sRCSiM4tA9BimtC5vOv1AVFQFdZUKsGUq
         xd3xwyhd/pCsZCnUkkWKCrAO860fu9CiOd/NYTdTyPmtN+rFJSD7ah4X79Q95FaQtbq9
         Ds3Q==
X-Gm-Message-State: ABy/qLZrKm6IM9RZgOuQ5dknvsWcaaeHFtP5XQAOZzrXAc9zlYuE1V5l
	2U8oXlsHyQP4H1jiqPoBIZaZPQ==
X-Google-Smtp-Source: APBJJlGkUW1RnGS9ESWmYImJ9GrE7QDrALMk8lbobcLMurlu7CrDj8O8WvZLmQUWPdukfH3AvivBNA==
X-Received: by 2002:a05:6a00:174a:b0:66c:6766:7373 with SMTP id j10-20020a056a00174a00b0066c67667373mr10776209pfc.23.1690793227302;
        Mon, 31 Jul 2023 01:47:07 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:47:07 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
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
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 19/24] gdbstub: Hide gdb_has_xml
Date: Mon, 31 Jul 2023 17:43:46 +0900
Message-ID: <20230731084354.115015-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YvAdHuS/+OKS

gdb_has_xml is no longer referenced by the other components.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/internals.h    | 8 ++++++++
 include/exec/gdbstub.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index f2b46cce41..92f5ce8cbb 100644
--- a/gdbstub/internals.h
+++ b/gdbstub/internals.h
@@ -234,4 +234,12 @@ void gdb_breakpoint_remove_all(CPUState *cs);
 int gdb_target_memory_rw_debug(CPUState *cs, hwaddr addr,
                                uint8_t *buf, int len, bool is_write);
 
+/**
+ * gdb_has_xml:
+ * This is an ugly hack to cope with both new and old gdb.
+ * If gdb sends qXfer:features:read then assume we're talking to a newish
+ * gdb that understands target descriptions.
+ */
+extern bool gdb_has_xml;
+
 #endif /* GDBSTUB_INTERNALS_H */
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 6da4af9612..cbd1e6ead4 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -40,14 +40,6 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
 void gdb_set_stop_cpu(CPUState *cpu);
 
-/**
- * gdb_has_xml:
- * This is an ugly hack to cope with both new and old gdb.
- * If gdb sends qXfer:features:read then assume we're talking to a newish
- * gdb that understands target descriptions.
- */
-extern bool gdb_has_xml;
-
 /* in gdbstub-xml.c, generated by scripts/feature_to_c.py */
 extern const GDBFeature gdb_features[];
 
-- 
2.41.0
