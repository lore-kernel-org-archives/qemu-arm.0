Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2904642wrg;
        Mon, 17 Jun 2019 13:03:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw/rW93jvu5GHJIcpOO1nsc2TGsI8Mde5sAU1FxGOAkjQWzLP5F6LQcCwl4WYb69pVcsGIb
X-Received: by 2002:aa7:ccd6:: with SMTP id y22mr54431674edt.274.1560801807951;
        Mon, 17 Jun 2019 13:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560801807; cv=none;
        d=google.com; s=arc-20160816;
        b=o8G9OgjNL6vqo/T3nAebpeEt3t5GHlSXvgGPN1Ytg+1r7eAyIvg7A8GGXRXlDbaS1i
         hVRvrqaZpswl9lu7bd+/tIn73WV/MPNNZ8gQ4cxbFCLwUsKW70tClzEb4x5frnaaFCYV
         Mk+hHmhZDquhO0cVdEuLp9w+JyyRtjn4jdZsGMsmgMS99aktGWO07Sq0HN8zsJXZzs6r
         J/vyk2FAKXZlv31lFxHFS0T4m1WvefhPmY21QhDgFcwuVtHStZwgY2RVSvIZGZqrNgiW
         6e5jJeHp/IkcJy1ZSoeliRWPRCNBkeN49IzLD6oZSII1vTNpvSbTwDSrXldctiA2O3lC
         XmOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=XbTs0HTzi2yJshTqwj/OCiyPfrmWSy1gyUW7PW6zW9Q=;
        b=S8ECCPEsexwUptxOnd3QbqUUM8QEKCjLsJmUDdNhEkFHrShxbCm43ImRXaiYdlyYq+
         SD7C0o89pZarEo7jHvFnORI7/XY7i53dEK94njidBVQmnJ6dHuo79OgAy/0gZGncl93+
         6wOFa4VyfyfLphyCDph9ZJI6i68/W83EsC34JzTQbhmJV48eBmhCY361gk7z9opXuMS2
         p0dNWisir8Ahs69WBYdqbsNbcQgz1KEm/u6Z208H6c6+ni+d5HV6BKT1pcsDuCrrvfW+
         bmg0ZCCsQ3C+EgHFtPrL7dvlqWwuMWMK18N0AYaFNcODaKKUxGH5aKQhpHucLEX1Y+xu
         TGjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TziHy47C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si9251174edb.218.2019.06.17.13.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 13:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TziHy47C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hcxqh-0004Kx-0C
	for alex.bennee@linaro.org; Mon, 17 Jun 2019 16:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxpK-0004B4-FB
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 16:02:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hcxpI-0001V8-3k
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 16:02:02 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hcxpD-0001DF-JG
 for qemu-arm@nongnu.org; Mon, 17 Jun 2019 16:01:56 -0400
Received: by mail-pg1-x542.google.com with SMTP id s21so6356783pga.12
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 13:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XbTs0HTzi2yJshTqwj/OCiyPfrmWSy1gyUW7PW6zW9Q=;
 b=TziHy47CcJAkqFGSdXhqcx5zNOg/IuzpzYWMbf8B+ZsCK2O6Ypf/oXAD9U19bXRd83
 UeDNlY6G7uWj81XMfwXpuZztvUTOTjnOl+IHR/p8yOn1aCSWAALhwFv+zo5BvMYSGVC3
 /OF4L7deJ8L0ZUnbKom0aL0o8q44eMAlt5RKIJki+6ofK3FtfP7lf/LsJCiYMhDoH0ll
 3kTb0TCfNwX8GL0zKSS1ogEXjB0lHgh8XfVvucZtvl9hgTiGLEq1wPRsHQ4v/5b3YJp3
 ZhX3O7L139vk31w3/1b28jZ3C5b4AfLimpBi/okVX7AS+ZGQWY6MJLB1tArqS9JG6tSD
 DxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XbTs0HTzi2yJshTqwj/OCiyPfrmWSy1gyUW7PW6zW9Q=;
 b=GcPAN9OliuR/8BOyVeHiRZP2ITrIWQXdNUGCGORh2NDyOemQiMnPK0gQZnT6hZAkua
 /BsYFDNx+7O1dr9ACZZij3l0xxLu9B+K9ZSwG57tjSGVfuZNJbs1ZtXhmJkCYsahD1oF
 de70KzU8pUx4JxrVJmiVWbMouQWM3AmGcE0wwHQt0Fnxc5sULXRl1PjiDTG+LmASMbQV
 /YVLk/hY1PwbcfUkVKVOCr1uGCnPacgNg4kdW+DQaQkPqt19Fov89wmag3YCQRyh+QeL
 BhlmV2oZBEXWlM8jQAfmTQCINwujxhS3ozQJTPlGWh+fqTi6yvCpeq6GegC83b1tfg3S
 iq9w==
X-Gm-Message-State: APjAAAV1GuyN5Iub0OtmDnCngp0rh+XWX+OWK9pnb5LpsPX4nmNuGo0F
 EJXB0UE1bcVvjumiXusu1phjzDsIn9s=
X-Received: by 2002:a17:90a:17cb:: with SMTP id q69mr751949pja.8.1560801700878; 
 Mon, 17 Jun 2019 13:01:40 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id h2sm10702293pgs.17.2019.06.17.13.01.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 13:01:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190617175317.27557-1-peter.maydell@linaro.org>
 <20190617175317.27557-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <cb2ae0ff-a1cf-19a4-50f0-6cd5e22e8974@linaro.org>
Date: Mon, 17 Jun 2019 13:01:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617175317.27557-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] target/arm: Use _ra
 versions of cpu_stl_data() in v7M helpers
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5n0SuS2/Hcz

On 6/17/19 10:53 AM, Peter Maydell wrote:
> In the various helper functions for v7M/v8M instructions, use
> the _ra versions of cpu_stl_data() and friends. Otherwise we
> may get wrong behaviour or an assert() due to not being able
> to locate the TB if there is an exception on the memory access
> or if it performs an IO operation when in icount mode.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
