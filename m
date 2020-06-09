Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp740936lfc;
        Tue, 9 Jun 2020 11:17:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqZTfa6KRaBUbLkN7aJy6GFzMXSsVnwPf+1wpVmIOMLHdBhvJmxQGM5zmwnVlI81xIfZmN
X-Received: by 2002:a25:b8c7:: with SMTP id g7mr8515481ybm.103.1591726631363;
        Tue, 09 Jun 2020 11:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591726631; cv=none;
        d=google.com; s=arc-20160816;
        b=Ijh3PKf53xQIN77FmHkSx13TY8QmsDJZ5avHgkzpb0sae0lGN3drikHjHMqzdqE1Pa
         8/rpSbxs8BYQif2UKNBaaBAkEPDQFQx0DSbd0OxtpByhE8LWFNkR9iWfM4vkyZ4HAyrc
         u2LWmI+xdC7qX609s0f5XAVXFa2liwJRVZbVSQAvho8AnZqUOpUZPXif0zSND60wVUzh
         HqFpZCSD9+C1FfdiziHVSQI2le3fhwVLsvdOEqLAxSDMs+Vni8jejYtjdOW5/3deyfKZ
         j7Twc7WzMZkk0iY7Z3wcmMe36sNunqM7dKIsJYN1eNoSrHmfA7ov7G0DPavMts9a4AWX
         qh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AXCFx8cLBVf704O9SZukjn70bmMOxaRfB9yPviZxs1Q=;
        b=gERjy09F76we449sMalluMri83Qsl89i9LSm2VvNl/a3YehAwAxg48ZK6yjkQ50hAr
         VW0uSTgRPC+A2Y1QQU+QQHWpaDFfjnGXVCAHvdRxwcHNu4KrpXMv2uJRUpsV38/Jmmbi
         Vd7RiSbdyj4qbRW/j/2V/6N9IPumvgO0ZVmUs4ZI5a73R/6VDsjFANK+23NWQ/QbOiO5
         VjtnVWs6MIVFyIdkRl06PJ9c1ZEjdAvqTzKK4cTKm4mk+eEtr+5T3vztSSN4Pe4jskVr
         O/Lu84x52ZXl6OO3rBh4u5/883QUWi+W9zX0jzzP5kw58QeTwGpEKj9u4I7ymeG7+ILs
         6Rpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zmcLk0Pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v71si3191032ybe.73.2020.06.09.11.17.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 11:17:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zmcLk0Pe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiioA-0004bz-AE
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 14:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiini-0004bh-W6
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:16:43 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jiinh-0004lj-LN
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 14:16:42 -0400
Received: by mail-pg1-x543.google.com with SMTP id e9so10632436pgo.9
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 11:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=AXCFx8cLBVf704O9SZukjn70bmMOxaRfB9yPviZxs1Q=;
 b=zmcLk0Pe9HJtsVGImjJZ0DEX8JJcdad5aohx4pZScL8Tl5lfZUTp82pmqYkvkiB+Uz
 tkEWAvOFvbG0BFEDL3+o6as45PQK8WvwuLBtua0TWYeBlhR5lfnZA55S7S3V21dLvK9g
 uCfdw3u7KXnGIBVxdsjG2A1olIH006r/c9XXk6fqjGWaTls+2jsyWt72Az2ogRVRIXzY
 cHI/1jgsfZTw7pYaJyTUaG/UK89AxRWqTPsGswmhxu4nMz0tDbC3+bZyfrbPDScTwQVT
 Hb8EzUBkrgx98RHhtpUjkLdNFyzH0BhoxFzOmEimkDuONhdJxYsiSBz6okEqpJFOFszR
 4WIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AXCFx8cLBVf704O9SZukjn70bmMOxaRfB9yPviZxs1Q=;
 b=Nc9qG48i73wHikp7G0sNJj6iFgiLtDX9D4X+aAEfOjhFpI0IaA2NcnMzoqdn0xc5vi
 9dnlhdyhUrZGps0HT/6NhtqBG7jn3Q4KzlGptnDliMq0C2wjkDGgdyLsfcw8Vv8OZz+4
 a5Z59perJvAKHpOiFc4fh3oxciZ1NCarAUVNNsef+2V4UI6lW18QLc6X6DBpl7KZRYE1
 shC+VRtqMWuhBI10TOyiTWdHSbqR649CgjJm/HuMrZLH1SJ51fuCy46JslYEH5qX3Nqf
 9PhJq7saqd4r1FZpfkkpH1oVMWiYy1lLA461cdxxAAzZu5hgR5/CBkm4fVKJbOIBjW0T
 y66Q==
X-Gm-Message-State: AOAM530sWWYA+eSZrPEK9jsFMx/oTwiTXR5MLdBc7ZaPhwkh235Ca1dR
 iFqcy4PZUudoSF5FoiA9xL/57Q==
X-Received: by 2002:aa7:8298:: with SMTP id s24mr27273007pfm.122.1591726600251; 
 Tue, 09 Jun 2020 11:16:40 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d15sm10508671pfh.175.2020.06.09.11.16.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 11:16:39 -0700 (PDT)
Subject: Re: [PATCH 4/7] target/arm: Convert Neon 3-reg-diff VABAL, VABDL to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <821c1992-e943-feae-0522-acd6c570bb23@linaro.org>
Date: Tue, 9 Jun 2020 11:16:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: CZf+sSuFYdIn

On 6/9/20 9:02 AM, Peter Maydell wrote:
> +static bool trans_VABDL_S_3d(DisasContext *s, arg_3diff *a)
> +{
> +    NeonGenTwoOpWidenFn *opfn[] = {
> +        gen_helper_neon_abdl_s16,
> +        gen_helper_neon_abdl_s32,
> +        gen_helper_neon_abdl_s64,
> +        NULL,
> +    };

Missing static const. Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
