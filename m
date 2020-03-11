Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp380554lfc;
        Tue, 10 Mar 2020 23:36:24 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsjcqDIT9SeGDTiFw/ZXWwXFAoPH3+eRKj05Ai5/QEPb9laHquYZpfExSsIDwufwmUnEkZk
X-Received: by 2002:ad4:4ccd:: with SMTP id i13mr1475997qvz.41.1583908584630;
        Tue, 10 Mar 2020 23:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583908584; cv=none;
        d=google.com; s=arc-20160816;
        b=aKa9h7A1FpwfKYHxsBlHQqtGh22O3AX1z9FVLyASSrt/jBn8N0wcWw58Tq+vUzh2U1
         go1TijWJUJR164xAYqkQ+OBRkuchJdLLomsEXHiEEKG/F0TLX4bAIDAXWuF5WznxLzWA
         BGGYChnV1rTMQTSMZK/zelBIAtLsggRuNxZO68HGtcKPchegBGXVzrpNi+yRFM5Le3/Z
         Ir1eOCsiLDHAG0qxTGVyAxq7CA7lA8sL480a+bRVf26E6SY57uBVaCW9caL6K188Opg1
         vWT8wC6+3wz2I6S3cFnWiryuZEtVdGzMRZeae/KoVXbxRng2XzsI5zY54gU/29uOSXIf
         SzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=DV30OW99uQZ2EGZoE1K0zlZaZVIcax8ibg4rClaECrQ=;
        b=a3XuuRGB+7epbeTJwiErjd8VDg1SnFZlvIxtSFCtr7Qi8REA7zkB2pSi03ZASVltY8
         pXCi4gG9Cq6ccc0slRefZvoYM3K+QYvEWbDO4w58urMGv4LVUVrahYNTzbNOZdI1v9Rr
         lhNzl7C+pjZbD6wWSFk6j/9M4UywQhkX7UwjjiAVlrsVvETmDKr/w51JQ4oKNjyDTuUj
         k1ngI1dTKcjjP6Q4xj3MZZOZvxAZHa3hOkGckAbHDeLSMyPThKv/v6BYHBREs3JAtmAl
         +JSPL9CPW9g6gSHD8TqNMfoyrDaQxIMcx0KDNq9UVccQqvHc+RGWgU/jIVUrOXd5xffn
         LXoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bo6WdbJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si507141qtr.356.2020.03.10.23.36.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 23:36:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bo6WdbJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBuye-0002DI-3Q
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 02:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuyW-0002Bn-7e
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:36:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jBuyV-0001U3-9O
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:36:16 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34468)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jBuyV-0001Tt-2s
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 02:36:15 -0400
Received: by mail-pf1-x442.google.com with SMTP id 23so743751pfj.1
 for <qemu-arm@nongnu.org>; Tue, 10 Mar 2020 23:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DV30OW99uQZ2EGZoE1K0zlZaZVIcax8ibg4rClaECrQ=;
 b=bo6WdbJUKFQ1rBgzcZRUk7Ft5R8isnh14QmKHRODrvCKcAmqJFQ9VnBwP2n6ydfgWD
 NNKtoQCzGNIKwvnncNmo4hl4Pwd5enNYkeQyFCX5KXkQ86jHjcRC0PNQ+FQoHpWJUJwq
 2HNomZWzVUJ+tO2GQBBL4tGY3qzxNLFI+hfiwENT1A+HGqmxmPNT4FriCMiiwz9bY24O
 kPYnWPk9jdUq21EKpWlWPI2/glFuQbvn4DUtEDXbegPOvrcOyeFecf+k1dOUuOx6cxu4
 poUoUANFzB9rbFD7afK4on5vI4qExAFZ77hmmu4Vaf3h85eMhmTXJZ8Rudh95L1VLnLe
 X8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DV30OW99uQZ2EGZoE1K0zlZaZVIcax8ibg4rClaECrQ=;
 b=GjZ0e1mJjC6Zm2Tmn8ToklFXRbrWIvJ+b9SRXS//6gOr7yphjQFg/oVpwqFJy0vz6m
 01AIayDWYuRwvmxMe7ID4U35kKL5vB0UJIvAgNb0yZEatF29Oa4MicHLVZV5sZgAnTpR
 0uXM2Gu7yFiISigAtQzlnxkV9OxGKbbqQdPkW/W4YgexGifX0wblykY/r75lLxaRu2MR
 8bJ2m9um12OaMluJwQ92xYkHdZDm2MDqmkDgxBveduYvxLIrFAZw5gX61nZUm5iA7wk5
 jSkxCgoWpJg6Z9yjCgf4N3ZubLbAiBJ9aME3mT2+BEb3EPxO0K1LXGr+mZuF4hz0kjN4
 7SHQ==
X-Gm-Message-State: ANhLgQ20kMYFPgNvl67KvmID6GZ0bCYfznISRu2I2nGDO7ASnM//Xk57
 ObyYGNVofiXrKzrU5F78R97Rpw==
X-Received: by 2002:a62:4ec4:: with SMTP id c187mr1418494pfb.223.1583908573350; 
 Tue, 10 Mar 2020 23:36:13 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 a71sm11512230pfa.162.2020.03.10.23.36.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2020 23:36:12 -0700 (PDT)
Subject: Re: [PATCH 1/5] Makefile: Allow for subdirectories in Sphinx manual
 dependencies
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a2de498d-65c0-6394-a241-1f36badcff22@linaro.org>
Date: Tue, 10 Mar 2020 23:36:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309215818.2021-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IZ0vVa5jTSi5

On 3/9/20 2:58 PM, Peter Maydell wrote:
> Currently we put 'docs/foo/*.rst' in the Make list of dependencies
> for the Sphinx 'foo' manual, which means all the files must be
> in the top level of that manual's directory. We'd like to be
> able to have subdirectories inside some of the manuals, so add
> 'docs/foo/*/*.rst' to the dependencies too.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
