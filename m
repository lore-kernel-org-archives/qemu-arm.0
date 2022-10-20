Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp648072ejn;
        Thu, 20 Oct 2022 15:46:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6X7mknXoMFFfzOhZeVp8OaXTG4YnxN3uAUMC9GSuVRKti7rk/QWLM9GnCyq74DXVt7KcCk
X-Received: by 2002:ac8:4e44:0:b0:399:efde:98c5 with SMTP id e4-20020ac84e44000000b00399efde98c5mr13432136qtw.640.1666306002680;
        Thu, 20 Oct 2022 15:46:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666306002; cv=none;
        d=google.com; s=arc-20160816;
        b=zEGXhdP9tOf+UsaG9hVDD/j3MTKRBrj6z6li8eqZCs2aH3KKONNIGynjENO+UDKHmt
         eKViOKf4NaoQE5ivDGQQrD5Q2Kqco+8dcqRjuUNwUrmESE71RSmxfkaxX/LyIWDqBEEq
         Atl8SJZtpSLxcimXgFTz4PtijHPB9LNYScN1GSvtMROohdckttlnY/8UoeD/KMhERJt2
         ZkjZoGXRQwutde2d9pj573ZUmiMIzbYfrAAwkqW2Vg4DS+s+W7O/6zwX/bv4+ECxvSZO
         mkhDkgfjxdtbjCyLVlHLBS7jmR7AbsYksTJotLW/N2Q5zfcoQ9z2chnfacdKSOLMKi/g
         MS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
        b=vHPmP5D/TdiJKw78jL8vF8lOonuPuT6SOb/PnU+5V3Jk4BEngSDvoXI7/6f20B/Nqx
         em0d2B0bfUT0qIBNvzAR9XlrlZ5QNl2q3AgNNcdyJb02w83vma86vpn4dAx9ox22qWf2
         hCkPj5tqNhygfFPGqvnRyUonccK14bItQdewtx0oaSsYTzlgRcI0UW1AIPtMpPZVegph
         gz3z/3L26Hbb/yLLHvTmSMh31vHeRZw2djZ5pqULkwX5WsDuylPNDKBuCBBt49j7jLLm
         b+H6Nz7qK0eyOB4KHM7BXMNpFMdbilJhnOIJ+gXEvBIZHZD3RtO3qRlCw3rTcik0xDYb
         YFNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5g3GBQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv4-20020ad44ee4000000b004ad142834c4si11277247qvb.228.2022.10.20.15.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:46:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h5g3GBQh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleJG-0003hD-6a
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:46:42 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ole9o-0006tE-0h
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9h-0006TU-3v
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:49 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9f-00011s-HK
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 18:36:48 -0400
Received: by mail-pg1-x52b.google.com with SMTP id bh13so872567pgb.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 15:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=h5g3GBQhIgjHVtNRD6buP7LdCjYVLtiLR/y602pz/if7Qs9pg7K96VLInSc0MAudIq
 beqUKs5vlGihs65Yf0Bk/jmybZLa3NSD5QqgyF6/KJWByqUwllkDe0MrxK3+nvhVApfj
 gy9wdzGjRHq6108KfFDyR0CBtKVFdHK2bniDIEZBk6oNssUEspAptmr7KiFtJzElF4L+
 yCivAGvxhdcFQfI3S8jf+0+32DVLc3DpB/5Qy7cypI1G1OiDbxNSl6DJhE+KMEifDyEB
 QXBugaR+xmciZRfVFLi9cxtRAG9qUIXyAhmArCiZjIJTugM7MFznQz2tQsZzxq9QXmqq
 6oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=HnPQwnEH+MN4jLuFBXogN0pI5s5Ox1TujR9QY4v3tZ1W5IIOxnwgMOG7F24JOiBXsy
 PeR9B1hn/SpVr9wpmEdGIn29OXg+Lm6Xld37ilRw/LOJpGT3GxtwZ5czl6DmrVGMbYtW
 /Un7WiTtnn0tKBz2Zo0J9otXcQ74roNeyJyLKQRYBH4be6jt7yN3UcYxto2cWybmv8Nw
 HwPCvSEg5o3JSO5FO/XFQ2PVihrcNwXQBkJdxHr7Zpj5Wa1yWKa/EorSV4eVopK0xhXq
 ogOJj7HBLy7qEWN0Za1AVu0HCjL//Bgmwxq4+R6uLFoeQIQ4R5xu/Vwtb7yEjTAag8Xo
 m8oA==
X-Gm-Message-State: ACrzQf0s+8aE2XAUpadO1tjM1Mxl6hF3cd0XNJ+zZ/kzm4JFrVNSxDIs
 lwqJ6+HfA2eSyBSCzBELPFe6nSfhfexYmwpv
X-Received: by 2002:a05:6a00:22d1:b0:562:5d7d:5588 with SMTP id
 f17-20020a056a0022d100b005625d7d5588mr16108302pfj.58.1666305406282; 
 Thu, 20 Oct 2022 15:36:46 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 06/14] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Fri, 21 Oct 2022 08:35:40 +1000
Message-Id: <20221020223548.2310496-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pLpezDYT8cK/

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 16d7989604..a5ef5f6054 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1

