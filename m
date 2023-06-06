Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3394663ejb;
        Tue, 6 Jun 2023 03:47:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VI2z87BSyI5FZFiNJ0WAmcMH9TQlb4N8WAyDcyorHdH/qWRTNCYaA9m15ZYRTTxFxlNvY
X-Received: by 2002:a05:6214:2526:b0:626:ff6:f48a with SMTP id gg6-20020a056214252600b006260ff6f48amr1665962qvb.13.1686048447806;
        Tue, 06 Jun 2023 03:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686048447; cv=none;
        d=google.com; s=arc-20160816;
        b=A33UvXvmEnzwklG58liwDfut7B+L8rGY2vwGJJjHESuDWXpHKDVXyFGzWRK9hkoeo4
         lbBJeGxf4e/2i08HaeUzmHsG4rDkpGmA5tErRG4MahT3V8eKeaKQCIP9xRE0ZvBMPIb2
         +eYpdvwkq4OAXJad3A8+y9kigGV2o2cySyFtaW7COznNNjVP0QHX0uPmExTvjNFFTW4O
         qB4aoIfhS1gRs3KW1P5S8sXShDNZGe0lgiAus5Ow2bTSLpd8Hgufjz0OFdRLriU562wv
         tjZ8p2ocptFlp7iesbL51cwRrNdS45CJ/tVc779ykVVkkbQ4eYw6kJTrK5FwICtv8bw6
         NwPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dEjhODPeDspd2DTqfRmFTcsDtUp7wwGuYHP+us8ZLc4=;
        b=W6EkLkL0bn5sMKhZTURGd1/V+SvRDaC0HKpRXNHbmTr36wV8bASj2z817hwGdTTNyN
         YA5L6C9WBoimfe+jyomDTIRkrJxQ62JYTmvx7F4sqCIEhaxlN0gvih+tXs2fNRYOZOm5
         bnL4x5VBiJaNeNxjTr8JheJh5FavU3PrwoWwaIPT7HnDMw2tl0qPBngWxK0YUnn/fRx1
         92rxWT4SFKrG9rQvN0CcxVQnmCuUTy3N2jxuGn+jl2he+856KirNBcuU7ZNmJUrWLUft
         SbmghJiyPwqLGuW5jLEqraEC8Km8Rt5xSINj15j4KP8scZJ62hyhxFVBqA0XeHEvhlwo
         IJCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UE1c8Umf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl7-20020ad45e87000000b005e869240425si5980749qvb.300.2023.06.06.03.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 03:47:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UE1c8Umf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6UCe-00014B-QV; Tue, 06 Jun 2023 06:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6UCd-00013H-OP
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:46:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6UCb-0008EZ-1P
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 06:46:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso42832835e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 03:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686048370; x=1688640370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dEjhODPeDspd2DTqfRmFTcsDtUp7wwGuYHP+us8ZLc4=;
 b=UE1c8UmfWUn/F3K6bLFmOiaJFaQAJoW8XJLeeqSFHYzyY955kvFQ22eRmeJBWPvE/q
 97myvl27q0Ax8yR9fPG029UYR4CgQAVktIfIGGUS3UNIqHceFBwWjE9EwXJhISIKC9If
 NVa0SWkS5HNXFwknl7HvbiX4Dzc973L1gmn8PBC1M+CSoU6RGoPt74YLq5i/JBmwi62a
 FdeVUNfRbcIXgzA8Im/IO7+W0dqGD4aDWQSHeoywYROTI++T/ZRr9INnlrVSWs1oU0o2
 ofSdDlqjoKiy19jIjll/YxGiGUWghLp3zr+pcVmUVzRIduX59qlmRCYaIkLbNY7519qn
 cDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686048370; x=1688640370;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dEjhODPeDspd2DTqfRmFTcsDtUp7wwGuYHP+us8ZLc4=;
 b=kXB3q75fxtmXSO/pg3oU33u8PGJAW4P2BUXzKE6O5eLKMohRlbUWABe12py+gftssg
 WbMGKEwSPvYG+Vx8gz1uUj+BAS3YqnkQYKdr/3HW907u109wjiOOf8fcbfnwkKugzkd5
 wWjNqiWbCmKjtR3alhQhCYYkov979zIHy3HBlk89E6oDxjbifGG8kS7K6nNgy4aRrGDs
 UJz6PqYvisgXysKWSgn9hXaY+vrNARZ2g+o3tv+6W22/HJOdK7He6lLLcjbV0QMDTo+S
 PG5LXvFwXU6UlhTDzQ7setUcj018K0c3IdZE5etHQdb2yQxR8gXn9N1UKkm33aTDGpgY
 UWXA==
X-Gm-Message-State: AC+VfDxSyZh187rpC54KF30LzgUSssrJ6SWiB/f+hU3xy2p8qzeDGLf0
 VzHtRFxGfN3ddlWWYWIDzCytObtKM9Vx6OmdWyE=
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id
 z15-20020a05600c220f00b003f7395d6585mr5572012wml.15.1686048370657; 
 Tue, 06 Jun 2023 03:46:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm12195508wma.41.2023.06.06.03.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 03:46:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, qemu-stable@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 0/2] allwinner-a10: Fix interrupt controller regression
Date: Tue,  6 Jun 2023 11:46:07 +0100
Message-Id: <20230606104609.3692557-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: XWXdd6ZWk/1X

In commit 2c5fa0778c3b430 we fixed an endianness bug in the Allwinner
A10 PIC model; however in the process we introduced a regression.
This is because the old code was robust against the incoming 'level'
argument being something other than 0 or 1, whereas the new code was
not.

In particular, the allwinner-sdhost code treats its IRQ line as
0-vs-non-0 rather than 0-vs-1, so when the SD controller set its IRQ
line for any reason other than transmit the interrupt controller would
ignore it. The observed effect was a guest timeout when rebooting the
guest kernel.

Patch 1 in this series fixes the regression by restoring the
old behaviour of aw_a10_pic_set_irq() for non-0 levels; it
is stable material.

Patch 2 changes the SD controller to follow our usual convention that
simple IRQ lines only send 0 or 1; this isn't strictly necessary with
patch 1, but it avoids future surprises. It doesn't need to go to
stable.

thanks
-- PMM

Peter Maydell (2):
  hw/intc/allwinner-a10-pic: Handle IRQ levels other than 0 or 1
  hw/sd/allwinner-sdhost: Don't send non-boolean IRQ line levels

 hw/intc/allwinner-a10-pic.c | 2 +-
 hw/sd/allwinner-sdhost.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

