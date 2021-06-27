Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3426408lfg;
        Sun, 27 Jun 2021 14:12:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO/RuH+eoHu9JU9gOg6SybTqiMhUnh36y0jfOqlIzxslK4ZG1jHsO7Yjo3VRmdSfTkV6qw
X-Received: by 2002:a25:b70c:: with SMTP id t12mr27144616ybj.90.1624828378734;
        Sun, 27 Jun 2021 14:12:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624828378; cv=none;
        d=google.com; s=arc-20160816;
        b=O7aDRbzZOFZS+yN2GUT2Pan7Sf2nsFe39mXHyScpqKsHombXM8c58w9kYF1Pwtl0Ts
         BvXcmqvvLyFQf0+ZXMhHTW242zNvax7zsIllAJTZ4yCkAk7s4xT4gTrW+lz8XTMa/35f
         S8GWSRyD+mRHRjCVk3nH1YmfEH4itxjn0sBdeYuw4Re/67n6pni55SBiupuXIRo1xtyg
         xC0BHOaolupV0G4pZR4CHGrUNR6FgxVKymyIIQee29DyH3rsXBklj9+yUyEjN7KbmbD1
         5sVs8D20wvK6WLaB85oh+WtopKWVBJ5E5EvjzAb3C9bXDslCO5OKLwlw7Ztuw81rb2Ez
         0u0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=alZqNDT91t5jj0BA6F7UKbhj3Z6XCz195YhZ7jkBRNE=;
        b=nIjqUkNQ0pcDmAf07VD+ihYMGlaeD2ZmvMKMxl9Up4dg+6+6ekPpb+s0x9B5+XvzI+
         YBUaF8v0EVI0fEdeZ5w7vBrYGC+jnkDqPJmuMX6GUNjhn+ZaJ6numSUC4iqJifznWUK8
         d4i12zWQR3uXRLdIyOWK0qBc09F+/DPNHymQ4msvMZHs7vOb1th4Rd/RdAvESBROm15m
         ropamqP/7RbWqsOuc0ZNvA1XuQ7Di5Fmv1CMxTeFyvonHyi20vIsI4ZEB81+1x+EHUnk
         MmZiXeYouoayQuAF/CzJnrRGVovMAb33RizhBuQj3nOLPVVZNZzdAolDVhe2NfdRfIUm
         tnoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si13090487ybk.75.2021.06.27.14.12.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Jun 2021 14:12:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxc5K-00043x-1j
	for alex.bennee@linaro.org; Sun, 27 Jun 2021 17:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lxc5B-00043e-TJ; Sun, 27 Jun 2021 17:12:49 -0400
Received: from mail.csgraf.de ([85.25.223.15]:33014 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lxc5A-0005TC-7o; Sun, 27 Jun 2021 17:12:49 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-101-004.77.2.pool.telefonica.de [77.2.101.4])
 by csgraf.de (Postfix) with ESMTPSA id B454C60801CD;
 Sun, 27 Jun 2021 23:12:45 +0200 (CEST)
Subject: Re: [PATCH v8 18/19] arm: Enable Windows 10 trusted SMCCC boot call
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-19-agraf@csgraf.de>
 <CAFEAcA825LDibg_4rnBQ8TmE8fZNauDkKzKBMGbnfY+j7bSjWg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <23319027-1a44-d190-f70e-ed8a12cb37d9@csgraf.de>
Date: Sun, 27 Jun 2021 23:12:45 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA825LDibg_4rnBQ8TmE8fZNauDkKzKBMGbnfY+j7bSjWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pkt/ZX5PZpGf


On 15.06.21 13:02, Peter Maydell wrote:
> On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
>> in the trusted application call number space, but its purpose is unknown.
>>
>> In our current SMC implementation, we inject a UDEF for unknown SMC calls,
>> including this one. However, Windows breaks on boot when we do this. Instead,
>> let's return an error code.
>>
>> With this and -M virt,virtualization=on I can successfully boot the current
>> Windows 10 Insider Preview in TCG.
>
> Same comments apply here and for patch 19.
>
> Either we can:
>  * find a spec for whatever this SMC ABI is and implement it
>    consistently across TCG, KVM and HVF
>  * find whether we're misimplementing whatever the SMCCC spec says
>    should happen for unknown SMC calls, and fix that bug
>
> But we're not adding random hacky workarounds for specific guest OSes.


Let's move the conversation to 19/19 then. My take on this is that TCG
is misinterpreting the SMCCC spec.


Alex


