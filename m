Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2063660ejx;
        Tue, 12 Sep 2023 07:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgm4TqWKFq86gHsCpF3AF0Y8hyu44D5Ez1524SyfjEL+Go67yu3aLs7L+xK6rW7cyJpiZD
X-Received: by 2002:a05:6102:2d2:b0:44d:4c07:f203 with SMTP id h18-20020a05610202d200b0044d4c07f203mr1550733vsh.17.1694527568360;
        Tue, 12 Sep 2023 07:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694527568; cv=none;
        d=google.com; s=arc-20160816;
        b=oCYVVzMyZ8xlvbbWOunhgXSxuKxAPDqf1XLHR2bSjmka4i+hWQfgNiarpkmXjZcZhc
         ayYrgEoWN3Ioc0itK7glcsglmEEASIDlDpMhzRhE+Z/M+yZy14Cg/qud0BMZdeGPqHhe
         rtMpQRGY3e+02NuxbPBzP2vIyjOgAwdz3Z0HgM73GnhE1B02j9CmlL5WhOsVe9R5xJKE
         vXlwd6lP0uHvVF0ZAKTwW0S8GBXzcaXRhXraM+/BM296eugsR7l9HtPy/X2tuyDGJGTk
         bDY1/4PiqkqdfG2g0pD94kArH4GVWuBHCWODEBYRxQgmOW3b75n1IkeSRoTv1XyiRFgW
         PsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q4Dgx+OSBmpEBFmVsndMXcNNk4c9tAUi91q/Iq2oNR4=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=VxTHHvxVyRBearGR/+CjbAwVdhq+V2PDpO9ngVCh+QqaTO2ySTBTbqqdEvUdTJJlsx
         9pIGZrDCbWQPt8O9fce8xqHpmxkwcxSXowFawMXvSSHBnTCuWs6uRGu1R74RCZdYWhRS
         g5mlvk+CIUsdegfPqZ6hhQehAt58/DxGwLO+Annl2Hc3VYvz4pmU2qhqg58T3Yuw4S/q
         OfYtXRkH0j/S+xuGzYpOONnJNyw5gPSpy6j8rtxvGjBKCveCyOgZoCsDzuHK6u9swS2U
         JhJKe5oDkReUMUQQjc6jZc2Pis5SpCxxK91TVqObrraRe0QWPY1N4LdBbxazcOpUPBqp
         u9hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gbo34vf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020a67ef44000000b0044932ce3a51si763727vsr.48.2023.09.12.07.06.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 07:06:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gbo34vf/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg40z-0008Nk-UY; Tue, 12 Sep 2023 10:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40d-00088r-Fr
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 10:05:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg40S-0003q6-0H
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 10:04:49 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-401da71b7c5so64217445e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694527479; x=1695132279; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=q4Dgx+OSBmpEBFmVsndMXcNNk4c9tAUi91q/Iq2oNR4=;
 b=Gbo34vf/Wvsq5Ttl1uvcIEZ0nlxBsUoznL+ZrWoYBj2mcqV9Kf6iKugNsu3VJTKazx
 P2YuHPPShGEsBonJedmL6irDnxCDzaYhavnw4dPv4t+1iknCwUYKitVVnJ9iZW4lNamg
 rNL/Eq37/q3SabYLk68qLo5OSgLPCmnrjq025EDDWZNv/HzUh+/MvRGRuMOPJFDwuQTm
 IvemU4UhrCc37eSmKeOyIu/gBy4vhCQSI8y+Pql/hhdMyPfNaozNyPS/3VmbY+Qbdc0T
 VhS4AqfDMRlM1xXZlg98QZPKce5+HYvB3UbHxO4UdF51WSZj644VStk4WESy14bWboXl
 1HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694527479; x=1695132279;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q4Dgx+OSBmpEBFmVsndMXcNNk4c9tAUi91q/Iq2oNR4=;
 b=AiWrMtDscK0L+u+BJZS4vnglsdNoMQ2xBwkqfNeFtbYLVlDZxm+jQp0oviU5ab+Bbf
 cgnULbiTh3ajUEpsLlJE6RILaurqQWhfLQr1XMvW8juw0BOP4zwp1GLif/5jS45nm4Kq
 QnXE15Fv/UDxInJ45CXAPEXAeSfsV2JDFqsvwJ9J2NA7AGmDebnmFSJRYhTdc7GFTa1q
 HZjTYp8OmJDOFXMUA0eFtVKdmig6lnJBSoRT2A+N5RU+no6ZZxJ/rvJHXAMdmCLrZV5V
 Lf4P4HyczcjAV53WaoOX0XRYLjj4dzkA/FTs7YKLnkgXNJVLJeKJQlTGo2z7vv826AOv
 dj2w==
X-Gm-Message-State: AOJu0Yyr7zmP0meAJDKLkzUHjZQbfJGuZ2w/6x9NjwDIQA7iauiy9UTz
 NOad7QPkv4WgfmvUE7jb7Yjth70aOG6/UmMjEkc=
X-Received: by 2002:a05:6000:1d91:b0:31f:85dc:1114 with SMTP id
 bk17-20020a0560001d9100b0031f85dc1114mr9593544wrb.33.1694527478634; 
 Tue, 12 Sep 2023 07:04:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm12892672wrq.49.2023.09.12.07.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 07:04:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] target/arm: Define syndrome function for MOPS
 exceptions
Date: Tue, 12 Sep 2023 15:04:26 +0100
Message-Id: <20230912140434.1333369-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912140434.1333369-1-peter.maydell@linaro.org>
References: <20230912140434.1333369-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: kyVJewRXlGcQ

The FEAT_MOPS memory operations can raise a Memory Copy or Memory Set
exception if a copy or set instruction is executed when the CPU
register state is not correct for that instruction. Define the
usual syn_* function that constructs the syndrome register value
for these exceptions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 8a6b8f8162a..5d34755508d 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -58,6 +58,7 @@ enum arm_exception_class {
     EC_DATAABORT              = 0x24,
     EC_DATAABORT_SAME_EL      = 0x25,
     EC_SPALIGNMENT            = 0x26,
+    EC_MOP                    = 0x27,
     EC_AA32_FPTRAP            = 0x28,
     EC_AA64_FPTRAP            = 0x2c,
     EC_SERROR                 = 0x2f,
@@ -334,4 +335,15 @@ static inline uint32_t syn_serror(uint32_t extra)
     return (EC_SERROR << ARM_EL_EC_SHIFT) | ARM_EL_IL | extra;
 }
 
+static inline uint32_t syn_mop(bool is_set, bool is_setg, int options,
+                               bool epilogue, bool wrong_option, bool option_a,
+                               int destreg, int srcreg, int sizereg)
+{
+    return (EC_MOP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+        (is_set << 24) | (is_setg << 23) | (options << 19) |
+        (epilogue << 18) | (wrong_option << 17) | (option_a << 16) |
+        (destreg << 10) | (srcreg << 5) | sizereg;
+}
+
+
 #endif /* TARGET_ARM_SYNDROME_H */
-- 
2.34.1

