Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3250473lfg;
        Sun, 28 Feb 2021 20:37:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0s/hx8WGGlggvoZY8+/F0jroLxKsDklc6TFl/jPnP7sOsUjFiSUqZGH7Ve/MVAwizvpMr
X-Received: by 2002:a25:2f43:: with SMTP id v64mr20445427ybv.302.1614573441452;
        Sun, 28 Feb 2021 20:37:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614573441; cv=none;
        d=google.com; s=arc-20160816;
        b=x9nIGu586hSpPQ3aPZlzVc7cjk89WPIqlWcHLhSUHtXOYDaWvOjs0EJ8B7sKl7uZav
         wOrSd9bbKc2InKGkDXtHWPzce0wAZxgAVbMp/Qw1q+4YggsA+ffpwGhA7+JfVYJeI1ji
         2P1Cgr1KvP2Bak6z1SOpZokGrpmmfoNQtE8YisV/EpnCdRSy/wYttRM/BjUDE5NQxeen
         K7tIsV36jxs6bMkDDIOaHilap8dXylNxdLxxiulTTVxqJqXCQlOcw2MlzXNq4FbdIrgI
         ntObNrrL9kXCjejU+YdrrMArD7ojaejmWbOD1UH6tk/WtdXZJv6nhot1dGxo/U7XpkoB
         Xn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MdrXeexqNLgAz3eu8Spqv0t0Fs14gnmfENVh7nxd7xk=;
        b=nZkEClfuRb3pZs+PRFlMOjaSjUw8VoW3Qv+zpukRA924TUYgf6MkQD0USt1N77W7Ul
         8pI2M2KpLSW5nHXLzgiUyjJ9sdC5uhvZ9hfEnxJQ2MHtxlCO3fEvZT/XeFFwRPvjAS8a
         4jaYDqKnAen4EoHyGHbkNvOzKI4wJR7TNOBKEF7qSeE4OJaYAq7Qe+1X8tnn5/NJaNfk
         NCyzpk1Kc5nZaRM07eGstY4XPYZHU7DkfPIK0RdFo/w/9A41ZqZfCKLu8HoXmAbXrk8s
         82Fpdw1A165Pk2Foj6vJp4dARixl+ZXZlTLyPP5NZfMXdzTjBbrLgiG92u+wj2OX908b
         sekQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lcOhpUqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si12983296ybq.309.2021.02.28.20.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 20:37:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lcOhpUqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGaJ6-0004bK-Pi
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 23:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaIy-0004b7-DS
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:37:12 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:33288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaIx-00040h-1K
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:37:12 -0500
Received: by mail-pf1-x434.google.com with SMTP id 192so3634850pfv.0
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 20:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MdrXeexqNLgAz3eu8Spqv0t0Fs14gnmfENVh7nxd7xk=;
 b=lcOhpUqClXTgdWSH8JYjJVfDESqfitfKYeBLkAlw0quDHlQu6f1k/1mYtkHOTVEh1E
 IG6ulVRhE8vnMAigTRCmXdj5Z+ia3ndPFH3ER/LtlIoQamg/bqX5u8gY5CE82EdZlip3
 YoUtVxpgS/Q5UHaYcX50KS0PlDjQeka3weG4lF/UQHpQlgbblHM0jdMkqY8RtW6fOwu5
 YBQi/+Gw2GKUfny7WuxAoNFL1me1c0z1Dwnt3baqfnMqYazQbHXcuD9UbLRwsjReACV2
 3wqDhEqfKonOzO5PjJtVMbq1nmlcbToI7bVzaia9+KXPjrOhEu5q3X5bhU5nL2AbCM50
 ySqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MdrXeexqNLgAz3eu8Spqv0t0Fs14gnmfENVh7nxd7xk=;
 b=PENkcmMXdZyaSiB1D4RjbbASS70/yO9Hg5lvkaC7OBTJx94gCrPDF5slFnttXmpsCr
 lnYvtOpBRB7QupG6F64d+7N2+2CXQ9HwNawGDHRDzaN1pTLtCWAwASuteMqlIROSYqM6
 Hw60zlW107xSqdkhKq9HCnbM8epHsOA3a9zvWh3OF7+/jHyCEQtk9mLDAPtQ7lUJxWF2
 TKtrd1z2Dm3rOJR/NhXLztNW54UzmcB8ZIhlM0xYxffW9edytlI3D/0wtb3nmO6MXH3J
 BgXCCCYiOZKL9P99p8c89FnKtFntpU0EI4XAM0BFvX466ifjBkfqfsV100ufyoy1t7Tc
 J5xw==
X-Gm-Message-State: AOAM530BfYpIsQU0tx6QJBLxeIYvv8kQkMeQZpYURX2Dxl2dehBgAy45
 CGYr9piC27QNidgTfip6Hk1Evw==
X-Received: by 2002:a65:64ce:: with SMTP id t14mr12191107pgv.36.1614573429258; 
 Sun, 28 Feb 2021 20:37:09 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id z13sm16988784pfk.178.2021.02.28.20.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:37:08 -0800 (PST)
Subject: Re: [PATCH v2 15/24] hw/arm/mps2-tz: Allow boards to have different
 PPCInfo data
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <466496c0-5725-4aff-46d7-35b6fc1527f0@linaro.org>
Date: Sun, 28 Feb 2021 20:37:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Cukvm2FBF2xw

On 2/15/21 3:51 AM, Peter Maydell wrote:
> @@ -544,7 +546,7 @@ static void mps2tz_common_init(MachineState *machine)
>        *  + wire up the PPC's control lines to the IoTKit object
>        */
>   
> -    const PPCInfo ppcs[] = { {
> +    const PPCInfo an505_ppcs[] = { {
>               .name = "apb_ppcexp0",
>               .ports = {
>                   { "ssram-0", make_mpc, &mms->ssram_mpc[0], 0x58007000, 0x1000 },

Existing nit, but about to be exacerbated by another array.  I'm not a fan of 
large, initialized, on-stack arrays.  Do you really need the pointer into the 
runtime variable mms?  Perhaps arrange for it to be an offsetof?  Then the 
whole thing can be static const.

That said, the change in this patch is ok.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

