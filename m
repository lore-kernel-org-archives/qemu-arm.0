Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3608915lfp;
        Sat, 15 Feb 2020 18:16:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaN6bGB3lS1bDITXyRGYfOLkok6xUFtZDZjiJ7hP0vk07dGELlfJcCFAHOEE7m1RfSQV4i
X-Received: by 2002:a0c:f28f:: with SMTP id k15mr7809549qvl.76.1581819401277;
        Sat, 15 Feb 2020 18:16:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581819401; cv=none;
        d=google.com; s=arc-20160816;
        b=rJ22AsKJC93ZxOnwy0KW8MaRk+O/gAQcg83zONYwfoFxXFt/FlgHZ6eIAsggTroVfv
         iA1UFO+xo9HEGQeZlnEuA2TFHTg/es9LHoPvuJPCh3a1DOhrkE8yRO/PpFIG8w0J/YSN
         12zoyREnscAfuZhPxtTyQJRJcNjmY7KAawVHhZ9akbVu+li0RS0AOA71rmGFJIUP6shr
         sM2vRQnzKP1FcapHHHQ2zStvCQqo5Iel5fg9QLWPflbh3S7cTfbnq6DHgEaBNCZoXtmo
         9/ftYslCkWBDEyWHQAKVLunbMadiYp/BJGMwdHfgC0MEiAqHPJk3DAiccbMKhkw3LEdb
         Pafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=u3qGc4XRM+DXPV2VcXzsEwStXj2fsHDrXRR1bHt+R18=;
        b=cBgRvqLmRi1J2GhJBPli8T7kbFdsf1Ol8TJUjOjlvlLJOsaQqz2hzVyAfIcdiWbb7S
         /+fY6ZgZ2eV6tzfoEhBN3Q1SC7E84uOF5fm/Ku30yV0ISJC9dLxeJKnLm5uYBAipy6bc
         wW02mlDBzZ2TUupS80daPrbsRyPhO9jOdUUY0xkQM9iumV9StdiFnDV8Ql/q4s5fNTR3
         iGp3uN3f0pEB882Y8ixnDZOK3eFETemGutJplijudHaElCnhn6XX8joNswHWD6iRQ++N
         QKHSIlSpCSbq1S+pwgMXxz58XLCpCsEMqH69sWBzkQM2WWazgxWsG3bc9xAUi8aC/9VP
         xa0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LHCFG3rM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u38si4993581qtb.395.2020.02.15.18.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 18:16:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LHCFG3rM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j39U8-0007Vg-JS
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 21:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44187)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j39Td-0007Qi-EE
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 21:16:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j39Tb-0000Uo-GU
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 21:16:09 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j39Tb-0000Tm-0M
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 21:16:07 -0500
Received: by mail-pg1-x543.google.com with SMTP id 6so7190815pgk.0
 for <qemu-arm@nongnu.org>; Sat, 15 Feb 2020 18:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u3qGc4XRM+DXPV2VcXzsEwStXj2fsHDrXRR1bHt+R18=;
 b=LHCFG3rMIjBX9beMGfTJib8fv0xDLWCN3kbvB2X//9vigfVf3Thb7fyW9V5DsqYBQo
 AC7CmjvzUNabry4E2yfcINuBYJ5kg4shWp/CL0i24OLEGD1yiL8GcM/sDZFrfUELj3tQ
 dgWwgRc0GiK0jENMH7RIfp9PeDyPhqOSpIEtwZvnTtzsF/jWN8OambTTxNmN4NF1Va33
 vMHdnya1ylEzLQEyp0POGWxIFIAntYRKQ7+s6ixnYQ2PA7LOjK66xkcpSU4GFZptxykA
 M2TGc7PXc4nxezf2ZY5TcJm92D09j0atiD25k29v8zF6hm7JsE1X2ymcGTvKKusBVKkV
 dqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u3qGc4XRM+DXPV2VcXzsEwStXj2fsHDrXRR1bHt+R18=;
 b=DPxV2ePxE8lfk2qcxZ67mAij/JlgVYXK/bcn9ROql7YK71K2lF/oW/hy7kyvIfSM0o
 QgVhT6FM9rz9fGi6jEzZDtByfxjJIfW/x7batohHxHVxGV80TJPAcgP/Etjn2oCt4r+y
 2WQ0lyc1eWMZhQrtb0lTtytTA3xeTA1xVll9UkV9KyxWNcosbFProB+WkBJkRugYViVR
 EM380WCsN5ni83AbtwHktY9L3VqL3JnIU3CKNRxV8im9PoWsMh5xSXfKsqyLIHYeGU1Q
 kL/dCN34yBR62Q8+3alr6rSkUMtGIkpwTOladwLOgb/y53BqKdSSE6Mwu7+Ckd/I8IL8
 z22A==
X-Gm-Message-State: APjAAAWijmC5i8peRoW7wUxFjYQPX4ptDjQ85gxnLDcScTeGXBTROFk6
 cSEONlDA/UgHVMTxfAES6JtY+g==
X-Received: by 2002:a63:da0e:: with SMTP id c14mr10872558pgh.237.1581819365987; 
 Sat, 15 Feb 2020 18:16:05 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b98sm11910128pjc.16.2020.02.15.18.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 18:16:05 -0800 (PST)
Subject: Re: [PATCH 01/12] hw/arm/raspi: Remove
 ignore_memory_transaction_failures on the raspi2
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200215191543.3235-1-f4bug@amsat.org>
 <20200215191543.3235-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <405481cc-7fb5-8faa-7baf-1cac54c7c7ed@linaro.org>
Date: Sat, 15 Feb 2020 18:16:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200215191543.3235-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rrnq/3nxUfeA

On 2/15/20 11:15 AM, Philippe Mathieu-Daudé wrote:
> Commit 1c3db49d39 added the raspi3, which uses the same peripherals
> than the raspi2 (but with different ARM cores). The raspi3 was
> introduced without the ignore_memory_transaction_failures flag.
> Almost 2 years later, the machine is usable running U-Boot and
> Linux.
> In commit 00cbd5bd74 we mapped a lot of unimplemented devices,
> commit d442d95f added thermal block and commit 0e5bbd7406 the
> system timer.
> As we are happy with the raspi3, let's remove this flag on the
> raspi2.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
