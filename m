Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2598759dye;
        Mon, 30 Jun 2025 09:50:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1bmtSNFnkxbZiEDHlZS6zc+PdXn9kFXqXjzT2meTQd8lF34mtaEL/neZjSOrk/3qRyUTxZ009zWGz8w==@linaro.org
X-Received: by 2002:a17:90b:1f83:b0:312:26d9:d5a7 with SMTP id 98e67ed59e1d1-318c92a3d5bmr18161494a91.20.1751302231182;
        Mon, 30 Jun 2025 09:50:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751302231; cv=none;
        d=google.com; s=arc-20240605;
        b=PE/kCoy7sx0Q9n87Mwh1zaZNKyrjMwiupNMELv2xrjKjCfITH/uKolzTm7ngOnMR7O
         ebRFjSqzZOXWMF9mMFdJnojA6MPPpB77fDtTdM/1Sr2YtFDCTHGb8vxur47aD9UqKkD9
         bGVKwC+YE7ParB1Wc1CPZGLoVpJ+lRLiQcCSpS74BylJfHvDRn0Qt+gCt0FQEHjKhEbi
         9KZku3W0lr/Np8Cr6+fyzH+hhjMRWv7ZtNhLDi+otvbSFDutIgVEHksOXr8K/asu2KkS
         eI/aRmK7bsqOgZdHsosyCj+fKOwV4kgxYphDvWuAWHrJkOblpkWLWmNuPwq/LnsygKU+
         eP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LL0eqciu8eYqgzjq/IooTmEzUKZT4CFeFvkC21pTu3w=;
        fh=7FMeWbgGW3jaVV9jy5bfMor/FZTAyJs6lr3EPkA3Ha4=;
        b=Q/TpH/HEPAZJblVuUHCIKhQkdA50563i+1bW/NUVs+gS+RrYlQ1mB82ugmFbaE+Kwm
         Mn1rS4wRUEF8Cxzkive68oVt74ojVewF9nayoyhCel7V+bqIG/0tpHcxztNR6Eak91y0
         Ig27o1ChtLdqP+HKHI7m4eF1G6qS277d8MNIHf9gsm5ig1bE2RBTRmoTN+aWUW4nbOWl
         7VdedB+z1vsbTi2WRXs1yO2FrTGOyoA9FfxWWx6cwZCd9sjSs1MuFLeTXBYPcU7gDsUS
         sevgyVn1YF873suQsPV/CJSrpLYy8JhxFf9mSMHSpQnH8iwK6x878APUupR1TkMClnOe
         KiAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDg9KDgL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23abe3a717asor31099265ad.15.2025.06.30.09.50.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 09:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDg9KDgL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302231; x=1751907031; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LL0eqciu8eYqgzjq/IooTmEzUKZT4CFeFvkC21pTu3w=;
        b=eDg9KDgL9vSiEHGMC0tAaaYtTtALN775K50dk3cwTKQrHpeSZqUI9RiBR8+humraww
         fwTW3F+kYFIKkmeXgo/y7pu+BfBD7D93cCWiw82a6ova0UjQR8/iNBT6aXESQK9zFou/
         9pJlly1U5mQntcgQP+mG2NLo3k+DVdMjDSVvINTwEw19KdFqH8ycq4K+Au1zONO9YCtw
         BwsxDmi7mjL5BufKq+jBvpcApw0lOKP2eC0Tryr2ZFHq6x9x97rJJMbAjY7AaZKun9J2
         zNSbKTou4fSePUq64z7qm7nwGKTMHHUWvrj+lmKYNjoLA2p2gOECbDPOtlgpefJ5YliR
         VyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302231; x=1751907031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LL0eqciu8eYqgzjq/IooTmEzUKZT4CFeFvkC21pTu3w=;
        b=gSM6Dmj5XhAuwb3zaJYNNYGxP6BHEhrnNkaAByStMH+Th2VTFnnPJX++vKXQXQOuZC
         +LO2WWCfHdpgap2+mcieSas36W1G5JcKlkG/Sdhy4XIJ4a1dUGHNocysNDbPGPAWEHxk
         s4abJ1AmdVPWrk8G0AVYGxfIaU781M/WyzAZvp03aN7g2K1vg12o4xUifzfroaRVKmNT
         iPMi010tGorxW9YP58CZuZUwLwCEDLKomVdXknXxwoVjcEztlwllDzI3xktYT9hpTh9b
         XuMif9ncyrzKgTBF+pH7S77CRAC9T3YLAXgmwVMg4m1M3ztKkEuoUlO4ym1HaG85zulg
         5urg==
X-Forwarded-Encrypted: i=1; AJvYcCX6rDupU8GlzBqS8FfaHlC+HM3DOsMZILNbm9TdFnl47F/B4LG5PHv/Xtk7Zya5HucA1IO25ZaTbHpD3A==@linaro.org
X-Gm-Message-State: AOJu0Yzwx3nHdDz0NpYzQ+vJtsqOmdvd3FdSTB4+FgVpaQqhb5lR0ktu
	k2L/51teh+zkEDq1EC0LPuJFsvThWkiaf8x3ln0lsYlO2+1rojjBuoVjeZT5l2OWzZIl0A==
X-Gm-Gg: ASbGncvWPXMo2JgRXvZbmX4CRg7UQpR+j+iMTCjD/RKu22A+XBXab70nOAemrEr6imR
	TOqwDHLTUgh7PHAicnuMS0MkYzYJ+DpwkYcLf6+0yt+U8FmcunzIT03igXjJXgqOl6CMZSLs6sz
	Vd/zUouBJCdRFy61yIydP5bNtbOlVa64LGxFTtl8gEAtozjnLV+NfSub3viMubVbSIBg6uaGH6O
	FhRTZqUavY7NSU7YmlulkpSZoIdkMDGo2GVHyKNrkDxCOSTto7RN4Nsab/9RxWtnQfoE2xrsK0x
	iDXohgDVysto7k7UnxZI1ILyas7z/MWr+dE9LOPF7rgIaOpxo8YivyVkmaIzlAIvb221wFlipVk
	=
X-Google-Smtp-Source: AGHT+IFOZj+z1IUr10Ia7sUbajMVaEOJlgToWUG5ryPzPZpwHUkDVH6jeCanHqnJLAp5j6ncdGw69g==
X-Received: by 2002:a17:90b:3ccc:b0:313:db0b:75d8 with SMTP id 98e67ed59e1d1-318c9305fc4mr17340195a91.32.1751302230779;
        Mon, 30 Jun 2025 09:50:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c1392096sm9534535a91.8.2025.06.30.09.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:50:30 -0700 (PDT)
Message-ID: <78887cc7-a7d0-4681-b812-1dc34ed68c17@linaro.org>
Date: Mon, 30 Jun 2025 09:50:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] target/arm: Re-use arm_is_psci_call() in HVF
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250630130937.3487-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Xq8aRQYrQpzn

On 6/30/25 6:09 AM, Philippe Mathieu-Daudé wrote:
> Re-use arm_is_psci_call() instead of open-coding it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
