Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1576537lfp;
        Sun, 19 Sep 2021 15:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8FFUyEgTfEwmxP8Y9AJM7N80Lk+62S3AStRh7P3RQUOE9kUcA6B+eSO7RqUrINqREYgdz
X-Received: by 2002:a37:f605:: with SMTP id y5mr21326261qkj.505.1632090865209;
        Sun, 19 Sep 2021 15:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632090865; cv=none;
        d=google.com; s=arc-20160816;
        b=G5xew5YSMpPjCL4oKhh2SMqaxNzTnIhBKQi+LRy89ZTL5wM5iqjXDZCa05DY9dJOGG
         Si9v+0o2gluGvMjLjk7X5XLSlnd44h7srIXgUuk9hwzpokL1kCO/H/GFFvwKVhOWdFY5
         HCJlRpI+RL+IKJqKQnheIUvK2r+TySRNpre6yLLHil8DvMNhR+kYDEkLiG+DK/vb6+GW
         R34/vL8BsF8Mxy9uTJX+zkaKb30K5Zg/UXMpv0yNUOTCSTofXSI+9iuaUe1BiTWG0CNZ
         8k3K76/+fvbP7F/S2RH4j3Om1D+LiKFZQOgUCgUBW7JOjfwbjIFDxaAxOLHL4pauNNEw
         WxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JjY/JjLJDJC/f2MYyieAToInvQGl9JzrnLCtUa1oBAA=;
        b=AEic1DDV92ur1K5xQhoD4xCknLST0m0q81pvYSpasi2w/oU/06OV0roApkpjV3kk6q
         WJpeWR525B/+xs2S8fd5xgF494HFCtru/lpLZrIfS9ixzCXEQe8/qSjHIblmxlpV/1u1
         Mbz+bBaVRPNmUR4KiN1sTV5oG11IDDV/ylS6aZpFbrkiYc7gvtzM+XUGUluU/vGsvVAl
         xAU2uRhIAYDArRQYjh1kwsgxGDy7IGXLO6huMpSzcv6WH1iCe8vyfIJLaFrCVS3wL0Op
         WPCCbTnqinpcf86fsvmtvqFcicX20VzRZkN3VWp/m+bt1rYmtBzVn0aZFrWaW7lMgUo6
         olCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+yUj8so;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si7973101qtl.232.2021.09.19.15.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Sep 2021 15:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+yUj8so;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mS5OC-0006Im-Ma
	for alex.bennee@linaro.org; Sun, 19 Sep 2021 18:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5O1-0006IX-RI
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 18:34:13 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mS5O0-0007Sm-Eo
 for qemu-arm@nongnu.org; Sun, 19 Sep 2021 18:34:13 -0400
Received: by mail-pg1-x52a.google.com with SMTP id n18so15446733pgm.12
 for <qemu-arm@nongnu.org>; Sun, 19 Sep 2021 15:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JjY/JjLJDJC/f2MYyieAToInvQGl9JzrnLCtUa1oBAA=;
 b=A+yUj8so78600iuDGrYEclUwDwjBKw8QTA5WkVOn4qiGTZk73bJwkE1RpTt3GU8Gj5
 8F0bMBitbuW2Fv7/VUN36NU1eAZ8mo4PWAypl7m/AT+OXSAiL80JECE/d5k+VWqU+c4m
 iZuDLI23/rzup8sdfLCHON75zHm4qJh+82YMPrl5v4JhL7H3Okx94ZiRf8MZCUmTtyXV
 GACDNeQerxhCD6oLl3erCaiTMe1XMmNgeyPn17WCDGjsa4C5KFslheSd/p8/p9vK7Iaf
 MCIeewjci7mb1YME36IRWSkVzXumGgwFuX0UFZvgcm3gu1JBkhrLGchZFzZO0ItU3iX4
 9ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JjY/JjLJDJC/f2MYyieAToInvQGl9JzrnLCtUa1oBAA=;
 b=xtqWdG2Sz5jDx9Tlacnief+z93BlZtqymyqECLUxRo0GuQTF8qY/BAuR0EEI/B7R5E
 MLSCobUJ0ImVJ3FJnUqZ3GhgHmhOklfsa3lhCG1KjCkgf52VmVpP6FwC77hllCqhGTWc
 U2PL05XMChwHadltcZIyStJeCepoRQd05ZZiC2yDWZjmdMjejcwz7K1dgtdF/0p2Iy86
 E/hbL2w1dC4xjRKp09RtznsIg8Ovy6tzAroQG/z6TeJ06krIGe7W1wcr533Rjm6vl1rH
 L+/DOh7ATSV7qVgc9ZVHcEmDoq1HwN1G+F4cJHGEmHZfdh4dgZLdkAEvi1EqlIuTQKIU
 EnWw==
X-Gm-Message-State: AOAM532qb9WRjWO0FyO2FFUQWrMmQDGB1AkTr0oESaFbIRyAfDLIMlPP
 CERpUher9fdo80zTTDheGLRArhzOwc8Olg==
X-Received: by 2002:a63:741b:: with SMTP id p27mr20886130pgc.140.1632090850723; 
 Sun, 19 Sep 2021 15:34:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l142sm5271094pfd.87.2021.09.19.15.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 15:34:10 -0700 (PDT)
Subject: Re: [PATCH v2 6/8] target/arm: Assert thumb pc is aligned
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-7-richard.henderson@linaro.org>
 <feb3dea5-99d4-05c6-ca38-5f7dbc31d08e@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84cebf48-f2bc-93e4-468f-2dff88726362@linaro.org>
Date: Sun, 19 Sep 2021 15:34:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <feb3dea5-99d4-05c6-ca38-5f7dbc31d08e@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qxXTCEm+vBcw

On 8/21/21 1:46 PM, Philippe Mathieu-Daudé wrote:
>> +    /* Misaligned thumb PC is architecturally impossible. */
>> +    assert((dc->base.pc_next & 1) == 0);
> 
> What about using tcg_debug_assert() instead?

I don't think we want to let this one compile out.


r~
