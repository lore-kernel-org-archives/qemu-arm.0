Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp9018351lfk;
        Tue, 23 Nov 2021 09:10:36 -0800 (PST)
X-Received: by 2002:a05:600c:202:: with SMTP id 2mr4936272wmi.167.1637687435842;
        Tue, 23 Nov 2021 09:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637687435; cv=none;
        d=google.com; s=arc-20160816;
        b=EaWn3Yxej4d/hDGSmjYWIzQ8ejNVBiCuhBCdg5EBSRxk2LnTCxM4U5QLTvk/rzI1eK
         EGawEf1+1T4KeiavJVWqncd/2AxA+7RTtIhPytLyJLYYsD6yk/MPslxFlcHUW7F1NylF
         NaOs0CGjhO6BDBOqmUFBXkQbGuT/S7+mGLfppPj1l0PeoW7+W2uVdA3ZrFjyKhA1EZpy
         765I3TBfMMVJvRpq/ufl8pnGWmyY80n3eFYphHfMiWTOzpy2cuzIq/0fhTqRSOS8GRlp
         fC4aO8yVh6l2Js2uzZ2LlpNhxNON+7w4PpsvFKz84I7O2hNVPI1R4lK5nM7cAv9w6jtS
         aFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=+pnw4UnWSsaFCtOoB/ZU0sfK7/yij1QM8IDECVNjnXI=;
        b=sXk0/bC5WxywGZBT7yx6h2K0a4GqRme1zcQ94r0MSwd+VwzNie+VhZEyaZyU87Wba/
         udLp4+gAadxgZ1jbY+9OBoH5F6QphLM2OJeoVH8ztUSj4d2H/B69CEBTn5r/gxPuSZZ/
         WEGlOoE72I5e+diOlFpgdiSQdkaQzZOrq4xl8UMTX/heKZPwF4Yn5CPOz3FhOEAtRndM
         tDq1Hhja5Sdj8KD02V8MQ5Iie7V9oQwVkpDFp1TPvzlSUSS+m0uon1xYzx/YtgVr1LLS
         TPKKoQVrxlT4fWbsqhM1Y3pppT+iUMIy8ujzPTMa1NlT3b/n5dx7inaicYQc+CmK7KB8
         BnIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y0fD/qHF";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x21sor1232286wmk.6.2021.11.23.09.10.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 23 Nov 2021 09:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="y0fD/qHF";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+pnw4UnWSsaFCtOoB/ZU0sfK7/yij1QM8IDECVNjnXI=;
        b=y0fD/qHFU+9JHlV4W0LexMJRUdxnqv70ox/YUhioRuRzsH7/cikhiadgYoTn4JHNHp
         ZwMlNeMI3X9m0L4EiI+AVvZ7uaTI/MrXGyZWbpLUj0LHMnnTCiKnlVs944c55EQtEmVX
         P6U2MFRki61pck+HgmII2dRcBaH/2Z8itrUq47bbf7BFl1/dIyzNesqoBZRZ8Irb0GSp
         j+fTfr+agNxaV6pCY3tt5i4u1iU2ynI2f7WMU/E9HOJ3jZqsCmI5CtRjrbNVLxshuqBM
         p3MUFqhrkyqcrjkaMPaZjyPZE8qSz6ApjjWrOhRE2qIPxQ7AWD61zEuRuBW5N/9GJ7eo
         GOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+pnw4UnWSsaFCtOoB/ZU0sfK7/yij1QM8IDECVNjnXI=;
        b=15rqhZKdS9D9zOTM37+4Y77hl7cpUQC31q9lJGxCfDryxvPRrM9xnvAZDY8/P7h0vJ
         VpyEy02Y4N615e8GPE5zsaIzTzw/0l9ywIex16HVBbIAI4W7HzxHDUGa+Wbgr1hXRpNI
         /jBLzhRZ6SUpnFhiGXJcep4Md662CIcXvzf4P720Z4XjdUVj9iKYgfuwUjGFfEy+tHoo
         J5pU/+OwPLDMY6Yt8DTpYCA/5i8BYNPzwdda7z337lMX5i+P9GZO2bL8WmQtimSRevI9
         XaCaou9jaAZ16ojI48rNVFWBH+b1uHHXRy/J5czh9gspLQk8oJ3v9Zq5psx/AeehzQeT
         pjgw==
X-Gm-Message-State: AOAM5302dDRaKIlR2ioY9bFL7tHZB80Ne1jiCBZBuo3rwf4K4Kcm7LRi
	5S2Ir78HxJEBv4C5vpjG1I+BRm//
X-Google-Smtp-Source: ABdhPJxHsj1cMP47DGGpHMIzILbPme4oARjvMtdR4jho1bOaLU0qL6HYETlE4Aq7hS7Gmx/KI8Ml+A==
X-Received: by 2002:a05:600c:2f10:: with SMTP id r16mr4985542wmn.141.1637687433489;
        Tue, 23 Nov 2021 09:10:33 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id g18sm2479262wmq.4.2021.11.23.09.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 09:10:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [for-6.2] hw/intc/arm_gicv3: Update cached state after acknowledging LPI
Date: Tue, 23 Nov 2021 17:10:31 +0000
Message-Id: <20211123171031.975367-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UBzziHkDAT61

In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
new highest priority pending LPI after changing the requested LPI
pending bit.  However the overall highest priority pending interrupt
information won't be updated unless we call gicv3_redist_update().
We do that from the callsite in gicv3-redist_process_lpi(), but not
from the callsite in icc_activate_irq().  The effect is that when the
guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
pending in the data structure but still leave it in cs->hppi so will
offer it to the guest again.

The effect is that if we are using an emulated GICv3 and ITS and
using devices which use LPIs (ie PCI devices) then Linux will
complain "irq 54: nobody cared" and then hang (probably because the
stale bogus interrupt info meant we never tried to deliver some other
real interrupt).

Add the missing gicv3_redist_update() call.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Marked for-6.2 because this is a bug fix to the ITS support
which is new in this release. At least for me this is necessary
to boot Debian on the virt board, since the ITS is default-enabled.
The failure seemed to be somewhat intermittent; I haven't bothered
to try to work out why.

 hw/intc/arm_gicv3_cpuif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 3fe5de8ad7d..2d9f2ad2b6c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -906,6 +906,7 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
         gicv3_update(cs->gic, irq, 1);
     } else {
         gicv3_redist_lpi_pending(cs, irq, 0);
+        gicv3_redist_update(cs);
     }
 }
 
-- 
2.25.1
