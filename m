Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp507466lfm;
        Wed, 22 Apr 2020 04:17:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypLypzKcYWtE5JcpTvFFfBJ2kapPaNAhgcJymp9rV7EumefiE1PdPn7ILSzj4DJTJRYktICh
X-Received: by 2002:a05:6214:1702:: with SMTP id db2mr24796463qvb.201.1587554230640;
        Wed, 22 Apr 2020 04:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587554230; cv=none;
        d=google.com; s=arc-20160816;
        b=P+7bqgadIZmjQhgUNG1/HzVDM6HLlOJbzeLkT3/a12AqHdO2v76aZO1gUZPWfc3YLw
         V+Gp2N5tvWoJIWwrvqPOgKSsYVV5Sa7MvEDLUOUpJF1oL6lK1gqtu0lM1mLGLr/b1C9d
         UCguNsSR9fLAZ6yrqfA4be7L0IzG1LZr3/Oa0d+jadMhcB4/E4aw9gNjiT6Iac1sAJIQ
         wkFJEDtp6PUHdHzKMfziWrlC1gZgZLsIsSURKWYTJO/vBW2yZDj07KRjVjfqi7esz4L6
         QeHe4m1p5wvweLvMqry74qt0ucz1fSEGb8X6SaaTqQA6kVtLitNKa1grDz2CSsvITyCQ
         4DKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=d1b1kwRcm4IeBo1a3w1t3CTjYS9/OAreRp4T9ozBuZw=;
        b=BhfUcnSOJHH6WTZqaA8TzyOH828t1Xqu3zwwP4YrjU49KBzi3rh1bjIalFBwc6yTwY
         HwQeFbtCoyjIICVfYDl6wh5HPE6N6417t4JSuMzWTCc5khNk7PLeStj8iP2qFJZibJZg
         XaAEgnzW3x4xHJBWC5MZ+kezI5tiRVJY6CLdFGPBLDANpmLHvAzFYuozLqrBNO7rAOJk
         xsfZRhp8QYMYVVSQA1VRQVgBDIICnVKKBz+aYFYRSN0/YotDrQC88XeIUDqr5igzIBHp
         GKskSD+oV94xPEoAf8+47dPobC+gc4xLKJdUrXrARXBdqo9r1tSxOe7mkGUXtyeXRJuT
         2aJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XCMlj5uI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d124si3048830qkb.45.2020.04.22.04.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Apr 2020 04:17:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XCMlj5uI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRDNO-0004u1-2s
	for alex.bennee@linaro.org; Wed, 22 Apr 2020 07:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53938)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jRDND-0004tp-Ke
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 07:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jRDND-0007W7-1S
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 07:16:59 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jRDNC-0007U7-JV
 for qemu-arm@nongnu.org; Wed, 22 Apr 2020 07:16:58 -0400
Received: by mail-io1-xd35.google.com with SMTP id f19so1907940iog.5
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2020 04:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=d1b1kwRcm4IeBo1a3w1t3CTjYS9/OAreRp4T9ozBuZw=;
 b=XCMlj5uIS3V2S0WKj2lzYMHztt3NnH9nnwP7ETZ9VbCDuElWfg3Gls+6E6Td7agMvy
 7idKx/kdwrP6bObW7fnalQe5AB4GcR1Am7XAtrVDrugEhzp+H1WLYKEkjo14nSqd8YQx
 81AF3MPHFif2fN9NaeOPNvbwewqV3AhxMEzDOVf582unIzqYLPZoDp4xXCONy1s98jyB
 I/JicW/OkPHV2Ti+snxWiHjFBwKk7w1ZpwXLbQvPMAS69qQS7pvgBxM357NcU6aKEJce
 vhnJFEfU0/X/PhZO7QroMwacCaV7ulvGD5IjNf2U/AZo4YTFp07I82BRWO+YzbNfhCnN
 G4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=d1b1kwRcm4IeBo1a3w1t3CTjYS9/OAreRp4T9ozBuZw=;
 b=QfIley9iFn0CoL5aiQNxk2WDxPUOEq7FXtbGuVvu+IV9f48c6idcNyCE0gFvLbPnM0
 HpT5U4TIaq4JNo2V/IebeTkUeS/P69wy4lcBJdpuJWR8YFCxASsGItro/bE3EN81nich
 J0M0mV1+V5Kmjlb/1KUr8VBE2hnUWn0tPHhCipghNnHsfWzncaFgv29PYCw6R6E4PXU3
 3jSYug/FWuX4eUsXhA0gDhnDn/+8MGpaAvISVLzW676F/DpksqCiZtQjM0zFb58YudKe
 HBFfca8RUzT90fowZhMUJI2bD180tJvXjRZJuXGnfiKgAIu2+7ArsEtXhPbKC0H9QfSx
 yqeA==
X-Gm-Message-State: AGi0PuYvrC67QB73JAlGVhvVSutWNxP+z33eB18l+2qJJswiPgp130d1
 UNh7kPGz/sO3HnkDtGauvti2lePALnGk6wzmX8o=
X-Received: by 2002:a6b:b908:: with SMTP id j8mr4756943iof.189.1587554216389; 
 Wed, 22 Apr 2020 04:16:56 -0700 (PDT)
MIME-Version: 1.0
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Wed, 22 Apr 2020 13:16:56 +0200
Message-ID: <CABoDooO8dAYLv=VT8v6QbR4Xd0Pe8xHd+O7szVU-nLt1T-Oauw@mail.gmail.com>
Subject: Typo in cpu64.c
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=laurent.desnogues@gmail.com; helo=mail-io1-xd35.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::d35
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PB1Zt6vBLxIV

Hello,

this line in aarch64_max_initfn:

        u = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */

is using t instead of u.

Thanks,

Laurent
