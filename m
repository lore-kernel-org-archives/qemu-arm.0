Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3180171ejb;
        Sat, 11 Feb 2023 15:32:52 -0800 (PST)
X-Google-Smtp-Source: AK7set9X/LR2AywEQAefPdIQ7G/uyJ4DaBBZ4XoRhh4WYYO80tdQtAO3H5cWQ2DSyiThRd0bSx7Y
X-Received: by 2002:a05:622a:11c3:b0:3b8:6c68:6118 with SMTP id n3-20020a05622a11c300b003b86c686118mr37105098qtk.8.1676158372048;
        Sat, 11 Feb 2023 15:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676158372; cv=none;
        d=google.com; s=arc-20160816;
        b=GiJA215caXCpGyDdDBGnl0mZck3/D6JXMs4yzSSASVPuU5Td0BXFF8saFQ7SA489W6
         lrpYSg+5G2R1DRPpDXxOl6/bzcVBt2pPa+FQ+f0j28yU3VqJmz2PXaibDMyeW+Bc505O
         WqQRGUddtgfX+1Vdp0ff/57V+Zo6Bz+gOUpuV8J45jf93obH/l7op+PxiUKMtHAP4mL/
         HTcfBhQ7170/doRJIka+60Rl/v0mkV/I4m+xi5h9JNzKdn6MOlE4FbEbBk9a5x+vxVA5
         ZuGAoHDUR/eppqRCaDtiSA707TMzz8ISzXIa0C6yNHfld013MiZoxoewy6ifHq0buos1
         W3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=V133+eNKCBnYyYjDISObyQe1JAeSvX4yoFtsSb1YvJg=;
        b=Lgeyt39TLaq9tVoviNzhOCMgaZAY94sX3SMn7BKwn2tCTnsDVpMk115GlymzVF3Mvu
         UHnbB9Aqv+yj3/X3QL2guYcuQcFL+0HrsexNWtDmGtB/o+QDWeAvYBTm27ToWYXXTZVM
         O92bfbb9Nv4bJ+WX/A5C3adKlq22M1viNjG3yEpfCMPNMf5YlLqhkpPELS3WG41p0WoL
         Zv0FkKuJlWx7JY9eqN++qA3zW31fJaYWeW/L7uhCofjll+0Bvxr5A3gUE5q97CkL58Oz
         Rsz08R2QJ+JFBE6I5cNVRm5DKiEqe4DWCFsgJZ4buFgAgl/qejvnoqvOgSgutZ4y9GQP
         NYxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NKFjOHyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u36-20020a05622a19a400b003b9bad5160csi7145402qtc.291.2023.02.11.15.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Feb 2023 15:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NKFjOHyS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pQzM6-0006cO-MP; Sat, 11 Feb 2023 18:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzM5-0006c1-Cr
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:32:29 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzM3-0004Nj-PP
 for qemu-arm@nongnu.org; Sat, 11 Feb 2023 18:32:29 -0500
Received: by mail-pj1-x102b.google.com with SMTP id pj3so8817834pjb.1
 for <qemu-arm@nongnu.org>; Sat, 11 Feb 2023 15:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V133+eNKCBnYyYjDISObyQe1JAeSvX4yoFtsSb1YvJg=;
 b=NKFjOHySsFKmbJk8+MlgGTcTLpW6Cs7CvIjYIqgigFmBk9Jcjft1dJHddau1Ex/Es6
 BfuhsUtZXJ41TMOIhnJTWoz753vK1fewYsdEdwlNUk6G2v4DswWl4B13c+SFTaSVvcdz
 JYXh+LA86VD5GyP9mNV4rXN0Ssp1IOngHbr+XVuP4wXG4Fh/HN0d3BOmoLwOlnxr+fP0
 PoOs6jvn8XsdH6HmiEq3fJJemjL3j9nTNSx5PnIJgT0+ShWxOn+YiRjYrJJIT7aEtz/k
 2Z4/XcLpGJ+hqNWB7BfMVZAqiflFqj3RDJlJN9JWKwN0N3t4gwd3yZVUeiBchqpkQLRa
 Kenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V133+eNKCBnYyYjDISObyQe1JAeSvX4yoFtsSb1YvJg=;
 b=aHj9X+FDQZyrkIMAV+PizApFEV1Ik+3FvK1LKDQtbP6y7KRPD1s9qn+VWq1EdXG/Zw
 OGNzrANNGnT+YBVUZMV8pY5WzDK3WxM0e9NeWgNrrsgMXhasXaydbov35IWHu+KGKqLY
 paDc2YFWxrtL/2mTuRLR29VKERu5W74TicwMJ1oNqbYlJHiBt3ycXmySyjAe6iQzINUR
 XS3gMiaiMWEEG3bF7CuY7dQ/Q1Ao6cj+2pCO41xDFqaBX1Lf3GSX44FVYQ4cvMg0h0H+
 u792so7z5Y0PEb7E+EqAG8HJjwfxCz/N4JOGOLaaZAzd08rzQCRQHiEOmEETt+PBYLQp
 cfdA==
X-Gm-Message-State: AO0yUKUjcZmA1B89hDC64afVBW7Y4KoKrBsiisGOo60FkMlMLKaIXIBY
 DAHZ5yhMepOP8OtROJscZzfb6g==
X-Received: by 2002:a17:903:246:b0:196:5472:c115 with SMTP id
 j6-20020a170903024600b001965472c115mr22477430plh.41.1676158346109; 
 Sat, 11 Feb 2023 15:32:26 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 j16-20020a170902759000b00189f2fdbdd0sm5487334pll.234.2023.02.11.15.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:32:25 -0800 (PST)
Message-ID: <e832cbd9-2fd7-213a-08ad-544d708bb823@linaro.org>
Date: Sat, 11 Feb 2023 13:32:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-3-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163731.970130-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: FknALblV/Bmx

On 2/10/23 06:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set (except for the top byte when TBI is enabled). Fix
> the TTB1 check.
> 
> Reported-by: Ola Hugosson<ola.hugosson@arm.com>
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmu-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
