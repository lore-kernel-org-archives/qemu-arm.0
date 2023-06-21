Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp762189ejt;
        Wed, 21 Jun 2023 03:40:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jmo7Z6asd87y3/X53xQqpSX5kaRhxayUCCQwpLtwJhV9e9M/LhWdu+X0Up10D2hdffA68
X-Received: by 2002:a05:6214:626:b0:632:c2e:5795 with SMTP id a6-20020a056214062600b006320c2e5795mr2520350qvx.32.1687344050972;
        Wed, 21 Jun 2023 03:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687344050; cv=none;
        d=google.com; s=arc-20160816;
        b=ex6fJj9gfbaE9pYdobDlmbxC+vcK2SJxFRwd7JXdBGI5KMcrnBPxConfebx93tkF+/
         MkJvbqIKJj3MSNL6W4ZZDoA2KuePi4zocFCB//B/gct9R/QqU5rUO8+KQ3eYL+u+bCwD
         OGfJh3Rf9rD4gtNRMzWUlfbSQrLQuiF2Wc+YovpID1ah2gDKR8tIqQn2Kb9JEOUADivA
         UmyT166wjviDBwQ1TpFUtOuWJBonag59cKZ8XLhMEfJoPQjL6NvzrpfKC8RUIQVT02r6
         rL5rAvhZLiCxo8/ns4kfQ+OGlxmmvh4eyqcxfuuf/4+jGbjuMP1tp6y+Mw6vAaqq3edv
         AYfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=rWhKVot3fJy207J5kZ8UAHoQMaxCDJAlR8umbxmaVhw=;
        b=UAhRaIpE9+zTDMjanZvJ7yvg843xz5HU4c0PVVgWArjQAsPFGgSvsTXGseS7MHQylY
         pIkyLxCuj7+vR6NTqbtfGANi0MbOFvS38seJYQ0Wnc76OFvnoLfqSs+k5LaTaCNhtSvp
         DtEYLIMtohGf6Pwo59sPUzCeELygvH/NS6n9iUKzLURLtmx8ay1xH9nenms6hjcKXX4h
         dz2zS+b9cnynZhbRQRPZDJL+UXjBihZytELQSQ4ZfdlHcxWLqV8kzSS69xCa56nCiJ79
         tZyQu0c/ewU0O5wNL8iju4eH2o+wUU5rvKstx2M5OO1iyblYHEYfG6vF1wf+7sFdBesH
         9fhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js9-20020a0562142aa900b0056ecf7ea3e0si1646343qvb.508.2023.06.21.03.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Jun 2023 03:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBvFu-0000rL-JU; Wed, 21 Jun 2023 06:40:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qBvFr-0000pn-S7; Wed, 21 Jun 2023 06:40:03 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qBvFo-0001mm-QQ; Wed, 21 Jun 2023 06:40:03 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCHvkSP1JJkDPZsAA--.2828S2;
 Wed, 21 Jun 2023 18:44:31 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwDHQrJj05JkPXYAAA--.3909S3;
 Wed, 21 Jun 2023 18:39:32 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Cc: marcin.juszkiewicz@linaro.org, quic_llindhol@quicinc.com,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v5 0/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Date: Wed, 21 Jun 2023 18:38:46 +0800
Message-Id: <20230621103847.447508-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwDHQrJj05JkPXYAAA--.3909S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQARAWSR+kED4QAAs9
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6+GVi0gpekr5

Please review the change.
 - sbsa-ref: Replace EHCI with XHCI on sysbus.

This work bumps the platform version directly to 0.3 because 
the addition of ITS will take sbsa-ref to 0.2 version.

Yuquan Wang (1):
  hw/arm/sbsa-ref: use XHCI to replace EHCI

 docs/system/arm/sbsa.rst |  2 +-
 hw/arm/Kconfig           |  2 +-
 hw/arm/sbsa-ref.c        | 23 +++++++++++++----------
 3 files changed, 15 insertions(+), 12 deletions(-)

-- 
2.34.1

