Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1067441wrh;
        Thu, 9 May 2019 10:53:31 -0700 (PDT)
X-Received: by 2002:a63:1e4d:: with SMTP id p13mr7348411pgm.125.1557424411497;
        Thu, 09 May 2019 10:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557424411; cv=none;
        d=google.com; s=arc-20160816;
        b=P8LgEE3RuN2eQ1UycXZzaXTCdZTO+40hqSmSQlqs2b5FIZuGz7v1ouh/Di/uU/EZ50
         I66u1p2BIwaacKwYyESvLkWH4qq8revD9SCK+EUoCqml50j7C1JWHBnKTDdVOtaUwabM
         Oc6zitFb/nls2SZLrMEmr7fibuZPaPY2snRaBIQoJ6mpBMNx37G4GNevO/MSTGiWTMKV
         gk2i7Nucpnqm8EqrblH8aFLi5kuLLzUUzeKMT8muFTZZqMWdGgRQ26CA8pYyTGPmIBJw
         kg46LpItqIYXS81bFRXDx9ht7DXcG1yP5Ua1/fPSZWmUtJi6nZn3TuIFUOfpbb5qc18K
         F8bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=tZspNkHDi8B5NZIIUZTWWcNPDy926n62xxi1IYNKWpQ=;
        b=ATmy9Br42lbT6AR8POt5xzc84qMZG++8yf/IknYuuutWTVL1/891TwBZDWOLVFzfml
         pthEOU9pVLJhVquaCTC03XYoLHHhgREEojoqmRrSo3fzQ9i/ophC5OMFHevkiuBCvmg7
         YiORTIMsRBq2vgQVAVmWwv3ddxflqAgfG8VzjcHwKdJKQsXHmikov0TjQFVgS18XN0tG
         1HF1/ojyT0zecvcjsVrhe7zm33I/b/h9ZJMI9Bc1xwGk5PRVlZedruqLE9+zP/3D1ebS
         p0pQe28FiZ+EQoi0HiGm0dCD9ZBiNqbgq6EoBI16cE4PsI6+kXHZfgDMWyFBFB666xT2
         7eIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/gF1hGh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id cd17sor836265plb.57.2019.05.09.10.53.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 May 2019 10:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/gF1hGh";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tZspNkHDi8B5NZIIUZTWWcNPDy926n62xxi1IYNKWpQ=;
        b=H/gF1hGhcPgPCwni3wGQ3VFe2MBb/6CQYvgvF2L/ZYQ44H5slIfni5P9qotMqvkOq6
         n3W8uJPEUg/FdBiVuWv0hRsvPEdQ7J4spMEVqPjrYW1uU4ezRROQSC7lL0npJbHVLNq5
         p6ExPE+CffJF+Wu8LkR2Z4qXdlIhaeH7Uxf6sBN9vbQFooBFae+obsEY2GkZKhGwMqD2
         ns8RUHq5CW9KcoGvUvHmAxumUGLJers2eBf7zqNhaaPwRc8MgndbHsvJ0JMpetfcoLPj
         XVs38QOb8ZStZxuWOIXJXLpLj03Bgfy+Scqws70XHnDC2MxEJscEj47YzuwtKzTCKioL
         7zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tZspNkHDi8B5NZIIUZTWWcNPDy926n62xxi1IYNKWpQ=;
        b=fzl6J8bMyggwFfqP+j9+gWIquejc2ALEt8YNCDu/exLL0vAO1GTdVQyuzsWdnETMYj
         Jkr+CSlDZe8bkoWkthmzpLkUhkCR3hz2hGscGmIHOr65uS2Kd9r9SZptv7wEykg986cq
         ivk3mJfEC0myzZokr18R6zWAJ6keRGhYn9FZpbpcH2FC1CzGR8+s0CaNP2ofQnyz0u2z
         y7raOSfruAXq75X7s+gcjo4WxICM5xkxHM6191f/ftX44yl1ArWjnO9Lng+zltXurjnZ
         GYl8ris8PkvNYtTxqcd+/fpnSNhk0QZW1KUo/dso5s5KdD5fZDz0H+X4iU7ySvqSyOlx
         g3YQ==
X-Gm-Message-State: APjAAAVdOn6Rf0oNm/txPyXXsAl4LcIsBTEJvhhBYvmwqschPsGkMFV0
	YVq5hFWtU5fMQgHFEQ/+jjJuBgQTL4KC7g==
X-Google-Smtp-Source: APXvYqwmo/IyNC7Dy2evI+0thCJTFVfN03rAch6TRCyrTzuanFjUw9FP6rH/cdfOjb7Ci7EE142X+w==
X-Received: by 2002:a17:902:521:: with SMTP id 30mr6810185plf.248.1557424410953;
        Thu, 09 May 2019 10:53:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.31.99.192] (50-248-210-99-static.hfc.comcastbusiness.net. [50.248.210.99])
        by smtp.gmail.com with ESMTPSA id i27sm9531986pfk.162.2019.05.09.10.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 10:53:29 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 02/23] tests/docker: Test more components
 on the Fedora default image
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <37051934-a02b-1461-537d-9f6ed93ae4a9@linaro.org>
Date: Thu, 9 May 2019 10:53:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: U/4puU/3qRR4

On 5/9/19 9:58 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Install optional dependencies of QEMU to get better coverage.
> 
> The following components are now enabled:
> 
>   $ ./configure
>   ...
>   Multipath support yes
>   VNC SASL support  yes
>   RDMA support      yes
>   PVRDMA support    yes
>   libiscsi support  yes
>   seccomp support   yes
>   libpmem support   yes
>   libudev           yes
> 
> Note: The udev-devel package is provided by systemd-devel.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20190504055440.20406-1-philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/fedora.docker | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
