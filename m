Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp549544ejc;
        Thu, 19 Jan 2023 10:52:42 -0800 (PST)
X-Received: by 2002:a17:902:e5cd:b0:192:efc2:6578 with SMTP id u13-20020a170902e5cd00b00192efc26578mr18369909plf.41.1674154361818;
        Thu, 19 Jan 2023 10:52:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674154361; cv=none;
        d=google.com; s=arc-20160816;
        b=pOM2az9rwwzSmoyIcnV878Ixhr6beAvvUuN+egJ05LpxpSidjjU2B3uuuu/H0IVCYf
         qfwsB+Va1+T8glcWWDGdNTBUfMxwMLYvAY2VEG5BQsa9HX4mJ+lKBvgXt3IqPe4EQRJI
         r5SYbJqzKggGjgY7aS8+APj/fq2Wg/EsgKGYQsJTo9hNczBtSOF9sLMn9XlJCzV2uc7w
         4MocQiVJerbv3+HDZYWpWk8SZ8wLR7i+3TUkiQUmp9KqbwgEr/zZcK14sBfNvrpd0ZRF
         P4qz+6htOib/t90ow3UScm2yH5BfFmpnFh87MxGXgJw5Af87RzjCYaGuMcJb+62uJJO8
         Zhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Gbb/c1AND59VtYrc55X0gpXjoCBL6kNk4bfM57Wy6pY=;
        b=MYlTEKyA1ka7Hq7xHchS7FXz3l1XZLY3TQX9MNLxLk+tqyw9mkEQvJVLfAGlB6KfBe
         AC69i5Y/+G0OQyoPhLByURaVOmwKdDoWxJW8IEm2MP5zDsyzfuQ29LzempXS+3gthvRL
         RKEIH6DIVtVCLkSPx5/5qKY+eFBltmbPw0SwpWTDaQ7MvTEQmY9N4kcWhkgjVRqVBcgG
         Ia/QU41GFIbhZEFTrObLTaXXx0M0jKLiMU0bI46MXo1gLSAmuE5kRcbTOqM3N8MvC1Ip
         xUYvRE12kSuplY6ucMubdLJXKcXDgM+crXq3MJOQyJTW0wkDuiEZTStLA+/P+krDvnWh
         iX8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=REE11CMA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a170902b48800b0019310b2b9f0sor17543608plr.82.2023.01.19.10.52.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 10:52:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=REE11CMA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gbb/c1AND59VtYrc55X0gpXjoCBL6kNk4bfM57Wy6pY=;
        b=REE11CMAKQCUjfy/8ibJVI/dQKjF4KU9DAD2ADjholXyzfG1qlWOAwqi4jgR4qO8Ik
         tUHARdV4EM7FQsrgPqBf8th0Xch9Tx5az0AMfv0KsBUN/1sPzCIFJ8hcXKBc3KYple24
         Z4uDaDlx8ZbQG5AiwKBEX2RXh6hUFUGqU5XvHtsple5vrZMoRV+IbsMbLyFex+nC9hsA
         97V1xVfPVoH63MNW9vjgPW2G3PnoC0I6MCPlYXv/01IyMIekIBPnHtiU4KdI61yUJ4Us
         y5zrVd84Q7JLMallQbrs4VHCjnolei8icVZZXJ96u30u1Dc7q/9ye+uO8z/XBUaLs10K
         Kdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbb/c1AND59VtYrc55X0gpXjoCBL6kNk4bfM57Wy6pY=;
        b=OGq3K3cBGYOLlNS5FyubBqW5RAT5gViHpSKuL1az7NiwDeUbmqQZ5rle9zTN1mDake
         Zbl8skiyMgqf3EwP7ypTespdnslECR6PzbctPZ50LDIw1vjetv3dc+JC8TuROrvymrAU
         ktoVIb3Y+peJPn6sHSRSW5pUpWprG0n6OigYKUHae7BYXQwE+ZjDpkUkhesfnvH6Slqb
         K2Aku8rlITEUemF58uUZxyGEUO+faI4g6Y0LQt1v6PUXB0ooXsMF4TzZNJN5CLPK9l8m
         eCSghpmG3ADWwqqsogdeAkmd/rgD5XJhnSRXWTM0CN5khJfIz+5S6JWv59O6uBrWSXUk
         xJ5Q==
X-Gm-Message-State: AFqh2koSul/5EfTjNhXzITZSVme128Myn84QgEuzcH3Ch+IwYgOrJZev
	r8wDnOFZ4wTbmeLIAIGwsLzsM+TH
X-Google-Smtp-Source: AMrXdXs9CKqruJwCFSzEg6htBnpD2A+WMvTNl1MimfsQDtrkzvgJyJYLBoyN+uAfalvFrghwxPHuhA==
X-Received: by 2002:a17:902:7209:b0:194:73c4:6bdd with SMTP id ba9-20020a170902720900b0019473c46bddmr12313264plb.17.1674154361382;
        Thu, 19 Jan 2023 10:52:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902650b00b00194cf9d5fbcsm1617968plk.167.2023.01.19.10.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:52:40 -0800 (PST)
Message-ID: <c98b7667-4233-5e62-0bde-751b53cbd24c@linaro.org>
Date: Thu, 19 Jan 2023 08:52:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 12/15] tests/tcg: Do not build/run TCG tests if TCG
 is disabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-13-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: mwPnuBOn4LGZ

On 1/19/23 03:54, Fabiano Rosas wrote:
> The tests under tests/tcg depend on the TCG accelerator. Do not build
> them if --disable-tcg was given in the configure line.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   configure | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Amusing that this wasn't found earlier.  But it does in fact give nonsense results for 
--disable-tcg on x86_64 host as well.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
