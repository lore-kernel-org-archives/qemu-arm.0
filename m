Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp858522lfc;
        Wed, 14 Jul 2021 10:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+KUXvQve3yK8i+yN7VCDLr3lTaHI8fgNljR6jjmcZL/EMKDoiQYhzonmIwaOu7IpZwH2t
X-Received: by 2002:a2e:9b47:: with SMTP id o7mr8004971ljj.310.1626282475020;
        Wed, 14 Jul 2021 10:07:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626282475; cv=none;
        d=google.com; s=arc-20160816;
        b=KyJAMS6LfEYvMX6YPEgXdbAC+DwqAJlzYkxTnwOFcdFdyPks/C360riduygnhUfPcY
         UDRLhfl5C3sJM5T2i5LYusFOJKrpgd0z0WdOyPyRL9+LFxu2j81o2u+a+yjGLF4AtJrG
         3Ioq+hRmHWefPdU91m5TB9kBy/eXyunJOOkWTgEjoqdbweOyPx69cc/dw7t9ZLyBaVr4
         46uXEBwMDMpElDiH8LUY/24xp/4oyQ0knkIuqzDTSlSNu6ZAyuflGxxtJynyoGxBOmCy
         CoNi+nXQ1KxcWxE7LfBo9aaXS7J8PakUYQKUGmp8ZKGQeskVfnyBAN3f3AugoiCMX2j5
         6iXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EXF+F2qGwUCgDPVZP0ILsPlmMymyh4GGhgUCzyj0jK8=;
        b=XfzwUBo1spoQq2RnBPbH6ZQdzS52tl4otrApYAZYepOoGnw4QYdsRyens0PbjEysDi
         1qEyahpjONxDzs7DhZaLuIa6uj8slQZyL9trPdFvyyGqrgbs4LkggK5YAUaQsefh4beh
         K5fQlCAhpwyBPFW34uzZtyKZ/TIvStDRZGr2Q064DNSj8E+7T8bsTqQco7DOEdC7aIrf
         5SF7aE+yrqAUd6D3Ai6dK9tW8S3Diy+gNiSbFJ3U0Vlb7si3wQKBGjyJtpdytw//zJ19
         ogKv9f0ugif1KCdHDsoeR3mIfX8AtedbGaHfO7FLUVsOX9+7zyWa3kspmycuR1F+R84W
         UBnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oolBmRi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si4572959ljk.6.2021.07.14.10.07.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jul 2021 10:07:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oolBmRi4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3iMU-0004Cn-2L
	for alex.bennee@linaro.org; Wed, 14 Jul 2021 13:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3iHo-0003aR-94
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 13:03:04 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3iHm-0007bV-7n
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 13:03:04 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h4so3123131pgp.5
 for <qemu-arm@nongnu.org>; Wed, 14 Jul 2021 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EXF+F2qGwUCgDPVZP0ILsPlmMymyh4GGhgUCzyj0jK8=;
 b=oolBmRi4r2LpZ4AzlgAJzqyaQbWlg9xcu4f7tWJGJcr5cc+aP+Is4RMEuoc/mL9YE/
 BHEohONFcp4516ncuEa2UEvJrFeYqQi4YkJcR6uxxMcCKGpE1xIEDNEn0JUZ9O0X/v9T
 R5xUWl/70VUuumi+c1jnYZN1gmuuv3HKYzAdp65hSTcibEtlgE3jtqqMsDyDw8bwaTv7
 MDWLXt6B7QnGp+qpuX6DrCYwt4RcIe0IcagNDm55j4ZzidXWlzJk7Qgfk1IRByPjSqJ2
 jF9BzRBFagdiTk8sr4v2y4Oiw7KyTySdcljwLedeoB2RGuVZ32Qu6roD2bq5azxsfi/O
 zWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EXF+F2qGwUCgDPVZP0ILsPlmMymyh4GGhgUCzyj0jK8=;
 b=BVJPWWDMGQhb6AkFe82fDb7RWZfOtow8Eho5skPZwYcjGDZQVJeCnCuFkieP/86K1X
 z2tBs5QLzA/K6wZzQlX02Mc57DB8wi3Zys0T8i9aXM2EKQWy4o4v8cJm2flLq5N8dhe7
 jB+buL+6YZUMFC2vKUm8eLoyqViz7peXsCpLytXgttS5h+P9YI03dXvMfrAXwADIUDX3
 CFOwMmCyAp8QXAJrK4e//QYZcvY0ig28V0o1cz8Ri0wHMo7tKUFrwUk8Vwl2kyGr8A8A
 9zyA4o0X3+jqnb5eMhaTiKij30WGDxyfz/HhaZ21VtEu+tEmp66kkrdrQS1L99AIqvl3
 +vYw==
X-Gm-Message-State: AOAM533jqSSe2XJk8wWgCDfg5M/8pPt6hSDgQo72oRdeg64Zfca7u5ds
 MMDmeojDbaHqA68mH7mPmXc5KA==
X-Received: by 2002:a62:d108:0:b029:304:33e5:4dde with SMTP id
 z8-20020a62d1080000b029030433e54ddemr11291109pfg.74.1626282180157; 
 Wed, 14 Jul 2021 10:03:00 -0700 (PDT)
Received: from [192.168.101.210] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id c2sm3457942pgh.82.2021.07.14.10.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 10:02:59 -0700 (PDT)
Subject: Re: [PATCH for-6.2 01/34] target/arm: Note that we handle VMOVL as a
 special case of VSHLL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48388536-f22f-7ab4-70de-f5eaf84a5bf2@linaro.org>
Date: Wed, 14 Jul 2021 10:02:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovPo67F3Rfsj

On 7/13/21 6:36 AM, Peter Maydell wrote:
> Although the architecture doesn't define it as an alias, VMOVL
> (vector move long) is encoded as a VSHLL with a zero shift.
> Add a comment in the decode file noting that we handle VMOVL
> as part of VSHLL.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve.decode | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
