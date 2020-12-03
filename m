Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp393781lfb;
        Thu, 3 Dec 2020 06:02:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFVeGZtu8aWBgwZoOt4WLNGbzgQKJK8pHfyRXbBxXtdQx6i+KwNemYG9CoCztW00B/yoYE
X-Received: by 2002:a5b:2c6:: with SMTP id h6mr4691499ybp.306.1607004170918;
        Thu, 03 Dec 2020 06:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607004170; cv=none;
        d=google.com; s=arc-20160816;
        b=e6PeoEasDIEnbgeJMB0cX5vUJ2+jnTmctj30KFCw/gw//LK+Tuph3wHSwFwSUkoXfR
         JAnMmT4tcrjE8acx54O9lPsDFgiYgI609GGzJ2ZCZZsbf/mdABNjg2Vf1Ntds+LP/IEH
         /PK1CLGEmMxeu5+Zjtykn/7kAIvqrbVRLxuLbc8/pgPRryJhvWCgWOn4ygE51Q5iMsNq
         ANLGgBCtIxHQRQl8NFGttik7hleyBoeZabyL8kuIj9kVAZ8Oz+aIEQs2YzCxvVJGHMkC
         PACZundq6ddqQMvpcaxQT4pzSlvILaHehB34+iFgLflsWfx2ftMLxxPI5qcbWhKKNejU
         F8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=pTVx+ya4xvLrFKaHsygsbHwG4mVTzXBsHcVBg4JG7rk=;
        b=r+GljLni+EwHBL/Vjs3sWRXyx4skgYF7CeBb4HhNXN+aWU7PoU+NkIrBg1O+ZVBgL2
         kPn6+lUIYddu3jIBpk7sC92OrxywtGFwAeLSLrqA7SqxnpAZNfpP8Kl76hwpbo/6pVHb
         LyJxD0NnTCMgKe6Vv8znufxIzitnt723yy2+0kKNSiREeqia3Oi3Sh7bxkAXhyAPevNg
         USSNB6N7fpE8KJoIrok2dp3hbXbD7C6SH9niLyvAb2+pvyNCUMf7Q+Jm6tYTP1Soub5q
         z6/Ab5/T94jE7n5C2+CP2NTSmZWJbX5Mp7QSux1bXJGVj37TCAgZ/cTGAGsq5co69bJy
         WHRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si2071938ybr.349.2020.12.03.06.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 06:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkpC6-0005CN-AU
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 09:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kkpBr-00052I-5h; Thu, 03 Dec 2020 09:02:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1kkpBn-0006Wk-PL; Thu, 03 Dec 2020 09:02:34 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmyF53LNNz15WyJ;
 Thu,  3 Dec 2020 22:01:45 +0800 (CST)
Received: from [10.174.187.37] (10.174.187.37) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Dec 2020 22:02:06 +0800
Subject: Ping: [PATCH v2 0/2] bugfix: Decrease dirty bitmap blocks after we
 remove ramblock
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>, "Fam
 Zheng" <famz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20201130131104.10600-1-zhukeqian1@huawei.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <34d6fc79-aafb-54cc-6a07-4f4c2c0e0db8@huawei.com>
Date: Thu, 3 Dec 2020 22:02:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201130131104.10600-1-zhukeqian1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 kuhn.chenqun@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 014Jy7y/PdZn

Hi folks, kindly ping ...

This bugfix can save several MBs memory, waiting for review, thanks.

Keqian.

On 2020/11/30 21:11, Keqian Zhu wrote:
> Keqian Zhu (2):
>   ramlist: Make dirty bitmap blocks of ramlist resizable
>   ramlist: Resize dirty bitmap blocks after remove ramblock
> 
>  softmmu/physmem.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
