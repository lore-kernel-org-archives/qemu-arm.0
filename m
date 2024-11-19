Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3123284njc;
        Tue, 19 Nov 2024 00:41:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5wKgQM8MDxsiSF4gIGQd89lOsIU8d79JMFtXFctmQ1J4ozaLVgmqAw2M2kSCPSIRrdxW0rPySNPLTNg==@linaro.org
X-Received: by 2002:a17:907:7284:b0:a9a:345a:6873 with SMTP id a640c23a62f3a-aa4834161dfmr1491493966b.24.1732005711048;
        Tue, 19 Nov 2024 00:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732005711; cv=none;
        d=google.com; s=arc-20240605;
        b=Q/HhR2GtoQ6SB3q77Hz0/TaT2qiPHeZh27xj0h+B4fK8m0AzVj+U7sgf4mq77/+mby
         kDIUqupRJgIOn2ZYlx75C1axDWQVOLUo+y6atsOD3nG4Hyz2lQo5vqmvPE8slVV/Adxs
         S9eMPkBgDVnfEFAEtkBZLd6K2e/U54XXtuKmYN4VEnjwUuEnau60GSfjgah805UxjOBM
         kY8CFUf+mIe8SMyhyLhLOEglXB6fLjfx+WpTLXjwFAKY+89nOTHrK10E7i+7fWurciEv
         2RsCURXePJNXBhR8P1us2+Ya/hkYmRAQNg9hoV830UROvdQDlFSfpEOi4BF+fHHRU4tt
         Exww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=JtkzK9hIBr/jybUMX4Sfah7yVdSEMxrRCeFdrWaH3cA=;
        fh=2nqvvkwnWdabh9O/LJjDk410fvg87uhsGN5b3NfVNd0=;
        b=hqHIG2mbPhT/zbm8DEENO7V/DasmNjTwyjN9/xU+Gm5CLkP1XxxgK46AxY7TgS4GV5
         a7hTqEm3mNx2roV50E/Nx9ZiM6J2zq4vO/TX/WHOe+r15Sf2lHOKSPgOc+21XrcjQ7m/
         G0AO36eTqxuMdePEPYAN59t5I1fsMnSehLh8stCAMloTyZLLdTr55zwXhLrBIuqI0cxc
         SVbiCvdWa54Ghvg8s0bLIymvZJSfi6m6bBDAL1BScNfsZTAYn0ZIhA355ZAbHZ/nqkPT
         RMZ1zzo5aDlMuL6AZfVc4XwwdjIjGC7zEpULwA78Yz90RQAuzmxrGOGy94nAUzfuBMC9
         nIcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MS0FSU4f;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa4c808136dsor43336166b.4.2024.11.19.00.41.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Nov 2024 00:41:51 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MS0FSU4f;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732005710; x=1732610510; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JtkzK9hIBr/jybUMX4Sfah7yVdSEMxrRCeFdrWaH3cA=;
        b=MS0FSU4fifGCAoVbaBrU1bj1nK2awZTyqRC2wcQpBXnHumLqEqk3j+r9oADqWZER34
         wL27z2Cl19b8GyTvXgcvmwgxK8wrzpbpHYZ+GfpXSfnHRW46uO2htpe9AXOA3g+4mded
         CclE2Y4lrh6Gc6eR7kG8DYt7tl7Ym111Rw6w1/wVtcd7jqhKVcny2MGqzXgZuBd/jpK+
         OPnyvj1fakWgEfs2pLyIE+VltSZuKneNLuVm7+oV0ArBb0UvS/BNTWZYzxXw0JpcvpC8
         TofdI9rx0eJW+scnk/w+PJ8FRKimP0aR8qeqkC3DMKdVWJYVKfRhw6tD45L3poHwBOXz
         U8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732005710; x=1732610510;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtkzK9hIBr/jybUMX4Sfah7yVdSEMxrRCeFdrWaH3cA=;
        b=FEqhiD9kUeiICPdOHUWqO6sUeImPYunCQ8PDN7h7klA2Z0Gh5NY3EOTTCFP1BQLiFv
         ZWzFyu2GkS7SwklqlzvvcZb3JeUt+dUeVJEMWTRIoHgiY0ZGSycVNrsIoWI3CnZ8mGhT
         9C0KMwCORyqQRuyuwYGznMq3MEaabbuBuARiZnCZFa6FtS3j5vOn7wPT64gjl2W2LlGV
         bQWo+pacyZdTYtwm2jxBT7ohhrUznjRazpdOREfo8HdJBmspKspOh2PMplPwRtYcxO4N
         m4exyAd19nS8IMj1xh2IEXQtiERLBhSaMN7saGqTdHM4fJN2f+CDD0+FLZ7aHrHyhAps
         mvPg==
X-Forwarded-Encrypted: i=1; AJvYcCXU5GivA52o/9q/AsySRUcsYa+gluYfshCVLfe8SU+ATWRM094X/Rj55ykqLCvELYF9u/cQ0ICjdVaryQ==@linaro.org
X-Gm-Message-State: AOJu0YypOmZ2MKt1NtBgquiuHRC25A0jaBqTcZjoWTgH3SMozHJt8jBD
	htRPSU9WP5pxMHjkSkfAC1HKt3Bqjy89tVIWQ3o8YBsf0QY8hvLVn2EmOSD5P5Vu+g==
X-Google-Smtp-Source: AGHT+IFpOQ3VZindhIGNQzIUrfPPM+R00IWJhIv+8TT0a27qOO0+6v0wealj9KUN4s6cBEL/qOYfVQ==
X-Received: by 2002:a17:907:2688:b0:a99:ce2f:b0ff with SMTP id a640c23a62f3a-aa48347616fmr1385767566b.33.1732005710522;
        Tue, 19 Nov 2024 00:41:50 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.210.26] (83.11.2.232.ipv4.supernova.orange.pl. [83.11.2.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e048f12sm622684466b.173.2024.11.19.00.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 00:41:50 -0800 (PST)
Message-ID: <ce090d62-89a8-4f1a-a864-add24704dd11@linaro.org>
Date: Tue, 19 Nov 2024 09:41:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs/devel: add git-publish for patch submitting
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-3-pierrick.bouvier@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <20241118172357.475281-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NUxqoaWmiB+D

W dniu 18.11.2024 o 18:23, Pierrick Bouvier pisze:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   docs/devel/submitting-a-patch.rst | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
> index 349c32ee3a9..953682f20cb 100644
> --- a/docs/devel/submitting-a-patch.rst
> +++ b/docs/devel/submitting-a-patch.rst
> @@ -237,6 +237,20 @@ attachments can be used as a last resort on a first-time submission.
>   
>   .. _if_you_cannot_send_patch_emails:
>   
> +Use git-publish
> +~~~~~~~~~~~~~~~
> +
> +If you already configured git send-email, you can simply use `git-publish
> +<https://github.com/stefanha/git-publish>`__ to send series.
> +
> +::
> +
> +    $ git checkout master -b my-feature
> +    $ # work on new commits, add your 'Signed-off-by' lines to each
> +    $ git publish
> +    $ ... more work, rebase on master, ...
> +    $ git publish # will send a v2

You recommend 'b4 shazam' in 3/7 patch so why not here? Both 'b4' and 
'git-publish' seem to do same stuff - handle patch series and send them 
upstream.

b4 allows to keep To/Cc emails inside of cover letter which makes it 
easy to not miss anyone needed.
