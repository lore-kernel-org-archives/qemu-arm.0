Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp691710njb;
        Fri, 13 Dec 2024 11:36:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtof2jINDtnOQs2XIRtXsnCjlEz589Fmi/Dcwxfwqiti9oS2GYVDjGhoqRc96NVP88VAr1b2Ks4G7+xg==@linaro.org
X-Google-Smtp-Source: AGHT+IGNvYvq1TeE5kR1ZYpvAFQTyP9+O4MvBGwOxeq5Pzrbxtv0DRttXmK1eegrIXvRnoLAPzdx
X-Received: by 2002:a05:6102:3ecd:b0:4b1:1a11:16e0 with SMTP id ada2fe7eead31-4b25db8a923mr4769071137.27.1734118588827;
        Fri, 13 Dec 2024 11:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734118588; cv=none;
        d=google.com; s=arc-20240605;
        b=H4uE2ARNkwXsV0XyikVyoAuewOVG7v3FZIX9fWREYsIwYRj4EvP9GyQBqPWm3dRIXo
         +Wf5UAVMjX1eTZSoFivMlaP8gVlECTqXqAsQPZb7TEqWLYesBL/kYWDZZ+FfUq9DTXCS
         7bKEYA/q9m98wgALctxOsOtDgEpA6oBvuv/NkqANJnLOwWGZmLQ4pyEgBLD/+FuMkMXr
         ml6AzkULWGvmcn/hAszgTSM+OifdnZAdOlwcOqS3RZ+xkDZnbAGNjfnyMslspqvqDq7L
         M4VVH+zPnH3mjNJOKPK4cxXdg7SKwlZnvLDeY3yK/UVXELlkd6LYrfrMKpjrA+15Zhv7
         roxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6I71WCIZYeQ5yV8uCldLsOTnUpTDKGYy0sk8GaKQTI8=;
        fh=r/e+q7SpYDIASRFGYPVumD6SCoNpV1td3Vqvv4MuYcE=;
        b=cDIFJQbLDjJaxIexDOaUinVRHcOwwHx2pY12fepml/XKMOGVVolZnBqVXhLFOWPwQN
         bQW4/3pU0uV0LnEbItj4fINm9ZCxAd9tst8VFwtSCr/GMg6lpKZigz/oPZWlj8+Iphqz
         mCeKnT8QE+UI/j3VQ8VNF55CmtpRKbOticzNSFdYnqYCciB8+BEG7YVuyJRHJ0RsuKet
         NmSPZdO9gTZNKAQxai7k2TuyI8m9X1/bM0Rm5JHmNwIPvXPvafo8f/StxXUSK+WjfJRS
         nW7bHruLZQCi3gHRfDFVUCQrQP4N3vS44+yPprUn9ej6m65I6FmV4it2uTdUcBpMr0nM
         8ODw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cp97yayD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2704b4426si47433137.680.2024.12.13.11.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 11:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cp97yayD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMB6m-0005qW-Ab; Fri, 13 Dec 2024 14:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB6k-0005gj-9e
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:13:50 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tMB6i-0007Sz-Kb
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 14:13:50 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-29e61fcc3d2so1616871fac.2
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 11:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734117226; x=1734722026; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6I71WCIZYeQ5yV8uCldLsOTnUpTDKGYy0sk8GaKQTI8=;
 b=Cp97yayDM4zb9c9kRp16YDDMfoZLMRp6QXyG0Z2dgm+1SREITx+uUauiHPi2rNoby6
 lRSc5RncSifJ2Au8JiHt1d5zotJYrCrXFIaaCa3sWeYlmgMwOGdpXaiNjteFQUx/Zv9h
 j4GojxcE4lPPsWVQDzVAQ2dei5OPWTE/vFPQQiQfqN6epy4btllB5+08/BePd48Dmmu2
 xWON4gq45nEqfA3f5T0B8RwqWg6q1g5DInmnWw2WuBCfBAu45gooS79mW96t0JYJ1w7S
 JO9EX2IHXHYGnh76ymPl44/TOi4ZmvD+WjXojl0+mQozACSwjmS+eqFEw15TZwMGFK+b
 mxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734117226; x=1734722026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6I71WCIZYeQ5yV8uCldLsOTnUpTDKGYy0sk8GaKQTI8=;
 b=oV155p6qBSD122XndrhKAYZz/OUtvNecXl/2INDuchFEJ470vhFSmy4nzvnEfCHUlX
 KtQPsLyMngEzrZmoae4mGOgay7AFcd8nbuEVQK5TCqwp/DUtNAVgTJHuCKVzrV2fbjk8
 HUQz7MHZmsPxmiRzGJ+xNsfaxPmzgt10OSzKe/87HINWVBbWIuZVOxSGbVQR+OwDErVK
 CYD02N49wjVPuBgnAz6G//Vqg+94qMhdBDw8oQUeI9aAhnmxLBp2CTsw1R05ZEt9MTSX
 jd+yOkedpf0LIop+1vBFS0srwasaw/7lq6Q80fVSZZz781wobopSTN5HD+EAiJgQxlK2
 FdWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8+6KAASibS5+ip3JWhr9HMMvafuQ2ZHhGObB69VspOiqB4+egVMOzsPjODD/IccmpdSNM872Bng==@nongnu.org
X-Gm-Message-State: AOJu0YyBI6az/3MN4IiNDlInDtzhzrr9lyAurO0tGHXmmJ3tWcTAsrwl
 TMexgHTgkTPSuXe1n+qagnyjjzeN3+cKfKyr0e/ZO1IOy4FOJ2wt2TsjlkJq8Uk=
X-Gm-Gg: ASbGncuI6vQcM2YMmKxhpn6BKCa5+6IcTSMHHtnbTl2G9+WprFbrAYVEfBKP0pgSCoH
 GSMjHU1mapiYccHKmnguhm612JHw5hzvnJqjhPKwUgnUrSlJL8Mkd4LpEjJieY+DHVNvwXQrKT7
 leaM11waVCFdwCvDRD3eZSXXvLOz/FC/mqpgvwE5Zx7zpt6kyghUAoecbG/lgFy8HFgKCSWOOHT
 VzK4lmhsYRTAd2YEGdGRGsa3tOQMrLKGxlH28h0pNaW+Y9J+lgD0/a0tr1tuOAb
X-Received: by 2002:a05:6808:2208:b0:3eb:4b4c:80d8 with SMTP id
 5614622812f47-3eba65ba0admr1866208b6e.0.1734117226116; 
 Fri, 13 Dec 2024 11:13:46 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3ebb478a497sm3545b6e.10.2024.12.13.11.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:13:45 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH 39/71] hw/misc/xlnx-versal-trng: Constify trng_props
Date: Fri, 13 Dec 2024 13:07:13 -0600
Message-ID: <20241213190750.2513964-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: T2Kq2TI7cJtU

Use DEFINE_PROP_UNSIGNED instead of DEFINE_PROP_UINT64
so that we can set the PropertyInfo during initialization,
instead of updating within trng_class_init.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/xlnx-versal-trng.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
index 86905479b8..2f6af4f680 100644
--- a/hw/misc/xlnx-versal-trng.c
+++ b/hw/misc/xlnx-versal-trng.c
@@ -660,8 +660,9 @@ static const PropertyInfo trng_prop_fault_events = {
 
 static PropertyInfo trng_prop_uint64; /* to extend qdev_prop_uint64 */
 
-static Property trng_props[] = {
-    DEFINE_PROP_UINT64("forced-prng", XlnxVersalTRng, forced_prng_seed, 0),
+static const Property trng_props[] = {
+    DEFINE_PROP_UNSIGNED("forced-prng", XlnxVersalTRng, forced_prng_seed,
+                         0, trng_prop_uint64, uint64_t),
     DEFINE_PROP_UINT32("hw-version", XlnxVersalTRng, hw_version, 0x0200),
     DEFINE_PROP("fips-fault-events", XlnxVersalTRng, forced_faults,
                 trng_prop_fault_events, uint32_t),
@@ -694,7 +695,6 @@ static void trng_class_init(ObjectClass *klass, void *data)
     /* Clone uint64 property with set allowed after realized */
     trng_prop_uint64 = qdev_prop_uint64;
     trng_prop_uint64.realized_set_allowed = true;
-    trng_props[0].info = &trng_prop_uint64;
 
     device_class_set_props(dc, trng_props);
 }
-- 
2.43.0

