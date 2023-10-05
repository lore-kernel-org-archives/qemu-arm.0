Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp68760ejc;
        Wed, 4 Oct 2023 21:48:24 -0700 (PDT)
X-Received: by 2002:a5d:6145:0:b0:31f:ec91:39a7 with SMTP id y5-20020a5d6145000000b0031fec9139a7mr3901012wrt.14.1696481303941;
        Wed, 04 Oct 2023 21:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696481303; cv=none;
        d=google.com; s=arc-20160816;
        b=kJTgP4cgqYT+vV9h3QzhJcD5MbbLGzLN3ROJvGi+R6Fi+gwoO25RtFDskmk0bvcuLY
         gMM0ZbwxrhZkrxtNM8NYXkFg53UW9HeY8E5/JdZ/mOR8Jdsh8XqxiGzAYD7H/1lfM6CP
         4lkFV/G59/Lx5fr7CWh8YwrydXZIvnOl1ACR5J02QcoCCpTiv8ld8i8vFZ2P/Gco+QwY
         Gyqawt/S3vpwzTwull9m+COeLjLdZSvqlqxUcfZHQGMx44JPH2HVI+A4SB3kZcqAZqPb
         +S+ZoXdDz5fLrJREQWmHzMGJOX9WT555NFWpyOKcvUkaj6emU/MjVoiK7EXLjEsXof5I
         3AzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kEu8DFMU5Cl5XdcFgyJYlxB88JAhCyhjDYbGgtRefHk=;
        fh=Uz+MkVtV9ZiqGp8sMq8vD8eluQMCYbBfo5FY8eNJZWk=;
        b=qbQAlfjiw6aWYxLJm6GmSALLj0e7SHxP6/laKiV3jTMlcu02i4Jk9hJltR2tyELvkL
         dFGw6yWoUMa3Kd3LhNdhgE1ZANNoXg4vhhalmWlHkDl8zN3PZRTVG+iQEcCu9ff2gHch
         NYoFDEyvK4nNvuEEWeA8novh90l0NNMicpGCdDsesI+QaAjFxCDSR/vGZJRN1jHbeycn
         Wsh4qdd9f36JS+g+ztHdtKc8qcZy/sdr5o9DyL8T/3etcoGmUTRRPWKLIlZBwdMS/6i0
         NJQXij+mVHHMB8zcOq/cylBciPeCWkOzFEQjWMQWyCQxboPYFC4Fb85jpygaZaLSdh0U
         2+1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svla5ZZZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g13-20020adfa48d000000b0032175587853sor261255wrb.4.2023.10.04.21.48.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Oct 2023 21:48:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=svla5ZZZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696481303; x=1697086103; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kEu8DFMU5Cl5XdcFgyJYlxB88JAhCyhjDYbGgtRefHk=;
        b=svla5ZZZGlVbVyiarJHKoAZd1CpsGWgvcUU0BObDYRnime2nSC4Px3QaZjHTIqRzai
         dIGNhGTLDQbCZPwsXxAjSw/+YkO+04r8ip4dkmrQkw9rCclldYCPTxE8kWqkyIn1VtUr
         0N73YUuoyrkgtFX3MyiZCNdHxBUT8U4x7oyoQ+F5F6J24WIu8VVnf6WgnolLtF15n8Oe
         FTdAwttcI1jIuehDgYZDjehWVLOxzD4+DtVe0ds2m2cdjxk7oRmevnziZ/ojYv0Obd3n
         jy5rpkxpreuDUnlPvmYskV3+2etgEWI9o+Q45ollyheGnc6n2bxvxQWo4sG0ogahlvnH
         faEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696481303; x=1697086103;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEu8DFMU5Cl5XdcFgyJYlxB88JAhCyhjDYbGgtRefHk=;
        b=Okrd9voB5VuQq15CThsGXiwe/L5VUdKqoxzBtaXYsI4dtIj1K5Am3jUETWl/SBLmK0
         8cAnN9Jnet+INPFwfUBfPczsDm5EAn0TvXBocivyDyd1h0F9Nwn7N1q2UIgQLQu+d403
         884nR2HiSjnweR5WJSo/n5XJo46ka6jQeat2FuRFFhdJBqXgJzLub/tfvenhm/8Vu4G2
         aq6gy2G880VSABtW/Sg4A7r0idlg4bGLF3m4GBQ4flBW3aJJprXeCWbk8z+K6DYoyaXR
         MHiYj5prFdmJnI480NHPh3FpfRDOmAXLHIetzvqaYXFqSzz04efUcNbGJrPcAcBTN7Bc
         MPtQ==
X-Gm-Message-State: AOJu0Yw6nTBlmqMnOah3UaSw11Dk455Okoh2xGrOLtdast8gTlWDfxU4
	HdWdlR5utVWD6d7g2ouy0S5mgHfJ
X-Google-Smtp-Source: AGHT+IGmv1gvqAHaOnGc/W1TuGt4u1tEy/+m+BLRFzIXIgaZUQE6CrP2Wq/VyS+m0NkQpEoB0CGmNw==
X-Received: by 2002:a5d:628a:0:b0:320:bb1:5a73 with SMTP id k10-20020a5d628a000000b003200bb15a73mr4064517wru.22.1696481303426;
        Wed, 04 Oct 2023 21:48:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (tbo33-h01-176-171-211-120.dsl.sta.abo.bbox.fr. [176.171.211.120])
        by smtp.gmail.com with ESMTPSA id o6-20020a5d58c6000000b0031aef72a021sm741618wrf.86.2023.10.04.21.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 21:48:23 -0700 (PDT)
Message-ID: <3984cd72-931b-fa9b-e7ac-3d60487ac442@linaro.org>
Date: Thu, 5 Oct 2023 06:48:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PULL 0/9] Python patches
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-block@nongnu.org,
 Beraldo Leal <bleal@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>
References: <20231004194613.2900323-1-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231004194613.2900323-1-jsnow@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MoXNNfOIcV94

Hi John,

On 4/10/23 21:46, John Snow wrote:
> The following changes since commit da1034094d375afe9e3d8ec8980550ea0f06f7e0:
> 
>    Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-10-03 07:43:44 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
> 
> for you to fetch changes up to 4d7a663cbe8343e884b88e44bd88d37dd0a470e5:
> 
>    Python: test Python 3.12 (2023-10-04 15:19:00 -0400)
> 
> ----------------------------------------------------------------
> Python pullreq
> 
> Buffering improvements for qemu machine, minor changes to support the
> newly released Python 3.12
> 
> ----------------------------------------------------------------
> 
> John Snow (9):
>    Python/iotests: Add type hint for nbd module
>    python/machine: move socket setup out of _base_args property
>    python/machine: close sock_pair in cleanup path
>    python/console_socket: accept existing FD in initializer
>    python/machine: use socketpair() for console connections
>    python/machine: use socketpair() for qtest connection
>    python/machine: remove unused sock_dir argument
>    python/qmp: remove Server.wait_closed() call for Python 3.12
>    Python: test Python 3.12

Is that a pull request or a patch series to be reviewed?
