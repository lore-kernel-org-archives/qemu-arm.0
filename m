Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp619883ejc;
        Thu, 19 Jan 2023 13:04:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwuWX9YlpOjxaXijLUzfA3SVqfxyuHvLMIoO/XLNxrW45T0MwwIoUnzdwn2r1NhjIaarTv
X-Received: by 2002:ad4:4591:0:b0:532:1870:b95c with SMTP id x17-20020ad44591000000b005321870b95cmr19416315qvu.17.1674162259670;
        Thu, 19 Jan 2023 13:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674162259; cv=none;
        d=google.com; s=arc-20160816;
        b=oEFFmI+FnS9Pe0vq0rS9wbpmkCAauIqI1GFE5mn7JKyq2Kx1KpnxVFMEEW+SkPVz2j
         slFrAP70xVsPENO4QDKtWa3xlxIN6pU6DrL3gupJruptVIlEkR5WGVatF9GU4btK5pZn
         brBrvJ5MMabNKFveyn00IYPmVSE0Y9+BId7jsDRp2ip9BeKR47Fcs8R9Os3hd+5gOK6f
         NbTRCbXDzSwW72+vWo+IgTSsAYpitdu64zjpHjppk60umwKRyno4cxjE34kKadSk5q8w
         wx7RmdOzxT0FwUriRcZo1JTQ8ieugBjLbxiloQkZKzMIIPTk1/KQZUc8cZDLiJhZObRT
         l9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YwV7oE72l+Z9Y9PoqXsAwjb7UIYiNaa23IqfiDQG0is=;
        b=Ii6rK5nKoFDw3vdqoKXxniHdv92C0zMCyShgS/C7J6BFljD/KQHSfNmkZZO9ucZDbw
         lZ9+WSchw2TWaVOoUoWWKue/2zJGJbdDHR7sVa/o088hxBMNP6ktkOwlnwCJbC9UfK6c
         T5SC0onjhgYDfiBMiaggDFfAvd+dB7EybXzv/SyFEqXazgwqd3HeEJ6m5S9byBZ08xJC
         FD0zdPzdqn4MokDm2ktXFsY8dqu+t7PEq1VQlZfPLIjx9FBpDe9rSeKp50wEk80eR8Le
         bo7V3fvrLsiTPtN8mTMzSXRgImALGpwUhw/wqSH7ctYbr8a7l9tH5Y+nrxfu0WBECSok
         qe6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DboooxiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke21-20020a056214301500b0053535c04853si4754379qvb.184.2023.01.19.13.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 13:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DboooxiL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIc4u-0000tH-F2; Thu, 19 Jan 2023 16:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc4s-0000ss-Up
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:04:06 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc4p-0003z2-Id
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 16:04:06 -0500
Received: by mail-pj1-x1032.google.com with SMTP id d8so3630716pjc.3
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 13:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YwV7oE72l+Z9Y9PoqXsAwjb7UIYiNaa23IqfiDQG0is=;
 b=DboooxiLtXIC4AW5yjYEU46intdWZw2IKEvl98v1/nzAgfArCN+iV5eRfIVQqeOTmT
 1Nz+3qEsewVo3kkSzWP/WVQi2yXu8OwDhRQ+76RcM4VESV+dPF20FLb6VMXmQoVFxlvO
 3qqrvsVPG2hDLuOA5pzF9PbBMqfhhS1Ux+Q8O633Q5IlS2nFz/T1SoygnZ5whL9NhAyn
 cXy/MunZloDVwORkgwIoOCNpRbqZ5f3zctohwhW1C9Bp2UL6+wWY+ZaUvlFjK3hlvcVw
 7N8swmV92/l8rAgky9SVHwpSL9r5rBZPjyWlQ1hPee1dCQYo+pdYbLKdTyjYLmsh5bMe
 OaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YwV7oE72l+Z9Y9PoqXsAwjb7UIYiNaa23IqfiDQG0is=;
 b=JbXbi6OrzvA/8Np9gMUHwp+kUpx/AjsY3VpP40jY9ddTdeZWDnLo9edstp+3HNFdx7
 XDv7VCAq8VWgfMRir7gtYLbtkm3K4y3s/9EI+uY6u2ajhCetSLiOlX6O1pDR25zwrcTN
 vTtaY8bT2XRz6p+ZcnDLUXeNElJMMwnEFVEsnbNH/Kwd3gZ1lguMIdFAygIDRd24E2uB
 qJZfIfuKDboDEUMgXRyukE4RLTjMWs0LXW/O1ZLvIb9aQxEwB46DGXkkqKhd1FqFBt9C
 1F6B3YTfNDUMrlSrtQhuI04RhjJ+xp8fyk3MAo3Qn2wVwYsfnh6YQzU4eun/BKFFEz7n
 NGkA==
X-Gm-Message-State: AFqh2krMH2tA1nBjUqNhychQk58Pk5NsU1VqLFCxdQwqUnYu54cMyhM4
 sH/XzEAvGQByEDVE2u75I7hO4w==
X-Received: by 2002:a17:90b:3553:b0:219:22da:1fee with SMTP id
 lt19-20020a17090b355300b0021922da1feemr12986771pjb.38.1674162242046; 
 Thu, 19 Jan 2023 13:04:02 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 c32-20020a17090a492300b002265ddfc13esm79210pjh.29.2023.01.19.13.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:04:01 -0800 (PST)
Message-ID: <2090f9d9-5769-fdb9-1f6c-34fd88d5eec2@linaro.org>
Date: Thu, 19 Jan 2023 11:03:57 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/11] tests/qtest/boot-serial-test: Build command line
 using GString API
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
X-TUID: AVr9ygbHUpkr

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/boot-serial-test.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
