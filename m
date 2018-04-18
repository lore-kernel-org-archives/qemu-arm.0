Received: by 10.28.4.212 with SMTP id 203csp297514wme;
        Wed, 18 Apr 2018 09:21:09 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+BRpTl6q5rJYLyTniN7kUMLjGiwLk2DXpCgfTLveQBM0NSKRcmTzxtLXXvuUTYf0ahX4lP
X-Received: by 2002:a0d:ce43:: with SMTP id q64-v6mr1522785ywd.47.1524068469148;
        Wed, 18 Apr 2018 09:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524068469; cv=none;
        d=google.com; s=arc-20160816;
        b=kWt54HSuOoPVTtCVWsOhRAiwnoJkERy6gIl4SjvKGuIcin5nBmTCNQFRFKUZkFz6e3
         w4PRRVT6kL7LbTsZQALbtcqofiqrPHx/EFMf7sivFu6TRSmCtQB8M0UX4azmc++PTYPq
         H7R7s87JXdYOHl1WsUShlnjx2zNG84W6h/WfMqV6BZFJYS9RUQBlTNgFTKVFvwRsTYE6
         mqvpsI9/J/M89CAGvNFveUFVgmO4NG1yVJNtA9v+kvoiTLvtdocXReGfunAqVU2Cszbe
         4nvdPmA7hjH5y0QaDEeRWG15hTk5MPx837ssFsUeBFWNeCWkkxadWTwc7GKuf8phgYaF
         fCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=tNQBGK7+xKrQbIM6P+CidsPPg8bZu6dHd9wyCah/oMU=;
        b=tVPMS9LCHbx9nrNo3UOFuzsIHZx/Dq5vPCXYuk6jTLhoou08D7UAW4Ysco7LsL7MPx
         zP8t2Lb1viXXK1dDMZAumUa94VgtExrATO/fUnc5HVMn2nGU8HyVSlKafVnoMZjyv4k1
         njPTOkpkPxvhY5BATez4DEiw0+BXBq/EfnF01CtFZ38hTOm5Jd1pp6AcXZLdwxH/gvw7
         3uTvgzBPJvgkLTi7NBML/JkHMcoCF8o1iL9bhtw+Yf0d11mSP61zGt9uYCmrpzsVX4Og
         JLnKx9BdPQJJ7+8WmRbDNlsUPM6XKunGTHnrU9BnjC+7wn5ShlxjRJPEvawq1ZvQ973f
         N+fA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QRWdrgK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3-v6si842883qtp.263.2018.04.18.09.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Apr 2018 09:21:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QRWdrgK5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8ppU-00025Q-KC
	for alex.bennee@linaro.org; Wed, 18 Apr 2018 12:21:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8ppF-00023t-Fl
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 12:20:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8ppB-0000jo-Cd
	for qemu-arm@nongnu.org; Wed, 18 Apr 2018 12:20:53 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f8ppB-0000je-72; Wed, 18 Apr 2018 12:20:49 -0400
Received: by mail-qk0-x242.google.com with SMTP id g7so2376466qkm.1;
	Wed, 18 Apr 2018 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tNQBGK7+xKrQbIM6P+CidsPPg8bZu6dHd9wyCah/oMU=;
	b=QRWdrgK5HWc2MiePIBikYG62eBcIl1lXpa2siFsF9zRsmBZAsRtWqB0e1IhO6kia1E
	H9zty55xEOk+JXA27e0VwtHz7A+mBXK8Sz8Nb2liqi1NARe55ImWdXQZfGkLTFYDMjQc
	lR4a+lufkKwbG/HJGlpE3Q2gRV3xX6BY2iqeFMMx4m8AnnuIu82+WMDc5jfp6bBff5l+
	I7ZeDLu7duEY/tGAh3mB60+ftrwLEkMMjJqQQU43bWIygVV729JyNjjc0c3czDLBP2Uy
	bU3rwDLD4nI666VuTge1jbJczZ46JB4ld1OBfWmmFIktbVHBpWGco4PUNJHLk+z+c5tA
	32vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tNQBGK7+xKrQbIM6P+CidsPPg8bZu6dHd9wyCah/oMU=;
	b=VGIeONR7+GPu7lZbm6oKoTv6P06bX7bPd3aCi5ElM/ag8mLII/gaRhywsGm7BaN23r
	6T/hiKLdEXiLTy8fUvQECjdRHttfhmRLZURF5vp8yxiAsDE7nbeMQgthY/SYyyTyfG/1
	GP3suUPa63J7hMWhsvbY/yTok7quKGTm4s7RNmHXv7uQemAQG4xIoEoIIbqyopRqfuQS
	bxzsTi6C/M6Sp/j6jbYQC2tyo+G8LabOqN2v1DRZtTZvMVZSfVwIYicAsvxMp/b98gPs
	5YYvn8sZzrSi/mfuI/jie8k236ba1t0y/0hKZW3kFyc4+lfhCtSQT3AiR6jZ74UMvZzF
	hCdA==
X-Gm-Message-State: ALQs6tDalVOORrbW43xzMzk8YnilZd+EcfVT+VXhqD9WbfbHvsTOS4Gh
	28xNDido/htPHDhswqmJWMI=
X-Received: by 10.55.123.199 with SMTP id w190mr2650408qkc.195.1524068448792; 
	Wed, 18 Apr 2018 09:20:48 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	g12-v6sm1099334qtj.42.2018.04.18.09.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 09:20:48 -0700 (PDT)
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1524061685-83305-1-git-send-email-imammedo@redhat.com>
	<1524061685-83305-2-git-send-email-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <60e0cbee-0c0c-7e58-a0ab-e015196359f9@amsat.org>
Date: Wed, 18 Apr 2018 13:20:45 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524061685-83305-2-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH for-2.13 v2 1/5] arm: always start from
 first_cpu when registering loader cpu reset callback
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UuCRKg6tttNa

On 04/18/2018 11:28 AM, Igor Mammedov wrote:
> if arm_load_kernel() were passed non first_cpu, QEMU would end up
> with partially set do_cpu_reset() callback leaving some CPUs without it.
> 
> Make sure that do_cpu_reset() is registered for all CPUs by enumerating
> CPUs from first_cpu.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 26184bc..9ae6ab2 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -1188,7 +1188,7 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
>       * actually loading a kernel, the handler is also responsible for
>       * arranging that we start it correctly.
>       */
> -    for (cs = CPU(cpu); cs; cs = CPU_NEXT(cs)) {
> +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
>          qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
>      }
>  }
> 
