Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3011714ejb;
        Mon, 18 Sep 2023 09:04:40 -0700 (PDT)
X-Received: by 2002:a2e:a369:0:b0:2c0:b2:256c with SMTP id i9-20020a2ea369000000b002c000b2256cmr3372437ljn.45.1695053080562;
        Mon, 18 Sep 2023 09:04:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695053080; cv=none;
        d=google.com; s=arc-20160816;
        b=K8/bJT/bgmXdyJv6evCT1kvYBzDqJmls2vxqpLzaxRTmQEPdPFi38zmwuB6hT07r9J
         UAhXA9cThQS9DVepllIrXf4iKvs49dYajN2466LQ/E3Q22C88+bMOzUi+mTiqV17SqbD
         MRRvWdgvjoQKeTEr4jTBf9n7EoiKHy2emR8tK8n46Ni0OULvoGd8E+kCh4C5iIyx8tKa
         ojBIFXpLV5NkrcXOPo+3yEnHc9qo1BHqxUxgpflaVMBSzPyfTwbb0SeztbxW0BKZrFyH
         9hTCX0hrYRLYK3ibctnAATNLmD9TpNazCKNuZ1bszfm2uDz6zDb9D8FL5rdhPBHq0ztw
         6c0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ikcGGGCIJyFk0iGLkDvtO0LMxTWmhw6kUdLFh+619DA=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=gZSCGBKouTCXnqWVGJtIE42Bgef0ndGNE/8kmGqv4V3HgLg6C5aHhraGryeB5aM7Fw
         nlM9KBdjELLjQUWGO/Dj9YXRglK51VmGilQxG2xm0jnZkKTesT/s7t+iCEAsSfJdq1ZY
         YNvjwR4vy+sLHntfFUVhyoNilFKkFgpNc2IPOa9NXQ6Hsb3erKsrwN1JA920AI8W6TBi
         7kBsTRdI61ohsgXGEtYz/Kx99zeF3B7/keL85YaTizQo24KwbqFf5bXEG5FM8ipmunHN
         felNPJh0MIHYLcBvcPddvwU3yAqtG3K7E2R0taDO7CE6ZNMqTKcx5+vWtLpqhBpvYSE8
         Q9Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRrL+d5h;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t11-20020a2e8e6b000000b002bcb47d0bbbsor804053ljk.0.2023.09.18.09.04.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:04:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nRrL+d5h;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695053080; x=1695657880; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikcGGGCIJyFk0iGLkDvtO0LMxTWmhw6kUdLFh+619DA=;
        b=nRrL+d5hs9jr5raz3GQ08mkyLdAOwzusWKUjiDGkT6SKQLM9ibWetOwQpyCcml3/BJ
         5A2RqZ/PDWGvi2gKN3T1Kf94ZpniS5TnmCa1v1dds93WJUA+bMsXcmuDp67r4D19hEj8
         vYlQNVf2JkoAShvu2WGB7oZx9FrVlDDINyd0d5TTK0MYHlgk5iw3lF2iieEDWJz8lyFm
         ATtIigYrJSIuTLx3seX6bbSYcMGF8ewh4m/dC4hqWguCMc9XN1OtKjMruBPPX9X+WChD
         Un5hmbyo0YvYE8CuMuPB8bY6a7rIgvx4CXowftymJmzW0xrZdnnAtVZZhJlq6pn3XUIR
         OR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053080; x=1695657880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikcGGGCIJyFk0iGLkDvtO0LMxTWmhw6kUdLFh+619DA=;
        b=IajTZvmW9e43OMA6yWmH5tovaixl76gTUFDmQILwVAzaVMwJ+32BK1cpXf9pIoxki4
         D42H9eaetQg7ML7BKqJ3J7flmavgRiEtHEjznCXZD01ls+LgjrwDqjHGVdhlYnZzGUG8
         JLF+bNujDqvRQuB/0AiQdPXPoKd89fG946Bpgj/EAUFPUg+3536ntJQQSrh5Jx2/ltG0
         KmPn3e9ok/V2L6WAb4JoPoqHraDmDDKPZrx6zgXXHETLfLbMne2IlP84IYgK523UqfNU
         l807xxmsjx9hwC9TxMEYDDptv9o8il564qp20lTi4vlNOMQxBTFzFVPJ26RbigiYqQEL
         RM2Q==
X-Gm-Message-State: AOJu0Yx2DGrYDYJTJZshtqH/fvjAwZZ1JY4lf7ft7kI+MOqcMuO+az79
	pVMXQI1NN+OBVRda9kLVCbvcpDLW
X-Google-Smtp-Source: AGHT+IHPFOPTiS8G0DN7xrPnBYP1slspvTMlXj8JaMLUiuGi38+IN9Um/ZAXVcnl3VSwqkREENA1iw==
X-Received: by 2002:a2e:9d42:0:b0:2b9:e53f:e1fd with SMTP id y2-20020a2e9d42000000b002b9e53fe1fdmr7980710ljj.34.1695053080249;
        Mon, 18 Sep 2023 09:04:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id v24-20020a1709060b5800b0098951bb4dc3sm6599465ejg.184.2023.09.18.09.04.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:04:39 -0700 (PDT)
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
Subject: [PATCH 19/22] target/s390x: Have s390_realize_cpu_model() return a boolean
Date: Mon, 18 Sep 2023 18:02:52 +0200
Message-ID: <20230918160257.30127-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: z+LL2Jj9/Y0B

Following the example documented since commit e3fe3988d7 ("error:
Document Error API usage rules"), have s390_realize_cpu_model()
return a boolean indicating whether an error is set or not.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/s390x-internal.h |  2 +-
 target/s390x/cpu.c            |  3 +--
 target/s390x/cpu_models.c     | 12 +++++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 781ac08458..67f21f53a9 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -260,7 +260,7 @@ static inline void s390_cpu_unhalt(S390CPU *cpu)
 
 /* cpu_models.c */
 void s390_cpu_model_class_register_props(ObjectClass *oc);
-void s390_realize_cpu_model(CPUState *cs, Error **errp);
+bool s390_realize_cpu_model(CPUState *cs, Error **errp);
 S390CPUModel *get_max_cpu_model(Error **errp);
 void apply_cpu_model(const S390CPUModel *model, Error **errp);
 ObjectClass *s390_cpu_class_by_name(const char *name);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 7257d4bc19..1a44a6d2b2 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -232,8 +232,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *err = NULL;
 
     /* the model has to be realized before qemu_init_vcpu() due to kvm */
-    s390_realize_cpu_model(cs, &err);
-    if (err) {
+    if (!s390_realize_cpu_model(cs, &err)) {
         goto out;
     }
 
diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
index f030be0d55..0605073dc3 100644
--- a/target/s390x/cpu_models.c
+++ b/target/s390x/cpu_models.c
@@ -567,7 +567,7 @@ S390CPUModel *get_max_cpu_model(Error **errp)
     return &max_model;
 }
 
-void s390_realize_cpu_model(CPUState *cs, Error **errp)
+bool s390_realize_cpu_model(CPUState *cs, Error **errp)
 {
     Error *err = NULL;
     S390CPUClass *xcc = S390_CPU_GET_CLASS(cs);
@@ -576,19 +576,19 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
 
     if (xcc->kvm_required && !kvm_enabled()) {
         error_setg(errp, "CPU definition requires KVM");
-        return;
+        return false;
     }
 
     if (!cpu->model) {
         /* no host model support -> perform compatibility stuff */
         apply_cpu_model(NULL, errp);
-        return;
+        return false;
     }
 
     max_model = get_max_cpu_model(errp);
     if (!max_model) {
         error_prepend(errp, "CPU models are not available: ");
-        return;
+        return false;
     }
 
     /* copy over properties that can vary */
@@ -601,7 +601,7 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
     check_compatibility(max_model, cpu->model, &err);
     if (err) {
         error_propagate(errp, err);
-        return;
+        return false;
     }
 
     apply_cpu_model(cpu->model, errp);
@@ -617,6 +617,8 @@ void s390_realize_cpu_model(CPUState *cs, Error **errp)
         return;
     }
 #endif
+
+    return true;
 }
 
 static void get_feature(Object *obj, Visitor *v, const char *name,
-- 
2.41.0
