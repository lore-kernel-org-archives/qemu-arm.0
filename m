Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4986258lfq;
        Tue, 29 Sep 2020 15:44:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4inXtfHm5J/+04Eu/TGOvxllQ8xCVVj4qzyzLt3tV9AizwhW4hT5LOmnR5sylE0TS1Z9N
X-Received: by 2002:a17:906:34d9:: with SMTP id h25mr2074972ejb.520.1601419474943;
        Tue, 29 Sep 2020 15:44:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601419474; cv=none;
        d=google.com; s=arc-20160816;
        b=VL1YCZJRG5mPFkNTXhhZa+ALn4IB3Sm+p2htfvZnsXNrQCs3o1nEbjqSHPGLc1ZXfx
         Uek2wEskVGNqFRnVyLzT/RiQun6jdgPrEPBI7IFh4QdNQYmY3AQUo8WF2eWRTBvrHx8u
         4CThqAByQ6zEop4A8ZvS2jI7o08OnHJncK/MiWHUA/Fy85FzQ39rwq5bGAqgCdrh9kgm
         hfsGWCeV65Qvvc24DGrKPSFeIFmV4MqHInvY5chgrtBl2nqRv1/PN4nuoO60U6KoRnlS
         1wzXo9F5G/3q7syoxXKNJdy/N+8VQ9fIiFaELkllMsqHELUgy19+CpfRiR5YYj7HqIw1
         SPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i7QZwS1vfY6pxc/yL3I5YaiK5BX/yKl7ag6KjP4fakU=;
        b=jaF0jTDlFWl25xq7/tuJpT5qJ6pE4f9sEHyCPq4yKxm0LBpKTMga1f/u8DIf/DucbK
         eKtrvI0rKFpBTTZ1bvDN8FjbAuISyitV0KArVUnKkVdvU1IoeduHWlrFpNlNX5pFiIhu
         SYcKERklA+HJ27B/Uh7e/y6ZNI3c1BbqPOqVfbD8HrE1ZEqQpr8SJa7b0hPMbK7EuzaU
         M7I3ze0MS/PMwQv+OW67RbqYhNUMUh2A9E17JlSode/UpVCoorJtvVpcRF26ZwOOqxCt
         9Ve0fdU9b2+xDvRQDwwNa1Ro0yBaNVETDCKleNnaUe6winUmbi2KhhBQm/6591X1XnIX
         5EhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BO0JZ1KB;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id q2si2424119ejp.34.2020.09.29.15.44.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 15:44:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BO0JZ1KB;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601419473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7QZwS1vfY6pxc/yL3I5YaiK5BX/yKl7ag6KjP4fakU=;
	b=BO0JZ1KBV5EuI/AK8L/tUwmHLSxlUMstE4kPquUgjskCaUVrNjVYm0hKm2cklGtn2+fzbD
	DUC+NfDj6lRUXU43kWfvMHxoV9v9UkEmeqM1u/FbBQe8HcipbUGSJ7C/Q0spf59oFRuUwu
	dhQXDOiWya5/FeGZ/McX18AwX5CLGvw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-ts6D5KF6Mdih7vx9T2fLUw-1; Tue, 29 Sep 2020 18:44:29 -0400
X-MC-Unique: ts6D5KF6Mdih7vx9T2fLUw-1
Received: by mail-wr1-f71.google.com with SMTP id f18so2349883wrv.19
        for <alex.bennee@linaro.org>; Tue, 29 Sep 2020 15:44:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i7QZwS1vfY6pxc/yL3I5YaiK5BX/yKl7ag6KjP4fakU=;
        b=VW0Wzx0yjihI1vWhYumRar+eq3naQaLIgFBgGi3PHWoqX4T9xcnmNOnAioZZOgfXdT
         eWfFu541Q4F0KrLRHJYxytyh2M57JzJmNzY+GVXO5DGM+3OM2O1FwwB/Oo1T8nRt7JEq
         GCLjOLgxeXXZqrZT/THqjj8ZwoyQfGI5fnCys9ic+DqJGrGKGbHKD5yUm7aSAFdkseza
         MxsgD+c8lF1k/xcIZQcKE3+OkBWuLq5/FDNZVhocQ060LQtc/kfq8Rnq6VELysClcsQZ
         jLvk+DvI1lvt9kXNLCEVVXiZvuU7Qm1oMuib/nKpMdLja4DkYujv999w7die7Q7eWFBW
         p4gA==
X-Gm-Message-State: AOAM5326/OTO0jGNjxSe/w3zxZCN0Qe9Vt6OPhizVCpQ8dbIx4smnjwS
	zhaflFj0wXZbFJpODxZpL77gMoalaD4at/fIDE6vYJDG91ByJEa3WjmwyiUoqHT8y1dXUt8DPTO
	WBFIfhiRw/jGFRzT8
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr7104481wrm.150.1601419468593;
        Tue, 29 Sep 2020 15:44:28 -0700 (PDT)
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr7104459wrm.150.1601419468383;
        Tue, 29 Sep 2020 15:44:28 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net. [83.53.161.74])
        by smtp.gmail.com with ESMTPSA id j10sm7850036wrn.2.2020.09.29.15.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:44:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 06/12] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Wed, 30 Sep 2020 00:43:49 +0200
Message-Id: <20200929224355.1224017-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200929224355.1224017-1-philmd@redhat.com>
References: <20200929224355.1224017-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: vEcEtQlVav3j

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv6 CPUs when TCG is available:

  - ARM1136
  - ARM1176
  - ARM11MPCore
  - Cortex-M0

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index d2876b2c8b..e01eb55bc0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -6,6 +6,10 @@ config ARM_V5
     bool
     select TCG
 
+config ARM_V6
+    bool
+    select TCG
+
 config ARM_VIRT
     bool
     imply PCI_DEVICES
@@ -123,6 +127,7 @@ config NETDUINOPLUS2
 
 config NSERIES
     bool
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -391,6 +396,7 @@ config FSL_IMX25
 
 config FSL_IMX31
     bool
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
-- 
2.26.2
