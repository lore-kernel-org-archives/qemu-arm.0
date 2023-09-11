Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1360302ejx;
        Mon, 11 Sep 2023 06:55:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRnENEZ6bGt5JSUnGrdFiaRHwwjIcYaVpNkzYT+h81soqv+6EwacLyrb8Z4GSFszbbKaxT
X-Received: by 2002:a0c:cc8b:0:b0:64f:3de6:d502 with SMTP id f11-20020a0ccc8b000000b0064f3de6d502mr11097100qvl.5.1694440512320;
        Mon, 11 Sep 2023 06:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694440512; cv=none;
        d=google.com; s=arc-20160816;
        b=ZAmkT6S3ocORuW0nlLI31lfTqNd8yXgnGmd6HB3mobZjDT7L/SaLocIqffyqQIdwvf
         U8HXc4ZpGll2cdsURIrZ4A3bOH2m8G4FWjtd8VN4QtFUeOHSC318HDDh1JI6ZSD3To+w
         w2Sj1xsX8UuvQ246EG3ZprMx72Nlc2wPo+/FDWa2dNrPGMeoHjkMW6JGAKf6fXYh2UsT
         uIYgqU97SbZDUaK97mAfP3GblJWKFK1duEY76gvNf21dnk+4Mkag/s1tnpwUbQZBW8IR
         suKsKBbYkuqgLLdVizVcLrZhLXNYLInVAIvku4tMZ1gN0Is/VqxaRUtwpJEogR6orOGG
         FUpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7xwR18hbzVHxpKvFfeyl3S2ZQU85H+wD13Io+R8gRBg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=YAStCbwzAXYaJFA6cyP3Qo003HLHNOFbz7WbepSQXa+dNGDRhX7MlqYpCTyQBQolKj
         cNci12Ma9hfWqKLSxhnZu/s4mMO14REtndDT5L+yA+xHh4FQbKo3dXjLQlwCi+gft3UD
         a5G5n0w9R46UksFb4ry4WrTDtN7Gm6l+9g/NaFJN6A/BuTqoNHG/+qghmGMe4PE8UNA0
         J/Ex4y7RjNKpsCoka0Q/JKmvkN1CO8I1UaafG2HBDo7N+9foG/IsIWgbXGZjdjDoQTA5
         W72utLyRKOAKjiI57jDdxeO/+Sm1DIRqmzW2H+X3EXXXVyny3ViW0L9ZH5eNSMxdqdbC
         0IIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wtplurwc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05620a430b00b0076ef0378208si4660768qko.731.2023.09.11.06.55.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 06:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wtplurwc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfhMS-0005mS-Tc; Mon, 11 Sep 2023 09:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMR-0005iP-FY
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:55 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qfhMJ-0003AB-7S
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 09:53:55 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31fa666000dso1047291f8f.2
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694440425; x=1695045225; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7xwR18hbzVHxpKvFfeyl3S2ZQU85H+wD13Io+R8gRBg=;
 b=WtplurwcAyq6S4cZXC9uJh0segdLG5IAeNe9OHmj4GRrCML3HKCb+ltNB/yy2lVixK
 tMZGzRLfFDvCODB8QvPRL6KqaEk0qYCbWkrjjhLSSck/miCJ67VE6uP7SA/mZOXIWjo+
 XLiyYujYxVXWxXWVyOQjDff1QgizkBzsmvDTJu0uQOBqhoJ4jLgBYk+mxgIZEJlqBvqY
 ydscKvCrgIc/rntur/VID4TJQRGu0TzMK2GVWRbQFnaH0tB8+z7rLKq6JGIzR/UyIWGS
 WjemK9oBPx/z61B3WU/O0SAKX4iycLU/mk5jP25xIgecmSlop2OdasUQN1IjNuhUc7fB
 QjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694440425; x=1695045225;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xwR18hbzVHxpKvFfeyl3S2ZQU85H+wD13Io+R8gRBg=;
 b=IEJqUCEVUohHMzTALjFzM7rVQQF3eM2PDWOGhidlemYvWOq3a1uft+wBhHo/CCwYDj
 IYGaKvucISEkXvslZg/xlxFnRXJa0qZq5Xfln4Ik7M2PB8ruaCxUVOMg0MnBWryxWoq1
 HKK8s0wQpinxBtw5/aApR9rxssY2wilrHctZTkGu4tptwfERDjeT1e6ksZ3UfuciO88K
 DqDqXxz+Ub7lfJDuKHlpoPOLlOCGID3TkiCYo8zw0A/ngqRkzWQz2/wjjpf78F9Asf8D
 xXzhWmlOHOSkey/WeHdWFmxPmhgyhQHdsq+FY7ruyblrCj4P/WB5eJ6DhaIt0UFd9rGC
 IWWg==
X-Gm-Message-State: AOJu0YxTPX5osRYERhMRh7eY7p9p4k2LLnUXND/ynxj5ZoatFjGBTBn6
 w+uYXfieMmnCqownIbvbaU/YoMBRIZ7fBf37QFo=
X-Received: by 2002:a5d:4702:0:b0:31a:d9bc:47a2 with SMTP id
 y2-20020a5d4702000000b0031ad9bc47a2mr6719854wrq.53.1694440424799; 
 Mon, 11 Sep 2023 06:53:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d4983000000b00317ab75748bsm10079758wrq.49.2023.09.11.06.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 06:53:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/7] linux-user/elfload.c: Report previously missing arm32
 hwcaps
Date: Mon, 11 Sep 2023 14:53:37 +0100
Message-Id: <20230911135340.1139553-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230911135340.1139553-1-peter.maydell@linaro.org>
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: 2etGXDe9Lzph

Add the code to report the arm32 hwcaps we were previously missing:
 ss, ssbs, fphp, asimdhp, asimddp, asimdfhm, asimdbf16, i8mm

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/elfload.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index d51d077998a..bbb4f08109c 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -506,6 +506,16 @@ uint32_t get_elf_hwcap(void)
         }
     }
     GET_FEATURE_ID(aa32_simdfmac, ARM_HWCAP_ARM_VFPv4);
+    /*
+     * MVFR1.FPHP and .SIMDHP must be in sync, and QEMU uses the same
+     * isar_feature function for both. The kernel reports them as two hwcaps.
+     */
+    GET_FEATURE_ID(aa32_fp16_arith, ARM_HWCAP_ARM_FPHP);
+    GET_FEATURE_ID(aa32_fp16_arith, ARM_HWCAP_ARM_ASIMDHP);
+    GET_FEATURE_ID(aa32_dp, ARM_HWCAP_ARM_ASIMDDP);
+    GET_FEATURE_ID(aa32_fhm, ARM_HWCAP_ARM_ASIMDFHM);
+    GET_FEATURE_ID(aa32_bf16, ARM_HWCAP_ARM_ASIMDBF16);
+    GET_FEATURE_ID(aa32_i8mm, ARM_HWCAP_ARM_I8MM);
 
     return hwcaps;
 }
@@ -520,6 +530,8 @@ uint32_t get_elf_hwcap2(void)
     GET_FEATURE_ID(aa32_sha1, ARM_HWCAP2_ARM_SHA1);
     GET_FEATURE_ID(aa32_sha2, ARM_HWCAP2_ARM_SHA2);
     GET_FEATURE_ID(aa32_crc32, ARM_HWCAP2_ARM_CRC32);
+    GET_FEATURE_ID(aa32_sb, ARM_HWCAP2_ARM_SB);
+    GET_FEATURE_ID(aa32_ssbs, ARM_HWCAP2_ARM_SSBS);
     return hwcaps;
 }
 
-- 
2.34.1

