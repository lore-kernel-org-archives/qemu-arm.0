Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1134594ejb;
        Sun, 1 Oct 2023 23:54:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1/yXt6shc+utKTdC1AikOm6LijmLfF5P6VDDgo06H8uQMYI9ZOaadV5MfCr30BPbKGFK8
X-Received: by 2002:a05:622a:548:b0:415:14bb:5632 with SMTP id m8-20020a05622a054800b0041514bb5632mr12781445qtx.28.1696229659268;
        Sun, 01 Oct 2023 23:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696229659; cv=none;
        d=google.com; s=arc-20160816;
        b=OYDADKpdhUj18N7lYQihaaH5tcvlx3nrNmeMbJ63OBypEX/yrp+SMZv7oE6a6rRl6t
         cduBU4/CmeI8+WGZcnWsMoFop+rgjh+Husfn1MU9SKfe8MSKqs/FXqshQa9euDLF+PqM
         C2MGxQOsl5ZujyI47oL6YfCn3pLukqv8vQSmt2P313by+kUio13bIHK6c52TPlb05D6U
         Ifo84PSk6YpvpEROAa3OL6ndFOJb33g2c3egqrdEUMK2FikFSKoKJrSsEXQHWFTYud8X
         SunzbxnZ2IHx+Y0uWbOhxMFRc6d9KhE4KadJTA/6f+lWzjtFmiJDP3QmDY+6u93B7du/
         jmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xcBZsjDw1G+5EYCt0VIhVW0jWHgAELzxXzT9/I6GAQc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=hzZJ3uDRvoiP0YAkgOSnUZg7ujPk/r+YkUbGF1QpLUohh1uCcf6nyJzetjOs2KHNMH
         daXRCWUHyZttKpW7jdWtWO4yAsxDgDkLPKKzGB7RAwTfLpSepidXLTr9F0/NWhRMk/Zg
         9LGfn91HXPJhlye2xmUoQtEGUBlCmELyN/a21/sTk2vWQJPn6wz+ETyVJx7CkOwc8cqP
         nEp8diutwxNMeY+FrMBevlmdmv/JONGS+/Z6IQBp+XAItlna6zue9dom+5WRdn9GZufE
         BMcAGzGiU85ydJsPKtuajaj8H6pUk66ZlrBlZse/vLtQkrNhszkD2DmqlXR84okGXQR+
         /xZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yVqzNU/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020ac85896000000b004109d20c07dsi1119726qta.499.2023.10.01.23.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Oct 2023 23:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yVqzNU/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnCob-0005yi-0U; Mon, 02 Oct 2023 02:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnCoZ-0005yT-LT
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 02:53:59 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnCoN-0003x0-Gf
 for qemu-arm@nongnu.org; Mon, 02 Oct 2023 02:53:59 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50444e756deso21070006e87.0
 for <qemu-arm@nongnu.org>; Sun, 01 Oct 2023 23:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696229625; x=1696834425; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xcBZsjDw1G+5EYCt0VIhVW0jWHgAELzxXzT9/I6GAQc=;
 b=yVqzNU/26kqBTT0Tvei1kUpZDGsOPwBHX/j4V+Ja9kQB4G/KVCXGd8hyuHWQ4EIeV6
 JYzMZBMmd0+/xZCvDVgGi8l2N3Kt/4UXOUQfmdiWXgPwA3rfnfD4MGOTmL4j81SzvqHh
 tgvdTxf9MC63MXk/vO+yKEiS2O/Hiha+KlBKGMPW82M2uayeLCGDoRWMeLUxpOSZwU0M
 CEL0U4d6rPQ4ODOsOGdcLIRKb/h3gTe2iCAwWI6r9YKHJYbZ0zE5+kpM1ekL8KWivVpd
 0FfHUbA2RfHawFKprs2hkq818gyjXc/edCZfK5Ypa+HCC/KMs3wzLw1dqgSQ1QlqBQbS
 25DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696229625; x=1696834425;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xcBZsjDw1G+5EYCt0VIhVW0jWHgAELzxXzT9/I6GAQc=;
 b=tjD2WMCzDV908w6CyGDcv2Z/Uwj85M95nG/VWUnopvpc3p93rMEeIMB0S2/ItNepeh
 mtWkUV/OQ02vf9IZWJbrD60/fU+zSHQa1zk3ai9LaeYd5ZThxKVCxBNd+mDLH5AGPcOO
 6mz6f39rLosbjl7W5IqOh6YOYnMWFjMTL1g39v8J2wQZrKEXIWuaT5OwbfuNbkcXjndR
 wYtvEkfWS8JUEbK4BLwZl3A4whGyW/rGTNYJDfZTMoxMTuOn3N1PVRsKaAsLiu9iv5Qn
 V8kwf3LoCfVZwj9gE50gx4+QEJgaBoCmCgbrsMXXOCY9E2i7fdQ3bKnGeWkON76eNhkQ
 EHdA==
X-Gm-Message-State: AOJu0YzyBGEz+uEWTND9aYx03VoROEP+r9xvIj3HAPFrvC1TunDCzToj
 NJPklhPi84iQ+KUreAymI6I1yQ==
X-Received: by 2002:a05:6512:39cd:b0:503:95b:db02 with SMTP id
 k13-20020a05651239cd00b00503095bdb02mr10645615lfu.18.1696229625406; 
 Sun, 01 Oct 2023 23:53:45 -0700 (PDT)
Received: from [192.168.69.115] (sto93-h06-176-172-7-203.dsl.sta.abo.bbox.fr.
 [176.172.7.203]) by smtp.gmail.com with ESMTPSA id
 v9-20020a5d4b09000000b0032008f99216sm27721320wrq.96.2023.10.01.23.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 23:53:45 -0700 (PDT)
Message-ID: <59858fd9-3c1e-32f8-1be9-e1e7d81ce46a@linaro.org>
Date: Mon, 2 Oct 2023 08:53:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] target/arm/kvm64.c: Remove unused include
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230925110429.3917202-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230925110429.3917202-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.058,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8KKScHzwKxnM

On 25/9/23 13:04, Peter Maydell wrote:
> The include of hw/arm/virt.h in kvm64.c is unnecessary and also a
> layering violation since the generic KVM code shouldn't need to know
> anything about board-specifics.  The include line is an accidental
> leftover from commit 15613357ba53a4763, where we cleaned up the code
> to not depend on virt board internals but forgot to also remove the
> now-redundant include line.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/kvm64.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


