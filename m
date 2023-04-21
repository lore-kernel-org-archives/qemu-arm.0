Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1444166ejm;
        Fri, 21 Apr 2023 15:21:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350bJziyJLmepKk4RFJw4TjDAAofjdDIxyxlGjNjzw7TdoSs3aissKQbYir19B7hWF0cdekMn
X-Received: by 2002:a05:622a:1387:b0:3ea:bac1:a5a0 with SMTP id o7-20020a05622a138700b003eabac1a5a0mr10898672qtk.37.1682115668945;
        Fri, 21 Apr 2023 15:21:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682115668; cv=none;
        d=google.com; s=arc-20160816;
        b=hWnzS3j4tYvJAHWZt8NHygbM5f/KaPK/oIsKr1YY1SlWlLmjpD24UZ55m/b5lZwD17
         YTz3ydWT+ETfTSTbJ1qh+eCBVuGYlA+nsdcPn0BmRGZ2t7qXAgNh7lemrHwcqfqnoskl
         ftOCWQs4fNe21l32PzpRPgQKetnQEvC6CDHyWgUF/dGYhf4c3WZCAOe2gYDATGFwPR85
         LCfZDt/r6BS+wDCbRnXJf5fdj/wImxagPsGRptUoXjkstfT+3sd6EIhew5WUGaj91fE2
         X8XYObyOUlBbJqaUVYptfeIw2NUopfZiZm/9WMbFAXaSQAGv3X24cfR8VEk9sIPn6shl
         FX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N4KBfFKyXWN+4n6J4KJGwagFWEnUQe052+YZdKB53do=;
        b=tEQ5ENWU5YuxDNOa40pSF4rGDA70MCHu6rgFl6ioup9LOUIQRphH5JWzfoc9AP1RS6
         VILCAFxP0XMjhY8GOQkRHddBqN2uaGwWSO5eLAr/4GvX/YRD/PH5EGhhz3xRx2AnR5Bx
         n3C+2nRXC70hNQzl/m9EUPvFDYAGubek/mr57iR9iLhxnDEJBIRzYtlHEzCvnuTzM2MC
         2POPHwGAwXD5ObOuuxDefhWqxEaC5jrOsTHFuD8J0LJdprwfbw0C9gaXf/w1U1CQ6qg4
         fZ/HuxlxwepllQbzUSYEEF+NcVx2HzlNGHHovcVajenoNQB/wX7wVXdIlgd1x3gc8V4h
         Ig0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5sudt2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020a05620a248f00b0074e340b9e83si2419553qkn.119.2023.04.21.15.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:21:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5sudt2F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppz7d-0007fd-3g; Fri, 21 Apr 2023 18:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz7c-0007fJ-2v
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:20:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppz7P-0004Q5-Tf
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:20:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-2eed43bfa4bso2048755f8f.2
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115638; x=1684707638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N4KBfFKyXWN+4n6J4KJGwagFWEnUQe052+YZdKB53do=;
 b=Y5sudt2FuMwIrLzVd7qpkU0KDKhAyCleNN1PtjE6DSdmwSaNRwg7qLsVVKKmtcaypx
 gXuDNRsn1hkIsRuk3wKL4mQ7k71OwwLpLXQgIVUQEEgjMBgt0dvWwJWOjJEi3QH/UR+D
 8CIICBxQCxTpOd9oSjKb1JAFtKP4/TGrgfcfo/IFYTTpCzvM/k4+QDH8EfDqz6QQb2BZ
 JzKHmVRemkHm4/u+h1aT6sUptcTnXIM/gap0tFackTfwi3X8a2pW5g3VaXyBg2Dj8hXk
 XpLJLbMxXno/dyh1lfPMiG/RUQAS58mt2KkDsmdJUOz0JjguHTDW9NXbtgNCwrzELV7u
 cYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115638; x=1684707638;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4KBfFKyXWN+4n6J4KJGwagFWEnUQe052+YZdKB53do=;
 b=lhCmhoQvnfPTM2vTHUZJhHpQJcwAWi/bJB73SJb7W3LCp9RwY4euNdq03NRdz9YO16
 D7WYkJUOYZBOismAr/2XTzreW7OpQMm8ZKRVJEoJ/OAHpmVzmDZGuP7ipzv3DPQTeEpB
 yugjxy7xW7NS9MnYfrxUZRD3P5/hXjjFxJzmuEmntkTO4ZLSE8Ubnx3wwOuLeTGig+mx
 KQ7JKf+0WBee/jTqHyNZs7X4gF/99Xg56+LF7p1pS/kUiFnjNPeEmpZoYoIy+7n+L4kN
 XGdssthvxlhTezuIn6kLPZjI2kH8ebxjWOete7UjGNC0G4z0gnRyW/7b3+HQHbJXi/fW
 boPg==
X-Gm-Message-State: AAQBX9eBVer9MpMeQnjV/cF645qMTQbftg0bmd6XKNK51WmwYMz434Ki
 vBDVLOh8+WzlfthE9cQLNxYxrQ==
X-Received: by 2002:adf:f14c:0:b0:2ff:f37:9d1a with SMTP id
 y12-20020adff14c000000b002ff0f379d1amr4846614wro.62.1682115638357; 
 Fri, 21 Apr 2023 15:20:38 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d56ca000000b002c54c9bd71fsm5266927wrw.93.2023.04.21.15.20.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:20:38 -0700 (PDT)
Message-ID: <b6a4380b-bbe6-999f-7c35-d16628491493@linaro.org>
Date: Sat, 22 Apr 2023 00:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 19/54] tcg: Clear TCGLabelQemuLdst on allocation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: OrxO/v5S0Z6J

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-ldst.c.inc | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

