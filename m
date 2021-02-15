Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5961566lfc;
        Mon, 15 Feb 2021 13:58:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc50oQJ8iAyh5MuniJi9aqDiCpt9eR6FBd2PuQV6OjRF+WDe68akWXrqO4zuXpIhesngQ4
X-Received: by 2002:a25:5051:: with SMTP id e78mr3970864ybb.386.1613426329619;
        Mon, 15 Feb 2021 13:58:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613426329; cv=none;
        d=google.com; s=arc-20160816;
        b=EeGVoL4KRVi7MpaLtENUvSQISztYJORn9zfFS1MGFw1H5q52V2+z1c9f9j7RhN0Cf1
         5/4pzik1SgoM+uZ6mJ0dLbDfTZe952/ygsXPFc4+z/hrBbYRns8HiVG0ReO0Ms2M0O+B
         GN3FZZSPqszC1PSTwCgmOae9XvN3Q6nvtsGmFbWb7rO46b0iD+97ckrdF54Gz4Y9E2rR
         VwdwX8/jt75XeUpfRIjD5xn+gZQ57OlmulPKAG4Kq0kl/O/xl25RMWoasw3M0GDochkO
         uCLij3PIGwH6KZpQZtpKQMSaEvBctlcfJ6OHJfOhQfvkIuqnCOju4dWgVaVfNMXAmFV5
         7seg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=H/BIETWzaZJmb7wMKtw4nqWT52RSETxWIhxUFg1PsEg=;
        b=n4PDnl36z4Qv1vXtOPw+BDKYcDTYM3PCLCkoCjSOCxHEPTt7uIoIJoCFUW3bO0DU08
         dbU8Ix46iz/m0FfBtFRRHsuwHMlrx+TJhGw03MLAHSg9PDYu2cc90oXifH7t02THGgmN
         0dwsh2BGWiqGdqLJjNIkFaK1LOF0LBpB4yWX5S31F0TqE/O7HnQz07PTXtOGgQW+YBNb
         YBncvNnMJgmkkMPMwBWXdHO4yxhFJtwtAT5UU6sQQVxCGkyv/OFriFTnbCLicythW/Mk
         b+ldSP5RJC/+KwF/lO27O8fUE0+FoBa8BmehaybvCgyfPfNmPz7rFhur2zpFruTsQxAj
         CLhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=MyZb5Oa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n193si15722538yba.369.2021.02.15.13.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 13:58:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=MyZb5Oa3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBltI-0006Pv-V5
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 16:58:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt7-0006OA-La
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 16:58:37 -0500
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:40986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lBlt5-0007oJ-TP
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 16:58:37 -0500
Received: by mail-io1-xd2a.google.com with SMTP id e133so8196452iof.8
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 13:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/BIETWzaZJmb7wMKtw4nqWT52RSETxWIhxUFg1PsEg=;
 b=MyZb5Oa3AXTEuUfQY5+/TsMpimoizs3hQ+Y6T2dA0tRGHU/Bm9+I3IPHzUHPsvamaM
 fCKW1w36eBIW2/1DXFlo5DszcZ7KJ2jKk64fZ/Bc0gYAMrY0f82gmp+9OcNm6fqE0F91
 z12DbnLNd+pEYWt4PfVLH5v8bfezq74WbQSFnF11GrLd94TaRb5GjOdWUEMFOl+m3ADM
 8v2dwBOYVmRYZ/dlyB/I8vFC52eetsHldcEMu09MhWE2H6QN445IakxBU4L4aqr0yZ1Y
 3IJLhpEyowqW40NFWztbRrVYCLXTxSYQMbjj1j2xKP3zVlikbXQlw9jChOLgaUWq3hkb
 6v1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/BIETWzaZJmb7wMKtw4nqWT52RSETxWIhxUFg1PsEg=;
 b=enoSuO4733FVJu+8SmDdADUgZhl4Z9YM0k/OQoiLfc+/wMQlCFCU5MsParksVZ+vt/
 EMu1fqy8gMPl23Extm5JrY0ZdWwu9O+o8GnhUwCKJHxEhRYplQlQN8/631Wx0Xjy5ceY
 ReTJPoSjV0DeRF7oLayjfCIc87B3WGj8ggIrGecYM+CO+rt3MAAic9tszgSytlsNt067
 1gb3qSXiwa8M0b8y41QMaKBXhYYkh5k8Cj6T4wOZMKRiwmIckzqDecRjH8S5V0ccjp3q
 /egh4wFG3oPFTIzDBfoHHSaFCFfEaGFLyLWaioRHJ4JxLQ6SNTsKOt6SHIDueY+hJ2Y3
 sXSA==
X-Gm-Message-State: AOAM532jwD96E2Aw229vo1cKeXnZlXHC2FRFuVxKrUYWE4FTWv5zActT
 3SYstrTwLQWWrQwVVZFFwdMbJ/1O1sxZkJ2D4RbzwqzV9tcY8bja9fgo+DP5HGy1D0RaPcCl4NQ
 bEyRLpTY15Y1XROIE6KKYTcXVl+P58xz58GwMjmWGR29Uu0g5B6ym8JIBFVPzPRGHShC9
X-Received: by 2002:a5d:9ec7:: with SMTP id a7mr13891250ioe.126.1613426313533; 
 Mon, 15 Feb 2021 13:58:33 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id j12sm9812254ila.75.2021.02.15.13.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 13:58:33 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/3] target/arm: Add support for FEAT_SSBS
Date: Mon, 15 Feb 2021 14:58:16 -0700
Message-Id: <20210215215819.1142-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kil9n6rLGr/5

Add support for FEAT_SSBS, Speculative Store Bypass Safe. SSBS is an
optional feature in ARMv8.0 and is mandatory in ARMv8.5.

Rebecca Cran (3):
  target/arm: Add support for FEAT_SSBS, Speculative Store Bypass Safe
  target/arm: Enable FEAT_SSBS for "max" AARCH64 CPU
  target/arm: Set ID_PFR2.SSBS to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 ++
 target/arm/cpu.h           | 15 +++++-
 target/arm/cpu64.c         |  5 ++
 target/arm/helper-a64.c    |  6 +++
 target/arm/helper.c        | 52 ++++++++++++++++++++
 target/arm/internals.h     |  6 +++
 target/arm/translate-a64.c | 12 +++++
 7 files changed, 99 insertions(+), 1 deletion(-)

-- 
2.26.2

