Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp903007lfm;
        Wed, 29 Apr 2020 11:47:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypK8EKET48YB6eBGn9PzqXhmvSTJ7bEY2tpTgIB5vNweyuAP+XZQJEC0vpNYvg1OcbMQczNw
X-Received: by 2002:ac8:688c:: with SMTP id m12mr35484533qtq.278.1588186031052;
        Wed, 29 Apr 2020 11:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588186031; cv=none;
        d=google.com; s=arc-20160816;
        b=QpnsHCj3Ci/hjpIGndyT84T3DKazh8P6O4KT7uVXF7neLq7sEOW1x0WyNOZJhmNR49
         waLJHTX2FLSItlr+EiuY0NpylyD4hLpTZzKCviKYbfPVXfehmRJ3vn2Gtwd86N1/NVqc
         13n8pahGfdEs/WdqVfIGnQOUuT1ba6PqJBVpAIy2qSObWSdnMdpnklUXYpZkVJ2VS/ot
         nwqMPQkMNW6SFzlsFOWMDPZ6UmCfTRFK5evjsaax4OR0fSkI2or/uI0ojuq0jL7XzEkL
         l+XoWNEFKC32I1jmhkLJA06+XC2HNUNHIXM3NM/kDz7PWEGHgKsu9yqf9JcEQeZLu30f
         rh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3K/InUpK7f86tjBXoYHGLn76j5rS8Ttrm5bufUlB+bM=;
        b=djFURoV35gyvgK3JKigT8QGQg270yXL72KD5V3+ftNV/6fJKyk2MX+bvXe4XEmWqZ2
         xQFGImeZfXQuQf54Hywg0i3le4QyD/LYVMeHxTUzS/l9pWiTiNS2H21Wptl/UoVNF6j4
         X+YyGIyB6lAPglbY4lzipKUCwkFkXV2bo4NETbChbTj/82GjZ/WZ3QAGyFlfLUblthTi
         Xf1q42CmF1fFQDQeKsQfWie27vnMmvSScGAZlCaBw1MV4BAKxWmtpi4ZGnAVlC8gZ1W/
         0kd/HM/yls29J/0QZayLNpzRw0Iq6umrpsKcZQBA8/LQonrDCLmrsZJYAdAn5uKw4avr
         Hy+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nP3XzhS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id t7si41027qkj.195.2020.04.29.11.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Apr 2020 11:47:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nP3XzhS5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTrji-0006vo-FX
	for alex.bennee@linaro.org; Wed, 29 Apr 2020 14:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTrcf-0005A6-QZ
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTrcf-00065x-7t
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:39:53 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:42776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jTrce-00065m-OE
 for qemu-arm@nongnu.org; Wed, 29 Apr 2020 14:39:52 -0400
Received: by mail-pl1-x642.google.com with SMTP id v2so1149223plp.9
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2020 11:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3K/InUpK7f86tjBXoYHGLn76j5rS8Ttrm5bufUlB+bM=;
 b=nP3XzhS5+cPQuYjQRTwid3+VwiixqMXrb+B5C/Ofl5Xz/DzZDMY91nYxuzL0u9Agd5
 z2pQdo6At4l/zx3CUrJzQtK5qAUgtwrFjaH81DA4dPQSoC+wZMEP3I9+Nd/tu8c51ThG
 OSRcXMfRsvmd02GrCf+W1SPGew0DI5pc6PWk9wPgKT2QPq7eMBrNlaR7ZWV0Rh8HEELG
 kTSkvb9zwyoe2rX2DiMOLBL427PxGwtt2Pje4/1j2Oni3Kb1evR+cy1UFdRsi+UdNIfh
 Spkw45s4fLt6OdWj+PwaUULPgMnXyDf+X0h7L2Na8lYrOavklr5aNH0mQYdi9Oo05O2n
 LKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3K/InUpK7f86tjBXoYHGLn76j5rS8Ttrm5bufUlB+bM=;
 b=nfUGd6h7LXyISucluXydCNZyLzmq/4OEWKhPazzyG57b7Zx5o2IP/wfZNIEBffQpqR
 pIBkdOtRsaXl8aFFktEiu48mKqWL5UAg1RU8oFUPE59xPuiy/QCOHd1aLRdDv7XCeoMH
 R1Qrhekav+vzwBnmU/li8d0Jp5jy5OIeaH/bSpTpeKdIhlAYcEWFuKmVMiZ+p53Y9q/A
 ZkXChIGeydr31uGHuMnM84K5fz8g6p8/1uSMnNWCjJah0xj/OiFM61Yw0J0YWYOxJ0qr
 I/1s8lwkWuo2R3SHnWQ8UAjuTsJUfj18WucmVavXfzgB7k/8M+EWxqw/JGAPYLpUKzl0
 aG6A==
X-Gm-Message-State: AGi0PuZs4Il9uCHXnaWvS0WlCG8Q4ZokXbtM1cfTVpfe2zTGUL/uOGe1
 099nxk3CgTJsENywZiVJDzpgkLwvB1g=
X-Received: by 2002:a17:90a:ae12:: with SMTP id
 t18mr4819677pjq.26.1588185591483; 
 Wed, 29 Apr 2020 11:39:51 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id v64sm1645746pfb.20.2020.04.29.11.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 11:39:50 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/arm: Use enum constant in get_phys_addr_lpae()
 call
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200330210400.11724-1-peter.maydell@linaro.org>
 <20200330210400.11724-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aabd163b-4783-3f4d-a260-ba06fa021d2d@linaro.org>
Date: Wed, 29 Apr 2020 11:39:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200330210400.11724-3-peter.maydell@linaro.org>
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
X-TUID: THQZtJsN6YOU

On 3/30/20 2:03 PM, Peter Maydell wrote:
> The access_type argument to get_phys_addr_lpae() is an MMUAccessType;
> use the enum constant MMU_DATA_LOAD rather than a literal 0 when we
> call it in S1_ptw_translate().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
