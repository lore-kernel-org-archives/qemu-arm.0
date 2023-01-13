Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp712819ejc;
        Fri, 13 Jan 2023 14:14:09 -0800 (PST)
X-Received: by 2002:a17:902:7406:b0:194:5e49:d941 with SMTP id g6-20020a170902740600b001945e49d941mr8203197pll.47.1673648049525;
        Fri, 13 Jan 2023 14:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673648049; cv=none;
        d=google.com; s=arc-20160816;
        b=cY5VgmhiXS2PldJn/47LWWhPSTXEE9GBv7majOOO5snzk4PNwCwBSks3dYqOGs8rW1
         Twasoi5gqY4rip51lHxCzVsY2cn9TQahB3Iqj0RSNvfxzcIIyosOGhT3c3Na6kOZEhYW
         PfM/sz4lFbmb6ldusnHTd9ym2IP0OxJ3lxANxmp8Kld/ZefyvEaJQQ/A6ZwbP/PHeSX4
         I7f2hy+Qy9tdunUlgsGfo3LkGbPPlsGJxu4agKNkQiHdt6hTqdiFUW7BLrGNIRUSHWnO
         Gy9m0tXCAwiAEgI31gAEzMy89rGdlCO4bSXakg1z5D/78O2LCBR9hkJ9Kc4vdnXU7uWb
         ZfYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xuxz0pZIsP/uegBmwm+wHH1XfTE16OnsFkltkhaXl+s=;
        b=hSZGg3+NxOgiioHCYvgobY+dSOMcdeHFPp9F+OO3kGYd4ovkMQ9OSLm2qrqZ6KFxxT
         kR1yatbeeatsVyYL1sPh3asOAMWhJjel7uR5zpjMZs+Cm4T07gpNfTHO6ROc9irP4Ba1
         pcNaJPh+wm7C6iRAXTcvZzhrHMtMuy5U8x199vRGjtgoMj1NJWIuBadKBmIoy6XD2G20
         DvdK4now0ukYW3Ddh6cmpffUE2I2B1QISi3694wT3xtpjzoC1MCawAggK+ySARumkJvX
         ABAos9jdBLcxY+XxbtGB6H0i1JdZUiA7aASvYeGtpLYU7swDTWr2bA8EfRk0zZMS1Dox
         d8XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZKmPU4H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y8-20020a170902b48800b0019310b2b9f0sor10697553plr.82.2023.01.13.14.14.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:14:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZKmPU4H;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xuxz0pZIsP/uegBmwm+wHH1XfTE16OnsFkltkhaXl+s=;
        b=kZKmPU4HbUYXeim7HNsNP5/zy+rx/BJEEU78sItn4qr2D3VFK5vDG9HeScs4VZkzeE
         dl/cMjLNqG2sYMr0N7Mz+IuIIEAanwgE7+ld1IaDd+ydpstOPxD8DlIbipSXVA2GaUds
         OWV+nYXqXxHStUW3W/hiDMzlQbgGasEDGW6NOT2dkUrjmVrf96TZoRpx1M9QyN3bRhaG
         veZR9lFh1qDEgmPz72PjixWAn3x9WDHj1M+a56d/gqf0x1ybyGGqfcWW/97kcs9KDcW0
         H9orSVulqWTOKOAi/iTFo4uutoakEWBV7C+HRWbPYQ59cGnQWBS6oy7cyreTGIHX3vuN
         cUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuxz0pZIsP/uegBmwm+wHH1XfTE16OnsFkltkhaXl+s=;
        b=dq7v3o3aXYWgsHmQXtcHr8ZyP/0XDAiKmX/jkkqbwtz9JXXL6QJnRfjhh/gCtqZBKq
         3lJrfJcEalFQtxDPehbXAmjlD4K5nMqr4J9r7BkP6TMm4yiM+dQOpH58cSfb1v0v4BW2
         JsqfeidT3VPLtPYc1oWkTUr3EZP7NnzfXujQNAcsFgRV3izF7BaMPbXItbmCYnpge940
         904JMAOteUMwAtLlYmxP/9y5eLC71NHjyzl277bEBIaNu0ajsC1fDSWcxw5w56b5V+Vb
         3G2/D4QI5SSQKVTg5gcRu4OyeNrWaaNDRcmZdigTMuGEDNc+uPvfjmqjbv5abM59175E
         mrnw==
X-Gm-Message-State: AFqh2kqJ4aVgXynJzHzdT01ELq43I6C8I73X7ZWmNPFvQqki/94q1SoL
	jLiYyPVwHH036hIM+IyERWQfqevCkulqUhK0S9I=
X-Google-Smtp-Source: AMrXdXvtveUUiLKDToWdfyOGq2oZJhBQgzNgbtOhJT/PXg7X58ACRy2g4hTxuEJcFt8kDuo2Iz4dbQ==
X-Received: by 2002:a17:902:9b97:b0:193:b58:2b0c with SMTP id y23-20020a1709029b9700b001930b582b0cmr22567263plp.23.1673648049048;
        Fri, 13 Jan 2023 14:14:09 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b0018c990ce7fesm14671185plh.239.2023.01.13.14.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:14:08 -0800 (PST)
Message-ID: <aa023bef-2cc6-3738-6c00-a1260b919fc3@linaro.org>
Date: Fri, 13 Jan 2023 12:14:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 24/28] tests/avocado: Skip tests that require a
 missing accelerator
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-25-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-25-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: +FuHJu0b65Bu

On 1/13/23 06:04, Fabiano Rosas wrote:
> If a test was tagged with the "accel" tag and the specified
> accelerator it not present in the qemu binary, cancel the test.
> 
> We can now write tests without explicit calls to require_accelerator,
> just the tag is enough.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/avocado/avocado_qemu/__init__.py | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
