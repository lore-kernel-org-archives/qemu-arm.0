Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3441385lfm;
        Mon, 22 Jun 2020 11:53:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1X5Dxk7D8JiCVaHS5xcmNVfaoSXj3Lir9f+JCVUgz2QtyAGg7Pek95gwM5i7I6vV+JOOT
X-Received: by 2002:a25:a2c2:: with SMTP id c2mr27906882ybn.333.1592852006375;
        Mon, 22 Jun 2020 11:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592852006; cv=none;
        d=google.com; s=arc-20160816;
        b=SnLiO7NXTimL3OmG4F1r6M9t5fL+rkmKiMXN5kFF6jNRwt9Rq9VycKL1cMFe8MVyNt
         rUDrQRwhInAeSoKPA0hKZ83rLXT46/N4y5Bmo6WX7HZUTDciPm+bCJWJ+CMwqlM7bDlj
         jgNBLzvW9zaxxg12O2OH/vPExg0He8hVWzVHkLiuFcK3T+M4Yko2AtmhICKolVwU0zie
         N6b+BfWnKUIK5qThBbtOefxqi5/iqyWJtld09KLsTeNBDlYdYFuKjvaVKC3tDlNQS6LQ
         pbjUyHXe3JCiieB8xKkiw7rdhmm8CDQvj96IqD948IaarbxaJ+7Tm9uqcy3Sm8y1ZeRt
         ZK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=bQAG1tFVjJDgCHdU8xbvkV4BSII3UjjxzdqhUUsLo2M=;
        b=pRKv5vQpOgo3066CmZc50hgXNCTIv9rnwS1cqoHMpxPJ/MTLib0QIWmBSb7c7QEp8l
         ySOQU8jevjbWBlvZtLhUGexA8E7198cx5c29EjkOVb2nOvQGVbL38q3/iqZhFy5ee0a8
         9LKLVprApslw+At4Pu6Ry/oLXaf2CZay5eXgEyPsBKx68ZQ6cZT92GnRUTi/ouIeSaAt
         GzX48LnuFRNtQ/+Ku2S3XngZLO5atU8b+mOuOwJf2DPY5TOj29N3njLQYz9zsXh+vVTl
         4KY5p7kp50t6W6XrH8RW7geXzFtjXGBinl4Ho3AVtSYU7HyngzYr/nZEFjk1l3TodyBW
         hpYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="MlNHPmW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j125si14920422ybc.227.2020.06.22.11.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 11:53:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="MlNHPmW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnRZN-0007UO-Pz
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 14:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1jnRY9-0005uW-2z
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 14:52:09 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:38916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <derrick.mckee@gmail.com>)
 id 1jnRY7-0002Y1-56
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 14:52:08 -0400
Received: by mail-qt1-x829.google.com with SMTP id o38so4803246qtf.6
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 11:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bQAG1tFVjJDgCHdU8xbvkV4BSII3UjjxzdqhUUsLo2M=;
 b=MlNHPmW/X1wW9wlEkj4MKNVAmXlqxPNeBxz6njg0+S5C/0gnaYAh/iPn3upBk3H08r
 e1lHrwTCY6wwgT/wv0xUmr8Y2/J4OruG8go2joQttsbIOzwjT7Lo00mkqDo+xSUpQKrM
 x8cfOb5J6ScibKkmkfpAq0zqoNaxhKEVaWiP3+vkKwQ0l0IJK6qxCkiuA17kqeCVpY/0
 NVXjVpz614P7a7IbXQ5cyioL0HFprLi+9wagohboHawNYmDyZj5/01NeM3zr7WyInQbP
 gvZ238h8hjJSwzRBa7iyNUSYuSOi3qSfQaLwQJzwel06/lzbuHpFarJcDlcax9B66v4Z
 m/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bQAG1tFVjJDgCHdU8xbvkV4BSII3UjjxzdqhUUsLo2M=;
 b=MXLI96ZR3Ek/TWvpnXdyCg8zmyqNiCRcfCirQLn5DGaVx5t5xV5fsImv0SzRllcO34
 b/lfn+lGsn83pQSbXUdDTh9HD1p4nWO4Oz8TYqAZKs/W9/CfDjEX7vEwsJLuk2Xy5DHI
 jyccudDC9J7gC9tNzw1QMnF8Pi2F4v9YnKKcLoOTSJrrEIoRNz3rKfcPpEThhdn1wuwJ
 4tishUqy79Oh2izJLeCee5BZ+ixNAtKqicuubH7MakDHHG0d26wlvn+5NtQSmZogC9wc
 0vcWeyCDkczAI131rHjaReC3Z2TFaHu++v5e79svXARbWd0eCWGAVQON+Tc9lcV4tWKk
 vpaQ==
X-Gm-Message-State: AOAM5307OKb/QNiJ32vF7b0+EWcV3HTsCVMb5eTwIyr7irzWiLdjYx6s
 mPsDG5BLty9OE9DG8k6oSxruB2OjaMFS54oKj5D+FM5q
X-Received: by 2002:ac8:2bba:: with SMTP id m55mr17762168qtm.171.1592851925647; 
 Mon, 22 Jun 2020 11:52:05 -0700 (PDT)
MIME-Version: 1.0
From: Derrick McKee <derrick.mckee@gmail.com>
Date: Mon, 22 Jun 2020 14:51:54 -0400
Message-ID: <CAJoBWHxb10S8+DVpQSrKR0kwJd93-fmid1yCGv6k_n3NDWa7cQ@mail.gmail.com>
Subject: Status of MTE and Pointer Authentication?
To: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=derrick.mckee@gmail.com; helo=mail-qt1-x829.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZMnFsg99vUgN

Hi,

What is the status of MTE and PAC extensions for system emulation?  I
saw that there were some patches submitted, but they don't appear to
be in the current main branch, and only TODOs in a few files.  Thanks.

-- 
Derrick McKee
Phone: (703) 957-9362
Email: derrick.mckee@gmail.com
