Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1989635lfg;
        Tue, 25 Feb 2020 10:08:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoIqj2x5l3gHoI/0R2zl0qosn1n/qOjFcZn5zl+8gdnWxI/0xOi/avCtruJnz34cfEqhE4
X-Received: by 2002:ac8:6999:: with SMTP id o25mr52567683qtq.342.1582654130692;
        Tue, 25 Feb 2020 10:08:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582654130; cv=none;
        d=google.com; s=arc-20160816;
        b=gALkIsEErOxkwkLBPBDSGi/9aP1LgzLOdFsY6FRRi6HcjZTmTuXDl8PBEJidg+4tyt
         0meQ6zMa212ovjqq6Ux18GKXIqfsQi1WJ8ygXKpRqvIPD/K5haTX276PHDYm6Bk98hhV
         U84IP2pxzr0o15hpYbI3P2HYYMJ+nkWUQ1NH2rMMgofG9DmAFZF9aUreffsYZfM2jxOa
         BWlLUlIoGgsAeE2Gm9zcwhNMSdPe+VIXzwSjXBqZXnwtZJrRBA8pV9HK9NvkH/i8T4bm
         U7FLcwdg7VAcZFBNBGFDKK/PjgMf8d2A7kWEHeGeUHFns6MxhQq/bJaZxdBAAErTVCp8
         RZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=aZsIwMtj9HBIaWG7OkY3RpkjtyGYLVuwXKjm4gMidFI=;
        b=u89SSiA+kF4myElUAwnYZMxKI/gjCi/Hh0LCM+Jz6fZGVK+PpucPWVy++8D95mpL9S
         afyhGxXlP1UezJZbdnZ9O1MTjDxBAY6ntZBmA1m3y9oPi9rUqzQ7wesgQbOCNpUI/cnd
         gGVrSepDTMKuXbN1XNWI/y/AWnpcVB+R5/QtlbogWkUrZmDDc9MaeKalPXlD6GLGpGE+
         FeSeNhSxTq8RajirrgdLGMHiuZFO53/exWYA/LSmt5cJsz0HEFw6ZsSUSdGU8jWvcV0e
         WP6MfgetJZnnYkjapyti2b7/Lmis6PVdCaQyF5SMgYMzeY8eUJNaK8YZIvOBNY8RJ3/S
         qxrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccTvrEQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m26si118021qka.296.2020.02.25.10.08.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 10:08:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ccTvrEQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6edW-0002Ez-2L
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 13:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34793)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edJ-0002C1-FQ
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edI-0004ET-Eg
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:37 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:45216)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6edH-0004CJ-FB
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:36 -0500
Received: by mail-pf1-x443.google.com with SMTP id 2so7584259pfg.12
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 10:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZsIwMtj9HBIaWG7OkY3RpkjtyGYLVuwXKjm4gMidFI=;
 b=ccTvrEQ+aRv3+g5qtXzE7JIEqXNpASXGhK6bC+qsixvYAGDw9fmvrSP/uEryhEqgYd
 mJoD1zvmlvVt1mzGoOCItgfapVIqwpvY1h3js57Vmzz31AC1Yn8ZaGbBDcwPofswo4T/
 tcIsgwjG9hpve1sx1B1yxzYZnGdW+3O8dlH0mGJPY+NbmtKFD08jlscnuOTKWFX0ryY5
 TMe5rlr2TzOxiQ/95vP4+3vniahiyr2xCe54u4uA1Tm5s0pifeDEOQKg8tHeuzf7gBNu
 9JMgfCM+iBFUF7ifHGMqw9e5XAy7JnWXNnDP1KYXA+U4mACOmMGlwGXyPpy1Gz4c5JXI
 wv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aZsIwMtj9HBIaWG7OkY3RpkjtyGYLVuwXKjm4gMidFI=;
 b=ZzzXzVHZBXxG2G+WwqfroWcI1hMXk96EgNSJ+y54TwU2taskNZvr03xtvd9tRJeZ27
 80sz/7o6qdTjMPKENzejt9IvPEmgujfThCT6V0ggWFEt0dvgboczRA5Nksg4Si317FRQ
 ++5vxErsO3YdabyYXb9qjptip8j4V+LKTcxEJxbSPeG6rv8Npk4stdWTHsjHz4h46aXw
 71Po221EfbkbZR9eRlqyBEkKygBHUwC2KALh0o6DOl6E1hWirspPMheJeF3Eabkx5xXR
 4bycNbqD7Y7lqGCiuJ7qt3qCU0kV+3DZdgDU292Vm6XbCmadmGhnMjEEEQ9xrWf24qId
 RhDg==
X-Gm-Message-State: APjAAAX1nfuAbAR9w6sqInJ+CEze8IZdpwtn7HtS4Z8BJwUwXxtbvOFr
 cOl4jzwRvxZ73RGnc2UugE39EQ==
X-Received: by 2002:a62:e708:: with SMTP id s8mr59375815pfh.122.1582654113303; 
 Tue, 25 Feb 2020 10:08:33 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d69sm19069704pfd.72.2020.02.25.10.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:08:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] target/arm: Honor more HCR_EL2 traps
Date: Tue, 25 Feb 2020 10:08:24 -0800
Message-Id: <20200225180831.26078-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6LUmnUjB3e5y

Changes for v4:
  * Mask more res0 bits for HCR.
  * Fixes for TVM/TRVM.
  * Fixes for el0 for TPCP & TPU.

r~

Richard Henderson (7):
  target/arm: Improve masking of HCR RES0 bits
  target/arm: Honor the HCR_EL2.{TVM,TRVM} bits
  target/arm: Honor the HCR_EL2.TSW bit
  target/arm: Honor the HCR_EL2.TACR bit
  target/arm: Honor the HCR_EL2.TPCP bit
  target/arm: Honor the HCR_EL2.TPU bit
  target/arm: Honor the HCR_EL2.TTLB bit

 target/arm/helper.c | 306 ++++++++++++++++++++++++++++++--------------
 1 file changed, 213 insertions(+), 93 deletions(-)

-- 
2.20.1

