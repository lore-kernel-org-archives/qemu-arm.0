Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011071ejb;
        Mon, 18 Sep 2023 09:03:58 -0700 (PDT)
X-Received: by 2002:a17:906:2011:b0:9ae:1de:f4f3 with SMTP id 17-20020a170906201100b009ae01def4f3mr3438353ejo.13.1695053037856;
        Mon, 18 Sep 2023 09:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053037; cv=none;
        d=google.com; s=arc-20160816;
        b=PvWRhvZOMepesbUWABtBeorg2SGPIAxBUJZT/OM8ob4LoqQWMQmIWdgDC59zX0IQQ7
         2ZiEfAnVr0LPTEp5svolVCu/TcU6znQzMRxW8Z7doO7OQ7G/fAWJW24B/bQB2UZWrKfx
         KG68mDN/+dgCzPrDeKP7b7JM0jKlnRGsCObuY/s64DL8E7W6pj2nt9JC5KWlArB63MVp
         neHiZnTPrGOFZ9M+Y5XvsEgP4KAMrl0lrRsF7LpbtIPISMG7tBO1p5N6F6avF2iH8JuB
         NmZPGrdE2izE94iDttrFHXzyuo9PdhtOYK+O4WA8kCiH8KV6WnkqNWqR7Qp4g74qnp0j
         Vubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I+18fO8c7Dk0qCgNhOL8JkONKbHnDNHi1cgc68a1fr4=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=nyJ3nJucoL+tLxzkjpZp8JDAbrWILn8UZ25pC1TpX7aS4DAaoDGgFvBjSwVlVVKCD2
         Xr0CfKgJY8KqhDLA1sc14CfnqBnSYCROa4WXFY0j4EabJuRxLnM+YnipIX5hIspJ+p1s
         jsyEXD470DEkEGjxJSQx3BcrRkattPRStUWrsREbH17tb7XrbWDRRYdoKb8a73VGv7R/
         /noQFApJM5aIiVHirQap5X4BO2KFfvY4YBCzFqPgR0C7bMv76jqpNYeifsSIja92NW1h
         ACkYuW/D818frgNaUBkOXPHcUts9pft7dalIRn+wEfK4n80Exgp+UYJxRET94ARWnjAJ
         L+pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VqKJGOK/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jy16-20020a170907763000b009adae266a73sor2828912ejc.19.2023.09.18.09.03.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VqKJGOK/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053037; x=1695657837; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+18fO8c7Dk0qCgNhOL8JkONKbHnDNHi1cgc68a1fr4=;
        b=VqKJGOK/CcyCmgwB9EjegEJtgv7rffAlXZ0tvAY1Kvegl7HqmJ0+/Bk4/VnvJU9rEr
         j+FAN0vwiwyC4tBRvF4XXMTkQd/kE+N4Que3s2dtNzMFZ2hBryzbW+r5DX1ANsA/8A6L
         oNuUkK9Ol6J9XvIyQ9C31AMH7kFTBwUD41dyphmSh16wRTAfGYPicJ64mZteS7N20TOp
         pTpYVe3S84+NpzF9B+e/ZYhbh+lhmVv1sy2HTo0/d513B3nCZ8hiG8vmuLuOEIoXLXWo
         vRxi37pzWwmRfQfE9NScg3HhXEE+0X1QEAbvqWyjtSEAznoPlDjVLyvC4Mk+vMUf/poy
         VRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053037; x=1695657837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+18fO8c7Dk0qCgNhOL8JkONKbHnDNHi1cgc68a1fr4=;
        b=mgng6xMiHmoYhAH1zVikW5Ubmhkdorzuwex188V74HNAKsLa8UttvaFLiCG4uIYvLO
         1YYuKdz/CLejrGqvSCN5v4XyrWZvmdauEoOwZi+yQH2pEbL/Uokj/kRxron2+3ob/JhP
         0olr1oJ6J69BwaB6sRcGStAEw9IRF+feE4hZUbD1UrAHKbb6sqvA1gNXsjHYmQVYc/BU
         INJWk8ZEtQz+PWgtafTsi6KRg8EL/CQqVaC343jNZ8RJo0J31ceSp+oEbBNLlWlnarfw
         n91xSqdkudOjvnyQ8sTkw2PLtmSE5kwoQwgBu6Yl3UNBh4Ekl4dEp55Dccvpj4LDNjpL
         NbaQ==
X-Gm-Message-State: AOJu0YyXUnmsKzpHJ0nQmR1YZLTtf63k8Oy9wiZZy+5OO83BJIWT+DwK
	oATVnD6S8L3uq+CoVEyWoa38yC/A
X-Google-Smtp-Source: AGHT+IGkFn7qy0jz8oacmoGjjfPL41FojFiYCtkDQb0dCjnyLoNnL5YigEsFHJXz/34UHFIkqAHEBQ==
X-Received: by 2002:a17:906:74db:b0:9ad:e3f0:f335 with SMTP id z27-20020a17090674db00b009ade3f0f335mr6095624ejl.70.1695053037410;
        Mon, 18 Sep 2023 09:03:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id qt11-20020a170906eceb00b009a19fa8d2e9sm6481188ejb.206.2023.09.18.09.03.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:56 -0700 (PDT)
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
Subject: [PATCH 11/22] target/nios2: Create IRQs *after* accelerator vCPU is realized
Date: Mon, 18 Sep 2023 18:02:44 +0200
Message-ID: <20230918160257.30127-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DqwWnGHgJUY4

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/nios2/cpu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 7a92fc5f2c..f500ca7ba2 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -201,14 +201,6 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-#ifndef CONFIG_USER_ONLY
-    if (cpu->eic_present) {
-        qdev_init_gpio_in_named(DEVICE(cpu), eic_set_irq, "EIC", 1);
-    } else {
-        qdev_init_gpio_in_named(DEVICE(cpu), iic_set_irq, "IRQ", 32);
-    }
-#endif
-
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -220,6 +212,14 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     /* We have reserved storage for cpuid; might as well use it. */
     cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->eic_present) {
+        qdev_init_gpio_in_named(DEVICE(cpu), eic_set_irq, "EIC", 1);
+    } else {
+        qdev_init_gpio_in_named(DEVICE(cpu), iic_set_irq, "IRQ", 32);
+    }
+#endif
+
     ncc->parent_realize(dev, errp);
     cpu_reset(cs);
 }
-- 
2.41.0
