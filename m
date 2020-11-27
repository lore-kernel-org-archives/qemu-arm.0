Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2115295lfb;
        Thu, 26 Nov 2020 23:21:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0dga9/T09zxDcrVrc7KecMz62eu8onD0saBAcjQB2bA88TkY3m1tEkPiMYSXGkNw4KAJ/
X-Received: by 2002:a25:76c3:: with SMTP id r186mr7750324ybc.101.1606461681780;
        Thu, 26 Nov 2020 23:21:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606461681; cv=none;
        d=google.com; s=arc-20160816;
        b=tY8OU953FdWsNbKieB/YH1I7SowfFDBFCz1KRMhmXshVQrfSfmciY/1eCbaNcVFsn1
         lSTt5BlHqdT+/ev+EgdVrCiN3MIMuN0TH4WA945+ol8dDPjsas0+ySo4Rm+CV5DYdQzN
         Y6uBfEN9MsyaEIyfDFM05VUjvw/Bi8jYu6VLiY4Z5fYEV3da1NMtaSl/PzUEBdP3gisY
         iSQbafSnwZ+59Zg3guIxijDwk281MYx1tzdQuwJgfyQ7ZMvCggzjhRVjc1W6W0M/Cte1
         mfBFpNT1Sk8J9tncdIA8Qbl1vU67pw5DZBjQu0T0Ab1M12ek5Yat7jmebloOXMROauD9
         ZuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=ynn0gwGJSk3zfYXJe4hqObbleisetb5JKFOFg7AEU0g=;
        b=fGW2q8Z0GD+ztKLe65xCVY2IqtRm5YNZKFClKeAE0k+talT2VCZs/mTQM11EWFXXjC
         e8ag/l1+mUsGnn2iyZ/EiPiXHO1y4kANNy55G2CgrRDmogi1PyWUglvhuCMGGFlX34ol
         g5oolakiJikAYJyk/wpTqFwo3zUH6IYZlBYauJRQ9gCABowwln/jEiWrAeD7Ti7Eq9bN
         jALmcxP8ffDJhUGgOovK8zCStpWjISzJFcy73PrUIvkrDwNUCmm6bqS3R6tH1T70ikaB
         kM1rore/2UK3TRrQtiIJ0jynxSkw+pSvoxCuBu2KxnfYb7axV1HYJagr40gGb/cVArDi
         IYOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o63si7620273ybo.318.2020.11.26.23.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 23:21:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiY4H-0003a0-4Z
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 02:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1l-0002Ah-Vd; Fri, 27 Nov 2020 02:18:45 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kiY1j-0007eB-LZ; Fri, 27 Nov 2020 02:18:45 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cj5Z728fHz74dv;
 Fri, 27 Nov 2020 15:18:07 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Nov 2020
 15:18:19 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 0/7] Fix some memleaks caused by ptimer_init
Date: Fri, 27 Nov 2020 15:17:56 +0800
Message-ID: <20201127071803.2479462-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Gan Qixin <ganqixin@huawei.com>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TehFS+7pO0jZ

Hi all,

When running device-introspect-test, I found some memory leaks caused by
ptimer_init in the init function, so I released it in the finalize function.


Gan Qixin (7):
  allwinner-a10-pit: Use ptimer_free() in the finalize function to avoid
    memleaks
  digic-timer: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_mct: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_pwm: Use ptimer_free() in the finalize function to avoid
    memleaks
  exynos4210_rtc: Use ptimer_free() in the finalize function to avoid
    memleaks
  mss-timer: Use ptimer_free() in the finalize function to avoid
    memleaks
  musicpal: Use ptimer_free() in the finalize function to avoid memleaks

 hw/arm/musicpal.c            | 22 +++++++++++++++++-----
 hw/rtc/exynos4210_rtc.c      | 19 ++++++++++++++-----
 hw/timer/allwinner-a10-pit.c | 21 ++++++++++++++++-----
 hw/timer/digic-timer.c       | 18 +++++++++++++-----
 hw/timer/exynos4210_mct.c    | 24 +++++++++++++++++++-----
 hw/timer/exynos4210_pwm.c    | 21 ++++++++++++++++-----
 hw/timer/mss-timer.c         | 23 ++++++++++++++++++-----
 7 files changed, 113 insertions(+), 35 deletions(-)

-- 
2.23.0

