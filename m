Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp560414ejc;
        Thu, 19 Jan 2023 11:09:47 -0800 (PST)
X-Received: by 2002:a05:6a00:4207:b0:586:210b:2b67 with SMTP id cd7-20020a056a00420700b00586210b2b67mr14256474pfb.6.1674155387102;
        Thu, 19 Jan 2023 11:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674155387; cv=none;
        d=google.com; s=arc-20160816;
        b=Bie5bLAz36MjBLR2XQ0TGRyYfJGL7xB301C2jxRwXOWBd+FwdR5vJM6Ke7nQyIJbcA
         i2cAon4X+zanA3mZxD42V5GvSshSvZ3HKLxUxcUTNsaly7rvc1zSvE4X+bg/rOhPM/1z
         6D0ZvTOw6J+RfNiE6r+NbLE6UQsIheRULKNl8vBuHUPSN7Oof663ebFAVeWTBv3Yv8tA
         /EFrVWjukhjyP+Pxd7zh8Ylenc4mLvbRXznYCIEtpehHn8VFscX1I4DDY7IhCp5rDk1k
         mrdEjM8EulzBhDDrll3CL4J0eRaMgBrwHb9Ufw1ohD2dG0IeTy4EH4xNtrN8sfXAapgZ
         oDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=GA8o0KD2GdUs15C6MHaE3DQmCW9/qy/ODDaR898O808=;
        b=mDL8pqWBuvcptEGADZyBwZKe9ru1BiiRwogJ+mw+euof60Y1JQGk+0c7qnlNyHA5sF
         etc+mYz/1iXlVfwUbI6JpKx0XoNIlFuMK5+Cva4wsL1Ldf24WaZQCJD7ItfHPwk1Z75x
         xL+9WuDOhResUI4YAobuXMF6ndCm5gjaoyrsdSSzVwnVr0ft15x1GAg8wEqcVzUHdE/s
         4LP3h5IAlB2cVhOnSSbKaRx+tj4NGNAlAtRU9Mqk++r6BIt4LYGtn02g/b4kdTJxvf3t
         me/9Y5XLSzxr1evr8v7sIy0Oog4S7/Qbqz4T7X/RdVw/imI6FnnBznpxVx3qyciaHwj1
         WTGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcZVGLjs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u23-20020a62ed17000000b005815683040bsor19650427pfh.33.2023.01.19.11.09.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 11:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hcZVGLjs;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GA8o0KD2GdUs15C6MHaE3DQmCW9/qy/ODDaR898O808=;
        b=hcZVGLjs7T2udbILZuPF4NxJvbmwtFJP6pta2bPPHIqProY0TvU7zKQEZXvsxGt9l/
         qtvEpTbSeu+icnT9sLBpXFXwoia4F7RjLP5LZa0w1/uehPdBBNYDoXlnCRXymR05z8pE
         EWqFr7kTG7IjaHbzTl+h7D9q8oWxXXv5v1YR3uZiyHsARiho5LewCB1wZmeTQsa9VNjG
         bSvKRaylHe6weEybvnYUpeeitThukikmccEVijIxvec9KZcndMLLjAbrczPH/FkI0kqj
         qbPBI/kpm9luTGPE4FJYDCeAzXIwcsdvJO+8uTBi4yoVEq+1nHV6EBwfWrfmDQs5SqnD
         X7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GA8o0KD2GdUs15C6MHaE3DQmCW9/qy/ODDaR898O808=;
        b=J6aWasYJHYEbb1vUbqRHXk+PpW9zND54hX6JojGctQhSj/nFJ6DoJBPO9eRUTBQ+Nu
         dDqTOiYD13EqmnGjVHZbvvx8DpxUGuJjvjJOOppLxlkoHV6YilQgPBNmU00xo4S67RzF
         T3AjDXBD1XQfeomO17jU9CMBHAHh3A9dYew2eZ4nDju3iiw+TbpSvTVktFJJqwZg0BtM
         EmHLO5/7Ed+G/OmbUTydI2XXoq8MLayZ8byxmdhIpcwNAeIdygetW4uoKuspsrOaJShV
         abQ3HrluDGkRQKaThOJL7uONorTgJjJPB3/3bBdZu7iE5aAvZesnt0kQONvpHsHCFjSB
         4WHQ==
X-Gm-Message-State: AFqh2kopzUcTvoawEzYJquiFhAY2BDWj2DS/Fr7RMSCVO4UCtQu1YcS9
	09KLigmHcSF5d4DjJ+ECEb6ZtaFt
X-Google-Smtp-Source: AMrXdXuX2aFjtYobOu9wEEs4l90ShdUro0rtCD43OCPpY1NptngpjcU+7dmHEyr5lsftsOF3zzpyug==
X-Received: by 2002:a05:6a00:181f:b0:58b:d244:b525 with SMTP id y31-20020a056a00181f00b0058bd244b525mr18139267pfa.17.1674155386622;
        Thu, 19 Jan 2023 11:09:46 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id p12-20020aa79e8c000000b0058bc7e47a58sm10310123pfq.30.2023.01.19.11.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 11:09:46 -0800 (PST)
Message-ID: <cb112a3e-ad40-08ef-52b3-503d73ce97c2@linaro.org>
Date: Thu, 19 Jan 2023 09:09:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 11/15] tests/qemu-iotests: Allow passing a -cpu
 option in the QEMU cmdline
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-12-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-12-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lKKBZkbMxLCx

On 1/19/23 03:54, Fabiano Rosas wrote:
> +        cpu_map = (
> +            ('aarch64', 'cortex-a57'),
> +        )

This isn't a map...

> +        for suffix, cpu in cpu_map:
> +            if self.qemu_prog.endswith(f'qemu-system-{suffix}'):
> +                self.qemu_options += f' -cpu {cpu}'

... which causes you to use a loop here, instead of a map lookup.

Also, not keen on cortex-a57 vs max, again.

You want something like

     cpu_map = {
         'aarch64': 'max'
     }

     m = re.match('qemu-system-(.*)', self.qemu_prog)
     if m and m.group(1) in cpu_map:
         self.qemu_options += ' -cpu ' + cpu_map[m.group(1)]


My python is rough, so take that with a lot of testing...


r~
