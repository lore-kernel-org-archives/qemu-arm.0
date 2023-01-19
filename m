Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp388978ejc;
        Thu, 19 Jan 2023 06:59:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvoTpTjdpaoF3hMIQjbSB2CkVBR96S7/9tXi0KD9w8aBSP4BMYoyMtJAgfNDnJhDh5Pn4cx
X-Received: by 2002:a05:6214:3707:b0:534:6da3:d35e with SMTP id np7-20020a056214370700b005346da3d35emr16760612qvb.25.1674140355237;
        Thu, 19 Jan 2023 06:59:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674140355; cv=none;
        d=google.com; s=arc-20160816;
        b=PD31P0S09a8uDpDmRHMDNBifIoy23nYqYQtDGGq89Tmu6SBHSWIhBVNJMNnIg/Jv/x
         3CUafDwAr1AOfDLW0vhYWTyHRLNTTjiGRyzfRHwB7hAwb48IgqrgVCeY7sl3A3e6qg8e
         jCPUphg38NVdd4J5Ip/Q08YfgktY3ZG20kCyFMZqVIq+tBy6C/LQh7RiAoNYFgb6PRtY
         NGfWb0EJGfDJEA/ggUU3wV4GMTD9wboZQzDrsahfuEOfrFvFzPtgYm7WhETn0poE+Fiy
         KBWJNZ4N5g4QOMJ06A7xXgNb4u1J4DvzBld1j1mVVl95lnUzsYJJDgz0MkZGh5Ru1UL1
         Em/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
        b=d4Yn60735D1Hd8u3ZYqFCn0MgRewQvt5nbJC6OB9jEjc19u0lujHtDAKOfcBr6Cekp
         NvU1MMDcBvGB8Pzf4V2DsFDb74pVfI1TTP8z5Z4LuSEvE6dBENh0MQLaB91O4YbEMlWL
         gbzskAmlAQTS2fmxuZnsPwRy1qEt0J93HU+bx9Nb2yrLXmaGf7YApR8hYt0kuL+Y/BcH
         wRlkg4XCZXzjGOJfYJ2VVa261Zf8m3gdfI5jYcZAm2WY76bMPZW1HGVjvDv3qqSVROxu
         fOzFg7e5T1jQKymH1GkBHsjI/XJfXYPn3Tw+dDTI1Do0d3N4oS8BDRsfLbfg3USK37/r
         2QLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yw0+mx5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf15-20020a0562142a4f00b00535564b8b4fsi1031355qvb.505.2023.01.19.06.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 06:59:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Yw0+mx5L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIWNM-00061q-SK; Thu, 19 Jan 2023 09:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNM-00061d-1c
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:58:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNK-0003X9-H2
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 09:58:47 -0500
Received: by mail-wr1-x429.google.com with SMTP id d2so2122581wrp.8
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 06:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=Yw0+mx5LwzWzLqJ65ihZ/F0XociSAqdvsH9CUtFT8zxSAZwHDKKtQPZvOkIT71MloN
 mi3AcikjmPT4Ir59uwycmOBYAjNJbU2OjAn08tOjgbDFWPdBKzi/R9SKheCOYNrYzQ0z
 48viT7/et5oIehZUboxHDeK/nDV/OpXDGrNeE3GjFGRjWvl4CDbNdlnOuWCDWoDwcLOQ
 QsoEOpIXeWjjMYb0TSHZdhQ1+9SYhhyU/TpkkM8E2ZLtuocus3HaOnKlxKpR/T0L4ci8
 sQJExcmh6obfAlITQNo87MGz5C5EriP24LjeCQJbK5XD1L60hoABtRa7hPiGf4Mo1D8a
 cy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=B7rJov/ZFEgT3gAuoqLELLhJxDoxURK5LMJsMCW4RPbPhc1pQKr8GYN7FSyebM2+ms
 1UIOjpzZ2bqHSPno+pTaoVo139d+pdj/SKq2mlOu64qc2uysFrmt1tLSxrxfF+ONVmkd
 7ZK1PYxV5C6zje++za0IPmy84gFlb3d/MAjmEsnkUU3KxhcrwAFmdjO/fFJu0YrCbGqY
 Bm5F/bc4AcLVvCsEOz7fYfFyt++ZlTSO53ULM6BHENicQxYsmIx+bPUt9c+IFVUMwDo/
 Ct5MBmRqSQSYeOLfmaEMNPk7O+tM9qCklAjsxCEOY6SxbflviuEfGI4KCwEuWi4yE+AI
 RtRA==
X-Gm-Message-State: AFqh2kqdrraOuo3ceFnOans/o8GyZdAgLACOwQJIGOE/c/65HqeE9/Cx
 C6faVz2nES1eT8T/cVvJXbE7lg==
X-Received: by 2002:adf:f642:0:b0:2bc:846a:8ea2 with SMTP id
 x2-20020adff642000000b002bc846a8ea2mr10492523wrp.4.1674140325209; 
 Thu, 19 Jan 2023 06:58:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adff892000000b002bded7da2b8sm14136235wrp.102.2023.01.19.06.58.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] tests/qtest/boot-serial-test: Constify tests[] array
Date: Thu, 19 Jan 2023 15:58:28 +0100
Message-Id: <20230119145838.41835-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: lpVEpwmMnxhH

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index b216519b62..3aef3a97a9 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -139,7 +139,7 @@ typedef struct testdef {
     const uint8_t *bios;    /* Set in case we use our own mini bios */
 } testdef_t;
 
-static testdef_t tests[] = {
+static const testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
     { "avr", "arduino-duemilanove", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "avr", "arduino-mega-2560-v3", "", "T", sizeof(bios_avr), NULL, bios_avr},
-- 
2.38.1

