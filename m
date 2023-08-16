Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp365484ejs;
        Wed, 16 Aug 2023 06:43:08 -0700 (PDT)
X-Received: by 2002:a05:6a21:621:b0:134:15df:b148 with SMTP id ll33-20020a056a21062100b0013415dfb148mr1746751pzb.29.1692193387799;
        Wed, 16 Aug 2023 06:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692193387; cv=none;
        d=google.com; s=arc-20160816;
        b=ZF+KPyFkBnsfzwyDdZaIPiEZUyhtcCnYo/OONEsNSNSNQOPH66dKyadLKXLUfcMxFw
         CVa47Uw3UsAv996+o4jtLxoGTrCoBVneAlbSG9YnD+tEdY+bEpePv+2AvZFTYlHHp79l
         AnU9BN3Cki+6CSYpZfxAEQF5ZXlEQIKmM+AUEu9X5aiLC5l8QXyiyddlwlHu5S2a/nUd
         rwH7S8Y4foBglpfN6MaUuMKh1fHsrOap8eXBqEfjLg6YQjnkapDHf42Zubq1sVVYsTvF
         0cMCWpFJ+UgblZRn7c1nwP06iLpJF17INXpgW2hnFUBA0msaaYoMrpDNJ/VisvL3nC3G
         F8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HIuVW7uU8pKm/ZM9OO2H7cmvCoPILSMWzBsLAGD3J2U=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=pxaMWY7AAvFb2LDIRkhsLv8WiniMcA8sSdoDkltESAfVXbT13Felu+V4+rK5DANSxa
         CHLh4UEOqnRvzy9EKoe8MvUKGilPCma5Rgp1nPpN1dHqknakokmDAZUjvL5Uw+dkl2dP
         Q0wAEhXTnRzSRPMX2rnkV/HvxfXRWzuhxAKcFgb/gTCkAU/+0uWq22V2+Vh4qtB4fmwl
         Gbz5cRx/24zM1tFCjnZL4Mgg6iQUCxWhnc9BO32SapT6KC+7GqG4Rp6VVpQ27Zyaf1OH
         QzFI+iiXDcGKNAsrgXx5GvUaz+NtA5rygB4Vme4FLhp/+LnbtPr/XJrxxD9YudBALnx5
         zcJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=JtIyGV+4;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u123-20020a637981000000b0054fcfda7575sor6801235pgc.3.2023.08.16.06.43.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 06:43:07 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=JtIyGV+4;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193387; x=1692798187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIuVW7uU8pKm/ZM9OO2H7cmvCoPILSMWzBsLAGD3J2U=;
        b=JtIyGV+4bVExhFhA3ZpKVrBPbjQht11hqwkd2un1A+4kw2Mq7hd1+uMmox57TOSLdm
         QrflKhubCd/vI+k8fli97dd2y+Aj2ZSPxBODJhBSTGcBlgp0U3MdsLq4zHj6sBYZ2Y4c
         mqfly2SrAAQgvgouQguDcS0J9PET3sIcua6slk9TVYCyiyeuUckcAtkdJ6I0PWtsGXqV
         7sl46N9VLxoBAur++EMQwll6rnHJSBod+FIXwp42Hln6D5QFszPjgFbMBADlVtnKIv15
         u4b4COG8U7+w82Dkkke6xa7I1zy5p7mTIUQjKSE0g4TN5hxNPVcCSgDykuwclBKa9fVs
         U2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692193387; x=1692798187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIuVW7uU8pKm/ZM9OO2H7cmvCoPILSMWzBsLAGD3J2U=;
        b=ARY9Hp+CObmPBveYMhJR2V3ZyZDUqSWi/naEP3AqXea2z0r3C6tpDsVzzD1TTXYx3C
         XQH3UBC9sbhvC3M5GT2jE5li5zwwxaldkiX21UgIrQuEmVTiPOEcwvVmLzc+JCbTWQPK
         +GseG6TXZtIK9Z8Yc4obE4NBz4skpRlZI5hNK97uxvXUvrN2vaoa8ProaTh1rEBKaC9R
         mhBwyyVlqCgs3Gm85b74PnGnJ/QtMbBXa5scgIlqBkORnVtPvXeidtM9nodGTrLfwEzy
         y190D6YT0NM6kq6wk9hLG7mgfmBVlwpk/b9anCNLhkLZw7jwHLr+0snzdS5HRrGxdPZd
         8MRw==
X-Gm-Message-State: AOJu0YyknF71PANABzP+S96JM8PGOSzWBq81/qmAXOonMYn8ul51aUcz
	oX48QVsKyHSMwQtd2gcuOzRH7g==
X-Google-Smtp-Source: AGHT+IHSIbpHy9EZmfqyKOWW/BetSq7GSqyFo1udVLMxGclFE8UqSnzkfq7NQtaLTj3IBcFSsmTUUA==
X-Received: by 2002:a05:6a20:8421:b0:133:2fb2:917d with SMTP id c33-20020a056a20842100b001332fb2917dmr2663262pzd.5.1692193387232;
        Wed, 16 Aug 2023 06:43:07 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id k3-20020a637b43000000b0056601f864aesm928355pgn.2.2023.08.16.06.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 06:43:06 -0700 (PDT)
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
Subject: [PATCH v3 19/25] gdbstub: Hide gdb_has_xml
Date: Wed, 16 Aug 2023 22:39:29 +0900
Message-ID: <20230816133938.18310-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816133938.18310-1-akihiko.odaki@daynix.com>
References: <20230816133938.18310-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: SDRlWp+2K2sr

gdb_has_xml is no longer referenced by the other components.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 gdbstub/internals.h    | 8 ++++++++
 include/exec/gdbstub.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/gdbstub/internals.h b/gdbstub/internals.h
index 4876ebd74f..6a7c512766 100644
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
index f3f2c40b1a..5cba2933d2 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -61,14 +61,6 @@ const GDBFeature *gdb_find_static_feature(const char *xmlname);
 
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
 extern const GDBFeature gdb_static_features[];
 
-- 
2.41.0
