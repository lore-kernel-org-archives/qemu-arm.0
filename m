Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp379109ejb;
        Mon, 13 Mar 2023 08:11:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set/GTZeC+LD//H6OPY2/Ankt7hwd9GbLvApV3Cp1zg4z2XomHv08+sh4v1CoywjBhc49aDUF
X-Received: by 2002:adf:cd92:0:b0:2ce:ad0d:4f3d with SMTP id q18-20020adfcd92000000b002cead0d4f3dmr3247167wrj.10.1678720294293;
        Mon, 13 Mar 2023 08:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678720294; cv=none;
        d=google.com; s=arc-20160816;
        b=eT2Jr7jtkJWEVWxm8Q3jY0ghp8fEaI2RENzTfcpS650tFpPZ+tS9JV9rzS1hYRTmqi
         DrnXukRwbXtYO1uonxexZfkjoAE+hPM3yLcHdX4IhgYmvQ4MviCRUtKf3ULdgmPzCbec
         9IB208jndYlzfhNg0+0P0G6yXdxVEj9OsdOhCoI2jvDMk8nnWMSfasWv4jmWjHSvhg/z
         v8egNb3O+afaoQGqe0YperB4J9jigQBW2oiOanHjoAjxLwtLzhtNUcTwrsDQcOEp/+am
         67md2SS54d5rybtByleZFqFDH3syHhiB1JbcH67rB63onRnrbHWwtajp/EvB8FJyGq3C
         VevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
        b=HzYrCkMXjzFNUCpSEkrX3F8EPaJzSp3aDvQoQMhioJGXCM4Ch84UAEVbnq2MJYld80
         plusTF7dl4RDObI8aIVIxgyhqco4AGR+bWRF0ehXhNjcOpaK9hHpDURjgnUMcquSWj8d
         zM4NGZ9TlPU2C2CZp31hiYyI4jwGQoov1xpFj/Wz2NFFi1DYH7MnGCBy2HccydTIBjg2
         RG/IuYePZboEKF3Jx6k4zkDhiRTO+C8dHWbp8/XHC0VSQ3fCV7l92s/MtD4zz2fhPhmA
         Z/hQ/B8HWR9VtcOkpajVT1UqBex/KQS+Z2I/yS9kcaoUZNKUVbNoApUXFYdEOs++Ff1U
         iB+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ShXUbs8K;
       dkim=neutral (no key) header.i=@suse.de header.b=M9eyuPCr;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <farosas@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [2001:67c:2178:6::1d])
        by mx.google.com with ESMTPS id z18-20020a5d4412000000b002cea631049esi5375395wrq.444.2023.03.13.08.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 08:11:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) client-ip=2001:67c:2178:6::1d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=ShXUbs8K;
       dkim=neutral (no key) header.i=@suse.de header.b=M9eyuPCr;
       spf=pass (google.com: domain of farosas@suse.de designates 2001:67c:2178:6::1d as permitted sender) smtp.mailfrom=farosas@suse.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id ECC841FE0D;
	Mon, 13 Mar 2023 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678720293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=ShXUbs8KngrcHs1Mk7rA+Pk7otOJ7qabGyHAVwSqnx8HUwfFNIqrKMecAAD+qMfGm5jdHM
	OOyiXPfNaUJGrMLTJYIJD91OBQ+nw9HoLrlE6Dop3Cv1mj4UYNhubFhLNBA3CNM0nb0RfK
	ncfDMQa9J2DCt1BBkufReAoGdURaKEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678720293;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QweYlVkgsKkdSaR0EGS4O9Xq8Ca8lpE3c9GPYgg4Tf4=;
	b=M9eyuPCr08DBVPvwr+WX6lZLnV1FGFNuUAvGVNzxFn2vb6U09YNNBIevZuBJ0zZPgR89NJ
	CNbb3Z7zJfcbGzBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DCBC13582;
	Mon, 13 Mar 2023 15:11:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CEn2NSI9D2R1YwAAMHmgww
	(envelope-from <farosas@suse.de>); Mon, 13 Mar 2023 15:11:30 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Claudio Fontana <cfontana@suse.de>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@csgraf.de>,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v9 08/10] arm/Kconfig: Always select SEMIHOSTING when TCG is present
Date: Mon, 13 Mar 2023 12:10:56 -0300
Message-Id: <20230313151058.19645-9-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230313151058.19645-1-farosas@suse.de>
References: <20230313151058.19645-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qAK9s29TAhNY

We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
default.mak anymore. So reflect the change in a Kconfig.

Instead of using semihosting/Kconfig, use a target-specific file, so
that the change doesn't affect other architectures which might
implement semihosting in a way compatible with KVM.

The selection from ARM_v7M needs to be removed to avoid a cycle during
parsing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/arm-softmmu/default.mak | 2 --
 hw/arm/Kconfig                          | 1 -
 target/arm/Kconfig                      | 7 +++++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c..cb3e5aea65 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -40,6 +40,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index b5aed4aff5..c0b213f42d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -316,7 +316,6 @@ config ARM_V7M
     # currently v7M must be included in a TCG build due to translate.c
     default y if TCG && (ARM || AARCH64)
     select PTIMER
-    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b..39f05b6420 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -4,3 +4,10 @@ config ARM
 config AARCH64
     bool
     select ARM
+
+# This config exists just so we can make SEMIHOSTING default when TCG
+# is selected without also changing it for other architectures.
+config ARM_SEMIHOSTING
+    bool
+    default y if TCG && ARM
+    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.35.3
