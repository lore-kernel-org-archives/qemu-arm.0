Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2665544ejb;
        Wed, 31 May 2023 00:04:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fEAvDl7vAv0268qxISb+aeZoodN/u5jhgF8sX1oFZ+xi59GwyMJwRPSe7/LpI8i3oZS8E
X-Received: by 2002:a05:6214:c24:b0:625:aa1a:937f with SMTP id a4-20020a0562140c2400b00625aa1a937fmr6398371qvd.59.1685516673797;
        Wed, 31 May 2023 00:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685516673; cv=none;
        d=google.com; s=arc-20160816;
        b=EHWs66j6rKDI4TF27ZsK8f86DG+704cM8JsBho6zO2uTzGslUKmslD3nfB//n7mUlU
         pJEtGG1tipb27awO9WGAjCp+0wICc+iNYydhP6YROoUZnc5i43X40dr8uWcNtV//0pdA
         A8rfVw3fo62Pzi3Bp8oorCV52pcfDaITLS+cpVtUGgGXY7OGbyrr2RLi3VPq7dvzLNbH
         b4Vf7+A0EibcMdWyFoVJYBQ3wxrVwugwYryElN9O+8TUOEXnPnJE+8c9yLYHIIDrpR2s
         Fyoy38Lziz97FLfkycyw/h6oABFuF8I+zGLgHB5+l9FG6KTc6zD+nDo6OXdhyqVx3eLB
         GKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=VQHSCxznbyqMyX+e4O8FxYFcTnt+EnynUrHBpKjzt7g=;
        b=LDKiUlclDYc4pbrewJC8eUTPZvuXblqWNvuQxn5STuMUqR5D2m5JhlBIRuEElvr7+3
         GwbqB516Uw3/PH+NuJ0mQfxtQ6L8VHp8bXb8xlX2zqLuqrYCf2np1e2rZ3l7OyngRLjO
         Sj6H0ptvXHqYWPMDl/HtPPGbi2uVL0ZYwRm0M9k6SZ5Dkbo/oScRo8LGqrmiMewmYola
         g1jFXt1yn65H3HmySszp+hA5UFdZC9X2XqFU5QLOglPdaLPUfoPjRmrPH+cSylXuBleX
         XnZv1cImLmPXI9QbCJrJOqsKL+Pugr9vC5L4e87yO52ZF+bsjD0hDWeAu5N6jqGZmhC/
         54pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn48-20020a05620a2af000b00747a2434dbesi7544438qkb.778.2023.05.31.00.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 00:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4Fsg-00087v-Hr; Wed, 31 May 2023 03:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4Fs3-0007zY-Iz; Wed, 31 May 2023 03:03:47 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4Fs1-0000Pz-6b; Wed, 31 May 2023 03:03:47 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwAHztM_8nZkJ7ogAQ--.43761S2;
 Wed, 31 May 2023 15:07:43 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBXpi9F8XZkQlEAAA--.1437S3;
 Wed, 31 May 2023 15:03:33 +0800 (CST)
From: wangyuquan1236@phytium.com.cn
To: peter.maydell@linaro.org,
	quic_llindhol@quicinc.com
Cc: chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH 0/1] hw/arm/sbsa-ref: use XHCI to replace EHCI
Date: Wed, 31 May 2023 15:02:28 +0800
Message-Id: <20230531070229.334124-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBXpi9F8XZkQlEAAA--.1437S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAPAWR0+SgIzAAQsa
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
X-TUID: hOgPpNtcewk6

From: Yuquan Wang <wangyuquan1236@phytium.com.cn>

Please review the change.
 - Replace EHCI with XHCI on sbsa-ref board.

Yuquan Wang (1):
  hw/arm/sbsa-ref: use XHCI to replace EHCI

 hw/arm/sbsa-ref.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1

