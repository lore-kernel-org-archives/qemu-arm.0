Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp313332njb;
        Thu, 8 May 2025 03:19:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsDFvpk7dNOwXsVpjSs9uv3fbxR2S0UsZHmM7eZU7cPvRnm9H0jwJrDxfW8ytZv10XKCKC1Hohz8YPAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFup0gaCTk4GMsrmqgWBLGyHHskGE1CBROr7c8vpozDrECdT2lZxen5Otnf8NPnRmeCWbmG
X-Received: by 2002:a05:620a:2956:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7caf7415531mr906960785a.53.1746699553232;
        Thu, 08 May 2025 03:19:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746699553; cv=none;
        d=google.com; s=arc-20240605;
        b=deoz5qpikrxaFeuADPgxoif3e0fYS91Awrpj4XM7wgsMY1ZP+IQ9z8RoWxyIC+ZJyg
         f+Ih4v6QHnPdzsxyUPMn32RCDBw2gg9FSZIEDsSU1Wvqtsx9hVkGYj+2rhRiw0kHe2w3
         rFnDw9C7/iNWyAVB9CxdI654AxSd0P7UgREO7KXQIqjLXtABdkpWAWZ6tllwJ26MXT36
         X25kp+tHIpKFUq0VMNPNZ7FX3kNjvk8PkHjsuNWxl80mLnk7Osd8VOHHx9wjbDY+qqB3
         1M8luxU3tzHWbn3vTUY0I/x6SU/GsE/C5ADMfTyWLhsNM2Th+b43tfqq7eX8DtIhQXKF
         884w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=73i+0d3Wl2gShoZApYcx1Yf5nkVre6dyVWblG7yrRj8=;
        fh=528f0q5ZBbFwFshxS9HuzcDSugBoQ4Cj4KDoEdaBXYQ=;
        b=HFiCuNW8ZMZs5HMj2dJxfF9FoXjVPP3/qa0FyuGnf37SeCu+gIT59uHHqrYs99veJt
         y9IFZm4dv8j1ah9X0PRDLxAGwi/NGPW4otQf3io0Z1BihN8f/051FcSnPSxIeiPmCRcM
         NqQqCAVnk8DQ2QTeIP/31S6Ee992Hi6mox6N7HkClUZG2u2ubg9BoouVKdAOzegeaudq
         NyqTexDvWLuklbpXnFysu9+9o6nFmABK3BQq433xf3g8Y5ippzZu78r76ClR35BRMr5q
         +rUXLseZRxKcsDBHt2SQX+/hQGqlipfAJuXhRtzkM7Yq9xqEND+FL/NZxtlT7+7YCsQQ
         jsmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8zHDwwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf752b2besi410926285a.175.2025.05.08.03.19.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 03:19:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8zHDwwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCyKy-0005tL-SJ; Thu, 08 May 2025 06:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCyKx-0005sN-70
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:18:43 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCyKu-00044I-DZ
 for qemu-arm@nongnu.org; Thu, 08 May 2025 06:18:42 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-70907505121so8276397b3.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746699519; x=1747304319; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=73i+0d3Wl2gShoZApYcx1Yf5nkVre6dyVWblG7yrRj8=;
 b=Q8zHDwwbC+1kd9rsMZewkGjl2KCiBzrNf7LZxADDenIpUFqBz1OPSN/ppwp26za+5Q
 MvGJAvk8tiUU5t6f97N9qkIeuXQa9xb8fmWDKA+sats8tETYQTL0S1pvq2P1YFdcMvhy
 yUXEu5iMW/sxp0WwZ3wk1uBxOtMcL26FHfXHvKytFjCGbX6j84qrC6yxkx5ERaRQLSQA
 CiQGJsGj14tix/mT8mblSmtYO7UAZ3jG32fGZ+S7iCSsVTFujBA9+siZ8C/yhsCK8mib
 Qw/TwngoMUeXeHiZdJlsX+dTEgeWiws1xK175TCN92CHmiE+qkh7djKVErIZ5zTR/LzI
 aaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746699519; x=1747304319;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=73i+0d3Wl2gShoZApYcx1Yf5nkVre6dyVWblG7yrRj8=;
 b=wlQXvKU4ySNH3Rwfqmow2CR8JDC8LCYmh7nCjR7PMvxX48YjaPZym6pX0rvjmzI62F
 2llso392Hwx0rraS61V5HDECxPWT3+lth3bdCkFWyg22FnAl5Ty1EzZeTQmkYRwbqxCi
 gTMjONtrpahzQMtCAvMPlZdR1xDeNAQBL9uN/U3Ej4/z61krFuOg9H8RtusE7gefwy6Y
 9331JxICULA8ooUnxXqoCKEc0axQsSKVTxRzgx/N+WerTP+M2Y5GxAV3jYfsqO494rZO
 6Pe9W8bx7tAd1wLLFpXcZ5V4b/ErtduqxiZwBPkXD5wblvo+E9juEzgOa29WrsW6vwgw
 soLw==
X-Gm-Message-State: AOJu0YwY8I6L2PRIJo9/nx5IGtm6fGRdxSsj6l3iUqoRUy8jEC3wtWLa
 soe7uRrK77VYSwsXhNP+DPPxbh1aJMsDDHUgZ0xP/sO6mt0mL+ghZIQRkL4jVjPqOW9NcZIjNvG
 3IpWgU9RU0BiaCoCDHDm7X7cNSPZSnYKGaiQM1g==
X-Gm-Gg: ASbGncs/8IpI2VCangQZcdXxkJGZwqRf3q2t4rmJyxuURsqzBR/empFqGtqlEBCPzsn
 vWARDKdvWTxS0BTnUMLmJxezFSC2EgHjrtX+doKj3J7KLxyCs6QssjTOZ+wy5U+tFQa/75I1Mpi
 7qfzkgn/Cl7TWJ+f58WojkjwA=
X-Received: by 2002:a05:6902:c13:b0:e78:f2a8:a69b with SMTP id
 3f1490d57ef6-e78f2a8a88amr1417917276.17.1746699518973; Thu, 08 May 2025
 03:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250501125544.727038-1-peter.maydell@linaro.org>
 <f337d662-9eea-4f8b-b2a4-38a46e64732e@tls.msk.ru>
In-Reply-To: <f337d662-9eea-4f8b-b2a4-38a46e64732e@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 11:18:27 +0100
X-Gm-Features: ATxdqUELS1jBLqbLlVlU_NsUm5Ifg6vQuDtUd_zZP8gaRa3-yLRmTBxVLntKKaQ
Message-ID: <CAFEAcA9eVO5PCpi8CmmrMwZrQexPOKWE-RpW3k2jwHv26NLjLw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't assert() for ISB/SB inside IT block
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4mvmN5MRCq69

On Thu, 8 May 2025 at 08:31, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 01.05.2025 15:55, Peter Maydell wrote:
> > If the guest code has an ISB or SB insn inside an IT block, we
> > generate incorrect code which trips a TCG assertion:

> Is this change applicable for older stable releases, besides 10.0
> (currently 9.2 and 7.2)?  It applies cleanly but I wonder if it is
> actually needed..

I think any branch with commit 73fce314dbbf2d ("target/arm: Use
DISAS_TOO_MANY for ISB and SB") needs the fix. That would
include both 9.2 and 7.2, unless I got my git rune wrong.

thanks
-- PMM
