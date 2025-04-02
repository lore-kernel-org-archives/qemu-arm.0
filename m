Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3751978njd;
        Wed, 2 Apr 2025 15:24:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtKX/TcU4yc7Ly9+ElGcSZbvhPlVDHJkTPwrclB7j6N//xrcVE9lF5kRpVhH6EVrQECr37PFB+bHZ3DA==@linaro.org
X-Google-Smtp-Source: AGHT+IFyYB4eY0+Js3xynCqZtRJwM7+CUcKfkZ0kNVxJjKELfEXFalmdXwTz4W2Wuz79ceuXlcSN
X-Received: by 2002:a05:6214:29ee:b0:6e6:630c:71e8 with SMTP id 6a1803df08f44-6eed5f61810mr320044736d6.7.1743632678325;
        Wed, 02 Apr 2025 15:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632678; cv=none;
        d=google.com; s=arc-20240605;
        b=UCuF3RJIDd2kVUV+aoqKMeV6/Img9oea4xbWuJILAQxwJQ1V2w6Low6yelik4jQiXe
         eqU/9NFDtafjdSolLd1q79id/sGFM1bc+zEELZgklurqYc9PxKj9NNY+u0aLGfQCcrGw
         4V9JlLecXCcWlGiodUyc7pM60VFMA2eoomQBB7r4b+i6Yot2G1lZrL5obrmjeePRorYn
         iWOVQzUUJgwutbOeP116h3yCMip0oVmPhuSujGZzCXY1rT6QymnWEyqkbayfWjDoJwoi
         BolTNFhDc7JXRI1KKw1nbj9KGYmv31BTyA6Lkz7RrPJlqOdq/mUbzMzrbBtw6E9SsHaU
         LK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yBN+/AU+C8lcLjoSEIUWiNE5OcwuaZEeoY9tnHiYWlE=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=Aj1Ai0NkVcgtzOz8V4CSjerDDe98JQobflHPgATV+rUlSvDZchfCiFLxBIn0yp4p/o
         HiPHiGzlLdUZmHivUPTqg2SqyAovVoiOfTgP4YcDVoAMAXqlD7vLt/xNKUVdhv+H1LlL
         buRZT0D1TROR9t07AT/DpT4rDyAnDrSANT1AXSNTH4McYmxbFha+pkdOsH6gT2N9ZkCK
         Ri6Xybrn9w4i1o5RCdAwffhpoitjqFccPhqPakSmnVYSacy3ljoJr3w0Ol1EHdbxl+Sj
         pvraqbRzdHoKVI6wlWt5gmblO+z0bfDQgDNskl8lGgP5RER+b6QMENr2pRhEf0EuKXHo
         Je7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z5yj+F/h";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ef0f1421f1si268906d6.392.2025.04.02.15.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:24:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Z5yj+F/h";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u06Uu-0004cY-37; Wed, 02 Apr 2025 18:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Us-0004bl-HR
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:23:46 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Uq-0002MG-4p
 for qemu-devel@nongnu.org; Wed, 02 Apr 2025 18:23:46 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so252526f8f.2
 for <qemu-devel@nongnu.org>; Wed, 02 Apr 2025 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632622; x=1744237422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yBN+/AU+C8lcLjoSEIUWiNE5OcwuaZEeoY9tnHiYWlE=;
 b=Z5yj+F/hxZ3uL/cF7VEvlYGa5xtPFCjCKhrVfou0p7J0o//M1kCjTbYciEN4WDZK2+
 IFM6t16hFBtC+cY3ZkRE9pUdyqq/HGY2V1nCTdbkUnqoLJVT7VyHokKvYIkpX1JE83Kw
 epwi1m+01ttfxcH7PHoRHoqOwGqxzVrTV64nwKRcazw5H+dRsdjso+XqXDlVPTJivPql
 9+tITSgbsk7i58BxbrSmbGP6tCOgKauO8hNCk7T2ttFArnLcPz2MI1lDVGTFvuMqazoU
 0ZPmyPXOL7Lmf91lqBpkyNwr5GsCrmhfS+OOywlJZ+6JMamet39j+j8/pPGvXOCZTc8n
 lXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632622; x=1744237422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yBN+/AU+C8lcLjoSEIUWiNE5OcwuaZEeoY9tnHiYWlE=;
 b=XZI066lfUaWbo2HqA11iroJrZiEYn67IIwsQfmACa5betRePq3uGP2m/DlUx7vcoZo
 C1yNL73mdCL4N1NzJUCjutFDnw2thdsgMQUNNwEUFvT8505FCVnPTEpO2PfCprWcNQpI
 gJMnRx4YnWPRpoP8bQD5BC5SXdKWg6sLhV0fFXrqSJRQA/hEeGaI08dwHRdkthgRgCH8
 aOVeOMxqhYij9IVs682uA74t7z3OCcgbLXnzvV/ghsTbOrOA4x452HcUbSnCpfCJSsGZ
 4hb4BW12ZaWHDg3c2g5HeHoHWOYjgMb6QuYOs5XeaFQDFDVR/fzsCdw4ameb3FiB38Ty
 X/yw==
X-Gm-Message-State: AOJu0YzQ1TfvttjsmiQtGcOCR3xYqU9OFN5hVh3jUYPerm3Nb9A1Eg+V
 QbOFVwKAN8+W+MvIqRaGQGOQ0zgx4orHd3X2uoPW0KHHK4fYaqEShDvDx2O4/BSewi/prUagNfU
 T
X-Gm-Gg: ASbGnctlVw7M7c769YoxYBEscqu7Nxyjd4EIZa52VPLcTrpDZw3gljXlvatLVNkH9vi
 IWOlOKFngWMvheuOt1GA/uyxri/7epqYPXDRKQVJ9JMVzmeLrPbuQP9qa33GNYv2bxHmqJOkjkL
 M8z84ONHpe5bIBW8y9jej+x+DnOBoFwUnwBdMsqXI2u9xSDVn+etbLW80ZWEDOwN7csnrXSuLDw
 3sVjNso5B02sEtZBtOK9JWDDw7l7QbHduCU6RpiHLN6FpNSt8KYcCXCD4eELGBE7p1CBvSA51zC
 S/RrN2PEK3u97Z0fc7VrFvKkm0fJi4RcPhrfJ69S/VaZaUC1GlAgxlLusR9ZiU1ftb7fccqoCrc
 5qLWOCK+yTeFi3h65uU8=
X-Received: by 2002:a05:6000:430b:b0:38f:4d20:4a17 with SMTP id
 ffacd0b85a97d-39c29752af5mr4072831f8f.13.1743632621975; 
 Wed, 02 Apr 2025 15:23:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226cf6sm38142f8f.87.2025.04.02.15.23.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:23:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 01/13] target/arm/cpu-features: Include missing
 'cpu.h' header
Date: Thu,  3 Apr 2025 00:23:21 +0200
Message-ID: <20250402222334.66511-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nyVfcMxg9ZlW

"target/arm/cpu-features.h" dereferences the ARMISARegisters
structure, which is defined in "cpu.h". Include the latter to
avoid when refactoring unrelated headers:

  In file included from target/arm/internals.h:33:
  target/arm/cpu-features.h:45:54: error: unknown type name 'ARMISARegisters'
     45 | static inline bool isar_feature_aa32_thumb_div(const ARMISARegisters *id)
        |                                                      ^
  target/arm/cpu-features.h:47:12: error: use of undeclared identifier 'R_ID_ISAR0_DIVIDE_SHIFT'
     47 |     return FIELD_EX32(id->id_isar0, ID_ISAR0, DIVIDE) != 0;
        |            ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu-features.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 525e4cee12f..4452e7c21e3 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -22,6 +22,7 @@
 
 #include "hw/registerfields.h"
 #include "qemu/host-utils.h"
+#include "cpu.h"
 
 /*
  * Naming convention for isar_feature functions:
-- 
2.47.1

