Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3137668lfb;
        Sun, 12 Sep 2021 14:38:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2edj+afw+cOOY81ExRj4hVPkpMxpc2s1l92SatkZ/trmM5JsS2gTpwUCGKhDhxFKY9QDE
X-Received: by 2002:a5e:9603:: with SMTP id a3mr3303797ioq.158.1631482690068;
        Sun, 12 Sep 2021 14:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631482690; cv=none;
        d=google.com; s=arc-20160816;
        b=Yo2vHEgeqVIQtED+Pu5sq/a26vpMEYY+9qVTBWrrLjlgenVmN2rCsexlOvMw9eCYG+
         JJCj4Yhb4UPZ6n8LOnq/JpuIDlZHeTNygpEDSC6goUz5L5Dfyl0o2oQ3Ce4lxAHVLtFR
         bjBvaZ45G8vWW/r3WVJPXrUa0acb/adH5E6XQc4MHNsWDUmTMAkzeeqwuYHOz/8XhZm0
         HsJ5jPLYnVXw3qVGCuRUPMaI4GWKIZrDHJAS3krAlpFtLxCjB4zG2crY1VW7+Wm5Q+Uh
         P+moYtys35l6RvPxd8DOn8BdaA5bBrmOXJirc0IRBSkP+0CatLEKTZAIvSa7qMcr+Jcj
         BbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Wiany0qCZmRmGIoC6FO4dRG5IbUupZYAdHl3h7rb3ZI=;
        b=noGSq8PdZLTnsIUqXWMLDrk8bK/ivrdH+93+fikHOsg1zYtXM1MknsuYuYB0hP9aPn
         kDtah+F67gB6qbnjlKowVXBDgnuALvvC/MnF5VADFG5Z+J8AJU31j4cXe9BG2P2ei/7b
         Vbq6C9GqF9LjrdB8Xz/wn7Cj3cF7M9OGFC5s/RDdFbTT+v/W0mxwdV9VaC+1UL0v0bjh
         +YQ6BbEtZ/UAF9FNUch5Ff2+TC3gNKjuzDd0T/e/mu5kzM/TWhm8HKX3nJJ3oK7TgJzL
         7RjWZKQMJxXgjfvaUcN2I8S3hfvXoedg0Knl/afcujxAqo20NXkeC99PrKIkvn3nd7nX
         8KFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si5672468ilk.152.2021.09.12.14.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Sep 2021 14:38:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPXAv-00061H-E9
	for alex.bennee@linaro.org; Sun, 12 Sep 2021 17:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mPXAm-0005z6-4B; Sun, 12 Sep 2021 17:38:00 -0400
Received: from mail.csgraf.de ([85.25.223.15]:43446 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mPXAk-0002Ij-9v; Sun, 12 Sep 2021 17:37:59 -0400
Received: from MacBook-Air.alex.local
 (dynamic-095-117-028-179.95.117.pool.telefonica.de [95.117.28.179])
 by csgraf.de (Postfix) with ESMTPSA id E52E660802CC;
 Sun, 12 Sep 2021 23:37:54 +0200 (CEST)
Subject: Re: [PATCH v8 16/19] hvf: arm: Implement PSCI handling
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-17-agraf@csgraf.de>
 <CAFEAcA_VJa_vJtJx6PtQS=WTy2y9ZJg8pcgu4Pkzp=CbuH85qw@mail.gmail.com>
 <a9ac1625-1cb0-bd44-da27-67f9a003ec54@csgraf.de>
 <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <f05467cb-aae6-e943-3d4a-9894d9c72ef8@csgraf.de>
Date: Sun, 12 Sep 2021 23:37:54 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <11281306-a11a-5b8c-6b2b-202be8e2655a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.584,
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
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GLMHFwygivNc


On 12.09.21 23:20, Richard Henderson wrote:
> On 9/12/21 1:36 PM, Alexander Graf wrote:
>>> I think the callsites would be clearer if you made the function
>>> return true for "PSCI call handled", false for "not recognised,
>>> give the guest an UNDEF". Code like
>>>           if (hvf_handle_psci_call(cpu)) {
>>>               stuff;
>>>           }
>>>
>>> looks like the 'stuff' is for the "psci call handled" case,
>>> which at the moment it isn't.
>>
>>
>> This function merely follows standard C semantics along the lines of "0
>> means success, !0 is error". Isn't that what you would usually expect?
>
> No, not really.  I expect stuff that returns error codes to return
> negative integers on failure.  I expect stuff that returns a boolean
> success/failure to return true on success.


Fair, I'll change it to return -1 then. Thanks!


Alex


