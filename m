Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp3077553lfi;
        Thu, 5 Mar 2020 07:57:21 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt6CnDW0pH1rN9glls28e3fyHSBs0q8dNQTMIC9VyvtVhSsLTh/uw3XT15XEwCUQ9szB7+A
X-Received: by 2002:a37:4f8d:: with SMTP id d135mr8702998qkb.394.1583423841724;
        Thu, 05 Mar 2020 07:57:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583423841; cv=none;
        d=google.com; s=arc-20160816;
        b=r6PDDzsEVpIuUCGw02Vhw61Tq2ZIDk1l/lT2IOS560JQkzYpoixAs09f3RYFOBVP4x
         XznepL5iKtNn6JqEcwyTvyA31gMpdgbjscUI3/yS7EIk+wTCZfmgIimEYWCj8JNTaWNP
         +UlgPLaJ5oTzfc/CCelEgrxKccafDOkb5vBYx1Hq4egiY0NifmG7naqsiBLCwSwmdrl1
         olbpt7ghBlQSThTIIar+0meVy7nqs0iNU5czELX4e0W1WRU9KsgcD3AKcel6P1t28FTH
         3SKPj8sa00WKmMWaN4NVWOSvQtdxjRA3ix8Q5/7rz1zd3ADscOMvluAvFmDFo1MTQ6c7
         g8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Aj1j9q1kdsqVBtMkYyKH6uLYz+CzIcrft2h4WyHB374=;
        b=KZH6jWwJa6Ksxu07JpFFDimX7EV6iDtB0p2wrwEZVJQBtn6cb93CheyZBGIFtytqpx
         Dl8PAijSkEpgKnPK61xTNryqblfDmQ5WycslE9NQ7t9CjZVRWXKmWqHDyxOwqlJ9JvLD
         JZWu8qtnuGlmLXbprX9QISArV2NVGwkpnnksVmyl0G+AWAMtGMykMXgdfU+B5Ik26+C+
         bUIKUB89sUhEitQIopgIvdcyd3FOeOgBDGpDrrfDWcxE3gsL6mdAW3QxLz/d05GubDIl
         TsWE9EJLtDGbFCKplocd4nmaH55X7W1rPxK6EIowdxG5ntfS+g3tomVrveRbbFfs3X7x
         O1Fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrsfFiIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si3008917qkl.68.2020.03.05.07.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 07:57:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WrsfFiIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9ssD-0000JW-4u
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 10:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j9ss4-0000J9-LD
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 10:57:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j9ss3-0006H9-II
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 10:57:12 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:35471)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j9ss3-0006Cx-AI
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 10:57:11 -0500
Received: by mail-pf1-x42d.google.com with SMTP id i19so2974168pfa.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Aj1j9q1kdsqVBtMkYyKH6uLYz+CzIcrft2h4WyHB374=;
 b=WrsfFiIOoOSxyg7SwnEQQFTzLIRNB7y7s0CCodvj4PemhQ4u3eWG5WUOGPAD0n7+2I
 9CtcUizxuCyvKa7H6MNtb3mgP93I5n+Y0EyMSNCRNYKjTllYAbMPTfgmI4fCIJVDcJ9D
 hKAHE0XX9wNsUz9BGQL9j6ET0Mj2gPfuHqcniOHXBoTGOX3SWCeTMm8D68YYs93MdNzp
 7LktxyUofFyo3an3rTpuPESn+2+l1yWCuhrVlUanlIa9u1ZJ2Bf1KgrjTCXtDf3yec3y
 0IxlygAOdD5ggkU5PvCy1UdOArPdGD3AtfjR5EQijzCk7NkYenmfWMMPJaPT4EmPff3J
 fmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Aj1j9q1kdsqVBtMkYyKH6uLYz+CzIcrft2h4WyHB374=;
 b=YEa/zhd+ENt4h8wKa/gFnNRATrIqu7qUIO7kpuxE2/WgGQj9SebDPRyazRcmzOZJPa
 Tql19Xi/N+l+mshpIKKUaDnOxgd29PLZ6GK+jfCv0B4UNc/4OC5Jbann2715TiE16Q/J
 jUh/1sZ+v3MUygjMSJmQ0ZGagztDdj1waOBsXNSFr7eohBt/mTLFjPOfR2Xrpn0BUjnl
 zO6ElOlsp6zLtZm7z39j4akaMDZ5U0I82uchH8kKDCbZNexNB2JBvevFpcSC1nwVCEXL
 gbpl+77PET134T+jkb165d6YkQKmwyI+dESWzQvYoGZopxNpwWJf0v9eeDjmEkQDPrPO
 siUQ==
X-Gm-Message-State: ANhLgQ2MJZnvMbRyjyjpEcfQcvRIcNLi81k9H4GBOX8n55CHYB5vZzQE
 dYdRsqL0yxn3KfWI+z4Ab2hEYj/qi3c=
X-Received: by 2002:a62:3603:: with SMTP id d3mr8574284pfa.37.1583423828401;
 Thu, 05 Mar 2020 07:57:08 -0800 (PST)
Received: from [10.0.3.1] ([156.19.247.250])
 by smtp.gmail.com with ESMTPSA id w195sm30122629pfd.65.2020.03.05.07.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 07:57:07 -0800 (PST)
Subject: Re: [PATCH v2 8/9] target/arm: Check addresses for disabled regimes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-9-richard.henderson@linaro.org>
 <CAFEAcA8vEHctFuYfaziQs1QobbrHJgMioATwF7QkWL-e=gLxJw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d74accc4-7671-2d91-8acb-206487f0a915@linaro.org>
Date: Thu, 5 Mar 2020 07:57:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8vEHctFuYfaziQs1QobbrHJgMioATwF7QkWL-e=gLxJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42d
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pzqCAoG6gikP

On 3/5/20 6:21 AM, Peter Maydell wrote:
>>      if (regime_translation_disabled(env, mmu_idx)) {
>> -        /* MMU disabled. */
>> +        /*
>> +         * MMU disabled.  S1 addresses are still checked for bounds.
>> +         * C.f. AArch64.TranslateAddressS1Off.
>> +         */
>> +        if (is_a64(env) && mmu_idx != ARMMMUIdx_Stage2) {
> 
> This looks weird -- why do we care about whether the current
> EL is aarch64, rather than looking at the controlling EL
> for the translation regime ?

You're right, it should be the aa64-ness of the regime_el.
Thanks,


r~
