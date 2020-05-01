Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp843342lfm;
        Fri, 1 May 2020 09:17:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypLMTjoG3iXc6xHRbnbJaHk0jxJLeguItYzR2ZaYVEiSSLO1G8qZn+W/8T1/37yfkF+I2kJf
X-Received: by 2002:a0c:f004:: with SMTP id z4mr4704275qvk.29.1588349832748;
        Fri, 01 May 2020 09:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588349832; cv=none;
        d=google.com; s=arc-20160816;
        b=ACI6IqK6OGQZzT5S6R3yhoC0qJzWf0t35zTLEspiMTAQ3T+2X+jwX6iRgZigrCcaos
         mtiUPVsVkFBwQS4csTVGam7Kgw38W8GknYgKQbg1cldoDTnK4pVpOilAUZ4qJlb2r9Ao
         XJtcidj6EFdzD5Uu+qx8WrzKTtKZPFbSzY9gyyLZH4Uz/fIZw11nd/lyYY4SG3eoT/AP
         Ra3IjezZkRY9/LKiTJ64AvrlAGym/Sr2cmdFGYCbDKmrba7oWDSTzFoNFXVsikq1I9Fx
         +9L1YWD2yD7FsgcN/5XOGnKmvP9uccT6jPf5RmBeui3Z53tP3nVNNNhMlSXT5aY7e24+
         Fz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+TooijH//DtWBgQpHCa9Tmeejeo0VI0gowBLeZ0TCyM=;
        b=zWo6L6NJyQ/g7QwvrC3UQ/4YfMyXJS6N99ngOYUljGfSWiuFnYA6iHG8W3gwJ5jiuT
         ti2j+wN63uNrJFiecqQfS1M3zB3epqW96fpMKVdQxLyuQdyJhBfibD3+MJia7PMper+o
         dWXgVvSxmqTfCqb+cyGc+4vt9cWSF7Z6BG66nJOTA1KntC91tdL/R5xIXHdV4EOVyC3v
         MZthHIKnlDpBHoj0zr3DAXTsHmCTApA/kw9lkREk0medaFPsktn5GG+W4ysj0TK4vaiD
         blkdW1+QA7dtXWOc2tqj6mwfbMVzsx0R7Qe0cMhpQJ37cwFu6STgaBmeYtWYEqtYGRqB
         5V0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQ1KxrsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id m10si1967473qvx.19.2020.05.01.09.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 09:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQ1KxrsO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUYLg-0006Am-51
	for alex.bennee@linaro.org; Fri, 01 May 2020 12:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUYIh-0005cs-Ry
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:17:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUYHO-0002ZK-I7
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:14:07 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUYHO-0002X3-3T
 for qemu-arm@nongnu.org; Fri, 01 May 2020 12:12:46 -0400
Received: by mail-pf1-x444.google.com with SMTP id 18so1758554pfv.8
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 09:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+TooijH//DtWBgQpHCa9Tmeejeo0VI0gowBLeZ0TCyM=;
 b=TQ1KxrsOG7UCm+dfz63hm4npVoJVTcSJ4rP34uihMcm9OGsuiDezBco7KKoIQVzPhW
 PcFymsfJqVQqFVv6BzJDCfX707WTV7baV4Ef1lESbWcI74ZrADHk8q2GCcCPmVWDCjyo
 m/4Vf1uVSAdb9MH31LeLXq5W6BYjNTI69w0hOJj9NWPdGUGbbWfLs62qd1dcNdFkKBvG
 Fjjz3wBhzA2+e+2cpT3HqcrIaz4b0AVjBrFbYxNpeyWlBszIYDL5QWx64980MLG4IhR/
 F5xAFPBdJQKQYle9ftvCPw2FfW8Jx8ARC5ehpPGdc4srwKepQ6aWtvlOylW4VfaTgqkz
 9qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+TooijH//DtWBgQpHCa9Tmeejeo0VI0gowBLeZ0TCyM=;
 b=lvOOvOcHFbsZH5DbXs+xir2UmEhjj07ETIv62kx19oxg4WcQEKUVOYyC1UZxCCWe+l
 DX4tpx3bKz5xeHgHYgBXaOUjn/m+p9BEArseTsMY4MwCsEPkOWui8QrHUKz0kKpalwre
 b3MVufFFKzvgllDC42FH4THFu2e2WWBp96I7fF8Fqaom47jxO31fJ0EOYyX3OtLEORwh
 KYrRSKslgM/udBX8m3f83tODl0ukFJwsry+Tp9LJQ2mMX9tmBvrYnnF/PMp/ToVEjDJa
 3Ph0FghBMxk4l98Yd4G0Teklvk3jD/+t2ZtiwXVwtuRfaflA1T4D86KlaBiU/Mvk6Vk1
 btBQ==
X-Gm-Message-State: AGi0PuaK/n+OpQol0OAyHg5nNYZxEoYAawbDXRjegh8jkcg9uBM5AjeK
 OsUAWhXU4uTV9D6SedoXRJU19Q==
X-Received: by 2002:a63:1d11:: with SMTP id d17mr4865641pgd.437.1588349564343; 
 Fri, 01 May 2020 09:12:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id 138sm2609402pfz.31.2020.05.01.09.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2020 09:12:43 -0700 (PDT)
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
 <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
 <CAFEAcA8M6M7CYg0AsTVbmfX88jzW9MZvRFihQ9cGDJNHhXV+Pw@mail.gmail.com>
 <2050ff9f-1338-2b6e-230f-e07c72ece3e5@linaro.org>
 <CAFEAcA8u=0LED6BQdkDCa-i3ySk986oSnMQzZj4KaBaBQ5tDuw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40a41c49-3636-d7fd-6b62-689686d83c3c@linaro.org>
Date: Fri, 1 May 2020 09:12:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8u=0LED6BQdkDCa-i3ySk986oSnMQzZj4KaBaBQ5tDuw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::444
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
X-TUID: DFT26OAU6MCZ

On 5/1/20 8:57 AM, Peter Maydell wrote:
> On Fri, 1 May 2020 at 16:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> The original intention of the hook is to expand some inline tcg ops.  That it
>> can be used to call a helper is a happy accident.  For a helper that needs env,
>> ideally we would use tcg_gen_gvec_ptr and handle the vector with one call.
> 
> The inconsistency where half the helpers nede to be passed cpu_env
> and the other half don't is really irritating for writing code
> that calls them. Lots of ought-to-be-common code ends up needing
> two versions :-(

Yep.  Lots of room for additional cleanup here.


r~
