Received: by 10.25.21.96 with SMTP id l93csp620479lfi;
        Thu, 23 Jun 2016 09:51:00 -0700 (PDT)
X-Received: by 10.176.7.102 with SMTP id h93mr13797978uah.70.1466700660234;
        Thu, 23 Jun 2016 09:51:00 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com. [2607:f8b0:400d:c09::241])
        by mx.google.com with ESMTPS id j63si493021uad.25.2016.06.23.09.51.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 09:51:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) client-ip=2607:f8b0:400d:c09::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2607:f8b0:400d:c09::241 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-qk0-x241.google.com with SMTP id a186so16795110qkf.0
        for <alex.bennee@linaro.org>; Thu, 23 Jun 2016 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=lD99cF91md2+on1WzwpkBhStjDG8u7fs1GKh1LV4s1M=;
        b=zdN6DACyQCnORCsmOa0y2D0MSZ2/UdN/vCnFUP0Q2rMWe+l0Jy2w8tAgN86EE7An3G
         7E5+odoycn1s780etmYIwZxKgI6fISwrCeMm9l88d7GmYTE0Y/dnx4g6mcK+/RVaeczn
         AMOx5APudwJPw37vo9B6+f+rL3bRsnSix3M+P2keXNKRsLL46V8VmzFjTBj/KovB38yM
         +E5L8Pf5VG2fvoYuMe4+LMwYb9XLEawaOAqpChvzyylHcfcvRgSVmKwl+ICzf+TlN7Qt
         SJIr7dH1eajThFWzkqlwugNpzHiHKFC8SGHRp+MS+oiWoVXlDKg0ZpfVZm33zWbxLZqy
         KtbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=lD99cF91md2+on1WzwpkBhStjDG8u7fs1GKh1LV4s1M=;
        b=Cj+lsUtU8kP1r5RINVPq1oWuh9l35HOSgtvRQnvMgPPd49z/gprI4OllXkSEnVcFND
         34jSsoqd4k4HmNRNBl4daXUs3T8Ttm0u3W2DsvmNPd1hxgDMv2lGlrY5XlG9i69eDIiC
         no4jk23l7ObgLKKgDuH+MdO1JhFUnPp+NjVeLJkb5+kxi/jdWlKSkJ+oehiS03psNVAD
         Gytrb78Lol5FG893YZ3+y5PqIA6qn45kzmHxRXbirdddxjPtKNMEYmuhN0pb5YeZ3nSd
         fQlAaOgB/ydOuH1fKTZQLB2PkETxiE5tMKrTezQAhKa8gSHGX1r9ykESOJCBslmIabPv
         zanA==
X-Gm-Message-State: ALyK8tJdJRZnnxtyR6gEjUzYEuR1NmE5jM/FTWZRKPvFdho9yUK4eOPPmOYw3e3CboiYUA==
X-Received: by 10.237.45.98 with SMTP id h89mr45661041qtd.81.1466700659831;
        Thu, 23 Jun 2016 09:50:59 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (71-37-54-227.tukw.qwest.net. [71.37.54.227])
        by smtp.googlemail.com with ESMTPSA id h185sm395362qke.28.2016.06.23.09.50.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2016 09:50:59 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [RFC v3 PATCH 03/14] tcg/aarch64: Add support for fence
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Pranith Kumar <bobby.prani@gmail.com>
References: <87inwzri9o.fsf@linaro.org>
Cc: Claudio Fontana <claudio.fontana@huawei.com>,
 "open list:AArch64 target" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 serge.fdrv@gmail.com, Claudio Fontana <claudio.fontana@gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <e10ebfad-354c-a476-7114-17f500551369@twiddle.net>
Date: Thu, 23 Jun 2016 09:50:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <87inwzri9o.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eopTaxKFFQAq

On 06/23/2016 09:18 AM, Alex Bennée wrote:
>> > +    /* System instructions.  */
>> > +    DMB_ISH         = 0xd50338bf,
> As ISH is part of the CRm encoding I wonder if this should be split into
> the main DMB encoding (0xd50330bf) and a separate set of CRm defines.
>
> In fact the documentation of the struct above implies you should
> probably have:
>
>        I6260_DMB       = 0xd50330bf,
>
> And then:
>
> static void tcg_out_insn_6260(TCGContext *s, AArch64Insn insn, int crm);
> {
>     tcg_out32(s, insn | (crm & 0xf) << 8);
> }

I don't see any benefit to doing this over or-ing in the pre-shifted values.


r~
