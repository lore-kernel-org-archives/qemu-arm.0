Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3993533lfb;
        Tue, 8 Dec 2020 04:58:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEN42Cren3OPD+VGLpBFfGXFBhBix6wxa8gG/2EKSYezHzNJ3geUVunpx7hFU7ro5brrkv
X-Received: by 2002:a5b:40e:: with SMTP id m14mr30356538ybp.33.1607432324719;
        Tue, 08 Dec 2020 04:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607432324; cv=none;
        d=google.com; s=arc-20160816;
        b=OEJyEPKP5JoqpZyqztapiMWCDHtinv9OqHwxT0DBcCNH4nBQlTXoWt9chZN4RaVtfr
         EmQNX+3tlTzCW+P4OYtCiRa2TS3rymHzrM27ixbZPBR4IC6RJ+NxnnbdaFQCSHp9wHQl
         lSawcg5Jypn3170eM1z6Al7GqhyNawgtmuUuAakmMsG/UVie9NVrdglarpq9yub8zoix
         nhm8q+hginGfuloeCa85IUQJ2oySs23O4r4rb3K+JXs/t6/efgVy1Pb/NJc6H1ad9SNW
         MRJ94a4BQeMyiqFAXEIN8X4Trpop45NK0nCh3OlF1FTokjL+jQFqbNK52dA6y7XA/1tx
         CYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RsToOGNSMKc+SW7eFn7Un/eXtDFMLk5aKj1iaigx1+g=;
        b=GFsCbc/ni4N9DcFBOhqFMHIK8/CnogglErLwAzRg+Fj7x3Wqy778QbtBke6o7ZXtLB
         R+ebk93BTjeqseWjf0s4+yy2TE/u9AWmw+PqNL2q1GSXK5N0BUKEn/yonDpC3Tw8XBop
         jiFmqDNN1jI2Pvcq7R+G1LY4F3Yss5oUa+0TCBKbXXZ9rifL0ynRdFzWwG0R0RRGuUwZ
         xifh4ZVhIE0lUOM+9WbUMNX28EvHaA3VLaE1UrkAmiuJQtTD1ZcXO9QeWRZPaEcEoD75
         vM5XkQK68YRwTnzzL/QeGas13CxyZEJsUjUELPW6cN0zxvdz7grXNzTF+KlvPtbjm4b5
         qpyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tuv33gy9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si7355996ybg.235.2020.12.08.04.58.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 04:58:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tuv33gy9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmcZo-00029c-58
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 07:58:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmcYx-000276-IO; Tue, 08 Dec 2020 07:57:52 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:40130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmcYe-00018S-66; Tue, 08 Dec 2020 07:57:51 -0500
Received: by mail-ed1-x541.google.com with SMTP id h16so6153231edt.7;
 Tue, 08 Dec 2020 04:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RsToOGNSMKc+SW7eFn7Un/eXtDFMLk5aKj1iaigx1+g=;
 b=Tuv33gy9TPnO4bHq5CFNKuSK7CQVF9C7HiZ5wNrLuzm2oGWutu96zW1YjdxqvUz0o+
 0vyo/hH56kOLCilca56/JGDdO1X8d7XV93SdwdKc70jB5QAXcxHI0CpFTp4IcHhkkmya
 ebQRgcHdPeJ4wwdi3prnCeW8VfA5WKOCAQ3N10CPGdjxcABwGOeSLwh0t3EGWzUGYoVy
 ZgtLj9cUDPkRQhOhc7+NiDoNsvrY4gkJ7IpahjKOHIsvDmWuaumDeITbgWVHy8vBI6jk
 rIgnMd5o3/mw/n03M0hjedvNkB16PDjTB2Ch4X74FiyV322Knd9FXV5mkr5+aTaXq0zh
 Y+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RsToOGNSMKc+SW7eFn7Un/eXtDFMLk5aKj1iaigx1+g=;
 b=D1G+csRlc67ouUkny/tKomxVs3F6YrdVFgWEQ44shqGsB2R8xZKebjslL6Y2My2jmg
 0sYDkP6yKSS5n1mEPnv7hnAfzuRvrAxBXdRzZ66NdIHj7G5y+5J1qL8yondZZJ2wWtqx
 n9vvpgtIIb4ezxmiXfCkjgcShAo3QUjvWYQnmt1C5PaBtsKRIT4HP42og9DOlRlxTFye
 d97KVeEVAzJHmzL+rbeviXP3OxGLZBd+J5aLZWO8hSvwnUqNUQ/SfAZaR7DIPBFhwpkO
 5lDcF3hYGqJnmqeRu3ct0z7kKGPEY4BWPJu5RNcUAhx2i/9fsF6sN9kshH9KnWHMkiur
 kOyQ==
X-Gm-Message-State: AOAM532Kg/7BVF9BjUytnDiArm2p6evWhZrWhMKs4Wol2CmNb7HHmsgJ
 5SZ1aaUpqggNrglV1ydBj3v2/fMn8qQ=
X-Received: by 2002:aa7:cb0e:: with SMTP id s14mr16384165edt.122.1607432249166; 
 Tue, 08 Dec 2020 04:57:29 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id t26sm15584388eji.22.2020.12.08.04.57.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 04:57:28 -0800 (PST)
Subject: Re: [PATCH 2/5] target/arm: make ARMCPU.clidr 64-bit
To: Leif Lindholm <leif@nuviainc.com>, qemu-arm@nongnu.org
References: <20201208122306.8933-1-leif@nuviainc.com>
 <20201208122306.8933-3-leif@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5f4c4ac-8b41-58ca-7e59-550bf5ac0281@amsat.org>
Date: Tue, 8 Dec 2020 13:57:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208122306.8933-3-leif@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: idqMoeYvpFZQ

On 12/8/20 1:23 PM, Leif Lindholm wrote:
> The AArch64 view of CLIDR_EL1 extends the ICB field to include also bit
> 32, as well as adding a Ttype<n> field when FEAT_MTE is implemented.
> Extend the clidr field to be able to hold this context.
> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
