Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp683763qvs;
        Tue, 13 Jul 2021 07:27:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvxjYWsnxxenAQMP59/YFomwV1lz2PAoVfMGcbYPOc0CYUGYFxVxU+weOXY+APovf+Cpz0
X-Received: by 2002:ab0:378e:: with SMTP id d14mr6374946uav.18.1626186447848;
        Tue, 13 Jul 2021 07:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626186447; cv=none;
        d=google.com; s=arc-20160816;
        b=Ff7V3Q+upf1MqEwHBppmwh6LcqbytEbVG+MGd6H5e8BqS0fCXU/WYzoUyJl5NlChfs
         aXKEWj23h021ACf9zgYwG9pHBNHlyqdQ8Re6EI6Z6pt0fXdwPGr/z1+I5bSUZFqv/KDw
         RT9idhA+fmTnpIKhMlJys7qHOtAIup9dvFZoyrCQeXjw5no17ddrMyokC6rm2x193V6r
         pNc1Y+nA+zQBYQggdj6kzp8WPds4Krp1KwaodGxVvGGISrCMcmUn5Jx5b9GeA1MGBkKr
         JMQdKuc1Wm2f0VPvn5NVXNTnY/CW8r7BGrN05mAAiuad/Zy9rcC/cxTEK+lK6cGjpd3z
         9KFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=/CeRSthh1JbtrL21LZn+cKfeYYAcfJeHmn0eg64XTwk=;
        b=fJ6+Tj1Bl1I0DogihNgGvR6EVp2EgABgL9cbu0XNGlFEtYYQnkh7UEMjBV8kZPIi71
         obaFF6pT9id5kFM5RMTWAS+ETxnzPGfhEIlfUcb+xOB6e5S/RSXC3+PqnTETmH5RbjUw
         3vAgtrTX2mxPmx83t30zVZsSUEmbcXq/uTIjmKKRupiZ0Wm1jYlygptkUzz+9OlDlBMP
         cfib1DeB0RXFjT0b/re9BZQYTzfxFfAtJ4N/g+aVJ3dtZh3Sh9lF0i28WGkoBfzMIDnP
         UcdkPB1CjzuJV32QqOoIWMFE81AKpb+s8UnpgA2nEp6NSDBHl0OAaYlIkYR+iR9f3ted
         +uLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DvrpF40X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si13724472vsa.263.2021.07.13.07.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 07:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DvrpF40X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3JNf-00031y-8v
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 10:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIx-0001bi-0h
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIu-0001dT-ER
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id p8so30712797wrr.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CeRSthh1JbtrL21LZn+cKfeYYAcfJeHmn0eg64XTwk=;
 b=DvrpF40X1KkDDuruF8tL3Fg0naS2ZagkeJBwO9W8hOhKfO/XgvyDfh6igXR3lFswgc
 8n28gumazqoOuE6IyJs9QBkV8Sn1JriDXPGGY5qjaBppxhGKz4PTpa7pdBb5mvQUnKix
 f0kY+jXWRkxq8rh69gBwLns/MC14ZXIgqVvqUHIDawD4FM4fI4cpvxlGWqMs0qPy1Daq
 4tAZkQVZ1/9TFcAQnMUdQR+KcvfcXq0qmaQ1u3NiqoSWCLOH7ugGKz3DD6G4O4WAwpVt
 D/FBC9O8CmiiOOF4ztRxfzyGdV6V+s9knxbpcccbN5a1KExYeKPr59jtPIn2HZSqySfq
 cUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/CeRSthh1JbtrL21LZn+cKfeYYAcfJeHmn0eg64XTwk=;
 b=llYg8dgh2omB+Z1bd2y/cGFqlFvY3zjaTum1N1QuuT5b4ezOJaRARSkJklkdQ7JoVC
 TE55rNywxKT6TTh4/A56wJ5u59fhoVRcgiDVGj+v/dCoGgnkTzMr5RkioG3fsvulyndL
 Qy/TAu0FNJuZMl9YHwO7iCI6rp42gHEi5tPSiie/+JmrgY1XuCG/CUJSEaRsJSexbbJA
 YFpwEeQpO0bYdzePZeikd6FFjnzrZreKFglnoC33Kl5XWXHOp2ctZKnm0EYU9Jb9fkPb
 Va4UUARAxAa1uD3MF0JE+M/UllnK1G2eFrOukyVcNoqTglQREkvVwE3A82h0ITZ7B6jo
 jAVg==
X-Gm-Message-State: AOAM533QSX/df0zHfz68B3Ol0A6S/lkY1ZtGjcOkuqrkWIVdKBMvTmBK
 zt2uMR9hTWg+uIJyfdX6pXOKSh/w+/w0qTs8
X-Received: by 2002:adf:d204:: with SMTP id j4mr6032774wrh.414.1626186148786; 
 Tue, 13 Jul 2021 07:22:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] docs: document cubieboard, emcraft-sf2, highbank,
 midway
Date: Tue, 13 Jul 2021 15:22:23 +0100
Message-Id: <20210713142226.19155-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQgTctvWebEI

This patchset adds documentation of the four board
models cubieboard, emcraft-sf2, highbank and midway.
The documentation here is rather skeletal, being based
on a quick read of sources, cover letter from original
patch submission, etc.

People interested in these machines are encouraged to
improve on these docs, but I would like us to at least
have a stub for all the Arm boards we emulate.

For the record, as well as these we have another ten
undocumented boards:
  imx25-pdk, kzm, mainstone, mcimx6ul-evk, mcimx7d-sabre,
  nuri, smdkc210, xilinx-zynq-a9, xlnx-zcu102, z2

v2: updated cubieboard and emcraft-sf2 files to list emulated devices
(thanks to Philippe for the lists of devices).

thanks
-- PMM

Peter Maydell (3):
  docs: Add skeletal documentation of cubieboard
  docs: Add skeletal documentation of the emcraft-sf2
  docs: Add skeletal documentation of highbank and midway

 docs/system/arm/cubieboard.rst  | 16 ++++++++++++++++
 docs/system/arm/emcraft-sf2.rst | 15 +++++++++++++++
 docs/system/arm/highbank.rst    | 19 +++++++++++++++++++
 docs/system/target-arm.rst      |  3 +++
 MAINTAINERS                     |  3 +++
 5 files changed, 56 insertions(+)
 create mode 100644 docs/system/arm/cubieboard.rst
 create mode 100644 docs/system/arm/emcraft-sf2.rst
 create mode 100644 docs/system/arm/highbank.rst

-- 
2.20.1

