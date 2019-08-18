Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1271730wrs;
        Sat, 17 Aug 2019 23:23:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnNNPdw6u8y/opZIZjuwrKKyTYCvhsU2GjbSPLhIHbqkPMsAF8Ja1qVTxlknvvqhmKHz9s
X-Received: by 2002:a17:906:a89a:: with SMTP id ha26mr15260028ejb.110.1566109416454;
        Sat, 17 Aug 2019 23:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566109416; cv=none;
        d=google.com; s=arc-20160816;
        b=Egz2hxFzbdvgq9NrnRhWp8/57Dp0fGOMAmvDN7ePnELAgg/rU5HdCVLKP+TdC1aRJi
         sMzrfem7fGlB8z6jIeYFuFuWp14mfGm+1pKeRTz5oh0xyoIuGwsMwbIDfmL8M3CjhJGK
         hRKjfCEoRxtGLFkHQ1eh4iVjevFjry8o5gmALZrUow2ue83NS14pEIeMKJ1de4kTzlDp
         BvexdyfvYR5Uu0X4s/V49DLhch3YwHitYLR+Cyycc9WAnbrlnMmAmlHkChpL+LlJbWNA
         j6846RD9rrqN8DeDrW3+7wxeCiVTGp6/4apvb8YfhXUGuBHH7TZhZ7vYvXr/GyP/Htp8
         TUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=GgmdOZ8wyLcjx83w+lOaDNmfBK84m7wWuH+PGL8yXz8=;
        b=1Ly97hCCHwrNQKcMLthErFZEGE1nPtaUg6Aka16Rp73q4E4X2XYN9tg9U4c89qOg6X
         wpFjwyiEMoi/VM3d2QVXc+jbx+PVu6a4FjvhiV/PAQBRClWsZoKLPUmmGndg/QqSaCsE
         KTf7sBFeJGiqlHEvmwQZNB5y+hMDXVPpon0T5MIrafsGlUu71W3+zpqP5vbLj2/MxXYc
         J7aN92rz9WWmQN5nwHbQYheF2EV5gHOtB6qYnD5vlcTOJOCv0MRQ4KXgMmnzJhAPhbZl
         JR/fNNTx+0jZ3mWstWZg1YS5d+KSOsxsoo3HhKN85lY5hGbuOCZMjk78L0EIG0z2Q1k1
         Hqbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BaQWdve/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nq5si5154377ejb.124.2019.08.17.23.23.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 23:23:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BaQWdve/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzEbH-0002Og-GP
	for alex.bennee@linaro.org; Sun, 18 Aug 2019 02:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzEbA-0002OV-8O
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 02:23:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzEb9-0001Hi-3m
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 02:23:28 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37597)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzEb8-0001H5-S9
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 02:23:27 -0400
Received: by mail-wr1-x441.google.com with SMTP id z11so5409587wrt.4
 for <qemu-arm@nongnu.org>; Sat, 17 Aug 2019 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GgmdOZ8wyLcjx83w+lOaDNmfBK84m7wWuH+PGL8yXz8=;
 b=BaQWdve/rqUr7A87Lvj5CX5+HGZBwNaurPldYNzByL41kmcudD9m79B3QGrgt4u2XV
 z/aQnjudxxpVppn6GWNOdjdaH3UEDiRl/RuLEOh+srxnii7ix888fBcb+OpVmdZLvSz7
 cP0Slc4+Le+dQy8zfLxy+SWk+g2D6KfQEKly4GiLHCmRncaA70anXW2ed0uWFgtJgYZ3
 Fla37tUpQTr+QHGTl+7wGg+Wi30Rj767h3C67XOvxSTgM1RO1WLQc25zoCiqs2bDV9dl
 Q8OLYfz/9VtJ6/5QogyoC0b+kpJKTbFdgiRqoAWp5tuXrPC0RmL4m3aDOH4BiudukD8p
 L5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GgmdOZ8wyLcjx83w+lOaDNmfBK84m7wWuH+PGL8yXz8=;
 b=nxF1odBsKp1TqOA7GWwU282wV4wv4wgC2N0iLcWTvRXBai6RZs7tvIUFJdLyydBPaF
 FQCfPFqV10reoj/rxA7gxbAq1u1QpSt9wtTYXVSkuzsj5NwRJy2aP31JWjmcN7ApR0FZ
 rV8jRYjGPdR14401Vr7Ft73f6/K5gVFsyVdWBXJW1tfzRE050L78UigIIeUkLjHlWhbl
 RGE/G12GSlyMJ4eC1A8V00d9owa2Yqlv++KamkzrKRqZP+BjJKWltLYFAxT103K2LhGq
 oecb5G22d421aPP4PAoxcC2BkGqIhiK5QP9qis2PbJdWtZm7NZ7FlZsA152Ga1Lg4g+f
 s38g==
X-Gm-Message-State: APjAAAXZr1spi+xlprOj4w2C1k69BTu/tVuxkZZwh46idPtsYxZIBSJ6
 nF9UrilIsOpr+4i7/swDDCevug==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr18676953wru.289.1566109405307; 
 Sat, 17 Aug 2019 23:23:25 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id p13sm12246829wrw.90.2019.08.17.23.23.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 23:23:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190816125802.25877-1-peter.maydell@linaro.org>
 <20190816125802.25877-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b7f30ef1-322e-e77c-29f7-84bf4370817f@linaro.org>
Date: Sun, 18 Aug 2019 07:23:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816125802.25877-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] target/arm: Take exceptions
 on ATS instructions when needed
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
X-TUID: CNH6ASCMCNVw

On 8/16/19 1:58 PM, Peter Maydell wrote:
> The translation table walk for an ATS instruction can result in
> various faults.  In general these are just reported back via the
> PAR_EL1 fault status fields, but in some cases the architecture
> requires that the fault is turned into an exception:
>  * synchronous stage 2 faults of any kind during AT S1E0* and
>    AT S1E1* instructions executed from NS EL1 fault to EL2 or EL3
>  * synchronous external aborts are taken as Data Abort exceptions
> 
> (This is documented in the v8A Arm ARM DDI0487A.e D5.2.11 and
> G5.13.4.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 107 +++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 92 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

