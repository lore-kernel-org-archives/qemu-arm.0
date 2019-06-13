Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp205939wrg;
        Thu, 13 Jun 2019 14:23:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOiHsIOfD4kat/PyRvDbzj26TFwVDV9yG1+2B2GW7qUTCORCELWscx6etNMjLOa/mExTa/
X-Received: by 2002:a37:9f12:: with SMTP id i18mr22271888qke.111.1560461000380;
        Thu, 13 Jun 2019 14:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461000; cv=none;
        d=google.com; s=arc-20160816;
        b=IknW6XJBR1O6PWkC1fb9KKK4E5dm2a/DuB4+lJY4gEDnkJV96JlOq05/MyKMvqLkOx
         Fio0QJ2Zp/9gJ8i2kfGoKz6NCjUR6Ky1lJu8YRuVfHbqbt7OxfMmjAIuhAorN1GOldBd
         Tuabo8qJerjdtghUv1j4fsaCWS0QV2bLYLlMBYdQyUfnNN7SAAmr1W6beYqPZ8X0arZ6
         nv6fE/+F3F/VuXecmrr3SuRHRMQmy5r3kAia5yTvOVf92tzJMDrWwlqqwxOhZKP9ECmt
         ns2uSXZlnfqq0GMa83V8sqWn3gB9JaxPEMhzOeoveM4r7TpfUhgTvEsFQkOS2KAsb4Mg
         q+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=OAP/upUtegrxqAywk24FWAl1YAXKXMifpg7i+kWaL5A=;
        b=BNvSUh4mSOBkQ2pHnzaoxd9e8k8jmExJxuyNXeVlB1KpC0d2GOkJqafR/ZV+40j9WO
         CxNM7qBrqbvtht1MZZcT/cNB1/xYuxX6VpTGYXM8XIi+AMrbso8XX5yfU1WbXzre4s2l
         qRH0Zev33sZ3ek/hJY5pnrpplsvgDMUk19iGmNBNvzDlbXGZT/uo+ew+czUi/sxCELTd
         fVJgv4kN1SoM3IMV1UZXd4grpmMK6VeNk6lob8WzhWXRpcrvndPsBDaFadEjOxRb51Zm
         fTarmGLrtJKeqNHU0VD//NA5l2nQ0NKJXksLPl4R3ttluM4c+NSnD8yxisLLm90NU389
         1r/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQyk9Asa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u199si386818qka.232.2019.06.13.14.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VQyk9Asa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXBn-0006Yy-V4
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:23:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47209)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXBL-0006Wg-16
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXBJ-0005nV-LE
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:22:50 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41907)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXBJ-0005fY-Dz
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:22:49 -0400
Received: by mail-pg1-x542.google.com with SMTP id 83so217624pgg.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OAP/upUtegrxqAywk24FWAl1YAXKXMifpg7i+kWaL5A=;
 b=VQyk9AsakF59WpTEM2iNIS+Zxmyf2WxC2h0aBiG7+xbT+1l+lDn6QxYq9G1Lslm6Du
 ndAAdx1P8ks3Qudmve6nEU+ycKt4I1B5sVW3iGjwjIHmGPvXDnXFVn74qHTjL0HeXaqS
 yblHsyehFoxyws9nktNbUCfCwhFTMmbkNxR2ng7tOWqjNDV/gfJY8+1gdFN59m/5aL21
 +mvwQxAtknQ2fHv1DS2LzRzSFJc+M6D2nM0SDH09RTc3Uc7fdolhDMxPw5HECWW8oTey
 gIykI/LrsnfEkNhtBmkRYomZFtBI5fAMqkLReQYmThQlVhLMMTtY3ztMtkZb7U+Zmz4M
 3j3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OAP/upUtegrxqAywk24FWAl1YAXKXMifpg7i+kWaL5A=;
 b=EpqJBJFvMfHADd1n+6oPGM3km3hkzg1osaaY+Y/iYYvFpXSFfe6K52IqPuxyTzymVX
 3ykDrlQc38dV5bLzSDgndIYIJtbSzKZ3TW0q3CwT48H3I2KzWl92wpXwYV4J9qFkI5WW
 5GvZPZata627NAmEs4uNFxXsl9Ug22OCnu176MijjKA92trilHcaoWiDoSEPX0aqD7qg
 uSkhHlNadGMAPSLjjx8ArCfJX+M8qywFjGbvgu8CH6kZJ7H/LWMfTO2zIHIh1Mxlikeh
 bB1mmsKlfqIc/wmJ0rskiNbTkaFJDT6Y9rUjA8Mt7eirgqCHoiA5mAaVdkQ/ohi0xA0K
 Ut5A==
X-Gm-Message-State: APjAAAV/zIetb/1FPAkd3cvU4xm6dtNpZrAA5TSRGm2vG4v31LNsZwOb
 xSwaDkHnxUqWucHIXPAQv0hwq5KRJB4=
X-Received: by 2002:a63:161b:: with SMTP id w27mr32053658pgl.338.1560460952862; 
 Thu, 13 Jun 2019 14:22:32 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id z32sm699239pgk.25.2019.06.13.14.22.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:22:32 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <774598e5-f859-5da2-0702-723ff0654931@linaro.org>
Date: Thu, 13 Jun 2019 14:22:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 01/12] target/arm: Move vfp_expand_imm() to
 translate.[ch]
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fpI9O2Kw8KuP

On 6/13/19 9:39 AM, Peter Maydell wrote:
> We want to use vfp_expand_imm() in the AArch32 VFP decode;
> move it from the a64-only header/source file to the
> AArch32 one (which is always compiled even for AArch64).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a64.h     |  1 -
>  target/arm/translate.h         |  7 +++++++
>  target/arm/translate-a64.c     | 32 --------------------------------
>  target/arm/translate-vfp.inc.c | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 40 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

