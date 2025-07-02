Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3739167dye;
        Wed, 2 Jul 2025 04:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1tDEJ0TWsEBLI+xkF1BWh/jFPRM624cD2fRZqgD8uFHZCkq0LJdrhHyH4wPuilwvqi3c1ipiyMg0X3w==@linaro.org
X-Google-Smtp-Source: AGHT+IF9zPqga1Hw12oJcP/JGUVMUhHHqAQTcy5YABcCn2D2XBHY8osx31SHjxRIgZmPCwBoam68
X-Received: by 2002:a05:6214:20e2:b0:6fc:ff18:87c1 with SMTP id 6a1803df08f44-702b1a3e766mr33394636d6.2.1751455320871;
        Wed, 02 Jul 2025 04:22:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751455320; cv=none;
        d=google.com; s=arc-20240605;
        b=Cl9cBZuxl5VQwZn3GvotJCNSSl+tjahY7eW9gD82lyukaXfuvjJlMfbSgmoc0XfX00
         fMSEBzINej9oe9XZnFBn4zCv0cnG2WvcXRHjnrJ8F7ge+czGl4FK9jO/fvaU0mWm2MLY
         Le1eQB8bB2fANr4XFjkff5rS3ipWKR15qp1a+69narxy4K+9yfTNONujM1i6zE3pOlXF
         BaQ4ND3OYnKusTXRowAO+MqdoSE7ehHvTY0Ot5yfEi00AmMkE1K1flBifmbWZ9MbOZpi
         eqQ7n0cYShIS9gaR0TEUuoBNoJMGvVC9/BcU8ZuRBTv2sRFH8v9Uzko0/NwDrFHj0rIR
         PsnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=O0ByKFDEnvOXePq3mkrkrxN2U3dNnwCIbTeoP4rxgL4=;
        fh=3hUJUgNPdDnwLxTeCA58BSrK6ZbJQNJAKJd5n6uQwJw=;
        b=GaSvzdeiHow4QZMpJp0VUDQQ4C41ShcPtzr2RXiNLUeAK9bVSPwM6QryE7VM8tw+qf
         lbdRR0tIPgBc/BHkKwWXoSF4yMhthG9ZbRg88nhsWOeQEyBihqRnjksA1UmMpJGUfsgv
         OslNlsFHlWuvIl1SM3yBrByp1AlGkU8ImM7NDT7XAl9Lvhi+c4dbLLbkK9OOXU3J7sDm
         lhAzkG97arPJsQWtpWJkbq9777GgUddR0AEme/3FwMsObheLkfLlY1WtLnA6RYAlQiIW
         aXy4FL/XLw3cluq9k/FYz9yZdHKLsSN+yKuG0ANk+5ekivOVB7//67inRxMGlScu5091
         VyLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmFkqkuH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7738d86bsi136283756d6.425.2025.07.02.04.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 04:22:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=BmFkqkuH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uWvVY-0007Rh-4y; Wed, 02 Jul 2025 07:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVV-0007RO-PP; Wed, 02 Jul 2025 07:20:05 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWvVT-00022y-NM; Wed, 02 Jul 2025 07:20:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2363616a1a6so37560405ad.3; 
 Wed, 02 Jul 2025 04:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751455199; x=1752059999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O0ByKFDEnvOXePq3mkrkrxN2U3dNnwCIbTeoP4rxgL4=;
 b=BmFkqkuHqw4EvFAYsdDFQhR6OeBWSeHnNXNA4TitGyiEimqB6vkE8alPBrCMtKbvkF
 Q5LFjqYponwgMG2RMZIEdoDt9EkQo67fYk/vJfkF6J7gmuLAQtk86mrZFWWM5W/VxHFd
 Cux8GlI4yqqz5qLh01hPWqM4+EVnk33BefgdVZX8liSI9Kwzxj0IN+OcwmN6vgnnATYE
 /9whN1EMQFVYaj9eahn9NSyr702pgMoGJgOO1XmhAtncRKpcAYTUwT3C6WXjzMZLvmBM
 IjjexBRQH2heey8RkyoEJruxsSFEoqfLXFqySL2ozVVbiQUKMLbAB5AVctdaIjBlB174
 NuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751455199; x=1752059999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O0ByKFDEnvOXePq3mkrkrxN2U3dNnwCIbTeoP4rxgL4=;
 b=uVmRnbTSTke4/3jI/Ax8UiFWMmJl2Dd4ubpVtKirKQ0kzeU9a0W3He4Xk6eHXEuzlQ
 XcBDK9DuDUDtF5Uu5N2azvkB3obz2g7iEHdfvOeZiiY7YfuzxcX7B27b7jPQPuK92wH2
 Y/Jo9hTAiT1y3ageTj6MziMqw49k/7LezuckivrJbbMXMEX+ifnykxs5dzChUm2xOmMf
 Bkb1Su9UeZLWgwRZU+DRXpmhCwJennA7X470R+IdfzzO4eb0RAw0m92DGEXQ+eWVYnCe
 Ubm5kpPFN3Rdy4OEM2iCFRb0wazmKNevTMrgN7U8Z2cHbF8ekVyCKiIhodLgm6TIcDp+
 /KhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUw6u8llV4BsdrbJIzxK6u7K6MK62O5ZN8HuSsWpQ4adUPjn9jq2sAah9GMun4XuPQpdoZxPF3M6A==@nongnu.org
X-Gm-Message-State: AOJu0YxAtiv7ceOBQuYoYrNZoClls5MTyL87aY7UdBuX8J4vd4PxXmPr
 Vih2tt67xkrw0mKlBAk9ynuFGbXduHIfixfSKGAh8+vnaBjdDHjLE8VZb1Jmv06cVTM=
X-Gm-Gg: ASbGnctiHZfwOyR8BK0vOqb9wwPnHsPmeTHCGmGmdwf2CMYEatWPt75J8rAG9lcLMlk
 ePURz/gUWeAlQ1qLCwURvPAeds9qc26HG8A9/0OTxoU6tvbsBew75XusIs1H0593JGUmJeq9CJ3
 Lr9hmHe/mo5LZem51WCbekkAh+Or9gim0uF8DRc2bcqX19vDyxaVgir/F2uIh4ToLGXnah0hYdu
 CeZveGYm3qHtwVJG1GA04fUrKjEMPiaquw+PON//6xw4JGcnhZuEPEs2TkNeQCzIqtqvxXWsg8p
 ufRj/ISkIcRgtDZukCGXntvQfXCthI7eFRP4lEHD4DWBD/O7UHwjeYVJxDcXNARDq074eyBN6pv
 BfjjQTyor2RTYT1/DiCzybQtd9YULNnDLrH7doZgfJSQ=
X-Received: by 2002:a17:902:e805:b0:234:e0c3:8406 with SMTP id
 d9443c01a7336-23c6e48b6c8mr34712205ad.1.1751455199317; 
 Wed, 02 Jul 2025 04:19:59 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-23c6fe31933sm12578195ad.220.2025.07.02.04.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 04:19:58 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v3 00/12] target/arm: Fix M-profile helper loads/stores
 alignment checks
Date: Wed,  2 Jul 2025 20:49:42 +0930
Message-ID: <20250702111954.128563-1-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jlSii/GIOvYD

Historically, M-profile helper functions in m_helper.c and mve_helper.c
used the unaligned cpu_*_data_ra() routines to perform guest memory
accesses. This meant we had no way to enforce alignment constraints
when executing helper-based loads/stores. With the addition of the
cpu_*_mmu() APIs, we can now combine the current MMU state with MO_ALIGN
flags to build a MemOpIdx that enforces alignment at the helper level.

This patch series:
- Replaces all calls to cpu_ld*_data_ra(), cpu_st*_data_ra()
  in the M-profile helpers (m_helper.c) and the MVE helpers
  (mve_helper.c) with their cpu_*_mmu() equivalents.
- Leaves SME and SVE helper code untouched, as those extensions
  support unaligned accesses by design.

With this change, all M-profile and MVE helper-based loads and stores
will now correctly honor their alignment requirements.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>

William Kosasih (12):
  target/arm: Bring VLSTM/VLLDM helper store/load closer to the ARM
    pseudocode
  target/arm: Fix BLXNS helper store alignment checks
  target/arm: Fix function_return helper load alignment checks
  target/arm: Fix VLDR helper load alignment checks
  target/arm: Fix VSTR helper store alignment checks
  target/arm: Fix VLDR_SG helper load alignment checks
  target/arm: Fix VSTR_SG helper store alignment checks
  target/arm: Fix VLD4 helper load alignment checks
  target/arm: Fix VLD2 helper load alignment checks
  target/arm: Fix VST4 helper store alignment checks
  target/arm: Fix VST2 helper store alignment checks
  target/arm: Fix helper macros indentation in mve_helper.c

 target/arm/tcg/m_helper.c   |  33 +--
 target/arm/tcg/mve_helper.c | 390 ++++++++++++++++++++----------------
 2 files changed, 236 insertions(+), 187 deletions(-)

-- 
2.48.1

