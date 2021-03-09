Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930568lfg;
        Tue, 9 Mar 2021 07:53:08 -0800 (PST)
X-Received: by 2002:a9d:6215:: with SMTP id g21mr1572064otj.80.1615305188129;
        Tue, 09 Mar 2021 07:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305188; cv=none;
        d=google.com; s=arc-20160816;
        b=MJFpxneR0LmbJ7mjlg9lcOJ3zcRcGM3r7XNgX036txmlsvdl3tLLOSKQL5dH0Ysekc
         6p1uj+pLz9PrVlw3JGIrGZtw7b3woFjjMePdT5rp9hkTWUxavb+/9VKr4qhWgbjfFGNB
         a2o1fJtgnNFAquVsZ2/CSMxhefRR9EzoiFyK4VnHDwr6Gqc6YC0F/e1CC2cho9lYbkQf
         tauTmq5NvrEP2zLDlgc2qChRmThCL0L47ZJbHndtv/kt0/TE8g2++KC9exBl9kEsd/uI
         Te4V7FpmMl8mmAQtT949vFTzwbHu/+b8IXjFJ5rDdTcklEF0A02OjS2bJFGoirFRgDHL
         PQBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=W14unbYsNxQ1Va38g+npA6Ct860YaOiFCU0ExYMrSII=;
        b=Gr5tFeJAXxxXNIkcyBl1iAQS70xtroN4+ImbO4GpcndepqbpGG/KhC5z/ULH/wodr4
         5O/C9ew03UOu3cNRrrjyHnK0jeMODrNC5xNDSBjT9rAXkIBWz/XuECdoJgIB1RrF/BSz
         NY/SLJ9OYmWd7x1Syqhpx3rUBd9h0n6805/0fM0/xZhMDeykSYQ6/deEkBy4qzb+iuPE
         fyISOCF3k/ZojiGlM+FC65hf+GUf/MklF3rC5DWkziyGX+GZCkX4tp2LgCVK0dFaxp1r
         mVigOANMJLXvdwLfScuzy5VaIalMW1tpriYiHrKa8q1/jOvtmInMmaRU4uZs7NBnrf48
         YVDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esD8E35Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z21sor2807707ooe.3.2021.03.09.07.53.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esD8E35Z;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W14unbYsNxQ1Va38g+npA6Ct860YaOiFCU0ExYMrSII=;
        b=esD8E35ZJqmJeIWUYcoLpnvh5fT950Ojq4nVPtntQ8u8Di+bwpvSpMEt+LIZipAXj8
         INigbQIIlKUIudUPpoJGb2hhf9fx+HvIQcPYnU0pjqphFzDQSkCWr50dfTABFUG3kQXL
         JJWnabYsxd90Gc2Vd7HImtnV6046eckNL0U74YrXl4oNS6tg96hnuhlDgYYpHPnCr3yo
         azhCeSPdNPMr4u/KXX3ybGM8A1ScgcYkqKK0E5+rFX4Fxqh5liO+ZJzfZ7m+b8xXYCsE
         CdECEI4orWLjLnBBQwzc38EOOH1L7Va4afQN1seJ7cKOKx538J6xdf8xLcPPTCTIONmL
         bXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W14unbYsNxQ1Va38g+npA6Ct860YaOiFCU0ExYMrSII=;
        b=eq6YmVcbK9EERikr1mNGUZP16D2eW0RJ6OfPEArCu6bsobVDd+UBlmxZ65rpDWDeHz
         tf4O+MwlV1+0/5VRrGPRkuPs/p2pBVYdwtP7jPbrcxpigcpcI3mlPVJ2BvSrFuLceubO
         4p7L7T/91bP14IA4kPxlBVo6gMc7tStqG54VpEOl5ti1++CQuzgXnLmzn0zvjCC/lRb9
         ZEb3gtXlkAz9tZ5MnvFEehFO9vdWGPCeEG34PpcZ5HTwQH5tdXeP+tByX59eG1mVCp4p
         xNUc5HkVOtDx7YDP1v8wiONA3iEw986tjWdq6G7J8PqVGc9LYXKtAxXPeQgkb9n6Ttlp
         Q7kw==
X-Gm-Message-State: AOAM5339u3HEw758kaq2dt9+MM2yd6LrNvQKyNu/SNGN+O6D/zqCR8p2
	oejOsD6tbvUw62ltbIzYrYlWFT68
X-Google-Smtp-Source: ABdhPJyPz/6JiOsB00tepMobuAYWqENwXA3l3HRCNuXCVH4Uiovke5F8XIe6YYrRoaEIiQVbQiZ42A==
X-Received: by 2002:a05:6820:129:: with SMTP id i9mr22618434ood.80.1615305187750;
        Tue, 09 Mar 2021 07:53:07 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 0/8] target/arm: sve1 fixes
Date: Tue,  9 Mar 2021 07:52:57 -0800
Message-Id: <20210309155305.11301-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wlyIw0gsltlE

Three of these have been hanging around on a queue for ages;
the rest are new.  The WHILE and reduction bugs were found by
RISU triggering an assertion on 384-bit (vq=3) vectors.


r~


Richard Henderson (8):
  target/arm: Fix sve_uzp_p vs odd vector lengths
  target/arm: Fix sve_zip_p vs odd vector lengths
  target/arm: Fix sve_punpk_p vs odd vector lengths
  target/arm: Update find_last_active for PREDDESC
  target/arm: Update BRKA, BRKB, BRKN for PREDDESC
  target/arm: Update CNTP for PREDDESC
  target/arm: Update WHILE for PREDDESC
  target/arm: Update sve reduction vs simd_desc

 target/arm/sve_helper.c    | 107 +++++++++++++++++++++----------------
 target/arm/translate-sve.c |  26 ++++-----
 2 files changed, 73 insertions(+), 60 deletions(-)

-- 
2.25.1
