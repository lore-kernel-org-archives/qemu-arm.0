Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1326384ejb;
        Thu, 3 Aug 2023 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG3UuuzInCFT/Nu0OK4eXWyDy+kIcsktcLgOyIpj6siH9MtC/Gw8x/bLzI3RsUC+a4b4mob
X-Received: by 2002:a05:6214:108b:b0:63c:f630:8bba with SMTP id o11-20020a056214108b00b0063cf6308bbamr16243567qvr.53.1691099186099;
        Thu, 03 Aug 2023 14:46:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691099186; cv=none;
        d=google.com; s=arc-20160816;
        b=kYGyMYk3rg0HcZOURPGDjh+Ccv+9gXQvbjt0TTJhzlhKfRqZDzocoGxytdlmZ43Ec4
         WQRIdunvZqJdSX0SD8sag9K6JjIjBfSkRrygWW5IBa/s+AFkOaBqCNY0HLtrBaBAElt+
         rA4YPNqqyr3yQXCxnzX1pObReGILKwEQNgngtuvGlF9ba9IKMKmGml3OmYWmAi9wuBuN
         txxxO+qD7xIJgCvEOaQURD5vLhQ2OAPmWZeFIoc07WdHt9zMSBAPFzKCSoTwOySgF+kC
         EqUUfVB2MlvRmXu2DFcGbMExbHsESFp37DxbkicDCUv0i0aGPT6A9uZcAIyHcaIyT/PO
         fsPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:ui-outboundreport
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=GjVSThr4RD7dg8wHaAEM0iExWRet6t95weKHsaT3CSc=;
        fh=+9hnjSkTJ8G7w3IXAjDQiPAZbewfxNjxE3sIfEEYqVY=;
        b=slYag6Hu/hNp3qiTRF5TzVfCPRsGZoAQ4kqXvg3/R2H2B6Da97OTHjQ8/pTOr9qhLQ
         H48KHjL9qaBC0XSv8hjWDrLQc9GnHAXJDGfQpny8R+dRNnCE1KcWQGhvmJGJ8iVHIT8m
         h+Tl3uBZrQz42LSJvbHVH3yl2nDaOqNKDdZn/RIuwp1az+txC5BeBnCOqjk1QYvqVDmd
         xsrZ8+X9G40BH5+vK1Ba95qG1+/FuNDgAlO/I6F3TV1sqX54CzI5emaeJNvwUyvcEhlJ
         IcdYCOQnSKJaXHxGIHHdNH3zGWOi27KN8VMCi7exPEaR4algGfN7HAHpVYzwtFMBXiT/
         Rr9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=rQqa6h6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7-20020a0ce287000000b0062617a404casi346502qvl.417.2023.08.03.14.46.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 14:46:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=rQqa6h6f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmx.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRg7v-0003qZ-3R; Thu, 03 Aug 2023 17:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qRg7u-0003q1-5p; Thu, 03 Aug 2023 17:44:58 -0400
Received: from mout.gmx.net ([212.227.17.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1qRg7s-0001FL-Eo; Thu, 03 Aug 2023 17:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1691099090; x=1691703890; i=deller@gmx.de;
 bh=ac1ukUecfoycAeGhk8cQXbAiIoP0bHzwZ9wJgg2qbh8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=rQqa6h6fR8agQtCbZTYhJaqNUAAs97/yNMtO8ZX4glk2tWBETfPCkH1KzRYSwdjYLQsYFrT
 ENYxDLTh7FCJMpQHEv6ozL69SvxzehE6YaUoqyGRk7Anpvkcz25Pc9MAOgR1qPs/guEqtsqHt
 ezR7Oqh4MBgcfbbXPa7lNjUepEdZGkaEKzVewewRstr7dYH9vN7Ob9kr1pxxuXixONsynN/gw
 Bq1WlM7I3wyZL5mNEO4RxmFbrtKctBVs1QyGke1aU3eNaLka/5IqRYY+qvyJXhKHpBuh7fvFw
 ZfE3iDOulJwbDRcwYeSjyDyTc+GHzrT6zNJLpbtcOshbYxETVuNQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([94.134.147.53]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJVHU-1q7wJm2N8C-00JvMv; Thu, 03
 Aug 2023 23:44:50 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v4 0/3] linux-user: /proc/cpuinfo fix and content emulation
 for arm
Date: Thu,  3 Aug 2023 23:44:46 +0200
Message-ID: <20230803214450.647040-1-deller@gmx.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ELD64b9bp+2OjR7TbI8ZQAIsQ5gj5IqTsBLGBJKBRDFOy1hUon7
 JEwVIxUCLxevSmGOFmvthLRUxNpftj/Y0jghzaG0BUNFkj5Px0Ui01OX8uKM+9KXlIhKXpp
 ZtWdNiriu/9oL/IA/73Qk+5jiVMTz9fSSHA0Zc8wOfB8JP2ZfiswkIWBg+hSW5u2kM970Es
 Zjxrq1d4AAnaCP2E7yMSg==
UI-OutboundReport: notjunk:1;M01:P0:cjVCQ+YhPPo=;j9NYpIMgf0UwjztKtyNUQVMeah2
 YgKu+TLBqlrTiWXSVnVhu23NKRUb6aMaySpdRMnaH092h12ygvYYotdjhM1axYJfniqM8YM9M
 WzhGdXXpO63lKWO+Cow8QLUZdpiLR5jvLeS5pAEHGv3Zv48Wfega+WChx03O8EDgpzcWvnpf4
 bTwPtsJBqUyFyViNy+qwf4syCI8fwLO1bzZSrAwnAwT3ReSg3x4S/jT9kjnbh2Gc1sTKwbqnW
 BTufqcIwR8HGt0yAvsj0rG5+3Fh2LrmyBaeP/IFg9tTfxmAKl+v1Dwcrnjj+y7aPOFDl6hXxR
 J53OH/iXGHMbuGw9YGz7UtdbVIp6DpJN1W+GCRql4BrigQrKrKczGT8yg7UMQVusLv3KCOOOP
 VWjJTF+FYSPQwKnBNfNq21uJUb4BLBRM/bdEdzBbfvMprQ3nAn4Ebg2HoCZhiog77Oqt/GoGD
 JMCsKr4Xtt3l52cB40kmgL+U6Qm0hSwjVxYmAfEaOkXl69I2E1audpdyTVTgeZCBpnMkNCBr0
 B+i7y1mkgRhCzZ6OMOlATRrl1Tm0bOiSM+nTToPqwsiZLG+Edob4Sa2SGCvzSz6XFJgYc8EoG
 eY+GHkmuXeGTaaSRJUbWoBs7/tonwbRfhoopTZZY2RXm7fwpIYPOvvLzmmKVmVdCvbRuWkxvh
 5eSu6WllddwrGAo1SZsEAh3jc8TQ87e8IMn6EcFHa9J9r4sLV4rrTrOyJAHjW7e4eeBRyvYAz
 mbJawqEJIbNzQJ6yoGpX4UHLkDSpvxXNZAqVf40tzkfth2WVxN960n+LynnL6KLnAjbg5e6ZZ
 pUiTcQvUyC6Br81/+2Nxs20QGoYuX/LcyAnGtShYVX0FmXBv5sBEzbVAw4J1/mZ+suI9stO3G
 yEh/g3ZTSiLJMAwXHJvbYTP9DoB8TWXOAWV1npHXwWHSzuDXRp+sTADMduS8JcaOp6SnRsomE
 lw5PzQ==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: P2zrjEon9odP

- One fix for correctly detecting /proc/cpuinfo access
- A new /proc/cpuinfo output for arm/arm64.
- A new /proc/cpuinfo output for Alpha

Helge Deller (3):
  linux-user: Fix openat() emulation to correctly detect accesses to
    /proc
  linux-user: Emulate /proc/cpuinfo on aarch64 and arm
  linux-user: Emulate /proc/cpuinfo for Alpha

 linux-user/elfload.c | 130 +++++++++++++++++++++++++++++++++++++--
 linux-user/loader.h  |   6 +-
 linux-user/syscall.c | 141 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 269 insertions(+), 8 deletions(-)

=2D-
2.41.0

