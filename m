Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp325846ejc;
        Wed, 25 Jan 2023 04:14:41 -0800 (PST)
X-Received: by 2002:adf:f852:0:b0:29f:4e42:33c3 with SMTP id d18-20020adff852000000b0029f4e4233c3mr28115366wrq.56.1674648881642;
        Wed, 25 Jan 2023 04:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674648881; cv=none;
        d=google.com; s=arc-20160816;
        b=GiEm5m5i1UhD1Qm3zB6rH+OPkxUuvqG6OQONXfDAxsufh+X1hhus07rvpvB/7czuCA
         AL+j355vWu1Gea576YBUs2+3iN5wYwLMJWBA7h9kTnpLE4ayKlAndT8aK1LwfGB9I8DB
         JqpHV6fWc8TvY6AcOhp0b1Vb83I/8FqZiGg4pgAtEDulaq0JV3KAVphzIDh06lHQvZAx
         BXfYLt6BGU5S9sCXzgzMp0+Ux6uP3ormTjxyU60KTYZ2SnFfWL4Ell8k/Cg+QwLwPYFr
         ebcJpI1Z6U9fsyZIJo2mqCatSc+avh6M/ZkyJyJlXSME8oeFez5y5180cZ+P8Y05mCGq
         jaXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xhb26r0g+ueN4ZNmdQEagPvQ+a1A1H9R0Dz0H7Jxv7A=;
        b=U0mFWF+bwcwQrTrcIm3ZCaewyhnLxGyGb0KCPLaXF9ZescJluPktV3/oRtoH/I8V2t
         163+h32fC1Av/4cuO2+jkLtWBz4avrjGENHRkcCc0zIKTykzMOjhKdcuILp1cfuK7MHt
         2uMpVfxQVJuuCVp/AuluWNOzWw7LzULO0hZS3Y17XXsAoDnYwy1ohZxDoxy5kC6jDUPQ
         rWFQE9y6KrMIK1Z3oaIRoelmKT5j3JDs3Jb/2EhOoImKhH2MEMVoSGztAcnPPiN8q0QS
         WGMJYMDhl+PLL+xJZl9alMojJRL/6DOBh5I+5XhePlNxzzMdUpUYv0/rUe0NWidxM2Xf
         v4Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=guhMwydP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t11-20020a5d690b000000b002bfbcc517d3sor523360wru.62.2023.01.25.04.14.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jan 2023 04:14:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=guhMwydP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xhb26r0g+ueN4ZNmdQEagPvQ+a1A1H9R0Dz0H7Jxv7A=;
        b=guhMwydPepfzwGA1kGpBuR2WhVE4IWtEd2jT4g14TC2S7FyckND18Gzv0HhKmqeSIe
         ooSs/yF1LsOfJt6Fiq2TpvInaBpxfDlVPQBeg1A1jkSWFu7Eff0QNrAlEHakep7Aup3m
         sz8Z0C6GHd+KOG5n400W/gwzQlTIjOp2rBlN+lLwpjri4fP0YrAd/0t6cp+wn4kroIjF
         e4KsmLzsecMYuXP/esYy3+MyhbcIFXzROsXbLGFScMl8HEP1I71o04+3qRO8OuTr2q+7
         ZxiwbtnAUo0RlO8Id2IF3e/jEV+kz3pnBRDL0sBl1oyxGNkWXtUOJha8e/SES63RiWpY
         6rPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xhb26r0g+ueN4ZNmdQEagPvQ+a1A1H9R0Dz0H7Jxv7A=;
        b=Isf88mQR07IgOhOunRQY3aySwOrimS6bla+fnsYnHFe0KMgpQaYixKqqUdX9Nb5W5k
         IlzHpFZVX42puAtG6IsTn+ZEpcbiDiIynerWoALK299MprK5u6QiyNQugFgYoogkuhL2
         fTKVRwqnuPnshwtaW2a0wxXi3iUbwwxrdVDOQhOiI1id5gEb1EiEkLjBE6/9ZWPQ0Fjr
         RnLebCKK7DgRyqxDZq0zOR0gSBzVX3gcZ8mhv2EiuSi6T9TO6wNIxmzPmF+RVKd76JcO
         4fMCKzyWtDoP9uZ62SlBQE7oUAgG9U2GbkyLAdfB5r1Kq/4im+hG5K5JahLRszzZlUPy
         LBXw==
X-Gm-Message-State: AO0yUKXXyCXhTgYzQMC3SHmzMNmSLewGsxRp33T8PwXGfTi6BSthld/I
	aaY1PeUr22uT6OO0XR4ODSLB8ERe6YHeFRbZtDB0qA==
X-Google-Smtp-Source: AK7set817PJCJzgC8tRINNYNqO585/eE3u97N4YwBmalYUZkfjPj4GhJfW2GMCZxIxJbK1bzFzUD+Q==
X-Received: by 2002:adf:f7c7:0:b0:2bf:bf27:2dc1 with SMTP id a7-20020adff7c7000000b002bfbf272dc1mr550731wrq.60.1674648881013;
        Wed, 25 Jan 2023 04:14:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.0.114] ([196.77.22.181])
        by smtp.gmail.com with ESMTPSA id n21-20020adf8b15000000b0028965dc7c6bsm4199593wra.73.2023.01.25.04.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 04:14:40 -0800 (PST)
Message-ID: <e167b486-9616-6eeb-0aad-fc94f08e6b32@linaro.org>
Date: Wed, 25 Jan 2023 13:14:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/35] tests/tcg: Use SIGKILL for timeout
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zpvyTgROURo2

On 24/1/23 19:01, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> linux-user blocks all signals while attempting to handle guest
> signals (e.g. ABRT), which means that the default TERM sent by timeout
> has no effect -- KILL instead.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230117035701.168514-2-richard.henderson@linaro.org>
> [AJB: expanded commit message from cover letter]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/Makefile.target | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
