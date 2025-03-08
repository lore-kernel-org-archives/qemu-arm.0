Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307848njc;
        Sat, 8 Mar 2025 13:40:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW5N5cmJxklm5/WbL4sZokoy6dJQIBVAisUq0bRkCc1NiImyiodwhm5pnlzxBnZqFox+WKgWVQtmXoYVQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFVHPhk/MQmuNoJ5MCoawrBR8r4TO6sBeT0MGMppOKniEVIeRf3xxAaneL8L7C3TdjSitad
X-Received: by 2002:a05:620a:1b87:b0:7c5:4711:dc54 with SMTP id af79cd13be357-7c54711dd2emr310189185a.0.1741470025976;
        Sat, 08 Mar 2025 13:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741470025; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4WysegRpeL5ULTxmGBYovYVrK6Hq6GgaQ+5plmFax14etepctdQb61b04aQo0kes3
         2sjI0mTyFmb8LBmrkRjMfkFaeV8SCQdXVwNrxBHAgeWaK3xPNCBgM3EOYcaiXP+102Im
         qr5C/9Ezb9B/ff30Rh6K5dSmDQgsk/Jo8lExPZ1oyBqoHs7j2MoiZ03ropNgFwAeGfhT
         O35UedGdyvQ1Cn/Wvq922or4d1KiaArSSTqH4KUjoXwJpz50D86egZL4O42iVj5bAk16
         6pa+HEluxmvKGTWJss5zpZCJ38SHp9kd15g+41H1XeRHan2qhU/jUPXBhjOvyb2B1tEH
         3puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JLtBjh/f3t9o68uNAMfvmOYu9CkLCOLT8MqoCkDG4gs=;
        fh=0aqMpdNpISQJCzOYtHef9CdeEduyrfTLGfdd21icOMA=;
        b=hVDc3PnLjkcc+Uc/AQiFKt/OhgJf9PMTA3eq5o619Cqu/DHsMokxbOO71T9EmQZSAT
         MoVYB/f6Q7oK2Z1hfd5BN1kgNwnQJ/j7bn1vp6teh8rJ/UY6Ba1rg/ZGYryBjtyOY7Rx
         6JLW1dPblswgdy7pdcFBh9WkiAVX9brJluOsx1AiXGwiRTuya/ajt0npOqBZ237C4Xh/
         Hykv4cFb9hEJ2BdDGw/od8onQlNIGFbZfzDF8Vli7T5KsmeABpZrFAkACA3gozYiGk3B
         v7MPRIc+7YmXBy68iBwQcIy5LbYSPh84m72Ld8+6twOT6eDBKSQQqagDsuAW9COjiioF
         UpLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+sR3UUO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5472de862si107211485a.511.2025.03.08.13.40.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:40:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+sR3UUO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tr1tf-0001LH-CL; Sat, 08 Mar 2025 16:39:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rs-0005tT-PS
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 16:38:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1rq-00043J-7c
 for qemu-devel@nongnu.org; Sat, 08 Mar 2025 16:38:00 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso760895e9.0
 for <qemu-devel@nongnu.org>; Sat, 08 Mar 2025 13:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469876; x=1742074676; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JLtBjh/f3t9o68uNAMfvmOYu9CkLCOLT8MqoCkDG4gs=;
 b=L+sR3UUOzHeFUgqEDIAfDjHC4CY9u4/+goO/j3xHzqcQOuzA3339hzwuE+VoW5355R
 jjxKS6cLln7M/FZnXdQufKByeJK/LN88OvFe+K6OahlVgM6IqyBeP+o2YvJyIt4T2s61
 lNU3A+lQePHv7mQTUIRsmP88ynadOPLaELyLDhpq5uQMdGbbvo4h7gFgLdVg7Y2WoFco
 PHumpJgbcmCkPNqVNEUGF1L+G+fFN1DfOVnp1QV2flxBA5FQqyGA1XXTY7+r2oEVPpgM
 3dAB9STHd+PkKEpZrUDnWWGuldLKAcsMmnhv0nj54sL+BitzHsyq+jyUc0zOnu/2NK9F
 p2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469876; x=1742074676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JLtBjh/f3t9o68uNAMfvmOYu9CkLCOLT8MqoCkDG4gs=;
 b=rbA1VJUVu+DpjIRlkJUoIufL3fvQwQN4pY6kjA+5aL+ZnOn8BOexw+Nd8lltm8WqhB
 5BhHv3LtHDjDL5GHhAFTdHyOGncIVHjqtCY+7qhuXZVfKqCp7xRQCdb7+InzGw0NT6IZ
 4KA0Bzg3PoU4d0styx/o4KoySwOigeGrrYDO/MKHesXumoAptWgc6+k9aq1RguFEhOni
 6oE8Xm2IQfSrYQB6mkMJpsMJZAkeQ8ucSwqClGgWR67AZhy/vtgXUn0Quvi5Ut5AFgOU
 1hNvbfSCwgSNkBjf0ZP2wswGaS4HpoA6jazFwDtCnHF4o4pWzz25QCTsoflT0PYr9yD0
 mxjw==
X-Gm-Message-State: AOJu0YwrF9vfs9hDRDrdrXK1K/id/edUNxXQAn+DTiV8vr4GTk5f10RD
 f0bvTw0vE2ZiHj+pnteSojnrCBKKptPGDeGNJev5PXaFw0g4B48uq4Z7bxaS4SkkVTK6zF0cH9o
 DWWY=
X-Gm-Gg: ASbGncs+A8blFJRGCrl4QJ5YKBVJHxYk4dZ0C7QHl/+2iEFuVAPUggwIrn0/2xmFj3t
 Gl0Kmpj+jLm5sJSFOe1qWpVyQR+qWz4h1D4za00jFU7UcaS6dBakuo4N2ceIGVNEBw9esgvxXCx
 80l1M85WSjFtIml/hSNwKsONZ76OLX2qS8u7//wOBNTjFZJHl02WiP5sUw24Wa8gPyAxbVgyRRy
 ZHvzwZZMHrnVX1zvlpSfVlUFI1pnVpyDA2a1U45F02e5Cfy6HldAt/Qqv7m03Exxpl8ew5yEXZA
 J3sBVFyuwM0ge0UpEvtreoB8dQjEf9PWIKDpALe7PtoWmYGF+2Tk/6hEU1Lr0r/sVHemcz/rlMw
 xwOS4iVjQWhKcvbVMK3A=
X-Received: by 2002:a05:600c:3ba5:b0:43c:eea9:f45a with SMTP id
 5b1f17b1804b1-43ceea9f8f8mr7896745e9.4.1741469876521; 
 Sat, 08 Mar 2025 13:37:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43cec60d122sm21374995e9.18.2025.03.08.13.37.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:37:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 14/14] hw/ppc/e500: Replace generic SDHCI by Freescale eSDHC
Date: Sat,  8 Mar 2025 22:36:40 +0100
Message-ID: <20250308213640.13138-15-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: ds/C5l3RG/A1

As Zoltan reported, some U-Boot versions seem to expect
correctly initialized registers before expecting interrupts.

Now than we have a proper Freescale eSDHC implementation,
use it.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index e85e000f054..7d15c926887 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -1027,20 +1027,12 @@ void ppce500_init(MachineState *machine)
 
     /* eSDHC */
     if (pmc->has_esdhc) {
-        dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
-        qdev_prop_set_string(dev, "name", "esdhc");
-        qdev_prop_set_uint64(dev, "size", MPC85XX_ESDHC_REGS_SIZE);
-        s = SYS_BUS_DEVICE(dev);
-        sysbus_realize_and_unref(s, &error_fatal);
-        memory_region_add_subregion(ccsr_addr_space, MPC85XX_ESDHC_REGS_OFFSET,
-                                    sysbus_mmio_get_region(s, 0));
-
         /*
          * Compatible with:
          * - SD Host Controller Specification Version 2.0 Part A2
          * (See MPC8569E Reference Manual)
          */
-        dev = qdev_new(TYPE_SYSBUS_SDHCI);
+        dev = qdev_new(TYPE_FSL_ESDHC);
         qdev_prop_set_uint8(dev, "sd-spec-version", 2);
         qdev_prop_set_enum(dev, "endianness", ENDIAN_MODE_BIG);
         s = SYS_BUS_DEVICE(dev);
-- 
2.47.1

