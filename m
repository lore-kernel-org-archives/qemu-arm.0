Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1360075ejx;
        Mon, 11 Sep 2023 06:54:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxLisQJlTbF0+8UNwiBtatzSP/jlrxls3KKpMsW41a9X/VjLqtkOlZeyGXv/97VX1fN1IZ
X-Received: by 2002:a05:620a:ccb:b0:76d:7ae4:f708 with SMTP id b11-20020a05620a0ccb00b0076d7ae4f708mr9059904qkj.74.1694440486190;
        Mon, 11 Sep 2023 06:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440486; cv=none;
        d=google.com; s=arc-20160816;
        b=WLdkqYaPxHVKjRfcuyDkmq0UJAnlaXZhujvC5lKdgMpKc5a2sJsiyTtTtoR8PButBI
         PwCl0XJRYr5UkAOdnXxrKoI37dzNf1Ohmm7gpX6ty4TBWt1q74jjFWUcHl/2n9q+r4Ts
         Jmb/tp/SRk1rp0M3raIoloqRDbXxRY+wjfJiv9OMz+m8FVGTeQHIWCuDYWrDdatmvG3k
         aCNvafOSc3RIPw8/rLsp7ZTsWixzhD3niGxri/0Zi24H4+4FKPifg8rwBlS7U+2jBeX0
         CvsOtGPydj7mKJ1vFKJdC4jbw1p4fV8CVlnpn+YUh18XTELqAaL06LmZXOFI1WURapnS
         TPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7uJJG0JUNNn26kxyjZ7e+2zZH+twak0UtrO5PhAiUUE=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=fkOTUsklrll5CnFsqMlX9boKfKyMGXe+Bvy9Rxmh+/wHJ69ddPqSmtUwMQAs854Ass
         gl1Za/oCoSAgBnTwKATXlQ+/fBmqjEneoLUGBMVz+IBkbea4mHJVyUj4dSAMiHW69E39
         pRfQ3jB4aIvvkwdXv/BQAMHP3m+vrzJ0zOJRLITVLofEnNa/eFMP61nO0gUTUkC38M/I
         LpSvct0nlvzfDvBmDB0VZTLTI9+tv1XV+4Ka+dHiPpoZNIgTczsuZ84JtVyn5jk2M4ig
         GI3yaeWxTcCEOibjLN50AbACFeAYGA1LWscT27d/a569JJPOA2uUPB59udOhPsOb+VQo
         Uv5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qM/8VSGr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020ac85b4c000000b00403be3a4086si4810326qtw.338.2023.09.11.06.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qM/8VSGr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMQ-0005hY-7b; Mon, 11 Sep 2023 09:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMO-0005gQ-N8
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMI-0003A3-2w
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso50954975e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440424; x=1695045224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7uJJG0JUNNn26kxyjZ7e+2zZH+twak0UtrO5PhAiUUE=;
 b=qM/8VSGr0NSTo9A6n0Z+m0Eb/TecFPWPvVMPHeTDKPz3IR330wSBrUqiu6GHqJWiC5
 9WPLYAz5+yTfbGByTFDkQPjB5cgY9qEIinvTijE6LLYhaOnZ/7UpdWRTf0hnf4eDbBcO
 rqD3HvhMjMjlXfv0I6KGtfSY165RnhWl5GWNcF5WHJyDIYFMx0Ny8XnCKWj79WlKqNQH
 r6LrBMZ0xfNKz7k+hQV0ku7wncvcJxanKheJ5Z9ag630tHptThX8bCPN6ahsFgLTzTc4
 6zuJ6qN9sy80ZGxdLepICXMBg8zUxTbigCm6/MBz1AAb1gHwMOvclx3zWiR3U/rVDxw2
 ayqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440424; x=1695045224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7uJJG0JUNNn26kxyjZ7e+2zZH+twak0UtrO5PhAiUUE=;
 b=OoAKH8RSGHjVo7SoiRasz8vbLh7tN15UQhtuuUFvrptBrVK9l2yZzSODaruRWC/MpP
 7Jwk4ONT+/f9ZlMB1rszZZl7FYP9OarbX6UlEY74S80Rl2B2DRRVoO3NNX+euzqJUneK
 MJUR7+yV/UgDCmgj//9AjDwKLIFOVWK8j2mKhjSRtMvA23rEzo+sC7GczPinHG9NM37/
 bFfvWJBbOA9Cjti/AbTDN0POnR1QIXx7+OSvW2oSbUcM7M9se7krhqgO3Slxz7t8+ZR8
 Jbu0t/o8VIeXwdFINU74Df1PLA4IvFFycysMucZkWRY+C9BhsBC7Or+dpdfKvXKENNuz
 EWOQ==
X-Gm-Message-State: AOJu0YxudgNh1d4J5oj7lIjcQSg+VVwo4DL0SB3H1SODgNxNG+M2dhmo
 Ph97O/Mq00d6j192QFCtoXSt+nyYQPMA6AVMxSE=
X-Received: by 2002:a5d:684a:0:b0:314:124f:12be with SMTP id
 o10-20020a5d684a000000b00314124f12bemr7493994wrw.3.1694440424323; 
 Mon, 11 Sep 2023 06:53:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/7] linux-user/elfload.c: Add missing arm and arm64 hwcap
 values
Date: Mon, 11 Sep 2023 14:53:36 +0100
Message-Id: <20230911135340.1139553-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: UDKIeHdT0xbV

Our lists of Arm 32 and 64 bit hwcap values have lagged behind
the Linux kernel. Update them to include all the bits defined
as of upstream Linux git commit a48fa7efaf1161c1 (in the middle
of the kernel 6.6 dev cycle).

For 64-bit, we don't yet implement any of the features reported via
these hwcap bits.  For 32-bit we do in fact already implement them
all; we'll add the code to set them in a subsequent commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 5ce009d7137..d51d077998a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -402,6 +402,12 @@ enum
     ARM_HWCAP_ARM_VFPD32    = 1 << 19,
     ARM_HWCAP_ARM_LPAE      = 1 << 20,
     ARM_HWCAP_ARM_EVTSTRM   = 1 << 21,
+    ARM_HWCAP_ARM_FPHP      = 1 << 22,
+    ARM_HWCAP_ARM_ASIMDHP   = 1 << 23,
+    ARM_HWCAP_ARM_ASIMDDP   = 1 << 24,
+    ARM_HWCAP_ARM_ASIMDFHM  = 1 << 25,
+    ARM_HWCAP_ARM_ASIMDBF16 = 1 << 26,
+    ARM_HWCAP_ARM_I8MM      = 1 << 27,
 };
 
 enum {
@@ -410,6 +416,8 @@ enum {
     ARM_HWCAP2_ARM_SHA1     = 1 << 2,
     ARM_HWCAP2_ARM_SHA2     = 1 << 3,
     ARM_HWCAP2_ARM_CRC32    = 1 << 4,
+    ARM_HWCAP2_ARM_SB       = 1 << 5,
+    ARM_HWCAP2_ARM_SSBS     = 1 << 6,
 };
 
 /* The commpage only exists for 32 bit kernels */
@@ -540,6 +548,12 @@ const char *elf_hwcap_str(uint32_t bit)
     [__builtin_ctz(ARM_HWCAP_ARM_VFPD32   )] = "vfpd32",
     [__builtin_ctz(ARM_HWCAP_ARM_LPAE     )] = "lpae",
     [__builtin_ctz(ARM_HWCAP_ARM_EVTSTRM  )] = "evtstrm",
+    [__builtin_ctz(ARM_HWCAP_ARM_FPHP     )] = "fphp",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDHP  )] = "asimdhp",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDDP  )] = "asimddp",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDFHM )] = "asimdfhm",
+    [__builtin_ctz(ARM_HWCAP_ARM_ASIMDBF16)] = "asimdbf16",
+    [__builtin_ctz(ARM_HWCAP_ARM_I8MM     )] = "i8mm",
     };
 
     return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
@@ -553,6 +567,8 @@ const char *elf_hwcap2_str(uint32_t bit)
     [__builtin_ctz(ARM_HWCAP2_ARM_SHA1 )] = "sha1",
     [__builtin_ctz(ARM_HWCAP2_ARM_SHA2 )] = "sha2",
     [__builtin_ctz(ARM_HWCAP2_ARM_CRC32)] = "crc32",
+    [__builtin_ctz(ARM_HWCAP2_ARM_SB   )] = "sb",
+    [__builtin_ctz(ARM_HWCAP2_ARM_SSBS )] = "ssbs",
     };
 
     return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
@@ -696,6 +712,20 @@ enum {
     ARM_HWCAP2_A64_SME_B16F32   = 1 << 28,
     ARM_HWCAP2_A64_SME_F32F32   = 1 << 29,
     ARM_HWCAP2_A64_SME_FA64     = 1 << 30,
+    ARM_HWCAP2_A64_WFXT         = 1ULL << 31,
+    ARM_HWCAP2_A64_EBF16        = 1ULL << 32,
+    ARM_HWCAP2_A64_SVE_EBF16    = 1ULL << 33,
+    ARM_HWCAP2_A64_CSSC         = 1ULL << 34,
+    ARM_HWCAP2_A64_RPRFM        = 1ULL << 35,
+    ARM_HWCAP2_A64_SVE2P1       = 1ULL << 36,
+    ARM_HWCAP2_A64_SME2         = 1ULL << 37,
+    ARM_HWCAP2_A64_SME2P1       = 1ULL << 38,
+    ARM_HWCAP2_A64_SME_I16I32   = 1ULL << 39,
+    ARM_HWCAP2_A64_SME_BI32I32  = 1ULL << 40,
+    ARM_HWCAP2_A64_SME_B16B16   = 1ULL << 41,
+    ARM_HWCAP2_A64_SME_F16F16   = 1ULL << 42,
+    ARM_HWCAP2_A64_MOPS         = 1ULL << 43,
+    ARM_HWCAP2_A64_HBC          = 1ULL << 44,
 };
 
 #define ELF_HWCAP   get_elf_hwcap()
@@ -851,6 +881,20 @@ const char *elf_hwcap2_str(uint32_t bit)
     [__builtin_ctz(ARM_HWCAP2_A64_SME_B16F32   )] = "smeb16f32",
     [__builtin_ctz(ARM_HWCAP2_A64_SME_F32F32   )] = "smef32f32",
     [__builtin_ctz(ARM_HWCAP2_A64_SME_FA64     )] = "smefa64",
+    [__builtin_ctz(ARM_HWCAP2_A64_WFXT         )] = "wfxt",
+    [__builtin_ctzll(ARM_HWCAP2_A64_EBF16      )] = "ebf16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SVE_EBF16  )] = "sveebf16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_CSSC       )] = "cssc",
+    [__builtin_ctzll(ARM_HWCAP2_A64_RPRFM      )] = "rprfm",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SVE2P1     )] = "sve2p1",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME2       )] = "sme2",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME2P1     )] = "sme2p1",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_I16I32 )] = "smei16i32",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_BI32I32)] = "smebi32i32",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_B16B16 )] = "smeb16b16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_SME_F16F16 )] = "smef16f16",
+    [__builtin_ctzll(ARM_HWCAP2_A64_MOPS       )] = "mops",
+    [__builtin_ctzll(ARM_HWCAP2_A64_HBC        )] = "hbc",
     };
 
     return bit < ARRAY_SIZE(hwcap_str) ? hwcap_str[bit] : NULL;
-- 
2.34.1

