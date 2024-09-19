Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1161237njg;
        Wed, 18 Sep 2024 21:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKBlWj0iZX7X5qRXnvxn6aGfo8wRaOhG4RS+bHe2PUrO/iZUjDc3Qgmdg+Kqo81ASHNxK6skOujq3T/g==@linaro.org
X-Received: by 2002:a05:6a00:9a0:b0:710:6f54:bc9c with SMTP id d2e1a72fcca58-7192606564cmr34858242b3a.2.1726721211424;
        Wed, 18 Sep 2024 21:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726721211; cv=none;
        d=google.com; s=arc-20160816;
        b=VdpatLa9HulZRWjQfo9Bdm+lwJNMWXT57vgojPCCT4RsDcgd3WQjh26clK+rMf8Gop
         mQSj95b0Maxk0I4stmHc67y2gitAXBaXK+ZR4GFFdXxwSITJSOjTqLinIzk3et9gGjbM
         UX09DhRa7HOOaYQPG+pH8WIpDNTK/IzdMrx/3eqe4fuEtqw9e+5xOPVPUfiCy2etl2pI
         xeL3YHsRttpE94EVFuKeQtE+ol6B7uihjpVgRx0Vu2APQ1RKee00EZNhKZSj87aVgqtf
         ghUMuunddKgC+wNiYaXO/tcdSjxv3YT22eOpha5j9yClI0q7FpXqaVc6OIl4vV0mtoTS
         HgpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OThPa8+cW/n1sVdbzQjJCeNQGruzF8/uwJ+qJfwzSeE=;
        fh=QK+80MaIGLWwEnm8m+D/zEmzSKGYCUxGtKJFvKhDieA=;
        b=y8zVZ5cqsGOkjjGM2CZtNy4Pff9N9XbBUfJ15BhB2yU3CWnDMaJSvE4hZn0iyInBwA
         R07dkKdUYbym3NG9aM85x6U1fvWBpccoHhczZCKuhY3t0wBNZ0FsBps8cyGjZrUAaHeJ
         6fQTHaIsMLFPM1icq0S490ZGOe+8+sHbwJ74GCLTjB3Chr8dnLN1xhQ7rBpAkVVOfaCy
         V68vMNwd1z56EuBdqfRbVuCDODHqRzWFGHbQ0Lgf6xj1yqDDJK7f9O0XDgxPRldS9l4s
         SVYYcFT8TuFJrqaYBmiwQRbUBq4xNo6730nPP5Ty/9rv4iPVXwjaq4K90g9xWq+6DYmJ
         9/Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKfr89Nl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944bade14sor7308140b3a.10.2024.09.18.21.46.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 21:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zKfr89Nl;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726721211; x=1727326011; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OThPa8+cW/n1sVdbzQjJCeNQGruzF8/uwJ+qJfwzSeE=;
        b=zKfr89Nlx/X64CoeoH0v/PrW37Jag+2tNb+LpcUygBIiPmR8IfKTHscvt+hqXFNB/9
         STk1QaPnO3O4OLszTDRuun42BxIv80tWNBrPEw8qnYSWrs09ok9syBflbR+IhdXNpYc1
         hruOSQDsljqQIfnZfU4igZb4I3XUi6202rqc92kZ9Vst2Xl9PdZYSxHTJI+vsS1YOs0A
         JYqJXijefU8C3QZzbT9wwDs2TwGx0F17nhgyHaqMcrzf8oFaR22oboYwPCpT8kI3obR3
         GmghvGsXPX1WDAyJc/Ucdl1NGI13q3udmKviT6lqLDGA7K45tWkqN6NjePV/+0L2Dwhh
         uoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726721211; x=1727326011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OThPa8+cW/n1sVdbzQjJCeNQGruzF8/uwJ+qJfwzSeE=;
        b=Yt2Da8JF+d/oEuroWOGaK/kHuoglZ4x1peEnRuslLlBXBLhNl39vUKqiWvPvAnTQ/V
         PUHa/UeWjhRKvppObMY3mcy9qvVimosdLYq/XfgwxnQyJfAWymlEpBzZFxr5rkVfM1si
         NXj8x4KLTS2pP30cSOGjnXmxdjIHQmTh6ZDVOFgCqYYErNEOG/uCkG9hPSpC3XloaaYC
         oMEEpgZe3im4joARw/Zay90xj+4EjtnrRboPSoxc917is/A0cw9xhFGWryor3c5Nwvti
         8vH9gUzrJ+9g9qz3lJxlOI6aM3BU6jx/xCY+/7AGkjZy45mUzits9ib26oPci7QXpW4q
         TEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrJY3ZRzv3uM+1bnL8YYeY1+FB83xI/eMJfWwrc1j5hBCDshYBfl2eeGOHQ7M14p9IabGPRBvkHzsT+Q==@linaro.org
X-Gm-Message-State: AOJu0YwfZH5GnK5pZnLVfK605HF3oFw3Ba6wJc/xO1Byw8geNOlmaoZ3
	taYW/2V/xOy24gKJm71oJhkIyqnIlmIOEjdqamkuVmPF3iTi8kfqF6adoBQ1ZYGrxA==
X-Google-Smtp-Source: AGHT+IFQfcPKl3bpJHPW6gITFiRun3OBAH2WiwA3N0tnHOExmulwzhVj1BKzCqzynDuxHz8GGaT99w==
X-Received: by 2002:a05:6a20:b40a:b0:1cf:3838:1ec5 with SMTP id adf61e73a8af0-1cf75c7ea5cmr35256921637.5.1726721210847;
        Wed, 18 Sep 2024 21:46:50 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944bc279csm7478601b3a.188.2024.09.18.21.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 21:46:50 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Hyman Huang <yong.huang@smartx.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	kvm@vger.kernel.org,
	Bin Meng <bmeng.cn@gmail.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Corey Minyard <minyard@acm.org>,
	Laurent Vivier <laurent@vivier.eu>,
	WANG Xuerui <git@xen0n.name>,
	Thomas Huth <thuth@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	Ani Sinha <anisinha@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Fam Zheng <fam@euphon.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Keith Busch <kbusch@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-riscv@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-ppc@nongnu.org,
	Zhao Liu <zhao1.liu@intel.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-block@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Weiwei Li <liwei1518@gmail.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Yanan Wang <wangyanan55@huawei.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Jesper Devantier <foss@defmacro.it>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 02/34] hw/arm: replace assert(0) with g_assert_not_reached()
Date: Wed, 18 Sep 2024 21:46:09 -0700
Message-Id: <20240919044641.386068-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
References: <20240919044641.386068-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PKfk8FgY3Ale

This patch is part of a series that moves towards a consistent use of
g_assert_not_reached() rather than an ad hoc mix of different
assertion mechanisms.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 6915eb63c75..f103921d495 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -199,7 +199,7 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         machine->cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     for (n = 0; n < smp_cpus; n++) {
-- 
2.39.5
