Received: by 2002:a17:906:cd17:b0:9b2:89ee:1eb8 with SMTP id oz23csp1857264ejb;
        Mon, 9 Oct 2023 03:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHVCb6aCnlBKUUx3F1ONs1PJUC/qfBbGyx9o8nTaL/6z4OzmBCjniWDJYophp8AjmRB+VY
X-Received: by 2002:a05:6870:82a1:b0:1d5:f43a:3a5c with SMTP id q33-20020a05687082a100b001d5f43a3a5cmr17791292oae.45.1696845889615;
        Mon, 09 Oct 2023 03:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696845889; cv=none;
        d=google.com; s=arc-20160816;
        b=j2nglveL30heb/qlHGPUk+Q9+tYVPCMsds2rZA//zdJcWMDSPNOFx88+JU6CBiFKmI
         Z7SLNQMyEY55ts7fDsuGnocYeGvSZIDo+Y0nmwP+HTRRPSO41XEDP5Xkbxc9a61mrl5n
         La49uZTc7vMNsZzc2Heg2leUKF5pj6EmcvOBtRZl+M0CdkCDYrgwjqfq0nK9uBB4StHN
         U11ooMlwmrT3DBDMd4mzkzzV8CIFHA1oDFwBqIcgzUXkaaR9BTBAbjZhldxeq8/qRiv2
         HO1Su5ialvvB5oyPqh8DY0ej7ziRaQhquYxZeD+VfjDpkcq9CaZia7d6ZLgDmCtkkwIj
         vulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=41oTD6R/rEUywh5fXwmkk1fZnIoCcZZdSBr5PNChPlg=;
        fh=+UA/OvAzPt1sCt0A7U0kURxgTxGl33GhvbTVlpu8K7o=;
        b=aq0jJYREuhUscPdd+kQkrZUN9JLo3vmYtlpMndCnzyMx4Kjejk61PhetFGOI/ca7Nw
         CvWimpKLAH1Gwvelur5qfkYVFXhl3LcJSYKT9wz11vKGHnFwYCmsEO18X5YHGtjkm7KR
         DydQxK9xuAbDsNyt2xZATjDCPFh1GU43IhKzdDzCi36GZholrT+r0SmMDqY9CIpc3qhC
         eF5o/xtV1sn+uPkeiyyxR3WZZom/TVdoiT2rc2bwtuo018ylZQ/NIuCPyhBnpCKWIIe8
         FGOA5+NnkF4/pFczepmNhEzqbritt2kZhAeed/UGzZCqkX+F+0uW4fuwRt1GrsQMwcE1
         h6Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTmCt5zV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ty10-20020a05620a3f4a00b007742f841ec5si5580404qkn.383.2023.10.09.03.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Oct 2023 03:04:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTmCt5zV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qpn73-0003UK-Ff; Mon, 09 Oct 2023 06:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6l-0003CI-7P
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qpn6f-0000BF-FR
 for qemu-arm@nongnu.org; Mon, 09 Oct 2023 06:03:25 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3247cefa13aso3963531f8f.1
 for <qemu-arm@nongnu.org>; Mon, 09 Oct 2023 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696845798; x=1697450598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41oTD6R/rEUywh5fXwmkk1fZnIoCcZZdSBr5PNChPlg=;
 b=lTmCt5zVWvuSfREsyX5+5q3QyhFC/3EU8hv4Kt0Bj1EwsxjnJihBXjpgWxu8ZDnrrj
 54lNAarh1aLyYBjb/xKhz07yv5v67ifaXr9rI4ngSw6ipUIlTGr7fcVSLTLJuuUmYqDH
 IYbZfO4eb8XY/g1EztLSx8gR4lm3WvFa4GVpYgxqZS/WiHfKYwWo1sycRI7zRtIYwPuY
 /74e7er2tSevzuPFG3hgUEVIbxOd6jhz1qE4GfOBA0kJUCwTPCk/V9kRPvFqi+Mdh1PX
 aJZlGkA9VxrxgXz7MxcC4sBZ/vop6F1G4lXa6WnxDOMOfzfOzJwz+CTw3fj2xRDbdBVi
 Vxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696845798; x=1697450598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41oTD6R/rEUywh5fXwmkk1fZnIoCcZZdSBr5PNChPlg=;
 b=iUW4YGqv2m+aAXOypGKcgScLnn4468TXEKoPpU0/UFQgBw8cPGunV6s8QQP2F37Bvt
 6Md+uem70D+yynazhgyYdME9nBJTRhi8sqIYxZw0D2xSoeNTAs+9oJUnyiqJjkKdjdAw
 DXYqQu0F95Z5ow665DJVhL+kptqe9ThsngNa+RCAVXl5CIxuox5eaw1Rj8whhXlsatPp
 KfkQFwD+Ae3xUUDyccsaPE3TkOPXcNrD+Ax/FIbNTS0qezCtdEkZeKjAFFWZTNqF5S8Q
 pzUphFpjwaV2BE6fcLRcKd6J1f2WdfoafjNnShzEcguJqFH9KAetFAP71J3LdX3oMj/o
 m86g==
X-Gm-Message-State: AOJu0YztMHP88KUwqBnB7VjUiisRQYjS+jhoi0CIlkaJZ9RMMLa4Jeb1
 PLs+36UbOrE2SE99iHW7BH11ej+2g0BctuSnIAw=
X-Received: by 2002:a5d:6a4c:0:b0:31f:8a6d:e527 with SMTP id
 t12-20020a5d6a4c000000b0031f8a6de527mr13848722wrw.45.1696845797855; 
 Mon, 09 Oct 2023 03:03:17 -0700 (PDT)
Received: from m1x-phil.lan (thr44-h01-176-170-217-185.dsl.sta.abo.bbox.fr.
 [176.170.217.185]) by smtp.gmail.com with ESMTPSA id
 f15-20020a5d50cf000000b00323330edbc7sm9152973wrt.20.2023.10.09.03.03.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Oct 2023 03:03:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Alberto Garcia <berto@igalia.com>,
 Hao Wu <wuhaotsh@google.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Tyrone Ting <kfting@nuvoton.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/10] tests/cdrom-test: Clean up global variable shadowing in
 prepare_image()
Date: Mon,  9 Oct 2023 12:02:45 +0200
Message-ID: <20231009100251.56019-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009100251.56019-1-philmd@linaro.org>
References: <20231009100251.56019-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: 02ydi2GzuJyH

Rename the variable to fix:

  tests/qtest/cdrom-test.c:40:50: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
  static int prepare_image(const char *arch, char *isoimage)
                                                   ^
  tests/qtest/cdrom-test.c:18:13: note: previous declaration is here
  static char isoimage[] = "cdrom-boot-iso-XXXXXX";
              ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/cdrom-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index f2a8d91929..0945383789 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -37,17 +37,17 @@ static int exec_xorrisofs(const char **args)
     return exit_status;
 }
 
-static int prepare_image(const char *arch, char *isoimage)
+static int prepare_image(const char *arch, char *isoimagepath)
 {
     char srcdir[] = "cdrom-test-dir-XXXXXX";
     char *codefile = NULL;
     int ifh, ret = -1;
     const char *args[] = {
         "xorrisofs", "-quiet", "-l", "-no-emul-boot",
-        "-b", NULL, "-o", isoimage, srcdir, NULL
+        "-b", NULL, "-o", isoimagepath, srcdir, NULL
     };
 
-    ifh = mkstemp(isoimage);
+    ifh = mkstemp(isoimagepath);
     if (ifh < 0) {
         perror("Error creating temporary iso image file");
         return -1;
-- 
2.41.0

