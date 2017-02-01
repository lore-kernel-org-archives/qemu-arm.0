Received: by 10.25.77.65 with SMTP id a62csp567472lfb;
        Wed, 1 Feb 2017 13:29:09 -0800 (PST)
X-Received: by 10.84.173.4 with SMTP id o4mr7472356plb.106.1485984548964;
        Wed, 01 Feb 2017 13:29:08 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com. [2607:f8b0:400e:c05::242])
        by mx.google.com with ESMTPS id o9si15468771pgi.274.2017.02.01.13.29.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2017 13:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) client-ip=2607:f8b0:400e:c05::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400e:c05::242 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-pg0-x242.google.com with SMTP id 75so35260400pgf.3;
        Wed, 01 Feb 2017 13:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=m9twQfihc6o/lCCb+ZvfNczfFjumAbrKMEYj2imKybY=;
        b=vckinbKtjJU/SzivrfDRAHRNHhjgVFzasOZtTU0ROtAHbPIj1ShbYl4KqwI5KHZkrS
         edIqMJ9rRPNNPogO383riucmSZMZ4CL6WsUm+ea00JBjpMXrCYn7Vh2bswm0v/C1vIaU
         Lg9ZEIhoJgeo3Oqh39JvO4pxWFbHIINZ3T7CghqsSjS8E8NQWl1DKccrjN2GDs65j8UI
         JnNI29/FjlkKh0zSOJrG1SUAugzyLRLPKNXXB1ftDl9JiYpTXRAQpi9AE1jUJONvLqPs
         9f0OAGmc1LZE4tE/LDN+wJonoyl9ebyTyeLXmbiUHev/VzxyiBgwoKPLgr/UN+tNnY4L
         nmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=m9twQfihc6o/lCCb+ZvfNczfFjumAbrKMEYj2imKybY=;
        b=Yl9XN2isPg1UgH3xcEZSjfmpxAk6fBH3Ns9Zy4cAdPMRJdjnATQp40zosCopQf/TvO
         rabzz8ik940nk7A0w5qbc5et2rljWiumqLUz90pMmmrtJAvNZsBXzqGnTmvQnVdnFuee
         /UL+Fx9F0mqOZcEzuH5NZBHCwdC9gng9kElDfhxIS1V4Ih2DBMojgsapYHEhBk72zcYP
         lPmQmONMvsJ4R9fD+j6Z3uvwV6Hso2HxTOWuUxj574K6LiOJ5rxxlnACYByIvZaVt3B3
         v9yk0jvvKCR/Nepy3CzahYatGzv3BnhyJAkjIqa3MTnXe7XX5s1saAFKuaxBGAeFc6KX
         j1Fw==
X-Gm-Message-State: AIkVDXJDHqAhowJkEoRLDYq2ePbx4LCFLsycD/p5Rt34M6DvmXglPjL0aW9EfFjK3U3Emg==
X-Received: by 10.84.225.148 with SMTP id u20mr7279167plj.93.1485984548430;
        Wed, 01 Feb 2017 13:29:08 -0800 (PST)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net ([2602:47:d954:1500:5e51:4fff:fe40:9c64])
        by smtp.googlemail.com with ESMTPSA id 21sm52057613pfy.4.2017.02.01.13.29.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2017 13:29:07 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v9 16/25] cputlb and arm/sparc targets: convert mmuidx
 flushes from varg to bitmap
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 mttcg@greensocs.com, qemu-devel@nongnu.org, fred.konrad@greensocs.com,
 a.rigo@virtualopensystems.com, cota@braap.org, bobby.prani@gmail.com,
 nikunj@linux.vnet.ibm.com
References: <20170201150553.9381-1-alex.bennee@linaro.org>
 <20170201150553.9381-17-alex.bennee@linaro.org>
Cc: mark.burton@greensocs.com, pbonzini@redhat.com, jan.kiszka@siemens.com,
 serge.fdrv@gmail.com, peter.maydell@linaro.org, bamvor.zhangjian@linaro.org,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, "open list:ARM" <qemu-arm@nongnu.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <75cccc44-b1f6-d53c-b605-b3494df6a8a3@twiddle.net>
Date: Wed, 1 Feb 2017 13:29:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170201150553.9381-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TYu3sUAU01OJ

On 02/01/2017 07:05 AM, Alex Bennée wrote:
> While the vargs approach was flexible the original MTTCG ended up
> having munge the bits to a bitmap so the data could be used in
> deferred work helpers. Instead of hiding that in cputlb we push the
> change to the API to make it take a bitmap of MMU indexes instead.
>
> For ARM some the resulting flushes end up being quite long so to aid
> readability I've tended to move the index shifting to a new line so
> all the bits being or-ed together line up nicely, for example:
>
>     tlb_flush_page_by_mmuidx(other_cs, pageaddr,
>                              (1 << ARMMMUIdx_S1SE1) |
>                              (1 << ARMMMUIdx_S1SE0));
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> [AT: SPARC part only]
> Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~
