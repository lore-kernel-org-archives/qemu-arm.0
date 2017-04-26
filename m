Received: by 10.25.0.144 with SMTP id 138csp170136lfa;
        Wed, 26 Apr 2017 01:26:47 -0700 (PDT)
X-Received: by 10.28.74.218 with SMTP id n87mr4793044wmi.71.1493195207385;
        Wed, 26 Apr 2017 01:26:47 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id u84si6095627wme.1.2017.04.26.01.26.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:26:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of rth7680@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=rth7680@gmail.com
Received: by mail-wm0-x243.google.com with SMTP id d79so31269079wmi.2;
        Wed, 26 Apr 2017 01:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WnTsGRHMPlgGMYDKyvdWeTRgUU7OfQbvUpnk3l7nFYk=;
        b=goVMfpxkYoOosE2/HULdiRp1+UvIpU0f55FMi9hJcUr1wOTOxqQNry6qmDLLksTLtI
         PrpuE2dD9UQ8dT5spu7jfdOXoCOH78tnRIId3QLQ/37DzDvHWWjloZtRaJvW+iDPRK4/
         N+aHCNFMb/QMYE8viDfkQEsVYZVCDlc0LxPYUmv4HzJY/u6+PzIILpjL/pnd3GZ43Ncd
         onHDoNAUVOOXdBJbIf8xKgkFeL9fE0JbmAmIMsLLJyEs6tu4Q47G/6J1hL6iE7iRkhzn
         OH4aVfXGBJZIGKVgwGryY8+J1AUk5+GUZGUCPQDm0HIEcHAvSYj5L0IAV8xsI2vwBYqw
         vhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WnTsGRHMPlgGMYDKyvdWeTRgUU7OfQbvUpnk3l7nFYk=;
        b=sJpzhAVe9ls1IvvF/MCe5bBoteVbQolcX0stfYfUGAYWIvvzDodhItuDM7mlt3A86t
         LE5dvXYh5A9QjTp1b9QZa0RhMOoLcXcSR6biYYI2sRm6Dj7VpkHZTJyyiczEWmECIsRH
         3lsQqGByk0xkxYpHE5WDS9CHrokVc8ihkssWJcbKC3/xxzxpuH8BZOavHVpLK1Fn2UFa
         ZWyjp2NArMQ6zTFAOCDzg0xlgwz5BxtfhOqwEaTslXkt0+Hm61fMjIHiK3og/8p2HrTr
         9IDFot6UKbM1j1DtDO7gsNJMTTVpVoIUdlGQJHHO3aLZ+I2TcBxtVBsnA/flkjIltbOc
         BBUA==
X-Gm-Message-State: AN3rC/4/Hb87IHXCvO3VRaETOf/fXERKxUYdDFJ58Qz4+o2ZOTvTZMRo
	JyXR66wxeOiWZ2+xtK8=
X-Received: by 10.28.232.137 with SMTP id f9mr4640469wmi.116.1493195207057;
        Wed, 26 Apr 2017 01:26:47 -0700 (PDT)
Return-Path: <rth7680@gmail.com>
Received: from bigtime.twiddle.net (251.red-80-29-7.adsl.static.ccgg.telefonica.net. [80.29.7.251])
        by smtp.googlemail.com with ESMTPSA id l201sm8079127wmb.3.2017.04.26.01.26.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 01:26:46 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v3 07/10] target/i386: introduce gen_jr helper to generate
 lookup_and_goto_ptr
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alexander Graf <agraf@suse.de>, Stefan Weil <sw@weilnetz.de>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
 <1493187803-4510-8-git-send-email-cota@braap.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <8f8d1cf3-ba97-1663-3327-2b8857af2dc8@twiddle.net>
Date: Wed, 26 Apr 2017 10:26:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <1493187803-4510-8-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: LBvA1gu2ftsE

On 04/26/2017 08:23 AM, Emilio G. Cota wrote:
> +gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, TCGv jr)
>   {
>       gen_update_cc_op(s);
>   
> @@ -2530,6 +2532,13 @@ static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
>           tcg_gen_exit_tb(0);
>       } else if (s->tf) {
>           gen_helper_single_step(cpu_env);
> +    } else if (jr) {
...
> -        gen_eob_worker(s, false, true);
> +        gen_eob_worker(s, false, true, NULL);

You cannot use NULL.  While we abuse a pointer type for TCGv, that's because C 
doesn't have type verification for different integral types.

You need to use

     TCGv unused;
     TCGV_UNUSED(unused);

and

     if (TCGV_IS_UNUSED(foo))

(As it happens, I do have a branch that tries to clean this up, so that this 
kind of thing is less unwieldy.  Perhaps I'll get to it this cycle...)

> +        tcg_gen_ld_tl(vaddr, cpu_env, offsetof(CPUX86State, segs[R_CS].base));
> +        tcg_gen_add_tl(vaddr, vaddr, jr);

tcg_gen_add_tl(vaddr, jr, cpu_seg_base[R_CS]);


r~
