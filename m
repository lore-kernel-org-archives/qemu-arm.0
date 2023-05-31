Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2736805ejb;
        Wed, 31 May 2023 03:00:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RgPRXIDgr6/KNZJ2qFeqF5qMfEFqtFmonE5tsLatlYhmHn+nCh0UylFBnRZvtpcx4xGcc
X-Received: by 2002:a05:622a:15d1:b0:3f4:ee64:e30c with SMTP id d17-20020a05622a15d100b003f4ee64e30cmr5196383qty.52.1685527217142;
        Wed, 31 May 2023 03:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685527217; cv=none;
        d=google.com; s=arc-20160816;
        b=epVHGEG762Aqh1rPUrP8roIUCo7XCotX4g18iwsQQBOC5PoKol7AQtHm+6XDjW1QF5
         r5HlAWJxsLqcYbSi0aOI89Oli3nW6pEyW12GM98xXNgNAkUP/a7x/9U0toTJCWtMZrnR
         7lApDodUcMK+REIXCxlOYxGwCA6ysgQY43jtsmCHxP14LY024j48UZMq15DM3dH3WYzJ
         z1WSDJoFDfy7LG9tC0hS40SP4tI8WyiX7Sj7MdhHOOkus6xpooyFJm2ZrYiwLn4h5doR
         y/xplFsoBQIIR9wVmmaRdccY6ZMgcDmRRt7GB9dRpAq+eh4FwG8/2TAm7b1ryZd0yqdl
         d88g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=fjIOM5Y42QSTijLxgjrRzhxa5nTruwxdEgJFaQEt/W4=;
        b=IoZ7XS8btebLOnTVMYVGGEz1VaRfadmtqMlQXvnEgCAGq6ZPNzI+ryMmoZM5Y3M97M
         94rdp05Pvau3o5e3FjsgXY+OuwhBpqQcWskmLsUymFbAkBp5/1dIaJvoHmzNQ4ovnqh0
         D34sXGxbK72Ebzb8hnJWkQo4d7SEMNN5k1/CbVBLH6ptYY0C/wH2yxFOllF1vB6GzN1Y
         TcEjan46zkoqW1n99cf8k71fQqfXV5+WPJTa/gulnIa6nW64cQOoB/wHjK8BiaJ7uEVZ
         hVCKpVU88/uogtcvtFoLs/BLWVFNLP733TzadYoVeSfjQq4MObTAG8D9lFzlFwWUzjzc
         mPGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020a05622a130a00b003f69ae2f637si7946094qtk.364.2023.05.31.03.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 03:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Ice-00027F-BN; Wed, 31 May 2023 06:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4Icc-000270-V1; Wed, 31 May 2023 06:00:03 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4Ica-0005Ab-CU; Wed, 31 May 2023 06:00:02 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXX9WTG3dkOSckAQ--.44620S2;
 Wed, 31 May 2023 18:04:03 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwB3xi+YGndkrncAAA--.2360S3;
 Wed, 31 May 2023 17:59:53 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v1 0/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Date: Wed, 31 May 2023 17:58:44 +0800
Message-Id: <20230531095845.365019-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwB3xi+YGndkrncAAA--.2360S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAQAWR2SqoDFgATsk
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: O6yv7dLw+8YT

Please review the change.
 - Replace EHCI with XHCI on sbsa-ref board.
v1 patchset has fixed my commit rebase problem in the last version.

Yuquan Wang (1):
  hw/arm/sbsa-ref: use XHCI to replace EHCI

 hw/arm/sbsa-ref.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

