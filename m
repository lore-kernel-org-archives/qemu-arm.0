Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3716057lfv;
        Tue, 2 Nov 2021 10:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzK9vMvcC6ERGfUqjVRRKLmI7uL2FQ5JZeLVsGAs5TiwAcI/S25DjREm76A/IwOXf8voC98
X-Received: by 2002:a05:6830:238f:: with SMTP id l15mr28556581ots.83.1635874784256;
        Tue, 02 Nov 2021 10:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635874784; cv=none;
        d=google.com; s=arc-20160816;
        b=KmUTTK0ghwSVKlhUr5Gm+PpsdWkRmhgn6Yzgj1x2trI3cwS6+ytK+Yj6/o7scDVYeZ
         rwzGT2PgQiSi+DxOMafphwi+XBhmk83X4rz0PT0v1JtWnkUYoqx8FshuAMp6k2g9I+sA
         mBaxkfbjXuGKJTM+jg42n+8WLKXaOSrRjTWgUTgHnzgYfWVyWsrGniQzPlU9d2/lOwxm
         t7zHL4PZy4BUAXothZRimxRb/dOF09nW7eWFM29elD/qvWe38k94LBuixrewCmFgv/2W
         xpoNBbwwoWIivUI5jzgvZS0OiWtvW5TiLR4EVK+6828g1HF/T8GTswE5w1hfyK5Eg79N
         9NlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uif/qAWRc+4Wy91q5JQIfgiPXj2mOMubfNGrQwCE23c=;
        b=0YBSZrr7Ytw9Hs0YdVr6C4EB9Ikvsm/bUvSugm90YMGz2+CZEQG1FlGV/K0yqmymQh
         zmHAVMlZ8sSDK2cqyjsIybd1nc13kYscG3O6zRk56alqq0fPuu6olXDoUdGuRhZE7EAo
         nUGmMrxpg2Mbsy+GAGfxyaBxtQ4HdGjX73zbNbuzmtI1RqzgLRIblQypOdz3JUKsF9at
         UjVVV7U17eGRwtT8ytbq4CY/udnw5lr09UUE0hT7b8A5VUznnmqHEYNgq+ihdYdp6lQD
         Qj46vvpoywlfaQUSwNdleU7L+OLFxsKVDV7mYqJIxL838i7CvCU8ZujLXw1OpiRcPG2y
         uRKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k1kVYbuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77si16214462otv.184.2021.11.02.10.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 10:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k1kVYbuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhxl7-0006ZI-07
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 13:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhxjc-0006Vq-Ck
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 13:38:08 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:38674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhxjY-0008UY-1y
 for qemu-arm@nongnu.org; Tue, 02 Nov 2021 13:38:07 -0400
Received: by mail-qt1-x835.google.com with SMTP id h4so18967547qth.5
 for <qemu-arm@nongnu.org>; Tue, 02 Nov 2021 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uif/qAWRc+4Wy91q5JQIfgiPXj2mOMubfNGrQwCE23c=;
 b=k1kVYbuIWEN07DKYLVlyThJzRZPeWq7whDfF6YGDMA/Fwtu/DXNFxYewQ4fkXa3uWJ
 rA2qD+mRMFU2NTZpeInGPLXk3QAzCvhQKgJKDMvVOxJsYni14pRFMIptQeYoUCh+2nb6
 wVzxFsjCvY43h7GzntIYb1M2qyZ/+Uj5mN/AZ3QtvEJuu7dZV7Pa4gIbQsoH034n7+k5
 O/OLW1/rHD9dv+8I3gk/rXaveVEPnhJNAtcaDSuCyROz04a2vJ9ooU3Uep2imONggfGQ
 aKJ05sPQDBFrp5F35yR9NDxLlnOmzT6KbbNk3q9fxD1T/Jqh6P/uz7Dku6BZTZ5+9qDP
 mHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uif/qAWRc+4Wy91q5JQIfgiPXj2mOMubfNGrQwCE23c=;
 b=L1h/wYZHZvwq3tIVfXDaNfbmG0w3QzLkWh+4A3HJ8QLQ8EltLk+1taPDvv2Es2BEVN
 yx168PiXsE681W+LCmn6NODdoO1biVWIfDOtBkUKAuFgnPLCM8YnMATc/h5owf6h31Zv
 WJlT2XwFbZPwfuIagOTwzhogXxh7FHOkajZIdhb5No0E62Rcvkt62JwxAF5M5gRhfF9P
 CqhkGXNz4uzx0yzHT5Es0pqNEM3f5BnkHXXHHf7t+0QsKnXzNe1IgDE6PB+/FfcnaJ4v
 tY3hVL8JJPv5WzNz68MksVul39cAgnOVGx7PJ4DouE8HjhRD08Hi3AoWALAne+HzOgCm
 pZuQ==
X-Gm-Message-State: AOAM533jCkbJLLiikal4+j/e7NXKCyAMyBCVLSnEBHNbIx1stH40z6h8
 D8aEY2JLjbBUczi8SmJFmSJbJg==
X-Received: by 2002:a05:622a:1194:: with SMTP id
 m20mr40002393qtk.175.1635874682756; 
 Tue, 02 Nov 2021 10:38:02 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id d9sm8875879qtd.21.2021.11.02.10.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 10:38:02 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>, peter.maydell@linaro.org
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-6-wuhaotsh@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c7216403-5c4a-39c7-2595-c972f63972fc@linaro.org>
Date: Tue, 2 Nov 2021 13:38:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008002628.1958285-6-wuhaotsh@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
Cc: qemu-block@nongnu.org, venture@google.com, Shengtan Mao <stmao@google.com>,
 bin.meng@windriver.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 maoshengtan2011@gmail.com, Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGtL14quxB+l

On 10/7/21 8:26 PM, Hao Wu wrote:
> +static void write_sdread(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message to sd */
> +    int fd = open(sd_path, O_WRONLY);
> +    int ret;
> +
> +    g_assert(fd > 0);
> +    ret = write(fd, msg, len);
> +    g_assert(ret == len);
> +    ret = close(fd);
> +    g_assert(ret == 0);
> +
> +    /* read message using sdhci */
> +    ret = sdhci_read_cmd(qts, NPCM7XX_MMC_BA, rmsg, len);
> +    g_assert(ret == len);
> +    g_assert(!strcmp(rmsg, msg));

Test case bug: you're not including the terminating 0 in len, which means that strcmp 
cannot be expected to work.

Either use memcmp or add 1 to len at the top.

> +static void sdwrite_read(QTestState *qts, const char *msg)
> +{
> +    size_t len = strlen(msg);
> +    char *rmsg = g_malloc(len);
> +
> +    /* write message using sdhci */
> +    sdhci_write_cmd(qts, NPCM7XX_MMC_BA, msg, len, NPCM7XX_BLK_SIZE);
> +
> +    /* read message from sd */
> +    int fd = open(sd_path, O_RDONLY);
> +    int ret;
> +
> +    g_assert(fd > 0);
> +    ret = read(fd, rmsg, len);
> +    g_assert(ret == len);
> +    ret = close(fd);
> +    g_assert(ret == 0);
> +
> +    g_assert(!strcmp(rmsg, msg));

Likewise.

https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/546307442#L9369


r~
