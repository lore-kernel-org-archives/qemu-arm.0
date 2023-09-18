Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011882ejb;
        Mon, 18 Sep 2023 09:04:51 -0700 (PDT)
X-Received: by 2002:a05:6512:b93:b0:503:a76:4eeb with SMTP id b19-20020a0565120b9300b005030a764eebmr5367119lfv.16.1695053091407;
        Mon, 18 Sep 2023 09:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053091; cv=none;
        d=google.com; s=arc-20160816;
        b=rwffA1z54m8ZWOkt+jNlfRzaXgFR+9SKDA2dAd5lZ8xffZIHaKaSTlE4TjOekAzcbL
         p5QISDgtbRIE47JE3+PIz+KtlZWrf8bVx3Rcz6PFAA2OghA+cLAkqRXuBMMQ76OADbmp
         AjqJDT6fzLHJdk7HNdASwQVnyD12rQ+xp/DBTlsdT2Ze7v8TomH+AayAS+terKU0Zd+n
         ipwF6RHH8kI6Zlzx+zestJypWYYukm0+F7B+OxywFrxQ0zmX0MAMPKj5zvshMI5dbhv6
         4nGHfW62No4C1MA7r/dFJ35gmDJLO/6lG9BihHTWv9RlANfOApeXtkjyuXZygU+N9dsG
         yYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GMzTvk0FEO6I+ReA5ceoXcLeA6ER1WjzLpFKcs1vmU4=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=0lMDR9hq0oqXBZV9wpNcGu8mu74oXKRL/1QFyO8Bgay4exIdqFwOFfs9tJxS6cLH/m
         H9kvHttf09ajtYAhDJL6LjQg5Z9cDd0UxZ0l8rzfFQXWf9T/c07XzzwX97MC5NZS+P2N
         XYpgKYz+DFulTGPeNEGzox/j8Ht3/6LTHRqW3MJvVHT+wL6+AOeJv0JFJWCRjrAnEdLe
         ohl7JbpE6mDidsThm30TAM+eI0nLaUwarqa2lXeGlk9WTdo9ql6lIzhKm1K1beWoH7Iq
         X05/GISILM0vRudEfswjszoy3ZUn7dKmq+QtRVncgPYqs75sQxGS4J4l3ebBtYtzWphn
         Wv4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vk0yfjUA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o4-20020a056512052400b00502c8bc9ac4sor2995994lfc.24.2023.09.18.09.04.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vk0yfjUA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053091; x=1695657891; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMzTvk0FEO6I+ReA5ceoXcLeA6ER1WjzLpFKcs1vmU4=;
        b=vk0yfjUA9ePwMTKVC5ZrJoMgeubKo0NJzMcEMUAOkCoJnuoGOjI0pU6zKJZODh/TLO
         yqu6Q8e1lkCfeD2fHfPOQyJlXQvE9V6ZOrsxuu+ue4Iuu1fZt8k2JLioc26/XhTxycZv
         yhwbbJith86Jkr+knrA5a3St7brGYg1RGgKrkW8nQxtlq2gVYbRuM3UvW776DQxE4OV1
         mZLS0W2dmPVQl6Pm9ZzDFOSQUpiEZsdzYJi/6qg+nv3fH0Xrv3hWkdTggQ9ljMCrliOO
         /dlP/cLBfz7pLHzYXgX+iMUXrr1Ebp837Jo2JEx+AVXJsmDfX4s7FdbFPQWzK7CnACTK
         qqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053091; x=1695657891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMzTvk0FEO6I+ReA5ceoXcLeA6ER1WjzLpFKcs1vmU4=;
        b=VOCxxGgUHWBr1vmHciW4/HS+XQteFkYJE49HKFlfZOpga4Gv1dDwGhDOeegYRC00h4
         MeTENLFznSx0YhC8IzT1rvFFuW1j09jQBO5uZKzB8Hr2pe3CBCTAXMJRj5G1nxaBSJXd
         uortiyDDMRQ3b3nC/BsO63C4gPqLhYcUBIB0M+Z/k5Svv/ralP9e2mePE7KZ5Bjj4exQ
         7NYm4/az33UyW3z8I/BzsuvBghcxVi/tDJed5eI67SylpiBIsG1rfLuRmoOxVyhupB3l
         YO1533EItsIhn1JQOv8a26G+FUkjc2eltXidZ6z+3S1ml/j0WiXaPoVATdKZPR9Oxhyw
         2MJA==
X-Gm-Message-State: AOJu0YwAVcoTbqUxVCdx1N6vLKkH6nPrDO1rm1yLfItp4wv7uV8Kuglo
	ejtogdVeyi2CwLOweJ6u3/udzWcb
X-Google-Smtp-Source: AGHT+IF2lowlwslUXKPMUOsRhTSe1sID6DU3fFY6oz4zaM9BZXy8URyT0npkn+KMnJlFujwR995gHQ==
X-Received: by 2002:a05:6512:3f8:b0:503:95d:f2bd with SMTP id n24-20020a05651203f800b00503095df2bdmr4180507lfq.34.1695053091074;
        Mon, 18 Sep 2023 09:04:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id i8-20020a0564020f0800b005309eb7544fsm4528407eda.45.2023.09.18.09.04.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:50 -0700 (PDT)
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
Subject: [PATCH 21/22] exec/cpu: Have cpu_exec_realize() return a boolean
Date: Mon, 18 Sep 2023 18:02:54 +0200
Message-ID: <20230918160257.30127-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8mzpcC+9HbtN

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have cpu_exec_realizefn()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 2 +-
 cpu.c                 | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1e940f6bb5..3dc6968428 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1014,7 +1014,7 @@ G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
 /* $(top_srcdir)/cpu.c */
 void cpu_class_init_props(DeviceClass *dc);
 void cpu_exec_initfn(CPUState *cpu);
-void cpu_exec_realizefn(CPUState *cpu, Error **errp);
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp);
 void cpu_exec_unrealizefn(CPUState *cpu);
 
 /**
diff --git a/cpu.c b/cpu.c
index 84b03c09ac..96ae440b81 100644
--- a/cpu.c
+++ b/cpu.c
@@ -131,7 +131,7 @@ const VMStateDescription vmstate_cpu_common = {
 };
 #endif
 
-void cpu_exec_realizefn(CPUState *cpu, Error **errp)
+bool cpu_exec_realizefn(CPUState *cpu, Error **errp)
 {
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
@@ -142,7 +142,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     }
 
     if (!accel_cpu_realizefn(cpu, errp)) {
-        return;
+        return false;
     }
 
     /* NB: errp parameter is unused currently */
@@ -169,6 +169,8 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
         vmstate_register(NULL, cpu->cpu_index, cpu->cc->sysemu_ops->legacy_vmsd, cpu);
     }
 #endif /* CONFIG_USER_ONLY */
+
+    return true;
 }
 
 void cpu_exec_unrealizefn(CPUState *cpu)
-- 
2.41.0
