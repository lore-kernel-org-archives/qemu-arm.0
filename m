Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1184718ejc;
        Fri, 20 Jan 2023 07:55:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsViPl18d13RO3BH4DEh0ovOl94h6VLae6IL6cEoThhow0N7Xr9kcy2HcH7z37gALSSAZiR
X-Received: by 2002:a05:622a:a09:b0:3b6:309e:dfdb with SMTP id bv9-20020a05622a0a0900b003b6309edfdbmr22897515qtb.22.1674230137161;
        Fri, 20 Jan 2023 07:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230137; cv=none;
        d=google.com; s=arc-20160816;
        b=DewU5oCOj9p1ajWazQzjXIlSnWZreC4bjwY3QKBwu79MGp+eD3tKSmrY+EezG7QlTK
         1bCqkSsnWU5ZMCCwQVxDzlY7y1GlxPAKy+Vxa8zjwiKLhtIXdaFEfFZ5iksrTnoYZU05
         aJbCR7oKM3QePjncElS4165I+midbzXi3w7bCf6nfUgAjdMw7NMCr9vRu+m7r5WhWAr1
         xkBWHyTyIuQIJsUY9dvllQvWeFwPyLkRr2zz+yPxcuc2eq/uuvYU1qgaa7mRniQGaRA6
         BwB8Lai1mCUt2h9WwwxcYhTNZN6AI8N6rVY1Y27RriKthoWxECSK8qjkwmf9b4vEKU4/
         mbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=bvwAfIJtjFwHtptnPrI0NHq3acGMoMn68aFxVXRTeMI=;
        b=F0W0I0G23MkpAYpgxo2/I9T7LN69d0JIWinMG4sjrRqyEYghXQu7W8fwYRGjuwVDr7
         BV6ipBltyW1u0kUGjYK68Vc+k/64fdpXbnKhs0ls22twwPpdBVNzhJUh5uLzkGRK3dpn
         NtkKcNUfJqBNTOhItNZdKdaP1wcYTcnBIEKtvLRg5Y3wJOn8ravW2Jg72zeEIuHMjTyY
         xyFq7kvVrWz0ocP0xd2f59kx9eCMKs6Qq+zZ5iwIti0vbbHhCfasCSASUbTZUp0mHIjM
         29v+YyhrU+T9vxqx4f+hhJti98PFCkAVOUSNlomrNbGeqsmHmJe6i48mbLrixXu91PoY
         M+/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=F5L2Futf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05622a198600b003b698c748casi1706966qtc.245.2023.01.20.07.55.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 07:55:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=F5L2Futf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pItjG-0004YW-C0; Fri, 20 Jan 2023 10:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjE-0004XO-6o; Fri, 20 Jan 2023 10:54:56 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjC-000689-GO; Fri, 20 Jan 2023 10:54:55 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1645320E1A45;
 Fri, 20 Jan 2023 07:54:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1645320E1A45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230092;
 bh=bvwAfIJtjFwHtptnPrI0NHq3acGMoMn68aFxVXRTeMI=;
 h=From:To:Cc:Subject:Date:From;
 b=F5L2FutfBpFyrC6K9dN09Fj/cRDMEEvh0KrxQDYPl/0+sLEcvvFVNXcdLi54yU/pE
 Y9bZmUzeIVKfM8Yh7JUXXdZFVDJmmn5n2ygPBDKGdwHwz5jFV88+KLA9gW4MZrzXCG
 RU7+bQIHrJWk2uBaiz43Mlzy2TWFsK//kcfTQQW4=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 0/5] Series of fixes for PL011 char device
Date: Fri, 20 Jan 2023 16:54:42 +0100
Message-Id: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: C/amda1o7LOq

v3:
* Introduced a post_load hook for PL011State migration for
  backwards-compatibility due to some input state fragility.
* No longer touching irq lines in reset method
* Minor changes based on review feedback.

v2:
* Moved FIFO depth refactoring part of FIFO flags change into its own
  commit.
* Added a reset method for PL011

Evgeny Iakovlev (5):
  hw/char/pl011: refactor FIFO depth handling code
  hw/char/pl011: add post_load hook for backwards-compatibility
  hw/char/pl011: implement a reset method
  hw/char/pl011: better handling of FIFO flags on LCR reset
  hw/char/pl011: check if UART is enabled before RX or TX operation

 hw/char/pl011.c         | 110 +++++++++++++++++++++++++++++++++-------
 include/hw/char/pl011.h |   5 +-
 2 files changed, 95 insertions(+), 20 deletions(-)

-- 
2.34.1

