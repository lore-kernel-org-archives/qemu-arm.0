Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp711113ejc;
        Fri, 13 Jan 2023 14:10:35 -0800 (PST)
X-Received: by 2002:a17:902:e887:b0:193:e89:f5ff with SMTP id w7-20020a170902e88700b001930e89f5ffmr15700710plg.28.1673647834885;
        Fri, 13 Jan 2023 14:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673647834; cv=none;
        d=google.com; s=arc-20160816;
        b=KdpYK+sE+FehsiR1jZX4RZ6s9muuodNkH0pVXp8MfVohhKo9fzfCQXon9hOgGsWkag
         Sf+BiylrNQi5MSkkR7CKjxFtKILPAhtquyvrRG91GRLfTuZ31bXZ86VNmcrJoDN72abZ
         ylhjVQCwo0dJEGsQB50w6a5p9J+r9LhVbxgL5BLU2WyaslhcL4XtpaW55qPUQ9Iw5cS3
         i6qDRfDEGPJik81j2tA44wFfY+bTYR+8msIkej+NCyL2pM+qi86ccPAcnaGy/x0SqORW
         xTI8h4c3Qhv2fqPPEOqmax8TEeKJ/kDB4jV4sQwkJ4FKH+ybXVgZm5lFsn8HjSreFPzk
         Darw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KDkgJVUOGVqnbtkEvSCUgGW3k1/G5Qsgxm2rGoE3dQE=;
        b=fOkBzxQAR/bDHDSxAylxy9YScdAJ+i6/DqVqQwPdxUQ+DmRuimLbfS6mPm4fy8mGXq
         c+owSshUJE+uSX+qndxi6tXFAnqTqJCsociD4pDcInOwz0XsO1bT+3+JKF3iqPxosWMo
         pu5PHVDDJUjPW2tiBtnJPvZLZkAuDmzi6ig4D2hI0nXV2Ijzf/kqFKmZ6FtW8r9W1j5W
         H0mH4RGTCHQFYsRuuUf/eQLRwTMvtctdv2iyAnXEP8a0Tn3+Rlt2//Jrg4+LZakQa3qU
         9RZBsg7ZeLqcJvgtfNv+LsEGKay/PEQx17kNCRAYNh6QaN8DkpJyg7DvvcfnyoQs2XjS
         w7Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SERqJGtR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg12-20020a1709028e8c00b001930c15db14sor10755784plb.130.2023.01.13.14.10.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SERqJGtR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KDkgJVUOGVqnbtkEvSCUgGW3k1/G5Qsgxm2rGoE3dQE=;
        b=SERqJGtREB0Oj/3xzdY7JQptWJpmAB0rTjVFegDa4iTrk/uc9WSajyvUKpYUNp2dBO
         kN3d9yEKA5E7AT4PO+36NdR0xqiIP5fQGfpZpZwQQ7V+8hvniXf77im5TBQBMltUP9sz
         hJy+2ymaIyoEjf731ORMK9NnCMItQhY/gxbovlfVqGozHziyN2KcuPsmZ3ERohCmSwQD
         GHVkDVSUvFI2133Yjew4oFkLlkiLFJAGFT/ksnp1dmpdsw3C/SOtPUHqxwVR3yd3kr3v
         VqeoWcu0VZh/NF2jiqnKsbYQrPwdsLU7ivDdK1Pl9rwZTS67mc31BTX7dE0cyKQrsTn9
         CczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KDkgJVUOGVqnbtkEvSCUgGW3k1/G5Qsgxm2rGoE3dQE=;
        b=JaW3WamAxrnXjXIgdMH94rQZO7+w4GYb2ZXr68q9IEIQ2f673gEasDnPD3fclOb4Z1
         uqahrm1sXYiBVEfDnu+KWa72NdLhiVdp/kjU7sHJZzXc+RIuPH6/uqJagkBS/lGZ6pq2
         6Zy7ibm+ySO86Df4lvt4O9hz29RFBr5qDDkp2j0tnbBCvLH9dPfq4gKC3RRjJK4qZqBc
         TxJxw9yYFsXG8QAow7LxH3+2hcp9pfAjgfCFvybqt0tdtFwLsMokyKEAhu9dFZ6JPQWJ
         yRLIVrbG/HtEVEQBny3LMNiE9jzo+9ftQbx5fFRWjXRBbOJdgPSjhBeXafk3EYEzwbL6
         tqLQ==
X-Gm-Message-State: AFqh2kr5nxY5QfzePmw5ph03y9o4eGs0WpOT5R+qF62YOx0pVhrVZXiO
	GEKbkmCMvUQIGigtltEuPgkuMJuL/ZRePKeAcrI=
X-Google-Smtp-Source: AMrXdXvHQZlL1MRCm0NE409EueUE6BO/DKreJUanSkGG0cp1+A20Tr7qgkhCrvqdAh0jiEQmbZ48JA==
X-Received: by 2002:a17:902:8501:b0:194:63a0:54f9 with SMTP id bj1-20020a170902850100b0019463a054f9mr6736995plb.24.1673647834442;
        Fri, 13 Jan 2023 14:10:34 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id a14-20020a170902710e00b00194516b2d88sm5380007pll.260.2023.01.13.14.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:10:33 -0800 (PST)
Message-ID: <f63a77d6-c63d-7001-79f0-b31740cf6eda@linaro.org>
Date: Fri, 13 Jan 2023 12:10:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to
 CONFIG_RASPI
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-23-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-23-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 65dcY8u2KDeA

On 1/13/23 06:04, Fabiano Rosas wrote:
> We will soon enable the build without TCG, which does not support many
> machines, so only run the bcm2835-dma-test when the corresponding
> machine is present.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
