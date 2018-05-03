Received: by 10.28.4.212 with SMTP id 203csp2304803wme;
        Thu, 3 May 2018 13:09:50 -0700 (PDT)
X-Received: by 2002:a17:902:a718:: with SMTP id w24-v6mr25736803plq.45.1525378190431;
        Thu, 03 May 2018 13:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525378190; cv=none;
        d=google.com; s=arc-20160816;
        b=Ur8TwRtBLtultX0W7bvOVGk3KXh1oTaApiU07FWDzpSaFJpp4pgcy8X//YF+a3lo4S
         EZkLOA3AfGUoDfJVgr9/UeGnvwLlwB7ThNuDJOaRpCHBdaXfWoj1tlGSdohVEFmer03Q
         QgHCFDZmlD97Evh0gMDzqMelODTOsOeVhHichzksbq3Mz0II0p5qIs7PhB4p9LE5Auwq
         8F1FwoOOKJP4gL3LenduyfgjVN86Pv3pzVEbKZqTARXi63LuC25NVSUPEKdFYsbk9EF/
         cloZE7bko7kLecYVPAc4IzjmH5KrOfOI35B+b7iogjzgUtaS2CjM4mYFWfmB4haBmX2V
         iYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=+tBYBfKLDLDCRME24BFmGnPnS68+FKA2KH085krEfhg=;
        b=GNgxVbw4EGUzlwOdNDdUoDlikFL3XDZxLWPL1cUI2X+652YoNpBm14TIW83KYFictK
         akPkULVPO7hLB1Ge6/HrQ7NIFDFC/zrQcmbF6zuPV0xLUfs0uNawRVhfuzsgePVG409b
         CSxK33N+RrT4q1AJgiFXgVXoJZqjSsNYGMLk+ZhT58CRauucGapOGWnNn3qUgZA9lPMq
         FukJiaCQGHbegx0WVtF4Vyc1mImKlMWX0QQvEV0NY+hhh0/Ik+e47VDuVJIlcPoFhuVG
         Khc4ps4gH/K0p3qiRQ7A7/Ijvpi4m00dpnPBWMH34iksbCCpOyeAaZs8dKx5boVHBL7J
         eDUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DC8TgvN7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h132-v6sor3140136pgc.390.2018.05.03.13.09.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 May 2018 13:09:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DC8TgvN7;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+tBYBfKLDLDCRME24BFmGnPnS68+FKA2KH085krEfhg=;
        b=DC8TgvN7ZFR58L3avryAg4l3zooDQzJMNx7ai9ilrnWBGWujgWM62VS0jb7+lXvfcT
         +glBq5Hn2rVtvqO+OxFpfndHO34nGeGeCuU9OnSklHStmA/Fo3z/NnE3M+SQUXG2jwL6
         5KQgyXLuMeOx9mjaQuUEEXd+X+Jcun1GmhNgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+tBYBfKLDLDCRME24BFmGnPnS68+FKA2KH085krEfhg=;
        b=pWZG8jVZd5M/Lkf1TwfbjwWutvz5udZD9Q76TXiU8L6cJXrB2hbzXrdlzHog5zrAOo
         Tx/EGrGN2Gt5JLCKTRNajETVFrgdwahk4IizXcWCQpRO9+PV8SbWiiMRBYNPJ1018NZb
         nQ+DRsBH99Vu9SASRI3aRCQFOu7MlzTMy4Lufij+WivknYWNLKRDClmW79UC3X2h4EIe
         Vls53YDdiWYohw9zXalW3InEaSOMLsvN24bijtV2VVzflFAfunhs7EZ9sx8ZpWO2QFSK
         2RPZrkyK7hjkGc3GAWV6TKfmWGPB0bLWZhTJEeNIpzviFWTxtV/51ULVMOf0k/dzGHxO
         S/ZA==
X-Gm-Message-State: ALQs6tAynS8BZ6baXfaT3kyuPQtvPtSwWcgUDMdc2RPu1ETTgDrj/jJ8
	moc4qupzhxbfsyI6kjQgmsQ1hB1IdrmKjw==
X-Google-Smtp-Source: AB8JxZrEc8HCJ2TC8HGubihZ50kEP8b9qO1j5roK2gqS6FWsKEuOSU1fWtmmhrubFf8Cn82WedyGEA==
X-Received: by 2002:a65:4944:: with SMTP id q4-v6mr20648662pgs.424.1525378189852;
        Thu, 03 May 2018 13:09:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id s88sm42199644pfe.43.2018.05.03.13.09.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 13:09:49 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] fpu/softfloat: support ARM Alternative
 half-precision
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20180502154344.10585-1-alex.bennee@linaro.org>
 <20180502154344.10585-3-alex.bennee@linaro.org>
 <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9549d686-899d-7b3b-dae3-d3cc22528e50@linaro.org>
Date: Thu, 3 May 2018 13:09:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: fwP0DbSFY/bt

On 05/03/2018 11:17 AM, Peter Maydell wrote:
> (target/i386 notably does not do this, we should check how
> SSE and x87 handle NaNs in fp conversions first.)

Hardware does silence NaNs.  I tested that earlier:

https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg03114.html


r~
