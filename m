Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3056881dye;
        Tue, 1 Jul 2025 03:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXM9ZAorXLqCNzMU0C3y1Rmf8aKcqgZ149xDtZESD3+woYADgo0wUpEqCTXjnGacmazvioDl0Olz29EKg==@linaro.org
X-Google-Smtp-Source: AGHT+IFFerdoMlbwWNRVOkdyZT81hKGVK0M23/XjDmi3jk/bMekzIXYCBUZLxB6GffnAHoHowmRS
X-Received: by 2002:a05:622a:120a:b0:4a2:719b:1238 with SMTP id d75a77b69052e-4a7fc9f3e66mr251688171cf.12.1751366085015;
        Tue, 01 Jul 2025 03:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751366085; cv=none;
        d=google.com; s=arc-20240605;
        b=XOAR10TZPILoWqguzHNbhvrmC2AdtHPm8sXrrg4Cu5Y2ePbk7DKTcQaGfCNuBVW7vh
         JVWvjTwsMQlDlTbf5L9QdcgUwa6BFuRQjxvEtyh4345Y/IzQUOXtyZNRAr8at4lCZmwn
         VZT58TCDQECOoQnFNYE3IB8z6fk1lx7y3mD/ZDf9jgSTIlIzSf1nZzwZDAeiy4+p0zrR
         6BbXrXT2ZgCbjj0n4fUiO6EfojYbv3TERTUOcgloIxKqHvMHeRSRvrs4T7eveq8by39Z
         jwWzYpCjo0NrrTlD2AO3WGy6g67Gow87tg+ZY1Kvpqu3GaxsJc9bxZsSabgUsCzCmjy4
         FrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=QoIVN/xkFbmjb8YH/F1wK8KcMj+smYpegVeMJ4/WZ7I=;
        fh=YY9nUc5w24cMHuHgTFjcuo3GC73LQtyUYEufVd64Hvs=;
        b=NooiJu0SSNqkj0XjqvkUPkPcYWa+73UYlY+2BpRg+2ySxJpDtGYOT7BHwC20YB6CV7
         rjhQA/9QKj7abVzxq6Jvh/4H3ZWupjWR4SrxnZOJy8eBjVyRgAAA2w10v5Wt2UGS5PFr
         xP2nGlK5ZCFjeyCxKM8WR6EGmdNXoEBxv+YhGn1dPEVYPv+CID+5FY+jZwKd1Clob0/g
         wmTv3QLbK7cjRmcJlVTkvs1tvdaamTc7x22JMUz7gxbuwmpxgTYQzr8Iu5x3FJP5+BUG
         UAbb0H4YXCu/WfY+f7W8yn0NZlsz70pdmcNLH8UU7igpxcY7yWtQrwU32rAtuVr96mzr
         eV2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PaMZNgdG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc0fee7asi102797841cf.100.2025.07.01.03.34.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 03:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PaMZNgdG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWYIG-0004Xl-D9; Tue, 01 Jul 2025 06:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYHy-0004Nf-Lf; Tue, 01 Jul 2025 06:32:34 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYHq-0002Co-Vq; Tue, 01 Jul 2025 06:32:33 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-742c3d06de3so3668539b3a.0; 
 Tue, 01 Jul 2025 03:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751365942; x=1751970742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QoIVN/xkFbmjb8YH/F1wK8KcMj+smYpegVeMJ4/WZ7I=;
 b=PaMZNgdGDlNj71EQxMWEAn5g5diE4awEvHswNvr3PhQsDPQ4jyxxTqV110X86K3Jol
 gQNUB6ovKHZhfAypd0kUPHG6QJ7qfV63NmT06ZJ6rAIroltxvQvPe+HuILoxVH/VlXtz
 urC+GxapvZ0w7o02/EMP8fsinEFKjZWh468iY6UWDVcDarjHdOOTlDwc9HTsfviGNxUF
 FaC6/A9s8TH0/bmI/gKLOEG2sAvMQgorOYssu/usX8Vruc2/E0q0rUse06Sska7zBH09
 n0bkR4NZlreMLD5DubjZ+7sMqK1kMPHalPhGZC7qQWHA6MEW669Cn+d+nhqqK70NT7KC
 RL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751365942; x=1751970742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QoIVN/xkFbmjb8YH/F1wK8KcMj+smYpegVeMJ4/WZ7I=;
 b=LKQ7nXKbmFvdkyh2JzmctNTenvtZNYSVcKoGSxOG2hi6bC56E5hyvxURYgicx2oWdP
 nWn67Ajn2/2AnCdD2dLsUn7J5USHyM0jeQW1eY6GFAZki74MOv7V7GOLZOIZ1/Wi5H3t
 KfLY+6wN4yuhIgDV2pW5D1912HnfkXLLlCT90Yg+pDrk0P/LB7pjvPyECyW+/hwM63wf
 8hafTsG5//YlYTR3i6xGo4vLXBSBpy5+vOssFREcsFmNA4kwhISTC1EBrpg/96KHgyzp
 inQ2WqWV8E8j/48zzdQhGjuoiRJQt7rpJ3l/LFsZyGfFGkhA87lE0tkU9sfrrx6s7Xbc
 OKXQ==
X-Gm-Message-State: AOJu0YzyzE5UhAu7wF8ffpNTd8BSlN74INCnpn0oAHTQgOMhGVl3nXRK
 GQaxtFUeJ+dQ5G5GzQ31OpKD5gbV5MJ9EpGU1UdJg1qJl4yxyf+DfYkJX8X/gZyjb9o=
X-Gm-Gg: ASbGnctq0QekLll8BCkZRgRH93LHlyRyx3NPrJ6E2azOh54F+4VmxwQevrH+CO6o+es
 9KUkSW+LWDZXBYTCaYIJ4sdNbsdb6mpI8NWDRY5U28blQc2xuvKuqNepwH0aCp2ktVcnkemBluI
 2CvFtbclZWtdzOI43nCffds8EBAcOmW36LIImVvZwD7TwBo/tqDQQ7Pdas6JrGm0JK5DiFSiYrU
 XOMYVWKLGCzrJiyk1QHXkr6lNRXZfyktcuTb9r59vsMOhMYIOkUc4pPvufCAJkDtYt/LLkgxHhi
 jvnmiJknIduHuH4tf5BPYQ44wlewtnL28CrMQSTK/uwnBjUwlpFit4NJewOt+eOJHyAFTM8dkiG
 BZhGuYL0rBIZSpf9RD97VlCekqhnWn/ZRUzvASHapiUM=
X-Received: by 2002:a05:6a00:23d1:b0:748:3385:a4a with SMTP id
 d2e1a72fcca58-74af70ab3a2mr24873194b3a.23.1751365942271; 
 Tue, 01 Jul 2025 03:32:22 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-74af541beb1sm11652955b3a.51.2025.07.01.03.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:32:21 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v2 00/12] target/arm: Fix M-profile helper loads/stores
 alignment checks
Date: Tue,  1 Jul 2025 20:01:47 +0930
Message-ID: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: snuC3gurgk32

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
  target/arm: Fix VLSTM/VLLDM helper load/store alignment checks
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
 target/arm/tcg/mve_helper.c | 408 ++++++++++++++++++++----------------
 2 files changed, 254 insertions(+), 187 deletions(-)

-- 
2.48.1

