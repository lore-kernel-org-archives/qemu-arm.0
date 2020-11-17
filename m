Received: by 2002:a0c:dd89:0:0:0:0:0 with SMTP id v9csp21353qvk;
        Tue, 17 Nov 2020 11:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0AoW2lZG8qyBPYlEyYlah5D8Itm4xddU2wTL+hZh2q0Upbd9WvOVIOyUylSZ3Jl+6gptI
X-Received: by 2002:a25:ce13:: with SMTP id x19mr1227697ybe.390.1605642174199;
        Tue, 17 Nov 2020 11:42:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605642174; cv=none;
        d=google.com; s=arc-20160816;
        b=WQMqBED3aB2ctwlcr6nXkeKdfrOL+Pv/grSUqyfWDQAHMmb6SKoU1xl8A1jDNIxeBz
         X5nGGDWq9FV3WtOXVSCb+QBo2hm6Yh5htecnvZDwKLw/9EJ1UlElOEqdhjXoRF6O1RTM
         CPh5JMIRKn0EUnJFQ2GNVu4s30HsN1OsRcf+wOiMxH1xrZEok6YdMp1g3GIGaI0G27SG
         Q/G6KPBTOTXvIpj4QpAhTtm7xWjGMpn0cI1ilYSNklxvXscTjOeEVg/chp2WfVRT3voZ
         RocqvVztWsHWxYkepgKH9OyZxpf5tYcSMqykprDMbRedcAkkPn3vZglNf+SI9rfuo/7r
         8APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yI5JqCPS5RgKI64igo2ind3oyCXfj1mIIYdDl5pk/IQ=;
        b=DFRNHZQ9k3ShlplYO+slvl/lvZ+dtNml2DbuHn3+91+GSrjLuAx1C8nNo62eYWBD1l
         pL0D6RmNMmKrzK5N46inFDIHnq8VcMIv2mBmEATJufABB4PPzsA8C5W/wAamhP2xkIdA
         CYGjTdgebPvshch5aPepMeY0F+1I5Au6hiv9TL6aUIvO4TUH36AvWDBxpMvT3sZVVn3v
         iOGewU9z6LzVG2VahSrk5L162uBzGaOoN3MB0yAjvZdzqsMm96wnCMuUgQlu4CMTnNbl
         U5cITxzCS0SEKqbSE8YlvJB3REsHUbI0dOI+4ukI7OedRRG5Y8tw/7InBanBTocI+wkh
         4fhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sMZqbHlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v71si17712500ybb.163.2020.11.17.11.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Nov 2020 11:42:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sMZqbHlb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kf6sP-000148-Oa
	for alex.bennee@linaro.org; Tue, 17 Nov 2020 14:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6sA-000138-HF
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:42:39 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6s7-0000z6-FJ
 for qemu-arm@nongnu.org; Tue, 17 Nov 2020 14:42:38 -0500
Received: by mail-pj1-x1044.google.com with SMTP id r6so1032790pjd.1
 for <qemu-arm@nongnu.org>; Tue, 17 Nov 2020 11:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yI5JqCPS5RgKI64igo2ind3oyCXfj1mIIYdDl5pk/IQ=;
 b=sMZqbHlbBhDs086yU+2SP0ID9jvYbMqZTMRZxve8NXzO1HtUe7AXvm13MxPu8aB0Yy
 XftNAkLXn0QItOTeTq7wJ5aJIjR7Lx2c9K/llyOKAZhteHHf1SQeXXiZQ++uonsk/z6J
 vIMTe5xtvUgeZK8xMk5PGwHjwTaal5JBSKYEZWGhFOLOyaEgxk5M5wb1Oh6lgKp8rStH
 cwoXOX2gEyLR/PGDpSR1+HdezfMJ9KZ7SdVAMeR/ih5wqDD7Oe96G3bIw41wcjuMZspO
 V/2d27v+QSMELjpObTSEAP/0KRye/E61OadyTChgNPjOEKum3s+6YVA+8Xu6QnaYayXW
 Ax9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yI5JqCPS5RgKI64igo2ind3oyCXfj1mIIYdDl5pk/IQ=;
 b=n1I/ku9M8aLNQZRm8iST34R1RI/7NyIU9VMr0/r4mZWUKp8oxB8MslOuh2c+tK7QBD
 dP+T9yRA+7GPiGeZJJi30MlxlS2xmqE4b34KE8j+zJQapfbrk5F707hqaLRxxPcctshh
 zl5nfZQ1reP4zydu0rLqtodV6IIWCWFDlz4MJYPN/axEYC2QWo1gYT9RYfLf5x3FX8m4
 XULii2odWOLqWg2+7C3Y7AnArUheTgFm5GEkyT6f+5gq5qdo3fUNMYnwBj9zElykFoqI
 3IOJDlx5qLslnldJCyNmG3/3/6XNIk3UQUZZ5QeLzZNQHy6liS0uQjHVm7cVZETTN+v2
 QVtg==
X-Gm-Message-State: AOAM532Ghfn//fGleBcW3AnNAJbyBw10FVtv03KwaevVuDK644O1XirA
 w7eetbqsvf52jFbpeiciZUMfnw==
X-Received: by 2002:a17:90a:7343:: with SMTP id j3mr621656pjs.51.1605642153996; 
 Tue, 17 Nov 2020 11:42:33 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a18sm15240699pfa.151.2020.11.17.11.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:42:33 -0800 (PST)
Subject: Re: [PATCH 06/15] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d5cf2b31-0eb5-8147-2104-93b0c4c54b9b@linaro.org>
Date: Tue, 17 Nov 2020 11:42:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-TUID: Uf7EHOhnPLKR

On 11/16/20 8:08 AM, Peter Maydell wrote:
> -        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
> +        if (a->reg != ARM_VFP_FPSCR) {
> +            return false;
> +        }
> +        if (a->rt == 15 && !a->l) {

Alternately, the parenthesis are just off:

  if ((a->rt == 15 && !a->l) || a->reg != ARM_VFP_FPSCR)

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
