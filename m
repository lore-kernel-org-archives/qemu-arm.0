Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp201653ejc;
        Fri, 27 Oct 2023 06:34:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFVqAiEXByBuz0M+jX/A/9oRYFrdX71E/XVtCrzKNBr3lhyu3+V5Z1h7tyejSLI5Pt7+c+
X-Received: by 2002:ac8:5f06:0:b0:419:573c:59a4 with SMTP id x6-20020ac85f06000000b00419573c59a4mr2995742qta.20.1698413653680;
        Fri, 27 Oct 2023 06:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698413653; cv=none;
        d=google.com; s=arc-20160816;
        b=ISJmKxh07CUxMAjKwdnqNCwYzI0zjaUklkx8yRPFWsTc8NE8hhEg5Ty/imNVbvGixV
         pwFx4Ps3NY+qrkEsbaadXMFJNC7x6RGTGCuu4G4ZaVJy9EseeZ38+QC3Cf5DW97I7Fig
         jJNGomOtAkAF6Y3fPQol28e5DSCamERsu8i4PhdZf1UoF2ipjNnOkPY0JDJH812NnDHr
         UtMSVhdDNhwvVB4JZUTFkQRwA6fCmnEE63faISRv8y0peDES5HD5x9CgFiCyv84OScxP
         pXWz9pgiPgIt4F7ybQrm84yk62wQYnfCE0bRt393IjRGPnVoTkCD+el0yY5fd5uKM5U4
         4pgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Bt1hJxIpz0b4+/7Z1+AD1h+KdMZIZu3N9EF51ynddmY=;
        fh=xnc46Z2FUwJTdxd6lQ/2LQZV65uw6WovzCCeAsBFwX4=;
        b=ZOGkXA7J1xL2NdUj1uCiuE0y7VsRVTCTJI7ZdfTvX36BfjDxsZlgOvzmVfUrrmqiaG
         +PMQOj7YNnz50dL8mAZRzovaRUVGu/gmLDQmRkhOq+K2w5I/+VwvnSf+v/gNHOK+MiiN
         3G5uw59M3g4SLQSy0kRbOOF7cQymrE3A+ZxTQV0PWtxiQHhnFdjmmfMF0sGd7MHUqIDX
         /sbLW+SZy7/fHsfv29dOyFqT11m05Tu4VG9AdzBTyu9n7t6UcXproMUw+tKlidgfmhz+
         UlNEiKy1NV1BagRUr/uMRpIIOjkH+sX/DsB8PgcM5O0GP6TyHMXdOUdrrGrh9gozEdf1
         hpvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GNAnCLSm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05622a1a0100b00419767946aasi751677qtb.113.2023.10.27.06.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 06:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GNAnCLSm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwMyB-000169-4P; Fri, 27 Oct 2023 09:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwMy7-000158-ON
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 09:33:43 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qwMy6-0005us-8C
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 09:33:43 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so335116166b.2
 for <qemu-devel@nongnu.org>; Fri, 27 Oct 2023 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698413620; x=1699018420; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Bt1hJxIpz0b4+/7Z1+AD1h+KdMZIZu3N9EF51ynddmY=;
 b=GNAnCLSmrobe53gYOVSwSnbPYK0HcsZ9z7AgcYQOP+7rn5mdnfaqfUJvyJXPElAtqh
 5qQLMmgYv+oJgtANYIywKrS0yN+5yXbApPXm7eT/Z/XC6LiPbGu7zW0wwHyGJYyWlJsm
 DsnJyjvjZb81FPIhXZPM9Mk8BDM/7a2y8GPMGC4UZFtzcL0KtgVJ9xx8xe5dixl17Gcb
 /fR7Tv1nuzXro0CjTyjpLIquBR4EnjVyr+7/R+nzn5O/tYrfSvO/V6BO60rEiPjDZCtJ
 pEwHAUY9p8WmTnSx19qgkegf+wII9Ks6BROy3a+yMyzl0cr3InaxDEljcDsjBi8afPOb
 llOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698413620; x=1699018420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bt1hJxIpz0b4+/7Z1+AD1h+KdMZIZu3N9EF51ynddmY=;
 b=rzvu5zNlXoMEP9g8AzwIzpDMCzuEh4IUMeNxdwhcrCNMDX3/19HiVoIFmJJ7nWMGMI
 eiPDm9zZEZUh1gtRIk2MlRBd3maslPsso9M8EmI2NBeqPS3KQrkr6ojgON2FW1BWMoBU
 bQ40+98108wKyXYFDYyIKb2J187yguNeIv657wvoxHvOngOkUH36nKcJhtJDIOUFW5nT
 hi+6tHt8GPy5zwyI1mAuTbIHqUJkIc5GVDhQXNmnSd33YthxpYaD4V6Rj/Z76KoLl9n7
 zExTwqXJG2rLoATXf/XxMUhOE4Hs/5GoKobGjLqqdwu2WI4sE+Iwl2BtE1dFJZ715SsE
 oMcw==
X-Gm-Message-State: AOJu0YxKUORRXSuJm56hgi1LeO79IeBrO0fZW/NLZCUcw2XDD0cVcVE1
 q6ALbDeo+S9MB3SoKEVCB9MHOw==
X-Received: by 2002:a17:907:d19:b0:9bf:5df1:38d2 with SMTP id
 gn25-20020a1709070d1900b009bf5df138d2mr2044776ejc.3.1698413620412; 
 Fri, 27 Oct 2023 06:33:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.171.220.131])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906228700b0099bd5d28dc4sm1205406eja.195.2023.10.27.06.33.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 06:33:40 -0700 (PDT)
Message-ID: <7f20a803-db3a-fd4a-bd43-04b21db1c14e@linaro.org>
Date: Fri, 27 Oct 2023 15:33:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 RESEND] misc/led: LED state is set opposite of what is
 expected
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, clg@kaod.org,
 andrew@codeconstruct.com.au, joel@jms.id.au
References: <20231024191945.4135036-1-milesg@linux.vnet.ibm.com>
 <CAFEAcA8N7nUmoQHkhSFdVG+3amkW6N=jsVq8BqkfQAzygY_4yQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8N7nUmoQHkhSFdVG+3amkW6N=jsVq8BqkfQAzygY_4yQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eMNeY/Io2E8/

On 27/10/23 13:51, Peter Maydell wrote:
> On Tue, 24 Oct 2023 at 20:20, Glenn Miles <milesg@linux.vnet.ibm.com> wrote:
>>
>> Testing of the LED state showed that when the LED polarity was
>> set to GPIO_POLARITY_ACTIVE_LOW and a low logic value was set on
>> the input GPIO of the LED, the LED was being turn off when it was
>> expected to be turned on.
>>
>> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
>> ---
> 
> 
> 
> Applied to target-arm.next, thanks.

Sorry I'm still catching up.

Fixes: ddb67f6402 ("hw/misc/led: Allow connecting from GPIO output")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

