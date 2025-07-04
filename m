Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1257135dyc;
        Fri, 4 Jul 2025 07:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXz2I2RzE9WssAndEn5eH6GVD1+ElUg0r0yYdqdEkfYC3krH5CxGmrvmqG3Y5Rq8Jo3MvRhbQ2Uxykj8g==@linaro.org
X-Google-Smtp-Source: AGHT+IGJYyLxLED9fqkpz2hn6rOFvSSr5N+7cTIS3GLYpajcQINH8YyzQMWOo71lI+6+HpCG4RnP
X-Received: by 2002:a05:6102:5cc8:b0:4ec:b36e:ad0b with SMTP id ada2fe7eead31-4f2f17e708amr1769850137.11.1751639653146;
        Fri, 04 Jul 2025 07:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639653; cv=none;
        d=google.com; s=arc-20240605;
        b=IvzEXdQVYC30rz5JtdlqQseSlCE/8GX58h5NSO6YJY1Lp1obCfHdFV7qWft2iZtfTB
         C5zFVuJ4wpV6MSbWSR3Ed9SbldzS80/vofQLOmMBtCWEmHkwcHtOuyJ8qh0ogpjBaPdo
         a8+lUc3SamuAtN8GIb9zp60qKnn6aj/eZghn21lXQ+l2/3hK09e1ijNugT1DJWUP9C27
         EQHIyVovOHxYYRpn92hkGJffYUHL4yGzMJyYCR3R4jHcx35CLg1NFBrbZ4FiCGMsNwTz
         S0LgQqTkIFtaRn9pDLrERH/S27Muu2x6qBUgNUh3/1WLUEcqsxBX7ILFbshM91v99WfU
         7F6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4S5DImbXjjY+eFLsTDqYqykqt+YEQuqnqHK47/Xsuvg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=MkSO/TEWqeFPH9yVK0pHsjiRmiY30D8kzAzPrTHvwyE8Ee5eIFCoJjKLmmNtdN+gdG
         +YND7XveP/Doup+PielWeQvaibd6zPvBF4poqZSXlhwBQRqIadiRjYax4miibLxGpvqz
         9CnpGmf+DGLqgz1QQAhvlKGwXA4dk6Un5QhvT58PQPyt7YVFybbaZKb9g4Dp0ueJKH7l
         B+UUII+Bg56+rzwBLMSB3J5lGAzVDk9AKbVzcVfBLUrY/4HHOx/Oob0oYn4ah7zrcvEo
         X5krUI7WJAjnKtkzxi/BZYcNmaCdiYCYD9gc8gMucqs+YBblJrJjWKL99jjFUniqWGM+
         +1dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoNQ71Bs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea6b7f7asi634488137.285.2025.07.04.07.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SoNQ71Bs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhUR-0003pi-Ty; Fri, 04 Jul 2025 10:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPM-0002lM-RQ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:29:02 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPK-0001bq-76
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:56 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-72c09f8369cso381161a34.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639333; x=1752244133; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4S5DImbXjjY+eFLsTDqYqykqt+YEQuqnqHK47/Xsuvg=;
 b=SoNQ71BslvopJNP6wpLo4aRpK+kVPxv1p7u0uX06msz7zNz0C2ipBhITp/2X0fXaCx
 Z5M0wqZyUzS8KoMX53vgNYf1Dipf5ovwG5IvYeU3KkiyOyCSqjcvIo9ln28uvo9S6MWg
 qfD6+XWdCoUeX1uMJz/dzaiYOA5hkEzjuOf1MIw/M0P/XIyba75neThrRohRPpuatMgU
 umM7MIjBXjLIuG5Ofp7+z/il5lwSNl40JaGbqxqeRlrwJcwOH/32OXnOdNcRRFrr0zwy
 pX2E/3bjs+xwqtf1f4e7OeDJtoZEs18m0gmGDAb39NaCfQn4DQixzfR7+JADsrLsi7bU
 k1dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639333; x=1752244133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4S5DImbXjjY+eFLsTDqYqykqt+YEQuqnqHK47/Xsuvg=;
 b=s5w2Qp5mHDWw4+ZrWCh5ZFZ3XtSvRyOpKwqNgAbiwKqqM8g7ZR/LkTXEY+NOEsUnAl
 jc9EWd+OQFagkn/0caYFJzMKmYYtPvJVEPMypgALIGkNuIr2L1OI0hrk0t+CURIYJ7U6
 ZuHxqSR0q6pt3J2nNpwYY9ReTi5Iyd3OK3Xy+MljnhVlJk5i4HWYeu1dxDpj7DNnzA9R
 h1znyoOgrZSGwk9HZB/VcjILAv7DlftK0LnIAgnQ+ReleVO/YEw4n0Ksgx3J4xKKuWXq
 XRDIEN4uSE99er1cPCarupVjC2CNF68ImEWeU/fLn7JlYznGYWFG274g2k4Dxqsq0Nrx
 Zb2A==
X-Gm-Message-State: AOJu0Yz4q1iN1e0F+FXHe+Ml2IiYg0uDjMoD3eVvb0QJSoeEqRQ8Fw9n
 pp1WkcY4LKeuhh92Tb2q17w1h7u8hvHcMFAOP2vs/KD17kR5vRwgNBSZhNBge80wUKQ=
X-Gm-Gg: ASbGncsFjitImyYYjGtK7FZ1YwZLuJd4bSoqk2JE0ol8BphIj5TMorRGmX/ButY4pUu
 DaOHY/C2ixhhSewB7ROHqSRMWLbIPBpOI3+GSkjyTmTOaGaId7Th76VIlt5FIGliHQaDDpFaGP+
 MlMS73mHIhCYVyJ84/6DgCEap/wxAj0CF2tfFWKylR4x8OiEqj2IarbOXzxZNyIHL3QTFQnEGiZ
 hmp0UQTBkM89vIP1krnXScZbnzxE/9WUX0x2P5JGAPWkEUtbAUzUgAqYC0LUvAUcPKYuCcfrVJT
 upMtnlQ4T3i7pBqyxbZ286+HoaSRYNdctf92oH5Q4p3OwnEbVYS52HYe5r8qpubyOxalLiyHj1+
 zmIDJOZ2BUood1hKdWp1knNmtUkrEY1B7bx7EPsyrHNReelTA
X-Received: by 2002:a05:6870:2150:b0:2ef:e34c:e4bc with SMTP id
 586e51a60fabf-2f796c1e893mr1680097fac.25.1751639332594; 
 Fri, 04 Jul 2025 07:28:52 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 094/108] target/arm: Split the ST_zpri and ST_zprr patterns
Date: Fri,  4 Jul 2025 08:20:57 -0600
Message-ID: <20250704142112.1018902-95-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
X-TUID: aQXmKscj+prg

The msz > esz encodings are reserved, and some of
them are about to be reused.  Split these patterns
so that the new insns do not overlap.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve.decode | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index bf3d4f4853..7020771898 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -252,7 +252,7 @@
 
 # Stores; user must fill in ESZ, MSZ, NREG as needed.
 @rprr_store         ....... ..    ..     rm:5 ... pg:3 rn:5 rd:5    &rprr_store
-@rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
+@rpri_store         ....... ..    .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
 @rprr_store_esz_n0  ....... ..    esz:2  rm:5 ... pg:3 rn:5 rd:5 \
                     &rprr_store nreg=0
 @rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
@@ -1334,8 +1334,16 @@ STR_zri         1110010 11 0.     ..... 010 ... ..... .....     @rd_rn_i9
 
 # SVE contiguous store (scalar plus immediate)
 # ST1B, ST1H, ST1W, ST1D; require msz <= esz
-ST_zpri         1110010 .. esz:2  0.... 111 ... ..... ..... \
-                @rpri_store_msz nreg=0
+ST_zpri         1110010 00 esz:2  0.... 111 ... ..... ..... \
+                @rpri_store msz=0 nreg=0
+ST_zpri         1110010 01 esz:2  0.... 111 ... ..... ..... \
+                @rpri_store msz=1 nreg=0
+ST_zpri         1110010 10 10     0.... 111 ... ..... ..... \
+                @rpri_store msz=2 esz=2 nreg=0
+ST_zpri         1110010 10 11     0.... 111 ... ..... ..... \
+                @rpri_store msz=2 esz=3 nreg=0
+ST_zpri         1110010 11 11     0.... 111 ... ..... ..... \
+                @rpri_store msz=3 esz=3 nreg=0
 
 # SVE contiguous store (scalar plus scalar)
 # ST1B, ST1H, ST1W, ST1D; require msz <= esz
@@ -1344,20 +1352,22 @@ ST_zprr         1110010 00 ..     ..... 010 ... ..... ..... \
                 @rprr_store_esz_n0 msz=0
 ST_zprr         1110010 01 ..     ..... 010 ... ..... ..... \
                 @rprr_store_esz_n0 msz=1
-ST_zprr         1110010 10 ..     ..... 010 ... ..... ..... \
-                @rprr_store_esz_n0 msz=2
+ST_zprr         1110010 10 10     ..... 010 ... ..... ..... \
+                @rprr_store msz=2 esz=2 nreg=0
+ST_zprr         1110010 10 11     ..... 010 ... ..... ..... \
+                @rprr_store msz=2 esz=3 nreg=0
 ST_zprr         1110010 11 11     ..... 010 ... ..... ..... \
                 @rprr_store msz=3 esz=3 nreg=0
 
 # SVE contiguous non-temporal store (scalar plus immediate)  (nreg == 0)
 # SVE store multiple structures (scalar plus immediate)      (nreg != 0)
 ST_zpri         1110010 .. nreg:2 1.... 111 ... ..... ..... \
-                @rpri_store_msz esz=%size_23
+                @rpri_store msz=%size_23 esz=%size_23
 
 # SVE contiguous non-temporal store (scalar plus scalar)     (nreg == 0)
 # SVE store multiple structures (scalar plus scalar)         (nreg != 0)
-ST_zprr         1110010 msz:2 nreg:2 ..... 011 ... ..... ..... \
-                @rprr_store esz=%size_23
+ST_zprr         1110010 .. nreg:2 ..... 011 ... ..... ..... \
+                @rprr_store msz=%size_23 esz=%size_23
 
 # SVE 32-bit scatter store (scalar plus 32-bit scaled offsets)
 # Require msz > 0 && msz <= esz.
-- 
2.43.0

