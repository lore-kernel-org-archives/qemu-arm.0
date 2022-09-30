Received: by 2002:a2e:b168:0:0:0:0:0 with SMTP id a8csp1583259ljm;
        Fri, 30 Sep 2022 13:16:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7RU/cW7yngMqyqOJA/CfujbK8QX+TmOtHmbio9fnB4UjkhHQSqrdFC22wYwToF/dBmmcxQ
X-Received: by 2002:a05:6214:7ec:b0:4ac:9181:d799 with SMTP id bp12-20020a05621407ec00b004ac9181d799mr8363755qvb.84.1664569011937;
        Fri, 30 Sep 2022 13:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664569011; cv=none;
        d=google.com; s=arc-20160816;
        b=cAQgqNO4t4oa12TGiEvgK5NGYoOhOiCdxIx3FMgpHXTWNbPR7jQlXD8myNpee+HPt+
         Iys0k5TPK2qT4L6Qfr5VCKjEaGpuZy9+MDj2FrZmDbbWA8Fq988Qty/fTz6tzCvtQG+4
         JTTtDuM07A6uBEW5UUOzLzkd6taWAhlf5z/3AD8rWo4qSmba497RxStT7yoiIvyCR+Mj
         gEQGv4J28GBAPae3T7Ro3G0NaKwIfTXVvmzrF0ZJ1Wnm907e4ZjpUTSTrjtv7pi1M0pi
         jrCD+7bkUO7IdxGvYgXpe960KNc4GmeRlxODn07WIs7zxFj2K+NZlh4bqjPj1QGMW6r3
         rQzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IFjWUXfspDkCWdDJutszC8GDF2PR+9cbEqNg2oZTgrw=;
        b=buvcD0f6rfLNgozPO1aaWTcbQ9c+y5Nlq0TGiRL6pbmV5bsZFEvlCIByCNH8kh639L
         JauaZyoeYP17CWeG6deZBr4ewSquwztt7MJZ9OADysynp3i99X7exw+8OsuaEtbUHNtY
         zUfgZTLTGBQd+9aszoTRMGRS/mi/Ezz0XIg2MJfyv1AK1SA5ucwXqeVdfqaCx7McTua6
         qgZYH6dCzsyFpkI0c6CDYa0IyPeKwC/zB7agldc/4VgDu8lBr3zfppQ6L/u6n02RwKZH
         jBNtCEbN5BAdwy7IzTTXG6E80CugGOWjxzKZB/4mZiQHnkMykIoTN60DojmV/cIr9OYR
         n9Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vfR65lD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020ac8714a000000b0034016ba79efsi1482279qtp.319.2022.09.30.13.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Sep 2022 13:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vfR65lD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oeMRH-0002YD-Cw
	for alex.bennee@linaro.org; Fri, 30 Sep 2022 16:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeMR5-0002Xx-PT
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 16:16:39 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeMR3-0003lk-Rx
 for qemu-arm@nongnu.org; Fri, 30 Sep 2022 16:16:39 -0400
Received: by mail-qt1-x833.google.com with SMTP id a20so3352243qtw.10
 for <qemu-arm@nongnu.org>; Fri, 30 Sep 2022 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IFjWUXfspDkCWdDJutszC8GDF2PR+9cbEqNg2oZTgrw=;
 b=vfR65lD0OJuYEzhJuWrNFrprumz7TwTiUg076ARHodFieSB8RJFAedcudHaD1WIASJ
 cdmbWm3eOtyA9bp5feJWYbSQoGc675649at1Q/ytkfMgyoxQR+0eGc9az6BpNI5hsV2c
 vSt2IsZ7SppHUzUaCfpdeB7M4rg9dvGB1ECUOFBKVbsn479FM+xBoUw5Qv/T8gRTVtgb
 oPh1PAo7iExN6UaEg8jKRSqAOZyFPY81wcwD5YVB9O+47FzDZ8oGnDoheTBVkLNxwjXr
 lgjO606bAs3yZxKVEHAY9Xs+Xwwz8pn9l/wqOzS1/TjMvEBSjAPh2q2HD0yolqtjYyT5
 CBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IFjWUXfspDkCWdDJutszC8GDF2PR+9cbEqNg2oZTgrw=;
 b=dBAqTM9jTxn6M10oNFtVV2HlPd6AkFAtWaX08tgyPcDFViCDLTzxi4vkxWyozN/v/p
 QFQfRii/4DfgthiHU+/n94/7mmQVVCDzWmefJmNmk94u8ivnmXAcfAdxWPrKGApZeP3Y
 85GaaZ0mt2LbBiNlgIkDhzCfhAv6PCc96Uu/UEA975EFBsiMevY268mzIeLO7X9PQJFt
 rJc+1iAv+HeTJYczH/LXLhF+IvS5lStxeqLzxsJui673TCDJng27utDhhNQV2gVY8Km4
 BvVdiy3YqawZN3/1QbpI2p93a1nq6NRV6lOTTefje9qstGPrbm8YAoS7y2A5WcIyWg3X
 c71A==
X-Gm-Message-State: ACrzQf22WlquXjtwxr9Ksq+izOl6nnEHIjxOpJU/Unleh5Wk471jnpyo
 +nBJBUCMgWDNiKr/ybKKQVfcug==
X-Received: by 2002:a05:622a:5c6:b0:35d:4fc2:cee0 with SMTP id
 d6-20020a05622a05c600b0035d4fc2cee0mr8340000qtb.143.1664568996634; 
 Fri, 30 Sep 2022 13:16:36 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a1:5a60:d0d7:468b:5667:114b?
 ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 h16-20020ac85690000000b0035bb8168daesm2662528qta.57.2022.09.30.13.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 13:16:00 -0700 (PDT)
Message-ID: <64bd1473-ee2a-9e9e-4411-2ecfb39ed4b9@linaro.org>
Date: Fri, 30 Sep 2022 13:15:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] docs/system/arm/emulation.rst: Report FEAT_GTG support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
 <20220930174853.2233633-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930174853.2233633-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wDeFdcgaIdMz

On 9/30/22 10:48, Peter Maydell wrote:
> FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
> can report a different set of supported granule (page) sizes for
> stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
> we already report the granule sizes that way for '-cpu max', and now
> we also correctly make attempts to use unimplemented granule sizes
> fail, so we can report the support of the feature in the
> documentation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
