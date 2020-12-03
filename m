Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp262269lfb;
        Thu, 3 Dec 2020 03:02:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySBuLgAQGUxly0h1aZryTiR25f3iKAtXsBb+xKEZOqXEOmfB/SnL29WkTFOgx9r8/gx7js
X-Received: by 2002:a25:6903:: with SMTP id e3mr3815826ybc.295.1606993372941;
        Thu, 03 Dec 2020 03:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606993372; cv=none;
        d=google.com; s=arc-20160816;
        b=iYTAUULUUQrEj69sTgQIeY5JU7jhzperXeCSTZk4GjivxvKW+YYAs6/basMs4nboT5
         85tnHcL2+VfUEiQF2TlFR+YMLx/I8lCepuAaxXsHzZZv/IzXm2W1g/swUxgHTvLsOeQ4
         XltplvHbZ4vFiqUsM8zX5Nd1c7eRqpsBr1dNdr1SIvSNXxWXZxAPq6ozpeDWO1WFq73g
         dMsXpWfUZBFxnwe1KhcwdkOEPMThU8klE9fge/vBfaVRD7o6TP0U8vi+nGZnHw7li7dZ
         DjJTzz7Jj+DTfflVj5m1Y41cPDPBVBJwws3KqnZUGEs4IKJ70J2ut2HrFoS2hszmXyUZ
         BJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=0KjwnkXfDW05etPi05P15QUF34iuBqgZODod+VF2MYo=;
        b=abkW0L/zLjA/reQOqAC9L4nHOSM5a3PvkshhDvon6Hf6gLvifLq2EeT4l+i646u/Ai
         DoPzCJtS4gxMSjilzQYObVZ7VpKNqgehrNmYIllZfx0OKqXHR3Sg/d1OXWS8jMl0roeW
         KjyG2//7sTEUmimm41UN5kLdUneD1xhpt/dkljhrQeB5CkcEeyGRgKQAWPlAXsmptJdG
         Al6Yl5W5nfCfUL+evuYI8ZkLqkrTC2diUWVv30yutVkhReG+dGb45cg0lz5r/rIs7q1j
         1c9XqFs3gXhofkI3DDxwb7gpIrTwAN227oV1UnTw6/FIvaevQWmifmm9AFTApqOfi+Mf
         Nwhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si1535336ybp.262.2020.12.03.03.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Dec 2020 03:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkmNw-00050x-8J
	for alex.bennee@linaro.org; Thu, 03 Dec 2020 06:02:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkmGg-00050A-H1; Thu, 03 Dec 2020 05:55:22 -0500
Received: from mail.csgraf.de ([188.138.100.120]:47114
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkmGe-0002HG-A1; Thu, 03 Dec 2020 05:55:22 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id AD38339000E4;
 Thu,  3 Dec 2020 11:55:17 +0100 (CET)
Subject: Re: [PATCH v3 05/10] hvf: arm: Mark CPU as dirty on reset
To: Roman Bolshakov <r.bolshakov@yadro.com>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-6-agraf@csgraf.de>
 <20201203015218.GA82480@SPB-NB-133.local>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <55e5dac5-6508-da7f-3f29-05ee225b13da@csgraf.de>
Date: Thu, 3 Dec 2020 11:55:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <20201203015218.GA82480@SPB-NB-133.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQFOymgLhAU4


On 03.12.20 02:52, Roman Bolshakov wrote:
> On Wed, Dec 02, 2020 at 08:04:03PM +0100, Alexander Graf wrote:
>> When clearing internal state of a CPU, we should also make sure that HVF
>> knows about it and can push the new values down to vcpu state.
>>
> I'm sorry if I'm asking something dumb. But isn't
> cpu_synchronize_all_post_reset() is supposed to push QEMU state into HVF
> (or any other accel) after reset?
>
> For x86 it used to work:
>
>    static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
>                                                  run_on_cpu_data arg)
>    {
>        hvf_put_registers(cpu);                                                                                                                                                                cpu->vcpu_dirty = false;
>    }


Yes, it works because after the reset is done, there is no other 
register modification happening. With the PSCI emulation code in QEMU, 
we still do modify CPU state after reset though.

Different question though: Why do we need the post_reset() call at all 
here to push state? We would just push it on the next run anyways, 
right? So if we don't set vcpu_dirty to false then, we wouldn't need 
this patch here I think.


Alex

