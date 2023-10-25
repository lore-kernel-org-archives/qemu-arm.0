Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540456ejb;
        Tue, 24 Oct 2023 23:54:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET5v6Ji8mwG011y3lT+D5dF6ZM9EfZ4MYnpKeOiKy5ekIt7/+VydVQBF+fYZmMlJXoBhGF
X-Received: by 2002:a5d:4e06:0:b0:32d:a686:dedf with SMTP id p6-20020a5d4e06000000b0032da686dedfmr9735125wrt.57.1698216882907;
        Tue, 24 Oct 2023 23:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216882; cv=none;
        d=google.com; s=arc-20160816;
        b=hh6Q4l4qQXz1TtnBbHrWGG/bYOyu9HEm+OtTZONk63+3amhUKUtZ8rbEP7A2Ii5rI8
         yAo77pTs42hDNUMtspKovyUPT8ohdSStj8bhA11YxLJ+w9rUas76m6km7uyQpZLIKKZL
         KicQ8P+asz4JIUBG8YV852d50hV7ZvqwAESAYMaRpJyMmENurbw3hWD9PmjDqqksJtyN
         mzBsq+5wX0aNQoU0E395NV3/Io8ucp+NelWagqu312nXcthTDPgMoA3o3M11R9L90ZNp
         wd1PG8tec4y5dyHFXzUhRIDWLugLP3EmOfq9f9lwT46/Ch4qkZUiP3cTc4yzBBBi8UPY
         y3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u9mQCUmt8kL3bXixksm+1XQHmEqrWqER6ahfYoxRZEc=;
        fh=CtzI2pkgytRcYhpGzM67m6gnAwNIi1NtjpQyBuo6/eI=;
        b=lL3IGrTj+ZsgujWeyEJhFfO+sScDS2MenhfZVG+XiQzHwDneLK0Va8UuPzkVywD8UW
         XB0pYOpHiiMVuU/CjNHPGW2nvyTINXO6u2W7RiXjl/C6LH+w7KiVEV8uBIBbUTrBrcMs
         c/PIdvN9ITqDbpDhIoo7LK/xoOnldIg1o/xk2d9CUBe7XH5HIQBGz4t356JF4EHrYxj1
         9SvHZjPd2ccsF3uK/02a4pSmy+SCtVjDg4rgZsWpJrOfnUW0de7KdVUUHzbI/AujXSF0
         bqFcTxmQzUH6QAhShIEHofuBMFlZYzNSqa+vv8BHCOrvjUgsmv/FUWjkw+wFuf3s9ZLh
         c6Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MtSD5rZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8-20020a5d49c8000000b003232f6560ffsi6971852wrs.925.2023.10.24.23.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MtSD5rZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXmh-0000Om-8h; Wed, 25 Oct 2023 02:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmK-0008UI-3q
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:54:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmG-00071Y-Fn
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:54:07 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32db188e254so3697352f8f.0
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216843; x=1698821643; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9mQCUmt8kL3bXixksm+1XQHmEqrWqER6ahfYoxRZEc=;
 b=MtSD5rZgKQNd2IFPvtVq1DvoGwI2nloseF5bTCk9qED0pTxFnoS16Z64X4fIDt7TA+
 S6yqvlJUj9BVS7OpqcNBFiaEdiCh0pDon8ABdCFt4uj3xocVkp97hY1b3n3ufi9z9v7b
 GD5o4bIqL6wPn7umAlusxUTJQfJh3KV8WqmU3VAdKYzCO3kQF9WZgtgB6NHxiPgGi3+a
 dZoKs+lQ2ZMas6ZwvOTceGJpl7J3e/EW0flGjjl5DEibO86PVS0RoRoj5rrnukHnROu8
 0T6Bvih0qF0NQVeGQFTV/n6SYWKAPmH7zzTCCP4cRBjV7yHxQ0BNzuCU2KnLqfw51qg7
 p/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216843; x=1698821643;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9mQCUmt8kL3bXixksm+1XQHmEqrWqER6ahfYoxRZEc=;
 b=DFJxQjpmuHyv5pSttKDsJNaGhyNfQdUVncGzN6+7tZEaokFVKQsXCUy8egXob1qXlj
 wETXguHc2RhReuosxcEON7b5Hwx/If91XinKAZ9qgenLuhSEfSm4Y0Z/LpaUeNoxZ34S
 NV5JSmqgi/If5o/IJ1NH0ZFh9aCAoovOXSTMMjmMaUKsGwWo4ib99yaiAL806cjF0A9Y
 zifb3r+Q8fSPycZuNSqhcSD5XPIuIa7BoVCOD+J37fs4Ys0lJIwkCvYaHgpqVwdvEyYH
 FGY9ZOJX+n+xmunM6DKYldrROr2NfWAI5SuD5zFGMt6sy+C7qZM48S2ljQi7eFkvSEzZ
 9ZLg==
X-Gm-Message-State: AOJu0Yzl67vSbdCAKEKTNAg2zv2/Vz1fwNSz6HH7fEZ2SBP7R/oluezM
 DdfxVO/HmwevDDLZQVwLgIcitQ==
X-Received: by 2002:a5d:5190:0:b0:32d:a101:689d with SMTP id
 k16-20020a5d5190000000b0032da101689dmr10595910wrv.56.1698216842996; 
 Tue, 24 Oct 2023 23:54:02 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 g11-20020adffc8b000000b0032dc24ae625sm11345346wrr.12.2023.10.24.23.54.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:54:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH 07/10] hw/arm/fsl-imx6ul: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:13 +0200
Message-ID: <20231025065316.56817-8-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: 5+GkifWWMs0f

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx6ul.h | 1 -
 hw/arm/mcimx6ul-evk.c       | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 63012628ff..14390f6014 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -17,7 +17,6 @@
 #ifndef FSL_IMX6UL_H
 #define FSL_IMX6UL_H
 
-#include "hw/arm/boot.h"
 #include "hw/cpu/a15mpcore.h"
 #include "hw/misc/imx6ul_ccm.h"
 #include "hw/misc/imx6_src.h"
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 3ac1e2ea9b..500427e94b 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -13,6 +13,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6ul.h"
+#include "hw/arm/boot.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
-- 
2.41.0

