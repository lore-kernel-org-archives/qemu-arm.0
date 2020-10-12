Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1152342lfa;
        Mon, 12 Oct 2020 08:40:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxh6wOjR9hpdBlWFD1sS0EFWF4YTytFqQyIpROnt2rfN+u5Egk5WcyGBFsMEYxKGo7C7Qft
X-Received: by 2002:a25:2e01:: with SMTP id u1mr10215168ybu.461.1602517245718;
        Mon, 12 Oct 2020 08:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602517245; cv=none;
        d=google.com; s=arc-20160816;
        b=sWtqR0sXN4yIfggrWR/xde0/pWE/EjctTIi+9imuvf9FtZNyLVg/YcrfumslfK20XU
         qoxnRb9/i+36mEa55yOplG1yJgd3HwYGSO5JxEk4tV3Fa1pR5aVNYIgKRN1MN7aaxqfC
         VxqfcBKD/pdcpN/3IloOEpXkv6dYma93nHaqdYIeDqVoQ9hzrGKxkUwThqOKGUgkOcEU
         GTRUPhKcmMHxyO7ch/vlHUedn38jDbzZpbNeItfwB22S9a5bxt/C8QCHrrXGP1NzSfM0
         5YPcwXqTcQXRGBRlmttJ+Mfeb9JGvuIqP31+j6c8yYTUlptIkHWnPyvvY67F1vGYwGHS
         /1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nB/5rC0VVxktBcVawvErd/qrg+KIJA8SmLqeHRRk/Lw=;
        b=vALnp/wum90EInU9U0ImNUG2LE/xtJyo6gB4+qPL4zPlFOgf7R8zOLfhiq6B84uU9t
         +tfmxsFQYqcuJKiXkZD5rpOGziRw7Y0C3TDgbADeCNQuEhIcGTRlBP9eH1BtFI36PM6c
         +eh8W7vX4tq3BHjR0nQzSnxpGtccP848hVP7YaPzVKAgxzf7Hwv8xSpRmWWL8AmuIiEF
         4dqsqbmCD8A/R2W6p8xfhYVBNYCOTuQiIyoRrwVw2yDsUfhRmeI+PjXe0rpok8DVtkdy
         90cD0nDXmc8kLv8sAbaCsHj0WsvD+GxfzlVt8jQHVMpj6deFgkmbpKinSBVeQG/rUzZC
         xqYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlR3bQta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si1769752ybk.191.2020.10.12.08.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 08:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nlR3bQta;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRzwL-0006VW-2I
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 11:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqE-0006lA-NP
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:26 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzqB-0007HF-Fj
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 11:34:26 -0400
Received: by mail-wr1-x443.google.com with SMTP id e18so19669344wrw.9
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 08:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nB/5rC0VVxktBcVawvErd/qrg+KIJA8SmLqeHRRk/Lw=;
 b=nlR3bQtaTb75A/+lOyljTxIX/zlzaBrk5N4K5biR8DgXFQPBFuHCuJdcnoAtLSneTD
 BnQ/UzVz3K6WXDVxbQwbFcIou5Up985dUHnpwODSDJ577bFZOQHIv1H71KXjufL5G0CT
 YPjdTFil8NBC5lNZ0u28aSApEtCrZ5a+xSYoISzRAzESmc9JBTXH8eNKa2HzFONgTkvf
 PxYfAHgSyf/hscCblsGfQWn3NWV0Dug2uraZlwYZm9tFZoHvUFIE9blC5xryb0UUnS/p
 ijRTimX7XPVgkc71V9o0SlowpeROPT1D0wb5T3BVDaKKY2QrLroaCoyS7hd21J2N2Q5n
 2IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nB/5rC0VVxktBcVawvErd/qrg+KIJA8SmLqeHRRk/Lw=;
 b=s8GWxLAHZHBTrxAh4Qxvnp/AGoWe4JaBv50eZq7yP1dT/RDqF6mOrPAAfSzcukWgF9
 EF9yvlxQdr3keR7hJ/fTbfwN9U2ES8A9rULJOm8xbY8qnO/rQlDvZ1FQzo/JW4zYR3BB
 NPDJ/4eV/wx7e9jd6luO1DRCAqphixuIyP/yF9vzBHE321dfHxKkFfSihrP2b1N0UNVQ
 HJuaY+RQeB5gkMwSwL9BJj9AFU0M8JY/RKzrsm1JhEc1DopzfAiNhF8M/QhmhXgdK5FN
 VHm2dIm4qabRzj8ximhMeIX5jVbbb2nalLjlahg66AslY1QDzoEUIA9UI3fJlqIbckMJ
 Keag==
X-Gm-Message-State: AOAM531aZFw+wf5flJs4FNcPfmR5MhwJ1LEfOuOpbc6/7xKStqkDhIO5
 13QiUGBnuHnVdPBSvyhUt5fABCzQ4DF3pn0Y
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr11113890wrt.360.1602516861968; 
 Mon, 12 Oct 2020 08:34:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y10sm19675284wrq.73.2020.10.12.08.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:34:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1] hw/arm/armsse: Assert info->num_cpus is in-bounds in
 armsse_realize()
Date: Mon, 12 Oct 2020 16:33:33 +0100
Message-Id: <20201012153408.9747-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201012153408.9747-1-peter.maydell@linaro.org>
References: <20201012153408.9747-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kCnQxJOucIuC

In armsse_realize() we have a loop over [0, info->num_cpus), which
indexes into various fixed-size arrays in the ARMSSE struct.  This
confuses Coverity, which warns that we might overrun those arrays
(CID 1430326, 1430337, 1430371, 1430414, 1430430).  This can't
actually happen, because the info struct is always one of the entries
in the armsse_variants[] array and num_cpus is either 1 or 2; we also
already assert in armsse_init() that num_cpus is not too large.
However, adding an assert to armsse_realize() like the one in
armsse_init() should help Coverity figure out that these code paths
aren't possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/armsse.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 64fcab895f7..dcbff9bd8f4 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -452,6 +452,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    assert(info->num_cpus <= SSE_MAX_CPUS);
+
     /* max SRAM_ADDR_WIDTH: 24 - log2(SRAM_NUM_BANK) */
     assert(is_power_of_2(info->sram_banks));
     addr_width_max = 24 - ctz32(info->sram_banks);
-- 
2.20.1

