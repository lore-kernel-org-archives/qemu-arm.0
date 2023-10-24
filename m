Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1934819ejb;
        Tue, 24 Oct 2023 02:59:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGajx5eSWmLTjTSOE6Ag8pFVIzhh7MskHGCIlT4vTIsrvjxUUPpXvebjpoJjzsqqNJemHkA
X-Received: by 2002:a05:620a:2b8c:b0:774:2c35:3796 with SMTP id dz12-20020a05620a2b8c00b007742c353796mr12346133qkb.34.1698141575529;
        Tue, 24 Oct 2023 02:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698141575; cv=none;
        d=google.com; s=arc-20160816;
        b=mzgwF3l6i3mZTnak2NgKJkNxDgQLJEC/LsngUUJKjl9GkiKCwB9+QHQxVKkbH4sTv8
         aFA9DobDT55+bfTQGlHWEb77I1qFJexFVX8dYRn11hWFanpRb2IY9/DLWf42DjqG+Th+
         tUbc1v7bKxyE5LBU39CeXjzSi3ti10nzhaaMl3nExeEAFTqPadWjZCQztgp1CmTnAXhJ
         IVoGqDv38SlCcY1moVUlcaBLnnCRiEmvvu3X9l2SShuhsZXDAVNljO13DtmuJTPLuvMK
         nvtZbY6mVTqsirhdYbCDxfiGKiMU7ghjC5QnPYx/GCdxUsXe/ixgbsq4T+2POfCiZMYi
         aNYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FrSFN4vrRIuqPbVHOQX03ektoS/cVZEhBXrZLhujZ84=;
        fh=ROWMHaUip/e0YxmGa3mDqKUUwrogOSRFYa8W/YBUJ/E=;
        b=JX90NOhsILMDQLILdvF2fuJF+jjXQGacxumMJ4L+GAS6cjb22H2rRnSzficiWfVw/O
         RhHIb+FSuyLX/j5eZKtITqyQoUMTCAbMPklPSyy2gjfW4Z4K8nUtF88qrpZ8yq2AsRgD
         wE7lOrIhkR4wsk/9vuaksDCYiI64QF4K5tWtaXFb7g078NI1uVK/IawYpSmcBR2nFwNK
         zD6h2E39oOfURtti1WE+hrV+4xAyMVneInc5R+PUO2QtzLEYWWFAH92a/lhUbwBosAZw
         x55ITvuo5cahQblcKMzUrOtVJM7bWJTRJ8hojvdFAVxx04ADPp++2IjpLfaFapMXAbC/
         daRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NH2ZNRfc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i19-20020a05620a405300b0076cb6c9e0a6si5662941qko.336.2023.10.24.02.59.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 02:59:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NH2ZNRfc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvEBC-000079-Ar; Tue, 24 Oct 2023 05:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvEBA-00006Y-MU
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 05:58:28 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvEB8-0004hG-O1
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 05:58:28 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40859c46447so21049885e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698141504; x=1698746304; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FrSFN4vrRIuqPbVHOQX03ektoS/cVZEhBXrZLhujZ84=;
 b=NH2ZNRfcVrrbhipujexRkEclbGRzW3Nzq60GUlJ1M7yWD1L9CYHPnfxBYpaX8hjS6x
 0kCUr7xqIiocxZU7pYN25EAOC2720Li7okTxSXTKuA3NO5+pbe7i//xoZj2X7P2/ChzH
 dB/h/u05mIFKVqEtn3ZbWw6w5p33jyU8m+KtVikyk9hWI0FLiEZgEm3MfKsuMSZgjQM5
 0tJKUbY42aurMfHUNjY7NPODw5XuLA78hM97Mpa7H9m5gsazquz6d9qOAYXyt12KfgkX
 6Grq5UB4HDRKjHFSKKYph6OsubEpPt3sfaMFodvGMlgphAmcwo5oREwIhyVF4xl2lr5V
 GLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698141504; x=1698746304;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FrSFN4vrRIuqPbVHOQX03ektoS/cVZEhBXrZLhujZ84=;
 b=IcminpxwOyxcH4NMHU6CfyISJjAGaXKsTNC6u/tksR+TFmmpbAoW00o2CRLmkfGhNa
 RrimuQLOolBXgwBfqVUN5ymC9ftTd80+WnSUsYLQB1vIzCmxm6p1Rnpqd5wpL/8qB8mD
 tW8Kyqa1bYzsE4SplPLhSdsTTHSc9vP4xxt8R58Ha3EoNeA9ri+7nSCqxEee9wF2aj6i
 TaLeExxvVLDLNuytk4lK4dbrMJ80WXYH17/MzNeqrY7wmTnVx5qFMdpeq3qw3Qd1PaUY
 U3/gvS0/LNH7CoBKfIUj78kUi6M6217a1tF5A+AUdSX/TvXMpZyIkN4CqjXCk3F+2EoN
 AJYg==
X-Gm-Message-State: AOJu0YwNINCX+oSUz0cb2gLbKY+LwZYY4I5hZcSa/kM9h49V54oblh/X
 yzUscDe/YPlF/YPz68SrmJmaxQ==
X-Received: by 2002:a05:600c:4fc7:b0:407:5b54:bb10 with SMTP id
 o7-20020a05600c4fc700b004075b54bb10mr9445449wmq.8.1698141504378; 
 Tue, 24 Oct 2023 02:58:24 -0700 (PDT)
Received: from [192.168.69.115] (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 fm15-20020a05600c0c0f00b004090ca6d785sm1471641wmb.2.2023.10.24.02.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 02:58:24 -0700 (PDT)
Message-ID: <e7877808-0e51-da61-071d-4e74f7cb4249@linaro.org>
Date: Tue, 24 Oct 2023 11:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v4 0/8] PMBus fixes and new functions
Content-Language: en-US
To: titusr@google.com, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Hao Wu <wuhaotsh@google.com>, 
 Corey Minyard <cminyard@mvista.com>,
 Stephen Longfield <slongfield@google.com>, Benjamin Streb
 <bstreb@google.com>, Patrick Venture <venture@google.com>
References: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231023-staging-pmbus-v3-v4-0-07a8cb7cd20a@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
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
X-TUID: /LvLHrYAjYbI

On 24/10/23 01:46, titusr@google.com wrote:
> This patch series contains fixes and improvements to PMBus support in QEMU.

> ---
> Titus Rwantare (8):
>        hw/i2c: pmbus add support for block receive
>        hw/i2c: pmbus: add vout mode bitfields
>        hw/i2c: pmbus: add fan support
>        hw/i2c: pmbus: add VCAP register
>        hw/sensor: add ADM1266 device model
>        tests/qtest: add tests for ADM1266
>        hw/i2c: pmbus: immediately clear faults on request
>        hw/i2c: pmbus: reset page register for out of range reads

Thanks, series queued.
