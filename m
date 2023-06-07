Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3882480ejb;
        Tue, 6 Jun 2023 19:35:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7swemBDDdzihVSOtAUgcqw9YxG6FPsDlz3D90ykUSqaMa2TA8Q3oQoopvuZ0bJzYfgCYVM
X-Received: by 2002:ac8:4e44:0:b0:3f8:4905:953e with SMTP id e4-20020ac84e44000000b003f84905953emr1764958qtw.52.1686105302707;
        Tue, 06 Jun 2023 19:35:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686105302; cv=none;
        d=google.com; s=arc-20160816;
        b=tnOFHKxeCiZ4iPWnWmh6Rd6gxX/ixz8+DFUrN6YxxNEDFCFDSEAnnPhMlcDXLLIpF7
         ScdXBQwBRI7ec+nJ15rtVAEiPRIq5J38y3e4WggKAfaEYwleiLXNBEMdsJEhPv+E9Ydc
         0aN1rrVhpxeb6Abtt3GRuN4aJPcQEpA3YUvXpIPjkYMwIo8v8oquB6fanHCKTMU7TX8k
         Z3KtbltGrZWpy5RoajF/0MCPRz01oNjQtr0bfyo4fBS+u5JKhhc+QCwvJsSwvL9mTVPY
         /5IKSZqVYWQUUczSStq4CM4S4nMNJ5I7eo7tLZ0JVObTsbvKrvp/PYXdpFoyAea1RC56
         zv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=XDizkiuYwIBBnwuqOd0af+o/S5AXFDPp/hlu2V5+mlU=;
        b=oq+KgBux9IaJj/D03hdhjszjRlygBEHnuspzxKwxmY1FP4Gh96tEMRRhzm0frfWOXx
         N106+efeKQITSh1ojQqC66HWc5NdI7WCIDDqvqogRxSAtiKKE8WMvRxK5HbY7XTjc0oS
         TgXkjjmuuD7Ur56cRCS64CiEYOzb8Ex3G+URliVtaoYcK2llJsjWMGq+6u9fL4OVajm4
         dJ5P7Pur9VpgXaThSh9h8ZKQj+M7k4OszANc/sGYPcyfuJ9tbWGY2cNP1loFlKircMjg
         kJnuT0t2diEv4GZXhX87u88OoJAc1B2U5mk1d16fq+p/4lWMeJ2OxQEPtgEEPG10Lo92
         y8lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s22-20020a05622a019600b003e4eaec2617si5543625qtw.792.2023.06.06.19.35.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 19:35:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6j04-0006AU-8j; Tue, 06 Jun 2023 22:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6j00-00068v-Ji; Tue, 06 Jun 2023 22:34:12 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q6izz-0007Vo-5C; Tue, 06 Jun 2023 22:34:12 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwC3nJc37H9kaaeEAg--.623S2;
 Wed, 07 Jun 2023 10:32:24 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBXhEyF7H9k9zkAAA--.329S3;
 Wed, 07 Jun 2023 10:33:41 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Cc: marcin.juszkiewicz@linaro.org, quic_llindhol@quicinc.com,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v4 0/1] use XHCI to replace EHCI
Date: Wed,  7 Jun 2023 10:33:13 +0800
Message-Id: <20230607023314.192439-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBXhEyF7H9k9zkAAA--.329S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQABAWR84icFoAASsr
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
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
X-TUID: V82YEAhOVCgy

Please review the change.
 - sbsa-ref: Replace EHCI with XHCI on sysbus.
This version updates relevant Kconfig and sbsa.rst file.

Yuquan Wang (1):
  hw/arm/sbsa-ref: use XHCI to replace EHCI

 docs/system/arm/sbsa.rst |  2 +-
 hw/arm/Kconfig           |  2 +-
 hw/arm/sbsa-ref.c        | 21 ++++++++++++---------
 3 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.34.1

