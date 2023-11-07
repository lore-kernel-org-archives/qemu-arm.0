Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp191655ejv;
        Tue, 7 Nov 2023 01:33:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGgeF113zG5fNwgw3W/6eVtLub1Gd5JjtRlEOghME6FwLohbMdwZRZVlInBrOHl3aULhM9i
X-Received: by 2002:a2e:350f:0:b0:2c5:12c4:5ff with SMTP id z15-20020a2e350f000000b002c512c405ffmr25350297ljz.17.1699349583227;
        Tue, 07 Nov 2023 01:33:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699349583; cv=none;
        d=google.com; s=arc-20160816;
        b=Gfl6m5TqrIU8rzQZKMCNs6awh1Cvwe6YDFSZfdGdeLz2zbPkVhOuJujGntVNktMwVG
         MrQkh3D57AYCjUJZYObawFRKlkMY04sCQtdBbPrkYXIXP0VBucr3SAdTo2TDMtQO7XjL
         7z0u0csYDIZ8Z/Eszpyep7A6IdFV428fdPGa54wmRmNmxMBu6aCi3deR4HBNPZbljjD9
         oC8EHq9QqW6bT5pLm5gU3leqajl9f0mt13MfkSoqAbaLbevncmWprbbPEemMLLkEezSq
         b7Ldr/G9c9ACfsdttvKDB1PCxaXlUj8njnPuQy8Y0ANTCUYCi1kT+YbnIQTWvzonldGR
         3jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=dtTgagiP8lyMapKZMsh+KlYchDB5M1cWqwen5LGaOpk=;
        fh=jIg+bK0iN2RcBySFHjtORnfJd7NTQNmYAP3yAhfpabI=;
        b=eU4vRA553Db4ulVzfzy52MlrW7BZnDGxeDOEtaCqfqlTBoDcSmJYcGKJoGqu4WgRxf
         GJwnMkoWgfku6l32L+uCOPKUg/6Zw1R/uZduD35mp6xUM4EpMl56K4tLMEc6Vy7HI6eQ
         yh5zCtClVaPN1ZsuRD4OBMiF9qJ0bjqgbr2rMYCiw0oy5iltCyyIO9cXQEA1ST5IJZwP
         qsoOpQz0bez69mElGrRSctpKqJ1yHp84lPkKyeytIaP4kswodifVJmxy73dsT7eu1VvA
         637bTiUq+vBnixt1TvoN7pd+0LEHJ6ihgrsqljE9zSFmNM94/C5XlDUyCxylwuwttCux
         5a1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jnlx+9QN;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t11-20020a1c770b000000b0040909b6d037si7800633wmi.211.2023.11.07.01.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 01:33:03 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jnlx+9QN;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699349582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtTgagiP8lyMapKZMsh+KlYchDB5M1cWqwen5LGaOpk=;
	b=Jnlx+9QNGIdt2DL81rupOaxVywqajWZIMUsBrg1MtCwrstc/Qjb4AHiAasR65/jhUxA6nx
	sv0kdV94xq6+2FJ3+LBgbEzj6iAqgxajm3EGE8pOpVsTR0ISl+NcyPTpp3mp4G7cwRWFSy
	ilbB7RhcAe1kXzSeVj5P52uAt5JCq7U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-vFh_N_A9P2uj314-1fHkxw-1; Tue, 07 Nov 2023 04:33:00 -0500
X-MC-Unique: vFh_N_A9P2uj314-1fHkxw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4083717431eso35886755e9.1
        for <alex.bennee@linaro.org>; Tue, 07 Nov 2023 01:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699349577; x=1699954377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtTgagiP8lyMapKZMsh+KlYchDB5M1cWqwen5LGaOpk=;
        b=MeuYfVwWi+Mqczrfu5JK/coF4fGro05TBhlmzMfF8ihCxLECo4YYseIba6hCN+4qW7
         HCQIDEkyE0iZUnwKYzLPI67E2dLDOBT1DM0KFH+uTw0j34UZsYSfggiJaWTgUN8v7McR
         +QuwXa5L9u61qin3luRghI2IbWq/UQKfG7bVNpbbOaLtGy2MTKa2B7ylE7vsR253jyHm
         pCY6BHsb4jAhYH1czlAbNOmrir//Zc6yC9+9aeLSEQ2FxK3QlVhlAjs3qAu9/psJyQtc
         5ZJo4LfNXlPb9+iZBiC+bBlIDsWzfltNe2cPkyyk043b8xC0eMWP6WFMUVTXf6OlUkGz
         vhEA==
X-Gm-Message-State: AOJu0Yx04QQdgg0gGRxG2JG7XH/30Nh0qbzhXvZDlXfCREyUcJwj5Mp6
	o9EoSNpg0dONh1kMJHov+SRmZfjHHW+rTI09X7laIO3fyY4Wkk8fQrMVZth2bGAcXuP9KCUQmWq
	hYkmwxHgSOzjU/UNHMB2PjNixtLvDgTtEXEyBkmuUrkGpw54nP5eeMWVZ9OVn5bFgATme9d5I1Y
	R0
X-Received: by 2002:a7b:c409:0:b0:408:3a67:f6f5 with SMTP id k9-20020a7bc409000000b004083a67f6f5mr1817456wmi.18.1699349576981;
        Tue, 07 Nov 2023 01:32:56 -0800 (PST)
X-Received: by 2002:a7b:c409:0:b0:408:3a67:f6f5 with SMTP id k9-20020a7bc409000000b004083a67f6f5mr1817421wmi.18.1699349576545;
        Tue, 07 Nov 2023 01:32:56 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id fm15-20020a05600c0c0f00b00405391f485fsm15356005wmb.41.2023.11.07.01.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 01:32:55 -0800 (PST)
Message-ID: <a6074d8f-6472-48f8-b2e0-14410c314d5e@redhat.com>
Date: Tue, 7 Nov 2023 10:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/22] configure: tell meson and contrib_plugins about
 DLLTOOL
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Manning <gmanning@rapitasystems.com>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-13-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20231106185112.2755262-13-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1Ipq+B6A9SKK

On 11/6/23 19:51, Alex Bennée wrote:
> To cleanly handle cross-building we need to export the details of
> dlltool into meson's list of cross binaries and into the
> contrib/plugins/ make configuration.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Greg Manning <gmanning@rapitasystems.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   configure | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/configure b/configure
> index f1456f6123..cd6c521bd8 100755
> --- a/configure
> +++ b/configure
> @@ -309,6 +309,7 @@ fi
>   ar="${AR-${cross_prefix}ar}"
>   as="${AS-${cross_prefix}as}"
>   ccas="${CCAS-$cc}"
> +dlltool="${DLLTOOL-${cross_prefix}dlltool}"
>   objcopy="${OBJCOPY-${cross_prefix}objcopy}"
>   ld="${LD-${cross_prefix}ld}"
>   ranlib="${RANLIB-${cross_prefix}ranlib}"
> @@ -1659,6 +1660,9 @@ echo "SRC_PATH=$source_path/contrib/plugins" >> contrib/plugins/$config_host_mak
>   echo "PKG_CONFIG=${pkg_config}" >> contrib/plugins/$config_host_mak
>   echo "CC=$cc $CPU_CFLAGS" >> contrib/plugins/$config_host_mak
>   echo "CFLAGS=${CFLAGS-$default_cflags} $EXTRA_CFLAGS" >> contrib/plugins/$config_host_mak
> +if test "$targetos" = windows; then
> +  echo "DLLTOOL=$dlltool" >> contrib/plugins/$config_host_mak
> +fi
>   if test "$targetos" = darwin; then
>     echo "CONFIG_DARWIN=y" >> contrib/plugins/$config_host_mak
>   fi
> @@ -1764,6 +1768,7 @@ if test "$skip_meson" = no; then
>     test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
>     test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
>     echo "ar = [$(meson_quote $ar)]" >> $cross
> +  echo "dlltool = [$(meson_quote $dlltool)]" >> $cross
>     echo "nm = [$(meson_quote $nm)]" >> $cross
>     echo "pkgconfig = [$(meson_quote $pkg_config)]" >> $cross
>     echo "pkg-config = [$(meson_quote $pkg_config)]" >> $cross
> @@ -1869,6 +1874,7 @@ preserve_env CC
>   preserve_env CFLAGS
>   preserve_env CXX
>   preserve_env CXXFLAGS
> +preserve_env DLLTOOL
>   preserve_env LD
>   preserve_env LDFLAGS
>   preserve_env LD_LIBRARY_PATH
