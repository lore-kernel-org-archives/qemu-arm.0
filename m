Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp486306lfe;
        Mon, 16 Mar 2020 12:52:52 -0700 (PDT)
X-Received: by 2002:a17:90a:7f95:: with SMTP id m21mr1193281pjl.168.1584388372238;
        Mon, 16 Mar 2020 12:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584388372; cv=none;
        d=google.com; s=arc-20160816;
        b=dUU6Mz9S9/vzoaSOEzfgAIBPqZzcP8yxAgBvhZRrdGSzA8mGV9Ax1H+o+0f1JltV/k
         4mDOcpH+yEgygqvPNNGjT7eaMrJNtQmaEjJzCpWwtFNa1rXXSSOYVEM8YDizO/X56Qlw
         OYhX5xTDHZaWs83B1XSqNAlORsoen+sD7pjOfjCvYL0IhsHznm8mk6r1JzcB6+BdvIWu
         FOg7vlbvxAQxRIhP3iBx9S7SX8o9x27x6KyR0utqpoaeXElmc6X7VD8CTyt/pGXFAIvI
         yM3zmGQIM1q47UVSgnUblhvyhIYfk/rpvgnmGx5h5UNaqXkxWkLl28z6fzm3T6/pz00F
         zjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=XSjEqM1pkBNOiCDD3KKMFDmPsx6HNqfksrbdlb11Ou8=;
        b=hLGzZFhmJuTe9BVVujEXWfKxZXHWtX0YB1UzHiZmmyqEeqCKgpxDQ/A4jVklx3eMdF
         sWNvu8wTOMw/AO12dWwlB/NFQ+zEOmZOIA0QWJuGYKs89nafynLjawyfofnbcWkeOPrr
         RVKjjvPSzp1lN1r5f+TEB30z9P4cUOPrPvq2IjTqoSHyaD706WguirXhB5wxZzKdAP4g
         HQPW+0Z7sDnlXusDi4B0NfwgleNshvK2R7pdxDuSkEsbTG2R9j69AyxpgGamOSZObLFf
         m3Q1lhDoWvBl+CIxFfKvImhfKIyUzIi6NOj2+2ZYBsOVvmUtKGEKc9CcFNXlBkoglUE9
         mPjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gwk6BbG/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x1sor1156347pfa.86.2020.03.16.12.52.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gwk6BbG/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XSjEqM1pkBNOiCDD3KKMFDmPsx6HNqfksrbdlb11Ou8=;
        b=Gwk6BbG/T8f3eN13G9OnikR2IhbOtZYySgqLI6oGzGzX/SSL2N27F7fS4vW5XphLYL
         Lgoc7yfCuFcx8aWtqPTyy+8JQ9L4QSkEBfqFT7ULWWu8FsibH/2kRuWFeVG/bOLE1uhW
         xnXLOTObXStrqlbLkN1GKQPiXziVFs4slfjkMzSeMkrMZCuojJUtwSWkFPJRSOZX+d1z
         KdUajQP3fyNnjIkpVY8yIv8/xS3FgjoyQ5nsyaKb18JBYhYN8LfDyLyXgUroNC7sbB6r
         tum1yASvPUEnmC3qOwEYj572Nu5IOgyLlWvba0cLCU8PC2OJib8jzK2lomvL9EWtHhx3
         Mq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XSjEqM1pkBNOiCDD3KKMFDmPsx6HNqfksrbdlb11Ou8=;
        b=Hp9dzmBwoXq6eHLa4UbdXaTXgRq3+ULJMI4UwyI7OmILX/hnzdHlDOIcEFzUmYq9cX
         w0zOTeD9ZUKUw6Ri1766vCtEcDlCXTyKYOqNsFNK5j6NScZXM74IOoK0PHf0fYP4DgXi
         h5Olqt+CJvKiS+icsTdthBtRq5+By4rFIegPBYHjCnf4Thi9KWKOSuEoFUQ2RUj9fyFZ
         JGZrVeXQS/J49r+C0hFmw1oSBy8kFBqW7/FKmT5Ui9goKIvRW2O/5Q58uJiRTbhkeOFg
         biZkYeVO6O4LcAfIiEcItkoBIDSWOYZOv2YZbUDw6Z1mQYTua2kDVyzjy/j9qNKlybuD
         IU2Q==
X-Gm-Message-State: ANhLgQ0s0cAW1HB+yxur5nYjVli+PzDVx1SR+8gW4aKNSWQBLpLEAOdB
	oGRadk+p73+Q3p5Hjm0wuYBnlxjG
X-Google-Smtp-Source: ADFU+vvijoQC/afij+HOEtKUgij1P27ugBHOV9BUVP/3wT3gYK7jYSwQx2OzJQnwoRsS6W/O+au1/g==
X-Received: by 2002:a62:7d11:: with SMTP id y17mr1251492pfc.127.1584388371660;
        Mon, 16 Mar 2020 12:52:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id o11sm558996pjb.18.2020.03.16.12.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:52:51 -0700 (PDT)
Subject: Re: [PATCH v3 11/19] target/arm: Restrict ARMv5 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4ee60dab-8799-0174-65f0-3d516fa3de30@linaro.org>
Date: Mon, 16 Mar 2020 12:52:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rwzY/zBTZ392

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> +static void arm_v5_cpu_register_types(void)
> +{
> +    const ARMCPUInfo *info = arm_v5_cpus;
> +
> +    while (info->name) {
> +        arm_cpu_register(info);
> +        info++;
> +    }
> +}

Similarly wrt ARRAY_SIZE.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
