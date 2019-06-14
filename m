Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1242185wrg;
        Fri, 14 Jun 2019 11:10:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxD6a0MGT1tSdVNY8F9qf0MhgD8lE58Gw3R7FGOdS4LkwEW6Uy1KmDI2SGxRH9tyLOItYyW
X-Received: by 2002:a0c:af57:: with SMTP id j23mr9593623qvc.241.1560535811820;
        Fri, 14 Jun 2019 11:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560535811; cv=none;
        d=google.com; s=arc-20160816;
        b=LjTSiB9fFZZt+HM64F4NKugtfbrDqZGUony4Fe85uFEAz2Em+QDN6UToXdoSh2DLX7
         0nEMa2S5GeImgqJYAMRoPihmZjaR7mSdyBQexCrhsrNS34amInempDIBKRmzP+jCeRaJ
         Xs92TU/Jw+y4TYhPKxKOJeTb3sREfnhFi/IQ40Tog5mVkxKnyfFNaoIh2r3LMBszoajo
         gE1YSFm8DZyErq8ybxMvH1rfN9KP3QIg77fD1g26RKF7MPFvEotVggwzXrQQpuncB7Qq
         JdsZ/tbFS5gwkNbNJ6QTNeyRhVOcXLsZ6jX3wtx2Rxhqap1dgxfl2l5edBlNfUrYEdhC
         L8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=LlS1hpBLWmHEM1A11aLI6LHfCuy3M1DT4wRIl+35yVg=;
        b=CYyqSNQVPN41wZVbhr6Deqysh2jGwIp05HWr8O/lqlsubx0RfCe9yTY+eYm7F11wmz
         2W+E9+OpCsV7gu4B+fds5Ymu0xHCoJMXMd9P8o6XrKiIb+by1xfGQnbmBNNo5YhO0Bac
         FUkc/uK/Sy478Lvhv8H97WJ5fizUs2Um5KBWBtedLph0EKY0SRcbB3r7eKoeL+fU0dF/
         NNKss9nRQ2awtXlIJNfnlyhYlfUfjbGIv5EM6qeSUwP3ehkYENQnYibE01AAxBGJp4Vt
         7ehDbP2zhhgWyDLySWHvnYSvcxjkwZQ6mUBNl1hQZ7XjXz1Rp+qlrd0JrW7wQqpVncD8
         jviw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fc3msskv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si2245618qkb.200.2019.06.14.11.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2019 11:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fc3msskv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbqeR-0001jL-Bs
	for alex.bennee@linaro.org; Fri, 14 Jun 2019 14:10:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbptq-0008NG-0N
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:22:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbpto-0005Bi-TO
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:22:01 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:43027)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbpto-00050L-Me
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:22:00 -0400
Received: by mail-pg1-x544.google.com with SMTP id f25so1901757pgv.10
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LlS1hpBLWmHEM1A11aLI6LHfCuy3M1DT4wRIl+35yVg=;
 b=fc3msskvwwzk/1rD5I5E1swgmOu4BgNIqkS30mbTmaKvMZBTpxj6Cr/sbCCqlQa1KM
 Ouc+JI09rQVM6cYWmCLxx3YqGEKCujVkx6WDI/HNXy6tnUNwhnbRKBo1h2wBMEm013vV
 PIQasiSp+au+fCcRZTuwX0MLCGw82gz/ljEYagaej1XPF2OCqR0LpjY3982zdcspv+5O
 Rhht5FI7n1GlkWX/pap0btpAJK6hoSMRVqyEyMTMqdiVDDtxWIRSML9+l5AUnCSPuxi+
 Z+Ug2WVSNq7LV5lZMq5T/gH/FY/aQnTG/jbuV676N9c19P1NYUfd5BFv+tt9IXiZKTxp
 Sn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LlS1hpBLWmHEM1A11aLI6LHfCuy3M1DT4wRIl+35yVg=;
 b=kYJUUw4xXJO0YZGytwPwPYFqjIS+VLRQabOQvolMHEsZR4GuC8GHZ+rLp9WnueNh+m
 49+Y0TRrFR+nl5gqSk5K9z03nH/GiGevzbnhR+Rr34ygZ3aP6rwEeQ1MXpWofheyCqsz
 VkdULTYTn9DN2CGCSslJVHMPVOqgwJpj4+dSyOScPTdSFBicbHDJtUDyN4DIPWYA5Z5I
 H5Hj3HkUc2Ny/28xvkIWI1ENxT4UC9VWt3LVcDLXI1M+OdS8r1bQ97gsmeISykuzQFrQ
 fR12U6scBvstcGFPetFmfgTpE+uBMd/dvuxE1uSxM8GFkPhw4Pe82xiqNL5Clbd/+5FA
 2RqA==
X-Gm-Message-State: APjAAAU45t1nV4o+kIJsI0nsv//28B9AYHVX7KMqKrdR+nRrTKBsliaS
 zvehz7Te/gkYsjeaEeQQTjYSCq2fENA=
X-Received: by 2002:a63:e24c:: with SMTP id y12mr36633790pgj.276.1560532911219; 
 Fri, 14 Jun 2019 10:21:51 -0700 (PDT)
Received: from [10.1.2.220] (50-247-96-158-static.hfc.comcastbusiness.net.
 [50.247.96.158])
 by smtp.gmail.com with ESMTPSA id d4sm3582963pfc.149.2019.06.14.10.21.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 10:21:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190614104457.24703-1-peter.maydell@linaro.org>
 <20190614104457.24703-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ab0b9cf8-98d2-1901-a8f7-259d6426f833@linaro.org>
Date: Fri, 14 Jun 2019 10:21:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614104457.24703-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH 2/2] target/arm: Only implement doubles if
 the FPU supports them
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
X-TUID: +mLkjzqwoDVw

On 6/14/19 3:44 AM, Peter Maydell wrote:
> @@ -173,6 +173,11 @@ static bool trans_VSEL(DisasContext *s, arg_VSEL *a)
>          ((a->vm | a->vn | a->vd) & 0x10)) {
>          return false;
>      }
> +
> +    if (dp && !dc_isar_feature(aa32_fpdp, s)) {
> +        return false;
> +    }

Would it be cleaner to define something like

static bool vfp_dp_enabled(DisasContext *s, int regmask)
{
    if (!dc_isar_feature(aa32_fpdp, s)) {
        /* All double-precision disabled.  */
        return false;
    }
    if (!dc_isar_feature(aa32_fp_d32, s) && (regmask & 0x10)) {
        /* D16-D31 do not exist.  */
        return false;
    }
    return true;
}

Then use

    if (dp && !vfp_dp_enabled(s, a->vm | a->vn | a->vd))

?


r~
