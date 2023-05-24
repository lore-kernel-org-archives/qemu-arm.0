Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2480031ejb;
        Wed, 24 May 2023 04:34:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zrgCkCdsWl3qj1rrP/4IUbyut2WuKuu8BR8aoaDwFjluL6la/bjkCqgbbtSMOfG543/JW
X-Received: by 2002:a05:6214:2462:b0:572:636d:626a with SMTP id im2-20020a056214246200b00572636d626amr22850670qvb.25.1684928072733;
        Wed, 24 May 2023 04:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684928072; cv=none;
        d=google.com; s=arc-20160816;
        b=h2VIR/70Q44oz3BKDWOVODQE+a8EivpLe5zU5nEw31RH9vXJhafD27ycFgyhQX63F3
         1mvCyslestb1oJZfEytbT5uExX7MJkPQ3Kk5a/nc0lNRzgRwZML8RJtulCa7zcEWtHk6
         5fag7jimufl7XkjbVxf87GjpV0lLxQ6VmqM8MB7vfatwqwGgNo1KoZo4wkNQiz6GQQMI
         PoUI9dBywK+ii5J15Ug6+yySMkyiEieVrbiKfHHB5b8M7nvfKAYboTYej/MGNFFNWwph
         PJqMPLYRbFoqg+JqGxSIMIDHxwsOE3YJJmsqzgPE+ktqBiQ+zENLnyajZzoGKaNcqdBv
         TZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=vJb/kDKE7EyeaourXGB8U4mXwEThyikglC0lRwakfZU=;
        b=eOfMHXEjjPZppYohcwaPvkeYPQVnRR7RFw9Yh24oZ+ph8RhD0Q1CZkFuqbcENilqrE
         RPF1vrw9yWr/1afCxhLgK4BBwGXGy26/nbbEWKiPvD8A2RCBKKhZKGjDh5woFh+9UIsl
         QZdiM8lhvna1ljNzXjPGhN8l5O2S5qSZQmTiVHbScICcoSKtTmRS+770EuD2mOgdjxy2
         rPC/QFjHdM2S/SbKhE8fX0940sNkTd51aMBfprlr4IPzjPrjCGXelfKPrk20UlykSjGO
         C54h0mMvxNZO61Gyfbed4pxCdkLU4st5xQ2bTFav5pnjlydC/D/a6kUmhfKm2FZfYeBc
         ZLJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu15-20020a056214234f00b006239147634fsi6535554qvb.64.2023.05.24.04.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1mk7-0005qv-UP; Wed, 24 May 2023 07:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk6-0005pW-82; Wed, 24 May 2023 07:33:22 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk4-0002Vt-EW; Wed, 24 May 2023 07:33:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id C9D1A260BBC;
 Wed, 24 May 2023 13:33:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fI3EfU3EmzRq; Wed, 24 May 2023 13:33:15 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 8D5FD260249;
 Wed, 24 May 2023 13:33:14 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 0/4] hw/arm/sbsa-ref: platform version 0.1
Date: Wed, 24 May 2023 13:33:05 +0200
Message-Id: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: 2EMO0tPRnT+i

About year ago support for setting platform version for sbsa-ref was
added with "0.0" value.

This patchset bumps it to "0.1" as we export basic GIC information via
DeviceTree to the firmware. TF-A will then take it and provide to EDK2
via Secure Monitor Call (instead of using hardcoded values).

Basic documentation about platform changes added.

Marcin Juszkiewicz (3):
  hw/arm/sbsa-ref: add GIC node into DT
  docs: sbsa: correct graphics card name
  docs: sbsa: document platform version changes


-- 
2.40.1

