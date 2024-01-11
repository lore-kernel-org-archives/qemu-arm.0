Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1922576ejs;
        Thu, 11 Jan 2024 11:26:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH133FC+ry1xUIfM6GsIP913x1I6eGu0jN7J9PkM6fNVo16lSCX3XtauQ833sw2koXX2Rqi
X-Received: by 2002:a05:6102:30aa:b0:467:37b:c256 with SMTP id y10-20020a05610230aa00b00467037bc256mr301212vsd.42.1705001167127;
        Thu, 11 Jan 2024 11:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705001167; cv=none;
        d=google.com; s=arc-20160816;
        b=0/RBMHjhNeeFVqIErk7/6YJW+SrFeeNG495xTVNCe4M9pcR8V9n9cF2gbqGsBc5pEJ
         /lUZ9qiqUh6AKw0eRLndiNMQFRfvWpWkl5T5a84oEEyuyxSRiQ7mLRiUy5Co0+NI25jv
         qlyE+6zVqoQqtO8TS+Q9i1IIpXO+s36Ei9F4Uf4mn0agKtzDFAWxh8/6mespo5p2hsm5
         GUuP8xRiYSIHYbRDiJprF2Fi/op0x/4se+jlDoFOZJ6bHfcV1+i2pTN37+65+IlKMAt9
         yrxJu/ZlwleMxcHzoxj4qoHBZmmdXeuM+QSxlvxvT3rYC0A4yeWPCZCI1VJBBNwrLH+g
         VeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=yU8Bwsv4Ub+jQ+i0pE2G4S+631LJCrBTTrKsYCnLbHQ=;
        fh=ecXz5+IsThWE6dkme7ssyphrG7iw98FSg6CfeHJWVBk=;
        b=YsqxAiNl2VxwcbothaU32K8mgcJuxC/OO0CJaZh1jNcqbJsMLhqS2WUsDEnQ82YYMp
         8WiI8trVCQCfRopStvpgZNn6Hf8vAB9EqHMm2ukPkoFkFV6bnNT07k9KBG0bXMShYZBQ
         e7wqbU12FP/dx4FblhLPuHpgcUD55Cjanx1vwalFNVR7JWyHm11w/bHeaB7SakiKGpcP
         FhtBBQJ9/6bAWX1jx/z322U3bU5sEIvXgnyRwEFoAPRJxJUaraLlg7tP+p57wjUGEe4+
         x+5tfaJeinTRLhEvk5aL4hDtFne/rf3JDZkYqdY33h2bYmRZDmMinqCqMVn87iDmNROZ
         q0Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=aNudt8Lu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f16-20020ac859d0000000b004297dbff4a5si1612921qtf.186.2024.01.11.11.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jan 2024 11:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=aNudt8Lu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rO0gS-0005xH-7k; Thu, 11 Jan 2024 14:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rkCgZQQKCOMKQbZLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--flwu.bounces.google.com>)
 id 1rO0gN-0005vF-6Y
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 14:25:39 -0500
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rkCgZQQKCOMKQbZLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--flwu.bounces.google.com>)
 id 1rO0gL-0004GW-Ib
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 14:25:38 -0500
Received: by mail-pf1-x44a.google.com with SMTP id
 d2e1a72fcca58-6d9c7de0620so4813544b3a.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jan 2024 11:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705001134; x=1705605934; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yU8Bwsv4Ub+jQ+i0pE2G4S+631LJCrBTTrKsYCnLbHQ=;
 b=aNudt8LuQu9NormYn7L9T8QBlXiOQEYkLynCzXD/hG3zU07SdHWG/pjQCaD+Flz1Tz
 liQWJ6iUzAknoNFw5eeidkLM2qLPH9A0DGU4Gjxa+hWUI3YzRxekXu8TlcJQFgk0gRuV
 9auppJ+Y5k9PvUKiTssyzVw+BwPMZ71Vw9Oj/vLP79MhYzcoP6k2W4VFxnLW+FRz0lIG
 FWyu3D0oYiwtItwQW2eJAxoFMe743bNuzC1ZLabt1FVm+Tr5Z10rQHxB8PNGIomiuHkL
 9PoBIDErzXXspQvDMyhOt12HNq0Cprslz0RCCXdhM6B0A9ud9cxm26C6UpfQx4xNBprc
 gCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705001134; x=1705605934;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yU8Bwsv4Ub+jQ+i0pE2G4S+631LJCrBTTrKsYCnLbHQ=;
 b=uIpgGWEyKh3A2vY8Kr+0CJZOVFrCbU21AsaJZ4eEwKa+AjUvNd1fk5bXS1FnsDqvJn
 BL3u1WCShIWCJB6Co1SFAQd6AcybxneBhJGvzjdyi9g77lfBYM9rK8uSNIhjF7ZzRUzc
 WzRy1UAe4cbylqNIfFp5ETgKgTeDggLIFCdVuPqwESi4toYiQEPitTFJnbrcdQIuFqHE
 +15RpR8z8LbzsRQa30E7ejqAQlItLit4xn4l0/7Z5fznJ5Po4miO+M8BKVXh4Phkv+50
 kGp9q302WCmdayUl29YRC7Suath4tVD2719vOBsPf9MKtpkJiCun9Sx4mfETl0XLJZqb
 YTGg==
X-Gm-Message-State: AOJu0YyJu5oTKtHSE1HXEhD1da2w8vKm6FmiB8GJsZbqkq2nBxfe/O3j
 MUuV3eTT2pLOwXcU72waIoVqgnuWeLIxwrQ=
X-Received: from flwu-kvm.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ceb])
 (user=flwu job=sendgmr) by 2002:a05:6a00:228b:b0:6d9:430d:ee59 with SMTP id
 f11-20020a056a00228b00b006d9430dee59mr30119pfe.2.1705001134588; Thu, 11 Jan
 2024 11:25:34 -0800 (PST)
Date: Thu, 11 Jan 2024 19:25:22 +0000
In-Reply-To: <20240111192522.2795498-1-flwu@google.com>
Mime-Version: 1.0
References: <20240111192522.2795498-1-flwu@google.com>
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240111192522.2795498-2-flwu@google.com>
Subject: [PATCH 1/1] SMBIOS type 8 should use T8_BASE.
From: Felix Wu <flwu@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Felix Wu <flwu@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::44a;
 envelope-from=3rkCgZQQKCOMKQbZLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--flwu.bounces.google.com;
 helo=mail-pf1-x44a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: c/cyFC1HIjWF

---
 hw/smbios/smbios.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 2a90601ac5..7dda84b284 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -591,6 +591,7 @@ bool smbios_skip_table(uint8_t type, bool required_table)
 #define T2_BASE 0x200
 #define T3_BASE 0x300
 #define T4_BASE 0x400
+#define T8_BASE 0x800
 #define T11_BASE 0xe00
 
 #define T16_BASE 0x1000
@@ -775,7 +776,7 @@ static void smbios_build_type_8_table(void)
     struct type8_instance *t8;
 
     QTAILQ_FOREACH(t8, &type8, next) {
-        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
+        SMBIOS_BUILD_TABLE_PRE(8, T8_BASE + instance, true);
 
         SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
         SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);
-- 
2.43.0.275.g3460e3d667-goog

