Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2198114njb;
        Mon, 7 Oct 2024 14:14:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyUhUfV1S7Q5a5on4ui49OehkQoyMtGV05c/WxYuYBv39Qsa1W9kbejv16/mfbNIeM8MvQsJcU/Lde5g==@linaro.org
X-Google-Smtp-Source: AGHT+IEMn978JjqqOfesT4hElIQLpx4HMwuwNoAPt5m8mjOVwL0cIZhKment2iZAHOxRwIc+iDLG
X-Received: by 2002:adf:f30e:0:b0:374:fa15:a8b6 with SMTP id ffacd0b85a97d-37d0e731b81mr7465011f8f.18.1728335678769;
        Mon, 07 Oct 2024 14:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728335678; cv=none;
        d=google.com; s=arc-20240605;
        b=Z6pmZ+EacxuxJS/OuO/W7jlRtALnS0d2ANDLdL0bFWnwiiYZTy/PFWUbPPR3p+q7kO
         /HYcJD/tK/Goqtx0mS9Y0lvT0cQ/92kr0sggaXRCK86aIPYe8L4GNJNxOzCucKYnxWgj
         WwtNtDDdgUHmkxTCFqVYGUIOrQFlE4JoUC9EntSlDqWWbW34UANV3MfjewQQUXS6vHBM
         cY6tuBOBLwDt/ViH2JVwSJB3/0jD66uSIStI4jaYUeWkUYSluoN8M2boP0Q5Fpt4kg+A
         DORhOvt76TgRbGEDVuSDORAhjYShxmWCq5ZbcaXIlvxPqHb+Zu/3gGgMJCH8ZnKGsoAR
         nLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=OOUA8oOsBM4wkSyzXKc8P5D0/fw7drV6WW83phXePfI=;
        fh=3fZ7Wohp6BUOfptJMglDqKETKOsQS3q9o/uj1RhoDNQ=;
        b=D+GnMbMqbOkR82xVMriAzx11N/ADSB6cIsouGd8UlYXNut/dsv+NsGP7G/DlF/KwFD
         zjhoNwExDRRjd7gf69fHzvBcdvsZbFXga6D30Fb/yysQdMoK1TpoIraYqugQoEOrYi3i
         lPqiHOqZQXHtwOtgahtZx6OTvl1jZNvxEvchKdinJBM8xcdvDKUGdEwMNtOfhIefMn/7
         sE40aRHFvIME1dpGozdMh00bI1bTrohG1muJK0rqOiKQrUlhaLqnN4BAVL3aShiC3PJ7
         ohEBDTghb0I12p+h7A97Mn9A9PhosRmknwSG9S/fSu447Ijojn2/L4rQ7qkoewZFES3O
         KaRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=etHUyLIr;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
Return-Path: <deller@gmx.de>
Received: from mout.gmx.net (mout.gmx.net. [212.227.17.22])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d1695ee6esi2803193f8f.348.2024.10.07.14.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 14:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) client-ip=212.227.17.22;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmx.de header.s=s31663417 header.b=etHUyLIr;
       spf=pass (google.com: domain of deller@gmx.de designates 212.227.17.22 as permitted sender) smtp.mailfrom=deller@gmx.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728335678; x=1728940478; i=deller@gmx.de;
	bh=OOUA8oOsBM4wkSyzXKc8P5D0/fw7drV6WW83phXePfI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=etHUyLIr/4ieTkMit0uDHwua77MrP36mCXpiRT/oaqrkOHuS57g71x7rYEYwX27D
	 uevphmeRHqe3IkFW3BnVIAcm4G51sqSoM5eG1aEPmI0x/QMi6tbg7uhrJvm504gPG
	 Ja7407vcuYUxwKrKKJOKcJ+dhEgNLbbOixpr3trLnOnrmkXnMsSgtQSBINCtM4xOG
	 Yr0QvvyYUvQb3aMZjK6sIA6TttjBkdGJ8mYxqGQ4gE/BawdaaQDTVVdEcL4VOmxw1
	 EyLsivJqVXwN8EQpcWh8TTjuvkr5hUS7m62TsodB0gezn6L5WnAkLXAdkZiIriwxS
	 ApRsSIJZYGZab5uKww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bSt-1tyROn0UUd-015H2O; Mon, 07
 Oct 2024 23:14:38 +0200
Message-ID: <b91c7cf3-12b4-4a0b-b372-11b291e70d50@gmx.de>
Date: Mon, 7 Oct 2024 23:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/21] target/hppa: Add MemOp argument to
 hppa_get_physical_address
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
References: <20241005200600.493604-1-richard.henderson@linaro.org>
 <20241005200600.493604-9-richard.henderson@linaro.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241005200600.493604-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:axKvToOl0KnBf+C7712fpuUtJ0XvZJZJQhFyfzw/K6UCJMUL0kN
 0Yp1/r9wHHmSyDMSrScdWCDb9USkiAIN5cSqFF9hLOqYZlbd+MAf2mVMeLxTAtoCHoveeP/
 UILffrUYZ5pN/P9e13UQ5DFcUa6iSeEj+PEeTJT8fMo5xwWMQQIzTuF41hJYZswqxOLJzhx
 Xxbowc7psY8JzzLqeDskw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6kBs6HUgm/k=;KHQdTeZ2ZixVZpTgj8TlIeJZ/e8
 MKZ7N+Hb0V3MsNY6ZZ9prnDHAie1TmvkibUyEGqQLVUhIzNKAJtqyAZgm/1H7NB4dRx0lTrSQ
 r6a0nWj/7zkRlSjIiv+WBT8LWxJqWoFLy1aLLj3se/Hew+IrzyrxzXY0zm6OdtKqZT+2ErmSt
 wbOq8Q/Q0nMO3LVqEVf1tiKFjfrz5SbBY7p/vYorCA9tX8+NZZIugUNbZV84vhE4NMDAUMNUx
 M5U1e1/cW64afEtF/k3w44EiQMztuZON8mcLG3rKmtl8LueJivscklVWaqWWUiVhoT2UmtAIE
 SrmOfK+39nC0xr6UJ9mHcczpUbMnBS5iuiqC5/RCJCiV438uMTXCm98Ku8QZM04UFFLBAG06R
 m7HDor53f/EWS8mFTp6zGqKTgtD1AoFnhKcr0HNFAPkYxSIyyTwai7NMpZimqQ45U+ZUtPD1b
 PdSOdRbybpepw3g47ysEjEYyWKAfXP7VI+UT2gGqppS9mDdOsDCW5i9humTw07zYEjiFXU7oH
 WP0Y7fogyQEZbckGLZJWyigLGswbdyHxvmieWyGAtVIdp6wRQumfstIR7abXAam2IPp4beNaB
 Og3GW4jnZL3gD3/xHxfJT0SgOCg3gvttlTSn12HTEjISL01lJcevtUWAqYS2SdQNXn/vooivQ
 gchdcTj61fTc4/jlVz9FWPjw6UlqEy0l2nNAK3It0OWn0dM3TQNWfWJOJ+6f/NNP7YoYEgs/T
 UVgM5KLh7zQy9BGrslEyihmPsW3GjfrH4V3vrsE73eBRsvfQCDkxNoutAX+en2lC8QEEXNVR+
 5ZdrWONg2diYItPjGjJnUWIA==
X-TUID: lJNc2cpid9NH

On 10/5/24 22:05, Richard Henderson wrote:
> Just add the argument, unused at this point.
> Zero is the safe do-nothing value for all callers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Helge Deller <deller@gmx.de>

> ---
>   target/hppa/cpu.h        | 2 +-
>   target/hppa/int_helper.c | 2 +-
>   target/hppa/mem_helper.c | 9 +++++----
>   target/hppa/op_helper.c  | 2 +-
>   4 files changed, 8 insertions(+), 7 deletions(-)
