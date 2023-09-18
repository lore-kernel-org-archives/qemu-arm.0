Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011241ejb;
        Mon, 18 Sep 2023 09:04:08 -0700 (PDT)
X-Received: by 2002:a17:907:78d9:b0:9aa:1c70:1654 with SMTP id kv25-20020a17090778d900b009aa1c701654mr8707426ejc.54.1695053048623;
        Mon, 18 Sep 2023 09:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053048; cv=none;
        d=google.com; s=arc-20160816;
        b=Nq1OHm6qHDygTmdWbMNfy38td0eRAyh6u20rDH82V0DHHkq5YIRgiFGlFBxKCDIbrV
         qA69yfJYrRjN64SiYL+8jYDP+Hl3y8VyInE4WMh1ZXZ3uufldrmiKP+4czifHVu0R0HT
         ihb5w4cvKD2gBJ5NAGzSQxB+1vZe9Bzq8YLdwo8cK2YUbUPApv5o9NNJJBXZzgN28FVL
         WA2CVq3z9Lbrr/S+SFjhuJhaapWwIoYnhpmPhIWVXephl2ANs3cmT2CbspZ4naEpw+6x
         siRB7hYNefsoPBVlQVg9roZZFzUFoWAsx6RfHU7RThZeZGzTur8/7wAv+oE9s1obm6sq
         mtmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YpBrxdgyPGajszRQj4tnQ2gfsy466T4SLwv71ztnz3k=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=QWjsXvGsTOZ4uu6odvghgYWzgXUxtyVJR9+2LmcJPLSW3NEr5/CCp04PI0s+134swY
         /VSBxoaSjvvsUta5XFuB+UvxFpi8vrWYyAq5eiupP6G35pdjMlrYYlxskr2buWNN+LQM
         M+fIxOCe0ZTMhbLW5oXfF+mDoASTAF+CvGBp2yHRh/j5LONCtbS0ViG2crFylo7+HH2j
         H8qj8+sAwm52Ver+mOiKB6mn5kNdEaiEkL/ctZgi8iQMgkSFXGOCrc4CciICDnhTdmbK
         2Zuhx3AqOky84Vu68zbTycd1XB1yanOPNc53EN70bMWak1ERdaZoeI5K700vvNMPlkmC
         Xxmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfc+BDkF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id hz9-20020a1709072ce900b009a9e8eff070sor2879045ejc.0.2023.09.18.09.04.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mfc+BDkF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053048; x=1695657848; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpBrxdgyPGajszRQj4tnQ2gfsy466T4SLwv71ztnz3k=;
        b=mfc+BDkFd3zZrSJzuWeegxPSRQ34wMGjCetKYVoi7bVPDMwXSXVs5Dwi4+5RDZWXbo
         GC8glN6hvZugF2NQ7zNbCju+MbIyXVwkrJ8U6v38blEcEd9HvJgjDhovnkjpvR4xnons
         Djbw0OyBPEyrlX+1/zV+OTtxRacflD277+XKn7M1Tnvp411mYTX3uDrjYPqXju74uQM3
         j51A8/9nX5WHQN+tL3NpEaRfv12JxtSSAmrmzghWTvKY8N+flJxnQW7/bF6LkPz61rdV
         MKrptKY/gXddlN2VhFPtC8Kb3i9XU26W+4PQWnEA7iI/zsMYeuvs43Er55gFP+wUzv3l
         1a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053048; x=1695657848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpBrxdgyPGajszRQj4tnQ2gfsy466T4SLwv71ztnz3k=;
        b=EH4DYkAPNchEGeGp321WpE/ESQoDfd4hfs7+p3wnltD92zHEJBx3e9Eo892yjcYc5m
         p4IFFe7IYapK4UmbquceGlMlfas6gdSsJsIZSuzdgzH7dvoddQpU6h62we7v+diA3xcF
         fMdpgaI3+htM9WhqlM3AO3VhgjdT1brpV8wGbX1xCBEnEUk3Hme34/1FjFfabPCdlgtS
         sZx9YfGYSC6+OEiALerD77TgtP1IzNvytbStQNi2fmMMqTLBYX3E32Aw6pOnNS9dQ2ML
         uzLJLS1AxIJU3MLchrG82rstmgD9aYPa7SicFaARi06pW+Y3alDc9tfyuk6RQqCzZmby
         R9WA==
X-Gm-Message-State: AOJu0YyegjoAc5q+srzXsMAcupTwWgZTt6GBYU+oSG6MszUfiM9YUuTl
	275V1+8wPI0uPvx7h2oV8IyIjMvL
X-Google-Smtp-Source: AGHT+IG6EnV1NPtLa02ojf1AOOFHw9u/ZZVKTH8rmKjYxc3URy3huazjFDCLq8lcPx0zxuOm3uW8nA==
X-Received: by 2002:a17:907:2cd8:b0:9a5:c9a4:ba1a with SMTP id hg24-20020a1709072cd800b009a5c9a4ba1amr8408544ejc.59.1695053048266;
        Mon, 18 Sep 2023 09:04:08 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906088400b009928b4e3b9fsm6613541eje.114.2023.09.18.09.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:07 -0700 (PDT)
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
Subject: [PATCH 13/22] target/xtensa: Create IRQs *after* accelerator vCPU is realized
Date: Mon, 18 Sep 2023 18:02:46 +0200
Message-ID: <20230918160257.30127-14-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ys82sGRdSiHY

Architecture specific hardware doesn't have a particular dependency
on the accelerator vCPU (created with cpu_exec_realizefn), and can
be initialized *after* the vCPU is realized. Doing so allows further
generic API simplification (in few commits).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/xtensa/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 300d19d45c..bbfd2d42a8 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -162,10 +162,6 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
     XtensaCPUClass *xcc = XTENSA_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
-#ifndef CONFIG_USER_ONLY
-    xtensa_irq_init(&XTENSA_CPU(dev)->env);
-#endif
-
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
         error_propagate(errp, local_err);
@@ -174,6 +170,10 @@ static void xtensa_cpu_realizefn(DeviceState *dev, Error **errp)
 
     cs->gdb_num_regs = xcc->config->gdb_regmap.num_regs;
 
+#ifndef CONFIG_USER_ONLY
+    xtensa_irq_init(&XTENSA_CPU(dev)->env);
+#endif
+
     xcc->parent_realize(dev, errp);
 }
 
-- 
2.41.0
