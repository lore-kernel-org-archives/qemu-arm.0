Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp255153njn;
        Fri, 10 Jan 2025 08:02:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULdwu8Aec/9RVRgnHHPkgp9GeyVcSWrHPDdX/+850vu7i5E1VbfEvHHG47LdLPKHJUSnL7nVN2hhsiSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEz5yNOe3sBquYpSsdkkZMkIFA9B1GJviWXcArruiig7yMdOIzTsJlL/3pGF7T1RISH7XTg
X-Received: by 2002:a05:6512:3d16:b0:540:251e:b2b9 with SMTP id 2adb3069b0e04-542848162c2mr3509705e87.41.1736524961162;
        Fri, 10 Jan 2025 08:02:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736524961; cv=none;
        d=google.com; s=arc-20240605;
        b=JvPdpnwmwu2aQ0orEj8nwbiCDAZAjWgAuFR0KQYzoHE7CBNzzeRm1T3iPsfd+ePw6h
         XtEmvSmN3CoGxaZImXRtdKES2oIEPShQSQyXoQrjbJZhvQU64cwH+1058esp0v+i6atY
         lrnEhikNa/P06kfiQMV7PEruZOgt7jXwxkLwfUlnuN2PSepGttgISu9oQGTkrJyREjdD
         fxVAfBeQPa5Tpl5X4/aVOQOHARTVMglUSAKoAi/Yyb2Xtt/vk6X88tcqjTwpyi7kj0/0
         jTCuPPXFmSG3SUxcUBTQFRLV0cTGJWxL2nukbAqm3EeLpKGmAET8IZBkAJg542K3nRBT
         ouFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/TSOi3MOBYvnCM2gvvOyUyt5uwexAoG6kvoI2QdXq6E=;
        fh=kmZ6zS7mF/5pUshm759jlvNPBZCse9G2eVWkrohknBU=;
        b=MK6Lz6LT/6yQLuiNln0fC48IFLF0iycBaZ0DJMZoypUba0RuCs3nwaadUcpoyl5TqW
         RlhZl3sFLbiDNK5gz6tPCDmZ9zeJ+mV3iNeZCLM1kbsfBuVVsX72NuNxqUoP0nlb4MMh
         q/aU51h0ngoPUo5gx++pje8/3Pl1KfIoQEePYJWXH9l4OB4pUtSXAU7byVqZvQoRAANK
         sbwYdZakhYh5/9GE7P4PmpJTscshB99d7CvrNltOUCH68WizgbjsDsdCgXKPUN4a8keE
         NA8+VH2v7A+AWZAQA1JhozMSpKWUZbIt0t6R7d5Vl0XSOER3rQU2ATCV5E3pzc09dPY1
         tQoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZChRfpNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-5428bea8b85si1446209e87.419.2025.01.10.08.02.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:02:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZChRfpNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHSn-0007EW-Lf; Fri, 10 Jan 2025 11:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSe-0007DL-NZ
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHSb-0004Ag-GW
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:11 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-385ddcfc97bso1935919f8f.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524927; x=1737129727; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/TSOi3MOBYvnCM2gvvOyUyt5uwexAoG6kvoI2QdXq6E=;
 b=ZChRfpNxDrRIm2JHr9s3rL1ybp/GPDWyksB0tuk5iiyMPhNjQBqIDFysB1/9Zuvxa2
 rmKKIIp6dS+/XtnfXUUSt+kUQqKoYpSwJKPhirnXEgeaIYh8pLgieKwcFa2a7o+oqHaE
 FFlGq56GtX7LpVkaTR35Gn4dcQUSH4ko0oCMMOFxPWYjFFHjEmX/sPFe9tuRPn+peJUu
 3ymSuJMQk3rU6UJ142pOl4eBa3LGWFFL9UHCuZZLA3b/UaeEmFif8uyLSp15iWPvcUvw
 Mm60KiPDp1+fAfLNxXeONNil2S6yiaXQEokOXHBd0MDPLBiHRTXXlQnMGKHmc16eMKFO
 bgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524927; x=1737129727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/TSOi3MOBYvnCM2gvvOyUyt5uwexAoG6kvoI2QdXq6E=;
 b=h0yvQmC7VJoGzceM6fNoPQ+70Sr+7yuPo89f3nE1KmjXGdBz3DMqS4dicZ265NShp1
 yF3amtDgNCsl9FiAEIWf6ujMO36pNgwBLFu4KoXgZJFokLLK0xBuF3tbn1bHqVh4wlMO
 MCIwXQIRXBgGsE/aZZrzjOtoM8vs2Tv7fS7Z1GJRyI7us4B/xG789xddlszCx+AdcguE
 dbt8r7T7wI4B+GekGqZF7H/o1u2k0G+SQMdtRcz+LgT6AqqwosQ9ZW12mAzaCxCMmlUo
 9AnE25bdCspNqEWOBtyJCh6MPKINphMEy4S5M8I9RDMtxSxmupfPVXOoh9BfVL5Ohoi/
 qncg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1zDJ2F6JyMEyP/OKmAww319mDEpKC/68tx+Q4Eq+j3heYYM4Mr/NL2sfsOw2HtgLjj2tEYpTmTA==@nongnu.org
X-Gm-Message-State: AOJu0YxRWP9O3dT4QUKVJpEEo47A6csUVuzEfogXf5vyznnzjdHjQQYg
 8Ho8gPA9HO8p2yHfHjHdeBLFzRONzuN7OG7nL1Cs8zP6qJ1gbxiYMLdepWI6hs0=
X-Gm-Gg: ASbGnctYynHMoWxmsUeCFTKyZi2am2bg8F8T8TkF75vuCxaWoXNAqfll0+Id6o7fGAG
 mC5UkVqdTcAW2973TxIG5SRt8jWYn5TYoVBjMmfRnO3wjzPtUpJsEXmyUjtVfpuedU0+CkNc26Q
 9W3o+3qp0ioI1ZD6SOm6NxztK9DDDr3zOn5tPWKglkiUTNCDXHwSbLVFvn7m/uQlyb1W0+UDHF+
 /mUMgEFTiX7XOnMINK1Ka2onwv+B+Rso7sZ5ZksPH9O7NNS5iHC6W+frGOnK5m2++muRwWrGMJF
 hldRJVY4P803+hldp8n77+d0ihgQw6E=
X-Received: by 2002:a5d:5885:0:b0:382:5141:f631 with SMTP id
 ffacd0b85a97d-38a872ebcb0mr9745005f8f.29.1736524925875; 
 Fri, 10 Jan 2025 08:02:05 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38397csm4792939f8f.24.2025.01.10.08.02.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw/arm/stellaris: Fix overwritten IRQs and cleanups
Date: Fri, 10 Jan 2025 17:01:55 +0100
Message-ID: <20250110160204.74997-1-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: k7C9b9B44m8y

- Remove invalid unimplemented I2C#0
- Add DEVCAP() macro to check DeviceCapability registers
- Check DEVCAP() before creating devices
- Use 4 inputs for ADC, wire each timer output properly
- Improve documentation

Philippe Mathieu-Daudé (9):
  hw/arm/stellaris: Link each board schematic
  hw/arm/stellaris: Constify read-only arrays
  hw/arm/stellaris: Remove incorrect unimplemented i2c-0 at 0x40002000
  hw/arm/stellaris: Replace magic numbers by definitions
  hw/arm/stellaris: Use DEVCAP macro to access DeviceCapability
    registers
  hw/arm/stellaris: Map both I2C controllers
  hw/arm/stellaris: Only create MPU when available
  hw/arm/stellaris: Only map existing devices as unimplemented
  hw/arm/stellaris: Wire GPTM[#n] output to ADC input #n

 hw/arm/stellaris.c | 146 +++++++++++++++++++++++++++++++--------------
 1 file changed, 102 insertions(+), 44 deletions(-)

-- 
2.47.1

