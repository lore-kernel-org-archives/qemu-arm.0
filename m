Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp801228ejb;
        Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC5PDtSh66ryzlMQT6ovIPbLcPAoyiIJDlGzFef+SAyXU879ovGElyWFIhzAP7Lwr9WZo9
X-Received: by 2002:a05:620a:c43:b0:776:cf78:905a with SMTP id u3-20020a05620a0c4300b00776cf78905amr4169330qki.50.1697750518063;
        Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750518; cv=none;
        d=google.com; s=arc-20160816;
        b=baH8W4FVf6hyDDGNJ65x2QLG245c1PzgJr2DS71lgZpgsFFec4OLm/4ZKRLU9Vhm0D
         EEv7mIa6bou3rZ8Jov4K08gXmQppe4jk4DrsKwLmHvzBt2T3XcBzqZJpB4dHYMI8SBiX
         9qB/WGFOlPr7UDoBZrhHZTL/XhZ/RQfQgkS+f3qZntL8nQf8cqk12YUbRQZq+t8dcooi
         cspuj/2UFK4giBe8aDrhrhS6Xx9BzBkx3jaEgIYDE2krInKoBNUau4SYJC0gJBdPG0zU
         XxxNi+LTcAEkU7n7WHoR3x9n/FqE3x8yNF33cHzRQCbmnXAZPp86fog4vGzmdYmCXeGA
         q8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7OwRTezp0vv6wqt1NgDnQGraNHaa8cKXk4aoany7tps=;
        fh=hp1KOKN2uBs/6/dJD+zRXT+HRLjOX+0sB5Ut8st0n/M=;
        b=OqtU9el4ARNnssy+lsYTAwhBvJLNgZKFkB8t9FnlhNXGMANu5sCvTAcT8bzKo+XNdx
         4Gl3nQI8AxxDX6l3MXEPGHmxMYVcA37rzANx21m/IBMxFkLGfpCVLBAC2g7X6UltRMY7
         njrje4TVDCCkzrxK+4MQ4d0p6eZIYJQMEo+AOaKzASSYf3Q4DTrq9IfhFMaKGa6bbJqQ
         Gp++aAZPVnl3qsGTvHIeoVSCn7MCnG3Qw/2dzxWrAMVXLqwGJO3g6xGYaUXeP71OHY9X
         5D7KyagV8uDqvoI4WpUcPwPa50GRQnVL7yzAnsvu6iRxwUjvIBirIHefRnNa0z6pmEYJ
         DDsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJ3LLJro;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5-20020a05620a0f8500b007788bbadf88si237759qkn.625.2023.10.19.14.21.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJ3LLJro;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtaQZ-0006PD-OM; Thu, 19 Oct 2023 17:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQY-0006MD-Hw
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:19:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQV-000542-SV
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 17:19:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4079ed65582so1010375e9.1
 for <qemu-devel@nongnu.org>; Thu, 19 Oct 2023 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750370; x=1698355170; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7OwRTezp0vv6wqt1NgDnQGraNHaa8cKXk4aoany7tps=;
 b=TJ3LLJroh0M7SiDtBZonaxhMj6gyalYfZxpyvG2Pc8NPedeSRn5p7oiSQYumhSQm6j
 JpvA1aociZFihgi0bKkbxRb+KkgWttBJcFkVif7A4uwlvDx/Oaqb698Cqa9xWu2PDhhY
 l45ON3Av65qKavhXtPOAzzHBI11uh745Smx4QBAUoQwWiiAiGOQqqLtoBNnPPhAPH6vG
 5U4yUp7gCkAFgUGnQppNXWO16h7kLGq0aqpUWZOU9Ub/71jtHBYK4rJWwlWI3FVknqp9
 GtW/M2PDHmW3G802uYtVmF1uD8zu5z9vaivswGZXqe+Yw1NQls4mVnIahHLctcBYYNXV
 BwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750370; x=1698355170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7OwRTezp0vv6wqt1NgDnQGraNHaa8cKXk4aoany7tps=;
 b=fLix5lk13OTkqScI4kUySHw//opiU9Q/087VoZadg0W8BwAAaCxv3dg80nyQ45COJV
 P7sNtJ8AjX230PsJPE4LhEqxwNGDBe46AjA4BysF4oZj9WfwIqjJ4evU9MNPirCLI74K
 lZNfYBeZ1IO05XaVqYTwehVMihFKM373tIzIJ/y2bC4W5hKUBddorVq1p+lR+cFfYdXy
 FfW7A8DEBs179H3TKkxaP3ANRumavJUVzFbwapbHuSOEilqldcPK1udYDKxjxu/kkTMh
 +KxFYYYbqUGwh4RG8b7U/xVRBKlLQM7j0Aqdhd321BPRv3+37rCLq5so2efDI+XaIcT6
 L28w==
X-Gm-Message-State: AOJu0Yzq/uU0Ned+9zND6bgRsHLSlCtaWrI7/bpPMF7+Z03KinmqhAGy
 WcOJirDOCaJUKPy7EueOU/OzHWlIVMIgtkU46N+7lQ==
X-Received: by 2002:a05:600c:a48:b0:408:3963:5bfd with SMTP id
 c8-20020a05600c0a4800b0040839635bfdmr43005wmq.34.1697750370425; 
 Thu, 19 Oct 2023 14:19:30 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a05600c0a4800b0040775fd5bf9sm564120wmq.0.2023.10.19.14.19.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 11/46] hw/mips/malta: Use sdram_type enum from
 'hw/i2c/smbus_eeprom.h'
Date: Thu, 19 Oct 2023 23:17:36 +0200
Message-ID: <20231019211814.30576-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: 3Q4AGfHg5+W0

Since commit 93198b6cad ("i2c: Split smbus into parts") the SDRAM
types are enumerated as sdram_type in "hw/i2c/smbus_eeprom.h".

Using the enum removes this global shadow warning:

  hw/mips/malta.c:209:12: error: declaration shadows a variable in the global scope [-Werror,-Wshadow]
      enum { SDR = 0x4, DDR2 = 0x8 } type;
             ^
  include/hw/i2c/smbus_eeprom.h:33:19: note: previous declaration is here
  enum sdram_type { SDR = 0x4, DDR = 0x7, DDR2 = 0x8 };
                    ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231009092127.49778-1-philmd@linaro.org>
---
 hw/mips/malta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index dac27fad9d..62d04ed113 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -206,7 +206,7 @@ static eeprom24c0x_t spd_eeprom = {
 
 static void generate_eeprom_spd(uint8_t *eeprom, ram_addr_t ram_size)
 {
-    enum { SDR = 0x4, DDR2 = 0x8 } type;
+    enum sdram_type type;
     uint8_t *spd = spd_eeprom.contents;
     uint8_t nbanks = 0;
     uint16_t density = 0;
-- 
2.41.0

