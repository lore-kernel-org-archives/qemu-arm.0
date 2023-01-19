Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp571212ejc;
        Thu, 19 Jan 2023 11:29:27 -0800 (PST)
X-Received: by 2002:a05:6a00:d64:b0:572:6e9b:9f9e with SMTP id n36-20020a056a000d6400b005726e9b9f9emr11482055pfv.19.1674156566771;
        Thu, 19 Jan 2023 11:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674156566; cv=none;
        d=google.com; s=arc-20160816;
        b=BepmSd/P0wuxRKFUbHm0h4zkcVLrGCsg3cH1SH8ZY2pAHV5zGWD5lsCDjJE5O6vFiR
         61W+spmrKtQ8RNKaz9I/kvbVY/Iiwlg4aFtupDrGNC0kEFxTU8URkdOCoV9ysukOaOJK
         vLKbYbyUmcDYpk/qml8VY0hCQlwK7CtoBpd+wPXwfIWWqoaKF9OxNlJsY56WjNU54lX8
         w1BMKX0uWQkliEIokToxNvtk3yT4hdB9VwA1F/UFhmpkYdeGKLxZ5LQqCQfeNkrL9R79
         FJSCAvtEf8es0Z0IWgZRo8+HbKJqYgvwWBFeaXAcssliCbqQ9k5FBwr8J0t0Fyi9Fq9z
         LwaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I84PT35YjStUx9GRy2bcqU53mL6oujapa2fqSWQO3sk=;
        b=FIWWw5C4zYWT9rihSJXgWrs6O/Og1OkdRBKgn1sZkEzkFRe5mspRuENxKjc0TClM5O
         ZZ656swvZ0unxd7nzcbfevsy+d5sKgpMYKxqNkkdUHgdakyvogHxkNgikHtEHDCTn/7W
         0Q0nkLJ4HOdsLROjpiP/fMJd+dZQpuyRu1peqIWZGIeps7cSDO6dH6mENvM6mRPIxa4U
         /B3d2USYjHqPv1xo9GK9rFiYa6lQ1FSUIB4QV5AIOIsu95ENXpz96NwVmpE7o20K4Tw5
         SdY9/FiKS5dXmQXoTAWRkHwT/mTQ4QDMzrvomIMNBkUoLq8RQLOB3qt/ZyQuDsaAdD87
         wiGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MRyD2I3n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 189-20020a6219c6000000b005826e2da293sor8169795pfz.66.2023.01.19.11.29.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 11:29:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MRyD2I3n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I84PT35YjStUx9GRy2bcqU53mL6oujapa2fqSWQO3sk=;
        b=MRyD2I3nqtigNPazUswVOJtuf29VJDWEZ1PPkbWC1bs6tw1EBB/L1xBms/Kep6XBTv
         MyOjFUt0+WPanlkMVSYIbQwsNj28cbWeO+wyf4uiJ7jVSFWb0ggeg3OowvgKlnGFHGly
         TxEMCPzcoO0jYQJHLxZxjV5A57c1cRVAZQkI0JlVbmzpysSGl+Rs6aUczyCphL7QxnXi
         gJ+GLXGi0FX1tLVEIj/x44vdWtZHsnOQZG96AZ0zqIgPHMtnPZ+ZgoYaWXyHqiji0OEH
         11t8Pb0x8WuFPQmAoOHfzQyX//OFRuVysilLdAfdbw2S6A8HmQiPdCotN8zp5nNdcWk1
         uh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I84PT35YjStUx9GRy2bcqU53mL6oujapa2fqSWQO3sk=;
        b=l01pQGMnXygMaYMnWa7XlnW6iTJ63Y1BBH0Zr78MW5TxnV6ghwZhfkMXlhCzV4t7UM
         i1FgYHlferKoHlVTn6iPcg1jOuTYjkG6mTGhvNL/73EOOVVqCr6ZOJ53D4wdaDCMRLK0
         1cNWYLLO1p8JSqMha6zf95a+XHTbi0SkzUd55aiZpEVi1gbRnOgZ4R41AbAHBDOIm2j4
         I6I8Ckz7ffnipDi/FUgO5BqETYs2+I8vUO7LqARirjCncf4Fvwz7535dygS38zWwvPjI
         jHs1y/OzIE69guI4ydKsoJ8SdpUSuFSv+yKlJukF6g8gmA8rg68uqKEPfQugmXOkj4T4
         o/MA==
X-Gm-Message-State: AFqh2kpb308/gM3SlyFCNJgPL7QA54E/qjaZxj1uwPZJVNSSbZYS8X7H
	/fjoFXJdsQjFKfwbJoQ7Ja+XQPFn
X-Google-Smtp-Source: AMrXdXsQM5MpTwKzpjo3z765B/b6o85XkswKyFqJdvGQYS8A1l+8nzv7SmKX10Hn9tHwSXXSctie6g==
X-Received: by 2002:a05:6a00:1887:b0:589:d831:ad2a with SMTP id x7-20020a056a00188700b00589d831ad2amr17937325pfh.6.1674156566257;
        Thu, 19 Jan 2023 11:29:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id z5-20020aa79485000000b0058d9710cb18sm8964535pfk.2.2023.01.19.11.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:29:25 -0800 (PST)
Message-ID: <f676bd5c-6c64-133d-0b1e-f0273c62e5b3@linaro.org>
Date: Thu, 19 Jan 2023 09:29:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 13/15] target/avocado: Pass parameters to migration
 test on aarch64
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-14-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: IboLCuYsECqA

On 1/19/23 03:54, Fabiano Rosas wrote:
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line. Most other architectures define a default value in QEMU for
> these options, but arm does not.
> 
> Add these options to the test class in case the test is being executed
> in an aarch64 host.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Don't we want to run migration tests for all the built targets? A
> cleaner approach would be to just subclass Migration for each
> archictecture like in boot_linux.py.
> ---
>   tests/avocado/migration.py | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -62,7 +72,6 @@ def _get_free_port(self):
>               self.cancel('Failed to find a free port')
>           return port
>   
> -
>       def test_migration_with_tcp_localhost(self):
>           dest_uri = 'tcp:localhost:%u' % self._get_free_port()
>           self.do_migrate(dest_uri)

Unrelated change.  Also, I think there's some python style guide that suggests 2 lines 
between functions and classes.


r~
