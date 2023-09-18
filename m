Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010698ejb;
        Mon, 18 Sep 2023 09:03:31 -0700 (PDT)
X-Received: by 2002:a2e:900e:0:b0:2bc:f60c:445f with SMTP id h14-20020a2e900e000000b002bcf60c445fmr7797999ljg.36.1695053011279;
        Mon, 18 Sep 2023 09:03:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053011; cv=none;
        d=google.com; s=arc-20160816;
        b=Ue2eds59fbTPQHxVboyQtbYSEHMZdpsaWwT01s6ADNMqCh9B+bY/S/GmCe9NdoDsMu
         wxY0yxN8hC/AOZwrSImMu4ao8TUSUWWf5JmZxwiSJYBBqOYV4QQZrFnZs5N27tKRPC4U
         mhdifgC3P+mUvaqUwEalbRFK5ZbzRJ7pOmfOpwKwGKOCzCi44K0waWB0AlYwum8vNbhz
         mEEbLxaVtaUx/xZ6RqDXvPAhBwkdhPrABZL1JkX3iOjSVxjMCd7z3mgAEPoQi1GA+eBo
         Uv4OVFn+rUajLFpcHelAZrhXZpQxDcONP3/x6+4DTHxzZYvVfc0WPoEzNBdmLijRdSYT
         fzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PkWYWSxfkqk4N63ErKsmSMdZBfBTpiMgD55n/Z94pZY=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=LD3fERi8Ex90laizw+oW6rNKUu+bRMYAOuR7CdotWVhJvK+cI8/fF/wSa51mhM4nrt
         uhPHzTln4SU/by3YwJLLGAAanhSAZ1bKHAKQ5iT8YMGnWovR3zq8SxUdCrXvkp+Mtspt
         jhJJWDpvVUOaiNsWRwp/qmty5HdEqoS+kPraCvEU+TSPRpoU9HDU9K9lnOvXkIs/LlJ5
         vddT9800yooAwPUjUf0oH9aFBfmDSOYPEeb6atwO9Ca8jEPWImpFrmQObTQD+v0vFEwo
         qdgOOnm+tzrFm4g/NjVmB2xB2rVh6OE89mbNWgMa7FXUwdEXyI3McTpNzWHsEPe9km/g
         xt2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OpG1gM1d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b1-20020a2eb901000000b002be5ce72ae1sor702472ljb.10.2023.09.18.09.03.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OpG1gM1d;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053011; x=1695657811; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkWYWSxfkqk4N63ErKsmSMdZBfBTpiMgD55n/Z94pZY=;
        b=OpG1gM1dNvUC536V/mvZfri1aiY5aJYuTzDQqWpo5C7iDc3wBGrUKANzkEFtK7op1f
         Fr8G+7KcRB/ayP24ubIATXpwn+JFXhXT7MQO7WP4Bhnbw9o1BopVkj5mSfltQNqQjVqk
         pf+1GXLO4b5Oq8RjKGH8v0k1qUzTYpe+DP14fhHb48cYN/usar0U98r8dBqyamn6wU5q
         8PDs3NZcx0uMUpyK2ErhY36ZxwvDA0UxBe7zBhHJcz0EZtmSyC+eBosNUuBaN1DH+MXT
         Qsa4TMflmnVj3m2YjZcqLabLObe2QoSPTHaSOqrCAfZpx3wroAJjDF7N1wcSttSX31Ji
         0cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053011; x=1695657811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkWYWSxfkqk4N63ErKsmSMdZBfBTpiMgD55n/Z94pZY=;
        b=SiIzHTb1IfYAIuKHfvsR08+ZMnOPc+im/dIGdeZkD/XDDh1zk+Rj3X3iTEFU0OM0Fs
         pftm6m8MCwyxDs/diRbC8Q8xSGb8jYHkOcqu7uxrd6xPvz04l7D4o3pyeZLRENiqHi6z
         WY3AP4Wty5GXJx0RpSODCkrSatnYInFD78/KWNiTXFQRSFVVt+qtaYqP2d1hPSIevCOK
         hIMvRXqR4ncj71YLwpA87tnlYG6NlN2xQ/bLHm1W3oorPWnslJDsp/CXZpPpsy/XIu6b
         +K3ZefDtM2GT0L8c9TxNGadmTX6kJZ+MVC2eUZboBcM6SL6tybxlcFFnQ1+LMXq6wevK
         m9ug==
X-Gm-Message-State: AOJu0Yz0P4lzL6z+s7/F53V1zIkvuGySVh9lydzaK3s8o07iiTl4OjBV
	jaYRTEcRKo2BQ/QSQsYhpcC77hMX
X-Google-Smtp-Source: AGHT+IG9O7CyLiK/FqL5kcaE3CE/w3qepssp8f0K4INaJRuY2qrHmvactqhGEUSaLUJRFKiBVFJyXQ==
X-Received: by 2002:a2e:330c:0:b0:2b6:d13a:8e34 with SMTP id d12-20020a2e330c000000b002b6d13a8e34mr7309381ljc.46.1695053010845;
        Mon, 18 Sep 2023 09:03:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id o15-20020a1709061d4f00b0099cf840527csm6708419ejh.153.2023.09.18.09.03.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:30 -0700 (PDT)
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
Subject: [PATCH 06/22] exec/cpu: Call cpu_remove_sync() once in cpu_common_unrealize()
Date: Mon, 18 Sep 2023 18:02:39 +0200
Message-ID: <20230918160257.30127-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bhiSu/4OFtWW

While create_vcpu_thread() creates a vCPU thread, its counterpart
is cpu_remove_sync(), which join and destroy the thread.

create_vcpu_thread() is called in qemu_init_vcpu(), itself called
in cpu_common_realizefn(). Since we don't have qemu_deinit_vcpu()
helper (we probably don't need any), simply destroy the thread in
cpu_common_unrealizefn().

Note: only the PPC and X86 targets were calling cpu_remove_sync(),
meaning all other targets were leaking the thread when the vCPU
was unrealized (mostly when vCPU are hot-unplugged).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/cpu-common.c  | 3 +++
 target/i386/cpu.c     | 1 -
 target/ppc/cpu_init.c | 2 --
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index a3b8de7054..e5841c59df 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -221,6 +221,9 @@ static void cpu_common_unrealizefn(DeviceState *dev)
 
     /* NOTE: latest generic point before the cpu is fully unrealized */
     cpu_exec_unrealizefn(cpu);
+
+    /* Destroy vCPU thread */
+    cpu_remove_sync(cpu);
 }
 
 static void cpu_common_initfn(Object *obj)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index cb41d30aab..d79797d963 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7470,7 +7470,6 @@ static void x86_cpu_unrealizefn(DeviceState *dev)
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
 
 #ifndef CONFIG_USER_ONLY
-    cpu_remove_sync(CPU(dev));
     qemu_unregister_reset(x86_cpu_machine_reset_cb, dev);
 #endif
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e2c06c1f32..24d4e8fa7e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6853,8 +6853,6 @@ static void ppc_cpu_unrealize(DeviceState *dev)
 
     pcc->parent_unrealize(dev);
 
-    cpu_remove_sync(CPU(cpu));
-
     destroy_ppc_opcodes(cpu);
 }
 
-- 
2.41.0
