Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp854916ejc;
        Thu, 23 Feb 2023 07:59:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8G0b9ObIsDM7ZrJ5JjWMn+s02DiC+onRc95iejORn+A9GXxRdshqjpjHDancJXhM/OHjXA
X-Received: by 2002:adf:fb8f:0:b0:2c5:6182:5f6b with SMTP id a15-20020adffb8f000000b002c561825f6bmr11322217wrr.18.1677167979402;
        Thu, 23 Feb 2023 07:59:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677167979; cv=none;
        d=google.com; s=arc-20160816;
        b=rwGxEF1t35FjFR4nahw3TqJfEQij8skAuEdVPzyHghoBWdLkd4/PLyfPaMXO0nncY+
         A0aVhVACU6n31tqUnR2P9EaRGKhkd/WVW/cWFd0gQ5rQ3uj3kthoh4X4uXKtdspYUIws
         bDX0Boh1ddii/wjtIWDT6RkQ5kugpVBwqoMrTMFD1IYJrSzBhBkyNToX8N4tB8FU3MNr
         1jotBCFklgKUtrnqOoxEROknOs6ub9FlR3wWCIlsulLr65XkkdkJCzxGpB+exkMjp57I
         fruUmi8hj8CHakQ5REbU727NmhRqonqeg/f9Uv2i5dXX0478jMG9UAh4rI/gIgrKBCJl
         nZDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NoRHcpyiXe+kbrXabwWuRS9PHJj6baurxV0xwVa4s8I=;
        b=E3bwsP/SEb+zHHJ0/I13kQUorKA5gAptxYA66or935L5yu45+cT2TInbfY+wDrUUl6
         Q+A/6aq++Ax7KT3E9PoztvodWUm6LTzcPq3IC7LfCtj9WruYGrfzK3/oEWD1VqjQNy5Q
         t2rJas8vprHniYAj7B4QbMzGkJdan3zjEx/K4I/SMNLjGfvKAR24Sr4sFKIsfBRdxzP1
         COFeU0fFMCDFRPzWGoxQ3GpLdN5eGWU6WT0mhCrx57xmfn/psgxA6SO/k6JKClNM/E1m
         K38lU1EUCCjDhC6lNrvD850Cd6pMsvnfKWCODlJAPVntJFWtPR8n7Fxqf4YpzZucDY9P
         ZruQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuI9TpSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g13-20020a05600c4ecd00b003db2e5c4bbbsi6003194wmq.5.2023.02.23.07.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:59:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zuI9TpSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVDzG-0002VH-RG; Thu, 23 Feb 2023 10:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDzE-00027X-Ky
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:58:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDzA-0004uO-8O
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:58:22 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bt28so4396031wrb.8
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NoRHcpyiXe+kbrXabwWuRS9PHJj6baurxV0xwVa4s8I=;
 b=zuI9TpSSw8Zp0YQlKPuhtXrjwc0xIjEbsMXoVwh7LqnLM6NKZIqUZGqLmr+dftWdzP
 CaqVLE0KTklTl6EHQQQHNax5sOZuN533xnpKwXFBckHRIpbfcHRE4qAH3SwiBpWGSomX
 kWbKS2ENgevdM82KkoUPjsQyg5etqD13aH9fZrl2ep+cf+QVRU4nILAuTlIWe8yC5Oyk
 fcLJ1xagYOAymunBAoR2Qcxyxp2/VeMR/pWJKzPAH88bhEm9MErOyIAXCPPGts2sbR+9
 8xo7mGX4hoeXCERads0iphgyCQu80OvTziZjabsr9xcw+XlnBVIv+QOqjUBUkABd12wm
 eyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NoRHcpyiXe+kbrXabwWuRS9PHJj6baurxV0xwVa4s8I=;
 b=aqqXvHGu6aKUtYd3F0gFKGXvkOtnAWJrtwJElKjGG05MgDTpI7Sss5KQDHsOmSDsrW
 Y4nupecsMdyHhmtqPoKgM9oV6gVtEjlgx59YmBsPJxpM3AT0lAdIuxBm3pProgQJ6CT4
 bh3LAc60OoDMfF0wA2+tLLBChcuHt40IkNMU5L01JTWOjZEbSo/0RnMZzHyfQHh2YxVs
 s2H3ynHibyedHiTiOsfW3b1txhyNPkmKpueSLRdQ/CyjuyE3TQOO/MI2c0t8qM+NcSzU
 LpQ7I9K1G99vpbCzPKG6wm5RnnkmhN52TNn2AQnToC+/oaS5amqjk11wRp4veWMuJHNo
 Y9zA==
X-Gm-Message-State: AO0yUKW57N3quOJ5Yyt51BLqX1D6itNNj/nny39vIsYqf4x7kVYW3A6S
 HajX43HqxvdCjJbNNfMIBsSLYg==
X-Received: by 2002:a5d:504f:0:b0:2bf:942b:ddc with SMTP id
 h15-20020a5d504f000000b002bf942b0ddcmr10099298wrt.55.1677167898357; 
 Thu, 23 Feb 2023 07:58:18 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a05600c379100b003e70a7c1b73sm9910507wmr.16.2023.02.23.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 07:58:17 -0800 (PST)
Message-ID: <eececf08-0ae6-a46e-ae2d-f7f19653651b@linaro.org>
Date: Thu, 23 Feb 2023 16:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/4] target: Restrict 'qapi-commands-machine.h' to
 system emulation
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Song Gao <gaosong@loongson.cn>
References: <20230223124340.95367-1-philmd@linaro.org>
 <87sfew331b.fsf@pond.sub.org>
 <d3dae20b-81f7-5727-882a-3593ab2996f8@linaro.org>
In-Reply-To: <d3dae20b-81f7-5727-882a-3593ab2996f8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AG3JwsKdzMjC

On 23/2/23 16:56, Philippe Mathieu-Daudé wrote:
> On 23/2/23 14:49, Markus Armbruster wrote:
>> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>>
>>> All series reviewed, can patches be picked by corresponding
>>> maintainers, or should I include them in on of my PRs?
>>
>> I'm sitting on a lonely patch for the monitor subsystem.  Want me to
>> throw in your series, so my PR is a less complete waste of CI minutes?
> 
> That would be lovely! v4:
> https://lore.kernel.org/qemu-devel/20230223155540.30370-1-philmd@linaro.org/

btw I didn't add these files in your MAINTAINERS Monitor section because
I expect them to be taken care by each $target maintainer.
