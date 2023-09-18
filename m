Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011301ejb;
        Mon, 18 Sep 2023 09:04:14 -0700 (PDT)
X-Received: by 2002:a17:907:360a:b0:98e:4f1:f987 with SMTP id bk10-20020a170907360a00b0098e04f1f987mr153516ejc.3.1695053053963;
        Mon, 18 Sep 2023 09:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053053; cv=none;
        d=google.com; s=arc-20160816;
        b=lYmcZmuLa25sJTUxJvC2KgLMppITQ34/YFWDcx3DvmiTzHW884n99yznQ/lVhGRlw8
         tF4zbgaMBnVhVebzbfqj1+XTVGesAY+zXeR8Epf/W1WDaLzCtbO411IXN+3EwGo235HY
         GZysiLKJi4SwIx+3Unk7k9O90FyP6yUYo1XW78r0ScC4t1A0w04SszNuroVzBJbokHLt
         p4MCNDWJ2rU5vT2b7/sZgMDc090LU5U93mMh7GLB1xBrYOYeTsbtI3mfJE3zwgweLnkk
         zY6CTNmK/MKZyRL4vQWdFcWe/2qnSn2aMx8a+DL1tVGSDgT0xfF0WT8E6uWtPX4Gkga3
         EZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wbLvVhCdjkLoKVSI3XlIe8h3b/C8JwK6Lt4fUZyBeQw=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=SPWzAwDNfmWw1bRonwAl5tgqSqx9tEW44uJUC6XrVPf83bSv6H2ONjBvVS1/96wZW5
         RHShif7j6IKX7x9D9JjNHJFJZiOSurA//4Q1tRWHkhfPkafbLsb34OP8WSob1qWLZ88b
         kwAwkWQjdF5RQC8C2nqZOmAYTKw18+Sq0p9mWbHMzQGdSMrpSCqVRSoH+zi5s30Yt+f8
         IsysVkhzFeu+PCXuA4wUDZkF+ZT+nRaJm27B8zE9oEIEDZKwMe+2YpSU+Oy33OGbl89V
         uQtzbGkU6/KQuCEAKeR+vbKearRAbBSQMvCHYrr4QZ9TNFausJPts4bn0DLehoCFTK2M
         aYmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yv+j0QJy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my31-20020a1709065a5f00b009adae270134sor4638809ejc.9.2023.09.18.09.04.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yv+j0QJy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053053; x=1695657853; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbLvVhCdjkLoKVSI3XlIe8h3b/C8JwK6Lt4fUZyBeQw=;
        b=Yv+j0QJyfG7EWZ/BgOVy8momrsTZfJFuyp7ITqKmrvgzy4byq3vLY1RC10fAqwuV/+
         oPeokcSwRUORlyU2vAaykf91MLwJOO+UDEaNpRBA1yXZwdcCP3gCDMdKAQiA4ZTCyLf2
         jPKEDq+6WMmhgEMz0/FpOBqVwtgR/jYVhUWxS+sL7eY+Th+DgFKhwd6cPFz+tqYVuZ1T
         VVEDME/F7Fa1DywlY5iLIajrvv8e+LjA2IFAWP16PxLjR/pzCTapAdovW69IkonyqK7D
         sEps9qSzwMd5GJHhlG4bOCbHJHbizlRSOJ3fub7K8MlYTW+qDpY8LGu0PZ7pyuxOTJbQ
         WIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053053; x=1695657853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbLvVhCdjkLoKVSI3XlIe8h3b/C8JwK6Lt4fUZyBeQw=;
        b=Te5PKfOs6fV95hd+rZYFYxlBvE+ScMIwVHXoTeXbPgxiYxUwMLl07QXH8NgHqcm2OX
         7VedNzjH0PT9PuRjumu1QnAwnwG60pU7+ubCUfyV7oWHcYPCROegot24Tw8fG6QwC0Rm
         D8w2DsTQ+vchogQ97O0GWJqa2xVc4B8hxdPKJvOZC5ium+QUnalKsySQqwmSdJM3O0si
         84VA7UFl8QKkP2G9GHTgpt3PRb7XCjxmpV9xmBEss7T+lDzerWofQZElDK9rEQ4vvT7S
         Ti+9oodVMrSkHHcN33mygsnrYVKlJFEG1A5B3clCQDNAuaVnXtN+liMK95HpA6ZKKzrb
         +hGw==
X-Gm-Message-State: AOJu0Yx9VYWF7F0oDPmk0eK23KLRFmRaMuUtKSSF3mkxDXpzrWy+oYB1
	UOOMZkMOXX1HjtTChIwRyH/I1J+6
X-Google-Smtp-Source: AGHT+IGUIRL/Cj2QgpL/SWnZOOte/5aXBCe8PvtqKJ8rdHwjYW7XrtiQqR5SrkqTU7jQZeCu2Klurw==
X-Received: by 2002:a17:906:311a:b0:9a9:f0e6:904e with SMTP id 26-20020a170906311a00b009a9f0e6904emr154241ejx.16.1695053053645;
        Mon, 18 Sep 2023 09:04:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id n26-20020a170906119a00b00997cce73cc7sm6586020eja.29.2023.09.18.09.04.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:13 -0700 (PDT)
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
Subject: [PATCH 14/22] target/sparc: Init CPU environment *after* accelerator vCPU is realized
Date: Mon, 18 Sep 2023 18:02:47 +0200
Message-ID: <20230918160257.30127-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Zb0Y6BwhoIjv

These fields from the environment don't affect how accelerators
create their vCPU thread. We can safely reorder them *after* the
cpu_exec_realizefn() call. Doing so allows further generic API
simplification (in the next commit).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 2fdc95eda9..88157fcd33 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -756,6 +756,12 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     SPARCCPU *cpu = SPARC_CPU(dev);
     CPUSPARCState *env = &cpu->env;
 
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
 #if defined(CONFIG_USER_ONLY)
     if ((env->def.features & CPU_FEATURE_FLOAT)) {
         env->def.features |= CPU_FEATURE_FLOAT128;
@@ -776,12 +782,6 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
     env->version |= env->def.nwindows - 1;
 #endif
 
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
     scc->parent_realize(dev, errp);
 }
 
-- 
2.41.0
