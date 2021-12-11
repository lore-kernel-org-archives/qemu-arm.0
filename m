Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583274lfk;
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr25609724wmq.148.1639249898838;
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249898; cv=none;
        d=google.com; s=arc-20160816;
        b=SNB/HCkjlWMzbzhvCqZdtMfCyQHu3R8Wf7o9nhRM/R/y1MZQmnyvHraUJxAWK4coa7
         nhQNMssPadF4/2lNwFfxhaADho5lwLqAP08SOi/UbGz4vHL8RzB9JIDdCoCrmcJ9lJ4W
         zhNfkvFIzmv5zOKWTp+clAoeLPZXyEYqLij52F7FMAAaqV/na3twtgg4vgK0XjBtAXxI
         lytOlC1tYP0dyfrLGldQEx9DEvX5g6VxM9QeDuM1PCpr40aWi4E/W5ik5PvJGleDl23N
         Q4vluG3cYgX9jtWwgNTaEEpel5m3M0jOJsNFavgdYGifZXMMFcFzGg/8p2Thie6TUXtB
         ishQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ppVeav4mXzYSIyKy0Ag4TWya31OJHif0+sqVtDc4GRg=;
        b=iQslL7HL3P5mIUu80c4QoozpLA7PTBqUIu66tX9X/tgK2pLRLCmt9ECARB+kZbShk9
         NRWMpUhDy383Bwd9syqol2K3YzxgU9Jwc4nN34YEOAho9AGA3ON3gDwOgr5PJGNDT+zq
         dZ2Ohs3i4y5cAPTAMtTHGDSl2i8Ccm1sfw948mfP+kzj4Nul1Q62OE2Dbgax30N70I9h
         0wvxjQQ2Psp71pAm8Nts6nphyzl89mOzALLYu6fYjJej0YzFbzz5Ji92OoyfcxEJJc7J
         Z2wkUcMgh9ccfCA/CHo/qi6+9V2jrGML75EBwerNCSSm6J12pj+CVVmwgTLzehLA5xe9
         UFUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SK6ZRS9X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d8sor4187810wri.16.2021.12.11.11.11.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SK6ZRS9X;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ppVeav4mXzYSIyKy0Ag4TWya31OJHif0+sqVtDc4GRg=;
        b=SK6ZRS9XXt4tDvuCsNFDaVLjnt1IG8zeq52yOwR7oe7ppulb12b4Lh5Cy5aZbmgBEs
         7Z8H9p8DNFO83SKAc+VgE2DtZlANZNr3u8cC5k2UZKz0/eOM/goyqKKKe5k3DagYUfNY
         z7PP71qgjjIbj3iLZyMozT8oLC59D8JnmrLrIMCvSpwapyN9/zqthwxmV4/dK14PVcBV
         krK4IDQVZv9Q9DBPMArZswdu2qebVec9LnJV2m/4u6gJ+SxmeQV7NqtPGrQ7yWuM79ov
         ITZD35uW5+Z7u5VGtX2sRj5vOcXkEXnf2AtNhAVYVzjHQdeAQJofpWtZKwYi0vUnBxXl
         Q4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ppVeav4mXzYSIyKy0Ag4TWya31OJHif0+sqVtDc4GRg=;
        b=lVogZukzrbAc14649XJns8HdiDGI+JyWpbhuMz9WkubWESmHFYR32uE2W4jpYITO5c
         EmFnO+PON6unpybkahPT6nKSFAy1izQ1MU0pUJ6T9/vZ9rTGtHtQ8Z1u9N9BrqpgoRW/
         uZgasL6JyAO2LbN4ZnkFGC0M97qH1JzqW1JutMPghugL6jtBAQRfxSYu+EiQTWfYXEeT
         oLF58mtCBY6pNrPzbq6NCvsAuAXgNbWNDzFZpXfGIJJ5VtUUMwqKUYbuJuDb8rK0j+4G
         MjhpV+awfLHlIbvwqMDdA45GgrOR8nkjcYG+liM7gXsVYFc3WfvIpdOsH35uv4nUknfB
         ssRQ==
X-Gm-Message-State: AOAM531Cj7zgbcXScuB/iFPnm6DlfRueoNwwZ+nZTVdplYY+Xk/tdtMd
	AOnDpERbvq20EZ+rJAs/x6MptUVo
X-Google-Smtp-Source: ABdhPJzQpQKmgNuw7Xu6mAtaDJfyZ71xps6ctMsy4OlaZqofgW+vQdd2jfmoYhWY6a7hGvgPvjjHgQ==
X-Received: by 2002:adf:facd:: with SMTP id a13mr1952851wrs.513.1639249898527;
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 02/26] hw/intc/arm_gicv3_its: Correct off-by-one bounds check on rdbase
Date: Sat, 11 Dec 2021 19:11:11 +0000
Message-Id: <20211211191135.1764649-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YXUnds9FZCEw

The checks in the ITS on the rdbase values in guest commands are
off-by-one: they permit the guest to pass us a value equal to
s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
meant the guest could cause us to index off the end of the
s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
would probably crash.

Cc: qemu-stable@nongnu.org
Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a security bug, because only usable with emulation.
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b99e63d58f7..677b96dfe23 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -311,7 +311,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
          */
         rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
 
-        if (rdbase > s->gicv3->num_cpu) {
+        if (rdbase >= s->gicv3->num_cpu) {
             return result;
         }
 
@@ -505,7 +505,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid > s->ct.maxids.max_collids) || (rdbase > s->gicv3->num_cpu)) {
+    if ((icid > s->ct.maxids.max_collids) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
-- 
2.25.1
