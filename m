Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1398839ejx;
        Mon, 11 Sep 2023 07:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEucRU2OX806dKmF7jE2/rs5wlEDdStdnfxGhQtbHZTbKgpQIAa3d3LAuTAiydQ7ZmqnbYj
X-Received: by 2002:ac8:5b03:0:b0:403:abf5:6865 with SMTP id m3-20020ac85b03000000b00403abf56865mr13484726qtw.18.1694443919884;
        Mon, 11 Sep 2023 07:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694443919; cv=none;
        d=google.com; s=arc-20160816;
        b=sXiIHjTWJqp2+eNhwLGZuf8nKXzl5Y+2qCSX+7HCw9oBebTm1Vsq4v73y8bM+pGVcT
         bfB87B5B21iRM7pcKVRSTpqxkJXwUs4BZKrBcyio7y2q7DuQx6vp86Y8BBBV1cw+KssO
         ev6YI3tTEqsKO4mpjcqv4H9b2gK6KR6yqdcdD9ttx9hsqe7KGETpYG/GjVahD7G32/Vi
         H8SSpTfaC2QyDZt1dAL2oZReRPMajfrcSoslNteTJFx+5z60EwC41HEgpVmLXczyC+0i
         6U9gv0E4bwllAr4TB8SRz/SO1RBpbm/1r+qJiTnmGKi8/cJxAnDYcBLFv0os+GQQlHXp
         /Mjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=+g+PzcLXZI7am6/sFewOZL5hgXQpZfXwThkwZ9tCOCs=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=i4yYC+Tef9jLpyRfVnakxsDwNK2T3kMtxawIRXgyBpqULPv/UqQtiQslydSuYDAAw6
         9T4QJKOs7Nj9vBjMqFIcvcuK5EsjavctkmFdTUVr37/M5oAg11NGApDAcMOTt92tiJmw
         QMpoXiApCgrc8BfNr7+m1ig5zbkSvJ+BTywgchyzcsGyAhbmm/QPDJaPPZyuBM2QfR/L
         fP5OnE9vgs9ob/ZKlZL4eJ9VdzZw6MmuArrdQwXAbYAQyNCDUxbIkDfWAZZaDKPjLOTb
         +JdFpfXIX+dzvdk+94jzZTsNn0WrhXVCaJPq+oOn9HQxrtU9SgkZZXtS2P5K8XC0ShD8
         72wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FblNj4iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a05622a039300b004043372b6b0si4837290qtx.228.2023.09.11.07.51.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 07:51:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FblNj4iq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qfiGV-0003wM-So; Mon, 11 Sep 2023 10:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfiGU-0003wC-RH
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:51:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qfiGR-0000Rj-M3
 for qemu-arm@nongnu.org; Mon, 11 Sep 2023 10:51:50 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso24514225e9.3
 for <qemu-arm@nongnu.org>; Mon, 11 Sep 2023 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694443905; x=1695048705; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+g+PzcLXZI7am6/sFewOZL5hgXQpZfXwThkwZ9tCOCs=;
 b=FblNj4iqnjHWy7eN//uXFFwCAHOQtoNhxjhYxTYa9TZOhcUZwrwjQ4TpA6pencxoa7
 lLMa+Rf8slfuvCKoBsCGHSkb0nn4yDlxoRvuh8GKUYVL7iMD3P4q7pLjjSv+bpANMoN+
 FSL5ltw9pWpJD1CaN/tzsyON7fPwKhl7K32W/5BTMKaoJo9/rr19DsDaWXq1/oTAJTJ9
 ifQT7BUN0HgZ+5xPJ+lb6xcVCvxUQo8eupDwvZdB5TSSp4Yqunq5PDCODF7k1Iwlt4pq
 A2B8N6lB68NGoX6PG9NjWGnOPA31e4oas7YQZ9iqf5JoU+4Hk0dVK+FsBDB1nNwZuxOP
 ToLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694443905; x=1695048705;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+g+PzcLXZI7am6/sFewOZL5hgXQpZfXwThkwZ9tCOCs=;
 b=QRDDKQ8ruZbxnEhff/nSR5DlnpXwjA02e9jCBGxSCNj576SWNuZAfNIQFvr5CjCqCr
 Vl4wMIjhxLq+L/qDm7phibu4tEyHSluBVKN7HMjkAERXKtQ0mUNB/LNybMGSSbbxl3bU
 R5ksVomNL4bp2VvREqooku0sHZuca25MyMyyOHZxB+rmljBlLDUuw8qAL8dN8nbazdW+
 Udy5/3AfAz50skTrMqsKSS7a8QbFZi/nzt7AjNrndYQlU7KvuhtXjpWSmtMiP3q7Sfda
 WSxW+W9nGhJD07IV/8YNySOqSpmSQLbWeHglxa2GCbmeNgj8jFwU/jA4qx6srfROJNGJ
 g9NA==
X-Gm-Message-State: AOJu0Yxd0wyVu+91sw53fwGGgZDkeOtiKcidoh+CnXBapfQ6PTNY7r3X
 9piMGu6ZW7r7jtbxqvLiO+Fb2w==
X-Received: by 2002:a5d:4e0d:0:b0:317:3dff:7189 with SMTP id
 p13-20020a5d4e0d000000b003173dff7189mr7977958wrt.66.1694443905276; 
 Mon, 11 Sep 2023 07:51:45 -0700 (PDT)
Received: from [192.168.69.115] (tfy62-h01-176-171-221-76.dsl.sta.abo.bbox.fr.
 [176.171.221.76]) by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6092000000b0031c52e81490sm10326808wrt.72.2023.09.11.07.51.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 07:51:44 -0700 (PDT)
Message-ID: <fafc1a7e-47cf-b021-5b49-74dc229b5a20@linaro.org>
Date: Mon, 11 Sep 2023 16:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 2/7] linux-user/elfload.c: Correct SME feature names
 reported in cpuinfo
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230911135340.1139553-1-peter.maydell@linaro.org>
 <20230911135340.1139553-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230911135340.1139553-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iuWhW/WPaL4B

On 11/9/23 15:53, Peter Maydell wrote:
> Some of the names we use for CPU features in linux-user's dummy
> /proc/cpuinfo don't match the strings in the real kernel in
> arch/arm64/kernel/cpuinfo.c. Specifically, the SME related
> features have an underscore in the HWCAP_FOO define name,
> but (like the SVE ones) they do not have an underscore in the
> string in cpuinfo. Correct the errors.
> 
> Fixes: a55b9e7226708 ("linux-user: Emulate /proc/cpuinfo on aarch64 and arm")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   linux-user/elfload.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

