Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1109679wrm;
        Wed, 9 Oct 2019 08:59:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyopuBU27KJslrWzeSRrXTl8mpNYgdDSwo8WMmjBed/nUHHYTgu1OVEL4Ak0/tWQIneL8UK
X-Received: by 2002:a50:afa1:: with SMTP id h30mr3658080edd.126.1570636754232;
        Wed, 09 Oct 2019 08:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570636754; cv=none;
        d=google.com; s=arc-20160816;
        b=u8Dm3eg3EzTnMRRFHqKgb8I2RcWGiWetd6ey/0ndKRJvq7EVwqeeyJvWox1ONWR+dN
         wyYZzNUaL2JxjiKuySfQ8Ie9buVMR7n9MfgUupSzFpC578X0SnJA3LP7CLMPov756VA9
         EcGpR+xv2De3rJyeRGC3xOuPU6SsI6Cshcj8F/BVGjv+Lwp0V0E3kZ+AuTxXU3EtwqEv
         cso8KzVI5lRK+cwFL5y38IjUYrI2naAmqCcOPNpeqOPYP83PEs3mvPz3Al3BGE82PBLK
         zQuNFpDbqOgUT2Rb6FpL1gDUPG8NgvF4Agnk+z5AeWpdv4B565GcVzSSojaE2wIbAp7S
         Ii2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=lJcDxLjZN8EWAGjaDhdXnvgJ0Jgx9VJRnTuXoS6NHYE=;
        b=HKBpd7TfCm4NstHcL+u5fTFE2v+Nj/SxsfL/tugVo2rqTAoxbCmNZnXQrqJVS9pmLY
         Rd/B4h2HmHdxhXlMgojzpPbq+TG20xA73qq5Xvy33MMatVegLSixX2Ofb0HfnCY5hN/P
         CsVqSzn6aWpMsyMuJEwu4XEgx0UjOm21h5BdSIDP5cYUslVATPvAJfPYbsdYrFAr3i9+
         V8IMuN8JxH4nyYhAh37beZGLhU2FEr7Uy0+rTWdlcajTeT+TKYWoe2mNbzOwGtCw7zWR
         VcdajtNjkhk60U70H5dVGezytqzIXjHSZfvUzsyvl/fG/n3Kpb049nA9veKf6g9EN6D/
         tB8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AWBWAWrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si1591069edc.50.2019.10.09.08.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 08:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AWBWAWrh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEMp-0007da-Qw
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 11:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tI-0001nN-FH
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1Nn-0004JG-QI
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:07:20 -0400
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:38789)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1Nn-0004Iu-Ky
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:07:19 -0400
Received: by mail-yb1-xb44.google.com with SMTP id r68so220466ybf.5
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 19:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lJcDxLjZN8EWAGjaDhdXnvgJ0Jgx9VJRnTuXoS6NHYE=;
 b=AWBWAWrhRFL7qaUwhCjcI8vr4wJRMRz2fCCOQuFa4v7Mz2Xs2vjJCm7kg3ZqAt0/4C
 vC5P5gNJGmwjOND0Ct5ALps9Th3hozAIxgL2zGPjDiQBoEPc3hhXMHMk5dekqYitdcLd
 /RbnfdwXWXOpJUGM2UMm9OiHoa/C2ybjT4X3nRbhbSDjlBmP59WSiCHTtRrb3ZjfjUPP
 JSe7IqV4HdkzbpQ7s1JDVJahdcLK5hsCdxVGXeHXIPU4nEDfKNUjnl+b1roczONrVGKT
 K0ajixFUz381fi1tRVz/weg1t2VhKAsaaaOBurII7DG7ZNFRaf/Bfh5FDK1NwZUlOeIc
 n4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lJcDxLjZN8EWAGjaDhdXnvgJ0Jgx9VJRnTuXoS6NHYE=;
 b=tRUGe+14CpOmFzz8V/UnNYGrhIX3FXAuJhYYqc+DVsvP7eZkqfxLV42hYTrhlBK5wp
 uxgWUqCeR60QMibPi6042ItnJpZFRTiIT113S2Mmpabb4ojlJ47J0PeCtpbhalfYVKeP
 Hhp1Hejn6s4q7Kl4aq68k2i4aZ4sO+RU7VxEzQwIPkqvYXf9MiGo8iP6amtkUw7wS946
 3OiiKsVWkq8rBczE6wRuvTMPY8eXMzw+RzCLa1rcuuQBY/zSaWVu9yAbJQ9y4eA2Vmau
 +V7hbo538XvGNXKDfNVFzAwty7MCHnJZ62HFtnBVRZPlNsGIx6sMf4OJdHK9sOIJRFeF
 WIYw==
X-Gm-Message-State: APjAAAX0Mo/8zrtnYTFARV+bCd3ATJXd9Wls5On433CPPdhEl96WX1u9
 zrxgYhjIDspAfLGzkuiXOuqkVA==
X-Received: by 2002:a25:abc7:: with SMTP id v65mr514540ybi.59.1570586839088;
 Tue, 08 Oct 2019 19:07:19 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id v63sm211802ywd.100.2019.10.08.19.07.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:07:18 -0700 (PDT)
Subject: Re: [PATCH v2 20/21] hw/watchdog/cmsdk-apb-watchdog.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <120aed7a-ef86-900a-c0fa-3525b94584f8@linaro.org>
Date: Tue, 8 Oct 2019 22:06:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b44
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sHdvJvtsmqvK

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the cmsdk-apb-watchdog code away from bottom-half based
> ptimers to the new transaction-based ptimer API.  This just requires
> adding begin/commit calls around the various places that modify the
> ptimer state, and using the new ptimer_init() function to create the
> timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/watchdog/cmsdk-apb-watchdog.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
