Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp542039ejc;
        Thu, 19 Jan 2023 10:37:59 -0800 (PST)
X-Received: by 2002:a17:902:7b98:b0:192:d58f:e5ff with SMTP id w24-20020a1709027b9800b00192d58fe5ffmr11538260pll.16.1674153479416;
        Thu, 19 Jan 2023 10:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674153479; cv=none;
        d=google.com; s=arc-20160816;
        b=jpqtiXI3RQ+Tq2V9oM1KDMfKBwpTB0Qh0iY7DC/KqThfmh1ofuw//o4mU0iSmoo8ox
         uCKD9Shx3ePU+tyYs9UefRCVIE/n8RqmqxwTFh+qWYW0mjTX4CWnr27nn0HAlV4KdfFZ
         R2HGMmfbAY3XJekEOBd4VXSJ18TwMB8lIAgQ24yoFbpIQkO2RoYq9obLMDem3RrH6BTn
         H8UeABJxWjUYketbfXtvwvEixgJdsOruIiPweNdOqQra+CUl379RTCSumlSsERc412pv
         wWClEEVOUpM1WxurCBIrsWfAeNI3DP87xWB2OZrVQUL//PTRsRBfYCWTYLfXLtEjlsJ+
         jseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DA30NIUbSztFAPQjn+IaTD7qGQLihvGVlL7G9QKj10s=;
        b=MLAjJRwGgJf4QXPOs5G9L1BIRa8tHkD8gUsPI4p81+Mg3ufDx+zshBL7aoXhbsrL0n
         OeoAqZ3dxSJb3fhJ8q3tgIhMIQqBLF5ysOUkqLHRiMQdE6xV/M3iZNTKlQigz/5JzPyu
         5ma3YfQ0USRUjQKZQuLKpEe0E8yu8ADMdPIHu7EZtcAROHVrhtXC8YEoxN7EeNqUVNAZ
         Ax5JU7waf4Baw4VqVi1gBht6yBkRcInzG4Vsu8LRv1vpPw5mtxA6D8nDkuj6j6dTl9XC
         UZDXdhOC0tLOIcDhAwQT1CM4Ic3x/W54DmakISlp7grk9Gjo4RchiFw5ZZIscY9SJMus
         pGEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dY6FYiDQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u12-20020a170903304c00b00192fc271788sor17920732pla.69.2023.01.19.10.37.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 10:37:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dY6FYiDQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DA30NIUbSztFAPQjn+IaTD7qGQLihvGVlL7G9QKj10s=;
        b=dY6FYiDQYuld4JiXknhrWZLSrTBokfvw481xd3e1mpjDtuccDmeSuMrJfUfDP1OleV
         qGNVT31zquYwDghaqoHcxQxwgDvpClFKBk0+oXmpH9mrFMklhU/JJIuLj63Cu3Sx+/Up
         wyFgxS3uQtPSKfyQ6E4Mp0tEwOXTUvVfZbaF6DRpjRqu1TTJOIbTmiR60YJVi1IkPdyT
         HOEJCJr8Df56cEWIjNzOg62YkNijBtMIg+Szf9r67RVEkzXwdQzTu0Hof+ALX+oEAbd0
         JzAs+5Mu0m120oa13oRjCOAGaX86GL0VOkEXSDEskqtC46iAcow8VQ0UMY/+A2fZ4YFe
         eyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DA30NIUbSztFAPQjn+IaTD7qGQLihvGVlL7G9QKj10s=;
        b=Qlods336U9yufp/5Lo4BIQ9+LIJdcwkNe8r4jVtYBYw81UIWkQLeL8hthpMVWcx6y1
         QX72DVtwuhOTxJNkNStC5Dq7qQV2XeMQqvP29gSaXz9sCWgQn5bntXhLtBSFIvDskdGF
         qf4+gSuFUgij4vT4aHsv4INJsRr/mgHgSMEkdSrKdo1FtJ6y9e6xmnPS7NIhx4d0RDAz
         is4n+B+HaC1L90vvZK4BT9f4NtZxwdbGbOO/sREYLQPXxJbS4VJXOX+XLEAAx3QtIU9u
         X8peprlbG5FT3Zlnm8VTK7hvN5EyNsQLTCKuwFkDWTkEQtrupz6kKyG9KPXiRpijtHO7
         Vm6w==
X-Gm-Message-State: AFqh2kos5Z1/S8qkEi0bXQDSRJ4JeUQHIAI+iavPbdVDObSAAT7u3o1M
	cX6GYtkJ+6myT7BoA/CurOodZ3/p
X-Google-Smtp-Source: AMrXdXuHyaoEaDMCXQivcBEU/uOCzASte9ezQqT5F843HOgp3pfSfRrPupxDkj02kGVrBpcOe4/rHw==
X-Received: by 2002:a17:902:778c:b0:194:7a99:d5e2 with SMTP id o12-20020a170902778c00b001947a99d5e2mr11696173pll.62.1674153478944;
        Thu, 19 Jan 2023 10:37:58 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id h2-20020a170902f7c200b0019327f40bfasm22642329plw.119.2023.01.19.10.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:37:58 -0800 (PST)
Message-ID: <b49d7759-a8df-bfbc-7568-afb7f6141e02@linaro.org>
Date: Thu, 19 Jan 2023 08:37:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 04/15] tests/qtest: arm-cpu-features: Match tests
 to required accelerators
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: V78o7n1Pl3N0

On 1/19/23 03:54, Fabiano Rosas wrote:
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/arm-cpu-features.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
