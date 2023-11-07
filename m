Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp208030ejv;
        Tue, 7 Nov 2023 02:11:15 -0800 (PST)
X-Received: by 2002:aa7:d6c4:0:b0:53e:29c1:ae1f with SMTP id x4-20020aa7d6c4000000b0053e29c1ae1fmr25893170edr.19.1699351874866;
        Tue, 07 Nov 2023 02:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699351874; cv=none;
        d=google.com; s=arc-20160816;
        b=IdyJMl18bFiH7VWp6zwqoXvqeyUtBjABPBdGNEQjQM75iSGq1vK3/QTaH+JNETJv01
         2oWGpF3EAFwTbGns6FD/AptlHyJsRuZzNsTr6VlMjB9P7AohD0ETldb6SS6q54rCxW/6
         z/PkzL+ILywNp5GwAE5OPzOBynuE6Eo1WGVniG4hB1rykm00/NjgDIKBJyra2PCK1LYP
         PNBd5ZUZQe1Dtl1QlDCu1r5sz9dk1EqxbIozkolHaP5xM7AGGIiyj3GBJKPJA90l3wlp
         +Q7eVdGX1bI6IZNIFtBq1YOj88LnaCxg9yOARIzQTs1dVHpdVA2n2tigdEqYyCMZGlwi
         4blA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ib8kBRPeV5EfosSTrkg+X2z6Y5tUzvz041Z1N7hG7z0=;
        fh=dDlxUCK+tdEK+SsfJnc41mHelFsfTI5RiG/3T4mL6v4=;
        b=DO3a0ssO4O2M+aTdJHkN+i7Y2kjl8APQkIvRxz8FRraK+trd+gARLROX/UulzaJQVD
         iyoaIs9KT0W+5kuSBcE1UU6G/I0uhai+5xDLOELBJDv73eqmwcH02Mn0Cjxc2nQ9nL8D
         JF8tX1HSO8uDmegLYm/9QK+IMtIHEjPItaE/rqlwfQOcF73bgxe6sGXkXR+SzsdONJZT
         ew3OKwKCoIYzpIRf28xiIIsFvL1H0EanBMjNPhN4i/uGcVLS7XDkNdW5TScrF4VsFh2J
         UuhcG91gUtw+Azq2OhQwlKl9KeD7AgfHx0OvaHUqdyHNHc9XWIBX7zlg0z3sk40FeuB0
         N5qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVGavAhM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u21-20020a509515000000b00540284621bfsor2857264eda.7.2023.11.07.02.11.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 Nov 2023 02:11:14 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OVGavAhM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699351874; x=1699956674; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ib8kBRPeV5EfosSTrkg+X2z6Y5tUzvz041Z1N7hG7z0=;
        b=OVGavAhMcz+SXC/oBOeFN1xxrdubSNyCzApCnlPWdeFseHSXSJaotJzZNAPV2zSL8H
         9WB1xFhEWekZQuHiRyI93ywst3cMAH6r/IDDfI8mADVCUwexOYpPSkAUDDKfSKKYjWUE
         vXDCt3e4XiJIDuGyF6qsGpmRVYi9rSW2RPeV0GFnBset2mVMnfBc0kqAGEOeZBKSn/mS
         bJOwJyHvGu9eNkn2zqQleYynTMFaUW20gkDbZAqyML71t6KMdEaXd1jJRpUo0GNqsBGZ
         ugVgGWjSbLrWGbtcgeJsjB6QTE5hJJKqP4iI3zM1BntRkIoS7Dgp8QKEYvncqa/jTgqW
         Emdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699351874; x=1699956674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib8kBRPeV5EfosSTrkg+X2z6Y5tUzvz041Z1N7hG7z0=;
        b=GAs7yZhXolejw7SjnoTdsTqWgkYuDoeh6DIjaWW5DixZfXPvjK2Y41ZUGxtlaPte4v
         Xj67HP85Qr4q3GVkUwwagAMPhrVAahaxhb7AiJn1emZ6bEOKJVKoKD8Lt5HL4M+C9So4
         tmvi6P1wLGN6LJNTn0kC6OKwA+/B8+lfy169WAcMOg4iNZqTBxy1baKspGhs8CjvP8L6
         1LVYyCpa3STECczlTSzITXT3hEzItrYwzCwOpDom0xykXjIj6hmca9/XpIuS9gNCV2gh
         QCgGQLAaO/Pi1gK1I2twsI9W5IFzbNINFsNiM2uII75D9TdDu2NEsGcOv3dwxn2Gp6Ek
         c52A==
X-Gm-Message-State: AOJu0Yyt20rJnMoJ215FrRb4mU97xxJf7pPxmU43nJwvJibaghdYmZnL
	c/HjytOsuRvdP+8tlrnchlNIGloGo8x5CljvsNGVyg==
X-Google-Smtp-Source: AGHT+IGJAyiF30wW/loslMC5FhfX2qPQMxwQJurW3n9tsuJRnBHl4lbw7c0LmzcT9jQkYJ5z26fU1g==
X-Received: by 2002:a50:d511:0:b0:543:f08:fdc with SMTP id u17-20020a50d511000000b005430f080fdcmr22627590edi.9.1699351874203;
        Tue, 07 Nov 2023 02:11:14 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.216.69])
        by smtp.gmail.com with ESMTPSA id k28-20020a508adc000000b0053de19620b9sm5450734edk.2.2023.11.07.02.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 02:11:13 -0800 (PST)
Message-ID: <3de367cf-9b32-4bab-bb03-af974c6d894c@linaro.org>
Date: Tue, 7 Nov 2023 11:11:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] plugins: allow plugins to be enabled on windows
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Yonggang Luo <luoyonggang@gmail.com>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Richard Henderson
 <richard.henderson@linaro.org>, Greg Manning <gmanning@rapitasystems.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231106185112.2755262-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6kZDyLwBQ/FM

On 6/11/23 19:51, Alex Bennée wrote:
> From: Greg Manning <gmanning@rapitasystems.com>
> 
> allow plugins to be enabled in the configure script on windows. Also,
> add the qemu_plugin_api.lib to the installer.
> 
> Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231102172053.17692-5-gmanning@rapitasystems.com>
> [AJB: add check for dlltool to configure]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20231103195956.1998255-30-alex.bennee@linaro.org>
> ---
>   configure   | 4 ++--
>   meson.build | 5 +++++
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index e50ec99fe2..abcb199aa8 100755
> --- a/configure
> +++ b/configure
> @@ -1011,9 +1011,9 @@ if test "$targetos" = "bogus"; then
>   fi
>   
>   # test for any invalid configuration combinations
> -if test "$targetos" = "windows"; then
> +if test "$targetos" = "windows" && ! has "$dlltool"; then
>     if test "$plugins" = "yes"; then
> -    error_exit "TCG plugins not currently supported on Windows platforms"
> +    error_exit "TCG plugins requires dlltool to build on Windows platforms"
>     fi
>     plugins="no"
>   fi
> diff --git a/meson.build b/meson.build
> index dcef8b1e79..b855224acc 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3904,6 +3904,11 @@ endforeach
>   
>   if get_option('plugins')
>     install_headers('include/qemu/qemu-plugin.h')
> +  if targetos == 'windows'
> +    # On windows, we want to deliver the qemu_plugin_api.lib file in the qemu installer,
> +    # so that plugin authors can compile against it.
> +    install_data(win32_qemu_plugin_api_lib, install_dir: 'lib')
> +  endif
>   endif
>   
>   subdir('qga')

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
