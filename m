Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp62531njb;
        Thu, 25 Jul 2024 12:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGcF1YPLDJ9bqPvObkQsxN2mnOzKQ2zDh3H+wxDIjzvj1Csx5vF6LIDIl19HKjI4xfjEd6W0mll8SX1Ipz+Ctudqh1GsWt
X-Received: by 2002:a05:600c:4f51:b0:426:61e8:fb35 with SMTP id 5b1f17b1804b1-4280550c40bmr26686795e9.4.1721937485350;
        Thu, 25 Jul 2024 12:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721937485; cv=none;
        d=google.com; s=arc-20160816;
        b=Zx4I8yFILN0WLDCJg3g415a2oE0K/b6W/YgCV4BaoHMC597zpCzka1SY43h7oZ7OO8
         6jY8sHN+qmWqCrdu2Im28NxZS4PYQfjd0bfc2YAlbQ3kpPZIFUa7u155AxZE6dzYNgaV
         sTn/PaOs5s2yfLdt6hGf0c1U52zcfnEAo97Y2yNzS9u9NhGPeIlArvTJtWu69/RNJ1vT
         pSf6N442CxwYRLrxL2SbdtiFlYsunwO5Q+XOut3VDKjU5Y5nmCU5zopc/GbZmbbSx3fw
         yE3hDtMsSiIJ6Wqf9Elp3VEdMajI+AFjNUphnYRvpFx9ImtGhw0EcWWpNn+hT3NVtz2C
         jusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=08E/n+GUDqaYs2L55EuvfBFjhi4NdHbtQbAAEoYvT6M=;
        fh=hsE/PoYlVsOhjvxMwbjAhtmjX1eN8BNHQomlKYtzMow=;
        b=s187g4v2cxsQkqqRZxh0PsB686iUpgqcumm12ZUMWGH1cAhG1mYJyPynoRfXpl1JQy
         EvfAIj0bJpnvVX+8XT84W1vYp1D8JC/mdYTLH/Dm9x8w/KuSk08HH1ODGNKldUUyh941
         2flJ3cis2KC1ns2f7YaXWbWyj8/alAhEkaHU/ZP8RrYYg9choTOsbutTv/VWGAkG9rZn
         sJ6Qyx3sc0HeMLhmehpvdnbiVybCTZrb04eC82DTTLyQ0cYpGhvA2Zg1Z0hoPCDnxilg
         LJ3CpKLaTkF4OlfE4JUJPFHCZs5oXTnGnoLSKgbVcBAimTKSGQ79CHokKeD48pyASbyi
         HhMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzToVwVv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42806ffa8f3sor5709985e9.9.2024.07.25.12.58.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Jul 2024 12:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OzToVwVv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721937485; x=1722542285; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08E/n+GUDqaYs2L55EuvfBFjhi4NdHbtQbAAEoYvT6M=;
        b=OzToVwVvWrBFQZKgr010o0txLBWsmadjAfOwZL96Xn6JMmBrFkoGz4bv7VM71e/MZ8
         AvyPzYcQYpgTgkjUQCt3MZYZu0lLYWbFQSWJzmOzv8Qgh7FakkhTi6nNW7cqnO4KOe2P
         FjwTAs9zfujzE8YroQzrjru89J0Gd2YTVZOK0WapYmWjIWSX23jBvWyIZLCdHeN3rgOj
         dVkJ3+PfaH4fningo68u6GMhFfFEm88PW80u/wlGarhS3MZE+i0KaFgbJqblUejWfV9v
         z0vAVeZnHDgLQvCDuWhWT3DVEZNOpy/bk3gLaLJpPGU/dKDG18J8tnYeCqNthvcxEq+y
         34Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721937485; x=1722542285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08E/n+GUDqaYs2L55EuvfBFjhi4NdHbtQbAAEoYvT6M=;
        b=FU+Jzxje7b0ANkJYsrWykjwkAbXacgof/tau+77lt8J2HZdy8hvYOo9WPpWCKLJJsT
         3K2XUPh1J3dsv15kM/vGsPYJQJSZRXtDpRDa/mY25L+G7xX6tXLw57LZ2ERNbrOKEttS
         MlY8BFWqu2XMLqIOeOU4J97AfPMU+xMwyDIDTxJvGQMXb6mhW+DsAgrRV6xUVqJavzre
         jpAQWoLq5ZQFPnKjtqeNBY8/mdZTwQH8sIGivjLdOCgOFgjG6oRCqCfXxs7DlCYHIXba
         HvRlH5OmHMPKfYV9nUd2i4XhpJlno16qTr27Te+WX1m7Lpcaznqd9NoffOo6jDZceZv5
         LF9g==
X-Forwarded-Encrypted: i=1; AJvYcCVtFj4kTHggMTuQ/iQqPm2HrIE5pXW93NkaJ8n1V/LQ8t+Qd18qlvPhqlkY4BSx6kboUeOZHkVRE8Mu0tkzbFVE8119X5wD
X-Gm-Message-State: AOJu0YxCPS1acjaJwzquL1IRnAxHiGvSS0xY7xeTqpucZAgoZZMfF/JB
	TAKkIVeMQWKG6qiY7luTvr/im7XJKomd7+fMqWaK2HH5mKzqeDAAAp2p0uHKQqmEsQ==
X-Google-Smtp-Source: AGHT+IGMyU0f9+kVFbmISeNr7L1KMhVjswFa5Qjbq5K58etVaEKUuWrg1ZkLWj10yVr8YEY0lIc+hg==
X-Received: by 2002:a05:600c:3549:b0:427:faa6:5648 with SMTP id 5b1f17b1804b1-4280550c3cbmr22056595e9.3.1721937484732;
        Thu, 25 Jul 2024 12:58:04 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.216.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f1f52b8dsm78004675e9.1.2024.07.25.12.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 12:58:04 -0700 (PDT)
Message-ID: <3601c8e8-4e45-4e91-9ed0-ea57ed8f90da@linaro.org>
Date: Thu, 25 Jul 2024 21:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark
 logic
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, richard.henderson@linaro.org, imammedo@redhat.com,
 andrew.jones@linux.dev, david@redhat.com, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, will@kernel.org,
 gshan@redhat.com, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 npiggin@gmail.com, harshpb@linux.ibm.com, linuxarm@huawei.com
References: <20240725145132.99355-1-salil.mehta@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240725145132.99355-1-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LGubTr3pyEMb

On 25/7/24 16:51, Salil Mehta wrote:
> Loop should exit prematurely on successfully finding out the parked vCPU (struct
> KVMParkedVcpu) in the 'struct KVMState' maintained 'kvm_parked_vcpus' list of
> parked vCPUs.
> 
> Fixes: Coverity CID 1558552
> Fixes: 08c3286822 ("accel/kvm: Extract common KVM vCPU {creation,parking} code")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Message-ID: <CAFEAcA-3_d1c7XSXWkFubD-LsW5c5i95e6xxV09r2C9yGtzcdA@mail.gmail.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   accel/kvm/kvm-all.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
