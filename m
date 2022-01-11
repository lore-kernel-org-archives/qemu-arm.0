Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1801004lfj;
        Tue, 11 Jan 2022 09:11:00 -0800 (PST)
X-Received: by 2002:a05:600c:154e:: with SMTP id f14mr3470339wmg.126.1641921060153;
        Tue, 11 Jan 2022 09:11:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921060; cv=none;
        d=google.com; s=arc-20160816;
        b=kUCj/B2edVjPwshuih2Q3scWDyCwIFj1z9aV14kHOqmKqS5GdLKoqyEBIrqqiWqVUN
         DDp1321KCvOjiE6QPWflgzb03qOVOPzb8ku8t2t0UP1EFV8bX+Szy1XMnFMSqUHFyIlF
         ikFlCGZnSwoh3o7jm5UEFnf4kKkjdq7Q1t64Xp3NhU3wN7RIZtSc9PwHw74lBbh9+N99
         W+KzVaLYLz4RkZqVxscvBmPlG53arJUXo7YQRK5AX3zQ9Lsckuca74AjlfAcSGwNpyS5
         mvdVIBe1U8A5+bl2RDE0vKqAQC48VP7xXOcX5DfBbCq9TPihf6B2smpl9b71N1uhJhTH
         MNhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bD0PDqtOotm00lmQT/lZs8XVkkqOyVklOaZCqmm8ZmM=;
        b=hVNcxvESSGngVrVsRwUAcnJYlot04ivEWO4Q5ZdbLMFHird345TrDflqtIy6BuwEpU
         YpLx0rLa5LZWbWqzpKnp3yutCxrEDBuG1vXpoOYqDISzpqf1snuMPscWbQF29a9/ursR
         /J5GrPHXawzd7gHw1bGl4NdM617EczwJdLcMbHbXvBwa3SVXDmPbqjB+GHA5DeUaLZBo
         W90/PlVyfmd7Q15e3YSy2lRKHmOLUI6C8yZheP88gRJLoYfNs+UlBsW6fflSebP88ieX
         3nGcQAcuXhDGAbI0CJyq7i9LltOMuAmc9OuJnIc8MqeD5uuOTPY3UafRUUkzEZrpzFc/
         u0Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1eAfaZp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9sor5602048wrx.17.2022.01.11.09.11.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:11:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1eAfaZp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bD0PDqtOotm00lmQT/lZs8XVkkqOyVklOaZCqmm8ZmM=;
        b=F1eAfaZphieMMS6rwNRSadXE8oXaLTNK69dQf8YByZA/0xfinJyFTO4mtV8l+7RtGA
         +RwXEAQOq0F+jwLc7/U+CcScBu8+SaiVPW5C+thjq8f2dJtu09fdfYXchac4HJt3LNUW
         cKk8JldGCgR/J+Iv6Fh9MTtoUHpl4JEmzYoI5VdBQgJwjHPdcYXkPYFDJvLu3cSnCFdn
         k3jBTIS8/eKC5drfU0zkPY5vHB5o/3Ed62Wsi1CDs6IlL/rUUM2HLJFURBh+jWlDvB4H
         Tkd3PXjcqDI6O17E53WSce029r7oymx3rkdNSXO9wd5R5XyK+VoUqcBjtIl9iUEK7KBA
         sRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bD0PDqtOotm00lmQT/lZs8XVkkqOyVklOaZCqmm8ZmM=;
        b=6ahcwTGsQfngv+OXUguU2pfGWhkxaL926khmHKMTiKC8ScMhYbT+qN0JfZrAvNEs1x
         VXKTX6H/6LrnmjIT8ZnTyE2K8YxvoEO/fxeuyb1ccbiOAB6jXuuQ14actqrH7nVB/wS0
         ECJs92RVMJ5suPO06iRXJeQLVTQVcYibsSWWJqsW8cRR6ZKmrSIEnkjj17eqxIYpsk1q
         SDFEEiOzzQncMVFRh71QP47qOSeVwTjaY/+uAGgFgSycwUdl5saoSgRAD+NliH+R9zdF
         w+eb3YYkMmeO6DerGiXx7N8K0hkgxaFXmK2sK/kzpUBDHTaP38X8AnpOumAPl64TtPVp
         P0YQ==
X-Gm-Message-State: AOAM5337Z7ENJO4C/xJvJcqAATyk5cOYm0mTkPK5WEIBm16/c/2KhFc1
	IosoR8TNysNpTayFdS/+2jSs6D3s
X-Google-Smtp-Source: ABdhPJykDA7kA5IWu0h4RQX0vFDYTzyfOXYbLxTWO0HxsPRbZiE6YhSKnJFVYAUC568hZUoV+hYIaw==
X-Received: by 2002:a05:6000:1883:: with SMTP id a3mr4811662wri.565.1641921059907;
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 13/13] hw/intc/arm_gicv3_its: Range-check ICID before indexing into collection table
Date: Tue, 11 Jan 2022 17:10:48 +0000
Message-Id: <20220111171048.3545974-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: NrsW+UT3NH2/

In process_its_cmd(), we read an ICID out of the interrupt table
entry, and then use it as an index into the collection table.  Add a
check that it is within range for the collection table first.

This check is not strictly necessary, because:
 * we range check the ICID from the guest before writing it into
   the interrupt table entry, so the the only way to get an
   out of range ICID in process_its_cmd() is if a badly-behaved
   guest is writing directly to the interrupt table memory
 * the collection table is in guest memory, so QEMU won't fall
   over if we read off the end of it

However, it seems clearer to include the check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index ef6c0f55ff9..b2f6a8c7f00 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -299,6 +299,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         return CMD_CONTINUE;
     }
 
+    if (icid >= s->ct.num_ids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
+                      __func__, icid);
+        return CMD_CONTINUE;
+    }
+
     cte_valid = get_cte(s, icid, &cte, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
-- 
2.25.1
