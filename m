Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1511573lfb;
        Fri, 20 Nov 2020 09:42:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLLYFm+dG0MaNvVrg27k6eeP9W0p1kRGoILbnZXT21PqH1m5cTzjbUTO0Obq1FHqFUe2a4
X-Received: by 2002:a25:d2c8:: with SMTP id j191mr22988494ybg.367.1605894153544;
        Fri, 20 Nov 2020 09:42:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605894153; cv=none;
        d=google.com; s=arc-20160816;
        b=DqkUjmGaxATKTn4rEJrx03Enf25tCqEuL66ec96D/ntuYivM/2FH9AxHUSFT7vGZeG
         SfOeG0Mc7nkihZ9p22lATaGUzJ9YorqpcD0T+KLyDL8OFMsx0T2EHqjLjeO29Sqi0U4l
         aMoW0Mggu87yL37MXic9GlN1EQCdSXHT8ASlTmPYNRT1sN1bcFyPki22i+oy1TTpBi/G
         WxcnTGlqD57XdPUmY60eS/cDZD1Cg91rApuUXIU80Z3rOrNKrQm1bSFGUOBLpM8gdcBP
         Tw1/yoCW1dXgbpd+TceqCcGmrbwYEMsufSFab5sq3iZjW2DQsqDcP/+dKz9I9sA0+3eV
         6jTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OABk6K6bc26R5WIsV/6yBPJ4yrFC9XD+iI6MkRFetU4=;
        b=qk0YeKDRi79gxzdwg61jcAtM0f3fzkx9gajnF8g6q7hz2E9MnZMt+Ui+cgrUvYHHYH
         ibMfYkCK3q2elP8mLvDQ/5dRb25XjQPHt3WMjnKmPyi1asHiLmhWp4yN3wwaN6qKstVe
         juVJ3avbgIb8K53oZoYFTwnJUhPE8rrQvV0Nd//tYsxvK0GH80G2t9PjrM16v3Wvj93Q
         oF9P9/Q9nKngaM7iPoPlP1GuDc9AwD91Ky4Ti5gZM8RlGZteKEpp5cNLqaHac8AOAouL
         WhmIEF4HqJ//wUCQL/s/xV/wmfVeOPZiTL28sPiR/1dMG5LsxFAwVp+cxi+UuxFWR9Jy
         WP0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZSOzFx40;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si1999191ybe.90.2020.11.20.09.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 09:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZSOzFx40;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kgAQa-0003E7-Uc
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 12:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOG-0001gP-73; Fri, 20 Nov 2020 12:40:08 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgAOE-00048C-BH; Fri, 20 Nov 2020 12:40:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id p22so11093078wmg.3;
 Fri, 20 Nov 2020 09:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OABk6K6bc26R5WIsV/6yBPJ4yrFC9XD+iI6MkRFetU4=;
 b=ZSOzFx403xiEFdTM0BqnoJ4OIt+wtVwz6wxAgDJwOng4l6xLJeA43k3JYuY6/zC9Vs
 iNDFpmixDdk7TbFyXwtVGzlN3qklw/8Khq83TeZJ9mOg/iX1PvYuKHJ+R4HohdhbIuae
 G5vZRSKWMO7EBefhhTdq60HJHLmoMRcSsUOC/eR61/D77mqTOweVqFMvzyWq6rj+i1jr
 EW2T4Eg3ypytVqN3l+iyiHtHHXbbzMRrjdXxvn0m0qY69Bb1fFz7Io26hxOKOHMM9ElG
 +grwe4P8PwgOON4z+jqztJ2j01mAZbE3HF1LtWsGAHxdCubiMBkWOh8sz6ChlCWQCl5c
 mEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OABk6K6bc26R5WIsV/6yBPJ4yrFC9XD+iI6MkRFetU4=;
 b=G3+c39lRWlyJLKAWrEwUyt1ukL9us/9b3J0L4AP0nDah2PcIxH5OZcbA5Ll7JIFXgT
 ulBHu8jp3S/aj2gNwcqVxRM2uVIweBYtHjuDjgRTOUdkHFPr3hSSr84OG09MKffBYfCR
 heYw53SCY96jPwGNUoD7I3o4ZZ8q1k5MnICn/B5MreSLQVyqlsAoA/aWwSc+g/ZE/04L
 0ecvmMa2PMm+3QmpTbxnoiaOfjARRIJJVsi+BoSMwBzPDZYr5OJvKlXRl0OdKtw7stEc
 GdGox9BsiU3J+dIRRx6F3uE0kjKD/ZLJ2ikHHBsBZQrBZWB1rjX0MkihL9xtgUmgZ07d
 7Jmw==
X-Gm-Message-State: AOAM53229WH4EpBgqDzDhIXWWZeeZIQQ07/jh/neULUmLmHwYECT/7+l
 GYgC9qSqSKUsyx0IWNMKYzbUjOLMvzo=
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr11013909wmi.75.1605894000478; 
 Fri, 20 Nov 2020 09:40:00 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 6sm6571581wrn.72.2020.11.20.09.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 09:39:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 1/4] docs/system: Deprecate raspi2/raspi3 machine
 aliases
Date: Fri, 20 Nov 2020 18:39:50 +0100
Message-Id: <20201120173953.2539469-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120173953.2539469-1-f4bug@amsat.org>
References: <20201120173953.2539469-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Krempa <pkrempa@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r/MGuwqjbskV

Since commit aa35ec2213b ("hw/arm/raspi: Use more specific
machine names") the raspi2/raspi3 machines have been renamed
as raspi2b/raspi3b.

Note, rather than the raspi3b, the raspi3ap introduced in
commit 5be94252d34 ("hw/arm/raspi: Add the Raspberry Pi 3
model A+") is a closer match to what QEMU models, but only
provides 512 MB of RAM.

As more Raspberry Pi 2/3 models are emulated, in order
to avoid confusion, deprecate the raspi2/raspi3 machine
aliases.

ACKed-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/deprecated.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index d98464098f5..07957b47289 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -346,6 +346,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types are very old and likely can not be used for live migration
 from old QEMU versions anymore. A newer machine type should be used instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
+machines been renamed ``raspi2b`` and ``raspi3b``.
+
 Device options
 --------------
 
-- 
2.26.2

