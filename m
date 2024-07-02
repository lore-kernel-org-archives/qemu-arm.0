Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2262197njm;
        Tue, 2 Jul 2024 16:43:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVqG7aLaB85bBq2/43ieF80xxepK/o6eO4Yo/XAx+CARLW5tZQXhhQTuZRby6/DiWDkoL4XLHolMWeFEiehbq6XtBlzsjT1
X-Google-Smtp-Source: AGHT+IEXfKMfVAl0vynCEkHE3HuUh5kyraNFYGf1zj9nl6r/bo/d9q1LqJnxb1aZo7xBMbBc650W
X-Received: by 2002:a05:6214:194a:b0:6b5:9c9c:a736 with SMTP id 6a1803df08f44-6b5b704f0f6mr139812376d6.6.1719963799466;
        Tue, 02 Jul 2024 16:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719963799; cv=none;
        d=google.com; s=arc-20160816;
        b=GuoeoeVxqoaQ+4YBdIjm3OYzeWE66r7ZWXFM6BqAZLSA5lQwtYXMu77809WxKBzmKJ
         brE/CuMJLbsLwSGEgAj5KdCx7pvWUukzVinsL5kEx5g5i1mOcopHJnTIkhuy/60ATSVg
         nxAiIoCDyAFNvmOaXVI08Bla4ez0XoW/ydr13xXVqINpZ69qdHUtatRkaLgyV3h8pPBJ
         /r3yW9S4CC4nef5iVGh0XDhKETRhXrDSJJ7kUWK5IVBV3nr4Xv63lBetdqQvgxbS5W39
         34B/2YWZ3eSAGMcYlf5XHdJJO2oT5KQZFh5fwIxGB5h2zbWi8H85KowNGLYHgqsMzMSi
         e62g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=mZ5AdtoXeBWo04SqXtXVV3bVy8fFh+q0Y63ABmnLjpU=;
        fh=Fz3OM3AGXo6S/XDNq12jK+U+cl8IKdGchX/2GB3YVy0=;
        b=gi0AkG7x6Ota35mgSj4jGg3e/IbcMXa4MYnNXag1b8FPcD5FuUUMIveXMnpOsXMRez
         dxsoK6ihELoz26EbTbIzvScaltBobrLhIU6RciOoOcacjrNfFfvfkyfwt9WxRnozuuRV
         pPnyQhzBptRhIkkVn39vLnEAcLJqqFML7RZbxJFXUZz41w58H0kQC3MxnUbiNbEWL08r
         OPCbWguSAsPe8Yl68sbmcY8O5p0DE5dA3YgLRnetjMjcXv8DVVWIhfi5Niz/2dJMreQt
         sQuZqn+wj2KL74NWqQC0Pvb123aAkT+3LczJrDU1Egxmn+qklVt+/kDmk0DndgrAQdwf
         hNjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HS2CvEqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b59e5ae973si116120446d6.237.2024.07.02.16.43.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2024 16:43:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HS2CvEqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOn8c-0007nz-VZ; Tue, 02 Jul 2024 19:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOn8N-0007lC-Bu
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 19:42:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sOn8J-0006Mi-C2
 for qemu-arm@nongnu.org; Tue, 02 Jul 2024 19:42:02 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-70df2135426so2723558a12.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2024 16:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719963718; x=1720568518; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mZ5AdtoXeBWo04SqXtXVV3bVy8fFh+q0Y63ABmnLjpU=;
 b=HS2CvEqSFlkzP8SzQLvpFM9t7L1geY47WOyZJI4LHQc9CPSNsSWCEEP1sLAMxfjQsD
 qawWm93eZZLFMKTK9ytjzja5XGPr5VMszhg6yODKE4EirqYtFjTzw8llUAx7Hl/U5FKK
 mP+65et3CAGNfFoq6V9CKbAO5I3HDIjAjNC3/CK7VLX7SiYy3zSfXqHQHcgvcBSDequd
 p11ChWRe9Qexgbp+QpWDjH7uUWfQfbIeitTW6YGPEiTpJo7gd8oBFmH/mMqNJnRJXF3q
 bc8njGPsDd9cA8ng2PqTSsIPJSZHSEwOlheUKkGXqbhN6TR/szQ0e6vFLzQz8iMt6GxJ
 LbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719963718; x=1720568518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mZ5AdtoXeBWo04SqXtXVV3bVy8fFh+q0Y63ABmnLjpU=;
 b=U224NFEGCQwfiG4GBRzxYhUx4IzTRnZtrv1ih92Vbb51TJhdOcusPmAxM6LUF2Y8Zr
 co8l/on+xmj5bpBfYXJ+DqkfUSU4/iRaOoNW9sPKGOw2ZX36HgIeWk3UIaCscyhfzX5m
 k1iAlmztGM/XZyF+pmF6NLLFV58na/phwLwKu/zOE+n+BItr54KoEiP3B+YhlT33MJ4f
 j82BUiEpOb5Q0uPcRn78uMFF73Y0j0s8224UH8Hg4072nxD0T6gjJ1tsIaClLmol5VKN
 18I8ZuSixE3DWLEDviO9f6thVa2F0eIpSV8iiQsA+QNAxpxRvsGw+6/G91MVlAAYP9Am
 fpdg==
X-Gm-Message-State: AOJu0YzP6I7f4xgenPtuu0ByVEA6js+EUaNU8W31w0b0rHFWUTww1IGq
 qS39UwzTRxoN7V4unyBJ/PkgXQJSQqrIMOUc2D2j+jvU+wsNutGUP9AJAa3A59U=
X-Received: by 2002:a05:6a21:999e:b0:1be:c42f:be42 with SMTP id
 adf61e73a8af0-1bef61019f4mr11018847637.19.1719963717603; 
 Tue, 02 Jul 2024 16:41:57 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fac15993c5sm90403755ad.244.2024.07.02.16.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 16:41:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, iii@linux.ibm.com,
 david@redhat.com, balaton@eik.bme.hu
Subject: [PATCH 0/2] target/arm: Fix unwind from dc zva and FEAT_MOPS
Date: Tue,  2 Jul 2024 16:41:53 -0700
Message-Id: <20240702234155.2106399-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: KLNQDhJdba4d

While looking into Zoltan's attempt to speed up ppc64 DCBZ
(data cache block set to zero), I wondered what AArch64 was
doing differently.  It turned out that Arm is the only user
of tlb_vaddr_to_host.

None of the code sequences in use between AArch64, Power64 and S390X
are 100% safe, with race conditions vs mmap et al, however, AArch64
is the only one that will fail this single threaded test case.  Use
of these new functions fixes the race condition as well, though I
have not yet touched the other guests.

I thought about exposing accel/tcg/user-retaddr.h for direct use
from the targets, but perhaps these wrappers are cleaner.  RFC?


r~


Richard Henderson (2):
  accel/tcg: Introduce memset_ra, memmove_ra
  target/arm: Use memset_ra, memmove_ra in helper-a64.c

 include/exec/cpu_ldst.h            | 40 ++++++++++++++++
 accel/tcg/user-exec.c              | 22 +++++++++
 target/arm/tcg/helper-a64.c        | 10 ++--
 tests/tcg/multiarch/memset-fault.c | 77 ++++++++++++++++++++++++++++++
 4 files changed, 144 insertions(+), 5 deletions(-)
 create mode 100644 tests/tcg/multiarch/memset-fault.c

-- 
2.34.1

