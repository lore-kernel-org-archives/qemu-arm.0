Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp732210njd;
        Fri, 28 Mar 2025 12:09:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVN+lJSkM+eedvi7FGjDRHwlefYljh7V+UKB41hCmxdSwlL3T2XALpBUGaAYV7bQ1vSU41HqrT1h5h9Tg==@linaro.org
X-Received: by 2002:a05:6808:320d:b0:3fa:10b4:698c with SMTP id 5614622812f47-3ff0ed03c5amr393892b6e.17.1743188987764;
        Fri, 28 Mar 2025 12:09:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743188987; cv=none;
        d=google.com; s=arc-20240605;
        b=C+vEmPDq5SqsaQ3J5rBJpeOvS8klchUGTX4j3PpZirQF+IdXDpneWq02g38e+4IUHi
         QzHnQwS84yByKqUHOYjjZD4gHkjqJVB7KyHZUrapswCkg9I1T05swMX7RjPb5GCFnQ7o
         +g3R+kbVCObdmidKMfxQN317NttQt2GZcLLe+qkiKM43ob0QE+SofmxqaBLKm5A8nT0s
         n3Wz4+ZufNTbDKg9+THhHQ87TyXI7wxWWEFNvppdr4ryxilsZ+0UU6aJHTnLSpZ/GQc0
         gzL3VQJ3qxrEnZ7g5H6yimR1vzudy2vPlqvvIzDo8kGYbw2BEgcdy9cJ3OvITANwoMJJ
         uT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=i0pkNn25HUpzF4wfTpeaHB2/k6L4VqHJEjzBNWGIc7s=;
        fh=BPQa2fYu0dBv8UQk6kncXN4gzKcgWfG27jSlGlcfULI=;
        b=HoJJg/KB3wftACDMi6sgzGPZKsb9k9U0nKHnSr9pG4twWb9+eKPEPrkVPknxb/7MUk
         Bu9AusnwJfw8+/G+i9gx9Esmedcjfun2+fPOomdfJvprAP0yw0wX5jtPqCX+MST0zQT0
         D2TyivKWIwSwcAsAUO+d3VmW9qOkY+x+L4153QzOZfaJXOha55d+OvcAza+vg6bQHNiz
         NBx308/qWOUOZTnKFce4WgIJGPXgLWcMWicvBF4z9p47Q55VV/iOujNFYJ8zsBT9vvy9
         oxTnkpRM9nbUih5lysezfL2QIK6sOK0G3nZOHtnx8yCQXgvsyTKGXQK6BvQleMIg2Bg2
         ezgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fVi5UTBk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5614622812f47-3ff0516ff7dsor904479b6e.2.2025.03.28.12.09.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Mar 2025 12:09:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fVi5UTBk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743188987; x=1743793787; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i0pkNn25HUpzF4wfTpeaHB2/k6L4VqHJEjzBNWGIc7s=;
        b=fVi5UTBkqMKTee6tyFucQwwGC5USJS3Ck6o5+sUDaiS2Fi0vWlSDISpuEMYPo57AGK
         ZZ0UTvWvPTXlAMCOaxnJEqhkYzyXU74uRXUQqGvM6paySRjQ1Nf4CfAQc7MPLUfuW4iz
         eIM3316/Jmdss1Qs5lC3gE6z9IJDItWjJnyslsEUmcya5jXSkhYB2Pf3pTDKrkmvNcsD
         RXugiI3iY5sXaf9Zp1dkr6HiE1chiqWhV2/1vuwg/3rHuRuOcRHxE7Pkeanv9cZP6Opi
         GkBLfBIabl0Vl83O/SXWqOOiDWNwDsIomG5FAu1/Xeanpz32AmDhIHW5KDKDU2cU/PH0
         9w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743188987; x=1743793787;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i0pkNn25HUpzF4wfTpeaHB2/k6L4VqHJEjzBNWGIc7s=;
        b=GryaLxI+5qnAGVzrtkC+dZ+7w+vm5+A6UoyHIG3XAAbpatbhmt+z6r76feBItzTim/
         j6Y6hVd9zs9xxx0xGMaaV61lQjvM0I0fQSdKe4ZSiyhlCpx2n4da4CuV9ecs23czBI8A
         7OpJVAcb7dwCeUzI5oxCrPlMk5ZglhrRqlTg402tQCjS5ZVHW/DqjBvJuFYyFDe7YRim
         7HHTdMc/AJByxBW6NnRXtF797VKLvvG+odSoWx1pjyJi0Z4lPAnPwxgwh8FbKjpP0dOX
         UuJYavGNz0cyGlZzikLtXUgBAECgtMH1Gy0SURRaXjEj9XFiiiEmkdme58sFPL8U0Fe1
         lBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8qRojz4EG0prEE02EqktZt4jolxLI8SxP/+YXMI3nRBweGsUzpVMGBDw6xp0ZcE/C3aAosNcaZMTJaw==@linaro.org
X-Gm-Message-State: AOJu0YxXc3+fevN84UXlb+Tjj6Viv8/GcbmfPSdya13AvyfIgF+PMXBR
	INCSwbYGJU6OKqjX/mSH/JrKrYtxDCAJMZ5UHsnPMOiRHel4XKB3OnBsg1nz+nEM2Q==
X-Gm-Gg: ASbGncsTB5vX/ungFT47kn9yw+89hWjNmdNm4e1I6vUq7kbCqgi5COLpauZpJY7QYey
	uAl0HpREDm0Fma4bDXzpqyNQa4euIzbLeSSb7GQhZFORfFHrd23yyrOI1T0M7JXhzeGALtV0Vnp
	3XufBcs8x9c2IVGI6atXH+mDx64uAsjM/xzQzQbycu0tgT2jeeUCpTt/b0bkB9qZtXAKBeZg9Wp
	HKzrAwsM3KwDTn3pVQ655OZlUIkuD/xhqCeCaBhjhl74ALfv/FO6yoDfbb5glT72RAVshBOPjww
	EaBYELx2NoEFKx2ykH16el0i4Bm8nRDDR3mkScyjR8C3D42vH6QJS3oGpBNmjAu8lG9d547sUgJ
	6RFxzeq7YFCewWgGoqir2pQ==
X-Google-Smtp-Source: AGHT+IEJuBqpfVJSqKSWvwJkyRmirpRVWtacAIUF3uTfxr02T/HFWO6KK5fCfteLQ/0TeGILfM5g7Q==
X-Received: by 2002:a05:6808:19a9:b0:3fe:af0a:a264 with SMTP id 5614622812f47-3ff05c8ea80mr2791593b6e.7.1743188987165;
        Fri, 28 Mar 2025 12:09:47 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.102.85] (syn-071-042-197-003.biz.spectrum.com. [71.42.197.3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ff05185823sm441662b6e.17.2025.03.28.12.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 12:09:46 -0700 (PDT)
Message-ID: <de560d94-d7d8-4e49-b4c4-68341c2b0fbd@linaro.org>
Date: Fri, 28 Mar 2025 14:09:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/functional/test_aarch64_rme_virt: fix sporadic
 failure
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
 qemu-arm@nongnu.org, thuth@redhat.com
References: <20250328183816.2687925-1-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250328183816.2687925-1-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: otN7/z7Lctj9

On 3/28/25 13:38, Pierrick Bouvier wrote:
> This test was randomly failing on our CI, and on dev machines,
> especially with QEMU debug builds.
> 
>  From the information collected, it's related to an implementation choice
> in edk2 QEMU virt support. The workaround is to disable KASLR, to avoid
> accessing protected memory.
> Note: this is *not* needed for the similar test_aarch64_rme_sbsaref.
> 
> More information is available on the associated GitLab issue.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2823
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   tests/functional/test_aarch64_rme_virt.py | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
> index f4ad4d33d58..a1abf584f0e 100755
> --- a/tests/functional/test_aarch64_rme_virt.py
> +++ b/tests/functional/test_aarch64_rme_virt.py
> @@ -87,7 +87,9 @@ def test_aarch64_rme_virt(self):
>           self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
>           self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
>           self.vm.add_args('-netdev', 'user,id=net0')
> -        self.vm.add_args('-append', 'root=/dev/vda')
> +        # We need to add nokaslr to avoid triggering this sporadic bug:
> +        # https://gitlab.com/qemu-project/qemu/-/issues/2823
> +        self.vm.add_args('-append', 'root=/dev/vda nokaslr')
>   
>           self.vm.launch()
>           # Wait for host VM boot to complete.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
