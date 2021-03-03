Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5122553lfg;
        Tue, 2 Mar 2021 23:04:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznQKzYZeMGr2xtFFgitTJ+sfUpFoUk2VOZ925xAC29IMIyiQAsS8m6BLXesa6u54C4VrgM
X-Received: by 2002:a4a:e643:: with SMTP id q3mr12306483oot.46.1614755073492;
        Tue, 02 Mar 2021 23:04:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614755073; cv=none;
        d=google.com; s=arc-20160816;
        b=MYHa/0DafqcvjOhstquN0TSZBvpBnGfbjwYeBuXEG/2SLowEKRg7oc/DWdCgeLmSyY
         ZoFGJQ6enOuZut2KJYv43AzqahO1c/Dt44QV6Db6CRSSXClzKg/qSRCG+OnqogQt3/N9
         b5r4Kj6I4a3po5BR5i9HAW3vY0fUo5oSQ6W48zhwQU6fEQPrXTyEK/37dB8weGwjuFZ2
         ifkDpgYDm83yG3TYvZ6l6uHw6Nv6GLgB9hphVOM7AFcvYczgKNSstntYOmIF+rbTFZC3
         KMyxK4lee1jTGp7oJx4koWHcKOW9ikzLH6TQ1BTEbEb72R7sJovgG0Yo2YBwsIeGSvtU
         SezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=h8K8eTWje5tNK4YJ0OoQ9oKrWVNXVUYvkKK/tjQS2Ag=;
        b=saNzdJtk51MmtzkIin7K5vxTer1VlkT/jFCgtQ+2F3OmwK0w0DxcBQKBI8Iut14iaF
         KgfS8RScdHi15cLa0qivz2UPuGY0ZnjnRP2cooS3G+x62trP+o38aphYPTdTX5lSkepw
         4DKHm3nwezzLJEo+WXWAvTXUdLrhJuaN4onID7pZIaY57KUBeo/ekh4Al/tpvALIwO1w
         zdQNsC99hDkIIsGhxsjYxc4rLsw1/O/dwFXZ3eO9N2S6ViyrBU1V2aFbmiCvHdtwPNBC
         GM6mDDXbIBEGkYdcWkuVhLAxhmT2FI1OOUNisB2+LJjFoAHibLnaaTTuAYqdPhCtC19e
         2Iig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r663nW48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si21002494ote.167.2021.03.02.23.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 23:04:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=r663nW48;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHLYe-0004y5-Mt
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 02:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHLY1-0004xQ-35; Wed, 03 Mar 2021 02:03:53 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHLXz-0007gN-I1; Wed, 03 Mar 2021 02:03:52 -0500
Received: by mail-pl1-x631.google.com with SMTP id p5so13523000plo.4;
 Tue, 02 Mar 2021 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h8K8eTWje5tNK4YJ0OoQ9oKrWVNXVUYvkKK/tjQS2Ag=;
 b=r663nW4810/l3feTZOyhArOFtZw31pyxe1o1manjMleYQ7oElPWJ5U0ENsvL3kO+uv
 Boz7fCEHHpzbV5evwf2UpoaGHDHN2RdXgQ4WaUgxhB2fTi2dN+vk1LBhDDPDoK9P0Xc9
 qryR7k8r7KpJXwxC1ooXSUG1qke6RNL111whHo7VtNgk8XY+xuUMc+y6Ou51CrjfkTyN
 PvsDhwlDMSf4sBbzHcuNzgkfw0YtYQFCUepVsDAHWAfSrH9dEH7+naJLlDzwYPToxfc+
 pAVH1uL8+NERT/MtOtwKnQ3yAiHgGw4I2jwJ+c/L/Wr8MkcfGnmDI7ambCE1d3Lqy/5e
 oSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=h8K8eTWje5tNK4YJ0OoQ9oKrWVNXVUYvkKK/tjQS2Ag=;
 b=uHoB7R6POZJJUvCmThInLlu8c/ZMFlDybym62+pmxY4CZjnVb8Kek1i4HRHgoTiYtQ
 3heaOeTorLw/QIC07wImW+s3tturwzffdVZ2JGkPOKi6WNp0EbjHgztXvZivFHZKIPU+
 T4C2dLWWYv6LeSalGbtPRbUedrKnqP0fXvxMpsjZjU6GEVJJGy9Blr1SgNdGaNE0OcyT
 V9YH6UQnYj2Vt7zyvpLXwVlSZ/HOULtltUuNDz5zA6i7yHLYtgrBkT0Z9yiaVhIYiN+j
 XlewnVTRQ5AmJFh9isb80trnESHMj97/Zk1PSL5fjIsffv+DiEoT6dx0ocbFVahOaTT1
 ITLg==
X-Gm-Message-State: AOAM533Oms/4WmQisiHSkIOLJaqo2H597UxVMOWk3MbQKgyqg0Dhhgu/
 E5uxxF7R/18J+19QLKCiTeI=
X-Received: by 2002:a17:90a:e616:: with SMTP id
 j22mr8323602pjy.190.1614755029585; 
 Tue, 02 Mar 2021 23:03:49 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id bb24sm5855703pjb.5.2021.03.02.23.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 23:03:48 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/2] hw/misc: Model ASPEED hash and crpyto engine
Date: Wed,  3 Mar 2021 17:33:29 +1030
Message-Id: <20210303070331.70744-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=joel.stan@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8GEaQCD0R9cW

This adds a model for the ASPEED hash and crypto engine (HACE) found on
all supported ASPEED SoCs.

The model uses Qemu's gcrypto API to perform the SHA and MD5 hashing
directly in the machine's emulated memory space, which I found a neat
use of Qemu's features.

It has been tested using u-boot and from Linux userspace.

Joel Stanley (2):
  hw: Model ASPEED's Hash and Crypto Engine
  aspeed: Integrate HACE

 docs/system/arm/aspeed.rst    |   2 +-
 include/hw/arm/aspeed_soc.h   |   3 +
 include/hw/misc/aspeed_hace.h |  33 ++++
 hw/arm/aspeed_ast2600.c       |  14 ++
 hw/arm/aspeed_soc.c           |  15 ++
 hw/misc/aspeed_hace.c         | 302 ++++++++++++++++++++++++++++++++++
 hw/misc/meson.build           |   2 +-
 7 files changed, 369 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/misc/aspeed_hace.h
 create mode 100644 hw/misc/aspeed_hace.c

-- 
2.30.1

