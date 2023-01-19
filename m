Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp588410ejc;
        Thu, 19 Jan 2023 12:03:10 -0800 (PST)
X-Received: by 2002:a05:6402:174d:b0:49e:4b8:f6ab with SMTP id v13-20020a056402174d00b0049e04b8f6abmr12374246edx.8.1674158590276;
        Thu, 19 Jan 2023 12:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674158590; cv=none;
        d=google.com; s=arc-20160816;
        b=CahK6KRjWdbXTJ2YmKV/372emXkvk4cZXp0t1zVmyW5mzF4paOGLrOfRLBeN9uF02G
         JK6W2ar8BbC8nwQhqeWM8BJR8DkNzR2hjFV+tVwixBnUDT3GjGowj3ADM7Qw5xTP3Y1c
         2vGF+uombkARRB+Piia1nvhy7RmbGYUc44N6oqkDlkxdxMTl2V9bWQW+YpgAEodNGu91
         4PYfX7DUntjVjDpvP9Yy5QvAcDlzSbNe2/EM1XnMh73ZjLnRo2h84EKxAVH+e2zzG7RB
         EqY9Dm2p7vktWGEdSvYpATVEc9oeB/gKAe0pgZ7u0z1YpLb4hyoVCWb3KdDLtq0IuQj/
         J7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=I6T9dE8zcSzT6NjfpdIy+5Pn0k6HXC65u6ITUAmV72s=;
        b=nuKrTpiLEGLXsI6PdZVvVlZ1kex9SWy37WnsvNdtLONxTRrqmvRgYz5tNywmhQCrCm
         bN2cgedT+Gq6dJmCvL3LiIjcg41uJV0CIxwdC7VtNy0rWmn327ckqTppvX+yJnbC5Mpd
         0T8qiPl9PCKZMJyKSByo9ELJ8zS3b5w/of9aMBl/Actkx3mdrLAp/D3Cy7JQjSFrVBsM
         atXHGjlx995XYXVn1X9ysNTCYGVG5ieVq1o2vO6vHhrb3b7s/GEHxbHgjs2xNdMpYgIn
         IyBUdUdd+E9ZX4p78Hpa9Ky3Nns2JhzKPNqcSUPQ0svKjtHRZ/UWsLv3iFLvVKplVFVs
         Ce4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bS+oq3SS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n13-20020a50934d000000b004800097d712sor22033235eda.50.2023.01.19.12.03.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 12:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bS+oq3SS;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6T9dE8zcSzT6NjfpdIy+5Pn0k6HXC65u6ITUAmV72s=;
        b=bS+oq3SSJQEPsEw6/QX8/ELs6icWAiglfX7L/jRmB1uqpwVdR/xgPNH6OIuoJbL0/h
         HzyuE34ean/37t1JKTCq3DfdNPCIx7EZ1xy4NNOeAZf0gUeokM1yo3tUcpI3KGNpTt80
         7ZnQ+e4qRhpJgEm3yAw7lkOBqnsUF6ifWHAj33Pw21usqz9tpHcLJqEIgelbrNbm0bBv
         yMmZA24TCham4kmSPaO3rVmrPkp0YaUTZcyIse/sfe7BTNAXThx7sL+vftKHVi3bB5cC
         Oafm8IxBlBo41kwtT80o2MxSXYJrSxOwyLVo9jmdX9R68XCC4QEC9yMaruIyezIypB46
         om+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I6T9dE8zcSzT6NjfpdIy+5Pn0k6HXC65u6ITUAmV72s=;
        b=5ZVGVAiRkgQ4JeF4v/YXIIQkoorhnNdhP83Zgdf2CwYPM9kFJKQAZ9WXb166+80wy2
         Fs+W5j5vJPH/EHhEDO6Aw9O482ksAHr5lbkIU4JHit+e6rzTR2wN1gpNnNLx+b4MJcwK
         7e1c4IN4k+1NkQhDWs4s52z2ouO7gIQQJszwQZ3Mhn81kTgd7ctXh2C8JAM+3TNAK7zX
         QbTTel2gK1mNzI7/YQsIgRawzg2rf+UDeTbIYdl/f7v8mZILxZyMLrwMD9BUuXoEUNV8
         6BmJ7aOgZyJzvXw4q8Z5ykrAEu8y/VmNLR0nQYu+Niy4l47fRFGpvadP8KmL8YpZA1s3
         z92Q==
X-Gm-Message-State: AFqh2krx3uJkV84EK0OK8y15snBqn5rdEx1lwYV9Zk29gD0K6nMKJlp1
	jBcdRFeD37zLwvhhrGr6Vlxiefn9
X-Google-Smtp-Source: AMrXdXuAU47YqXolub+EQMlCy87UfpVP6k4vPawVb76vQGRztM4JQy2OCUm95eeBa4jy962OAfWT4Q==
X-Received: by 2002:aa7:c84d:0:b0:499:d374:e18b with SMTP id g13-20020aa7c84d000000b00499d374e18bmr11914996edt.35.1674158590028;
        Thu, 19 Jan 2023 12:03:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id bc25-20020a056402205900b0046b00a9eeb5sm16105736edb.49.2023.01.19.12.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 12:03:09 -0800 (PST)
Message-ID: <440155ee-4782-c7fa-6860-c39a983aecae@linaro.org>
Date: Thu, 19 Jan 2023 21:03:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH v4 14/15] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-15-farosas@suse.de>
 <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <216d61ba-d5a4-f701-0190-0656e7e2e40f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: S/7yZXt47zUD

On 19/1/23 19:50, Richard Henderson wrote:
> On 1/19/23 03:54, Fabiano Rosas wrote:
>> We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
>> and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
>> default.mak anymore. So reflect the change in a Kconfig.
>>
>> Instead of using semihosting/Kconfig, use a target-specific file, so
>> that the change doesn't affect other architectures which might
>> implement semihosting in a way compatible with KVM.
>>
>> The selection from ARM_v7M needs to be removed to avoid a cycle during
>> parsing.
>>
>> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> The linux-user build does not use Kconfig. Is it worth it to add
>> support to it? There's just the semihosting config so far.
> 
> Probably not.

I hit this limitation last week trying to restrict libdecnumber to
powerpc targets.

Fabiano, do you see how this can be done easily?
