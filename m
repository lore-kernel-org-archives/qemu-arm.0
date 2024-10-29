Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp321150njj;
        Tue, 29 Oct 2024 08:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOgc3ePtEB9JBszsK7+U0h7hjHfSn6gX4DgR4B/HVK58urj7MGdN2sMNYcnJWEFgX3dSiSkXpv1If1tg==@linaro.org
X-Google-Smtp-Source: AGHT+IGrPvJl2TstIDrIepNt5uvg3fRZlsFhPv8GFS/JVseHvozxfAhPehoOVXdqySpQZtadHdy5
X-Received: by 2002:ac8:7d0d:0:b0:458:23fc:f345 with SMTP id d75a77b69052e-4613c1999d4mr173104911cf.38.1730214906703;
        Tue, 29 Oct 2024 08:15:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214906; cv=none;
        d=google.com; s=arc-20240605;
        b=VI7Bslyvq/typwVxLoYLZjIi3KaOMTsw1ISRJ5aBZKKrwORqOojfZJUTIvaOLfXRMO
         pqWv0MsbWitZzt0RbPt/3ULH1KdrR3p+D9xl3drtJ46y5fvYeqwoUxORmAHXjPBcPLwI
         ISGvn5/wXbc2EOfJ66KWe1cZ+ECNZJiKeNqq269Ak6xy/s75AA8vTCAboHTbezKRYeQe
         s6fP5IjtCZXbwZNRXWh953PQuAdda0b5uFnRuWb4mEqNncPLf7ogXFaXpBA6SUoNaw5v
         YGrZ3pV0NdBgEt32rO6VZoVP9X3BHwAXCI3/OysUSzfpqcqQoeuJaCuCDvgW5uhIrS7z
         7jmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=t1ofx0L3R12Y3Qfk5twMRKrNngXzbSoAXzZlWcI4ZBk=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=S9PuuZ5JDjCwFXLKchC5qlWgq2VYbpSyOAJVMsYED3ZE/Iv13YQ6LYH5UtXzmv7/W2
         KAbgAymzFdeKdlP11CSrOoNic6q7FwIVVh812cM4Fiu07NpYFfyx4xjjCo4Fk38iggFI
         PmRhfmmUWYMe1rVXoyYdp5bk8TsM9OIliIqm6wSg7ntzjtwrAmET3ouqlEgDivXK2Apb
         pK0ADnSTghg2KKNg6BwmfuItnsoFfA1bRdlF792dqJSVSQcrCppoYt+OJYgydaukO0CV
         qkJmhjbp1AbPOJJBzAWp75n1L97gnN0xUta9ceIowkKSPCCW67PDtb4jAeFoCv5Xo39X
         iyGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vgm/JWXI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46132358dafsi108218481cf.265.2024.10.29.08.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:15:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vgm/JWXI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nvW-00069R-0F; Tue, 29 Oct 2024 11:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nsA-0000oq-J3
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns2-0007j2-Vo
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so72966505e9.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214657; x=1730819457; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=t1ofx0L3R12Y3Qfk5twMRKrNngXzbSoAXzZlWcI4ZBk=;
 b=vgm/JWXIWfYS1U68XdgB528xBrv/DBHGqUiIzoHP93RPyU43F9xD3bQyIbzpuihs3g
 1OzeuXC0NKgs8ujnC4VSqAhG39Y7d5tOHqIAFHixP3b+VQCQSCiEzzeDprj3CuW/jkJs
 QIDqjY+PN4KuanUUcLSBodzGVwg32R4jDHUF1SpQDJn52LrMfsNVooJZoKfBa8/u+TMt
 U5Uf04FYNvSPjp5inpfXjhPT1AJ/DkIOp80dgIBZGo8EnYPDhzgNDYFB1w7S33oiorpr
 dx85ut6BFzHQfVuVUncuIMwDfMH0oSAbm9Wu7MUHgyuQjVNPEW87DLzKWX7TtI4KB+B/
 vpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214657; x=1730819457;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t1ofx0L3R12Y3Qfk5twMRKrNngXzbSoAXzZlWcI4ZBk=;
 b=WUoQWj0GYB+nUgoBsby2VHpblqGSMcredGaVc2j+ZIA7lnCDS0u5wZL/rPlkczao8j
 1jBwYqdVVBRMKTvRNUDn2AiXXRwJXla2joKTJgzBPe9h3XRbm+LgWWgsrGONBfyWWnUH
 9kNxeupOinBsxE+XVFJbaEEgGVprcuDaD1x5ySu3jJ51XD4iK3M9gJiyQEMzK1ktDv3u
 14Vk7EGWNPdXbE9CDrL/NCjxnIHkxOcR/IuF24LVsRBrVUo7wj+CoZ+khSN6zMgBXeEy
 OVf248nGOnY0AuE8ZVP9xCkvFpA5gIiaUGnA4t1S33USShqZhb7oBlqzV/QIjbOl8YuW
 QA5A==
X-Gm-Message-State: AOJu0YzHybBrJ3sYNJkBnp5kuRb1VjzQKzO8jOT/ThD9iS3GlFQk6ygD
 ARAJb9U4GfKk40AiwBerAYmX6W/GWU+h44+u+5fC/usfFRaIWZegWFDaX43P/xg6YX4KifMz56U
 t
X-Received: by 2002:a05:600c:358e:b0:42f:75e0:780e with SMTP id
 5b1f17b1804b1-4319ac9a68cmr140317295e9.10.1730214657109; 
 Tue, 29 Oct 2024 08:10:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 14/18] docs/system/arm: Add placeholder docs for mcimx6ul-evk
 and mcimx7d-sabre
Date: Tue, 29 Oct 2024 15:10:44 +0000
Message-Id: <20241029151048.1047247-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: F6yGw0xvzLA+

Add placeholder docs for the mcimx6ul-evk and mcimx7d-sabre boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20241018141332.942844-7-peter.maydell@linaro.org
---
 MAINTAINERS                       | 2 ++
 docs/system/arm/mcimx6ul-evk.rst  | 5 +++++
 docs/system/arm/mcimx7d-sabre.rst | 5 +++++
 docs/system/target-arm.rst        | 2 ++
 4 files changed, 14 insertions(+)
 create mode 100644 docs/system/arm/mcimx6ul-evk.rst
 create mode 100644 docs/system/arm/mcimx7d-sabre.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 66c7572c27b..1e88b5738cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -791,6 +791,7 @@ F: hw/arm/fsl-imx6ul.c
 F: hw/misc/imx6ul_ccm.c
 F: include/hw/arm/fsl-imx6ul.h
 F: include/hw/misc/imx6ul_ccm.h
+F: docs/system/arm/mcimx6ul-evk.rst
 
 MCIMX7D SABRE / i.MX7
 M: Peter Maydell <peter.maydell@linaro.org>
@@ -804,6 +805,7 @@ F: include/hw/arm/fsl-imx7.h
 F: include/hw/misc/imx7_*.h
 F: hw/pci-host/designware.c
 F: include/hw/pci-host/designware.h
+F: docs/system/arm/mcimx7d-sabre.rst
 
 MPS2 / MPS3
 M: Peter Maydell <peter.maydell@linaro.org>
diff --git a/docs/system/arm/mcimx6ul-evk.rst b/docs/system/arm/mcimx6ul-evk.rst
new file mode 100644
index 00000000000..8871138ab3e
--- /dev/null
+++ b/docs/system/arm/mcimx6ul-evk.rst
@@ -0,0 +1,5 @@
+NXP MCIMX6UL-EVK (``mcimx6ul-evk``)
+===================================
+
+The ``mcimx6ul-evk`` machine models the NXP i.MX6UltraLite Evaluation Kit
+MCIMX6UL-EVK development board. It has a single Cortex-A7 CPU.
diff --git a/docs/system/arm/mcimx7d-sabre.rst b/docs/system/arm/mcimx7d-sabre.rst
new file mode 100644
index 00000000000..c5d35af1d44
--- /dev/null
+++ b/docs/system/arm/mcimx7d-sabre.rst
@@ -0,0 +1,5 @@
+NXP MCIMX7D Sabre (``mcimx7d-sabre``)
+=====================================
+
+The ``mcimx7d-sabre`` machine models the NXP SABRE Board MCIMX7SABRE,
+based an an i.MX7Dual SoC.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index ace36d1b17d..1f806cf4a46 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -97,6 +97,8 @@ undocumented; you can get a complete list by running
    arm/nrf
    arm/nuvoton
    arm/imx25-pdk
+   arm/mcimx6ul-evk
+   arm/mcimx7d-sabre
    arm/orangepi
    arm/raspi
    arm/collie
-- 
2.34.1

