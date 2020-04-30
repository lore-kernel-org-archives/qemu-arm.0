Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2307203lfm;
        Thu, 30 Apr 2020 13:00:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIWpnaAINB58OqtDi/tbNgO5JmdF+gHOCJS1LNE5ff3OIMurxVq5JKiu/sECf7o6UYqCiYt
X-Received: by 2002:a37:787:: with SMTP id 129mr218930qkh.92.1588276855497;
        Thu, 30 Apr 2020 13:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588276855; cv=none;
        d=google.com; s=arc-20160816;
        b=TMv8rhn2tple2663r7LSv4TnwzQ52fIEkrL8/fPRF+LJsv+4NTHXOV9lYmjaRR/ZkP
         cR64hwYWMfMFMh2sdtqfKCLXpx5qwk2b2Yv73Mf+ZH3Qx0h3/CR2cjn4VVtCumiKXqNC
         X9dGISM6Daa7i1X5s+ARe3jXIQsERNFIjf61GtiQgoUFLKM0hTwHGSClxW/bkpiIkmQE
         mtBEzluc1HgIWWumkACKBSGA/qK0XoVHvam4z1L9n5SW3OBXOIJYGPRsP3kKNXRbJw5q
         BezEwawW4gMWdjx8gJpq9V17hiZ7U7usmlSXFzDJA4R6IOJ1fugs3vDvtcj83BG6v+Ix
         iS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bYlvKgEzmRNDYFEqNVZita7PZO8B9rfPaCVow3Q1i/g=;
        b=tXuC15qtccUOsOAqNgcsqu4Xxb+gVmIBi6jL6t1UQ7o16/M5DaEP1TWOdrg/UYP7H6
         CiTdH7yH7N74G3agrSk2u5SMEsdQfSvHzyGl0NbnRfccTF/36ja7cZRorxQO1Td/me9F
         HdDTpqN00f3pRWWYyl1Rxx5x6keN1uxVw1c9ojup3GETZCfHkzwYtEIPT9wyshLbzsN+
         7Zyzj7/HMRQTgZCJNZsWsYxNXBrTtgJmRWNPWYEeeyVyPwkInBC8HU6ZiWidHRuVG1kW
         Mw/aNFLkJIBo5JEcMQPwQDCsG98guI6bLrW+37rpG6fGcbrqSAjqaZG9PVwbZ2NSsvj2
         udKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=haoKsyGu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id k13si467512qvl.182.2020.04.30.13.00.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 13:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=haoKsyGu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUFMc-0004zs-SW
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 16:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFKc-0002O2-Sp
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:59:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUFJy-0004Nn-0n
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:58:50 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUFJx-0004JA-Ix
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:58:09 -0400
Received: by mail-pj1-x1044.google.com with SMTP id fu13so1326618pjb.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bYlvKgEzmRNDYFEqNVZita7PZO8B9rfPaCVow3Q1i/g=;
 b=haoKsyGuKRoUN628rdJJxNVSDEBwbpcG/0qwMBF0Am1rVEUgWAEQ5ytqvPLllp95ho
 K06QELd/ndUaDqjtCPmqVhJDX2UCXrFS6Tl62sthl4PC2OSe6le9BgmFZV/7arE7yAz2
 jWR2da2CTnC09saBw0s+7qxOAPf6kXVnNt565VosumRQ8jlj4D18kdMVBZALY9jEPYlT
 vS53dvxGZrk9tVjyXG9owNcPQitQxfQs+KVy8C6pymCSxQmrZ/Vhsj21yNA0t0+ocwcO
 E7N+u9WrvZsqn9utVd6kMBFRSWz4S9LuvWvXQ6lsDfA3yxqTh4EpaA6cF3G2d2I2sE3q
 t08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bYlvKgEzmRNDYFEqNVZita7PZO8B9rfPaCVow3Q1i/g=;
 b=FWmtxjGTBwYN6wEYV6WP5c6F4MKZ1YhkZATH10hRdxyKXL/GBHSIt6BHD68XZsHMuH
 kjjFnCiqbmcVlsI9evOzPTKoX1VoJntNd5zGtgutO/j+/tiZeqr7VqQMtrBqAYTl7eNg
 2aIkcm9DQpZ4WzKriNM3w2uqZfcU6a5g4OMjkQ9+W/9gRA3zWXRBFt5qy6MYXz9U3JH2
 ZMfG9NYSUg874MIQ+1HMjD2DBY7OLpwg4CGq1FJWQZNDoi7YoVdGdJmcHrlLn6Cq590B
 u+P7oAIrkyTsPvA/7kIww0EUHteDtVrgx6splNm7r3/5fZzDkCOVpNpW8djy8DoRST8G
 acJw==
X-Gm-Message-State: AGi0PubP1V07RSuD8NEOG6BYk8qrldxVsxI9ynHFYXYGJRWyAOuZkeJc
 ceqjfwGP1yJENqWYzJ78PlaosQ==
X-Received: by 2002:a17:902:d203:: with SMTP id
 t3mr670808ply.136.1588276687700; 
 Thu, 30 Apr 2020 12:58:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c4sm486857pgg.17.2020.04.30.12.58.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:58:06 -0700 (PDT)
Subject: Re: [PATCH 19/36] target/arm: Convert Neon 3-reg-same VMUL, VMLA,
 VMLS, VSHL to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fb7fa3df-362a-1e3c-1fd8-00eccafd4968@linaro.org>
Date: Thu, 30 Apr 2020 12:58:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: P4+yaaydUj6i

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon VMUL, VMLA, VMLS and VSHL insns in the
> 3-reg-same grouping to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 44 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 28 +++------------------
>  target/arm/neon-dp.decode       |  9 +++++++
>  3 files changed, 56 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
