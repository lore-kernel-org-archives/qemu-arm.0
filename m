Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2629685lff;
        Thu, 9 Jan 2020 13:07:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiDs8vEPLorO2+5XsqSIeo1qgZ9Hra/PdqbCDCqJ9bH3UEUQZSh2zTYC4UlUY/aPyrMufB
X-Received: by 2002:a05:6402:155a:: with SMTP id p26mr13316711edx.222.1578604040510;
        Thu, 09 Jan 2020 13:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578604040; cv=none;
        d=google.com; s=arc-20160816;
        b=cD2O1NWfxRUgthHy2U6Z8sawqH1zx3kjQ+OUJCWIyCCUs4HX1n+kdE9WGG3rvmerj0
         mUghdl7kMnnRlBPQJm5UFHjoq0ZHWs0kB4z7hiXGUtecLnaPDwZrR2LgiUklx1R65c3s
         62xCd/2fFe/zoC2cua2+er6FKAOyiKOnIxmIn8VEHVuZ2bV7tQDI775+W9RUtbBQhGec
         oOWG6L1YuEPobBsy27xUVgwTFMRErU+N51Olyq8TKzE3AFhF0QNaJWVBm9DpwZ+FByQ6
         caCwdH2IY75Q6HhNb/i7yztZvc8IQY5z+AgJPlNNX12QxcKGxyYdFSbLSYzJZOthxBkI
         Dn7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TtHYgZVm5surxo1DzQJ0vQ5yPpHhCV88mWsDEOv4xmQ=;
        b=uC+56PQ+e8bKGlrhJRcwvfWrdnPN/0BAxw3bcy7Vl14A2O9Wr9CDH5r2MwTd0DTTTA
         BNd1U9hU8c5BYSQykElqMuMos1clhjlaSBSQpBS5BT7pcryunv5v6X6TwZo5PQFLuy7K
         IWkjQY2c34v7lFi4eWD1AKlkMzJQhDThlOQp4enIWYM7fI9A23CLQ9J5Rz0T7G6pv6gv
         yGHqK4Sptx7k2swAH50C0NZV7GUMpxBoVVPUONFil5bjEr2imOMkBWSRwhVgufhgv+ZS
         FsxzEomNclNsLsvY3yRAVAK16bW5ilQ6etl4gL5zfObvY0i2JDf3kQUTUWehsnXVjNEw
         IJqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vs5Q41GU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si5834193eji.118.2020.01.09.13.07.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 13:07:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vs5Q41GU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipf1T-0002E3-AX
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 16:07:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ipf1H-0002Cc-Ud
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 16:07:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ipf1G-0001pr-Mf
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 16:07:07 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38790)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ipf1G-0001jM-Bb
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 16:07:06 -0500
Received: by mail-pg1-x541.google.com with SMTP id a33so3801748pgm.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2020 13:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TtHYgZVm5surxo1DzQJ0vQ5yPpHhCV88mWsDEOv4xmQ=;
 b=Vs5Q41GUw3neUV66YXUaJK5x2qI66837BzCJ7zn71LLeGYFjTViJMf8Ah0QiHdjVYr
 cla8JNcIriSsNGcWth1Ka2uQPWKn8JpBZ1WAIj6IlJWzYqt4zlcMek3dKfhIZUWRBhQF
 /gUfC4bSku2KC1ykET56bE78GU5V5SCGYfMmCK5f+1tVLgHbQsDcumUHyiueBmZR9FDc
 ruG3ifOCq0ROMfS58Q14RTxWt6Tyzz5HGdrFQOyQwifr9DI/680RML/lJCFq4STEic2c
 XKnKinDa40+3IUzyI8GkIzxgaDLF/UnQIFutfBT7RpAen9o0g968WEMsueOSRBemV3V+
 4hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TtHYgZVm5surxo1DzQJ0vQ5yPpHhCV88mWsDEOv4xmQ=;
 b=P4rYzdcsjJgUMssWxuz4S9URoNOwKhuBJZNxz0UaZPP+81HwkKzff/108jwhJLY59B
 4vI0vGeqCTbwW+63Ha+YlN2xnZDbSwKDfoXbZsS18NXBVw2Q1f20NivNJfmAaoCDyJBp
 olU8eSM43y2dBIQH8Q/eYXPyCiFK4gR5h3YmpAgsPERO7M3yVGFQwlEncilMZyWG9+0y
 nbXbn7rXpG0WwTV405dk69+y60EqxKaJ+68Z3NocGABAJL460hid+OHtBMrtJOa1QnXX
 3jyA4pEgk44+ZpoVJt8ROxga0afHGHcwX3oDLNeHpzQSPMkG9+xLXOJgJGkNJX8e+ImD
 sIOQ==
X-Gm-Message-State: APjAAAUgU2hIUTMkRqtK4dIFFsWE+WsERuqqPbs5vT1rE8eW8eKSkqU5
 CBSAFXg6nvm3ETC1zQOzKnJtDg==
X-Received: by 2002:a63:62c2:: with SMTP id w185mr639182pgb.271.1578604025029; 
 Thu, 09 Jan 2020 13:07:05 -0800 (PST)
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id q22sm9241844pfg.170.2020.01.09.13.07.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 13:07:04 -0800 (PST)
Subject: Re: [PATCH] target/arm/arm-semi: fix SYS_OPEN to return nonzero
 filehandle
To: Masahiro Yamada <masahiroy@kernel.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200109041228.10131-1-masahiroy@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5c6f6bae-2201-6e7a-f965-d75d70cc86e7@linaro.org>
Date: Fri, 10 Jan 2020 08:06:59 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109041228.10131-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /OnfM/Z4nib/

On 1/9/20 3:12 PM, Masahiro Yamada wrote:
> According to the specification "Semihosting for AArch32 and Aarch64",
> the SYS_OPEN operation should return:
> 
>  - A nonzero handle if the call is successful
>  - -1 if the call is not successful
> 
> So, it should never return 0.
> 
> Prior to commit 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting
> code hand out its own file descriptors"), the guest fd matched to the
> host fd. It returned a nonzero handle on success since the fd 0 is
> already used for stdin.
> 
> Now that the guest fd is the index of guestfd_array, it starts from 0.
> 
> I noticed this issue particularly because Trusted Firmware-A built with
> PLAT=qemu is no longer working. Its io_semihosting driver only handles
> a positive return value as a valid filehandle.
> 
> Basically, there are two ways to fix this:
> 
>   - Use (guestfd - 1) as the index of guestfs_arrary. We need to insert
>     increment/decrement to convert the guestfd and the array index back
>     and forth.
> 
>   - Keep using guestfd as the index of guestfs_array. The first entry
>     of guestfs_array is left unused.
> 
> I thought the latter is simpler. We end up with wasting a small piece
> of memory for the unused first entry of guestfd_array, but this is
> probably not a big deal.
> 
> Fixes: 35e9a0a8ce4b ("target/arm/arm-semi: Make semihosting code hand out its own file descriptors")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
