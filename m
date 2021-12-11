Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583460lfk;
        Sat, 11 Dec 2021 11:11:52 -0800 (PST)
X-Received: by 2002:a05:600c:a55:: with SMTP id c21mr25705650wmq.191.1639249912280;
        Sat, 11 Dec 2021 11:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249912; cv=none;
        d=google.com; s=arc-20160816;
        b=bNsjDsc3AWxm0yzm/8vJXVTixVPPV6I3nymHFCIQlYxqZhf4okwzgsRKy335ed2ZTe
         M2hbWmGVZOYB+FAHJrcxhGXu+wEjnrk0YDBpuJCVLFkT5CGW29ZwASU6ZFUqPMUaNcl/
         VQoWh/ju3seBF9dmMqtcnrNp+h47iAW48WtlWC1uguQc70QtQZPnyqmZCI/UrKCAAUFs
         T0el23Jk+pEzdb1xRNVULhUlUh6BYQsIUc8pK8VVotU0ivTFWP1IXglUbIoxgJFJuI0y
         Fi7hDGgEB+KGi1ofl2ofOEIt+E4/zZk8lvTQNtn924rNPk+7fc639T86ecJf5dce1SYa
         IQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cQF+uQ2XF/FL5n11Hhd7YnZeqtlVR0LDCO1BybZYM4U=;
        b=0ghYDX3xPVRWg/6FWvTYvdopasQTG0lwnujvahgwj43P660VwZ8VNbl4FaKruH/f8j
         lUNYAgBLFC+LzXjepKDtKFHrYzYXVvpi7cnVNllxyP4HIDX9qTtqRxnVK1cWdCil5e8E
         hLjCMAugQ9JbN2vr7Cv+NoCjihjQ794Q+DvCcTF2QevAIUlZ/ERFeFlBn0eHIolfxNDm
         QVrgEnN2U3c6GjjREucUCt4VUq8SNzu8QHP88LIsVhJSNH0647Jv5GxI2kOd4JWbJZEO
         hSjj+AzaHx6HOa2cPlYVZ6XsYvZWoXWcCXaxSt2A8Qo2ic6UqDnFHfjZoJMrUPODp9lW
         E9cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=foB7WPMa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t11sor4314812wrz.40.2021.12.11.11.11.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=foB7WPMa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cQF+uQ2XF/FL5n11Hhd7YnZeqtlVR0LDCO1BybZYM4U=;
        b=foB7WPMaYPo1gU+zp2YG1ZsUa3vIbL0Ge1SIbzAo2oN9pdEAW/uxLYBXFfFlN3NL/E
         bG6XZIQTuw5ooqpVuh6XmsEIBU7jcBoT+OPm6zkRXnDdn55aeO7wVJ2r7ZZFy+dWX3Jy
         aGrlh2s+WrI9avadO3dukrvCBy+l+mL40xkA5hYKwT4qbRVeKs4qO5iTiDRjPnHuJRXs
         XoPoJZyNOD0JGujUu5ctsRdGX/SVUheKXcpT0oFoqJo1+nNqmsdlWo+fm4IYl7XDLVtW
         xwIMkwm2w5WCT3VxU5APdUF5T/ngn5jt+YVqiW5i8V8Y3RW+q8p72FqLBQjlRBxJdREm
         rPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQF+uQ2XF/FL5n11Hhd7YnZeqtlVR0LDCO1BybZYM4U=;
        b=7gAIh/FXnZcAWoNyzlX1I0szKMRXbDI4FYdwGm6BJsfybcBw0V6whhV/TUUci36/ln
         nhooQSDYjfXInd6ip4cVXnQF38zrBQgUm04xOtr/2ICO/lpx2I2b8LyoYkjcHyO7n2ZP
         jQnqZ7u30sKL4CQfHu0LBX6hziuzNYxLW6dNOsINHCi9zgVJ2zaq4lNxHdhoOOMOdFQk
         vBzGvHXsR5IP3f48X75jg5rVnSsLvk7aYxjSzEHrBq2H2ZT3XF/RN9mAdqLulmd8kNM3
         jhSUKMdaVbAY81EetlYCCz5llT2fBqnrTrhxQnMJ4GCeY3LK3GljZJMhgAR2bJdvgg9V
         Bvgw==
X-Gm-Message-State: AOAM532c0iH5l7lZYU9pF9N0Zzj/sFvhB2sTIWduCkGDS8UY2TDWKlM2
	Tm/W4OG57WREUKpoQJdaVCV7qz9N
X-Google-Smtp-Source: ABdhPJxroFemWincnjHTck/xixrrTgBKS9AkDYe1kZFzIv5PJI1bbacz9+QfGCPkdTk09T6uDhvGGQ==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr22309899wrv.310.1639249912021;
        Sat, 11 Dec 2021 11:11:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 19/26] hw/intc/arm_gicv3_its: Don't use data if reading command failed
Date: Sat, 11 Dec 2021 19:11:28 +0000
Message-Id: <20211211191135.1764649-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: UARQKaO3Y5wc

In process_cmdq(), we read 64 bits of the command packet, which
contain the command identifier, which we then switch() on to dispatch
to an appropriate sub-function.  However, if address_space_ldq_le()
reports a memory transaction failure, we still read the command
identifier out of the data and switch() on it.  Restructure the code
so that we stop immediately (stalling the command queue) in this
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 32cf18c10af..f3eba92946d 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -670,8 +670,13 @@ static void process_cmdq(GICv3ITSState *s)
         data = address_space_ldq_le(as, s->cq.base_addr + cq_offset,
                                     MEMTXATTRS_UNSPECIFIED, &res);
         if (res != MEMTX_OK) {
-            result = false;
+            s->creadr = FIELD_DP64(s->creadr, GITS_CREADR, STALLED, 1);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "%s: could not read command at 0x%" PRIx64 "\n",
+                          __func__, s->cq.base_addr + cq_offset);
+            break;
         }
+
         cmd = (data & CMD_MASK);
 
         switch (cmd) {
-- 
2.25.1
