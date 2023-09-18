Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010987ejb;
        Mon, 18 Sep 2023 09:03:52 -0700 (PDT)
X-Received: by 2002:a05:6512:3b13:b0:500:cb2b:8678 with SMTP id f19-20020a0565123b1300b00500cb2b8678mr10155513lfv.40.1695053031853;
        Mon, 18 Sep 2023 09:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053031; cv=none;
        d=google.com; s=arc-20160816;
        b=F5GwKXzlScuHZlerdRhKLKXqmGko3RYX/WsP62dv8sndPzZ7fNjjKujSA1P9bl7x1F
         AF0AFMGeXXLuAjJfA3Dvr/UWrEEuLB9q0otu4W9DsfAfmbJeRhgG3/fUlfbU2uBkGI+6
         lNVeQzgFfhYAHawgFyAGxhXPUaW0VZlMQWqVrnsA09grGu2sXmBt4WyZkndwT9hW8kM6
         67gc8zL5LtvFiEsQRpDadIwTb65LFPZJK9QtxSkJiEkOx2hn2GuSh2HMm+/qp+/6ljVD
         w8/ah+1NX7Z0UciGsqyw5/URog5RkTULjdOh2aYdTFYm7+6A1Cd4dzTlAfprddiXEP8u
         SonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dCQpcHiGYl2b5PMw9sHU7Xzs4il9aZ3go8echWC+OUY=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=up9FzB+X5Iwrfyf+O4uG/OR7FUAl/jNNUAAo9V9mVwyuWm/ysAFKkYIZdoHN1Gd9lq
         aIua/fM4ydnap1ag5lQcYmzVTuSl3N60H2fqhtllISX9p40yUXWe7nmVMptzO/AzzjQ1
         iPMfAhiVRYdsZG9a59oge/DTMug78b0FFTl1HTHHUIj6+7wSNT7J3HShiaXf7u09mToX
         CkO64nCtencs7aALbJzJq7ndRCk3t7I/PglhflbPBMjWpYwCnJ7D/PQBeYGwKl+zN5gS
         F5X1b7sfmz1u2x8NGIFnsUhAtKvrqK7bYlZG/qvnrqTN0unxJUq5PgVTRLS2XxQ1HIoH
         Ddqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXzirs16;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14-20020a19674e000000b00502d85c92e1sor218203lfj.12.2023.09.18.09.03.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXzirs16;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053031; x=1695657831; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCQpcHiGYl2b5PMw9sHU7Xzs4il9aZ3go8echWC+OUY=;
        b=kXzirs16Z+wjQAil9iV/mHzEwOOelWto8XFuDS70E/KGDR1PUDbrnvQVGrlX3YcFZa
         AdXNNzq2PVlRFaTnikHXbu98z7PWmbg1TQ78kejUmNdc1QKOSTxbwwhq/wVb6NNENPva
         AwQ4rjfj3iE9rQGFfpkay0TBRHNPGBE1FakCNtrzOI1q29gKSKs52KZLwbQv5TAKkjGa
         OV5UBrPzixyXmuSR4gwYmLYSRj9HyZQ9iDk0sl5JyIYeVkWQvVS1AoDdF5GGFiva4/Bd
         FrWL0F1iwgRCx1uvxHa+Qdt9yU5atNzvsVcrExhlgJjP0o8jGlGg1Gdrq0l4h7/kNWpH
         wTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053031; x=1695657831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCQpcHiGYl2b5PMw9sHU7Xzs4il9aZ3go8echWC+OUY=;
        b=pZOM1hXu7ZhJHXqJcrFaF+n0x9bWfmFW+Y769b4jOj4RIdCq9q1ko3HPgYaG7Q2Bxl
         iL7Io3/CLTrChvIyygRwKnkT5aeqs8BHGyAuxK3Kav6g68VNa1mXQVXZTkggnZBD2COh
         6p2qKy+V2anHX+0xwgAC2VG0DVWCM7D4G2O5YyHBpZwTPysS2zmmCddm2I0EAiSTl+/S
         3fmcU9Xic0C4QLoO7P02kGO6+bu31aYfMXcqgPTPBkjk+D7z7vpN6oH/HfJ+NXVVoPZd
         CMMw4TXloSlkO1HU6iYQzYj7NNJ9L7gFr+NpNbUBGLpZJu4k7nbP5YrgcVcWebyUcfQh
         660Q==
X-Gm-Message-State: AOJu0Yx5wPSn3wF0GFHEsZmUbBWE67Nq/q8jGsvpN8nJ/THj1m3Bi12N
	oEV10NLingt7+EBksst0gsnC0Bjd
X-Google-Smtp-Source: AGHT+IGy+sW3/rMWVgA+iQsVUNjPLRtt/VMoay0ZFOuWvfTpfSlLeQiHWwG9NxI8+yiSPP5hV5k4jw==
X-Received: by 2002:a05:6512:3a9:b0:4fe:5860:7abf with SMTP id v9-20020a05651203a900b004fe58607abfmr6929316lfp.13.1695053031505;
        Mon, 18 Sep 2023 09:03:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n3-20020a50cc43000000b0053132e5ea61sm913803edi.30.2023.09.18.09.03.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:51 -0700 (PDT)
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
Subject: [PATCH 10/22] target/hppa: Create timer *after* accelerator vCPU is realized
Date: Mon, 18 Sep 2023 18:02:43 +0200
Message-ID: <20230918160257.30127-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LqNBOlzJOU9k

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 49082bd2ba..b0d106b6c7 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -131,8 +131,6 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
-    acc->parent_realize(dev, errp);
-
 #ifndef CONFIG_USER_ONLY
     {
         HPPACPU *cpu = HPPA_CPU(cs);
@@ -140,6 +138,8 @@ static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
                                         hppa_cpu_alarm_timer, cpu);
     }
 #endif
+
+    acc->parent_realize(dev, errp);
 }
 
 static void hppa_cpu_initfn(Object *obj)
-- 
2.41.0
