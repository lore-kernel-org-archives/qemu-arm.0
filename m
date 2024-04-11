Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp865306ejc;
        Thu, 11 Apr 2024 03:44:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlzkdKxh1b2waK2TyCz2g8DyuMeqxiwWOb0wb+LLzkqr224dh166wSey/RhtAd43UWU+gZyfcXYXg1atwfDN8Io5MWvAg4
X-Google-Smtp-Source: AGHT+IGOiieGs5Hn3yfDEjJGJQiaRzLBcF8DdapL3eVCh70T+rEgtAg48iwgzbnTtEA2J1xZZrqm
X-Received: by 2002:a05:6102:20c4:b0:476:8a06:97dc with SMTP id i4-20020a05610220c400b004768a0697dcmr5057607vsr.30.1712832286272;
        Thu, 11 Apr 2024 03:44:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832286; cv=none;
        d=google.com; s=arc-20160816;
        b=KpIC1/zVyp5xbDdDJntqmhNBlOqThfk03QGOvNI4TIvQYZmtupu0yC/76nKC1tkVul
         84+ZP/SOLkUrZxBbHhW8l9ABRRROKt+8hfQCJh8NPSwZM2tTjLTIg6OaSeXxppgPljb0
         ITUaxJd9AJJ2ebWYlITC9vupSszEPbACVNxer9VWS3izbGcIqO15C4WG2koMBhmZ/751
         IyjELDojZrc1Sgg2SLT0bk+qAJneKGrettRE2MoWnuc1WPSkmaZf6I6yWUwvWQzy0j+W
         zdxvMSa0KYzEZ6KAy2m4kxeYRxK+E3QDfqkrV86SfbjkjcAvNPX/7KyCip9mCZbYjbnE
         X5rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eBldt31TQRcaP3wXP9WMxXOJNX8RudxIC5CYlIBA8B4=;
        fh=a87TlyGzdF+/NYShFTFLOM421iJ8tG6hYm8n4B9Z204=;
        b=Zfft3cBGagOJSpyF/MMky0BfOtnahNJ2WUTLLrHqd+yAKrOcjDTi8Lt76Xvhp5vjlP
         bi89wIXM1WYD/UGaqBMf54jMraOKqUHXAGRUw3DqiJJPgDb2BAg+1piG9pJye1djwO30
         dBBy1Zq9+brFgU/G71CaOo0lAv+pVDgYyvw1jELdFknz+Leb55qDPR2M6hZixmZZtCpp
         /w0prhz5uqK5/FP0FSw2fQJGNNGdUGuqABuOaQdBRSxgE9JwMcSLc92FuDVa3c6dT5FP
         DicRpVLl+vMfvV+mNnCYRBqB58zU9BOemMYcrBvNdoWGLo/5+W4SpYAR2el/lmOOsSs8
         Qy1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIGlN3Go;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp16-20020a05622a1b9000b0043649f613aesi1254151qtb.120.2024.04.11.03.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:44:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QIGlN3Go;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruruY-0002p6-Er; Thu, 11 Apr 2024 06:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruW-0002o7-Qo
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:44:04 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruruV-0004GS-18
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 06:44:04 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so4152755e9.0
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 03:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832240; x=1713437040; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBldt31TQRcaP3wXP9WMxXOJNX8RudxIC5CYlIBA8B4=;
 b=QIGlN3GoWfotiLT8p59Mbl8d/yjYxdPX5UhHMTw2ElgLAEK1CmaXOR8OWpYvIvpiXR
 pI/icNE4dRlY+pUypjHplgUDoJoW00AZLoTKUclaljRXgKOwlZYPcuF23eS5ezZN8lx1
 RhylBSH7BWRq3gcsGgHh1ccF5i95BFYs/+0i9q0uTBg+MrRkpIwif4PziZI5hYBJqzhn
 KCGaBiP2HMFMC/x4eGh1i9hFP0zybIH9FJPh2iO+JD4xgz3EyVnndIbOnk9fNgndIGhS
 7DEWZmbH69T4nSOkDkcehkkruszKn6GKeVk8azFmBc0heNfZUP20bvg6+YJZshGBf4ko
 9yVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832240; x=1713437040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBldt31TQRcaP3wXP9WMxXOJNX8RudxIC5CYlIBA8B4=;
 b=wbtH6Hq+5b/555PjZ1JUqLXPvaudkTaysv/4nULLfV0/cgIZO+YmrL4QWKrEt4YnFb
 mdZESllEUSCM+VWsjtUokDR6j1SH8iYdB+svuviBwdkYtxv3YUsEvh41eahVlP/fqHHH
 JfVdhaHlRbJm2bXf52KEWuDdUxWfOHCCe/SQWoa3BhwfhaHgXBjVhapGsS+L0FkRr3yP
 HctsNy3stIG4gqiHj0mA9ec3jOidUMaRxz13dNCpQI8NJky4NmSpY4lxYmpfF7ot3Wnz
 9TgpBUbD9sxn2ZcDsIg+IGC2JS6BhVr9Hlg+TWmovKNSy/MpA9FhTZWFdwHf9WvmnRjx
 48Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWppVuZEBsyOp7uObEt/1DUYxOls5dMb4odOZiYYEPKbmGS7qCz/9UQTtN5/Q6uhdHetAV0aYfVs6zoHznDeQmWAUrh
X-Gm-Message-State: AOJu0YzfU49bZZh2qo19jNr9+b1+UnbJ/BBnZ18r0wRfWg0yMS3l+DgD
 icXK1OfKEryG6KVLSfJ7JULarqA44zFb85n/b+LxYdrSiyN/14V+zX0jbiDUEBI=
X-Received: by 2002:adf:fb43:0:b0:346:41a7:2fc2 with SMTP id
 c3-20020adffb43000000b0034641a72fc2mr1924813wrs.32.1712832240706; 
 Thu, 11 Apr 2024 03:44:00 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfe3c9000000b00344a8f9cf18sm1481628wrm.7.2024.04.11.03.43.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Subject: [PATCH 3/9] disas/riscv: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:34 +0200
Message-ID: <20240411104340.6617-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: KP9JHEtT1C0u

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/riscv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/disas/riscv.c b/disas/riscv.c
index e236c8b5b7..fec09e9922 100644
--- a/disas/riscv.c
+++ b/disas/riscv.c
@@ -4966,7 +4966,7 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
         case 'v': {
             char nbuf[32] = {0};
             const int sew = 1 << (((dec->vzimm >> 3) & 0b111) + 3);
-            sprintf(nbuf, "%d", sew);
+            snprintf(nbuf, sizeof(nbuf), "%d", sew);
             const int lmul = dec->vzimm & 0b11;
             const int flmul = (dec->vzimm >> 2) & 1;
             const char *vta = (dec->vzimm >> 6) & 1 ? "ta" : "tu";
@@ -4977,18 +4977,18 @@ static void format_inst(char *buf, size_t buflen, size_t tab, rv_decode *dec)
             if (flmul) {
                 switch (lmul) {
                 case 3:
-                    sprintf(nbuf, "f2");
+                    snprintf(nbuf, sizeof(nbuf), "f2");
                     break;
                 case 2:
-                    sprintf(nbuf, "f4");
+                    snprintf(nbuf, sizeof(nbuf), "f4");
                     break;
                 case 1:
-                    sprintf(nbuf, "f8");
+                    snprintf(nbuf, sizeof(nbuf), "f8");
                 break;
                 }
                 append(buf, nbuf, buflen);
             } else {
-                sprintf(nbuf, "%d", 1 << lmul);
+                snprintf(nbuf, sizeof(nbuf), "%d", 1 << lmul);
                 append(buf, nbuf, buflen);
             }
             append(buf, ",", buflen);
-- 
2.41.0

