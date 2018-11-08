Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp394382wrw;
        Thu, 8 Nov 2018 09:14:24 -0800 (PST)
X-Received: by 2002:adf:9ccb:: with SMTP id h11-v6mr5084505wre.322.1541697264439;
        Thu, 08 Nov 2018 09:14:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541697264; cv=none;
        d=google.com; s=arc-20160816;
        b=VVA9I30YQbqA3GCnayaAWGwB+0l4XS89GuKkweiyou06smVe57NM3ChNpVTxuyyNd4
         fGT+vl6IRyIdZAJIIATNzFtxmZv97UiOZny05KG117ef84YpFUx7aOZYkR2Y5OvvO9Eh
         WxGiVM/7YJD+wd5YAOIrgeq0ruxfplS3NdOTa+QRO+VP0xqd812sXlKH/+8MH4F2f5QL
         WNlMR1h0yGxjqTtjR60hw1TeBMLzAlaTrKcgluJ5vaPKgnOgTgrBSy2cYWYOgn+0AUdf
         8gni34mYUZjqVyvQa28bjTekFULDEIeCvMQ+l5hTclyhw34DT1BbPce0lH8Y7ejaH9/3
         ylKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=2HVPmDjOfMjvvatpA1SrRr5gw1qqNgAZUDqAFyDuvpM=;
        b=NHhkTvZ0PKMS0GMip1u+IpzbUYSQVoz8kY4UrJQFlbxJqc7FBSBHTqhGslO+r3EpTw
         cH3SbjI+Z0iHgh/i4s/hwx1lZdf5/Yh9u+z4CJ/GnCWuL+YDIMaYrX5tsOB9NN3RGnWu
         OX7rRd1kH+89E4tY26X9l5U6htz4aNkJqg4Bpd6BOR8d7bvl3NxpXFPKjFzNGaSpAzie
         CnEsfgDeGso/hisHV5gpU1PIUJCe7Nl2LJM+i+IeBLUW7ybQQ7/LO3a/Zwe0PXBH73WZ
         0kBbqD0EBHHL2l4BS9AwSaGD9xTsQh+DvlVUXZNqxJeiXdNUOMS7WDV1ERADs/ESRa6j
         RDMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Eq99/b3I";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h7-v6sor3463780wru.33.2018.11.08.09.14.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Nov 2018 09:14:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Eq99/b3I";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2HVPmDjOfMjvvatpA1SrRr5gw1qqNgAZUDqAFyDuvpM=;
        b=Eq99/b3I3atQcK85wknxq8ClD1wRwLMzQJiZtAD+H/AtxttSqM9RzSV7H5PGU14r1/
         QSsneBfTCJisWZ9e/lUWxdudSVCOZ84q1Hw2Obt2i06plnFWGjZO8Ac3YQFxXOWmBB4p
         hODZxrUJCDwUX+DkIQCMC+S5XWehH0lHhuOA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2HVPmDjOfMjvvatpA1SrRr5gw1qqNgAZUDqAFyDuvpM=;
        b=Jf2MiVHCJSd+HM4MBVlmVUonqetZYzELHYplGNVfoHFxe/ejiVKY1WKDY6siljgw7o
         XVHBjBheVJYOkKi+hF+utxnMNkIYVlkuNnTFhlBOBlhH+3/+Eu2aNrsgUvPXmd2aNhlV
         LZNYym1xSIQeZfGFzahJRrCQcJc8ojAwhbWtZMd0IvDxDg1UmA6Qq6mAMa9fz2FI0D2a
         DfmPCquZT4EnZ98esuDaGrB8JDpfo8DXVyusIaPnIQknJ1NjUlAQpqP2bYhdysWhFU/F
         qSbBoIs0F413yptaqxJqc+86kwIAdcmXIurZ7DRLoRjHH6RA+x2tMAduchB4yJkDH4wH
         H1bg==
X-Gm-Message-State: AGRZ1gKkf7+5r6UOcmDE2D/jc/LED7fu9W/APPYOpybcAMGi4nBhMjMp
	U6op66knfZibETwijkwVA70ABK/t
X-Google-Smtp-Source: AJdET5fGuNwbwYHGqJbhG/s2z7dBgWQzqw+e8J3LVi4fEK3sz5tb2uszcIim7WoRrHrgkI4RA44Qqw==
X-Received: by 2002:adf:fc0c:: with SMTP id i12-v6mr4986591wrr.145.1541697264050;
        Thu, 08 Nov 2018 09:14:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
        by smtp.gmail.com with ESMTPSA id r76-v6sm6749977wmb.21.2018.11.08.09.14.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 09:14:23 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 4/6] tests/guest-debug: fix scoping of
 failcount
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181108163329.19940-1-alex.bennee@linaro.org>
 <20181108163329.19940-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b7f0bcd3-d9ef-7243-cea4-9e1496767757@linaro.org>
Date: Thu, 8 Nov 2018 18:14:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108163329.19940-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: R4muWJjM6N5K

On 11/8/18 5:33 PM, Alex Bennée wrote:
> @@ -16,6 +16,7 @@ def report(cond, msg):
>          print ("PASS: %s" % (msg))
>      else:
>          print ("FAIL: %s" % (msg))
> +        global failcount
>          failcount += 1

Do we usually prefer such declarations at the start of the function?
Anyway,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
