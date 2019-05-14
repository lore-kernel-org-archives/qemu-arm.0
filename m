Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4222995wrg;
        Tue, 14 May 2019 09:57:40 -0700 (PDT)
X-Received: by 2002:adf:f6c8:: with SMTP id y8mr9790938wrp.175.1557853060797;
        Tue, 14 May 2019 09:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557853060; cv=none;
        d=google.com; s=arc-20160816;
        b=swXoexOKVcCFhpxs1YpY2b1EZ4AvPtnIReeHywifhUeA1uoeygrv6g7cbOAb6Q5dYN
         DGnbgVIAFsfgnwDQT3+Yr8L1kwc7CNE859/A+Il6sZAuur94j3nG7zWhXDatyabmaGIq
         NfRvkZqrLdI7A960kNOjv4OOWbMKtkQZdw1Qkqd0/7TO7jqpnrorgEVEofCXpa8VDFhW
         pQvYuxV/xkIE3XR/eV4RW4Hm25ZGU0gYK5TebQDd9Ih69NSmXpSLbfd6X9CG3VgWAPVX
         MhTzb9tc27gUQLxqCoZWhfBLDB846yu44CEJPbMRNnu9kZV+B0XojNoTdBmQrfkTwpa0
         4rPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=3RpATJY4t7mffsI0H5xJyZeNDAapvNxe81KENkoywFY=;
        b=RKD7ySo8FCL6nGDG4FZUOKiNFC1Ewg0u8i5e6HKwRGWawDzk1XRm9tBx9ZpGjGAh5K
         Yzq9TmicNQwXZ9jJfBQ1SqZ3LIVQRc6NBLRD2dGkJB5waOkFMe54E2alrWNx22h3IpH7
         6vFivh7BidsJ+ZYt5ps8ieZpdIriqHZeT31PMPpvX5j7xQH/umMFtjg6D+yLSgIcTxbC
         SmTCu6+leFc41POU9arcveKkk2a7LrcQQA2s9Oc+7LRsAUVQ5Dl19KLe2O5rpoDqEzL6
         d+TJU93OISuSO/SsQeckoaJL7m/WgYbyKa680WI6SvgoUPxdEuphHbuljPxpkz1rSVWr
         Jq1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u9sor3757327wrn.49.2019.05.14.09.57.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 May 2019 09:57:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3RpATJY4t7mffsI0H5xJyZeNDAapvNxe81KENkoywFY=;
        b=oCwPqYH22+vmYfNic6vuvpxtqCCBW7NV/SzbXH3E3BZqXIHhza+x3nJGbH5aHedmBj
         GjenPT16V947VSYBd9rqRw6jA3DamZp0AG02m/FjMAQo8t+iKpb4sfqn/pBOrjwUqavU
         N12N9WXAMuAMXAzZvcw0IW7qBT1mYDl6JQztPpsgeH524m4Nl7BuFuzeFhhLTzvbJVnn
         /jvGYdK9GD3L1jjwa2pwyuMO6AFIEdBL8bFwpUxwfyhFUh+6CICn9qVWT0nvYSUlSO3W
         cR+N84EyIGQAfCLy8Ul8sCZMJC3TejcX9vyitjDeTl03oZjjF8FmHqB91Tz21I97yEja
         TMzQ==
X-Gm-Message-State: APjAAAWJtvoOo8XBEX+/S7pRJarsrjL2GFwzssSwB2VLL496zSjBJAJS
	f9D/5BX4WYdPyeiGNXYyjZYd1LrZzcs=
X-Google-Smtp-Source: APXvYqy0xcKJO2KLFoe2tc9eaDZSgvPIrzRFSbPBTVnfHHtM4SW6zdj8fcDY4MOAbWT1dzMPOK+YbA==
X-Received: by 2002:adf:f5d1:: with SMTP id k17mr21842871wrp.281.1557853060601;
        Tue, 14 May 2019 09:57:40 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net. [88.21.103.193])
        by smtp.gmail.com with ESMTPSA id y130sm5572332wmc.44.2019.05.14.09.57.39
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 09:57:40 -0700 (PDT)
Subject: Re: [Qemu-devel] [RFC PATCH 08/11] target/arm: correct return values
 for WRITE/READ in arm-semi
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20190514155301.16123-1-alex.bennee@linaro.org>
 <20190514155301.16123-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <84dde5b2-e2f5-504d-be03-0ef888957a0a@redhat.com>
Date: Tue, 14 May 2019 18:57:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514155301.16123-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: mfGIV31VDN1Q

On 5/14/19 5:52 PM, Alex Bennée wrote:
> The documentation says the write should return the number of bytes not
> written on an error (0 means everything was written). Read provides a
> buffer length and the return value should be the buffer length - bytes
> actually read. Remove the incorrect FIXME's and return the correct
> values.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/arm-semi.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index a3bbef18ef7..3ae8f05d51b 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -334,13 +334,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>          } else {
>              s = lock_user(VERIFY_READ, arg1, len, 1);
>              if (!s) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> +                /* Return bytes not written on error */
> +                return len;
>              }
>              ret = set_swi_errno(ts, write(arg0, s, len));
>              unlock_user(s, arg1, 0);
> -            if (ret == (uint32_t)-1)
> -                return -1;
> +            if (ret == (uint32_t)-1) {
> +                ret = 0;
> +            }
> +            /* Return bytes not written */
>              return len - ret;
>          }
>      case TARGET_SYS_READ:
> @@ -355,15 +357,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>          } else {
>              s = lock_user(VERIFY_WRITE, arg1, len, 0);
>              if (!s) {
> -                /* FIXME - should this error code be -TARGET_EFAULT ? */
> -                return (uint32_t)-1;
> +                /* return bytes not read */
> +                return len;
>              }
>              do {
>                  ret = set_swi_errno(ts, read(arg0, s, len));
>              } while (ret == -1 && errno == EINTR);
>              unlock_user(s, arg1, len);
> -            if (ret == (uint32_t)-1)
> -                return -1;
> +            if (ret == (uint32_t)-1) {
> +                ret = 0;
> +            }
> +            /* Return bytes not read */
>              return len - ret;
>          }
>      case TARGET_SYS_READC:
> 
