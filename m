Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp3361123njc;
        Wed, 24 Jul 2024 15:08:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqphPTwPNCkug9ul0RQeIxpMZMLGNnY7VMEq9T5rNlhK9JYHin3SXiX/FhqUupc8qHqrHxwbHkEmbX4CwmRX+CQ9zyL+Vj
X-Google-Smtp-Source: AGHT+IEhrXoXmExNYWaDtqE3nsL7jhIPJ3Kb4tVH6I8N/x8mZR6yS3YJLpe4wvSCFPGrM25HtKYr
X-Received: by 2002:a05:620a:c4c:b0:79f:87c:a540 with SMTP id af79cd13be357-7a1d4584d7cmr119711285a.58.1721858906756;
        Wed, 24 Jul 2024 15:08:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721858906; cv=none;
        d=google.com; s=arc-20160816;
        b=bm67XQyJ6HaIA5so+oM3MvEXeXHXolUmyBPNSKY99LyGMwsMZAt9Bg2n/TVFKLrWyo
         jfqHyRpuToe71vxeD+bFaDANXRC880Oz+RrcI4i+Dl9Bc/INit0VYvytuMjTkc867URw
         TEudBG0ZLrdNgS6JQyw7kWah68GJJM66GKacu44FMVhIpOht4lYD9Awkpn7TL08OcAhn
         /SInHLmoLor75UcwuAfadSQ9UlZTbZ79WIHVII1e79wvNElA3HJzFipSZdBxDBjs1sJy
         va0LDvQ+YITfzYFcoftzKjAo847kjXgJjvD91eDI3cl9o5ug65lGFWnZZojIvpgu8T2U
         kACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tlPxaf48ESlCF6z303PSbBfya6HxzRZ782+k35fLNmg=;
        fh=VYRK0M7rJFdXi9iCx/gDpcE7bnFYAg3qTBgRtXCOFco=;
        b=Hyw9UibSbBKn+CqzZz3uc6PQcypyPx+wUJxufqzqcUKA8oQsBBZAFPqR8qOD8APqDF
         dg561GBrxiBqgJ+DWilHXtloWUuFrb+YePhYnkYCDWEjotfbZyPJcOYcV0WnIzXLp/DS
         bfnlfwyl9JDwk48FEQsj0zuKKZnsymBZg+nV9QSPtbbVGW5nx6ogVsBqAuHNr0r+Xv/2
         3zpX42HVTIZ/98FIo5TcpOqAe7L8GMOeyJFaqXRny4+fko91reSuhQ9e7woY71JGBDMs
         JDlL2MmoQl+J+eWbkOUUGzFBac7Azpq1CePNUPSJdH+3PCNEgCEqFJcV6N10kMELkXOO
         QYMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=fxx7QMxV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7475068si17936885a.564.2024.07.24.15.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 15:08:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@bsdimp-com.20230601.gappssmtp.com header.s=20230601 header.b=fxx7QMxV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWk8H-0001k3-N9; Wed, 24 Jul 2024 18:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk8F-0001ab-Ce
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:47 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1sWk8D-0006eu-Tp
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 18:06:47 -0400
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-8036ce6631bso12100539f.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 15:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20230601.gappssmtp.com; s=20230601; t=1721858805; x=1722463605;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tlPxaf48ESlCF6z303PSbBfya6HxzRZ782+k35fLNmg=;
 b=fxx7QMxVEn/hGx3Z5WzUC4WOa3IXuhi2T9lNAUuQckrp/L6YegnNabSvWfS77KhjrV
 joJ2mlk7af5joyktCYQanrqxrGgO3eJ188eG7p0KW1gNY7iGjvF/8lN9EzExQeRMRfVJ
 y2NEnpsxjqulJwW7zeccmb7mCvkXIEZNQ8Q0BtlXtC0vMzZpohQOKY/97MsZCsd4dUew
 6tvl/W8OVjfxCEAfDnGFZs4GkA/cAEStalYAKbUxH0Hbsm8mTm4PbQc9qw9q2fIruI3j
 yokR9QoQ2411JSYtlB0ddT9ywBA1sgYqP7GHFIiNarv5fjHp3USP+ZQi0I8HNJ7MnOOk
 DY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721858805; x=1722463605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tlPxaf48ESlCF6z303PSbBfya6HxzRZ782+k35fLNmg=;
 b=bqDDFAzRJ9gRXMHnpkkbGNeaWfngNHyx9kSVbU8H9/cDy1Ys7RaIe0F5Qse866Ru6b
 7PLu62khtaKMGpF4gZhqQglpNF+EaqF4sycB/iv+z6bHwGaGxh7dfNV3WCRSraeMj/Bu
 mk/FaShCFXsQy4rJkz9CSfLuSqSwQUtmEc+SsBU6gTnfKoKaNly9BSpNJe1QpYLDqvTP
 GhwgAT3EixL941K6tAmUNfkDRQiqNZygFQYWqkz1Y6qqfXllma5BjwCRLzybX52MbNqv
 91cxtoWPXSPFi1l5C3yFCBjmmNBV5fnrvDhzlK7skMN6OsLyDu+7kmyFbSs5SoVZScup
 ST2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWArBaMaBDbIHZu1IU3UKInBTR9pMmPMTsSyHFT8zktTcOFj90yke9OCMMd3S2pT2in0v/dtLkQNL7C4vzo48lUF94U
X-Gm-Message-State: AOJu0Yx1yUoXhYHn/jnky+O3bBkRkEolSMQYwJddShd4+EUtReTicDCB
 175oZw3KvwL8BXRT7TIcaCF7g2QGxv2ldsmktpmR6HM/B6DhRlqsYPrsBPXrkJE=
X-Received: by 2002:a05:6602:6342:b0:7f9:1b3b:8465 with SMTP id
 ca18e2360f4ac-81f7be7104dmr137960439f.11.1721858804899; 
 Wed, 24 Jul 2024 15:06:44 -0700 (PDT)
Received: from dune.bsdimp.com ([50.253.99.174])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c29fa983f8sm10086173.47.2024.07.24.15.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 15:06:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 14/15] bsd-user: Add aarch64 build to tree
Date: Wed, 24 Jul 2024 16:04:47 -0600
Message-ID: <20240724220449.10398-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240724220449.10398-1-imp@bsdimp.com>
References: <20240724220449.10398-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: V2QBofPcWChy

Add the aarch64 bsd-user fragments needed to build the new aarch64 code.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/aarch64-bsd-user.mak | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 configs/targets/aarch64-bsd-user.mak

diff --git a/configs/targets/aarch64-bsd-user.mak b/configs/targets/aarch64-bsd-user.mak
new file mode 100644
index 00000000000..8aaa5d8c802
--- /dev/null
+++ b/configs/targets/aarch64-bsd-user.mak
@@ -0,0 +1,3 @@
+TARGET_ARCH=aarch64
+TARGET_BASE_ARCH=arm
+TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml gdb-xml/aarch64-pauth.xml
-- 
2.45.1

