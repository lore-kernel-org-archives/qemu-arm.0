Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2497933ejd;
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8i/I/dE35fmdTgkp3/c7T5oK6p6q02U5zbNxZtBF0uBhIpGgQMrfh+ekT+jdMX2WHiMbTaPlwe90pDc5ZU9+LG/iPgJN2
X-Received: by 2002:a05:6000:bd1:b0:33e:c316:2a51 with SMTP id dm17-20020a0560000bd100b0033ec3162a51mr1748698wrb.27.1713542389507;
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713542389; cv=none;
        d=google.com; s=arc-20160816;
        b=TP7pwnyiK5WKfewHo8OlpdT3RvAouAhsmoljiLVPJ4yKoWOcpQGgNTkVVQXGTix9Il
         tbHCUXXUpFghqvaG+S4cDuYpS5tcYW48enyuh2Hvngzr9Of3ezcVV/FgK9gjX49qx7C2
         vkGdhhhaDcKMHG1bEkig373/0ArUCEHfVwDoeHb519HKL75Cb5YoHZjZVgVug83k4wFm
         62pyhWWdu16og3o1ysuH16IIKmoGi33aF2rBC4DRuONJD/8cUyJCAlbEZviooIofGhKH
         Pmkv7VUzTQSqzfwDoSDUKWkErtpBYbjKMMLadTfGoXCOddUg1T42aiGc5A8HYYuoPgQE
         MENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eY2FcYl+CzfFOjoUH17x+b03bQquHC1I7mh3fnkgfD0=;
        fh=e4+Xv/xjaVbJh53BelPoztqZd9lv6kLBmoxAbrFel7k=;
        b=oIjhANWYJH+7VHkzYFimYpQnxxvPk4IX3uYN27ra1hE9hT+igCnmm97y2YO3YaNO4Q
         Z+2tb6sKyEA9AR5yLgSRCjvutO4Iouq4TvvxWvkWZDAcXsnWRc14rXhmNNhw5xHztLLt
         +s+lBffDOoBZ1Kvvj8eFxWQ4so4SoxK09mZklRpp4vxpECq31nEXp7Xn4st8zKhWNZJS
         kcORvKRLJRdFXvMniaDIv9ljDDg0GxiEfmlP3FpWH2EigJs9Xadehv6eEXPrdzQw1KM0
         6WbfXBAnH1EixNSTKXz3E+QTmx7PhPaWNsZvTcnSzJ4whitvLvM7EqlePJxRtbdb4dpi
         hbvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XaCMKbBA;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b4-20020adfc744000000b00343e46eb605sor1362757wrh.3.2024.04.19.08.59.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Apr 2024 08:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XaCMKbBA;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713542389; x=1714147189; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY2FcYl+CzfFOjoUH17x+b03bQquHC1I7mh3fnkgfD0=;
        b=XaCMKbBAUaOCm6ANRXW6RY/t3xB86/dZfPbc57Ycue3wgbkOobfMJzD+w/og/D8i8p
         IhGbCfecxOsDI+g/j7y/QMsvGLAuXb3nAdMTFgkZI237LcGHWmklKcV/4Db4wfs0Rcvc
         6IWFQFO0aPFRCtZdraYuuFoNiJ+7EOL9PstgnA+fzj7jzpT9L2TKjiIQ8f8OrYPobUI/
         vPnb4auhI/tciDvrSxYsRHWSfnAin9vsduhpeWpNGq4gzQsoW/cgURh4BE4jUEeTY/Tv
         5EXB/8YsQoQwD6vUZE4oM6+erJ97bdb+8mmkyGBExh4Q641t9UGAD7zkL7xpAudWwZ9v
         GJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713542389; x=1714147189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eY2FcYl+CzfFOjoUH17x+b03bQquHC1I7mh3fnkgfD0=;
        b=MYd0HicblocggaSM+MBllAFV+gNdnKyn75iES1m/mAeMLYDtDZMT35HLZ88Pjl8WwC
         RPIN9gxIOQe8lHfw4avgrGRmWEPklyth5o18hefzhuk/r4N1rxZH+qqaHSRYgLIJAGd9
         gQ2z27Tc/ltsuXbuIrgtO/lzF1f89Wcx2t/G5Tm8KxlCTFk84IBSihaYUtlOnxCFWYiO
         ytqIOK6TadC+CFJk9+VEBeXQOA29l3C53WzS2W9P8vzyIN+hPkApO5JAwrp2Hi4IrxEz
         9LBjDHG3u53E4TYP18jMTeQ08YV7b7xBS38VPmNjHI1/Lx56bs/3VBBZ81BRp+SHk8HD
         oeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhFj9cf3oJlbHHbpwKklNsEVR4odZluFvDoyMiuB904QEzFdDUsh3lcovbK7SFheUlill5hS3LhhWDFK2uHBsIgBpD7UkE
X-Gm-Message-State: AOJu0YzJ77HiCDsdbHtpVtlk1QZRtdn97lOJWre0UxtHgwsyXhGT6fGt
	wnI9976GocuIj8gNWjAlNe2HXe4f66t7sjsfJseKxoh6R9LMhhaN08Ljc0RpYuZZ4A==
X-Google-Smtp-Source: AGHT+IFdTCv/4qF5ef/m8iftnCwZTQyCvMGVBFc9yKiwQrHvinWiSlXgx1RyQkxThnBi6pkIAw+PYg==
X-Received: by 2002:adf:fa0e:0:b0:343:3a51:ad65 with SMTP id m14-20020adffa0e000000b003433a51ad65mr1537382wrr.38.1713542388970;
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id p13-20020adfe60d000000b00349b73143e7sm4793089wrm.75.2024.04.19.08.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:59:48 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: philmd@linaro.org,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v2 03/22] target/arm/kvm: Return immediately on error in kvm_arch_init()
Date: Fri, 19 Apr 2024 16:56:51 +0100
Message-ID: <20240419155709.318866-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419155709.318866-2-jean-philippe@linaro.org>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: peCQOuZF8CsR

Returning an error to kvm_init() is fatal anyway, no need to continue
the initialization.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v1->v2: new
---
 target/arm/kvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index 3371ffa401..a5673241e5 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -566,7 +566,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
         !kvm_check_extension(s, KVM_CAP_ARM_IRQ_LINE_LAYOUT_2)) {
         error_report("Using more than 256 vcpus requires a host kernel "
                      "with KVM_CAP_ARM_IRQ_LINE_LAYOUT_2");
-        ret = -EINVAL;
+        return -EINVAL;
     }
 
     if (kvm_check_extension(s, KVM_CAP_ARM_NISV_TO_USER)) {
@@ -595,6 +595,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
             if (ret < 0) {
                 error_report("Enabling of Eager Page Split failed: %s",
                              strerror(-ret));
+                return ret;
             }
         }
     }
-- 
2.44.0
