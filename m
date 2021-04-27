Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4958154lfb;
        Tue, 27 Apr 2021 09:49:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW2gFl6ATjwF0vm94717pFzahN595F3nPGA1j9wEQZdKNeVyHE4buHCOSWXk6b74+ZZCVr
X-Received: by 2002:a05:6638:68b:: with SMTP id i11mr22675682jab.90.1619542156488;
        Tue, 27 Apr 2021 09:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619542156; cv=none;
        d=google.com; s=arc-20160816;
        b=CCMlAEFqlYjhcLyLQoguC3KO3s3LzjzvetoEvF+rxoseJ7XVWethw2bPlC3c6NADXs
         k+QMESJeo9VmK3X4FzIDxtrXcGrvhcBxN9MJ9X+NyFgtVig6FtG3s6eUo2oAQX+CCXN7
         2wuvSE7sX8EnxfkS8J5TPJ7u5Zc6pkRnX+7nvPM9eHSan+Xqhir7h41ryxlChODBsVrN
         H5KLTg8JvZHtYEaI4oqc94nA9PuGWwzcPurqpLzz7howJ+ujhBO2JkmVqJ0k0ZBd31oz
         AXlt+pVXmaXU6yiol4uNugwrgMUF0ueFQhFjPF8xD9CitHswnZ9FVeTgtPaLZebUpg7g
         oRdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=lafdq/kMb9hvJYgMyLwybUwaXNI4LSB1BV7ts29NFm0=;
        b=F3Np5Eu/ckiwpC27MNMJI4oDxerTj1hlU7ueIjNzy7mQJ3V2QsgBzAwhwjaInihJBz
         mwWo/fr8QoO8LghaeOfxz8/+g/nrjG5HyzHbPCWEVSUC039HtiqqdbwuScmX2zvA45VJ
         UMDIMFhWcL0hBZza779cEkI1hwZ5QbiUWTGaZMJ6GO0SHNw2axY5iZY5RCNWCBU7+jOQ
         208WialU7aFjyAApITxpZfshgBAYoQ5G9zyKiyegm44rtqZ80IfzwOCxqoqX/ytBWn8U
         33hN/xA4ve4X+dnjSYaqI/yfslNHgI8BSPhPbarc4KdnwUlIT6kYLMjmFarKkScvr1ra
         Dpbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loOwqL2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si3825723jat.120.2021.04.27.09.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 09:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loOwqL2z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbQtf-0006cw-QZ
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 12:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQs1-0005nd-4p
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:47:33 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbQry-0006PO-GM
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 12:47:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id w10so5357302pgh.5
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lafdq/kMb9hvJYgMyLwybUwaXNI4LSB1BV7ts29NFm0=;
 b=loOwqL2zPe/EQ+fZdTK7H+4yzLr8V5tPfSmpfNMGkYUroE7kpZG8cddjTeit6bRFar
 g7XNGT850miiT01gigj+O1us+qEl7OLnv+MNRA0v4ghAkLKSANN17UBD1bll384QlM1Y
 Wgjcuj1EafHB9wrA+TItqtYX3xH0Lc2RKDQFTG/FVTQIppL3935MImHHh2SCPu53T7e8
 6ZIPkMyTsvrnEJkSvGEPqthXuF1/XkT8V1f0aUW+QcBgK5X9335uS/9K0E2CVjxP4mbE
 ZjN67tvsMPWEr1VItq3QyKNWDnrSz6xjMeAyQ2R6qg1hmyam9KC6R+dL1fBs0Q7C+RHr
 pdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lafdq/kMb9hvJYgMyLwybUwaXNI4LSB1BV7ts29NFm0=;
 b=P1PcxxYv6cbFQtBLsYNdLVz3rPePRH5AubXUABTsMTCh5B+4zJHtxdcGIBRN6P2NZL
 Y47tQGWfxJ4KexPMHIhNH9Sd3cG8TPE78qSkOVKcQyUK6g8fPaHgjRCizbBjddVvX/L7
 rqGaGK5aVzT/9Q7yRGupEXQT6cn8a7l9PSzmEuTKCbKc+B9HAHlvBWA/cuVJXoyrvhnw
 DpyAP2He+uZREfkx5qaDi+IfZWJ/hTnx1cUT5OFPip5l9JRINaZkJ/HuP446d0WYewjq
 nvVUDYf2a7bOe9QFU28pr6JDrlh1J5S7GQfhPEUguGjlQ3pAVIp4hKaRJv0tWvE7WoFB
 VRGQ==
X-Gm-Message-State: AOAM533xjZhy/8BsMZDYdCvU79H5w0c6SUrpO/GYeLoYDDqx20s4uI+D
 JgjlrFDr+gkqFX4QucXT/eJVRg==
X-Received: by 2002:a63:da10:: with SMTP id c16mr22551024pgh.221.1619542048767; 
 Tue, 27 Apr 2021 09:47:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id v64sm2426872pfc.117.2021.04.27.09.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 09:47:28 -0700 (PDT)
Subject: Re: [PATCH 06/13] target/arm: Move vfp_{load, store}_reg{32, 64} to
 translate-vfp.c.inc
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3dfd6cc6-58b9-a1f4-f53a-6e5bfabc9d02@linaro.org>
Date: Tue, 27 Apr 2021 09:47:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: JNsSz/1MIgRF

On 4/13/21 9:07 AM, Peter Maydell wrote:
> The functions vfp_load_reg32(), vfp_load_reg64(), vfp_store_reg32()
> and vfp_store_reg64() are used only in translate-vfp.c.inc. Move
> them to that file.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c         | 20 --------------------
>   target/arm/translate-vfp.c.inc | 20 ++++++++++++++++++++
>   2 files changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
