Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp422343eju;
        Thu, 14 Mar 2024 08:45:09 -0700 (PDT)
X-Received: by 2002:ac2:5bc8:0:b0:513:1c71:4a44 with SMTP id u8-20020ac25bc8000000b005131c714a44mr425129lfn.37.1710431108817;
        Thu, 14 Mar 2024 08:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710431108; cv=none;
        d=google.com; s=arc-20160816;
        b=GDSiS4C86zYi0bXCFL9+MaLE4FLvhSfYDvTAvCRplYoD61X6vpLsbX4FEjhZGMVA1Y
         skb9E6b10dae7bf1BeHTFl8jFnd/FhCdQNfZWMSVf8rr5AzKTwuaxUe7yvOqES2b6DFi
         5ZNYnC3DKE+U/SuwLfnJ/CEOshK7obJX4fcsoBdpSF8JwrZdOzajFTcIRzEXAtttZfcu
         g552vG11lZCdoV0KfeAyOCam9m4yAnkolVzZ/06Zdmwb1GlUUSygaNIjel95xRv9kJMW
         7dk/g5DWi3hcOnK9IQwyMzp2EUQBDPdYFMSz4hBvSrDCvyi67vZ7hbYl4WIpTxOMB8HQ
         W6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=/tsVpAtLaCvgN9dlkyI0vmkggG/7Ft3hdDWmTwIV4EI=;
        fh=uLtMMA7K8C0rMCjli+lXpMZ7F4wQszeMxFZTav4np9c=;
        b=SEXz6DGO2+KaC26wa1UNIek1NMJQmOgrukU0RUzhMdTWJimOBBlAuvT1hiEEGkxkzX
         nPoexjBwWG0/hyV6m9gcqUcSntpc0Oyl+459fklGFv3pMOby2HW+LTrDM2o3gD3ZdH6D
         2Ru7w3M3r7LkmMOq/25N+1rHevkKtHf6oTgSPXrxOR5zzKiCEh1F/mUYmjfoknuu6dS2
         i/5PKZWEDTRQjGB/a0Qn7LHw5QaDeikUNwIDo+LtnVDO/l2YB7fNNfKJTHG1x4lHyTdq
         k07ZiKeKgeEmXb3SwzS9VHjoKIxp6J/il+Bcn+zZaHky2AqDfc8vzSSmkZsZznXVMTk/
         9yPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nFRfdogJ;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w6-20020a19c506000000b0051187ee2981sor481054lfe.4.2024.03.14.08.45.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Mar 2024 08:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nFRfdogJ;
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710431108; x=1711035908; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/tsVpAtLaCvgN9dlkyI0vmkggG/7Ft3hdDWmTwIV4EI=;
        b=nFRfdogJ71XKD6+CaBtSkQ5yUZvJG7fUg0ib/Nrd+dNchwEGb+nkIxZ/b27GJ2Ubog
         an+rsJho/jXgJOwwqD2UiVt0N8PGQHVqI3aaEQNi7uV5BznKiJEfNsHpF0EvqLtRE7zb
         uJv9fpYghQBn5D/NZEr/E7X+tk1R0gxcQh1sES8afKdyeeuOa5U/Nr7JBoFEY+I5LlxL
         EKjn/9tsY+UGk1NTU3X5leWuZ1Z36x4hBIO0H4+SC6wDd54VWBYZYu7SjRNMoURAQzC7
         nrN3iBv4ackilB9M8dAWPnDTST7eAHjdQmK6YfWLoP9nrpMKUF+YLaW41dhHTsgFa9DG
         0rZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431108; x=1711035908;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tsVpAtLaCvgN9dlkyI0vmkggG/7Ft3hdDWmTwIV4EI=;
        b=V84zJeTWFPTaxOHRUr9bbTi2j89yu4JK7Zq5gXOXAp/aMg69rf/whQ6Plmvz1Jc/BF
         ArcvNaYrukfBnrVlLFCQJUmkUD4KEgJIw/H1igLI5fB3KL5cWXvMCesL/x1WNhOyGtYc
         vzC/EqPuS+HyY6g4pJ1N6FFp1eQgpBrb2QOkor8vFxn/vN2VnDhkL+NyvyGSWok8hA30
         Dgw2yS/CCfDAbN4XiZ64OLOc9oCkKdyCHxDH+EW4MVkaHez+y0ADSkbHkMTkgkyw+hyI
         TvmEl/ySsYhjxAByqq80XTzgZbanfMvcHPZ9d5+lmSwjNIkCis0d5sfjumM5FDnBRLNi
         3row==
X-Gm-Message-State: AOJu0YxjSDyksSDJpdlPar4117zt1sw9bdSFYKWExt5oo5k739wRreIf
	Xn034+FCE/BUiLaY+DK0D0jnPaa9Epv2RoHSO7fbtPUbr/tPCmI6Re9oVd1beScRquf6m+mn2HN
	WvHGQLQ==
X-Google-Smtp-Source: AGHT+IEfxXoYx/PWLLBuRXi1GuLyNwYGCNRR5aV+gi7tPa7CTzK3jfbM2g0zb5wzu6qel03oMuWRlg==
X-Received: by 2002:a19:5f04:0:b0:513:97d5:245e with SMTP id t4-20020a195f04000000b0051397d5245emr424208lfb.31.1710431107975;
        Thu, 14 Mar 2024 08:45:07 -0700 (PDT)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.200.106] (83.11.22.169.ipv4.supernova.orange.pl. [83.11.22.169])
        by smtp.gmail.com with ESMTPSA id y24-20020ac255b8000000b005134751aca7sm314837lfg.275.2024.03.14.08.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 08:45:07 -0700 (PDT)
Message-ID: <42b7eeb5-9105-4958-8b57-1c7b56e52010@linaro.org>
Date: Thu, 14 Mar 2024 16:45:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tests/avocado: use OpenBSD 7.4 for sbsa-ref
Content-Language: pl-PL, en-GB, en-HK
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
 <20240314-sbsa-ref-firmware-update-v2-3-b557c56559cd@linaro.org>
 <87bk7hggcz.fsf@draig.linaro.org>
 <7da62f7f-3e87-470b-b089-1bfe5aa97555@linaro.org>
 <87ttl8g8ue.fsf@draig.linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <87ttl8g8ue.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ll3zg5M4OCEn

W dniu 14.03.2024 o 15:56, Alex Bennée pisze:
>>> If we are not going to delete the entries then at least use a @skip
>>> instead of commenting. Maybe:
>>>     @skip("Potential un-diagnosed upstream bug?")
>> Daniel or Peter suggested to open a GitLab issue and use
>>
>>      @skip("https://gitlab.com/qemu-project/qemu/-/issues/xyz")
>>
>> to track progress.
> That's a good idea. Are you going to respin?

Opened https://gitlab.com/qemu-project/qemu/-/issues/2224 to track 
problem. Subscribed to arm@openbsd mailing list.

Will walk the dog and then mail them with problem.

And respin patch series tomorrow.
