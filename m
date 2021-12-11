Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583345lfk;
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
X-Received: by 2002:adf:e84d:: with SMTP id d13mr21663264wrn.72.1639249904518;
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249904; cv=none;
        d=google.com; s=arc-20160816;
        b=kNbdZ/zBO3Hf3FzT/YJWOdbQYXpi0o7mWi+SwYV7wn5BsaRL1F0DlcmJmWvLu2BRFU
         oQaOvnjc18yefCtnge7cqQl4tBkvxgHfj6CfWnSZkZSt4QUWF1oqDFusdsm1tSakYjbt
         dc/C+BMkFJYr4fisMJCo21NY3kYfCxLVTR2CYWlyD6A9p4jgKqZ9XWLhiFGaRY3IgicW
         xNYT4Efv1IhjM/h1hprMRzbvvSfW8qEa929jz35Y56D1BNwIvKwl/7tvjDWis+HaTsIv
         wKL6PYg74/QOUoq7MsBRNBvHvpLv9d1cc+guhqOkfz9bpo7iVL59ey9fivJuZ6KZeAtR
         ux/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S9WJzvjYpmxgrrlt3qCuhlC8wT1kSr5boBWat1KdIow=;
        b=cR6CknZznijIcif6cbGVOSOyup6zE7n2PpHsDcCKopUDSxdK0kFCisW7TOyNjFv9u9
         UA4XlobdC+FbfEw4A57jFtRzbd9pYLC/kkyXztZTTokFvxndrWuKAqTWXnZ1ZPmwf0jW
         oCo+lwlDPNfI2yBURuD72ycA9RsWiytCL90b85oMUjYh0Ews+1QfmrkipXo0GsS+bokn
         XG2O4p2VhmumeyaQ6+jmDny+VPFxZITUSNNa3Ts4E18TFvgWOaUD+3HamAnGdEBSI6tJ
         KX8yslx+ZCAvPoU408E2WXDMhNCNUK38RkqDA76AcO0Db61M9Q3k20mjvhR71NAL3u88
         dfgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxe0y0ON;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r27sor4189988wrc.55.2021.12.11.11.11.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vxe0y0ON;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S9WJzvjYpmxgrrlt3qCuhlC8wT1kSr5boBWat1KdIow=;
        b=vxe0y0ON6PrAIofFTI7Qm7PievJd1al2ZIfvUU29qc4djOQTDr2K2EM3+sKogoq3P9
         k2hQSJGyfdYchb6dtsRA61eDscE9BgXeiYvSoocJSfvhSk+Kar8O6lVIsr9a02nkIHu1
         iToEcJk16ChoUoLfiZX/bvJ7KBBr1iLFxaRyKv62uYw2FaXd1O10qsHELtZzU0qT7JKB
         6ATdRH2/dK/L02hfg12A1KnFEd9if20bgXVAyaCTN4FmfAPPwqukbkxdnP0Xgskl0zr6
         nGruDU3VOA2vS1s2ViSxWi9iJNhNaGjAnAFbfXrQXwR7CNOvSuJ53/ug0/ZKI1RNsLmL
         JaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S9WJzvjYpmxgrrlt3qCuhlC8wT1kSr5boBWat1KdIow=;
        b=4KMUtg+/hNqkLKK0NInvTnBSVGGOOPcQ1hPII2OTM2ye145WMkMToeaFaePDaJv9Wq
         uU7OJEY/tRGHmJEk1xk8eKwVihpmljqr0MAdQtJnOiMIy92xQIl2I3CLXCLTUoWoWjnd
         SUz5eFw01kxEorUw7ibI92MuH4jCFhAeGS0iykYz2HY7t8QdJs2sgTpDSdZf/OdMPsdU
         E8ZMHdHUU7FA2TtVOTv0muy0+QaWiPXUqjfY/iBEtlIlbeCMLMmD8SN9IYxo7tC/y16/
         qHRH/6ChP3jAgUqHxB0qiwrr8unIrJIz0/k2woi7PFfdmytqbd4vOEwg6sS6nSEjx2Vi
         KqSQ==
X-Gm-Message-State: AOAM533BO/J336BiJp0bWDmHEXnauhqx7YBATuSQq7oL1yfaGaYCviZw
	QgLj60KWQPA2zLAk5fkswL1hqjP0
X-Google-Smtp-Source: ABdhPJzO5qTPLmYg+Pws3AkOBBGpxbLgfRrUOoEZy7ZZTrLy8BGnNgcur3LhpvVbOEF/2MJg/PDPJw==
X-Received: by 2002:a05:6000:1a43:: with SMTP id t3mr22220223wry.555.1639249904279;
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 07/26] hw/intc/arm_gicv3_its: Correct setting of TableDesc entry_sz
Date: Sat, 11 Dec 2021 19:11:16 +0000
Message-Id: <20211211191135.1764649-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: AM/LjwALWpxV

We set the TableDesc entry_sz field from the appropriate
GITS_BASER.ENTRYSIZE field.  That ID register field specifies the
number of bytes per table entry minus one.  However when we use
td->entry_sz we assume it to be the number of bytes per table entry
(for instance we calculate the number of entries in a page by
dividing the page size by the entry size).

The effects of this bug are:
 * we miscalculate the maximum number of entries in the table,
   so our checks on guest index values are wrong (too lax)
 * when looking up an entry in the second level of an indirect
   table, we calculate an incorrect index into the L2 table.
   Because we make the same incorrect calculation on both
   reads and writes of the L2 table, the guest won't notice
   unless it's unlucky enough to use an index value that
   causes us to index off the end of the L2 table page and
   cause guest memory corruption in whatever follows

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 84808b1e298..88f4d730999 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -829,7 +829,7 @@ static void extract_table_params(GICv3ITSState *s)
         }
         td->page_sz = page_sz;
         td->indirect = FIELD_EX64(value, GITS_BASER, INDIRECT);
-        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE);
+        td->entry_sz = FIELD_EX64(value, GITS_BASER, ENTRYSIZE) + 1;
         td->base_addr = baser_base_addr(value, page_sz);
         if (!td->indirect) {
             td->max_entries = (num_pages * page_sz) / td->entry_sz;
-- 
2.25.1
