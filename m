Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp364074ejs;
        Wed, 16 Aug 2023 06:40:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:96c2:b0:137:53d1:405 with SMTP id hq2-20020a056a2096c200b0013753d10405mr2053686pzc.26.1692193247668;
        Wed, 16 Aug 2023 06:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193247; cv=none;
        d=google.com; s=arc-20160816;
        b=oFPf0wgd6NXyxnxaOZWgnqTn1EQn7gr7QUbB7Gc4ync4wVL8NqLGLzagc8jnkFavm/
         Ed9mNKRPBxH00JR8u8NJxhtgJv7YiUtYVVjISPkbHCrpkbuFQiDLMzV8s6qYSKC+Sh2F
         rQrY1f5gMnBwHpg1/5aeFbjLvMqOngCku1azRqpYqcqUig7uxRj39IR6tcosJoR6lY4w
         mDhEjKa1n0P7kST6Nrr3uEHc8nRAXXe50hCyL17E4tI+7xdoVHN5la9RQwBsgul1csbe
         mEr4+C1kS0n9VTKPgt7d7eN086r0F1pj7OK4zLA3b+F/GAAwN1jKJ7i/pZrni2Wkfk5F
         Yezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q7pUOq6IPFvx1k2W2dQWmkO3YzfVeoPk1QwhHtWlA7g=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=XcAbW3kqCXEP6MCPMknPjcTbAYGGzMCiSgkb9A/91fGHVZP+XOjvi6+rDQDZSlqGN5
         obdaGhdIErrFcuYomf2er9drVoD4VbiSaDjaCua9+LIuTpGYVojdGhIcrzCDqIsuw11S
         5Qf7LhEwy0EZltzius6v1JPtvLnhHhIgA+epYQ7Im7Hu0KffL3I2NhfgFPJTi04SQYhe
         Hk2ghUktkhjI3pJO95zgJVkbw011eljQeflrJJWNsMNmrfilbtrZYdASRceXQNDKZU2z
         OSe613ayPtRhdz6p0qGENaFHp9TGXdG1ZBvNMAtHSNtzHywfa6oTEkbjpu/SMkLkow3d
         gR3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=vwCKtoyf;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2-20020a63a702000000b00565ea31ca15sor1714897pgf.2.2023.08.16.06.40.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:40:47 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=vwCKtoyf;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193247; x=1692798047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7pUOq6IPFvx1k2W2dQWmkO3YzfVeoPk1QwhHtWlA7g=;
        b=vwCKtoyfrrk42/4HH+3+hSvBoqmzUBm5MLSxVppI2oq2egx0NnB9Vs4S7e+YN1dZZF
         2JkO4VguFG0rI04pEkZzQR/GWxBEFdNpY/tjO7CmFIWOFQY7Hw2ABL5oP9iHS1ZV0ARG
         MQkx05gDzEyY0XHiSQrpE1fgdyw9En/Vzb0/VCZX9kmy7i1AUJR46tNu3GTpXAz2/l/c
         yIG96kA5Jv2MSkm04324GUE3uFsxejmO/QlNfFJH2wmUpb9jjJjB25sbZRThglVzM06r
         TLUWu6Ypt7hDdQLDxAE6mbOqo1TRqnX0TfObSg1qXSmGwFXZdswGyUY9b7+sid03ndMO
         BXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193247; x=1692798047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7pUOq6IPFvx1k2W2dQWmkO3YzfVeoPk1QwhHtWlA7g=;
        b=dKwGJi/3riSHAjFYC6uSE1K+VOKIBwh3bP9QQ7HmyQnws3RrvWIBAEzBBPknPJRCyO
         gT5ocpVPY/5eEwutdMTtDghjYFsoy8a9yD3iVFjhBFOP6Vl2U7pXZA/aSxELTwolkHSx
         F+vrMO2JPp5oR5G63E76GcoyGC9kkvCSq+v1Y9NG/S+j42/C5n+dbES7lKg3vHBR6nR6
         MK3Nh4qvXjyAKK3o9O87x4pBG+0BHgg3rFhWKJwJUG/zSaGADGTfp/yhB32UzHaOkLVv
         UDY6gMEHpQLH+/A9G2M7PHZYGa1xYtydKZ2vYIVzs5JV6u2LtGqQMNZcPylkoEl6afS6
         hcQA==
X-Gm-Message-State: AOJu0YyfhRPoFlieK27Ffz2/1K68EXKTsPX7JwdDzKPo+9eJA9a5JxN7
	YoeEp34/13wuTWhvVMpuwv+6ag==
X-Google-Smtp-Source: AGHT+IF73ab4ODGSTuDdXiRfCqRWNV8FCLniM5IHFM4TtcBfNVUdVkYCHtTIOwZ/arFkLGT/B3a1yg==
X-Received: by 2002:a05:6a20:7f8f:b0:134:8d7f:f4d9 with SMTP id d15-20020a056a207f8f00b001348d7ff4d9mr3116593pzj.52.1692193247152;
        Wed, 16 Aug 2023 06:40:47 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:40:46 -0700 (PDT)
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
Subject: [PATCH v3 04/25] gdbstub: Introduce gdb_find_static_feature()
Date: Wed, 16 Aug 2023 22:39:14 +0900
Message-ID: <20230816133938.18310-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bxOIvyo8tcgQ

This function is useful to determine the number of registers exposed to
GDB from the XML name.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/gdbstub.h |  2 ++
 gdbstub/gdbstub.c      | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 9b484d7eef..d0dcc99ed4 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -34,6 +34,8 @@ void gdb_register_coprocessor(CPUState *cpu,
  */
 int gdbserver_start(const char *port_or_device);
 
+const GDBFeature *gdb_find_static_feature(const char *xmlname);
+
 void gdb_set_stop_cpu(CPUState *cpu);
 
 /**
diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
index 2772f07bbe..5829e82073 100644
--- a/gdbstub/gdbstub.c
+++ b/gdbstub/gdbstub.c
@@ -414,6 +414,19 @@ static const char *get_feature_xml(const char *p, const char **newp,
     return name ? gdb_static_features[i].xml : NULL;
 }
 
+const GDBFeature *gdb_find_static_feature(const char *xmlname)
+{
+    const GDBFeature *feature;
+
+    for (feature = gdb_static_features; feature->xmlname; feature++) {
+        if (!strcmp(feature->xmlname, xmlname)) {
+            return feature;
+        }
+    }
+
+    abort();
+}
+
 static int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.41.0
