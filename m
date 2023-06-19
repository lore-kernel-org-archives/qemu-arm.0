Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2914213ejt;
        Mon, 19 Jun 2023 10:00:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5W8Wndxqo2S6mqZiB6sCJdoFEqPrmXPLHgW146rIsa3KjMQGWnGyuLDXC7qurau02rpUAL
X-Received: by 2002:ad4:5bc4:0:b0:625:a982:857 with SMTP id t4-20020ad45bc4000000b00625a9820857mr11808826qvt.50.1687194025804;
        Mon, 19 Jun 2023 10:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687194025; cv=none;
        d=google.com; s=arc-20160816;
        b=haqRPIJjynkUX954tQ3cD9GURS7vbeQuQgpDVboQhQl5uAaWwIhECmADaxwOUEmXQw
         v/C7tWid8+GMtuSUN7VOQzs6iBiG1ohRzJxrsdtlp5ZpvsYhduqUNW4JXq97rJVb/Qzf
         T8cGbjAOj4ZupFZbtqnLH8+0VY74u7sT1sahUt3Mf2xTrOIbtH6H24+9nUa388d6hmnG
         lBRcMp8JCN8GxckUOyyC08tMAzUcvnF4/ahdLDw68MvbhruF1MiEPV3/SKtqr9nPeCgF
         6IidEOZSuI+b230xTeUwS2e9gVMHUwNiNr6l3ymR9Nnd+AU7kZSS3pFcjoxmfpliMB0Q
         JGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pvuNDOtu0cs37TXtALpZldwWTe6KmSrHAy8YPMhNMEs=;
        b=VYGhORhQtGfO7DCO4YZaIVVYacsJsYwLs10YkY9EBt8rI20MlWK4xCjcPu3zhWw/w/
         DyXSVNlVY16OCBDH5/exGVYSi2ZB1Rw84YbN72pWO3qgfTcI2Gozm+By2hlr1A1bFHmx
         KL8cZlmFs+FXlt9qL1fne8rJidSpo/sIiOnLz0ZxmtZLE4iO1wuJXK0dmrNzpR6Tx+uB
         sjeJ/MD1J76FQhesrjYVb/IdIJqUun2i/iDUnPj6tz9F+qQqCOzRz1EcN7OSwRAQTo30
         yUaNc3Dyz7WSyU5Js201y6oG4EANnaHa5YGHdtCJexNTrVOqZb4Xq+jdN7T0FIk4QM9Q
         /njw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHvtP8yv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv4-20020a056214262400b006287e983630si117020qvb.202.2023.06.19.10.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 10:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KHvtP8yv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBIEX-0006KA-Id; Mon, 19 Jun 2023 13:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBIEV-0006J5-S3
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 13:00:03 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBIEU-0006Gz-1H
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 13:00:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f8ff5fe50aso20150915e9.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jun 2023 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687194000; x=1689786000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pvuNDOtu0cs37TXtALpZldwWTe6KmSrHAy8YPMhNMEs=;
 b=KHvtP8yv4sMw3C+jXFzhhLL2RHtr35umVjxXGzixN5rk3BjZp9f6VwCMzaptlwSAms
 /faKtc7gzK11RwLGylDVQmE5wDncqJ5i3CF3liOIjW05B8pDltn3c4tk4gLZNv8XN30k
 k/nuWhtnYMA5Q6s8i3/FzaTi+mUpZvssmtdyHYhMRcnXPCWga90bXjCeSxXAXu5yKh70
 OLIyuE3ZTO9UqUuYZzjS6B15r6Ocf24f3o1IpFzC6/A91QAtlsPiDsOfDuWhW7DrgbbB
 BXUWOu7s1JQWa7z2+LaK0b4DpfuPHzin9hL0t6wL5N+INtq1LPO9Ol90xURgDHE4rNB6
 ol1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687194000; x=1689786000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pvuNDOtu0cs37TXtALpZldwWTe6KmSrHAy8YPMhNMEs=;
 b=IfQrMKi3I3rzaHBRMEArdS1dGSu9dkQTwnIP7Oed6mq1XjY1zBeRAdegOx+m9/LnET
 moafC88AruMG95lveRPvbXnzywKJYGKuYjYbTupi9Y3hSEpLYitIzkbAAUH5CB9YSz4l
 VHiQfHH59qlUU582+8RznIsOv1ZGN9XA0OrNzDW0m+8K8zZ3rrHHtx8+ZzTTHA0Ry/qC
 TEJYvK3BLJyadG+RaCbiB6PDiTttKjWkOlVVhBUjous2gGak1iOlua9RR+l9Kg+nJWOo
 LQAWCcaI/u4L5+90XP0pay9p2tL5ubhwvmcKEQQ9oB35tDUv19H4rIUJyBrSOnJBJHfF
 QW2Q==
X-Gm-Message-State: AC+VfDyehi+BOv2byLux5gtMPQpr/5NvGo14gbMBfV8VvvPeLGIksiEb
 BjdUvu6YjMeF0PH8fd3CbYhW2Q==
X-Received: by 2002:a05:600c:3659:b0:3f7:aee8:c23a with SMTP id
 y25-20020a05600c365900b003f7aee8c23amr13813264wmq.19.1687194000391; 
 Mon, 19 Jun 2023 10:00:00 -0700 (PDT)
Received: from [192.168.69.129] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 i2-20020a05600c290200b003f42d8dd7d1sm11373223wmd.7.2023.06.19.09.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 10:00:00 -0700 (PDT)
Message-ID: <95ce2723-e0c0-b21f-aff9-e79139df872a@linaro.org>
Date: Mon, 19 Jun 2023 18:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Restructure has_vfp_d32 test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>
References: <20230619140216.402530-1-richard.henderson@linaro.org>
 <13aa9c38-1887-bf9b-f034-b0217308ab15@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <13aa9c38-1887-bf9b-f034-b0217308ab15@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +bt6WXpmUy93

On 6/19/23 18:07, Philippe Mathieu-Daudé wrote:
> We already have a check for ARMv8-A never setting vfp-d32 true,

... gah!  "false".


r~
