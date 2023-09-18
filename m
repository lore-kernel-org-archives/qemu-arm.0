Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010290ejb;
        Mon, 18 Sep 2023 09:03:05 -0700 (PDT)
X-Received: by 2002:a05:6512:3096:b0:500:94aa:739c with SMTP id z22-20020a056512309600b0050094aa739cmr9176213lfd.61.1695052984912;
        Mon, 18 Sep 2023 09:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695052984; cv=none;
        d=google.com; s=arc-20160816;
        b=AkSY7jVDa6E4XkACepHy0fIVTfY0VHgmRTryi5E4md1YsK63dGfigP+uk3sCaAkYu5
         WMAigFxui2GTOnmJRzJ5GTsINnRD+fTlMYOIx1817qwyMhUtcNtq3doM8JdmYOhj6D0L
         glO83LLFd9NA6UjyMYx4yiuKxi2ivHcvf7Jy1zryC42y/QQsYedfyBrx/gq2PTJlxZB0
         CZjPAIvFXFMxsVkU4Dusym8BS49DgGLrigbmbN/VI41xwlkyEStZB+eIAOBAe8C+dgvw
         RKyGo1r/2qihrys1xKnkRZVpZdagQD6PDM6DySA/5VVu4oWPbl6xbj6rC44O+LwK/lEh
         gRDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YY2zRc5UQ1ttBDAhQdzUYI1/2Fa0E28wpiBNWWnnf1g=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=dUIOm0MxAo/gM59e+AA6GROVB4howCA4Y5++QWhPQvn1OuMe11GyPjGtb0V/Og0zZa
         M8C2tEkD0mf5uKW2bsFy44yHqnh76o/uxCkiVgtY2FeyNoT4MkWOk2V3MfIssy8IEWw4
         f1yP5wH18T/9jTx9eNmYaiNR3dByLV+HeKwqxshypRrVN3h+M6qsbvj2QzzVPlzL6DfN
         P1I8mC7g9tLpHc/VLArZK4hzBn6lqPdto+wbdBOexsDNZqQQEnW4jqNe8DQ7d122x3bU
         ogos0mx3YXCarl+dVaGyDZBTg1ES5xSSajjndlRTiGp3VdZDrLsKlx3QmaXMsN3LYmws
         427A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KecZNRox;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j7-20020a056512344700b00503099a4b40sor1020256lfr.6.2023.09.18.09.03.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KecZNRox;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695052984; x=1695657784; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YY2zRc5UQ1ttBDAhQdzUYI1/2Fa0E28wpiBNWWnnf1g=;
        b=KecZNRoxBZy6J6UgiKc2e0VVv60zyBWoRK36yqqyvdDRCQCShGvItQQxdmX0vs9I/u
         qSRIpYNkggIKtulfN45xuYXf43h04R2xYlPhHGY9zONBzdv4+EkvFSgFgcFQ73ZaaIuT
         /M4bl5U1cG4yaI4NuEb2c+fDJTvbkzDv7Ua0ndsjhtBoIlaSRr5pbNlA8i2qBfmbflQW
         kvmS35t3gDqTFLTt7GIxI9Otq6XQ1Gsk320PleLVniizObgChJlorJjrXjv6sXPTvjq5
         EtVJH++NWccQHhdP35FVG2xeoCQu8P4ync+Mw43KlXSuc1JL0Oz+SBjU7du/lGX7uoat
         +ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052984; x=1695657784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YY2zRc5UQ1ttBDAhQdzUYI1/2Fa0E28wpiBNWWnnf1g=;
        b=Yy/7IjjT9amRJoheYxGwTQ0AIdFSUg2ofb5JU0a4kiy/gaHoG1/SWAfFclVDFDTB6E
         XdXJWW0q715UxBF++QYUcfkNAnVAHlidIifDyoa1JZP7qMMykN2PNz9DEcHTanp3z3BU
         JDGH+ReCvE+u6ffDa4HNZpzZVJn/Q7Kxy6nCv31SGG1RngpU59WkhPN6lk1vjJDajbmv
         ogHdZmkxYbZ5oh2ocbOc/eKB2pUznggsVly476ELhxIt3sU+bh3UIGM1xVZ9oGuanS5o
         O8gMyIiwi66hClFtc5YzUPS8wlmuSMx/e/leVyLaEEUogeRJlgI77D9pvhd+aXXf469Z
         6pZw==
X-Gm-Message-State: AOJu0YyRN8VFrVz2IRO49kol+f3T9HduOpILPQweomFtQ3V7YFL49xMi
	Ld15ZFNzXBkvbAj+JGi4SkTcT+zN
X-Google-Smtp-Source: AGHT+IFFWaHmceQaMQCtP1tx1U1BqdKcHKrYFUd0/PUiwjaiOXpmM2RbiU2HoQiVRUd/I863ShUWOQ==
X-Received: by 2002:a2e:3614:0:b0:2b9:f27f:e491 with SMTP id d20-20020a2e3614000000b002b9f27fe491mr9068179lja.42.1695052984526;
        Mon, 18 Sep 2023 09:03:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709065ac500b00993664a9987sm6574017ejs.103.2023.09.18.09.03.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Marek Vasut <marex@denx.de>,
	David Gibson <david@gibson.dropbear.id.au>,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Claudio Fontana <cfontana@suse.de>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-ppc@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Alessandro Di Federico <ale@rev.ng>,
	Song Gao <gaosong@loongson.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Luc Michel <luc@lmichel.fr>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Bin Meng <bin.meng@windriver.com>,
	Stafford Horne <shorne@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-riscv@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Greg Kurz <groug@kaod.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Markus Armbruster <armbru@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 01/22] target/i386: Only realize existing APIC device
Date: Mon, 18 Sep 2023 18:02:34 +0200
Message-ID: <20230918160257.30127-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DA/gfrUu5gDp

APIC state is created under a certain condition,
use the same condition to realize it.
Having a NULL APIC state is a bug: use assert().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu-sysemu.c | 9 +++------
 target/i386/cpu.c        | 8 +++++---
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 2375e48178..6a164d3769 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -272,9 +272,7 @@ void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
     APICCommonState *apic;
     APICCommonClass *apic_class = apic_get_class(errp);
 
-    if (!apic_class) {
-        return;
-    }
+    assert(apic_class);
 
     cpu->apic_state = DEVICE(object_new_with_class(OBJECT_CLASS(apic_class)));
     object_property_add_child(OBJECT(cpu), "lapic",
@@ -293,9 +291,8 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
     APICCommonState *apic;
     static bool apic_mmio_map_once;
 
-    if (cpu->apic_state == NULL) {
-        return;
-    }
+    assert(cpu->apic_state);
+
     qdev_realize(DEVICE(cpu->apic_state), NULL, errp);
 
     /* Map APIC MMIO area */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index b2a20365e1..a23d4795e0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7448,9 +7448,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #ifndef CONFIG_USER_ONLY
-    x86_cpu_apic_realize(cpu, &local_err);
-    if (local_err != NULL) {
-        goto out;
+    if (cpu->env.features[FEAT_1_EDX] & CPUID_APIC || ms->smp.cpus > 1) {
+        x86_cpu_apic_realize(cpu, &local_err);
+        if (local_err != NULL) {
+            goto out;
+        }
     }
 #endif /* !CONFIG_USER_ONLY */
     cpu_reset(cs);
-- 
2.41.0
