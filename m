Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1187299ejc;
        Fri, 20 Jan 2023 07:59:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXukelIZtObC5BjWzTZrx1enZ8Ypa1lnYaQcRAZsqNxAdmmZQb3M0v/II8z4IVhRxv22kpwU
X-Received: by 2002:ac8:60c9:0:b0:3a8:15d2:6e8f with SMTP id i9-20020ac860c9000000b003a815d26e8fmr21342765qtm.44.1674230396974;
        Fri, 20 Jan 2023 07:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230396; cv=none;
        d=google.com; s=arc-20160816;
        b=VwduYVoZMtrrXPQgc927Z5PK9GJkwIVrL1q7gYpshKT2yvuJYoLtSarmqUtfQbt0jU
         xAyMCBMmVc2H+1VagL0Ef3vJvmqtDZDLXvowdw5Hxlbp2ThgbVSDpeHIP9MyKW2CS0bk
         JoFWGUhBQAXrdwoI0FPHCmxYPURtmuXr3z2Ws1CRhksBMIK46Bln6OXB7/FFNqf2fDB1
         xCjG96YRCGwjyI9l4C1vsvIs3MyK8zusc9D9rOitno+XCocHZz3z7t8Szsmw+9OD+LOl
         kOOHg5O0UhJJKM5vay5LaL5/CBJJ1fTe55EuvsZKD8ZqLfJ341+OqkvewbyDDcMZSnF/
         HGuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=1SYd02ysTymy00KMv8nS+1COA78uasffvtd0JBKbW1w=;
        b=QOjTNCahaJjsMaD59F+o6NSyZj1GuIdXmchunUEZadrSvbIhoHHDBBf62KtEpuLq1p
         y4GGN6J5UdWC5JqHdAnob3XpCKJWfzgxSXd9D9Q4bFLE7Pkc/e2pAWDPpKi5yyEWVOZq
         gn2Jpaf2cTcIGjZOkOeMKzh+yeJva+MmTBxHrHLP3gFNGJW30McSJmN1raGv06dQCqVV
         /3sEvYSvbDYEtWUlz1gNnkzyb9frZwt5clXG+OUnamclnx5lHwg8wjK/pfDTvx7aNh6m
         yJpptWpv6HMIbywRSlj2WoLx284O7nQwPzCibpluI3CMu/DN36oEsva/Kbf7gchwNA4j
         qIqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=fGuNwoQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv26-20020a05622a4a1a00b003ac6453b0bcsi8466417qtb.187.2023.01.20.07.59.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 07:59:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=fGuNwoQ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pItnp-0000fR-0J; Fri, 20 Jan 2023 10:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnn-0000eZ-8i; Fri, 20 Jan 2023 10:59:39 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItnl-00073Y-Ot; Fri, 20 Jan 2023 10:59:38 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id C1D8620E1A43;
 Fri, 20 Jan 2023 07:59:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C1D8620E1A43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230375;
 bh=1SYd02ysTymy00KMv8nS+1COA78uasffvtd0JBKbW1w=;
 h=From:To:Cc:Subject:Date:From;
 b=fGuNwoQ+kCyB4uDTn2QgSPz6B1NzBMCau87c3jgxDpOWWeYTC9z6fzTgBh97jUGhQ
 m98baWbSXl2NTwpNakfNnomJ3o4xSN9lTREkYZw5217Jq5xMB7zusp9b2NweeS3/Hg
 3Y66ty6i4PPm9WVcthy+5El1oBDYm70Mk2LG2gyM=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PATCH v3 0/2] various aarch64 fixes for running Hyper-V on TCG
Date: Fri, 20 Jan 2023 16:59:27 +0100
Message-Id: <20230120155929.32384-1-eiakovlev@linux.microsoft.com>
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
X-TUID: +aWlybxwTgA8

Small series of changes to aarch64 emulation to better support running
Hyper-V as a TCG guest wtih EL3 firmware.

v3:
* Replaced raw_write fn with raw_write instead of a manual function

v2:
* DBGCLAIM now implements a (trivial) raw_write handler
* Added comments around ignored external debug registers
* Patch 3 is dropped because it was manually picked into target-arm.next

Evgeny Iakovlev (2):
  target/arm: implement DBGCLAIM registers
  target/arm: provide stubs for more external debug registers

 target/arm/cpu.h          |  1 +
 target/arm/debug_helper.c | 54 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

-- 
2.34.1

