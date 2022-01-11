Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800912lfj;
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
X-Received: by 2002:adf:dc92:: with SMTP id r18mr4582032wrj.584.1641921053796;
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921053; cv=none;
        d=google.com; s=arc-20160816;
        b=csUoHMl5nxWFgoT/2b2v3KVBl3DpLFaDkdutmcawAVASJ4pkUV6ceIl9h7m/qRXK+J
         D1JdOy+upEhW7gql424edM/1kErm4QjkvGD1LeM+gwBdm3Lo3KQuKqmWlhDU6orVqWkQ
         7vVZ0iu3vM6FTmUM7ZeRfrmNErup9jnLCPAhHPXRslNTeKTObSHjBwRZhEANVQKVufHo
         FhMQMaEMQ9fijx3dZgEhpMWoS3vatMTWfRD0kCUc7GfXE4hlGtvr+zCaST6/huvz8GIG
         CpsqeaEAaZ+LN5GIv5PelIKZOZpMIwnOe/Tk+xzGPlcpFlecavDy9wx7ybUZlUdo62rY
         t9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/jGnsJVkg/+ZfygtKsHgjGO+aK46tFljwLWJ8e5maX8=;
        b=FYvESxyl/G/IoNHH9FpK5SAgW2BSPihpzSLK19HnOvrXjqSCEyRZ2gy3jm21vf4w2Y
         l4Ky/G3QXGu1EHUrL5Jp+Ar6g7LeLKnGsaqUHw/nVacSTwoz0xW/3xgGSz/jXu/GU7Fq
         mH3dOWI6ZIgdnMxQKBrRKf/TtJ1mrpYyt/M2UDPchUu4JDokliJ9ErAyeZsQmgmWt6b/
         e6EuaA+kAVXCt9vhNbgJnWifxTRokGrcYwdfKSb58ze4zjdqxf81bQPhyuEqX1GHTXek
         /cDDWxEnJjMVaie5f1G1p8PGixN1P6yTc02D15Zpt5Lc36D9oK6aGJ2Lrg6RN10odZwJ
         c+7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWLipiEC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m15sor867307wrp.48.2022.01.11.09.10.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWLipiEC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/jGnsJVkg/+ZfygtKsHgjGO+aK46tFljwLWJ8e5maX8=;
        b=yWLipiECET/cot1mlylKu2t4xZrle1fGHWd8s6LzUC6OpEnFsU/tyoGmikcgFA8NWu
         QMRyydSle5YEo4JzLjYEQMehizqkz3+WAgxm9HcBmD9lAyA1RUDX5JFtejATwegvuMw0
         40E7hpizwFFW4nfp2CGTh7ni0nkwnbTMO2zHjS9JJPvs0fosZJxfy6uxZ44s95ANa2LZ
         rgrq9MiKJ99ZsijvsWMTiE7obSODLIOkFzje6DqFFHcCGhBOcO4mTKvjgoxTsqyUIMi3
         Wz8m5xjuh1EF9a6euCHw8SIvbkUdzzg5MOPuTDEVyfoE/lZgqkmxoztp74r8P8gB9ZHW
         PHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/jGnsJVkg/+ZfygtKsHgjGO+aK46tFljwLWJ8e5maX8=;
        b=YTH4fltG0ujDp0piUjddWdN6+lG+0OhpF7F12YKHLBJQ3b9fHgdyq8PggHjcl6ZgKq
         Ax/ym0/hqAEimuxMaPvZ0ecYi5RkGAFMCWaUl5FXe6pBv2j5IpfU8sSushZui3h1hxXc
         6pP39KcXHXLkDPyAVG/KikfQg7FtDGS1nB2DF2hAiEKNoFcZpJ8XA9TyMbiShz5CZZh/
         n3IXLimta878ADuIw5FZfA881qifbQeXUeA/F2pnOV4VNaTdo3t6vsDMYRcaiLbH/UJx
         y0N2bZoteLxeOwvGVwOPQ+N8rart3/4cr1mA/b8zhg94Y5nwEKz+u7vksIXMZ21lvLAX
         lFdA==
X-Gm-Message-State: AOAM530R8KITdCZEVKMNf74JKRgpCZp5LU35SXD7Ck153CuCea/rV33P
	ZAcWeXB4tcu7sqEulnGf8nkHcIXG
X-Google-Smtp-Source: ABdhPJyvn6tBb6S5A9iO+h9I16uzPLqIZX3vR3VTFjJ5p2sq3b6yqdOodR4Dzky4E3Wct4LNjiQl+g==
X-Received: by 2002:a05:6000:18cd:: with SMTP id w13mr4744849wrq.199.1641921053538;
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 04/13] hw/intc/arm_gicv3_its: Don't use data if reading command failed
Date: Tue, 11 Jan 2022 17:10:39 +0000
Message-Id: <20220111171048.3545974-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zFEfpqQFzLCu

In process_cmdq(), we read 64 bits of the command packet, which
contain the command identifier, which we then switch() on to dispatch
to an appropriate sub-function.  However, if address_space_ldq_le()
reports a memory transaction failure, we still read the command
identifier out of the data and switch() on it.  Restructure the code
so that we stop immediately (stalling the command queue) in this
case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index a6c2299a091..c1f76682d04 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -672,8 +672,13 @@ static void process_cmdq(GICv3ITSState *s)
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
