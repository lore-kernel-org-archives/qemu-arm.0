Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp780168ejb;
        Wed, 15 Feb 2023 11:14:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/ePVyZ54GEf9pxs+3bKGTeTRBfvCbB9qkDoVeOsCBk+t/4occ/rbpqX+2LotevVtnDOapw
X-Received: by 2002:ac8:5885:0:b0:3b9:a5d8:2c50 with SMTP id t5-20020ac85885000000b003b9a5d82c50mr3993627qta.38.1676488447910;
        Wed, 15 Feb 2023 11:14:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676488447; cv=none;
        d=google.com; s=arc-20160816;
        b=NOsLkDD0HJAPqPqDKxYj5cTlaDwX+a/OtDujScOMlqdF61x8kweAeFoeX61N5NwzHq
         4UjaktLuMPqUs2+WVFeOUrO1UTSnXKHQzjcxLWL2JlEyIC/NIO9T+YvZbQ0dp4q8y1Tw
         4IfGOJybGrtfgYPuMzCDbmwn1mUeFLXs4uKF8iR8GeUZPE8897SVZd5Bli1FreQak/FH
         DtbAqotpcytrw6IUM2Uga+UY79swcYzLc7e8ib7dfWlR8gu/6TB9b3xzRONAxbrPNCmU
         sm/C8pO6HPbFZRsmd4D0+8ChOec4yRBjamOnZn5AjmNUWFEWCsn4/NVbRpwvOT8tM5C9
         DJfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=9bSBJiGQnUkbGK4om9T1Xu3y+WId83FnzNO/nvcSNas=;
        b=YOps6hDIi1zlbWWSVty+XPZ87+NpdcXQEdnwK5ZQDGJ5hc0G/8okvJ/gA+Hv2B46tL
         Dw9AAQTwmqjoFeiOzJ/4BD3QG6J3HiI5QMpzB7Hwjg37NH0KAI9BSX7dLyt7BZVNNE+F
         5sQvy1tCQKGglY3JIjW+vKjWuCx48wBs5U+v72vBEm6DheDL+9lH/IlCf4VPDD0dapW1
         rgmlmbCr2OdzcSHW8ZRl4aN6J+ebpM4oH1OlW7WBZszxmhNwjlptKHXzESsVRe5EMuuD
         GgNSyOkwwjfXlELbxIHE3IEgsmS4xgDlKfMMT2l+9zTZPvg/s6jifZMVXFGWvdRPIYLG
         t11w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/mjk05w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020a05622a028e00b003b859f1e96esi14795874qtw.93.2023.02.15.11.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 11:14:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="J/mjk05w";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNDg-00035E-Qd; Wed, 15 Feb 2023 14:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNDb-00032b-EG
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:13:27 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSNDY-0001sJ-Qt
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:13:27 -0500
Received: by mail-pj1-x102e.google.com with SMTP id gd1so8400350pjb.1
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9bSBJiGQnUkbGK4om9T1Xu3y+WId83FnzNO/nvcSNas=;
 b=J/mjk05wOiAWne60R7uS+i2U/bqcXEZ9+mjxYWTH+Y163vS1i1dvBcH4np1YBsUSP7
 sNo716zEhClfw75aZW2d7eeUD8yDURFmjwGkahlhp8QUDtprED/1vIxEhk7xAltk20ov
 fLv7CRDFhx2NUBQJQTmgQnTX40hYClT0ZSanFb3NGGER7PQuRGmRWpgmw1w66Ngf67d1
 lMxno3gnWQlmLgnpyOOoFeHaCuEuTpeAHgqtR+9rXgKDx0VW1YH/KMkO2uq4zTXi/DmB
 /l0SXxJUDmK1hYCtRErKL0cGZXuI8z7Ml3P/6T8NNOWDp7Un8uB+mKRaATQBm/5536AL
 bQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9bSBJiGQnUkbGK4om9T1Xu3y+WId83FnzNO/nvcSNas=;
 b=Ej1oPZicynfzbIB2jwK/gUiWS5AYB5CDE+61m9g9RM4Y3BYb+hlp7nMiOp37qaHbdA
 awXBV4Ywcub/xgsauF1NMTjlLodRcWPlYQVgul+wwRXkNLxqOiC2pS5OC5gVMC7xq0IW
 B71hOjCNOFj00AsACfqPAF/fYdS/QwKcfDhAc/fTfhhyEUORnytcSu0nN4+4wuBcVZSY
 saYh9fDGar+ZRZnDKa9d2LN6PqLRYTudJFEsOExmW//BhN6WTFG6owEG3AvsUSZaLqli
 sb8OXRSGt163tH9QLZebxE+rQmOEz6I/qw6jZow9Q9A2lBunmsZd973dce8tWFyGeL11
 FdFQ==
X-Gm-Message-State: AO0yUKVA5gwgaZu0420jsZzEpxRoAkk+yapH1PXE6e7T7w8goA7dhU5M
 +ZNeYfNokB9QYxG+aTL1oGG6VcxI0qvWwym0kd4=
X-Received: by 2002:a17:90b:3805:b0:233:ca14:6ae8 with SMTP id
 mq5-20020a17090b380500b00233ca146ae8mr3806894pjb.45.1676488393536; 
 Wed, 15 Feb 2023 11:13:13 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 fv21-20020a17090b0e9500b00230b8431323sm1841401pjb.30.2023.02.15.11.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:13:12 -0800 (PST)
Message-ID: <a9bca328-5c27-0c55-8ccc-a2df40b61ae9@linaro.org>
Date: Wed, 15 Feb 2023 09:13:08 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 11/20] hw/ide: Rename ide_create_drive() ->
 ide_bus_create_drive()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
X-TUID: 23UObej3ahGE

On 2/15/23 01:27, Philippe Mathieu-Daudé wrote:
> ide_create_drive() operates on a IDEBus; rename it as
> ide_bus_create_drive() to emphasize its first argument
> is a IDEBus.
> 
> Mechanical change using:
> 
>    $ sed -i -e 's/ide_create_drive/ide_bus_create_drive/g' \
>          $(git grep -wl ide_create_drive)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/sbsa-ref.c         | 2 +-
>   hw/ide/ahci.c             | 2 +-
>   hw/ide/isa.c              | 4 ++--
>   hw/ide/macio.c            | 2 +-
>   hw/ide/microdrive.c       | 2 +-
>   hw/ide/mmio.c             | 4 ++--
>   hw/ide/pci.c              | 2 +-
>   hw/ide/qdev.c             | 2 +-
>   include/hw/ide/internal.h | 2 +-
>   9 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
