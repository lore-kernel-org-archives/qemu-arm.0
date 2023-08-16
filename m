Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414357ejs;
        Wed, 16 Aug 2023 07:55:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:1395:b0:13e:e450:f4c6 with SMTP id hn21-20020a056a20139500b0013ee450f4c6mr2044042pzc.27.1692197718708;
        Wed, 16 Aug 2023 07:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197718; cv=none;
        d=google.com; s=arc-20160816;
        b=if/oZwfSpEIduyhQe626gLH/LZL+DX/4lZ6rtrHJ9ncsAYERpclSvITg9wUV15Nwme
         hzFdfMgQLFYcUdsI1WLu0oKrH4nmOn1RNBB4Sx5nrzZ4B0o2VG2diM2Z/QOfx84OR08m
         I0m479Sz/eWs0zcGZO/ZytwomiY9Ei4J26uZhW4fWlofHukiLZnnWF+dZaL+vbkB/MSr
         p2k9D9pg8esHQg6RzbqMj9E5CXnELQAcxhSRR+fIG+EpqMMc42bYCupeaWWqcCawcV/Y
         KbeyLVsTBbSY9fXnGZ2DJ++mmMJ+AZiKMkCpxB/SeW2QfqC26DL30Lx1R7PZSX9Ai6sq
         1Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HIuVW7uU8pKm/ZM9OO2H7cmvCoPILSMWzBsLAGD3J2U=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=GOobJOabp3PywXwm5+qR0UstiWdKd0cOSvN9Tcc1HIMnaG7MB2IgC4FnDMTnnB+iMi
         PuREBkuwuc1FEp4wsCptxK8Vfc5kfoUgpYThHky+1cQl7+AfL87MI5a7+cV+KLE0yIUk
         I7OdtTt9fb+kzd8H13BZLgQikUf2wOp0Fi8YtTH1Wp+A9J77+6qmYiiJacBQajGoBOQ+
         Vs2a/gdQXMgOGqTGXuCHeFhAtuBrdgped/1JL7nEX0QFseEHK6pgunfNq+6439hMmc63
         NA8zhZmsDYG7A1ukZ+OqDntEcgxSbeBsx0KVyBtRguz1+2yep/RnJnojJIW+XhH3ccsb
         MA3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=DHC6QvsX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k3-20020aa79723000000b006410a66b32esor8754940pfg.3.2023.08.16.07.55.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:55:18 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=DHC6QvsX;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197718; x=1692802518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HIuVW7uU8pKm/ZM9OO2H7cmvCoPILSMWzBsLAGD3J2U=;
        b=DHC6QvsXMwzP6kUAzxhTYkh3wTmVgrznFgoy0saZicOI8SHxSdbNtbIRUHQMbA8Mxy
         Qu1j8xafi/vCdvC7oei3fiPsocvvqf4zhGLWu+LT9mvExZvwNIArOerQm0oyuNPOdeTp
         X2/lQlkAiyE5+e3bNnJReG2S4uFRDtiFmiU1qDD9g2d94JVEiVIZm9VVPbtT8H1LMGUi
         943ygkK5D9LDZ9l2ONiwhthNE6WTdn7HAqXAn0wlUKqZegswl6oDHaXQGTqNV+8Dl6hK
         mvboHvrQrjIo672IDeYwu7F4Ud1YHu/535oofx1LwGzdXIrc/m8AI8BM5qkaSp/S0lVM
         kIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197718; x=1692802518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIuVW7uU8pKm/ZM9OO2H7cmvCoPILSMWzBsLAGD3J2U=;
        b=CGKB8I9yGJFbM4gGaDr/xEhMtHwZRc7s3PM2VHgWhLtrtDmOE4SklNTnfUDMMMjLAZ
         MUrSCzdkugqet1+0pUVSzPnWNthmQ0fM3wcwzm0WheSwLObA8wxr/I3t9N4BcwEV0hP0
         lZwtEfWlivGJ90n6X5l2CzzRTDMmfRGnbyXQdIcY+CXDDVkN/3EkWHOhD8QLqdt+TaRS
         HjuC8IVwlitbMfxC5YzC0o1f9BXEp9xKy9eKh+f+SpMzppFz9MMy2BLsio6vm03KQkvy
         Po55qHXyTk1ObnvAAFBNV8TceL8uElgI66cOY0K8az88vmSEAH0Dw1BE5trKE1PncjvI
         DiiA==
X-Gm-Message-State: AOJu0Yy2lb3dq8HlrdRtzUIsOG2HTkkQy1j9rB53Cy2OpA4LuNxJVJPG
	C1uHYY0MOugMfEP6nhVsff1T3Q==
X-Google-Smtp-Source: AGHT+IEtjZjqTnQ3l/wWXx0Upn/5qqZU2aHAU1nn5/EZzbAD68qY9B6sozJ2N6ojGbda2xA9HTPWag==
X-Received: by 2002:a05:6a00:1407:b0:64f:7a9c:cb15 with SMTP id l7-20020a056a00140700b0064f7a9ccb15mr2048291pfu.11.1692197718221;
        Wed, 16 Aug 2023 07:55:18 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:55:17 -0700 (PDT)
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
Subject: [PATCH v4 19/25] gdbstub: Hide gdb_has_xml
Date: Wed, 16 Aug 2023 23:51:40 +0900
Message-ID: <20230816145155.21049-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mnHrbjGxgBFc

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
