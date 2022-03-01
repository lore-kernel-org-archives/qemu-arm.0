Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp209696lfo;
        Tue, 1 Mar 2022 14:00:03 -0800 (PST)
X-Received: by 2002:a05:6a00:781:b0:4f4:2a:2d89 with SMTP id g1-20020a056a00078100b004f4002a2d89mr14792229pfu.13.1646172003357;
        Tue, 01 Mar 2022 14:00:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646172003; cv=none;
        d=google.com; s=arc-20160816;
        b=y3f4yLzrpqiDpAWZPjkf6qDG2/Fvo/vTZspfPD8zaEzvobw1XyrQuORKMW4VL4dwwE
         +o6qCRqU9bBdGldJn+y8JaoqMAUO4XykDU3sASM3KuuRSfC/sg4KzWG82RgUmk0dmtWw
         9+NwtG8TOG5VEnz8xw2RtbgR5/+8DSVQfhPU3VYLq1284F5fsLuBGRuccvSDPe5mjWfd
         9E5Me9pFkUlMQIuneZq5KhtoapxC4al4qyaQYVWCzRvHPF5t+gJssAvEDgdGwsvrxedb
         Ia5rCG/ntMSdQ6cw58Lz5BScW7KTbOlcr3hUvSlRhXNoTJIKDW78O4hSdLcGTgrj96cM
         OyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=nBgqnBpDKAOsE8lohN83YaUKejXbXKlcoZLgP0jJ54s=;
        b=ezuWQBpp52L0UQKMiDR2OCXrtWsOyw7cu73J8P3QAy0s4CJwzALGt2seB49d8ZRDzD
         EWoTRySXCceG3aRVYT4YHe5wjbwObv7xjAw6yCUpRpIryGBCzq5BmWc8GgHFimLG1cyR
         2CQ/IW0coRyn1XqzXmV9V+79wKj3qYiUM7fDXMl4YA1OWwSIdPcHW+6evW7exQHQcd2W
         YVIv/xcGOk6EMPrXCr0CWNNPfc54FdhCb7wl6eah/PYwQAfE4Rjphq/NcQMpP95ahO1M
         IK5tmJ9/I02Aq3/UQ4CpfY9jBS6G0VqB7LOl9ra8eVkqcOk2zNpYG2YalWulz+KNnc1c
         b22Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiTXlaSy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ls6-20020a17090b350600b001bc5a81b255sor6679802pjb.30.2022.03.01.14.00.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 14:00:03 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GiTXlaSy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBgqnBpDKAOsE8lohN83YaUKejXbXKlcoZLgP0jJ54s=;
        b=GiTXlaSyXrdGwTePY0LvPEgDRFl/Iz/rjUEskyejyH/fQY4KYe0yi3Z77/PYxFlgBL
         fstpsG7iYQlDaCyMtmIHrtWgS8jYz6zwvGukVmSQWQ0KDkPotRxZAAHQkis0Tz/5p+C2
         Xc/kfNvIt2W03Sk+0qrgPj1m1s4U9y6A3f1EqT5T3/Bm5GhQ5vS6AmqIQCoo6M9uRuGP
         jgFzIkS3NGEvxOrGUcKCRYwMzIh2qGBDQ7yEvsBFdg1J0H7aTNAEHlHEt6atkTav3blC
         N+zjG0G/8lbitCFfStxlk3oLk2EgbrED3A2nmYM9rRPzb3W+UG/372GB5oMaVZz1ZISD
         lB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nBgqnBpDKAOsE8lohN83YaUKejXbXKlcoZLgP0jJ54s=;
        b=OL3z0RcsmZJsknSEzXDRMpLAfufLxpKsMD1pDKNgz4ZyRtVPV1mGbAYIPDVyy/U16l
         F54bQq4YHVKX0odMXX9inDRE5YQRkl+KdoG3NHhDH+5L8w08rlGTtZI8bNGPUx9IoIQy
         OqgmNQs9O+8k9DHLkdsZVPVp7cW8Y2F7FKIX635f7KjlFl/iTAEmmxp30XtVoPSZe2WZ
         DIZFT+eFKtvVYsvO7vASU+UeD4ZB6al56M+gBzPVSq4s8R1KNxu/PLR6zrGloVa9gq8B
         YGMqnUnk6EUQgEj+dKnWA9h6/KTsaUabbDlRGc7LwpU5hAtcgcCmGt+NjEVHCazCA1+a
         oYWg==
X-Gm-Message-State: AOAM531RP3GrklHLopFsK9tr3RxBICgLxcKhH8o0tQSwnN8qWsxjEMLq
	iAdbcqfGZr95cXoKz/WkdxBpfbKoAP/vYLZS
X-Google-Smtp-Source: ABdhPJxP3SBTZFGg9t03VOD9XFJp/oYFudYp+zQHJ1QguYIJa2cRHLTvl3ycagKkqLME/us7MjjTfg==
X-Received: by 2002:a17:90a:19d2:b0:1be:d815:477f with SMTP id 18-20020a17090a19d200b001bed815477fmr5911405pjj.23.1646172002761;
        Tue, 01 Mar 2022 14:00:02 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 14:00:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 00/18] target/arm: Implement LVA, LPA, LPA2 features
Date: Tue,  1 Mar 2022 11:59:40 -1000
Message-Id: <20220301215958.157011-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: I72jl15ERJ+z

Changes for v4:
  * Add cpu property for lpa2.
  * Disable that property for -machine virt-6.2 and previous.

Changes for v3:
  * Update emulation.rst.
  * Split out separate update to ID_AA64MMFR0.
  * Hack for avocado.


r~


Richard Henderson (18):
  hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
  target/arm: Set TCR_EL1.TSZ for user-only
  target/arm: Fault on invalid TCR_ELx.TxSZ
  target/arm: Move arm_pamax out of line
  target/arm: Pass outputsize down to check_s2_mmu_setup
  target/arm: Use MAKE_64BIT_MASK to compute indexmask
  target/arm: Honor TCR_ELx.{I}PS
  target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
  target/arm: Implement FEAT_LVA
  target/arm: Implement FEAT_LPA
  target/arm: Extend arm_fi_to_lfsc to level -1
  target/arm: Introduce tlbi_aa64_get_range
  target/arm: Fix TLBIRange.base for 16k and 64k pages
  target/arm: Validate tlbi TG matches translation granule in use
  target/arm: Advertise all page sizes for -cpu max
  target/arm: Implement FEAT_LPA2
  target/arm: Provide cpu property for controling FEAT_LPA2
  hw/arm/virt: Disable LPA2 for -machine virt-6.2

 docs/system/arm/emulation.rst |   3 +
 include/hw/arm/virt.h         |   1 +
 include/hw/registerfields.h   |  48 ++++-
 target/arm/cpu-param.h        |   4 +-
 target/arm/cpu.h              |  32 +++-
 target/arm/internals.h        |  58 +++---
 hw/arm/virt.c                 |   7 +
 target/arm/cpu.c              |   9 +-
 target/arm/cpu64.c            |  31 +++-
 target/arm/helper.c           | 332 ++++++++++++++++++++++++++--------
 tests/avocado/boot_linux.py   |   2 +
 11 files changed, 425 insertions(+), 102 deletions(-)

-- 
2.25.1
