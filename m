Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250584lfe;
        Mon, 16 Mar 2020 09:07:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvMBjcmPkth7oQentOTjiKfYCmB0Kd79sXDTRLfuGTjWV/B4xcEEr58ftat43UP74W3NFng
X-Received: by 2002:a25:d04e:: with SMTP id h75mr324458ybg.469.1584374850932;
        Mon, 16 Mar 2020 09:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374850; cv=none;
        d=google.com; s=arc-20160816;
        b=c0J3mJttZVQ8i+4J9WnAEr2EQXT95JI5g5mUzFzbODYvREfHrjfi///XHYgrbPEamB
         3/QKgBx0LMe2jkcbsMGflsqkQymW5Nu7/qyMUh56irp1ss23Pncl+SMJO8IEHVQpEplD
         x6WZe0Sr3mUJv0R1vcga9AKtg4Sx4NNvvnyb+VlzyPqFSBRW0aScb3JODPsGxsfB0NMS
         eF4JeNhg3/sZJjfxuHoFVzOQaAQkYjVqjysGaRHHkUFqc+JKcQH6xqSB9k9sLFX7/C0C
         zXimcrUAeg2mtuGHZxn94kgIvpM36eEV1Vjy5x2H/VjZdnCZHHYbMN3bxQumIo4pDsFE
         syaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vKQK/gk4+Rfzeay1FIA++WnEXh1sOGPFugrslQ2WqSM=;
        b=PdQww4Jjk4ogLWSSMpXE/p8cNcWsA/8G8i+P2gEiHNBYoZ/leLpjEZAPUJw7+FYceg
         iKLpKJvfhw/RLqLTitihERgmrzKsMcVHamg9lEZtxzKu/D6F/wksHOBgi+CxCTKty2I8
         3zoMedVMnHcc6BuEC/fJfvZRwkLm9eK/l+YDGarOS6wqkNrwF2FkF/bz+jmeFRmlwrIG
         GcB1FnihF17RkqYLK9Kn75rPOgYVrsGfn8sodWnq/JlKmVqKtwWM9GMthnb72jHE9Txd
         g7f71D9YulZyf9uMSe35K/YQJAniPDgTNoOLXCUGthGByPT1oZ0iMMPIQo8gUzTjccd0
         /Nuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bLoe1DEZ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id n79si122630ybg.350.2020.03.16.09.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bLoe1DEZ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vKQK/gk4+Rfzeay1FIA++WnEXh1sOGPFugrslQ2WqSM=;
	b=bLoe1DEZJKi9M1M15HAJ3e+pl1GlK/eceNS1xhaQr7mnt0Jd0H07TxNl+dQWYJ5TEDIcHT
	t+Lio4ZsX9obRQ8qWr42wBjCpUy9vO4KJExfHWsMeypx+4aCayw8K/FfmcbBTSSPqV2dAq
	aXMM8UU2jQDcmaZ1lXBg98xv8JG6S7s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-fnkbWYBCNNCiq26pWw0esw-1; Mon, 16 Mar 2020 12:07:28 -0400
X-MC-Unique: fnkbWYBCNNCiq26pWw0esw-1
Received: by mail-wr1-f70.google.com with SMTP id t4so6314742wrv.9
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbHLr8MN7Y181YkXNU9q35GGyibM63M9cMs0mFzNFC4=;
        b=d032Q/tDk/H5tQ/KOyuqt8EjZVJekNT3DyveqXyyzFK0EuwZCk7O0TYpRX7y9mv+5A
         JrnAoz4IUqPOej8zRsBAR1pLTy6Rcdwklc3QqHYM7ozlRuAlE5VKdGSUp0bMizGS8ANF
         wIxYbDwEyRrEYpQnTGO6SOPfZqDO6XfMXDPwk7970P8vTxXl2m3n9WmvrwrJG7jM+aLG
         cxFbV7RxgrPKub7OyVjuZknWpA9O2tOUGDn3XmVBH4PgBYri5+ajm6XrSANLFsWL4on0
         lA178X2lNi74NIMRctSNdzmkrq8reBS6CmE22+YrrHvN8T00j2CpBYSoKBhKeHQnp2Wk
         BXhw==
X-Gm-Message-State: ANhLgQ2qCD+zOklfgAvSXUA+pABkIF7Di0ABzs8QSmEBxCKEt5r07SiT
	5zZgyA6NT9ma7CqdNBu0q2NTqoj91ERNz/csBV9JqnwTPU0VQ89t5hHU4kIgcGPo2VEC7HSpVN5
	Y4G/ZIZrC81tiI5M/
X-Received: by 2002:a1c:de82:: with SMTP id v124mr27908586wmg.70.1584374847175;
        Mon, 16 Mar 2020 09:07:27 -0700 (PDT)
X-Received: by 2002:a1c:de82:: with SMTP id v124mr27908565wmg.70.1584374846997;
        Mon, 16 Mar 2020 09:07:26 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id k5sm221948wmj.18.2020.03.16.09.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 09/19] target/arm: Move ARM_V7M Kconfig from hw/ to target/
Date: Mon, 16 Mar 2020 17:06:24 +0100
Message-Id: <20200316160634.3386-10-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: e+5d+hlehSN7

ARM_V7M is a concept tied to the architecture. Move it to the
target/arm/ directory to keep the hardware/architecture separation
clearer.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/Kconfig     | 3 ---
 target/Kconfig     | 2 +-
 target/arm/Kconfig | 2 ++
 3 files changed, 3 insertions(+), 4 deletions(-)
 create mode 100644 target/arm/Kconfig

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e5a876c8d1..e3d7e7694a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -285,9 +285,6 @@ config ZYNQ
     select XILINX_SPIPS
     select ZYNQ_DEVCFG
=20
-config ARM_V7M
-    bool
-
 config ALLWINNER_A10
     bool
     select AHCI
diff --git a/target/Kconfig b/target/Kconfig
index 8b13789179..130d0c7a85 100644
--- a/target/Kconfig
+++ b/target/Kconfig
@@ -1 +1 @@
-
+source arm/Kconfig
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
new file mode 100644
index 0000000000..e68c71a6ff
--- /dev/null
+++ b/target/arm/Kconfig
@@ -0,0 +1,2 @@
+config ARM_V7M
+    bool
--=20
2.21.1
