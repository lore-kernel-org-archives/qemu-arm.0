Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp413316ejb;
        Fri, 17 Feb 2023 20:10:14 -0800 (PST)
X-Received: by 2002:a17:903:80e:b0:19b:3b4:3ae8 with SMTP id kr14-20020a170903080e00b0019b03b43ae8mr97757plb.57.1676693414516;
        Fri, 17 Feb 2023 20:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676693414; cv=none;
        d=google.com; s=arc-20160816;
        b=a6be7urD7FQPVlbGvGG3v+RF1TgGuO4DgLCqM7kdqEFYvQMe/1wQWGHOzO4iuyXWPC
         oCeU0RlIbyQoU8Q9t/FxuITRYFM+fA5zyP2dfQqseE3MeqxUtesIydsUo1i/cz86bHHV
         C2hPS2+GZl3ehChBANrTyTxvzu51E6hMEYrUJ5LusxffCxhFN2RjGv8hdxdgFLAsyqRp
         d8l1X1yXFoH1lwwdwDnQzGCB1Kdan8WS1UY/MIXzKbhxK1V3upuEietSndQCeau+ip1Y
         8TG4mop09DO32YUi+pj3atdkmj10mf8I79IsdSfV9mfBTnR2zuKT+xSLnKcrz8b9oBwZ
         oacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7KwD74Vm0bAcpTRrg13yCtPbFdrKuth2pM1n8Sv0j4M=;
        b=QtsvVV/JKFQ2x5Nyxl0B4yDr6EwMYz8lMGd5SPgt9U+sU/rEFosudQYSLi01RaThfV
         lTJxOzl6tEenOXaF0wMxfpLQq+aq+nMT6ZBJyGj0W3VYN44NQpQQuVStMIQfHltPMi/W
         x4CHlBIajWVKQ6v+hC9nssEn9hcTKqVhxFTdJ8OmHfxm1tsBrX5YIo1nIQsHX+PWBh1K
         2uZSKDBsaTG59w58tPElYBGGtzKlhjV/6+XD9lgEn95gh9sNiZwbwFM83uj9KyxN07s5
         DkwHJOhKOAUe3yvIQkLcVEB3JUINvK9QtUNWiQAI0zweFkWpjvDb1CtLS72a1QSMzdXb
         92oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMv4WnO6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jk10-20020a170903330a00b0019aa67f49f0sor2007628plb.189.2023.02.17.20.10.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Feb 2023 20:10:14 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMv4WnO6;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KwD74Vm0bAcpTRrg13yCtPbFdrKuth2pM1n8Sv0j4M=;
        b=YMv4WnO6A0Ta1Q8ORxUhKfVaflAZypj80uXD+VRf2VqXHQdGPg6p4HY/XIXHXGi6R5
         vwtbRxAd8s5oD61cbwLOjO/5IRGoXshVE+JjYkVtYe7Bonx79mgpwKhNj1Onxe8P4mUb
         RKsccR1ZoMB90spGU8OHnk2wqFc2Tdlumts/ny+d5WFk8JvCzXM3JiMprh7hg9GJ9K1g
         XTiMA3knSUf67TgPcymeHPiyAEoBEPhNK+833S83HA984jfWpWy86w5ZVOL2nCU9rrsE
         qsqCFF2goeCrL2ZhHdCfNh67xjWIavzyzd7NeP8xihXu+tUkucCx+Z7j8dicI6tYkVTC
         lACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KwD74Vm0bAcpTRrg13yCtPbFdrKuth2pM1n8Sv0j4M=;
        b=EPbYIv1SHvsFOuoMLRo47TaVtQ3ud8TrP/QwGes/6BJH8GO+9lNxh/yH+C5GGFvE8F
         WuX+PmyxK3R+1yfX8QmgqW2kWF5RrA408w96TH6VTCK406inJ49CrLC/mmvt826Wjqko
         RmflMXuzDpp4drpUSJ27OpDlJEvctxTb9+hOivN3BGBhl5l7+pZmAewF2LsocSS3yIYV
         MIyGDOrbbJK6LxckNKkBjJDK7Ip7itg9kdnSVNCFXpHtD8qtfY8m452o7ev9uYaQME64
         qbvhVAv/kjzmrbnzIo5PZ4f/Dyf+WrifXqYqY3H9fkOeLPVslubXYP3feMOYihqBm/x4
         7x0w==
X-Gm-Message-State: AO0yUKVtGNZ9j+gbqCsaZPqvsHc5UsLhG1IxOwODGxnlThbhqmzLLeMY
	lT4Mu756CRJhx8b8YlDEeAdg5IO3
X-Google-Smtp-Source: AK7set/ZzINWOafUS18Rnvpq648FdMoxMjQoCIl7IetkPmzaYcpccRoclOZ2ptzGjsHW6iHrP0WM6Q==
X-Received: by 2002:a17:902:e5cf:b0:19a:a80e:a6d5 with SMTP id u15-20020a170902e5cf00b0019aa80ea6d5mr2760460plf.23.1676693414019;
        Fri, 17 Feb 2023 20:10:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.100.240] (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id b16-20020a170902b61000b0019a97f180fcsm3814578pls.37.2023.02.17.20.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 20:10:13 -0800 (PST)
Message-ID: <24485c5a-fbbe-a406-7392-f5753bd7b6ff@linaro.org>
Date: Fri, 17 Feb 2023 18:10:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 07/29] target/arm: Wrap TCG-only code in debug_helper.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-8-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230217201150.22032-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /r3BkOj2Avzt

On 2/17/23 10:11, Fabiano Rosas wrote:
> The next few patches will move helpers under CONFIG_TCG. We'd prefer
> to keep the debug helpers and debug registers close together, so
> rearrange the file a bit to be able to wrap the helpers with a TCG
> ifdef.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/debug_helper.c | 476 +++++++++++++++++++-------------------
>   1 file changed, 239 insertions(+), 237 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
