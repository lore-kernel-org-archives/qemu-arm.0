Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp322003njj;
        Tue, 29 Oct 2024 08:16:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpWmQm+hT3x46XBxxT8nEUCW0+gh/h7hy452Hi+GnUELc09mB0KuxU9XpT/kBvface7CGQF0Xoh/CXAw==@linaro.org
X-Google-Smtp-Source: AGHT+IFEJ0HO65uJfSP82cbKCPEq9rPrCPDe98fMyNH+j8d8gfJnl8jC4c7FrBWStOW6Vlq3jMZZ
X-Received: by 2002:a05:620a:4455:b0:7b1:4356:fd43 with SMTP id af79cd13be357-7b193f5d862mr1698448285a.53.1730214960611;
        Tue, 29 Oct 2024 08:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214960; cv=none;
        d=google.com; s=arc-20240605;
        b=kfxmUdx5Z6+EXrh6hacYrSFVpxd5g0FBzNro/9gszEvN6i/xBMDFOlkji4YOUQy+QW
         MWqOKhsi3XcMG6wOjToVxulQQaz4t+lEP5BEEWwvhv5WveTVPxywtukUdLZU0o+2UAi8
         gIFyIwLkzrciRTeYZXF6acfEUKGS51Moiis5m7RAJweX3CEO/usdjLnYM+a3HSQG5fU1
         gq70fPBoqQP4rV6dfavzPi8HrInZIbtOXGdf3u05AmUTwJWk+oi6OW1V7zQQBYTid+1n
         2AmYtblLecKaOTgXM31efAmF6l4uPqPWnP4pAFBun7V4v7+ecAnNHq4F4x2A5siMwYdi
         PxUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=y+/gn5PrRHI6aUAYrICmiO61nI9SeFkHZ/jV7ZOSLYc=;
        fh=yZhXkKuTQnPc9+tlBwMmnb8Hv6eiMihiu/3IK36kbUk=;
        b=EslcatNuFHUQBeTIJLqMhgepg0bYBVpo3d/7nR0dACyHpY38GUsjTrJyDUTjADMFwK
         z/eSQWxJ9BZmh/qt2eGOdgMPUAh615sl2mcIce4PcUnDX8yXerUhm4X8jFKh786skPSd
         d1qXm46W9GBrYG6WhD0TuqEhneFco3UWHZcTGbQ4MmHx5OzxGr3CqoyugiZPSQK9l6bI
         odX9290LjX5HBPmqpKNjCp+MZG3isb05+izHtPbOUFTYimbU7nA5O4KSbON2AS6YbXxB
         o6vyvrBuyjllS2TfgzOhwYtIbzlnxPQ/CZ4k3L7W0jerjI4Sv95G4QFDqd4geAHK2RkE
         wMPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cgi33KTs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d26a837si1122438785a.90.2024.10.29.08.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cgi33KTs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t5nuj-0004pD-Fs; Tue, 29 Oct 2024 11:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nsB-0000p8-Tm
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 11:11:11 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns3-0007jZ-KT
 for qemu-devel@nongnu.org; Tue, 29 Oct 2024 11:11:07 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4316cce103dso72805575e9.3
 for <qemu-devel@nongnu.org>; Tue, 29 Oct 2024 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214658; x=1730819458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y+/gn5PrRHI6aUAYrICmiO61nI9SeFkHZ/jV7ZOSLYc=;
 b=cgi33KTsNbCX/IQC/79Vf6VDoKV76NWLPJR1uS4CbpjDlSnAsGPVtZaXRa+jB+1ERe
 JEInaVfmXvv+hAqEbkQDGKv7Reeast3O2si4mpKqWMCjP9LphZvg/FckHj/K7OWgXQp5
 xYyRCzQdLjdY8416AahrMuXX+bvor0X35xKvC2+MGIy/OGyX99TqkAX5JvUkUVGmnG2J
 w50UR5tK+pIMvZT3p5itd0LMr0b86y9Ha1SlQpDrA9afYxJqJExuqlgVI5ZoN1DfX59F
 7ew/IoBeR6UfVZcOZfJFomJEir1kWNkfcsm0frsXZI/S5Yx5CRIxhk4ibCHzuZ1XN8i1
 jutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214658; x=1730819458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+/gn5PrRHI6aUAYrICmiO61nI9SeFkHZ/jV7ZOSLYc=;
 b=kilYqqhuHeAkijeJZKrOgCrXRJ+gaW1xnP5P0t5OKUAERKrttcVvhsLRNKqwVLhcq7
 0Go2eAeTZ33CfLJJNKCxKaMy3xy/xRoEKrDt++6PldtI630WIVhwFJs2J+Vh3dXtKd+H
 SFAjK6c3ntTGiJ3Rt5fxl7UOVt6CCdKDE1m3c77WRBh/SsXbI1lGmBC/tpwCty2vubbB
 BJx9TwtDTrgt9uM3MBorNfsyUVmtAEqsZzv1oKwh6+U7xytI8dC7FE2yfNt/osLq4rzT
 9feJqhCRqRsgmdapfCKAjq4KKk4uV8o4tDr7llJhCrvwhemJkqNxTV8x5j44QjZJULOc
 qH3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbVGOT1Sjw+Fchhs98CtyrXAlEveK3AmPJpR5w+gZfhyZWPdMwcMqI+jpdqISBwfzzf5QBprE2Jzqg@nongnu.org
X-Gm-Message-State: AOJu0YyRRz8qaj+HYVNPa0bn+WtUklc465zaqwNQQlwA2sHyVQ5DKeSe
 MIm7EBupJoinAlOPf2JlXwdhSU5ebsB9tJwo4nrVVaydFWmtClFDpk04F3153GQ=
X-Received: by 2002:a05:600c:358e:b0:42f:75e0:780e with SMTP id
 5b1f17b1804b1-4319ac9a68cmr140317035e9.10.1730214656641; 
 Tue, 29 Oct 2024 08:10:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 13/18] docs/system/arm: Add placeholder doc for xlnx-zcu102
 board
Date: Tue, 29 Oct 2024 15:10:43 +0000
Message-Id: <20241029151048.1047247-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a2wNUdsWmSlU

Add a placeholder doc for the xlnx-zcu102 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20241018141332.942844-6-peter.maydell@linaro.org
---
 MAINTAINERS                     |  1 +
 docs/system/arm/xlnx-zcu102.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst      |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/xlnx-zcu102.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b524d7af54..66c7572c27b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1018,6 +1018,7 @@ F: include/hw/ssi/xilinx_spips.h
 F: hw/display/dpcd.c
 F: include/hw/display/dpcd.h
 F: docs/system/arm/xlnx-versal-virt.rst
+F: docs/system/arm/xlnx-zcu102.rst
 
 Xilinx Versal OSPI
 M: Francisco Iglesias <francisco.iglesias@amd.com>
diff --git a/docs/system/arm/xlnx-zcu102.rst b/docs/system/arm/xlnx-zcu102.rst
new file mode 100644
index 00000000000..534cd1dc887
--- /dev/null
+++ b/docs/system/arm/xlnx-zcu102.rst
@@ -0,0 +1,19 @@
+Xilinx ZynqMP ZCU102 (``xlnx-zcu102``)
+======================================
+
+The ``xlnx-zcu102`` board models the Xilinx ZynqMP ZCU102 board.
+This board has 4 Cortex-A53 CPUs and 2 Cortex-R5F CPUs.
+
+Machine-specific options
+""""""""""""""""""""""""
+
+The following machine-specific options are supported:
+
+secure
+  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
+  Arm Security Extensions (TrustZone). The default is ``off``.
+
+virtualization
+  Set ``on``/``off`` to enable/disable emulating a guest CPU which implements the
+  Arm Virtualization Extensions. The default is ``off``.
+
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index a7f88c8f317..ace36d1b17d 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -107,6 +107,7 @@ undocumented; you can get a complete list by running
    arm/xenpvh
    arm/xlnx-versal-virt
    arm/xlnx-zynq
+   arm/xlnx-zcu102
 
 Emulated CPU architecture support
 =================================
-- 
2.34.1

