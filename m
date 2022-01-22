Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp1732407qvl;
        Sat, 22 Jan 2022 10:24:51 -0800 (PST)
X-Received: by 2002:a1c:1d44:: with SMTP id d65mr4692999wmd.96.1642875891513;
        Sat, 22 Jan 2022 10:24:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642875891; cv=none;
        d=google.com; s=arc-20160816;
        b=B9qyK8xtIKx+Z7in2qZ53wTaQIBu07Ko7wSXePakbhmPAsqUdDP+9dW3pxkhjMojx7
         yHQsVfzYA+fP5IA8KXhW/Mo+5/g3gUVtthZMitiOtTEhRD7z2rhIQoRAjmJqwaHZR1G3
         h+O7Bv2YpToH/m0sh0q35bukKuesK1EEfI+obDZ0SXtarjwZ96fKIdRAA6Xg5eKro2di
         F4JLTopTTgz469wZdS++WpVV8jNPs0x3v/YvSHr2Zg/1PZ7K8kFGpb5LcdFRDXG9ACqo
         ee7Dmz9hn67UYpv+1Z9f15XQAJNAmC2LjNZplNKuo/ann+6phlCVdWU9DV4BpA+tJuC5
         fqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tHMZxZiFQJbI+EMs2+qLPMDXg/8YQrzz1SenT8sExVE=;
        b=dwQLMy+z9MLbnirnzUEAtshvk285PFmSN+iR6HNYQMyErtTNZtHPtzqMRJSfgQPLT0
         1ZI98LPL2tB0FMmHDwTSrmL0xSBtkeE+DJ+PcaKmHY5oT8APQaFagbL3PZok6HoEwT1/
         BqHjBUlPCxxoVfHj8M/LOYh/eLCycUCD23AvUkAV341xRSBHoyxOhwUup0/9jbYUnHal
         ccS2790uNDf9r8ackGUgLIbjvTZ5s1tB/yKrLLdnxye4twqZ5GeeQzJuvT2d3MqbRr7s
         yLFsN50gK3NPRMWc7Rk1rWF/AubCepbmuAL+Rx8DmE+fSsq4jBwgEBwlySPQhj2MNreu
         G0Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMa3V+Rm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2sor5465150wrc.69.2022.01.22.10.24.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 22 Jan 2022 10:24:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xMa3V+Rm;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tHMZxZiFQJbI+EMs2+qLPMDXg/8YQrzz1SenT8sExVE=;
        b=xMa3V+Rmm47QybMRBrPrmrlxD2xIIicBVnqccGP5RwO1DZAizp/jDKC2KV2EClJDKl
         ZZpya2BAKYdVHJ67tj3TtGfHy2zusIS0IUeabrHwTMXLq4xABSqszuZYLEGf5WI6cpLm
         iANAw45AzUVhV5VyPe0SdhLUgrtyaMZdDLtSX9gJmP0Mrly5zp49yNNSFlpFTPgX6uXv
         ev04MYzUhXtppq4qh42G6Qcu4KpzzyuEMgFbhvZy5cOoOsZzx06aNckRK6xBgM9698g0
         J0s8KQa5zX/czx8NLtX6S0IIaBvs1ihzyRHSFf/AFbg1/R1h6g47YU8e/TLkSQS2nO8e
         T2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tHMZxZiFQJbI+EMs2+qLPMDXg/8YQrzz1SenT8sExVE=;
        b=AKIyzg5iySPEiJ81UMQ8QGEn7VjaJqVujN1RQQBkVd+GoCTLTJo6y2XQ+o9KIHXACi
         d4QpD0Z4OoEyx9n9YQhHAOom2lfez35u1iPK9ISGM5/64aNdZa19RLR0Dh4bfvMmHcAZ
         +yLKchMIZTmybm6F6hA3KwwfKLizmMSjB39tpHgKHyXYZ8QTW8Ao1TgxTfF/lt9ORguQ
         k3WhSizZP8D7aNfG5eUT/UAPoZlHEZn8CiGvP3mpxAoHaXri1GFF//LuhVunaLOKqVMb
         ZXiT3uwWBTMLb3NEh8KdazjmZNkCD+hCE+BbPlLdIEJqeQC7WR72VqXVDz+1r/LHrTR2
         jRew==
X-Gm-Message-State: AOAM531bVzu+uA40YrmvFZTjw7ZiCW1oZEicEttaJ4TU1gbaOLcpz8XN
	BoyLlPxR4i450RF+EDFR5xRnJ4PIlsoEqT9x
X-Google-Smtp-Source: ABdhPJzB5qVOGymwJpQo/6zRMiZFGRAXIV/oIhAcVXasi3jFeRlxtHdG1O9tvPjvLzkVVAPLWTvpAQ==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr8139341wrv.174.1642875891175;
        Sat, 22 Jan 2022 10:24:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 21sm8870774wmk.45.2022.01.22.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 10:24:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 07/14] hw/intc/arm_gicv3_its: Sort ITS command list into numeric order
Date: Sat, 22 Jan 2022 18:24:37 +0000
Message-Id: <20220122182444.724087-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220122182444.724087-1-peter.maydell@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZgWMaNaYghBW

The list of #defines for the ITS command packet numbers is neither
in alphabetical nor numeric order. Sort it into numeric order.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gicv3_internal.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 1eeb99035da..5394266aaf4 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -314,16 +314,16 @@ FIELD(GITS_TYPER, CIL, 36, 1)
 #define CMD_MASK                  0xff
 
 /* ITS Commands */
-#define GITS_CMD_CLEAR            0x04
-#define GITS_CMD_DISCARD          0x0F
 #define GITS_CMD_INT              0x03
-#define GITS_CMD_MAPC             0x09
+#define GITS_CMD_CLEAR            0x04
+#define GITS_CMD_SYNC             0x05
 #define GITS_CMD_MAPD             0x08
-#define GITS_CMD_MAPI             0x0B
+#define GITS_CMD_MAPC             0x09
 #define GITS_CMD_MAPTI            0x0A
+#define GITS_CMD_MAPI             0x0B
 #define GITS_CMD_INV              0x0C
 #define GITS_CMD_INVALL           0x0D
-#define GITS_CMD_SYNC             0x05
+#define GITS_CMD_DISCARD          0x0F
 
 /* MAPC command fields */
 #define ICID_LENGTH                  16
-- 
2.25.1
