Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2056044ejb;
        Wed, 21 Feb 2024 09:17:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQrvKkw/d3WqY5wgRclhgiGfi7l013BGkZHA1x6lNS2W9Y4+Gjms+ROzShgwisxY0M+wKrPKpHMVLg2WCOWi3CrJi0LaRi
X-Google-Smtp-Source: AGHT+IFmGwBSeU66B8zsATpiPg1hRVY62UjenrQXjcC3yPyrDrYyRUvcvFXQ71socXgl6e2+Cads
X-Received: by 2002:a05:620a:4483:b0:785:d568:9ce with SMTP id x3-20020a05620a448300b00785d56809cemr23301399qkp.7.1708535868730;
        Wed, 21 Feb 2024 09:17:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708535868; cv=none;
        d=google.com; s=arc-20160816;
        b=t6o93VlfI0XQ2YfXVZTWK01pFRXl0noX3nDqBOrW6dDqJpFcn8RBNR6NdfeQ/QZrcb
         tVwD8+oB25m4t77FYZ6nqC61G/ngxEjvjKlDSd4TBh3SJmTxif7w/xIJ1dCXrgdxOjCC
         9SRO/vSPyfkYHhXXNP0QgvJEdksAgeVT6PYuEJArDidt/EIExwbrSTjP3UvPpkfYnzxD
         YEoHJSCiCvyXULuao1zARXf06xfBUi1UHPNILbyix1SJrLRRqTsEwOj4mR8ZOD9HouE1
         HgoIN9SNJQN0fZ9y4+CkXqfjZT/5sroeCAqmlu1l8k+/WgNchq7sYcEg7ZlREen/7X/F
         NPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=LdESWrhZSTXfzqZQoBtj0qn4uDZe1pLjkAyWgBYDPNo=;
        fh=zNp2EAj9swJofbfdsbnPe/VjGAuGZFd12mWvXxWqB6w=;
        b=fIHunXX3EYG8GMrGCq7Ic2Ku+YHPuad+5qu6+2OvaxPrDSrTkfRk8GJhDOcwjA7KCG
         ksLsXSj5wKnzjV8Fbv3yHJbKwk68ugo744uR/S6ybMj/TaOhJ9eNJpDqD4xidRkRrkwM
         Q9TmUkggBfg3fVT9Gy+hjpbGIeBUds8Qq+0U/pMB+9pZHspFPihTQOt1nstBTa5UNbn+
         GMLuinEcWSJoiFcbruan0ZjQlAyNhSIEfqFmXF+q31dAPg+tfEMGMhpwGpEZiZdySZkL
         x2adxFazbtovNgmnTFkUCR3st12JeCRfdluuN+O1Xe16qKl1xABXb6iFDogtC+uX9vmL
         NxyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yyjGsS20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vq5-20020a05620a558500b007872720d2f5si10799874qkn.429.2024.02.21.09.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 09:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yyjGsS20;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcqDm-0000On-6a; Wed, 21 Feb 2024 12:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HzDWZQwKCA41opwvs67sto1u22uzs.q204s08-o50121u18.25u@flex--nabihestefan.bounces.google.com>)
 id 1rcqDk-0000Nx-J3
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:17:24 -0500
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HzDWZQwKCA41opwvs67sto1u22uzs.q204s08-o50121u18.25u@flex--nabihestefan.bounces.google.com>)
 id 1rcqDh-0007hp-OB
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 12:17:23 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-dc6b5d1899eso10287172276.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 09:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708535839; x=1709140639; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LdESWrhZSTXfzqZQoBtj0qn4uDZe1pLjkAyWgBYDPNo=;
 b=yyjGsS20i5GW5qQPVqxmFGYSHtCDrLWs/FU4XlWhYv5X0tDYcSsV9Oe5OL7FkLKxTW
 McHazsyLJmzFW98Cz4rfLh5nBzzoQ56Qe5YrNwRJF9lTLHvuJkuPzXZzGwGHH++9swrf
 TdkzdWq2qTDrl935p9+9wh5VTBPu4bGkXzLfkVoYQl0L2dbk+vIZGJaqg7fQlEfuEJ8H
 rvhO4MNgU+ecfRLvDfD3rvsxqVDgzFnDKsPLxWApmHyWIvGxXAxQelc0riAxJPL06kYW
 Wt2c8bAvvzOCPTBdprZeFZiBD1j8N1lp+vexojZJjUTPQHpuZvlO4WJoprQiDJH0krrK
 ZIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708535839; x=1709140639;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LdESWrhZSTXfzqZQoBtj0qn4uDZe1pLjkAyWgBYDPNo=;
 b=hOl3yXlHXf72g0GquFLgjtiGYSGDxN417g44g3sX7/VscQTETJOTp0hwcK8bsyOgWD
 1PFTvjBJjP+7/7X1fEf9mp10EXiWnGLX9aRQj2BHK9i/KwYc1GTVOgqk07wFshTtLrFp
 EzWtHQFjiKDyKkuvP0/7Y9OdiRsEoOhfCIFtx7CU3dOOMVBOc0cB5unWc5Se0bTS50Df
 17fCwp18F7weBDLRg5hxA5sBVjNh4o4b++IrX+IcCxRooGWLXf4LOoKHvqyMs7ybMPFP
 ATL74rhOA+i04Ad3yCr1Jybu7cM3HO6DEF/QjP3gr3T/pZ2HvbFF3ZX+c87NwWmzzC0G
 /JZw==
X-Gm-Message-State: AOJu0YzNvc9C2HgJyqx8o8m+wIJ/XLb99iPxc395NL3YHMzvY6K1eN0h
 xuZ2ys1c8nCb4o51IQb4FU1Jldj+LPiPjH3bcsCgGz6DWPD4lzgVD0hM8yyZ3J83dn9oCAQJ1Rw
 zb9MC+jX/0PjnMT9BSxX9lcQb9Q==
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1003:b0:dc6:e884:2342 with
 SMTP id w3-20020a056902100300b00dc6e8842342mr13913ybt.5.1708535839333; Wed,
 21 Feb 2024 09:17:19 -0800 (PST)
Date: Wed, 21 Feb 2024 17:17:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221171716.1260192-1-nabihestefan@google.com>
Subject: [PATCH 0/2] ARM SMMUv3 StreamID Implementation
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 its@irrelevant.dk, kbusch@kernel.org, eric.auger@redhat.com, 
 roqueh@google.com, nabihestefan@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3HzDWZQwKCA41opwvs67sto1u22uzs.q204s08-o50121u18.25u@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cim0mkdOh/68

This patch series modifies the ARM SMMUv3 to be able to work with an
implementation specific StreamID that does not match exactly the PCIe BDF.
The way to achieve this is by converting the smmu_get_sid and smmu_iommu_mr
functions to virtual functions that can be overridden by inheritance, making
sure the StreamID is consistently 32 bits and removing the hardcoding of the
SMMU_IDR1.SIDSIZE to 16 bits.

Roque Arcudia Hernandez (2):
  hw/arm/smmuv3: Check StreamIDs against SMMU_IDR1.SIDSIZE value
  hw/arm/smmu-common: Create virtual function for implementation defined
    StreamID

 hw/arm/smmu-common.c         | 12 ++++++++++++
 hw/arm/smmuv3.c              |  4 +++-
 include/hw/arm/smmu-common.h | 16 +++++++++++-----
 3 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog

