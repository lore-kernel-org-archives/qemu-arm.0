Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1366819ejx;
        Fri, 11 Nov 2022 20:27:17 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6z/k3T+LDakSlC03i9m22w7M/ygaMH9RYXsbxqanrQTp4mNoqB3sItHHLAR7x3uSHQl/un
X-Received: by 2002:a05:622a:5083:b0:3a5:404:4c36 with SMTP id fp3-20020a05622a508300b003a504044c36mr4160320qtb.653.1668227237091;
        Fri, 11 Nov 2022 20:27:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668227237; cv=none;
        d=google.com; s=arc-20160816;
        b=TynqjZGvxuuDvOtaJIgHmK6Eg+k99bFz8Ot5BZGNMv+CBE3zBKtEI0bSt15sp+6dGW
         HWFaIZRPc2xsN0eikow+XnuPRfWcJX5IBWY+aSvg0QLtu6Er1/q2Q3VDMNooG0xPPOey
         oMTrNW3JqDr1q56puJ5cngFhUm+VR4n4SZ2I6zXQbv+Hx28xjn74USJDUJTmq09zI/Wn
         Z2Qz1lzFZiHTiEPu7J5NvsE2EfIAE3+hzhmmkJ0s5kwfiRG98GnyD/T11X9lgfnqnnh/
         s0C3XDqHl/9FCRszZgMu3SRi0Lv4hS+YtC73YwPOxcwDa2LdukMMTDPwuX6Oqxv0hbPg
         BCsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=EwtCFO19ZBhHavGSSjEACcNFIqLsY87dxQ9PhcSTieM=;
        b=FKz2618ALxvo9O78gN7UH5aKQuPJ18Fa72m7+0G2bD1fxhbfWcIOqsIko5wvRTeaMm
         /11hMsjcDnbA5YePOpyWOkJ4K7kE64Pm7FKkbM9SaLFKc4d9tGI7Q5odgx4nSzQoa/YM
         +4jYguSP+St+wGabR5Whru3oPYxt1s0zZGkv0jDauaUvMQRYM6vAw7B3H9xaHpbkj6l3
         I29D3RlQv/lX4+5PyjlPr9AuOSjd2YyW/NH21VERHaw5qnWxbQBgNlonRH5yX0IbQn3B
         7vuK+qIAdVHsGvWSWmDvdiZr1sGqMMRNbxFWuGP6Zp8N2cjUn5Tp0/x7l9bHEYkzNDpW
         hSEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zj79tZ4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05621420c200b004bbe7186fa2si2248780qve.296.2022.11.11.20.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Nov 2022 20:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zj79tZ4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oti5o-0004zK-LU; Fri, 11 Nov 2022 23:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5m-0004z1-6y
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 23:26:06 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5i-00080q-P5
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 23:26:05 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z26so6506866pff.1
 for <qemu-arm@nongnu.org>; Fri, 11 Nov 2022 20:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EwtCFO19ZBhHavGSSjEACcNFIqLsY87dxQ9PhcSTieM=;
 b=Zj79tZ4hgBHWnM5WBgN9kvTZFp8KVhOn6vbp3MalDCaVpOQcRZ27DFXHkTOy4aElPE
 DBCBblBQB6loX9aY7a5QK3rtTiy/HmqFaieYilpGSFo8Ri4aV1dSRCKP+26SW2jNYFF+
 e8+tmZo+Xko6SOHGnqnQnzbY7g2oolm2TxbpIVj6jmDoLe0F28fV1kDtH+MWReZ2WXqi
 KdSFec04cYbMmPpUseTb/0dqvMwKTq6j8gSeUPKJe2I8whq9Tk0K8+LmaT28sVWF34/N
 AnRsnxSGCYrZNTzZxF+QpctjuH6jSn+XvFcnqtglPBvJSK0JlchISDoS70iKUfR/so7n
 VgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwtCFO19ZBhHavGSSjEACcNFIqLsY87dxQ9PhcSTieM=;
 b=qsUQjW8u6RXIfw590UHs94V0Hydwa+r7mHIrVYLC76FsR5hX3eZ8CZAa7bgXX14WW2
 vSAgpd+4PZCuveHzEJxp0w9cBnX9etmDuJEMOdvbh+1eiDZkFW7QeXWab+e3+PZNzolb
 vBQIbAmsDuInkDunDJvcMSVz6bxJgsGLjDCpgPQXFZTM7l3UoMZNMZ0RG/pRHUgH2iCf
 cvQJM7dZGqLLljvnjNgWuIZHOBeWHsx0Yt8Vzn+YW2ORw3rIlwk9kEHMnur3/P9n7LkN
 4XG+PUJ/bn329wioxkYF4xgkUC/s50XR2TBwiHEiCX9pijHZuRT+fyR06naMqPZEXyoL
 3bcg==
X-Gm-Message-State: ANoB5pmDqVIwM7iFhG44PY3eI2IUabO6dBVhwfqrVIoj0p00114z/O5r
 owS9UCnUr5U7wDidXxrTvuaUJU+T9oiJSrC5
X-Received: by 2002:aa7:84d2:0:b0:56c:3fbb:7eb1 with SMTP id
 x18-20020aa784d2000000b0056c3fbb7eb1mr5695375pfn.7.1668227161151; 
 Fri, 11 Nov 2022 20:26:01 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902784600b001869ba04c83sm2522003pln.245.2022.11.11.20.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 20:26:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 0/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
Date: Sat, 12 Nov 2022 14:25:53 +1000
Message-Id: <20221112042555.2622152-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: OYwX1eFM7Gxc

Use the new common function and avoid rolling our own helper(s).

r~

Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
("tcg: Support for Int128 with helpers")


Richard Henderson (2):
  target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
  target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP

 target/arm/helper-a64.h    |   8 --
 target/arm/helper-a64.c    | 147 -------------------------------------
 target/arm/translate-a64.c | 121 +++++++++++++-----------------
 3 files changed, 53 insertions(+), 223 deletions(-)

-- 
2.34.1

