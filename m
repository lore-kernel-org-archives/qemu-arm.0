Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp24531lff;
        Wed, 16 Jun 2021 17:21:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy12uo0qdi7qszT/28xrA3jwcCQOl6swUQorTOr6QMlBeNs1xrapwmkDJzTWo9Lt3TPfnDS
X-Received: by 2002:a9f:242b:: with SMTP id 40mr2957916uaq.20.1623889314705;
        Wed, 16 Jun 2021 17:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623889314; cv=none;
        d=google.com; s=arc-20160816;
        b=F/p9X38q7ohkJBv/P305HGnYl0e4lQy1kuBmKVVrXVkYwnxXXukcUxQmNRSR7+CY0Y
         onyMIX6gP0+TYYVOBteZTfZRvXyTuuFr730gWzwbJSzBUehWajgSzdWjMUvdK2wW73Xo
         hihNdv/ibVFSxXd+YFQkOpOHUdo1HvPBJCe/jTCyVDPaMe90pkpfN5ztRvoG5Nh8M3BK
         3/jIO/Ukjy4SpJ0ZVftGIUzRaFQ6iVyWy2euiR62yrZoubQDT9Asg7lUDQbVdrlFXCPO
         FzqU0anrRBB72qcqDEd0Ov7dXoSQ6/5a0/K/0tNGIigeWOFYg32xTfpuZLpVSV/+O/P+
         XPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZrIXhjlZHpMoQeNLSKhMMo81EYzMJ4GWtWtxwudmjaw=;
        b=w3FaNrDNicGHcsP2iArdHUdC6kb0umaJ7nR3mFGwKuTuNNXZP2GzaOmGqGVFss4pma
         dFjckcbZAp8YIhqt9cpZEA/OVHuen+yOTwUoEcaKSASvkVlkpyjCggA9OBucL18l7MFJ
         fCPQe35KpZrk3kGa1U5O9FS0PRBXp1Yx4VuGt4h6y+7F6NCMuFXEFd2pLC+7S2223Bs6
         mIewVjt3fCCHYEvlENZksoEUg74946VMm8IxBUu4MeqVeGNF6QiXlI1HSbNZdeearGl7
         8L3jhMtWTtdLAxSbujNB5EX1aXfmeCmlFUl0UDgWydouCYbAsxVQR0oBWfzY8X0zKWu/
         EB/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LPGgWfCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si2774573vkl.44.2021.06.16.17.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jun 2021 17:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LPGgWfCz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltfn8-0003pq-0J
	for alex.bennee@linaro.org; Wed, 16 Jun 2021 20:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfmx-0003ox-5r
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 20:21:43 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:39830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltfmk-0005eP-Ng
 for qemu-arm@nongnu.org; Wed, 16 Jun 2021 20:21:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so4860682pjo.4
 for <qemu-arm@nongnu.org>; Wed, 16 Jun 2021 17:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZrIXhjlZHpMoQeNLSKhMMo81EYzMJ4GWtWtxwudmjaw=;
 b=LPGgWfCzOr5AVjxYfHYHukQgS5MKCAJNsZ+j0JmbBQxlt4whfAL488KuaHj0lwM71u
 mTgKaODS7OY3C+UNt0MsNpZwbkB0TJF6SgRb3xYKcyxdCFU4RuRtKidTFJ5BxrGlO7ON
 7dd9cylLq/4Nq9HSv+o0qCGmZ1an3hPUaDNaJK36CW/2DCEjKIe1Y2LhoknR50OG1m6A
 BKjNy0KymnBWk0w0L/+BVO1eVe7cbSBFXuIekJuc/cbNBK2XbYRCsWzMn4Dw/+SQABw2
 6uJyr7jzZce8OY5Nbal2YC0JVoyFnCPz8pVL/eYpGVeVFg4Tn/2PGF56zIuvBdJ5GBmY
 JPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZrIXhjlZHpMoQeNLSKhMMo81EYzMJ4GWtWtxwudmjaw=;
 b=YgnorSek4RyHFaTlY1uazyblz1YY7eOpMwGLqqyOT+/YIhWzQOHqDbspTn0klYizXu
 xV8HUbNHCe4JlLEZ+0NqBERpEXLLpJKpOViHu5GlUgRBNX9WcbHf04cYYgqgHWVBndW5
 hswdPJ0Jof0CuAAlBy+KgQMjx2a6aph95fLmtcXCwTS6E0AQnPpkJDc8eANNKyU64GNu
 Ue2WIRNuTQ7OYFA2FHaNSVr/aIN4pRvmE89YA9XH5lGupptYBrbRKycIqvVKILmv/Ugv
 3XXPKdf02UCzyWmdo1TU+k7y2wU6FNhmvbOvLcl/rll0QIHJBUx8dfTk3mNSraCx/1Qm
 4O8Q==
X-Gm-Message-State: AOAM5333DmqZ4vuLwaQbtB7Uc36QyHvpsY+Im0j4zgLgb7ThsbVm9m1q
 dKl2ek33PBoeBRiL4dGegMRfnQ==
X-Received: by 2002:a17:90a:6b01:: with SMTP id
 v1mr2650131pjj.10.1623889288786; 
 Wed, 16 Jun 2021 17:21:28 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o139sm3398270pfd.96.2021.06.16.17.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 17:21:28 -0700 (PDT)
Subject: Re: [PATCH v4 14/15] hw/i2c: Extract i2c_do_start_transfer() from
 i2c_start_transfer()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616214254.2647796-1-f4bug@amsat.org>
 <20210616214254.2647796-15-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55fd40c5-363d-cbaf-95c6-1d1d7cf21f9a@linaro.org>
Date: Wed, 16 Jun 2021 17:21:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616214254.2647796-15-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +fCFmRvwGc32

On 6/16/21 2:42 PM, Philippe Mathieu-Daudé wrote:
> +static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
> +                                 enum i2c_event event)
>   {
>       I2CSlaveClass *sc;
>       I2CNode *node;
>       bool bus_scanned = false;
>   
> +    assert(event == I2C_START_RECV || event == I2C_START_SEND);

I don't think you need the assert, given that its scope is limited, and there will be 
exactly 3 users that immediately follow.  Document it if you like.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
