Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2941990ejm;
        Mon, 24 Apr 2023 09:51:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y0ySM1N0XX5pvOwRyFaazQl7B8aCzZcvkNIp0u/e2NVzfDfJwdAh/zwLjxLupsV1cFtILx
X-Received: by 2002:ac8:7fd6:0:b0:3e4:d1c0:36a9 with SMTP id b22-20020ac87fd6000000b003e4d1c036a9mr20624693qtk.48.1682355068540;
        Mon, 24 Apr 2023 09:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682355068; cv=none;
        d=google.com; s=arc-20160816;
        b=CU6rfxs6ZC613u0I387Qh3EnKXIOr/QKRL0nB1WpVLQ+rhldVLyXoJGcuPGiTSqqVq
         RhrBIZb1ZiSWY/k30KcM9hYj1G9LpR2JzCf4+GloGTnygnKiuPCb4H84tYn6OIDywW2i
         bECTe8qS2QcELSxBrdbdGaLZNuldtDmH9kkGub+FkOU7SuXVu1qgjLytxWDsPThPgaft
         5c/dGdmWxi4mH1BnY/4FiI2huJIKeXauUvX5GujmSLnLshq3ust9Gr9FTpB23GFQ1Xos
         6eNAoIzL1mRofmOmPiH5H0qdTvfAmMUKFjlGCSFjxXIols5izkSTV53+TSJ7yaHb6KfH
         f1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=FXnUq/n/hcvM5B6NkjzeHjrXq1uap5u9joWbU/kw6FE=;
        b=cwnCfLsRvotyrzl0Bk99+hAPMTfWx/vBjF4e4ELv8OuxVnPUvjp6Z7ivqdVmOmpnnn
         ZmUq9tyLj3EMN2SqPk/Sgcqlpggwmi/XTOVU+Q1V1NfAgJBRAGZOQF7b076maksaxSpz
         G4/1ssJPxc4TjZfSxsvXt+nl6W0M2zI6rhwbflicgFd+/z7Xehh3rPGGvHGdUsu82rGo
         /dXX7vw2uWVm0c3ermdh+88Rhuc8rpoWOduuMqkoyhDpaGwfsuFlI/AO5ab/HgYJIQEM
         jklqBZk5aYHgMpQjBkubwYSO92bT8o+DvwJEzisknlld9SVXqQl1zNuG6/sx2NXF5jZu
         StOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LpLbO7ZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020ac8594a000000b003b9b59883fbsi3567470qtz.573.2023.04.24.09.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Apr 2023 09:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LpLbO7ZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqzP3-000354-5J; Mon, 24 Apr 2023 12:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzP0-000341-L0
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:50:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqzOy-00029h-W6
 for qemu-arm@nongnu.org; Mon, 24 Apr 2023 12:50:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so4248468f8f.1
 for <qemu-arm@nongnu.org>; Mon, 24 Apr 2023 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FXnUq/n/hcvM5B6NkjzeHjrXq1uap5u9joWbU/kw6FE=;
 b=LpLbO7ZTGCgUM20q2Iy1qxvnqeeTl34wmX6A4g3hVahd8PjwGvFA3dRnpiCaaSlVT1
 J85EwKVdEeGV7438ifTOyKiSGazThVwcGxrGiXaI0xrIy8EofWvceedGD7tiyMTXrDS+
 A/aYcaF/FpjVYSJflVpN/il5AKBKefEFkKaAitCSD9HRVTJNPlFNxHta1Fe9JRt9xecm
 vGS95dvVDfLVmWAuJ/wpNbKuCWM+WP6ASiMpbRyM68A5ppp15OKrPGdodcEwgz9MNPU+
 BoDaTRFBny4xvT2aYe9uN9xFy22VKIfuLjip5ZTMw7ZBcgNdStpmgw/OjApNIiTJfZHU
 zUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682355055; x=1684947055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FXnUq/n/hcvM5B6NkjzeHjrXq1uap5u9joWbU/kw6FE=;
 b=IArXb29tuFUpIg1q+fpM47/ZRerSc+tO7spdxmCY4sHbkcCIdjPPV9OR06C8oxLP/1
 g7GUnbYeBZFne8xYYWOQc9IApoIQnYi6cVn08a2SW8VrbeRComARocFB87NHNlPEf/nY
 i88ApchdT2MCveyc/3BipNFAINfFQPKWMU513xDIVieowD26Yp/mhWXLE9/PFU4wFTQA
 eo8wQ15ISPvKzE4Pna7G0/WuOKsGYXmOb+zcy4cchQ3289uy8w+cI4HGIfGZQBhu9OMS
 F1DtkaBsoLcovR3wkEHH71a57OLJ6kX0Hz/NPsPI7RuxnV+2AmWumh21kxsUpkQSgET4
 niOg==
X-Gm-Message-State: AAQBX9c/+jIwAXH/tZMyJkIhkJFpBGwEwFzskx02olllK93wKDJ0AFaY
 li9OFU9qcJmOJ/97nMDsK6XU9m+FT6uLxbyMHIo=
X-Received: by 2002:a5d:5381:0:b0:304:794c:1534 with SMTP id
 d1-20020a5d5381000000b00304794c1534mr3449358wrv.4.1682355055224; 
 Mon, 24 Apr 2023 09:50:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056000054500b002e5ff05765esm11211279wrf.73.2023.04.24.09.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 09:50:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-stable@nongnu.org
Subject: [PATCH 0/2] arm: allwinner: fix endianness bugs in sdhost and
 sun8i-emac
Date: Mon, 24 Apr 2023 17:50:51 +0100
Message-Id: <20230424165053.1428857-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: gJgXZP9X/qqK

This patchset fixes bugs in the sd controller and ethernet controller
devices used in the orangepi-pc board model. The bug is the same in
both cases: we read and write a descriptor struct from guest memory
without byte-swapping it, so the code only does the right thing on
a little-endian host.

These fixes (together with some of the others I've sent out earlier
today) are enough to get the BootLinuxConsole.test_arm_orangepi_sd
avocado test passing on an s390x host.

thanks
-- PMM

Peter Maydell (2):
  hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
  hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields

 hw/net/allwinner-sun8i-emac.c | 22 +++++++++++++++-------
 hw/sd/allwinner-sdhost.c      | 31 ++++++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.34.1

