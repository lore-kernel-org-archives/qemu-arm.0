Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011387ejb;
        Mon, 18 Sep 2023 09:04:19 -0700 (PDT)
X-Received: by 2002:a17:906:cc14:b0:9ad:fc28:f8e2 with SMTP id ml20-20020a170906cc1400b009adfc28f8e2mr4096423ejb.45.1695053059120;
        Mon, 18 Sep 2023 09:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053059; cv=none;
        d=google.com; s=arc-20160816;
        b=vkFhUAvcvvFsE/JJeQafxkOQFEOUCivhYUj8QTD4MVP/KLdiQovbNGGVZwSDLbXgKG
         ySP9h5jvusPEzey6W0KDQJJQYly2vtJInIsyveH7+3zi5zZla6AUVAyISYM0g28ZUjMl
         VOyCX9DJT3UL5tfB2J3JePkt6QHLdALcP32TWguYFEIsWHhniSkwmq7/tm1dQx2cWnGI
         RuR9RVyRgzEYVyzCjRArPwEYTqlHGoUlqMuqhFn4IhmRdo2AgYMup45yBp5ptvQp22a2
         JpCfcdQDtDAcWvDosQTj/Q+tZWxcuA3P0Ovq3xrxAqL3TBdPQS6tiBiOUaJ2sXRWdeaq
         X6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NjaIM1Qc6nHbnxZLIT5jjyB717NwyoCy1EteOD4KAlE=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=xNsKUatc0GrBFdo0TJZzLWIyqLvfmtunPtwL6R/UujApWolsMSAPmUBYVaWNW8F+q6
         tbLS9KGoY78DwpRlFoDfw0MZjxIleXkdn6YovOJHctPtKs6d4AxplhZL9amrXO3fOSg4
         JJDp0JngQt2Ps89OimQtM0Ese/UqqPXaLsqTaJYW0B7RUNypf+42ikcnsdOEGPZBZOjL
         UusAcXucXOp2mVS4cTiwB7oV+er3W909yo8iM8ob6LxCN403MscBXttWc/8mx6kOunSm
         pXMsPy9cyHWEHNJRlI0hHBwaxEZSMvY97TOSD+/iQ60AHHgedgs4G8ar9ejEkyjrAAUt
         cb7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aW0H2grj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id og4-20020a1709071dc400b009a1d1a041b1sor2835133ejc.11.2023.09.18.09.04.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aW0H2grj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053058; x=1695657858; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjaIM1Qc6nHbnxZLIT5jjyB717NwyoCy1EteOD4KAlE=;
        b=aW0H2grjLnxA+NmEHCEh++Cg5QzTKUiU24McqbJlkwRBLapGyMrqmv8lG7DLdgsQYj
         dVOQyW8g46twGqzJiq5gk7zUetAR7i4tt0PvFL43v0FwLeVZ95rx4MaiAlKcMmN1oxqa
         6Na/xcaYNWeMW9Mz+L6dMzTJP2fQN3XyQjoqhjbTRja7ngGq6l3IiA3b2mWtdmibOknX
         7W60PgdJXUa1ylptMhGARwNbDEeRP66v00NetE9VQp0hgtdZDLH+SL00glLxYTKkYlqL
         /TLQCNetruwdkAw/xX3HMIGcxPEweow7i8k06kNhDNS9PAPAILP1vLs48ZRnxM2Ajv7J
         rUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053058; x=1695657858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjaIM1Qc6nHbnxZLIT5jjyB717NwyoCy1EteOD4KAlE=;
        b=tSQFTuEiNg/4UHTqCVe2JHJaQcDkF9udTqGupf5HfijILil/rxUCTz7y/iQUpWRKnq
         zB18eE6WhrcnjYfsZrklytHx2g2DdehGEVB/6z0hwIkoYahkACGcWAPTuDccuwOgUd9S
         XRrRnDdyXGsb2LKrLEST9Y5APChbYelQNQdvxoF4+8dP0f0QC2K4z8huAsXowlGGrp03
         NlEMG74v7AJp0KB4dCi2DpBG6JTs8Hkqkd6FvsN7Zs5joWlN8eXKkewmFIVerbbjgD+m
         bx7zf4XSextkE0zEGP12JI6xlQN6QfCP9BreR0yGbpsZwZIus0bH2xEpUl4QIDsZpQtO
         V5Ww==
X-Gm-Message-State: AOJu0YynORY/Eo38gkwYV2AK3+u2l8+aHtOAUxfCO+EJcbPgjTXBJcoS
	N42ibhVroCrHUZb1cvowCOSpVdIy
X-Google-Smtp-Source: AGHT+IH1BGqTiq3uZIcjIgDgFSn4hEE/bGsbSKhsdURXDBkyUNQTShuSyFgzOD2PM8QK12Z2NIlVUQ==
X-Received: by 2002:a17:907:75f1:b0:9a1:da9a:f1c2 with SMTP id jz17-20020a17090775f100b009a1da9af1c2mr7861010ejc.11.1695053058645;
        Mon, 18 Sep 2023 09:04:18 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id f13-20020a170906390d00b00982a92a849asm6628019eje.91.2023.09.18.09.04.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:18 -0700 (PDT)
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
Subject: [PATCH 15/22] exec/cpu: Introduce CPUClass::verify_accel_features()
Date: Mon, 18 Sep 2023 18:02:48 +0200
Message-ID: <20230918160257.30127-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: iRnaThZFHrMc

Some CPUs need to check the requested features are compatible
with the requested accelerator. This has to be done *before*
the accelerator realizes a vCPU.
Introduce the verify_accel_features() handler and call it
just before accel_cpu_realizefn().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h | 4 ++++
 cpu.c                 | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c90cf3a162..1e940f6bb5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -103,6 +103,9 @@ struct SysemuCPUOps;
  * @class_by_name: Callback to map -cpu command line model name to an
  * instantiatable CPU type.
  * @parse_features: Callback to parse command line arguments.
+ * @verify_accel_features: Callback to verify if all requested CPU are
+ *        compatible with the requested accelerator. Called before the
+ *        accelerator realize a vCPU.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
  * @memory_rw_debug: Callback for GDB memory access.
@@ -183,6 +186,7 @@ struct CPUClass {
      * class data that depends on the accelerator, see accel/accel-common.c.
      */
     void (*init_accel_cpu)(struct AccelCPUClass *accel_cpu, CPUClass *cc);
+    bool (*verify_accel_features)(CPUState *cs, Error **errp);
 
     /*
      * Keep non-pointer data at the end to minimize holes.
diff --git a/cpu.c b/cpu.c
index 0769b0b153..84b03c09ac 100644
--- a/cpu.c
+++ b/cpu.c
@@ -136,6 +136,11 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     /* cache the cpu class for the hotpath */
     cpu->cc = CPU_GET_CLASS(cpu);
 
+    if (cpu->cc->verify_accel_features
+        && !cpu->cc->verify_accel_features(cpu, errp)) {
+        return false;
+    }
+
     if (!accel_cpu_realizefn(cpu, errp)) {
         return;
     }
-- 
2.41.0
