Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp407994ejx;
        Sat, 9 Sep 2023 09:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1QKMI32zPBpQQ6qgt0NKPJoLEFQlampHVvh7eY/LpaM082grlR6gkNXXa2QISVCU8PEpe
X-Received: by 2002:a05:622a:1056:b0:410:31c4:f460 with SMTP id f22-20020a05622a105600b0041031c4f460mr6828693qte.1.1694278446915;
        Sat, 09 Sep 2023 09:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694278446; cv=none;
        d=google.com; s=arc-20160816;
        b=JO7ZzOeQQZs4V7fSCPObedXb9frb1+AcmxOzQ8EJxy9vi1qcqxNbHKkjn22E9AQtgT
         YJGgLna217YWQCKC5Q1je8MBpNl0LcjYTdPxzYLz6xQmFzefJE6mUX5eogG3rXo31UzB
         IDQQ7LfKiT6JussbEzYk1LKlyKnQ9XdFhXtEPcwY4F5F90D4Cp8zg9RqOvkD7DzTYUJj
         o2QmRA2I5LbPQlL3VfqKoFm99Uo3wjWpaf8Z5D3AgjafoGGKC7kHmircVOP7OADzqrDg
         C1IY19Q2ioQ6wKliIZXlPZvty79E/WTXfGFU3ZmG42Q9A6hRsrMdNQ4HfrHFQuznAn3c
         liUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=2pRqy5toNnN9vCDtrYvDbygxTzH5HJnKC176qwibKrg=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=VAQ4aV+/E2yhFNp8E2i90QFFJ/2OeF712czzbVyM3ew+TYNeBbmBVhDHqwjFenzNaU
         fE1HXDH7MixtTyXd/eAoN9uI7gnYFcJCJy1qIm4ShOF4aGtMxvTqA9IePoMzEzw9aVPC
         Ws7xiFFdh+lVUe4Ug0yUbVaxhYtpLsibPUZxIz28w0qsjC7AvETotXrdxpfM2308Hxjj
         TnO43+GxWLqLhqiZSC3SlL2pAAj9fGhic4EihGqeYlzL+xnOYK1P+j/0fTi4gSB4UdUJ
         HBIsPaTm6/G8FZLQq/O53Wdv0ZoTqxOBhCPN5Tid9G25NiijLpWayt5ZQ7+rMFjWw7OU
         LFJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R+KpYnCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85753000000b0041208453d80si2676811qtx.349.2023.09.09.09.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Sep 2023 09:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R+KpYnCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qf1DO-00059T-CR; Sat, 09 Sep 2023 12:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf1DN-00059D-HV
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 12:53:45 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qf1DL-0004sa-AO
 for qemu-arm@nongnu.org; Sat, 09 Sep 2023 12:53:45 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68fb6fd2836so82816b3a.0
 for <qemu-arm@nongnu.org>; Sat, 09 Sep 2023 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694278421; x=1694883221; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2pRqy5toNnN9vCDtrYvDbygxTzH5HJnKC176qwibKrg=;
 b=R+KpYnChlBTH8TsqHelOP9xd1NiFBfXRz3hnzRcQc/grg/gWY+VPfN/utqzCVPcVWo
 /xxvTAE0LJhAIBNUBFdSRn3g54QU+s/6aMfkcE+ivpqCaAnuuixG7sxfmhfLAxWBb2AE
 6ltP/Njoqd/U/GM05qTlBa3+tiMkHgIxoOqtzHmhhU0OkDl2pl1pt31iLJDrNbh7/8TW
 55jelKOE1i3+Lu4GElhIy9GIJSW5jHOfrG2oNGrvwpTgniHBI6jcI6eF6rQrJsA4sFKe
 n7+Qj4fuPJEp4HMhq9Gf54XLxXrcq4UweF211OP6tSZPDlbMqgBy3fbp5m792Yt7RElT
 JF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694278421; x=1694883221;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2pRqy5toNnN9vCDtrYvDbygxTzH5HJnKC176qwibKrg=;
 b=phOJau+GQYRk8RqVGMMLeOtxXjfSifGQ2B70jULJhI9lj54sSoyaoyK1JqtMjhjjkS
 HZJKtUyaEcTwfFn+TCtpqX+3maVZRNBsPzENGtBPyoVZY2ZiEwlkxrODYBwhOctAYj4e
 1zWYGbp7SD06lJL9jVZa1I+ry1FKB41opNal7ndxgFAH3rP4CL4RCWV6ky++1sWPZjp0
 zUWrJEXZWkH69sM/vcO9qlFXJrbF8CSyDm6Oqo5ul+z2pAf7USEozCkELG2ZOmLno/LU
 iaGHfSeFSwcrDz39e+gu9Bu2w2HbKOABOHqJnKu8KTpdkKRe7a2INKQtQ5J4j5LBBLBj
 y8yw==
X-Gm-Message-State: AOJu0YxBWeG3zPchJvYNllB6INiOWE++YC/JtiXocpVV3r4PBa0LbD7V
 Wx2QjFCFcKPRrPMT1z8S50GhZnU90MdxzAL6c/8=
X-Received: by 2002:a05:6a20:3d13:b0:105:6d0e:c046 with SMTP id
 y19-20020a056a203d1300b001056d0ec046mr7528080pzi.26.1694278420972; 
 Sat, 09 Sep 2023 09:53:40 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090aae0500b0026b3ed37ddcsm2986201pjq.32.2023.09.09.09.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 09:53:40 -0700 (PDT)
Message-ID: <e4338a80-c36a-2546-8471-d481c2b9ebb2@linaro.org>
Date: Sat, 9 Sep 2023 09:53:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 14/14] target/arm: Enable FEAT_MOPS for CPU 'max'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230907160340.260094-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: U60/Qk2wLuC/

On 9/7/23 09:03, Peter Maydell wrote:
> Enable FEAT_MOPS on the AArch64 'max' CPU, and add it to
> the list of features we implement.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 4 ++++
>   2 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
