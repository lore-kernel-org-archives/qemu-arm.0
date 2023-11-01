Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp849839ejb;
        Wed, 1 Nov 2023 02:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ4m1tlNmk7WMbfTMY9/E7kxEz623CMY5HPOnWW8sFVnfzBj1Kbagln5nC5pA6iXMMmRvJ
X-Received: by 2002:a05:620a:40d5:b0:76c:a695:fe5b with SMTP id g21-20020a05620a40d500b0076ca695fe5bmr14498947qko.62.1698832775566;
        Wed, 01 Nov 2023 02:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698832775; cv=none;
        d=google.com; s=arc-20160816;
        b=m1WCdBl/RSJY8aKsvXM2iNiFBEzBHUwoO4XXgyp+I9HwP1Zw0jjYEkl5Xhm8rG2PL+
         +bRB6B4tOo9/Ajn51/sOIQbKvZqBgPDMNjLNSwmTNDl1E9MhrGTlsWYZCGvOWil3jFjO
         VDtAKvPgBkmMh4Cd7A7aBQNgR6yzK5dHC62oP5ISt7tceuNgYo9ZEUhqjfrdfhe99SF1
         iiMTqxPoJvI6v+1nhnL8Ird+FBm5h7++ul1BH3R8PuVZ/yKtEiYOddyR1wo+ynAug/jK
         2q/y28VX6VqGSLV1B2p71vtumPkunleVrog+mJmuUsxeO/uEAbD05plkLK8NCqWRQXyP
         PgDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=ahTruYL3vZJ7F0HCtqfq4Bqyi8MzW7CUd9f0vBpXky0=;
        fh=JhuDwHtKEKKQrnxhvX6DUTE1uXioTIKHM19RXfNzL2o=;
        b=Tza8iF9ExaYdvd44bztTL+wOEWowZLC58WIaBd03YrRyaVyqCn/mAEnj5FfHU/3wHj
         ndG4jMsoHcczqoEdLfaals0S/msBmDgqP4lsGGVRTFSKe5BPWu26DxZ8CG+RJWO8g5Ov
         O0qMUzXGj1ZhODThQdRaWeYcaFyux+GJRKU6R2kuEgTZQfNRSjZ9WRmNAisP+B19G1ZR
         9N5kpCntYZTStoy85huLY45R55GotLjS2XcL/zXZM3ek0B4sgDe+WpPwxnN/Kr2rPS4e
         hlvxnzrnv6vTldfWBDgzxWIxnacgCrgAv++h7ZV356cv6c7iR7mQBrivBtuSF9wiaUTh
         6C6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a05620a015100b00774395787a6si2316267qkn.299.2023.11.01.02.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 02:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qy801-00021Q-4u; Wed, 01 Nov 2023 05:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qy7zz-00020p-2r; Wed, 01 Nov 2023 05:58:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qy7zx-000056-3e; Wed, 01 Nov 2023 05:58:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 87B9A2F360;
 Wed,  1 Nov 2023 12:58:54 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D1508329B6;
 Wed,  1 Nov 2023 12:58:48 +0300 (MSK)
Message-ID: <29190e8c-f2e0-4ee2-8e3e-cefc4a616af1@tls.msk.ru>
Date: Wed, 1 Nov 2023 12:58:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Accompany -nostdlib with -fno-stack-protector
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20230731091042.139159-1-akihiko.odaki@daynix.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230731091042.139159-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: G70hN7GHwVhx

31.07.2023 12:10, Akihiko Odaki:
> A build of GCC 13.2 will have stack protector enabled by default if it was
> configured with --enable-default-ssp option. For such a compiler, it is
> necessary to explicitly disable stack protector when linking without
> standard libraries.
> 
> This is a tree-wide change to add -fno-stack-protector where -nostdlib is
> present.

Should we perhaps pick this up for -stable too?
The changes seems to be harmless for older compiler and lets to test
qemu with more recent compiler.

/mjt
