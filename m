Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp862067lfq;
        Wed, 16 Dec 2020 17:51:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsBoMpk74R554vxkP0y2Er/BJoK+XZ7LBL6ckjpv6nad9ghEBXQzsgtVXvwDdZ961TqblW
X-Received: by 2002:a25:3386:: with SMTP id z128mr55951128ybz.467.1608169861312;
        Wed, 16 Dec 2020 17:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608169861; cv=none;
        d=google.com; s=arc-20160816;
        b=oX9iuT0JatDwcAutpEWhdulPTAFMymyfAHwU/0Uun5nwUjzGr/22DWabAXmc7OH+WV
         knVSI+Fxzx04UeoG3numNDH4iDOqFANK89biZZ9dO1EtBbAfOSFimlRqFnN+Qep3t4eM
         xYrpeJfb8z18JS0dLuQ1AV7poGqzNq1d9nL4Vw74bD2vhz8nugpUgRgvHpA69lnbRPHp
         8aAnfu2OLFbOAzL5tvdobnNSwvt578UlNpNBCTNRLjESbazInj5GusrtYd8Wkjf9dvTd
         tfO2aA9j3uBEEPZetAETCO4OCrtxrGZAm1N2JxRpB+p8dsfz9i6Soe/g0MUte05RxR46
         yyFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=zdMwesVyQ7BrLZt1+0LIAp+Z/WORdjc3LPIB5HgTnRw=;
        b=rfDA+fneipSPq3Wo37cjZXqFo4kQ5xJRL7yp+dDHbmpS1vZCpZE+MzN3eUMPznxIcW
         dwIjCvOu6EGAKJAlsX8ZvRCnmx/BXpQOH3yK2cqDOZbLPOrfOOC2Zyz95Br/bC4wZ2um
         5uAqB1NaForHg1WFLEJ23fA9EhckdHuGCeu5XM/wElZ+SavQQYrKy+0wHjKv3KXQsWFS
         THjgJkkUwBexcvTA+kYwPwv0cUONMjaXC9lcfAdvXoGnfltrVpQHMRxkb6WvjZL5PYNx
         XqLPeoYB8Op2g/HuIH0f7qfk2FORm9sYZMNE1BP7N0AFM4OqYAwCFDnJmvfhG3YbTwrE
         73yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si3179468ybi.95.2020.12.16.17.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 17:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpiRY-0000ye-Ko
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 20:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpiR7-0000y5-PX; Wed, 16 Dec 2020 20:50:34 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kpiR5-0005tB-Cx; Wed, 16 Dec 2020 20:50:33 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CxFKz46hLz7Fmk;
 Thu, 17 Dec 2020 09:49:43 +0800 (CST)
Received: from DESKTOP-5IS4806.china.huawei.com (10.174.187.37) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 17 Dec 2020 09:50:13 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v2 0/2] accel: kvm: Some bugfixes for kvm dirty log
Date: Thu, 17 Dec 2020 09:49:39 +0800
Message-ID: <20201217014941.22872-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.37]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=szxga07-in.huawei.com
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
X-TUID: RZx/NVUUwQSO

Hi all,

This series fixes memory waste and adds alignment check for unmatched
qemu_real_host_page_size and TARGET_PAGE_SIZE.

Thanks.

Keqian Zhu (2):
  accel: kvm: Fix memory waste under mismatch page size
  accel: kvm: Add aligment assert for kvm_log_clear_one_slot

 accel/kvm/kvm-all.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.23.0

