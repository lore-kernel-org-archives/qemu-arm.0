Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3125971wru;
        Fri, 5 Jul 2019 05:45:19 -0700 (PDT)
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr3314433wmc.98.1562330719706;
        Fri, 05 Jul 2019 05:45:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562330719; cv=none;
        d=google.com; s=arc-20160816;
        b=hkwZE1zmV+hVWm6tfXb3jFH8U2Dw1r9ickg1+PFX8/464GCWQoHWdTpTwApjOzm+uj
         jEpjx98peBiHRdcwhkntHgJfjkrlF/3HQLeXxcBv8ZW7aokarUjqFu1bRQCkzzVNlkSz
         TtHWvt9bhziNvG4tAIM3eUqVg602Fs+vOgSIBw+ElLDKZ54wc6E1LaiSQKC0L9aHdL5g
         5u3tWbb/D2h6f3xnQjICCVsSUsCLmDwZxtimJ2MVxF/HeogpaYs5UxxpiekC4BcLAJqb
         t+eH1SQuzHOquH9M6WDQzwD0mJ6ZgA6Zm983U852tmj3g2x8taR13cwR4earaGrvdim+
         bYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=5ZM4aqF6lfbJWO2ZTt7CeV3eGrZxp5R0ZeCOE1k4Nio=;
        b=wwNHs7OSpyT6XnwFJKSADUu7qhOOHGthmxd5AY45N/QDDx2PxISd6zCgOMyeXjmOZ/
         SyDYnPHSBx2PKrEA81+bfMyeeZbqZ4pLB2KxTmkKNBsDXDBqcmanX8wwoEIjgopMaAlF
         opgRZ3YvuTTY7txQ70+s/SBYpVu6xtslPec2xstnAy51h0qyQYCXXCAwGA85cdNyLwDs
         GBd4UPpktUUY00w/9xwWmTrzKSxcMGckIotCkN9chgBe2As9OMo5POIkQruPJhknRMFz
         mSZSNg+zDhGL5Oybfvj0geUWUKZlyymEiLBsRNH5kIDH3F2HtiHH9JgUO8z/LH1/gB+c
         6mwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d18sor3316667wrn.25.2019.07.05.05.45.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2019 05:45:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5ZM4aqF6lfbJWO2ZTt7CeV3eGrZxp5R0ZeCOE1k4Nio=;
        b=sRM5xuNzgYi9A2x6oXb7uMSEKWttlFMW7QV1gyWX5Q0/TxqUrpZwE1D4CeT3JYZTC4
         OX/qXUAyLiU1PCDCBZAr5msocAKRnIKYOEcGASR5h5ZAHKNZDT93RrDfiMqY1/BcAry6
         76Cgy9K5CWRnnAGBqDnTiDRlS8F0EtU8+xjEMxmNN3gbrehIg4Ub5GA94mkP3MoymbZ0
         g5UNYD4GYs4QdZMhOn56Cs2O0W9AXjaATsAMh65V5jt8Lw6e9lzaas1ONaGY+qjYBeFl
         SQIf7V3ADncdRFZ5Lko6RbbFUrhq2l/UalrEX7bJUVSp+6kMX+JCrl53ppSMQ5ZvF/v0
         2YvA==
X-Gm-Message-State: APjAAAXgkOrSWdLBXs2wBsMy+4hx921c+1+FPMVDSI0R3x073a/w9IdB
	EIPmvIBOhBwaFng/gXi7aCAlqqFoFNc=
X-Google-Smtp-Source: APXvYqyWhluM5dF20uilV4CjoWUpOLf+gqGOkSsgMMl0GzNG8onBYAhbrOc+XovPnUV5/nK09PEKYQ==
X-Received: by 2002:adf:e708:: with SMTP id c8mr3031565wrm.25.1562330719332;
        Fri, 05 Jul 2019 05:45:19 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id x83sm8987408wmb.42.2019.07.05.05.45.18
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 05:45:18 -0700 (PDT)
Subject: Re: [PATCH] target/arm/vfp_helper: Call set_fpscr_to_host before
 updating to FPSCR
To: qemu-devel@nongnu.org
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190705124318.1075-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <db75031d-e9af-c349-903f-276ec92f850d@redhat.com>
Date: Fri, 5 Jul 2019 14:45:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190705124318.1075-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Ykxq+sY3PCQu

Correct subject: "Call set_fpscr_to_host before updating FPSCR reg"
(or without "reg").

On 7/5/19 2:43 PM, Philippe Mathieu-Daudé wrote:
> In commit e9d652824b0 we extracted the vfp_set_fpscr_to_host()
> function but failed at calling it in the correct place, we call
> it after xregs[ARM_VFP_FPSCR] is modified.
> 
> Fix by calling this function before we update FPSCR.
> 
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/vfp_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
> index 46041e3294..9710ef1c3e 100644
> --- a/target/arm/vfp_helper.c
> +++ b/target/arm/vfp_helper.c
> @@ -197,6 +197,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
>          val &= 0xf7c0009f;
>      }
>  
> +    vfp_set_fpscr_to_host(env, val);
> +
>      /*
>       * We don't implement trapped exception handling, so the
>       * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
> @@ -217,8 +219,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
>      env->vfp.qc[1] = 0;
>      env->vfp.qc[2] = 0;
>      env->vfp.qc[3] = 0;
> -
> -    vfp_set_fpscr_to_host(env, val);
>  }
>  
>  void vfp_set_fpscr(CPUARMState *env, uint32_t val)
> 
