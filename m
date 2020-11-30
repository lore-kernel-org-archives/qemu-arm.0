Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5127312lfb;
        Mon, 30 Nov 2020 05:25:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/LrlNV125dCZgAlOnoYfJlaF3YsSPt9hDSXe+nyP7/qJ9YzEX2fW02xHtXi4xkjQLd7qg
X-Received: by 2002:a25:5382:: with SMTP id h124mr28570677ybb.263.1606742701171;
        Mon, 30 Nov 2020 05:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606742701; cv=none;
        d=google.com; s=arc-20160816;
        b=jO8Hho+Mmm4nFKzOrxgP70WCddz6jgQwtNOgj78l5E9h5VocaVWDm/ehurmYT1t6iJ
         hIst119msrlwpfLm18fsx3v/5o07F9u8uVoo4gYBjO6YBsHt3rAg/JW/kHQslyBiiVVB
         aPnSG+/paqky20dBYQ9trz9Z0ZZDGhjVu8w+l59jUB8LP/mardG3JDthJgWDTTXevpDh
         jltSbRc+/vDb2n6yd0aYePR9OgAPeK1BpVWGccw98OiP5UjweXwHWn9Txol2TkOgISSS
         sJxWSFBINPgPWa0cwYXYjerr8MZoJgAPBiyx6FWVBtMlgxPRvIgOP/l310+D9Ar09O2i
         sG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=Sa+jFS+6Pa3/5e+h/KhHhXKw/AxprxkKNS8W4xuw6JU=;
        b=CQOZ9QuaHwKxF+utxti1PRCiUQNHGVyt/LP2dHVLxy3I/NKgbukx6CE4f2M9ucqrxl
         bfAIq8EL9uyIpIP78IrYj4FosZBfQlRSN2g9JMKTlLxvLvTCfEn6A6W7siSpGPUoyLCv
         kz5QL6oRacYXXMa5G5rw3rup7NfUZlFoK5cKDIU1NlgRKzOx3PocsNNo90VucGwr8liT
         RRgsa3xwWyDmu4l7QV1KSCZqxBZocvApIvYwMcEiPCkCqI01qVkB2+tAuuhoVDMb1aW9
         Q/vlvXDJf3lGdDFGo7IwRHH6x8XVbAS05I77TYC2qwBmF8Pi0VYeCTeM2sK0Ew5A7Y52
         Z6Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si20698510ybc.379.2020.11.30.05.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 05:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjjAq-0005Gf-Ib
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 08:25:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kjiyB-0004Zm-Jj; Mon, 30 Nov 2020 08:11:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kjixy-0007e3-5b; Mon, 30 Nov 2020 08:11:53 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cl5Fn419NzLwwt;
 Mon, 30 Nov 2020 21:10:53 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Mon, 30 Nov 2020 21:11:16 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, "Fam
 Zheng" <famz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 0/2] bugfix: Decrease dirty bitmap blocks after we remove
 ramblock
Date: Mon, 30 Nov 2020 21:11:02 +0800
Message-ID: <20201130131104.10600-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhukeqian1@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 Keqian Zhu <zhukeqian1@huawei.com>, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l4BY5J1dO0W8

Keqian Zhu (2):
  ramlist: Make dirty bitmap blocks of ramlist resizable
  ramlist: Resize dirty bitmap blocks after remove ramblock

 softmmu/physmem.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

-- 
2.23.0

