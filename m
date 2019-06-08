Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1557545wrg;
        Sat, 8 Jun 2019 12:53:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyOtBFcmakw2TTNsrZCBwfFO7mfLw5Ivk8eETE3SZZCKx1qMAg/b4bgesxVF0L32CjnUlvV
X-Received: by 2002:a37:5c8:: with SMTP id 191mr37683344qkf.188.1560023633598;
        Sat, 08 Jun 2019 12:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560023633; cv=none;
        d=google.com; s=arc-20160816;
        b=H0nJQyuYoFL1FHcyo2nvOtVKgGsF0Px3J6Mweo7kupMYGnhymZ6BmM/6o7oa+QFwzp
         0a1ybtxq0CL9U0fUT2rz0b0yhfGXvJhTItjxoyPFShJQa53Vbr1lv/Ej6zL3YAbBpEIs
         NyEIxBTC0l4tYjVq5kZWKy9yy26ccGtKOv0QeGS4myxmWqpY905Yi5m5w4JqY7vs+FWG
         XDKvxo2fk3ZRhsjBPuKf67BEmdZJR5DROt/4CZLOxZnAy1AJjM0NTfiPF8cZZlDTYnKg
         QTF3g6Pl74T7LYl0dEUh7Lhozz+tJKvxnzx7dT9/wp4x2CnYFqGfszaf/urHe/nihqgZ
         y4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=D0T3yZRfPk4lDB6Edil8u0QZXzCrtgAdNUf1qcTJrrs=;
        b=oQM7RuD9ndzF7YdTLMyVJmRgJ76+dOpMHPishsW3SjwKWsEaihArQlXJxJfwu2vIBi
         veb4/8Rce4ut3HCjjniaZlB4yGta9QD1EiessndCIrOJ3VXHQXnA/B+K4DB49NXf4T7D
         KNzavhw9KxUuuLYd2XRptqx/UZKqA5WfNQ+0zo6EmTwg76C80jpLU9uQcI1BGQAjOk9+
         vc2K2IPLH/UO46/DjBqhkfEyczKT5tzxfVXuDZsCppPTvUl3Mog5jkX2P0KYk7zOy72m
         t/updRPrnpI/rncoxdAtmviFuvVzvza7pg4SAzVgQbBZIWWvK4c+ixnIF6Yk8P6fXhq6
         EQNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lWFGlibN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si1769740qvs.94.2019.06.08.12.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jun 2019 12:53:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lWFGlibN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZhPV-0003VB-6N
	for alex.bennee@linaro.org; Sat, 08 Jun 2019 15:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3Y-00011G-No
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZh3V-0000g2-LG
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:12 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:42350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZh3V-0000NM-9C
 for qemu-devel@nongnu.org; Sat, 08 Jun 2019 15:31:09 -0400
Received: by mail-ot1-x342.google.com with SMTP id l15so4903906otn.9
 for <qemu-devel@nongnu.org>; Sat, 08 Jun 2019 12:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D0T3yZRfPk4lDB6Edil8u0QZXzCrtgAdNUf1qcTJrrs=;
 b=lWFGlibNiT1FQDAJLOu3Y4C+B5GlF8yYTQ5njyJL/t8ejuDKfgCHX2q5pQTB4AJUKq
 iXVgSibXTzG4g0hzfK+GJGnrC6zxlBmGAbZLAZKjrp+eW4avAxY/L+7um3qVAJbMRWye
 CUnjY/hlLN4suUGqPZZPT+mfU2eBvhgsSezWnSu10tyKW7z4giGwAO9iVXLc3KEwbRGF
 M28xdeayLf4mUUVQJI0g8dN++uKwfyEBzQel8VTkfEUSY+ws8Mu/t/ETM4HoGIziTKko
 CD8kkg96LuINIHmF3rgfFJQ6FZA2zNUkNZCDLa9+W9Y0ocXDCZ0ch954mSFKSVj2S/8X
 FSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D0T3yZRfPk4lDB6Edil8u0QZXzCrtgAdNUf1qcTJrrs=;
 b=r4zwRFnZhnomDyOOI1r7Imsu0+67njpK697Zz7px8AJKKe2xIhpAiAo4XfRjDGyReB
 2GY+zfUBQLU/pPCs1Xje4yPkRPu36dbSntqX3G6C50Na39S1+OR5kwFK1gYJdcHr32Kc
 dpKt9tPtVdVtUmbXAaJ61/2n0vz2h1fOMJ6N6JhF5CIFx5DEzbKafb6GbktameKcIgll
 ZUQu0uFypY2C6xXKVUDpqgVd8G2BIdo7TfTCYs08qgrQ38Ou+UWxewOUOoVHXoa/H+L8
 a9VwqWo+obdjzb0LXIowH0RjDetfeBZqZjoJC6HnVNdojYLi05bZq5S6sTm01yuq8nXw
 2org==
X-Gm-Message-State: APjAAAWQTO+gMZCWPWiQ4sMv+abmvkuwskBkSFd8EQjoj02bVC70P4Cx
 PCvGYVwxrRrDVyJVz0bLNRdkkKfUI0U97g==
X-Received: by 2002:a9d:3ee:: with SMTP id f101mr23327411otf.311.1560022242263; 
 Sat, 08 Jun 2019 12:30:42 -0700 (PDT)
Received: from [10.219.49.199] ([187.217.230.84])
 by smtp.gmail.com with ESMTPSA id l31sm2221430otc.30.2019.06.08.12.30.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jun 2019 12:30:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-39-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <84935bd5-4efd-e704-ffa1-8deb2d44092a@linaro.org>
Date: Sat, 8 Jun 2019 14:15:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-39-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 38/42] target/arm: Convert integer-to-float
 insns to decodetree
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
X-TUID: OhkDcKMtHmmD

On 6/6/19 12:46 PM, Peter Maydell wrote:
> Convert the VCVT integer-to-float instructions to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 58 ++++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 12 +------
>  target/arm/vfp.decode          |  6 ++++
>  3 files changed, 65 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
