Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp419024njn;
        Fri, 10 Jan 2025 12:54:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7AJxCG0z+ch+HSK3Hm6msfj9fAjuSme8cCML9CLFQ5+my8Cch3ncyAg7UheP1+vEAm5DzWA54jZpgYQ==@linaro.org
X-Received: by 2002:a05:6a00:3a01:b0:727:3cd0:1145 with SMTP id d2e1a72fcca58-72d21f303f5mr16616572b3a.2.1736542483607;
        Fri, 10 Jan 2025 12:54:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736542483; cv=none;
        d=google.com; s=arc-20240605;
        b=ab7jozaBSJrWVrQpDMbZLUw2/ZVQ7xvfHki2QXlpqlasC8WddAX/YVVXkqkuMXm5JO
         coDfsJr7pQapYyw0pXp2wh4qMfrebh8c0QSla2bfhxexQBuTvGkFBaSVw0LSW3a21cvl
         bELJd2eEa/0EDFHZ3zps/Hmk+UrS8PIuhQau3zKqhA59vZfOdPodX4wjZ6tr6Ry9e+Ig
         nwyP95GTj1A3fSnsKvS36q1WAy6ebrDlNDDO7IYjfe/zzzSd8w79btIGBGJGkq7Ho/DK
         PFDvRBSeBnqhRU/XL2pp5nkO1py2h1Z4kQ43LHlmnKgiYdQONKD78W75iGNkD5UMdCxy
         1e2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wnI45Gafi5e94R2yPfTBP3ItS4HN0Haa93szS2IrM74=;
        fh=9I/GEgH49tc//wLN8VsgcL+W2S516l8b355w3aFtfZ0=;
        b=baZhjsQgx/lPDDodcvsv84ATHWU9md5RrAjUJcZ6tkNIbIdsE2ykVIXOwodrwPDkAf
         yt/zS5Jvtnh/9Oc2KzyhQi/DdowbzSe3c5O+WpyVcfrFlpHBiqo6dMaCz5sL00KldKrh
         on9M20hcp/IPUtm9sZ9vdTQUk3KSoi9L+Opp0Kf/2l9+ocJnLQMJkS3/c+wSrHSuL25s
         W6YOXff7id5khS3mNLG65S/DtkAErr/cfvnEcjQgEeofUjGW8JrQ5+bCmlxNXGvO5w+a
         DD5HjFT8DAybzwEyCCeCqyVzDf7Ltd9TLRIbcgMvYpFS6BTldXWDGVXd6wDPA9fUN+7R
         t7mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UcysrTzE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-72d33fe1e5esor2583446b3a.6.2025.01.10.12.54.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 12:54:43 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UcysrTzE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736542483; x=1737147283; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wnI45Gafi5e94R2yPfTBP3ItS4HN0Haa93szS2IrM74=;
        b=UcysrTzEKc9eXHG62d7Vm6qfsJdSExaq1tbn8sRnZX+XRcJIPJ0nEh31EW9D0cdamN
         j3KXA9n7qmBPxiwsnUIvqt4/esyD4/3Epg49IDnLGWzF8VVOYDv2cPwFFOyOVhxrbjNj
         Z7kADWz1aX5rI1pfIdOuKcaVmP6NesODmSrDRFJekEvSF+hGkMbmJOFYiR/Ys/0A8rQB
         pudJkjgtPery502m0oyOigHPUfoDew7tPUfrHEwIJHfZW6UZDYjEm2UewqNIaTeLllGY
         2eDLbuYcygQc67N3PyQq5j8/QoV9O9Cpu3WmoImtCaW1AhVBImNX7f3MWDXqXhzJWoSr
         VaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736542483; x=1737147283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wnI45Gafi5e94R2yPfTBP3ItS4HN0Haa93szS2IrM74=;
        b=k+l78n/BpesUkT4huRQ+g2vOiD6OpGw2N632EBC7K7h6xiCr7kmFFhmkTDURr8xdsx
         mecx4bfkYQk47L8NOewSDZChKzIPW025/yPaEGW9yRWbVI1EMWFXqKAFGP3IHqhE3Ubq
         gVp1OJ483ClUCpPvmy2fMFqbQhUeCB5bzLyyXsAKAVMr3Cz5Y/C+27jcSvHyguH3ebR8
         3VxDLmhaa2r+i+QZh4p7M+6M7gk/1qyzwJGBX30ihPD3F972mTlvYdM1I+UO2uWGpOPt
         1HzSYCCItmydpRgFHSIn/4GESBsn/4fTkstnPuKewJ8P8sECatf0I1Qn9lFXH10h8uay
         4S7w==
X-Forwarded-Encrypted: i=1; AJvYcCVil8A2POvx/Dv36HAE9sP3qOk7f4aMQWgMgSouZdgil35I7mmrsLhf1mVT7ABehCvMPlLMzSWfZ6JCXw==@linaro.org
X-Gm-Message-State: AOJu0YyJ95+gMhaPq47nxHTv8EJeuHuw+BwFQhSjpblSP+et2K++mAWB
	8zgMEyNE7je+WfRnLQLFpBXoIRobIvPVLBUyYvzyL25gYzg7xRmkuF+PBhmqOGnvsg==
X-Gm-Gg: ASbGncuUhTmgz8BT2uWlfKcB7+6KszpfpluNiikTGG/++sNOi1eBrsmt/SVPJx9ZGss
	3Y/2vYSkUKy8yxi0nlG2kOJJnB9G2Hux8dVfpIin0l+m5jTEX0TO7m8EGpQDgVkk6KbDLgTk7rd
	FiBafw8AxR0aqiSdotDp5jx2YHdS0+hLn8dG6de9C/f5RLyyWMe3vZ9WlJcPvS/+V38rawee2/i
	i3MaawqeBMjih66ql0FftiKQToA/rZA2s4jx5kBEvApQ+8+LtFo6drQ/lgsEGRjmsrq6g==
X-Google-Smtp-Source: AGHT+IGv2jkM/DKa+O6BfPbdyUHiuYK/x5j8lJh5bUcZeZX/EeAIWsFQtN8DDXRmuW+G9QxvMu+P2A==
X-Received: by 2002:a05:6a00:35ce:b0:725:9f02:489a with SMTP id d2e1a72fcca58-72d21ff43e7mr17143661b3a.17.1736542483180;
        Fri, 10 Jan 2025 12:54:43 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.67] ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e5csm1998402b3a.143.2025.01.10.12.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 12:54:42 -0800 (PST)
Message-ID: <58e2f5bf-2312-4064-87e6-4dedbb7f060d@linaro.org>
Date: Fri, 10 Jan 2025 12:54:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Change default pointer authentication algorithm on
 aarch64 to impdef
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <farosas@suse.de>, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, alex.bennee@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20241219183211.3493974-1-pierrick.bouvier@linaro.org>
 <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA_ChARwKyvRXsEk1U3q1T2528753Eu7LgDSsDbF1s5tNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: e9QWNVAS5ZXQ

On 1/10/25 08:28, Peter Maydell wrote:
> On Thu, 19 Dec 2024 at 18:32, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> qemu-system-aarch64 default pointer authentication (QARMA5) is expensive, we
>> spent up to 50% of the emulation time running it (when using TCG).
>>
>> Switching to pauth-impdef=on is often given as a solution to speed up execution.
>> Thus we talked about making it the new default.
>>
>> The first patch introduce a new property (pauth-qarma5) to allow to select
>> current default algorithm.
>> The second one change the default.
>> The third one updates documentation.
>>
>> v2:
>> - ensure we don't break migration compatibility, by using a specific backward
>>    compatible property.
>> - added some documentation about migration for arm virt machine model.
> 
> Other than a minor change to the 3rd docs patch which I'll note there:
> applied to target-arm.next, thanks.
> 
> -- PMM

Thank you Peter.

Regards,
Pierrick
