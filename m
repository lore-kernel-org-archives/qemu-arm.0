Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp75637ejr;
        Tue, 10 Oct 2023 05:00:34 -0700 (PDT)
X-Received: by 2002:a17:907:78c7:b0:9ae:7548:742 with SMTP id kv7-20020a17090778c700b009ae75480742mr15459546ejc.3.1696939234170;
        Tue, 10 Oct 2023 05:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696939234; cv=none;
        d=google.com; s=arc-20160816;
        b=zUxcjDOOZc5KkTg7gShQ/lf/T1ppVnml+gTbDmQzZtb+1nL41+R30J5qt8ww/QGzBq
         MqivTSW33zAq8jSyGoT08w+xdhLQK7C8wy/KDDdOFpGp0i/Mt2e4ViMNoDXR3q2hxKkm
         zVx+Qu03i660Sn1I8eBoOkjlqe7Esc47faOf78ll3Op714IDMqefh7CDI0G3MA0Ut8LX
         OUoO+00oBzsZGMJccUQu0k8w7N0rypQzHODGSO2HyPGDpJYEbEz2EG1Wa/QHVDqBMGjm
         z+bur8a7eeFXaravx/1/qKGY0ynlk/cH/B1EKZSrGrjsi452e8Op0iQ9gDnAL39lEUgo
         kafQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e/VU4sSDcsunTSShOCZItFXGeYVcyUHw7YLpSt9d9YQ=;
        fh=laApbzcyDW67yvaQPTErmWsSK5B0H2U8qOdh4S20ATg=;
        b=F2SEKAW8gz0i74pDjwNhYwvxv5x+dVjMvQIqTgVeYM9lnSFbtxn/vY+VoE50qbSl9/
         4i9iqHaeNkGfi7v8Ga0pUj8kxU9XA1+4L7cwu1emGkoqXVNX+LjKd6LhBPfZOyYJwPy+
         O9vTosJBrcmyFi20pPatsTNaEu5UFFKDDe5gAFjbUwbG2UB+eCG7kRnGVuKX+08K0cm+
         6b1PSDEm6EPZQJuukV5oeJsbOJ7g2IHc7qhN4L/SJx8/1fXqcNWI090cwn77my1ya1me
         v2bg36VyEqKwWxZwgkJ5FlGOPdOWYQoXbQ/aI7OTsiZUSzhf5L5xUiUdhIuk4IG3Bc1z
         Jqig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CbAFmR6J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id qb33-20020a1709077ea100b009ba05bef161sor2816245ejc.19.2023.10.10.05.00.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 05:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CbAFmR6J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939233; x=1697544033; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e/VU4sSDcsunTSShOCZItFXGeYVcyUHw7YLpSt9d9YQ=;
        b=CbAFmR6JkKywWeuF3fVCtDXuu6CQddTmpiN32twQYYE2Upawc9LdrYUbHV0StrXZl2
         VvqlAoCd7sMbgCVf7kWSNo3xObdFSogzSuFgKYh+J5Ud49hkHBf3uXmJVw0bihwhnhpZ
         76bBsun4KrGUrzEBmK9a8jSZPO/Xc8Ee5mEzgMt2Us/dqI8rn/e42kUSzp/BOG2LhVRh
         iGXOgtZHMQElfyehDkxcPo0aVCKKkvIzgv47d19NFlV6Dm/kZHbUzhmVScutW8oMGG9J
         lNuMPxptlHc/9a7kU5fFk3cntxGTzlTrSvWjcMj6bNHWgSD8kgen9Zt9bn+7Bvvnyvh5
         yQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939233; x=1697544033;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e/VU4sSDcsunTSShOCZItFXGeYVcyUHw7YLpSt9d9YQ=;
        b=CLx/CPfmhJy0ZKiIqONJ6nVCyJQLRUnM653f2cpU94tWJ+WUUedKWj/gCfawQrQkg/
         vMeYfv8yTtq9ykwK30WbA5QWiQIEaB06q7Y1GTYt8TKNEbOL5pDXEDvrjP2GyUSVicJH
         gGCH//B6HYBBIDsibCrJtzuB0C6IvXkBEg0h5Aqa3ZqUn6NmPYPPARgXQMUKcbc2UtG5
         c7TnUcA2ty7Elc33d6YH3Dk2Sl37+c4zAViAP79MsqnUCrez2zYI0R4Q6G9IDTC6DoGY
         tRRMEitgzDbJJQVXjdN07NWydNu2kryE7/6YC2Y8ISNuzQS2Nn+WXDl0LhC0cdVTsdog
         0Ybw==
X-Gm-Message-State: AOJu0YxAHdHSM9vIomAO5Q5EXYPpKXWYReLG55+c4uIphonBIrSJiJ0z
	anZfz3NXbGX8D4HAs0vvZM0gnWeKIZ38aRq7GHW0gKy5
X-Google-Smtp-Source: AGHT+IHjqlnZyuoUGLy/z+F7vPd+t49tWXIPGQ4iwTVJZwE8gIHMluJ56cJ0jjE9z0IRpIBuRjBPXQ==
X-Received: by 2002:a17:907:7790:b0:9b9:facb:d950 with SMTP id ky16-20020a170907779000b009b9facbd950mr9906577ejc.72.1696939233509;
        Tue, 10 Oct 2023 05:00:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id ks8-20020a170906f84800b0099b6becb107sm8466800ejb.95.2023.10.10.05.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:00:33 -0700 (PDT)
Message-ID: <ec633e3d-d6a1-4e91-bfb1-85f064dc420e@linaro.org>
Date: Tue, 10 Oct 2023 14:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 25/25] contrib/plugins: fix coverity warning in hotblocks
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-26-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-26-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +mNp6htZE/rP

On 9/10/23 18:41, Alex Bennée wrote:
> Coverity complains that we have an unbalance use of mutex leading to
> potential deadlocks.
> 
> Fixes: CID 1519048

Fixes: a208ba09bd ("tests/plugin: add a hotblocks plugin")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   contrib/plugins/hotblocks.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
