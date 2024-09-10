Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1444496njb;
        Tue, 10 Sep 2024 15:16:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcUxzdPd0xZPEmUcLMX2W721BfpAJu+wQaEElMX7W5/nKVvb1E3w27YPA5uFzeKS/Wftcar3OuhV5ZwA==@linaro.org
X-Received: by 2002:a05:6300:4043:b0:1cc:de9b:1ca with SMTP id adf61e73a8af0-1cf5e11fcd8mr3319975637.30.1726006603605;
        Tue, 10 Sep 2024 15:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726006603; cv=none;
        d=google.com; s=arc-20160816;
        b=fwSRHD7QHxwgbueE5QJF/8ccDq7fXpdMwaStJ1+zxFQLtbwqq2DoL5k1G9ksY9UgAB
         7npaUdgLMtlSS5EUwF/ZZ2rAUHKHSiquKSy88QcI+VGsnEjcAVtqXmTqqjICt4YgD8kc
         ELe/U7fD4zqMl8tmllNJf22diMMHwTX8PUT5HJ0LKMZ1galONlxaFZUpc9FJCObg1CgX
         j3T8cERMu91LfU41NjVjNpd7AOJk3mXBjKzBh08KoKTZH+kYOtcboL2ZgrUm5yXk1Svk
         z7gLvWQxQqI4XliQxI6rbSx9uXdRJZP2vZQ/nqGD3B0SWwp3M/t3RD4ptd4DUlweOoUv
         /Dcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iYkzieYJP14CnD0ztJrOrrQh8wNVhd37zVufqRq95Wk=;
        fh=Z9VNVlEEqgNxD+okXbzthnDxDgTS5yjU01vxvnGoRV4=;
        b=KTo1nfpCGpJ5l2K5EzpQIt+aLblOxh5ExmP+1ApJuRZ2SMgomnPBDLgm2dTpq8Hqq2
         Lx1T8uamk1AQUQJIkD+THNZMo7E8oueZfl8ZKOGJNoZt3s/buqhK+pTv+q/nQI6s3mq+
         zJeebDW2RXtw7EFOSHOMaxuctuUTQgQXuywAt2ObNfdZmChaclQoV3mAk+0yDJYKXsQM
         KKZmnXNF+XMztn8M6/XbnQ+tz+TUouM7KnpJfgYjPS0zm3lgisK3r2CfV3okfaKcdS8t
         QycnmP8MFY1EqDHtWHuS48DADy9o/ECNpKtfH+8ieb/tHD3ZJKgU3AMmw4YSS5iQz4a2
         KkeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jsRxKo8l;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-718e57da3c2sor4608689b3a.0.2024.09.10.15.16.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 15:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jsRxKo8l;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726006603; x=1726611403; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYkzieYJP14CnD0ztJrOrrQh8wNVhd37zVufqRq95Wk=;
        b=jsRxKo8lJk2w+AQ+PBgMqU5f7IMEpYno4g3TOS3b1G//lQbjJf4lH9SqoeBuByPdDf
         NV4tgyTS8airoNAIi5umt4SmZYRuNeOY4EAA7mfpFqBLJ0jK3gltxIi0cBiBL8h/bxBv
         btYSnaC19xAQCAGT7QoleV34ojVQ/NCBNnZWM44jNqzxtSjYTHpUEyJQal0BNjuEyUye
         67Bz72KGwO7vx6Wzw2ep+XO6WU08fh7zy+amKqrA4ttqcI4mGkQqNX7J1DYg60A4rBzi
         MKbdeB5r5y5X1yqI+fmcZEh0crQLJyByPSP2XEjm5zYx1CLqUUU1mhnY6Se17AVgehkP
         URhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726006603; x=1726611403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYkzieYJP14CnD0ztJrOrrQh8wNVhd37zVufqRq95Wk=;
        b=k70dkqylpy2zTJ+iIIVjkYeobhO8RV+N3xIauOqnxagMwAcqzOvwzzd3sEum6mKy4S
         5heGYnjWtryH/aU0+ZYsJvlA9hsgZbnpT1EjCUgz/6huSEhnFmmMgp9HmAlolGPOn0BV
         6lxfeq659tT8HoZKkug3FhW7OGk9QApGXaLmFKCxMB8K3UsYPxZ/dt4o4CIlpo6X3+7w
         vIkvM2JII+r3sg98gIcUbHc5EWsnLBaNDzR1GphkRFQyr4WIsj1YH8DDpm+Y7/rg/HgC
         2lcG7VvSPRgo/kDNi7O7dbPyquQRq1xUAFwcOshKANP20jg/8nMDtuyBExqlgB62YWjW
         SQPg==
X-Forwarded-Encrypted: i=1; AJvYcCXegpQgDSQ4K7jDXLAA3x2mwIyR96X2YKYaNH0rtl6wTQ3pBpbeXYzXgUDmxdLwNaLJjnq1Xfk+vYo1pA==@linaro.org
X-Gm-Message-State: AOJu0YxWD6eHwIXxGtJlpiPLtsldNrpMJKIJNlglNBTuMwJHUA0HOQHq
	MAXZGH1wLSawcjOfBrCwbpQggee4nB/JB5kciIYqPmVNT+CyS5q0NxzB10KVwbthmQ==
X-Google-Smtp-Source: AGHT+IHKXs1YiNP1OusG1gOCeK6/p++op+cHmYKzQLej9YXDjOXxCcnGSzx+XKVm5NrT1vtmlbfLhg==
X-Received: by 2002:a05:6a20:d525:b0:1cf:58e3:2d1 with SMTP id adf61e73a8af0-1cf5e197fecmr2959596637.47.1726006603120;
        Tue, 10 Sep 2024 15:16:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.vn.shawcable.net ([2604:3d08:9384:1d00::9633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71909003d0esm1884055b3a.93.2024.09.10.15.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 15:16:42 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Corey Minyard <minyard@acm.org>,
	Eric Farman <farman@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	WANG Xuerui <git@xen0n.name>,
	Hyman Huang <yong.huang@smartx.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Ani Sinha <anisinha@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jesper Devantier <foss@defmacro.it>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	qemu-s390x@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Laurent Vivier <lvivier@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	"Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Helge Deller <deller@gmx.de>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Xu <peterx@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Klaus Jensen <its@irrelevant.dk>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Jason Wang <jasowang@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 14/39] include/hw/s390x: replace assert(false) with g_assert_not_reached()
Date: Tue, 10 Sep 2024 15:15:41 -0700
Message-Id: <20240910221606.1817478-15-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
References: <20240910221606.1817478-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 9WxNOoeVUQYV

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/hw/s390x/cpu-topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
index c064f427e94..dcb25956a64 100644
--- a/include/hw/s390x/cpu-topology.h
+++ b/include/hw/s390x/cpu-topology.h
@@ -57,7 +57,7 @@ static inline void s390_topology_setup_cpu(MachineState *ms,
 static inline void s390_topology_reset(void)
 {
     /* Unreachable, CPU topology not implemented for TCG */
-    assert(false);
+    g_assert_not_reached();
 }
 #endif
 
-- 
2.39.2
