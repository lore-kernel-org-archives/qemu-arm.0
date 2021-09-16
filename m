Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1348319lfp;
        Thu, 16 Sep 2021 10:47:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybFENCAEdz5JRKvPd7CCXRxVnY3zQTI6OoqrA18AS+aU6JSS3ochuWaK83voZS6e3JIT13
X-Received: by 2002:a67:3296:: with SMTP id y144mr3957616vsy.27.1631814469394;
        Thu, 16 Sep 2021 10:47:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631814469; cv=none;
        d=google.com; s=arc-20160816;
        b=GMHanMxDI6DW3cWkZSz6q11pFdj7sKnA+UJtjkah9kzWYvhTkq6uThtOac2rXxOXcV
         ktGGM5D+aLMFZ0GLUoxXjQEvMuav1kX92Bv/SF7wbfzIeMyxN8hADHaTfMRQQn9Nr2NY
         ocBcDOyLjg5POkfs3wGqXBPR4XQYdQgjp3twG5rpyVHtFoWjOm2zq09ad1g1qkptNwt6
         P2DHlcSlLNyV2qQxkMueAgLJ2lkYKWuFvQc8VguSFA8Z83uANdWVKtydJLrsBbxi0d+O
         5t7xCD7I5QjBk53hu6ipzB9kHXUUYWEt7Jmt3DphcoZ+HYasmdcwfA2fHeLDnkRi8wGb
         jkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=VHQrvRyJmjwEBDT5YfanCBy7ab2WbjnNrdWUje8c360=;
        b=0xgvrLydSnamZXOQeCCL01Zb41IkXIocXozsRYAucDeFynazH9MXRhENxrNwW27NW6
         oNsOkrb+MufVieKmoXio33yNtMtL012p6l8xohxAjGmifgcZQx9VUSBZa8M4F2ZYr73D
         PYr0Kh2xy/BW4/qIxq1rgUAtlblJDKby63rlezRA1DDA3vHycqD+KWpVKYjbK0iWhWkT
         rMyiyXMkqltFc8xR140n07iXwDj1uw3tCrBICGQ45dt+jM8wnLWO+AbMPlOpcNayUu1G
         0SjLGqEaVGf9uQss8/vgP/ZJuw5yD3VXC0oCbg/RCcaIUavgAIWhtjrEdHpiT0AcoWu4
         ohnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si1679135vsn.414.2021.09.16.10.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 10:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQvUC-0006wd-Qs
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 13:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1mQvTo-0006tw-7t; Thu, 16 Sep 2021 13:47:24 -0400
Received: from mail.csgraf.de ([85.25.223.15]:51466 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1mQvTY-0000kv-3x; Thu, 16 Sep 2021 13:47:22 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-009-016-098.77.9.pool.telefonica.de [77.9.16.98])
 by csgraf.de (Postfix) with ESMTPSA id 63E5860805C8;
 Thu, 16 Sep 2021 19:47:04 +0200 (CEST)
Subject: Re: [PATCH v11 06/10] hvf: arm: Implement -cpu host
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-7-agraf@csgraf.de>
 <CAFEAcA9JZZ4nb8WAvKVYpwqxb_E5NFOVW9rKF3u7GhFqfNZgOQ@mail.gmail.com>
 <8e219cb0-8b65-faf8-f636-5c1d24471f84@csgraf.de>
 <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <bf2bb705-1d54-13f9-6e49-158f672cd32e@csgraf.de>
Date: Thu, 16 Sep 2021 19:47:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8xs3x5WCqT+FnPYip=nbQx6=UEH90Dkjq48YLboV9qAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uxToB2lZ8cvJ


On 16.09.21 17:55, Peter Maydell wrote:
> On Thu, 16 Sept 2021 at 16:30, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> On 16.09.21 14:24, Peter Maydell wrote:
>>> On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>>>> Now that we have working system register sync, we push more target CPU
>>>> properties into the virtual machine. That might be useful in some
>>>> situations, but is not the typical case that users want.
>>>>
>>>> So let's add a -cpu host option that allows them to explicitly pass all
>>>> CPU capabilities of their host CPU into the guest.
>>>>
>>>> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>>>> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>>> Reviewed-by: Sergio Lopez <slp@redhat.com>
>>>>
>>>> +    /*
>>>> +     * A scratch vCPU returns SCTLR 0, so let's fill our default with the M1
>>>> +     * boot SCTLR from https://github.com/AsahiLinux/m1n1/issues/97
> Side note: SCTLR_EL1 is a 64-bit register, do you have anything that
> prints the full 64-bits to confirm that [63:32] are indeed all 0?


Yes, m1n1 prints the full 64bit value:
https://github.com/AsahiLinux/m1n1/blob/main/src/memory.c#L459

That said, I'm not sure we really have to model the guest's reset SCTLR
in EL1 to be identical to the host's reset SCTLR in EL2. I think it's a
great start, but as long as there is no spec that indicates what SCTLR
should be in EL1, we can make our own rules IMHO.


Alex

