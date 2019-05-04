Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp77906wrh;
        Fri, 3 May 2019 20:54:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzCbHPSSHhmcLjh2+KSUYg1S/ic8XLafJJPKYywqXZmFxQ+kZ1xq1rxOJDzJVNj7U9wazOS
X-Received: by 2002:adf:f14e:: with SMTP id y14mr7735987wro.276.1556942088268;
        Fri, 03 May 2019 20:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556942088; cv=none;
        d=google.com; s=arc-20160816;
        b=C/M+Y4DLIcEjfgdTwlBthd4SffjNST5yqankkge81bjkZXJnnoL4asC2H92GlbDVmf
         hPVbrbjOhBfa1PW25/qMJT1xCybv7ji2pG++FVs/dBDi3f/Vb/FADzO/BzfBmK0EZiI6
         lhO0VITPOBySGPwp/jdYV0K5CSs0PcTIa2X4y9X+l62MCK27MUHJ7HksZpnM5iNktiYP
         84uzMxOZwrt2ZZj1zN1drGLZJZ/snWVSGtGZy4GbhTMS1J0236uN5W5pgQcibSXTgnJH
         /CvfEDv6sDS7TmhYbeXXWeq5bIs6Wzmm6BR4qt2Yi8Uacl+zYsFMC4nwOf6N6ncPA+5N
         4jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=bmbADVETJjJN3yOaF50RhPlUcLm6ZMtMN3OCO71r5XE=;
        b=GCtdbCMceAq/wiBVbZxKSRuySellyNH1N7UrHzBPyAwTMdLO5/7Se1x9MsLpFj4kQA
         ydz89PwB/0vdGk4cPa2D4xJN6RluJ1CXZQzol6ARcYRrOsy7W/0INpaBxD1+gbF7vuv3
         Q82L7bPRkTO1sSPT3RT1fS8reSSrUs40r4C2K1jRe1KMEUvhj5O/uOjyBVmaHHNQvmNh
         XEapAHhda9/y6oskjJWfJwN37DBraJQSVz19q0Hjcpt1RIbrRHqD5XwhCI7xAkqgUuwl
         QLHpI1WbA3ewz/0C2iJw+KBhMvCPV0vkKriKUhGA619VVvuKasD+hvf1Uqh7B1adf3mk
         3F2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uWS1HAU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si3107055wrp.39.2019.05.03.20.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 20:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uWS1HAU+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:50622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMll9-0005sc-Em
	for alex.bennee@linaro.org; Fri, 03 May 2019 23:54:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMll1-0005sG-45
	for qemu-arm@nongnu.org; Fri, 03 May 2019 23:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMll0-0007Nz-3H
	for qemu-arm@nongnu.org; Fri, 03 May 2019 23:54:39 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46360)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMlkz-0007Mw-R4
	for qemu-arm@nongnu.org; Fri, 03 May 2019 23:54:38 -0400
Received: by mail-pf1-x441.google.com with SMTP id j11so3855015pff.13
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 20:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bmbADVETJjJN3yOaF50RhPlUcLm6ZMtMN3OCO71r5XE=;
	b=uWS1HAU+WvCL0FRoj/JyGdd+ZE0Ajqe5JhrzpMu3/PrV6NH+PVCjt9Kt9lNDhbLKdd
	L4RsShFsXq1iQlbN9vdlaSZg4841NOj+SXB61Owhlt7XL3hBcCeTb6pEbPIlj+t8eRBE
	08QPZWyrrmPkzb5kNDRq82zpQCrq4YEXu38fKnBXrSDj4AMTDDI3e3e0uDJWLjdFJS1J
	WIHPXOOSzYHhrnQX9FvjvL5QG3+64L9EKRRCBMaBEAmM0nfgK0FcQvbd7JNP9FLO2tc+
	Bdb1gU3qUndHsVPf/w1hZ3YoMEIgzJJo8EziWVbPJbXfG/XrUCY9uJXqGtwSWPEvhuJd
	oTXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bmbADVETJjJN3yOaF50RhPlUcLm6ZMtMN3OCO71r5XE=;
	b=pJn6DkUuvUm3Ei1YMwr5oT3TpvRH2kQf+ix4r12iKE216g+sY6KZrBSS50Yf7NmOWU
	CU9fWwmCc7hfHnciSvTL+PH/w5/NVjj13P/+CFCh/GIa+4xZZS3dZ84B4vhlMAAB1PLy
	8RwSFjbnufshTKF3yeip5SuaxJ09XoojT1cT0lur6ZiSBf2LyBF1M0U4qLmFnw6TpoUj
	P79Wrh4RmXtzrUGg4usU4NtdfkprHTRUOiCWw/95Xx8DBVjVvahVnLqqMlZAd/+4aut5
	+EQ3KyKf5AaKdm5vPbyFPfRBOJ17KeVH4ejMZnjpjqzUKpMu8Bx09OnjzfJPVaLSQH0l
	coqA==
X-Gm-Message-State: APjAAAUWCBe5HXrMovJYCBDr2rXRWQCjtxsBzdY/jJSH7bKaF09FSJts
	io4hxuwSlRsMuo6XrQBWRW9AsA==
X-Received: by 2002:a63:ff05:: with SMTP id k5mr15310796pgi.342.1556942075891; 
	Fri, 03 May 2019 20:54:35 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	z66sm8026636pfz.83.2019.05.03.20.54.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 20:54:34 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190503171347.13747-1-peter.maydell@linaro.org>
	<20190503171347.13747-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <690764a2-4998-c6ae-9e2f-11a3bfdaa215@linaro.org>
Date: Fri, 3 May 2019 20:54:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503171347.13747-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/boot: Honour image
 size field in AArch64 Image format kernels
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
Cc: Mark Rutland <mark.rutland@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Psdt1Fl73a/V

On 5/3/19 10:13 AM, Peter Maydell wrote:
> Since Linux v3.17, the kernel's Image header includes a field image_size,
> which gives the total size of the kernel including unpopulated data
> sections such as the BSS). If this is present, then return it from
> load_aarch64_image() as the true size of the kernel rather than
> just using the size of the Image file itself. This allows the code
> which calculates where to put the initrd to avoid putting it in
> the kernel's BSS area.
> 
> This means that we should be able to reliably load kernel images
> which are larger than 128MB without accidentally putting the
> initrd or dtb in locations that clash with the kernel itself.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1823998
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/boot.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
