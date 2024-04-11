Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp866014ejc;
        Thu, 11 Apr 2024 03:46:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8KbVgNvS+3DUDyLhitN9HfpogTzb5YkHXJpk05g5DpQpBIYNVfTeInrp5Sza2tWp+jH4jb5EB7tvluSGiQeZgJhMoP0Zy
X-Google-Smtp-Source: AGHT+IH9TDPUu7gkTRPsHXItgpxI0C4vA4Rexpt55t0WueJDWyrsEENFvc3G/8+q7zWP+1z/6qgK
X-Received: by 2002:ac8:7e8f:0:b0:436:5d80:fa52 with SMTP id w15-20020ac87e8f000000b004365d80fa52mr1873055qtj.42.1712832385915;
        Thu, 11 Apr 2024 03:46:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712832385; cv=none;
        d=google.com; s=arc-20160816;
        b=kttHKS8rVlnP3YZ87JMq+6NiUHLOc2KcP69JSYKGe/9qtPSyIm6fjt36JLUZlpYMrm
         IHoK//TQc9075wXWTu09sZQ0pV3c6TzS41Jc0kgYFYvQXGeZARAF32DltKY0wTLEFfjA
         ReKnOMu4FCB0g6cDyFqtMtyVu/Iy/Mchy9c+ISu9sS34xSX3rQxzt1nMfRSV4rgtGLM5
         Nf2mEI9MJQPyaeXhXid4di1sAFVoRExErQCbgVaMrnxeEcHS50V8BbZ81sYWPQY4gO66
         DKPA5KORpJAsNlVRI2Hm6M0X+bD6d22s3NDceci/4XcAvxun4VnLRGA6mdo/OPfyh1aE
         Yj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wlJcz+pht8e4e9xihxB/4ukY7MeVnKXZI9Z44gsjm/E=;
        fh=Y26SNCcx7mV3+DQ4GiURg25QCLf4EDTrA1pj2iVRPwA=;
        b=MAyz7OcO+eNYPr0AIsTN3aHZ9cocEGLun3dx8C4XQTwtRWLqi6QAGnin5ozuVGNWkV
         3zpe5xM71nMr8K4xkgYELlNoKczZQ3W8N3c7THuTG01gfQ7bsXqXx4TMMO3o2DdXN1rY
         lMvgXRkY3W4qQqN+lskGLg6ipa2ZtLee+28ci0nycM5Oa4HTJxrOIGBHp5gRCwZ7r2uL
         mG7C20TE2hGND5XGnTwL0GESh77xcxG3vBC7+Pzy62qt+k+9eIx0Y5p4Zoo/g324D0+8
         AGYgfVfZiwQUUFe0Tc8Yj4/7wdFI7RdpyGAhKXyXjogPm80O0HHmzfqCZtzeWlzyfmfo
         waYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYvTWsYb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u37-20020a05622a19a500b00434ef8f7a7esi1270484qtc.52.2024.04.11.03.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 03:46:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TYvTWsYb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rurvE-0003Xc-HY; Thu, 11 Apr 2024 06:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurv6-0003R7-7q
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 06:44:41 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rurv0-0004QA-6K
 for qemu-devel@nongnu.org; Thu, 11 Apr 2024 06:44:40 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d895e2c6efso49317871fa.0
 for <qemu-devel@nongnu.org>; Thu, 11 Apr 2024 03:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712832272; x=1713437072; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlJcz+pht8e4e9xihxB/4ukY7MeVnKXZI9Z44gsjm/E=;
 b=TYvTWsYbdqVdvPZebGVAxY5+2AAcEbHQDcDIUPsgZNzwtvceL0xGflGJd8MB8y+vcy
 sG3D0vPE7OxTm7bUbZU8pXler/adU/QskwRAs4LoAWxZZw6DPviwCWW5GB8isHj2U0Jx
 FM8NrrsZoj8XvGihIN9eubgmJ1vcS9XTS/EZS6Pky0yohF9vvjd4JZznVMbWZUXtS7uv
 lKbqonwK5Ow1J+2Aj6WCiWZD3MK1MECeXNVzamSmT2YWehuRZil5PRRFeiF+QeIqQUXI
 6xuDYg6h4G80fahJcAujhVzu9vnBciHwPyfkJfLkGCWYKs1RMtNe+p8/PVremI8NfTL+
 SfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712832272; x=1713437072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlJcz+pht8e4e9xihxB/4ukY7MeVnKXZI9Z44gsjm/E=;
 b=XDIdWWvcb/bBHpSNcUeN9+mG9Ox4wnVPfTFMrgSybuKaWyD1iyZZWc3VsCdpJUOC/V
 SH6a6mMlY2GaCbELSrpTBamGST8bDAnRyn74sXCG1csK00leK/Ut1NjqYadiOQMhZcli
 A39aHQWIR1AyXoBcUVcUfTq2xx7tcU3lt0eNUb7unjzgsh/nnbdl25rAg7Iu0K+lvxcY
 H0TSYMfy17I1uJs8WytKyTcKieuX+yslzj6g+OGx2fHXf9x9zoFVSLJ4uwk6tgAF2C00
 gSsHcxYHyNHVgnxJA04nc+bMQC6F2rZaZs/lgnP7HyFdN33LJlVLRo3WxDn5KkA+FAOY
 Zv9Q==
X-Gm-Message-State: AOJu0YxuuH0DXyNkuaPJn+0S2uSUT7o/cGoNlNrYAzlrHEmXwXPxvySU
 m8K/AUGO4rtEZ5dlZMO53oOYL2bIKi6JACFo5CtVaWCPFLd8Bntnsqt7FBE5zgx7//Aq1vrgANc
 XqCo=
X-Received: by 2002:a2e:904e:0:b0:2d8:4af7:1235 with SMTP id
 n14-20020a2e904e000000b002d84af71235mr2797615ljg.44.1712832271697; 
 Thu, 11 Apr 2024 03:44:31 -0700 (PDT)
Received: from localhost.localdomain
 (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm1471455wru.42.2024.04.11.03.44.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 11 Apr 2024 03:44:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 8/9] target/arm: Replace sprintf() by snprintf()
Date: Thu, 11 Apr 2024 12:43:39 +0200
Message-ID: <20240411104340.6617-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240411104340.6617-1-philmd@linaro.org>
References: <20240411104340.6617-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: R3Wp684VNohl

sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
resulting in painful developper experience. Use snprintf() instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/cpu64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 985b1efe16..f0f4fe6714 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -433,7 +433,7 @@ void aarch64_add_sve_properties(Object *obj)
 
     for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
         char name[8];
-        sprintf(name, "sve%d", vq * 128);
+        snprintf(name, sizeof(name), "sve%d", vq * 128);
         object_property_add(obj, name, "bool", cpu_arm_get_vq,
                             cpu_arm_set_vq, NULL, &cpu->sve_vq);
     }
@@ -458,7 +458,7 @@ void aarch64_add_sme_properties(Object *obj)
 
     for (vq = 1; vq <= ARM_MAX_VQ; vq <<= 1) {
         char name[8];
-        sprintf(name, "sme%d", vq * 128);
+        snprintf(name, sizeof(name), "sme%d", vq * 128);
         object_property_add(obj, name, "bool", cpu_arm_get_vq,
                             cpu_arm_set_vq, NULL, &cpu->sme_vq);
     }
-- 
2.41.0

