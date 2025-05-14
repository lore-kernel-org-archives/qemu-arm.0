Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1044469njb;
        Wed, 14 May 2025 02:05:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVG5nAOOprjwrH+5knxedCwPkOnwDVzYlFdc58KMqc2+MXflgL4oNhM8HqSsx7UPgGRisI80QoQxarvBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGAbaq5i+qjHly3GXauasaSpWWqsJh7xnbwD3/lJmWyKkg7KwTnHsXdS33Qy3rC9v0c3ncU
X-Received: by 2002:a05:622a:5408:b0:476:8cef:4f0e with SMTP id d75a77b69052e-49495ca7da9mr36186341cf.29.1747213509938;
        Wed, 14 May 2025 02:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747213509; cv=none;
        d=google.com; s=arc-20240605;
        b=gzyRVXc77+AdF8GH6Ahnld7vWnTt7K102JPscaiPBPYaqMy7Dg8VQ8ln3ShvHk0mzq
         inVi3M9/NtcVkHaBhpQHk0WRZf9sIppZ/j0KIAHzLUCM1W2fEjs5LHzaB6rEY+gZ4uVA
         ZWrBKNu4p5LyCfTOwrgmOE21wMwvooCh+Pf96RAPHU7/6falJRHxh1vTpANGllv8wGsV
         XdBcEkXVEFhR6YPaueNAAgzx8My0CwJWnoavcwluwdFk80dXUy+SOLHc7d6YDDWKx18k
         qY87Y0HZM2oSH797spIKSjNvlw9JNP4e3ZcF7/AsqoJQJTkKzgEKqZ00kkKGaCizqts7
         AIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=q7NbjEfy0yYqkS0rDeZVwLYUAn988sWb9WCNMji73As=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=fTmkSM43THNmMSmFOzkgyfEqk39zQQ363Z8kz3CxgCFgCS/UnFXqOjpxYTD2oU4KTP
         FEt1FsMwzebq+4epCwuiv3/Dm2tPuW9f95MO1eYmw3utYb96687zZoi6uFoRRDxAZgjP
         AIHly5jbptB6CJrdPbtU0V3lXJHctf1m2VAuc9OuR/V0x84wOYS1AtW3rEmgXopTvgyk
         pQFfELkQO3FYQD/t+GVUj/kto/UoFSUhVjpmtItTWWrIPMyhzYkpnAmx1tRbWJkir+jR
         bWERvTa8/BNchIXGRyiF+zmBVnQ/1Dux3pB/1KDobMp2mfw53Dw0AVTNUKRL1hVfvq6H
         MkUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452458acasi129812211cf.108.2025.05.14.02.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 02:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uF826-0006di-Lj; Wed, 14 May 2025 05:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF823-0006XC-3x; Wed, 14 May 2025 05:04:07 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uF820-0002Ei-Sk; Wed, 14 May 2025 05:04:06 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 14 May
 2025 17:03:54 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 14 May 2025 17:03:54 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v2 0/5] hw/arm/aspeed_ast2700-fc: Fix null pointer dereference
Date: Wed, 14 May 2025 17:03:48 +0800
Message-ID: <20250514090354.1461717-1-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7PKBSDGWc98t

Clang's sanitizer reports a runtime error when booting with
'-net nic -net user', due to a null pointer being passed
to memory_region_find(), which subsequently triggers a crash in
flatview_lookup().

Root cause:
- Missing NIC configuration in the CA35 initialization.

Fix:
- Reduce ca35 ram size from 2GiB to 1GiB to align with ast2700a1-evb,
  where the ram-container is defined as 1GiB in its class.
- Add nic configuration in ast2700fc's ca35 init function.


v2:
- Split the CA35 memory mapping into a separate patch.
- Added a new patch to fix BMC memory mapping in the fby35 machine,
  which had a similar issue (unmapped system_memory).
- Removed Change-Id tag from commit messages

Steven Lee (5):
  hw/arm/aspeed_ast2700-fc: Fix null pointer dereference in ca35 init
  hw/arm/aspeed_ast27x0: Fix unimplemented region overlap with vbootrom
  hw/arm/aspeed_ast27x0-fc: Map ca35 memory into system memory
  hw/arm/fby35: Map BMC memory into system memory
  docs: Remove ast2700fc from Aspeed family boards

 docs/system/arm/aspeed.rst |  2 +-
 hw/arm/aspeed_ast27x0-fc.c | 16 ++++++++++++++--
 hw/arm/aspeed_ast27x0.c    |  4 ++--
 hw/arm/fby35.c             |  1 +
 4 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.43.0

