Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp724280ejm;
        Sat, 15 Apr 2023 06:07:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350bUoqwLv9uvSrr44Zu25/RaVsrbKPC4+azuKZ3+t/ZTgz3ZZjXG0H77gwVxcFKh5upy+k5v
X-Received: by 2002:a05:622a:15c5:b0:3eb:ac93:f857 with SMTP id d5-20020a05622a15c500b003ebac93f857mr6379482qty.58.1681564031599;
        Sat, 15 Apr 2023 06:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681564031; cv=none;
        d=google.com; s=arc-20160816;
        b=F5awbZhPh0udFnLQCGjlQDlfKcHje0Si7dBod9IbsxOwFqrdLy3gtjtqbB5KGJtx0C
         TLyaWSb4wm6w2H0f3L6uvKSM9eZeT4lLk+afw0HzfIkgcMYrRzQWENDHSGW+y7qAPW5t
         7/LPIq6q5NO3bP4RdIE8Bddd1UM3lBmWJburXkIq6KqAtHE1JX4yl28xnvFfIv9OMmCa
         n0G/L24YxmfnshqgBwuIFGgBlqZs1c4AFo0SIdZvlp26xbbByqGvohISoO68QyT0ebvn
         9adtwMAHjAPubxXNIP8ixSToDkzn4CCJUQ1DTLvrQqDw+dkDPkKKVwLT8im0ii6G1g78
         prQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=g1HqqdsU8QGo+uHG2HueOCnsD690FsxOJF7ks09llGo=;
        b=Oa71/JDorWWgDt0lGxEe3l9GGOyM1AI/t2C1TlbAsLeEmust1vjIjB20wFbyvAM2HX
         0OEtIb6oX3VbWHBs42Hago1BjnMbQWLGbcva6XSl3q5ouGhtCoJyFKPbjLv9x5uIKHLx
         JIhV/lhE4FJXQKqsdeKBt/U2OAH+b8x5MUh1i4hi1dUUS+vcY9EycJWDMc9p7LKzmrGv
         Lcmz1cFHlbqzKNUB/0cmpcNcojOxbUJME7FHrEC7BmzWTzbn7Bqh3flOlcCHsbhL4nia
         tgDvVtSINSpoWJ/hpGf5+EDNnBv9eDtSKtGhEoJDwPiheDu3CZxJbJjVA7rgOE3yJvDy
         jk8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=X6Ng6Xyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18-20020a05620a29d200b0074a0dd62f45si3878525qkp.757.2023.04.15.06.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Apr 2023 06:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=X6Ng6Xyf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pnfcN-0004ka-6i; Sat, 15 Apr 2023 09:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbZe-0006gZ-Aa; Sat, 15 Apr 2023 04:47:58 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jszhang@kernel.org>)
 id 1pnbZZ-000304-Q7; Sat, 15 Apr 2023 04:47:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BB3260A05;
 Sat, 15 Apr 2023 08:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A22C433D2;
 Sat, 15 Apr 2023 08:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681548471;
 bh=eWQIR4pDjW5W0LBVxz11mFgQNASZOEMMkzX3EPueH38=;
 h=From:To:Cc:Subject:Date:From;
 b=X6Ng6Xyfxe9z+3CVY16jXKvJeu1oqMz6l/KjkZURnk0oiet3hTVc2aiwcbKqCNgJ+
 kGpqh74URHXFIGW5ZRO1ZXvdFE3GHhOuVMhpAo5n5IiD4kIAKoPREzJovPFQOOpAZF
 Fj3mPqwGA1W9mYHYH3+tdESKjSajMGsTBkb77PvpyBKj54REYWA2bFzGlXHlzTH9mh
 e0qJsxLRV4gLim88iryCi3uU7hsy7Dy1l3B1TXF1RF2614B1JUAQz+PxHDzibFKwAe
 6uLk3YdGC8kesse/K21h7BCEZJvVfW9Hn39L/THqXj6b0KFMEwLbClUTRRk0Zwmq69
 +OpZEvtPO/N7A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] Remove CBAR from A55/A76 and add A78
Date: Sat, 15 Apr 2023 16:36:55 +0800
Message-Id: <20230415083657.2308-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=jszhang@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 15 Apr 2023 09:06:56 -0400
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
X-TUID: AbgI20x3/WBJ

patch1 removes CBAR from A55 and A76
patch2 adds A78 CPU

Jisheng Zhang (2):
  target/arm: Remove ARM_FEATURE_CBAR_RO from A55 and A76
  target/arm: Add Cortex-A78 CPU

 docs/system/arm/virt.rst |  1 +
 hw/arm/virt.c            |  1 +
 target/arm/cpu64.c       | 71 ++++++++++++++++++++++++++++++++++++++--
 3 files changed, 71 insertions(+), 2 deletions(-)

-- 
2.40.0

