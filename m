Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3255706lfq;
        Mon, 14 Dec 2020 23:23:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxg2t8zWerWrlgz/HTcIjlPYGl2wh/HzBH9pBRTxrahUyIScPF95F1cI88KNGEnRbS0XqqI
X-Received: by 2002:a25:2d5f:: with SMTP id s31mr41488048ybe.90.1608017031026;
        Mon, 14 Dec 2020 23:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608017031; cv=none;
        d=google.com; s=arc-20160816;
        b=GYICxrIG/ei3gKnFP+7zFEHNqIwtkMcx/QyTPp0S2cNwjtj2PLBAf0yS4ItIpsJDnt
         idSqANZIIZwdSoW0kSlAhO3LlWO9N/oxTDzNXdREHAKaQn/7u5rAm8rx+u0XpcyN2n1/
         IEQXT7IV24XKNY1f5Tis/RHZJnrsbuxp+k90EDAC7GFySdTx4bw/U5eKz38ek+V6X3m0
         x8b2GqFxhWwpeKZWcaGpC6nfP5NPglBQWje4b//i0JzCQCv3Pb5rvHPAAnyX9UU+jWsB
         u4hfSKQo/JGOuOpXUNYX/hl6vEdgj5OWUphDoSqvtiLMh5Mer4O24MUrJJJGG32qufCV
         lU6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=tXcrtwZQdfTUEM7nzelkyIdH3eOE219dekJEolF9ETc=;
        b=BeZ5PYOqR+oRyGn1prgbLa6PccyzZSWcpYZtC6Qf9Uxss5wzHYPd3E1WKaYoi8vlcq
         2/2BWXHIya7v2X8OE4uFSPe5mWag3PLcHmjFkbMcjbnQnF1ZuG+zT4qz504R90PHMmRp
         Utjzg9y+q2mhxg4FjVQvCK1aRpRM9EI5nfQ4xK2OrYa/wNyKoj1aa0V9WchvljKDA+UV
         My9Fb3g+INvFVjHU7A2WWBJCmnsH7ZhIBN+VNyEMxZivuP939ioraMCttFXVPi4Gp5S/
         I/UPomROKBxvsmsSSK6G0h7TMB0G0M93T2D9ioGOjgShALpkugwcFLCPusKNOvH67D5j
         V8dw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m74si8609946ybm.161.2020.12.14.23.23.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 23:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kp4gX-0004DV-S5
	for alex.bennee@linaro.org; Tue, 15 Dec 2020 02:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4dI-0001NE-V8; Tue, 15 Dec 2020 02:20:29 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kp4d8-0008RA-FE; Tue, 15 Dec 2020 02:20:28 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cw8lL51MWz15f2Q;
 Tue, 15 Dec 2020 15:19:26 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 15 Dec 2020 15:19:56 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Peter Xu" <peterx@redhat.com>
Subject: [PATCH 0/2] accel: kvm: Some bugfixes for kvm dirty log
Date: Tue, 15 Dec 2020 15:19:46 +0800
Message-ID: <20201215071948.23940-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: jiangkunkun@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EDGfXgkf6Qo7

Keqian Zhu (2):
  accel: kvm: Fix memory waste under mismatch page size
  accel: kvm: Add aligment check for kvm_log_clear_one_slot

 accel/kvm/kvm-all.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

-- 
2.23.0

