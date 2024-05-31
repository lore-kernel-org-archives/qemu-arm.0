Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp609845ejs;
        Fri, 31 May 2024 09:09:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXsjtBAwzCyvvz76Fw8myHAbalsSuehY7F4Mwh+H3NEwHyVoz7UIRSOaQIdrWrlDFS91+NFfbu7rDHLd7YyJ/4iu9RhylG9
X-Google-Smtp-Source: AGHT+IFF31tOVMjN1JpKxwYzFp/T54Io6hfG716SDuvfQxgZSnD6xbSD6KBHuYzXTmVuIcOtrzz8
X-Received: by 2002:a05:6214:2f13:b0:6ad:625c:cb55 with SMTP id 6a1803df08f44-6aecd6f99ddmr32264236d6.55.1717171783011;
        Fri, 31 May 2024 09:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717171782; cv=none;
        d=google.com; s=arc-20160816;
        b=iZYLSKigqH+1kFqLmRxcZwCMiwDUSiPN4z5kz5aam6IrhHLLWopk7Qbbf8ehButSWE
         K9GI4PHjwVQBcfHCMGjiDNNQ58sWbWqX5uG9WVidVkpJ0Cu9dGS0D3YwLPsMvwOcAQUc
         PKU8l/Kc/h4FZVDOtwhhffg80j3aJfsH6d/KhKN5yFYxQTWQJe/5pTGJyxhFs+rFwYmE
         7cVqklCZYLYjhkL7Xl5xqLbTqxOmXcVS7yfcwGuRVd6qmmD/CzJt04SzC0s2VP6oL/DL
         9pv3nde7l020h2xqlQ/f7rCBAnB9RE2C924i3oY8QTpgSbmB1CoUiXX5jtV8gbK1tG2d
         R8vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=ZJociJhkICwIha+lzG1XPDXZhY/g4ozjgsEbhq1UJcU=;
        fh=62qVlrzV5kmtEJqZ2incqige91utIpFZ6QFHn2KnuiM=;
        b=jibXK5+i/CYMMG5YotYjWJos+sbXl5+UZEBO/H7ipJk0HMMcFgl/EgctU1glY45gFD
         bX6JZQ24bbuICIxLO2scVrD56WrZczJnC2B9sgVknp0pKuZwdqkxMWIU+CkS/pmOXL//
         vzW/0c7v5wpBgU1RY7BHKU3zpRpQNsLWzlp8SDlEGXQb17SO7d6059VQOc9I0M72FH/Z
         B3mgX/RAnO7VNvzM/p2DxGDO4XfTIXnLSIG0s5JRlsjISqDQ9J+h2x7RB+xnqBZFr6c3
         z5ngB8n0DlD37mdTmUNehax/r3XVUNzwBSwGYTVV8ZbJdVntZu8kAdWBprDBS3IiHRuz
         ySqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFCafKyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b42c5a6si23275926d6.530.2024.05.31.09.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 09:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFCafKyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sD4oa-0004yy-J3; Fri, 31 May 2024 12:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sD4oY-0004yf-OA
 for qemu-arm@nongnu.org; Fri, 31 May 2024 12:09:10 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1sD4oX-0007Dh-3N
 for qemu-arm@nongnu.org; Fri, 31 May 2024 12:09:10 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42120fc8d1dso22759105e9.2
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717171747; x=1717776547; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ZJociJhkICwIha+lzG1XPDXZhY/g4ozjgsEbhq1UJcU=;
 b=LFCafKyWTDuHuyupzk+dHVepyscENh1RXbSwsse460zck8oSjZs88ObGOzUQbOXpg8
 tznke7ibj5J8DOsYeQ+fy326PAYDwgU+RcAMhQ3oaJU1t7EztzFkCIgPFFud7CPcrIE+
 WDmCjYvSJYmxjJwktKLGn7fc2CNOCARETg0E2Fs3u2Pi4i1B6rfArPtBi9LebXrybJ8Z
 jcyUhkXMUsETljhK5PrcU8uSlJ4aK0QHiJxUARYjy/oH12+pb1SKMMAa04pIfiisK4t8
 ajNH2w0U6YObUPOORXEoKMSQhr0tmXE7A5gThYYFcai1IGaDLL8YD4HmU6owUAoqzMH0
 s1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717171747; x=1717776547;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJociJhkICwIha+lzG1XPDXZhY/g4ozjgsEbhq1UJcU=;
 b=SkBFzP2f34a0RnDh9Ju75H5cT3f5e91XO/zPkSAHuFcCLG7iN89avFgnCjW603u59A
 z9nrlWgIM2BoQvH1ZjOYksdtHX82but5ZAGCG3bS1VhRtaspRLX4Pkf60aEqWK5ExzaD
 i9Pd+3iREmsuWP9zl8uFsCgWhdhDnjZ2Ta3GzmRqEEvlWxMjtGjagIVy/VDZKsDyzAOl
 IDd2YeqVWFhkW4jvGe2Mhe9Z9Om72KWVfC5Sb+nEZ4pL1PFxE9nTHra25iI30TvWxd3c
 bjxDquHGADrWjyKKNrEdwPpmwKMZgeOu/yyy5sXHKDmwmlW2x8nEoNBFrUG9pQYtDZQs
 7q6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdHoRySfuhRj/e+DGbSuViGgPK6d4IWHEfreFgjSx7XOkymeVknz6ciPr4KQ98tVSWVyzUTH4FjPc85fgvpvFiFZU1
X-Gm-Message-State: AOJu0Yz08QvFLC33nDALIyX/BIg/D2dpey2nzEssIYU+a5Zf4u8ICeQI
 nv+ipncvIuxXiPAch7uKoGyq/qiCDytZmBophJ+0fn2OE+ufUCY7OCH+TFPFntE=
X-Received: by 2002:a05:600c:444e:b0:420:f8a2:f2eb with SMTP id
 5b1f17b1804b1-4212e061c6bmr20956285e9.19.1717171747216; 
 Fri, 31 May 2024 09:09:07 -0700 (PDT)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b858424sm29918925e9.21.2024.05.31.09.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 09:09:06 -0700 (PDT)
Date: Fri, 31 May 2024 17:09:21 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Unexpected error in rme_configure_one() at
 ../target/arm/kvm-rme.c:159
Message-ID: <20240531160921.GA217456@myrica>
References: <0C6F517A-5686-4BCE-8D08-1CED02CB470E@linux.dev>
 <4e7aa598-1a5d-47e1-aaa3-78af05947eeb@linaro.org>
 <CB05CAA2-9301-45F6-8AE3-A2E27A160CDF@linux.dev>
 <CAFEAcA-gye9B1yJNKyT0fcZzR7TukNvaQyc7QkKQ_1FUGfAaYw@mail.gmail.com>
 <20240531102135.GA40178@myrica>
 <E5197AF2-EEB3-4568-9F25-78622AD41AE4@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E5197AF2-EEB3-4568-9F25-78622AD41AE4@linux.dev>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FLGfQoJHkv9v

On Fri, May 31, 2024 at 11:16:30PM +0900, Itaru Kitayama wrote:
> Thanks! I wasn’t aware of it The good news is that after whole day of try and error attempts I was able to
> bring up a Realm VM on FVP. Here’s my version of overlay yaml, cca-v2.yaml:

That is good news, thanks for the update

> build:
>   linux:
>     repo:
>       revision: cca-full/v2
> 
> #  kvmtool:
> #    repo:
> #      revision: cca/v2
> 
>   rmm:
>     repo:
>       revision: main
> 
> 
> 
>   tfa:
>     repo:
>       revision: master
> 
>   kvm-unit-tests:
>     repo:
>       revision: cca/v2
> 
> … and the QEMU options are below:
> 
> qemu-system-aarch64 -M 'virt,acpi=off,gic-version=3' \
> -cpu host -enable-kvm -smp 2 -m 512M -overcommit 'mem-lock=on' \
> -M 'confidential-guest-support=rme0' \
> -object 'rme-guest,id=rme0,measurement-algo=sha512,num-pmu-counters=6,sve-vector-length=256' \
> -kernel Image -initrd rootfs.cpio \
> -append 'earycon console=ttyAMA0 rdinit=/sbin/init' -nographic -net none

Note that the cca/v2 branch of QEMU would reject 'num-pmu-counters' and
'sve-vector-length' arguments, so if this works it means an older version
of the QEMU patches is being used (which also means an older Linux branch
is being used). It's possible that shrinkwrap is caching all the build
files, so I'd remove the ~/.shrinkwrap/ files to start fresh

Thanks,
Jean

