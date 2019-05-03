Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp708463wrh;
        Fri, 3 May 2019 08:41:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDseUIwf3zjTVOUzxqj7MbwZCBKq20E1S9YqW2H1aSK3op5m4kE/NP6CdrtHWSB6MoRppB
X-Received: by 2002:a1c:980a:: with SMTP id a10mr7027882wme.150.1556898072367;
        Fri, 03 May 2019 08:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556898072; cv=none;
        d=google.com; s=arc-20160816;
        b=FgPh6BLSO3o5biimMJyFwFeJuuHjEPBU42XQ/ZS2EUdJRfdyCAbOgOEF0Pu/X7RSC/
         xx0ik/vGobbjtLiumLXs9yqEf1N1hw7TNYb7Na8ZPpf2AhLG3tOYpKtw3C5L/2DTxut5
         +R9B5G7XdGveYiz2lHkcB95/ccA3BWkJZUwlM9vMOlsuUnGddes0vlOYo2meoZ46tNKS
         sxCky/0q9E+JCNteLCYrFxYZF1O2g2N4idYpNbJN49Nf6JxACVuuCNsrKYy2MMe6mUmL
         Yl6aB75W3JZfR43o+fxhaePHH6UcSBIonK71Sth4i6KmY47uKfPkiQr46XkzQnoQQvBI
         YFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=J8NH6j4wRJjl9tnNHFWrJAzQEwCw/Ua6k8E4+tIFN8I=;
        b=hbeBn/rP07353QvNcDUBePEBtRyRxDXfrmO55qpgOgrscSeauXkt3kOeowJIQ0S+r7
         S8PrWbIlPDBzWdfos5nTq6fbhf72qskawdk0tArk9P9xQFtkM1Pp8owY4v7hTCraihgC
         C8LavZDRkHDcWvOGf1FFq/tV+oiigFn/4kZMSP9S1gMZ2tW/Mz0L4k2l77sTDJpGQ4HC
         gCnDcF8KYeXnCiUSyODiiIj7ZVxTIsWrpBGzaTv03gfXvc2lMd7olzfDuRyl/H+bv4GE
         78Hvp9qexkD4dxkUtfG+EDnvfwth1tkHAqEuNgzv7b35+ycrRROLhcb66uWwBPyhkL/V
         elFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZCD2Gb7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v189si611353wme.189.2019.05.03.08.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 May 2019 08:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZCD2Gb7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMaJD-0005ZI-Cr
	for alex.bennee@linaro.org; Fri, 03 May 2019 11:41:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMaJ2-0005Yx-QW
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:41:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hMaJ1-0004Cg-Tw
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:41:00 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45144)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hMaJ1-0004Ae-MU
	for qemu-arm@nongnu.org; Fri, 03 May 2019 11:40:59 -0400
Received: by mail-pg1-x542.google.com with SMTP id i21so2887258pgi.12
	for <qemu-arm@nongnu.org>; Fri, 03 May 2019 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J8NH6j4wRJjl9tnNHFWrJAzQEwCw/Ua6k8E4+tIFN8I=;
	b=ZCD2Gb7TeyIsuZHHdN+RSGiZB5L5YGQzxjPwZX6aKPjb0sTEJPm1zDEojwmdUntFNW
	CwGa0kr9IOIg4APBP5TgkV2zrc6jtW26ZP/nPMTFawI2Rn8mDMoCx9yjoaQKrtck1aPn
	Di6Usb4LrhksfRUWWAoZaODBZJyn12l+UMJ6p0c0koxp38/aS7yhlgiNT7z+gcs0UUZZ
	CihrWp72OqgXts+7Yn6HzyZZbZmKfKCUIAjw3PkBoIW5HTZqKaP+FaxQ7cy0+//HI5m6
	3km+1C1bnCx0TStBT4wYWBmL3DDnLHpO9RxfN0e1f/pjtjST0PxW3NnbQ9zSEIMjaBrj
	CvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=J8NH6j4wRJjl9tnNHFWrJAzQEwCw/Ua6k8E4+tIFN8I=;
	b=dKQAtFnVkc6Iv+s/LpMSNTbPGb33AsXN7Rgntsnah8yvlHNrQJ/wKyD8GtPPS9k0UD
	JAjXBnjGWGjhgmozis+mj3Uk7yRrfYEH+mbtc2BMBGZwp7/Ri52zsfFEILWea6iuLzUs
	UA2v4uGeit/AN08VHHNKOXi0aHtGDWOO9JNoD0zpMoMKbIqXW0EfOMGAHVd7vTURyDeA
	kZmy0lyg/m0W5jqA0N4pYeKC4lnGmiZjXN57Sntk3ErzwfaorCltk5QfBxVoTHub2Yzs
	lxtQzChaAnH8BaVpkbCEqmzQB8fnHg9bTBAdLaSMAxRFoU6RUwB0o9ETMpzJF8196eza
	3odA==
X-Gm-Message-State: APjAAAXdSqV85xm3iIsiOGOHD65jPZK1NwbSWLisBncyo8PwbBKxHoQk
	PrKHu7KxsyIxbV+q10QK9K6a/Q==
X-Received: by 2002:a63:5b58:: with SMTP id l24mr10800728pgm.139.1556898058437;
	Fri, 03 May 2019 08:40:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
	by smtp.gmail.com with ESMTPSA id
	f14sm2966898pgn.77.2019.05.03.08.40.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 08:40:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190503120448.13385-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6aa00050-1856-b96d-a5d6-ece2f794ef08@linaro.org>
Date: Fri, 3 May 2019 08:40:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190503120448.13385-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [PATCH v2] target/arm: Stop using variable length
 array in dc_zva
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ea48vNFo6wVj

On 5/3/19 5:04 AM, Peter Maydell wrote:
> Currently the dc_zva helper function uses a variable length
> array. In fact we know (as the comment above remarks) that
> the length of this array is bounded because the architecture
> limits the block size and QEMU limits the target page size.
> Use a fixed array size and assert that we don't run off it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Changes v1->v2:
>  * use ARRAY_SIZE() instead of sizeof()
>  * add a comment to make it a bit clearer that the
>    expected size of hostaddr[] is only 2 entries
> ---
>  target/arm/helper.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
