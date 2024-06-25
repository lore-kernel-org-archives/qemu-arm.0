Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp750113njc;
        Tue, 25 Jun 2024 11:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUAFYrfOWTtIdCvWDjpi0VWgeDEdIXkf+yb5HPFq3hV+qLi7P0FKumcNZKRuuBWWBU1pk91hlzavsH4MyCyvTo9PV/X0/Lx
X-Google-Smtp-Source: AGHT+IGbffRDjMCrPsni0OcqAHRQT5RCJzHqS/XAvvRpEp2srJ+MMacyX4K88OVwqg4487sIpYQb
X-Received: by 2002:a67:ea97:0:b0:48f:450b:2ea6 with SMTP id ada2fe7eead31-48f4f0fa35dmr6191772137.31.1719340891986;
        Tue, 25 Jun 2024 11:41:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719340891; cv=none;
        d=google.com; s=arc-20160816;
        b=gaA8mxrSTESTTAHu+oNylgQobPF/W9dYUMmeRIOjs/4XoHU9hDAUb+9Gk9zIwqrfoa
         VfDXEoeh51gwOI3cN6uhSm0/lTdSqYY8BeBZjIoT0Ev1rzidHsx2ogTQEv76IQSxfyjQ
         bq8nOTlE/SYInO/58yRJZ4NtL8Jdx0xJ7QAfyGdjaFUfKX8OT1OsrZm28jK0eHvX2otg
         iPqL0ajpHzyijIkrXUjTljhPFjmvjb7Q9sp8VqCGJg/fcI439qm7jcvLwL6fHgB4DXhX
         1kUOpcOy15RJnH2mm43FpTM4z3XZeKGmTZoDFQLiQ2j4vYI55jpcXbYoDUz97Hsh5yRE
         i2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=o3TrT+1edJpCmza9gqCf/5QxVas39HNQW55OMRlXNaM=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=YkSga4PrLiTYk/IKg4N/gXXJD8pT/R/dj4J7gntcIx5kF0zsM84rchu+gT7SBY308G
         epBhbqul0aga6blZuNGwGbQPqm2LQHofQDxIyZFtJbj9Iq1XjrJvr+04KELaskAXy69i
         ytB7o2FnOCpOVl39FwPqFr3mpR0xXQgvbLwrDivoKLTeBby2FS5teTreWz8MjSaISeie
         +3VYcRcaBTBJd2Feum7CbXV0VBHwedxN4Nipl9Eq6hcqno9YRRqAHjN63o4HIj5nx6X7
         lGGIOqtERYS893fhTt2YmvrPlhYlfy3LEzXzsM5uXXvbB50j9Jl84fFqmAZXatq/aqFy
         PbVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEYHdZc7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-444d5ec22ecsi77956621cf.756.2024.06.25.11.41.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 11:41:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pEYHdZc7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sMB3y-0000vB-H5; Tue, 25 Jun 2024 14:39:01 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB37-0000kF-Dt
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:37:55 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sMB1v-00065Y-DP
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 14:37:20 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1f480624d10so48470445ad.1
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 11:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340538; x=1719945338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o3TrT+1edJpCmza9gqCf/5QxVas39HNQW55OMRlXNaM=;
 b=pEYHdZc7MX4nHHg+1XqAoAJaK1cgzcV0IoO2mpA3An0zKelWyIfQKQ3y1WRmsVSQBd
 qCSh064B7dQJ2UUKDsOR1CpdOHgV8iyVte3qDkgePWg+pjiJN2ugwVo6vpNb+w+no/Sl
 scAlozovotCgb8IoiPrG90E7vJ4PgnxnsKV51OMx5U3QoauHuSjpqQwZqEgwIeUf2bvU
 PGTuxCK3eVK/vgyDgiCEdi/8e/kzIJ4QoqPIQfPHSP1BXyCwS1YZur+MwB85xw+1D8sN
 EoaSOSgkrzI03IMQmk9GTm/L3k6OtrZu1XLLKMBjq+QlnXwJ2Oc9h5DKDjNabsUaglbI
 +0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340538; x=1719945338;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o3TrT+1edJpCmza9gqCf/5QxVas39HNQW55OMRlXNaM=;
 b=kRCq6jEeK4Y6OcsCLwOSYHV0qljqb7rbnhUUWAjK1IK3PIAkVYSkNU0TqKeOMecJlB
 m+5/i8vqaBcJ3fqKzpEPvk9ldeatffHnUHoDqE4OdM2HMS8LWg8GOzP93xCZqMLhSBHo
 tcFQop9hnC+DfR118jgrxJ4dwbXXdqX1HIWgCccdQcI7385gSvmosvNDnObVhdmmeCzE
 5mgED0ekxT9y1dZYASsAKmr1fDdqHKdPK+PqgNBK5Rl6071YHhOMxxcwSnp53JALC1Jt
 rQy2tFfJ3Pcf6Gzxlrc5uK+bvixw5yQQnwtL35a0xOpOcP2v5gwz6w3OwTjce4si87rI
 LIJQ==
X-Gm-Message-State: AOJu0YwCQ4S3KgdnzPMy9RYhEapXWcibsGxtrE6Z3aiQLZrOPw5e3yy7
 xq9iCWq4q5ro4CJ9LWwh4zwN+MBdjX/8IBdXjTBDBWVDWHUSrApmvf3BLqiyLEF8c94Cgla6LbS
 q
X-Received: by 2002:a17:902:c407:b0:1f6:e4ab:a1f2 with SMTP id
 d9443c01a7336-1fa1d51e50amr99561685ad.25.1719340537890; 
 Tue, 25 Jun 2024 11:35:37 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f9eb3c6027sm84693235ad.133.2024.06.25.11.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:35:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/13] target/arm: AdvSIMD conversion, part 2
Date: Tue, 25 Jun 2024 11:35:23 -0700
Message-Id: <20240625183536.1672454-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: cQlRjVv3PO67

Convert another hand-full of instructions, plus fixes
for two issues that are related.


r~


Richard Henderson (13):
  target/arm: Fix VCMLA Dd, Dn, Dm[idx]
  target/arm: Fix SQDMULH (by element) with Q=0
  target/arm: Fix FJCVTZS vs flush-to-zero
  target/arm: Convert SQRDMLAH, SQRDMLSH to decodetree
  target/arm: Convert SDOT, UDOT to decodetree
  target/arm: Convert SUDOT, USDOT to decodetree
  target/arm: Convert BFDOT to decodetree
  target/arm: Convert BFMLALB, BFMLALT to decodetree
  target/arm: Convert BFMMLA, SMMLA, UMMLA, USMMLA to decodetree
  target/arm: Add data argument to do_fp3_vector
  target/arm: Convert FCADD to decodetree
  target/arm: Convert FCMLA to decodetree
  target/arm: Delete dead code from disas_simd_indexed

 target/arm/helper.h               |  10 +
 target/arm/tcg/a64.decode         |  43 ++
 target/arm/tcg/translate-a64.c    | 808 +++++++++---------------------
 target/arm/tcg/vec_helper.c       | 100 +++-
 target/arm/vfp_helper.c           |  18 +-
 tests/tcg/aarch64/test-2375.c     |  21 +
 tests/tcg/aarch64/Makefile.target |   3 +-
 7 files changed, 421 insertions(+), 582 deletions(-)
 create mode 100644 tests/tcg/aarch64/test-2375.c

-- 
2.34.1

