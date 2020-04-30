Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2264113lfm;
        Thu, 30 Apr 2020 12:17:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypJVic0C7Yi0O+WyEWxitHm5u+sy85gbKs1Nd+f485jmyLKC0D5mzAq6MBWSajO5VgN4+JDA
X-Received: by 2002:a37:8b47:: with SMTP id n68mr5114648qkd.163.1588274264906;
        Thu, 30 Apr 2020 12:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588274264; cv=none;
        d=google.com; s=arc-20160816;
        b=NMOmiAb+e9+UJlkeb0UN8l6jWNEbkGy4URLIKuh7DzwXMtqWPhB30o7hYid6EThbTY
         foSvbhGyv0Uj+RwMzCbHayscVlE0fKV2HVWVamtL7DFsDsKp2AQopVJmudu8REuXJId+
         wbBrqGJ/eKARY5/XuiLy0tuE6q8q3ExFNYN4F+Ve2K3C4fPHHpV/ZeGEzqboF7PgBghm
         k7goFTjMfMbskqtTdlxrx2DkpPOgpsC19C4hlTbBz90OLxrE/11cbhX5Ml233sEGNko5
         DXRL2ieNKyezZO62eTsYpIJtNrSqiYLJo59m8GqeMgXNv9bGmX5IaVi/MLbHxtQ7WBX5
         4Jzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ocF9rC9ET/lEsaC91xgiehH5tSx7QGIy5IpQgb+bGmQ=;
        b=Akt/Vw8/MMNLJxXYXBAjKUAhiBomPIQaV699j0W6u0rXogCl9HyEOhd5qAi9q/4HxV
         2ZenaDyH/Ib8Fo3zhBanM3vBGnPMTMpXmCbCX7Y1MKMpXUe5RRMF40o/SjXop0Uelz3d
         h90c/wx2qVn0HDGDW6acztK7mGDx/YkvamyAxv9xyudDOSCUcH3ZXVu0JwbXoxD4e4CN
         uIwdhoLNfq2KcU/KkWbVn8el2JUh9BAlSRzSfRRZZxmdGRN8PclM5Vf/lfybrvFTB54R
         vxqLWY4qh9jPuEzVJ+f3obL6fVo5dqme5GQVt6+swULf6CtuRwC4RyrfYcoGRZIDQ2Ng
         RitQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPclAfAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id x11si316789qkl.21.2020.04.30.12.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPclAfAs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEgq-0005GU-Ax
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45644)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEgZ-0005A5-8u
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:17:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEgX-000148-JN
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:17:26 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:35983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUEgX-00013m-4L
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:17:25 -0400
Received: by mail-pl1-x642.google.com with SMTP id f15so2651517plr.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ocF9rC9ET/lEsaC91xgiehH5tSx7QGIy5IpQgb+bGmQ=;
 b=YPclAfAs0q2yJtqfl1q2XgsBxywEe7BHiBgMP/c9RFfNeR+SA25ThUbhQovvQ20oZD
 gWaYD024sp+0IbRzLmFpFnORYNDyA7uxEzJJI/v/30npvZ7rv0zwtumA+Fv/lElgXgp2
 3jfyNF4ng6lPrk5WFgt8DrcTdUrvmt/UI8IAN7W04e/ef+HsR/YEm7JW4JmbEdQhKVeY
 WYizzvVpBuzpT5YAKcdYhpzWMLTI4ycwLY+p15CsSyNhXl5tKMv7I4ZyQTG3Y/mAl+F4
 CLerd1zC9+IRVFg4vcxUpCZi77f0DpmwzRB8768N8MMJF408/s3zRcrF+VMmj0oP9Lom
 WPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ocF9rC9ET/lEsaC91xgiehH5tSx7QGIy5IpQgb+bGmQ=;
 b=NeqzD8N+bs3vpVDZlYpEbMN5dTjB8YPIn69BrqoqZPV6IFM1JPeqfoIs8PuptrkaaN
 c79iManmclnBkYXGRh16NezGL3l8eVMabgx9NoZzu5UjogTYkSQFEnicS9u6iXncY6Ho
 pkwYmIsWtRp/8TKLQtlR9+vawGJdRiQDqfSgTaCGQzPCluxmHcAXhEU3PoYbjs7QPzUq
 LWZqCYJtqSf/8kXDZb1cu3sLb2HrjQRcIkOOFjVf7vgx+hPpicbcIWHTgHnyAJfPOqVj
 L74REVNstwP+GFlai8OBDxNM6PwHJJSgWhRrdE9aLVA9iAbXNZjYLEgJcNFb8B3yQCkX
 Zu9g==
X-Gm-Message-State: AGi0PuZLtbWIbfeSA8/6/KdGS1lCzCexXUIqqpvwcjuhboEXDIAbivJj
 nj8EExgWT5rfXGSx6VjCMOH/wA==
X-Received: by 2002:a17:90a:f2ca:: with SMTP id
 gt10mr336019pjb.160.1588274242953; 
 Thu, 30 Apr 2020 12:17:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id j23sm473953pjz.13.2020.04.30.12.17.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:17:22 -0700 (PDT)
Subject: Re: [PATCH 12/36] target/arm: Convert Neon 'load single structure to
 all lanes' to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a07b71a-54e9-61fe-2972-5749a7efa86a@linaro.org>
Date: Thu, 30 Apr 2020 12:17:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::642
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
X-TUID: YhO1IHHBxVuH

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon "load single structure to all lanes" insns to
> decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 73 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 55 +------------------------
>  target/arm/neon-ls.decode       |  5 +++
>  3 files changed, 80 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
