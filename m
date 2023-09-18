Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3010375ejb;
        Mon, 18 Sep 2023 09:03:10 -0700 (PDT)
X-Received: by 2002:a2e:2a84:0:b0:2c0:a2:77d7 with SMTP id q126-20020a2e2a84000000b002c000a277d7mr3582150ljq.24.1695052990167;
        Mon, 18 Sep 2023 09:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695052990; cv=none;
        d=google.com; s=arc-20160816;
        b=BcTSXRth+NzehymeT1SQHRzIa7ihkpVUNn+St6MGrT59XqwevadhpFVB3frYayXbXr
         pg4M6yR3Br2Nf2oRjuE5RDYcxdbGPQLqjEqi0kAyA7XIatJftQDKZVWjPv3Aa8qyW8jV
         unQM3AaSUAAc0Ij9xvBawahtGVc4S5qUx6OvPo4rmZVEcpRALL8bgboMNvi3UF2WxTy0
         6/7CgNdrQTDSRrlNovVY5vDhCuvU/paZ3iZvPxpHnR8k7wEMp4Q8CnNoqvZ3laPln6c4
         /BiUl5qfhwgWxeURSPcqS58Xsr/fcoRTwYXt5N7H4654c/MnV7f6Si5fL1FJVE5IAphm
         Shmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lJh8A0itxnh0qEmv9jrQE8icd48ukduXjwQKR8H2Trw=;
        fh=AIYNAcrfQPdTp+tiOBYg2bCy2NfWRbXD73JV9SLWbpM=;
        b=WfBfYqJ7p/HQ62NnqyBVl42iID6ze9381WkAlsfGVdfBLX124/X87VCb8FX1rM3eCI
         0aBhyBojCKz5AmHQW+cAjUlOEEQMJ6fPwx7fWCrwix7PaeQXa6y+E4ip4IilJmXz+3WS
         QFHKs6x221iTFUQlaR5Rez0LuV2gIEt0KwG7Ymc80v5IYsmYhquoWPyuoncn6cZb71lB
         N+INM60sboQnwJISuXeU40fb2ystGHSAVB5fynVuK83sADr7sjCyHqzcbSCZQXqSSPOj
         9GzQpD7c0OvpMYJkZpi1dUVR/xWNprRIMNROrQxa1TMxCgF1Gq/ud8eUqmIP+zf1/+e5
         wWsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bm8wU0Vt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id my47-20020a1709065a6f00b009a1914e48bdsor2799976ejc.14.2023.09.18.09.03.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Sep 2023 09:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bm8wU0Vt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695052990; x=1695657790; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJh8A0itxnh0qEmv9jrQE8icd48ukduXjwQKR8H2Trw=;
        b=Bm8wU0VtoPazP5ALjYRvkMlwUJx61bLmg05k+sg+tctzQ+Rd5Ijtz4auQBDp0LU5af
         cTUw11gOrPZXrsOxa2f/xAF4+uBJ8Gi/gbde3oEdS62db7JCB6Ct18L3xo4LNTknvjem
         2pEwJLiBpEeK/tyKSSSEOlg4VDevaz0y4tt0vBDcgptCqV6/k72s3BM8mYpiTqdl/V28
         dFlnVYstuG5ZCIIl2y3PCpAwhR1Nc6thFD9FadbKxyuz09TqzKDf5VCjYwZ+iKlvN2KK
         AYBHD2hflv2cjDUBbwjHdOJYGzTDeT600DUTWGGK2KH4IPOXDJhtZTjSDlDFednueFM5
         nkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052990; x=1695657790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJh8A0itxnh0qEmv9jrQE8icd48ukduXjwQKR8H2Trw=;
        b=XT+ltYHGYqdeE/BcxmXLlEgETBQA54sW1zqWwQbw1NOtSOQ6UVcf8IgtSzzY9FIqhN
         lrqxfJDvSD6ZG1KCyesEVsVA6aiD1ZrNNZPt71fr6bOhVZrArE0gNW9VGgFr/sCwElil
         XBG1IkZK7Xd3cfBfdQqV99oPD4DB22Xn/tHhtm3BPaWteHUR0hQEXEBtvzqQl5EueUAB
         /F/hWcvvWWUFbiMo1VQ+W4vrLQ42HLDcrwBEXQkFTXTkroXb8nqIr5sdkfvoJXUvlrto
         Y8RZs0St2Tnfzg40pYS/xFuAj9jDXibeO7g7I4c/JL4tXioO7oDadERNzBbrz6tHABYu
         Ph2w==
X-Gm-Message-State: AOJu0Yxdg/BTPaEWrDH5vP5KlAIfS0JsvbHkhoCAsKJfEyNLkYcxHg3K
	a+y6Ly7PYTHJvNr9wA02ecrkpVHg
X-Google-Smtp-Source: AGHT+IENcyvi+doZG3AFC4PIQIYrRhEsNXfli8+UC+v7xx7kqnWdf8S7ahUZm+Cso8ML7TazVXsAxw==
X-Received: by 2002:a17:907:7754:b0:9ae:1b64:94c0 with SMTP id kx20-20020a170907775400b009ae1b6494c0mr1603066ejc.55.1695052989741;
        Mon, 18 Sep 2023 09:03:09 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id y16-20020a170906559000b0099b7276235esm6699286ejp.93.2023.09.18.09.03.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 18 Sep 2023 09:03:09 -0700 (PDT)
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
Subject: [PATCH 02/22] hw/intc/apic: Pass CPU using QOM link property
Date: Mon, 18 Sep 2023 18:02:35 +0200
Message-ID: <20230918160257.30127-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918160257.30127-1-philmd@linaro.org>
References: <20230918160257.30127-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: eAn+UgM0tLiq

QOM objects shouldn't access each other internals fields
except using the QOM API.

Declare the 'cpu' and 'base-addr' properties, set them
using object_property_set_link() and qdev_prop_set_uint32()
respectively.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/apic_common.c    |  2 ++
 target/i386/cpu-sysemu.c | 11 ++++++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 68ad30e2f5..e28f7402ab 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -394,6 +394,8 @@ static Property apic_properties_common[] = {
                     true),
     DEFINE_PROP_BOOL("legacy-instance-id", APICCommonState, legacy_instance_id,
                      false),
+    DEFINE_PROP_LINK("cpu", APICCommonState, cpu, TYPE_X86_CPU, X86CPU *),
+    DEFINE_PROP_UINT32("base-addr", APICCommonState, apicbase, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 6a164d3769..6edfb7e2af 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -269,7 +269,6 @@ APICCommonClass *apic_get_class(Error **errp)
 
 void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
 {
-    APICCommonState *apic;
     APICCommonClass *apic_class = apic_get_class(errp);
 
     assert(apic_class);
@@ -279,11 +278,13 @@ void x86_cpu_apic_create(X86CPU *cpu, Error **errp)
                               OBJECT(cpu->apic_state));
     object_unref(OBJECT(cpu->apic_state));
 
+    if (!object_property_set_link(OBJECT(cpu->apic_state), "cpu",
+                                  OBJECT(cpu), errp)) {
+        return;
+    }
     qdev_prop_set_uint32(cpu->apic_state, "id", cpu->apic_id);
-    /* TODO: convert to link<> */
-    apic = APIC_COMMON(cpu->apic_state);
-    apic->cpu = cpu;
-    apic->apicbase = APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE;
+    qdev_prop_set_uint32(cpu->apic_state, "base-addr",
+                         APIC_DEFAULT_ADDRESS | MSR_IA32_APICBASE_ENABLE);
 }
 
 void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
-- 
2.41.0
