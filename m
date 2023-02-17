Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp1109298ejb;
        Thu, 16 Feb 2023 19:43:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/G7Z4WR3t+5xUAzn3R3lyYh42FP0DF89GF/cg2AY2o/rL+XW9OXTyTsUXXKgZfbxddB5nz
X-Received: by 2002:ac8:7d8a:0:b0:3b8:6b41:104f with SMTP id c10-20020ac87d8a000000b003b86b41104fmr13748127qtd.40.1676605437414;
        Thu, 16 Feb 2023 19:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676605437; cv=none;
        d=google.com; s=arc-20160816;
        b=weADklnWF4GLTCUNGmlJMigfq/fjxe91OhT2DOzB2t2WEFsju6Nvxo6brmp9fnoYFU
         IAY3crAzBTihNimJQHbYpCz5QQIwu3B8bELIM9XX865mvktGbaCKCwxJlVAId5wk1GFh
         CfkEajd7mhfZFn9Q3ltSmn+JJgZmFr2ay3GQlNC5HL4ziAzw7+3s66xw20JX/NWtYhXt
         puY5g21kxrp/4BkQt6gQckvFvHnHlflYS//17u8PLzLO1sbeHsDG623uZHlQllxmBEPj
         JHHUVZX5Ye6026bOEIp01k1dC8TwuLcYK73+OxUOthK446CvncV/nmTQIYxdy4keKKeK
         eIGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:cc:to:message-id:mime-version:subject
         :date:from;
        bh=El+hPVoiE1YkRbeFLB/Htt0ZplfkpvZlRjRith1WcjM=;
        b=GQmhQJV/nUCnAQ4eUXCazGn0p5b729nhpUPUIHpF2vgKFnZNOf57mrBfusXoUdMQuA
         iio5Cjr8nZL3sFocC+najYetVyg/4UBNJntEEJs+0bqdCsnTd7X5kvIzm+8ejMhRyy6M
         p9ASaxiwQEPnTuGtQg2iwI9aFc3q0LSZgRPLbpVfFopSoa6KU1r8oUtjy1iKTWw9ykZ8
         UE8J+3mtb+506RwrUIYZg/ygUQzrcEyvOscZ7K1/lR36ZBE9Fu6m2WGR75NDa8CklTDh
         0W01+Q8S0A14GSpBwEiFOOdUIC1pfHZpHXGcVSf+SGqlHssSL/CBSI0frWPFErfas0CK
         /hJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020ac85852000000b003a81d7834cbsi2735073qth.430.2023.02.16.19.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 19:43:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSreY-0005Yc-FL; Thu, 16 Feb 2023 22:43:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSreW-0005Xj-Af; Thu, 16 Feb 2023 22:43:16 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1pSreU-0007Al-QV; Thu, 16 Feb 2023 22:43:16 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id E4B1411EF68;
 Fri, 17 Feb 2023 03:43:12 +0000 (UTC)
From: ~ssinprem <ssinprem@git.sr.ht>
Date: Fri, 17 Feb 2023 03:43:12 +0000
Subject: [PATCH qemu v3 0/2] hw/at24c support eeprom size less than equal 256
 byte
MIME-Version: 1.0
Message-ID: <167660539263.10409.9736070122710923479-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: qemu-stable@nongnu.org, ssinprem@celestica.com, ssumet@celestica.com,
 srikanth@celestica.com, kgengan@celestica.com, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: ~ssinprem <ssinprem@celestica.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EDaLAmQ4+/Lz

- hw/at24c : modify at24c to support 1 byte address mode
- aspeed/fuji : correct the eeprom size

Sittisak Sinprem (2):
  hw/at24c : modify at24c to support 1 byte address mode
  aspeed/fuji : correct the eeprom size

 hw/arm/aspeed.c         | 36 ++++++++++++++++++++----------------
 hw/nvram/eeprom_at24c.c | 28 +++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 19 deletions(-)

-- 
2.34.6
