Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1041190lfm;
        Fri, 19 Jun 2020 16:33:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6nXTjGutNcQoG6o6hr0hjpgoTfOjiCSUcJasC5hz+Pa2YrJmGk+mwTzdI+aSXogJx/Y+V
X-Received: by 2002:a25:c6c2:: with SMTP id k185mr10435987ybf.94.1592609636641;
        Fri, 19 Jun 2020 16:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592609636; cv=none;
        d=google.com; s=arc-20160816;
        b=n4ilULdnrpkUc/yuLpt3yQ4jXh3ww3J3WFjWP2G4OK8qZWl1027xs4LGCjAksCNQK0
         am+C3Z3bkCDQToYQwshOswznJxf0RLcQ92+eIjfG53iuuwh1N/pOcjYouB3TEB0CCRhr
         9w3HKjWgL+LBM/AXlcNkPvJ8yWhxE1+n2AZdod7KkmpxwrHNP5V2kSBVspEm0IHGuA7z
         8KhHbCQIscG6NHY3Y0VWk3kPerDALrzbT17Oo7v1c1ygBgDQ/5Lvj3QfB61nhvjhZZSR
         KkTmmpU/9g6IOGI6NcrmDMpg4WUGNakg9/xRKvuUwnl2gACfCnVlJaFMX8SQGkbOBHrP
         h8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FXL541S86pY10jik9JK1gqpT2iKiQXGzZHE/V77i8fc=;
        b=DW0eTwBYJ8SuGbM0rdFGBv+nm0IZ0RTMRSlcBSOE/wwf8a5LOUzbdBT+DlwlTMD1E1
         21OJYdQ1gxEL/RsXDD8nyxCgznr6krkCV82YJQYKBR3M8ncDX/iYJ2Dw5Oey1eiW/Nnh
         bO7vk7mJg7U1IX9R1bq5N/4qxeozih8Igd5jKNn0nHJZqCu11ZW/Xd7Aq6/s4vvQe+OI
         0TUvIwfPK2vYs4Q4S3XAGbmRxkqByP2Z5+FRbYEv/E+uZ+Blu1TEUWDSZo8Vd/Rv22P2
         F/jue0f1/qos9A1oUgiTpDDbHJfOA+ZD6ehKMXv0sLzIA/w075s3wKmHN4DBblQUt9ow
         SI2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dJ4OOMgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si6253655ybk.395.2020.06.19.16.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 16:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dJ4OOMgJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmQWC-00005G-0L
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 19:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQW3-0008Sa-OL
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:33:47 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmQW2-0000iV-3a
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 19:33:47 -0400
Received: by mail-pl1-x643.google.com with SMTP id n9so4583422plk.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 16:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FXL541S86pY10jik9JK1gqpT2iKiQXGzZHE/V77i8fc=;
 b=dJ4OOMgJo0evDL0D+x1QF+irYV7CJyQBsXTIcW5YvN8e6hCGb3stTZmMpz8zp8ulxp
 uvrOGOU+gYfMAuR8La/8XRoswHmeVnzic6r8/EDnY5olkOzBKH/3HSD9FU/MEEYYWBFN
 8CZhFJHfZFydE8mpf9sntaVwpznrLdso52hXTCwkWmyPAeFp9rCVcFRrbyzlxF12vcLP
 lYdu/FGe4JDJXCpS/YDH4uJiIp4H3ktuJE8lx08lbK67Ag5LAdRjwa+3hLZHMzUcOTEF
 n2Qa/E63QKjQsMVQ80eRaKcaQ+nJCv43/Fc1fdz2Gw6Fb66XFRkizYFd2UMJrrPWbBy2
 awdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FXL541S86pY10jik9JK1gqpT2iKiQXGzZHE/V77i8fc=;
 b=PBTXkGT56NgCJ5so0Q+KLfbif5aGp4MZS2In2exrFSR6o6BIXTzuviBIl/PYS4bzG6
 LLZ6MN0uRJ3Nyo5brndI0AfyjATHeLF7zmbYF1ViTlXY9CPlZBQpO82ohrJidf/674o/
 hTQNuX8LXXJEsi60p27n7Ws/qc15ZjL3ASWjw/YdSflfD+cyI6dvffzTRF1CdEN+EH+C
 39iB+1M7A/paW86L5mLAK0vX8XpCW0SBsSbSTQxJThCJ1HWblh3AGSOhptsznn/95uUG
 WCsyTtXUh+5Y9mE6/tWFgMGglfjZO5iYOvSrpHWCfe8Al3w9QahD/ZHyNsvmKJmibeYQ
 6o/A==
X-Gm-Message-State: AOAM530ELFIV3OX+clIxI6pfhTw5g5Kk1UUH8Ipn2c5VXzs9n9oBW+Gp
 jqP0+GBk6JhtwwaVsxuJbjogCQ==
X-Received: by 2002:a17:902:7d8a:: with SMTP id
 a10mr9794020plm.160.1592609624625; 
 Fri, 19 Jun 2020 16:33:44 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id m14sm5961564pgt.6.2020.06.19.16.33.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 16:33:44 -0700 (PDT)
Subject: Re: [PATCH 11/21] target/arm: Make gen_swap_half() take separate src
 and dest
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <298e02b2-e3af-ef31-3d65-7a031cb7df0c@linaro.org>
Date: Fri, 19 Jun 2020 16:33:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YD2z+8BmvMb4

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Make gen_swap_half() take a source and destination TCGv_i32 rather
> than modifying the input TCGv_i32; we're going to want to be able to
> use it with the more flexible function signature, and this also
> brings it into line with other functions like gen_rev16() and
> gen_revsh().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c |  2 +-
>  target/arm/translate.c          | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

