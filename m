Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3588616lfb;
        Mon, 13 Sep 2021 04:47:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxCRwU3KyOr+TxbdX1qBwXSkfkWW7UdwnUR0p34NZ9j2nSl2P422Ukgn1dyhmf8Cb0I7kA
X-Received: by 2002:a05:6902:1247:: with SMTP id t7mr15514524ybu.285.1631533652749;
        Mon, 13 Sep 2021 04:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631533652; cv=none;
        d=google.com; s=arc-20160816;
        b=aHIYWGLe/jKOMdyZBgc8dLilGFYgquGawI8WGlL13Khfk3oXo4N7Awy3FV6ZPKPwXG
         HrsTGmkPoqC9PXj9SlrnMPBmGBvDZrfbd7C+U7PxOMCYCbLbVmtuJ1hHBCrgCxLLmkLd
         tz4nqUydNuh13rBPCRznTCMkM1eKyGu+9yhC9qAYKbsOxv1XrFokuyVhn61GKzhfuSBq
         m6QPUD0SGfx/dKcQLcvaV5Sx7ALk5y5pW4R0C39C3373wpwvT88QSu86dsaERaRFc9iX
         xOFp6cHiRs4S4XLz7Ybvd009RXGsiYkUbbKGaAmI1jqnTw10IH7gz5WLUtrK69hY6eAE
         hDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=pPHvKLPF7/yurP2pKAJ2fWiKEoJxgGn77VESe3sSwRE=;
        b=UAmLQeJE1hxPu47nv/P4xPpHkIQtbiZCW95YRI0Xxfm37OGijtsmu1AaYOSQdZzoRf
         1Y8/hFRf4W6xLhe6DyZ3WsCYTqUxou0QPehgUB+5p2RcaL+YRep1EEr3edvRMI+uP9gM
         LdX43/kbUyDKLlMHpqfMi16iUFhNqBWXzRrMBzTrShKM85KKYJ1PQuVLr+fT8VppUgVe
         bC0UIB07SoUr2eY7GDWRkJj9bkuByxj30D0lZMSxfId0hvtwJlDs6cPSpqBVaqmDEmOz
         gdCc0kbUGZbiZS7Xo2BtmIxWrU+lJHFFO3HwLFz3q/3tBq1bew8xNnKQwSLFRg9SWeCP
         s0WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p17si8714089ybg.357.2021.09.13.04.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 04:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPkQt-000637-W7
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 07:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPkQ6-00061w-60; Mon, 13 Sep 2021 07:46:42 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43946 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPkQ1-0005zk-EM; Mon, 13 Sep 2021 07:46:41 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-118-088-150.95.118.pool.telefonica.de [95.118.88.150])
 by csgraf.de (Postfix) with ESMTPSA id C1AE8608037D;
 Mon, 13 Sep 2021 13:46:32 +0200 (CEST)
Subject: Re: [PATCH v8 15/19] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-16-agraf@csgraf.de>
 <CAFEAcA9S619pfhfEXUxGQkjBBKahOYm14jpxEam2CQTtC1dRTQ@mail.gmail.com>
 <45519c63-06b1-1e06-032d-87d2e1338fd8@csgraf.de>
 <CAFEAcA_vC0beH4NMRP4hHK0drc6PZt073ZVZM=Majnfngkn_xQ@mail.gmail.com>
 <1c992028-633d-5f5e-f433-59492876eb73@csgraf.de>
 <CAFEAcA9b0TLs1mF5LWThE7007WuFb0rXUGqpbCpG5zsHj4UUyw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <ee7b2202-115f-0461-cbb1-d856199b884e@csgraf.de>
Date: Mon, 13 Sep 2021 13:46:32 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9b0TLs1mF5LWThE7007WuFb0rXUGqpbCpG5zsHj4UUyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9ri86j7Sq8qh


On 13.09.21 12:52, Peter Maydell wrote:
> On Mon, 13 Sept 2021 at 11:46, Alexander Graf <agraf@csgraf.de> wrote:
>> Why? You only get to this code path if you already selected -accel hvf.
>> If even a simple "create scratch vcpu" syscall failed then, pretty
>> failure when you define -cpu host is the last thing you care about. Any
>> CPU creation would fail.
> General design principle -- low level functions should report
> errors upwards, not barf and exit.


Usually I would agree with you, but here it really does not make sense
and would make the code significantly harder to read.


Alex


