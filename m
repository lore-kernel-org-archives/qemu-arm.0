Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp651265wrp;
        Tue, 3 Sep 2019 09:11:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqybhkaBvaSQENwYOok14I0AQayhG91pV9hN38n827Ve4SVsWy6RxRHrebd1/LOB18uDH5W5
X-Received: by 2002:a17:906:c344:: with SMTP id ci4mr29497927ejb.219.1567527095068;
        Tue, 03 Sep 2019 09:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567527095; cv=none;
        d=google.com; s=arc-20160816;
        b=AWFLr3q06yvUIFeyLyOTKbLiGsfZ98ieogWe/3x83YsmS/cKd7ednt5uUx7lOYtsch
         eXxBen2JWFDVpUrGsFvoU1/85Is7OO7dlYB5fqUNr7TGZzUAqT+18G1QLiNvCKwCOsQH
         1xSttwgnmkzLjAJEFId2d6IgD0z/CwMg0AjOn9rS7/00T9nLaFvbXL0qLYZOtrK5MWG5
         p7z3ry8sC7dwy1JEifydBIIqePQxviWNfSHr5wNPVN4fomVcretfjisNPFVwGJzoRSHv
         qjT6zB4UQitAki/wgNa+o+A4oaxJ02Li6hzZVUTrhqVlIRdQynlK7EEBER1liKRXLwqF
         5Nmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=SJGTeZae2hswjIgZLpujzH5TpXpJTXB+oKJPPXtp5Uw=;
        b=ba1f1DKmLKUepXxZsstRbhWqG5Fto5tXTV9xqxhZpQxgpvPWHAZbIcRMZiNtR0Me6u
         5BUkgEDgFFv6DfVGQnWiy/NtnEo1zYIjm0dVzz2T0j3B9e7gI2Af8/4L31KpUljn9cnE
         +O50GtONgMCLlOiBZcfkA7UGacHa8irG6tcfhO126Rw/hv2ZIVtjYHyd5p2YV1LEQ5Yw
         1WYsGhfMiT20avVqd0g+F41vX5O73A6oLYNgxwHVhAUGcw4aR/VdiTQJ1CDv9OpBlYuJ
         /RiQHPcl+3yqog5K7SqZ7uSzFczo9sQmAYsVoboqtzynm99jGy/xVxwXMbw0NIYtqO88
         gKCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LrMdf56n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si11245179eda.88.2019.09.03.09.11.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 09:11:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LrMdf56n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5BP3-0003Zj-P3
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 12:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35388)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i5BFp-0002GW-GT
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 12:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i5BFn-0008W6-Vj
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 12:02:01 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45890)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i5BFn-0008Vf-Pg
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 12:01:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id 4so5838418pgm.12
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2019 09:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SJGTeZae2hswjIgZLpujzH5TpXpJTXB+oKJPPXtp5Uw=;
 b=LrMdf56nfe8vjGpq2vPjJI0+HtO6Cqohy89QIPG814wEBb84tIdzwbfXSPCpeq2ukC
 96lMaiAoGNXucAl+2mqI4I7zK3vNT1f95VSnX3swJ71Hrqr9bbTqCT4LIBJJrqRkB3MF
 670SjEj5Q+PwTQL7LhIN+rX4ClEHKaaAFm+z0Uy0Y4SqmcMRq/PM3L5qGaJEYbAA2jrm
 sVbIUqcX7OFbF7xq72Ym22n1VZm9697f3oVOW/kQvlxkDEnddORRVdFTGSoXU1DPSPBK
 2bAwJbsLvdMSLKDhBFI/HBiijOTivW0kPqOVoHZa9ZZFV3eOr+j46a6cSEvQpMDwHPQI
 EcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SJGTeZae2hswjIgZLpujzH5TpXpJTXB+oKJPPXtp5Uw=;
 b=hiQtDowWVNb6oO4Uib4BYg+A+fFIkAPYQErOlRfYAXK929zMrnfpqP7xYe67L6Wwzj
 Mvtx1r89kS16C0k/2SdEY4xSadVaVyCR0gkAJYuVHljU1alCPJxBZ1OeE/PpxthbAR0O
 ANez9/+HULX2XTg3tdAKYmk0cNCG4b7nyW9JdbGO8weKA4KW4+DwR7d9ZL/7xlery8cs
 Dpfy9V+erS80CkLk7+Ac5PKJ4pe/V8cLy4xXo8NynAUT+QR64z/sc6XNDwi2yOV2S1ie
 Q9dOgTND+DAK89iA7cXnG1l5xC5pwg7TWkgtaRfOUGi02uio6kyXmSHZ9e4CXf+5BDZQ
 R3QA==
X-Gm-Message-State: APjAAAV5YyfyHFJEpe3lhdJVTZFpCLovinYHChKDkv3k7x2PFzQvT7h3
 10AD4bzefIOk6Sqd69UbBf1ZI/PXOMM=
X-Received: by 2002:a63:4c46:: with SMTP id m6mr32064094pgl.59.1567526518187; 
 Tue, 03 Sep 2019 09:01:58 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id a18sm21928397pfn.156.2019.09.03.09.01.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Sep 2019 09:01:57 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190903154810.27365-1-thuth@redhat.com>
 <20190903154810.27365-2-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <69233989-78d6-716f-210a-0372fd4881a0@linaro.org>
Date: Tue, 3 Sep 2019 09:01:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903154810.27365-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 1/3] target/arm: Make
 cpu_register() and set_feature() available for other files
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EXe2/Wa2SqsE

On 9/3/19 8:48 AM, Thomas Huth wrote:
> Move the common set_feature() and unset_feature() functions from cpu.c and
> cpu64.c to cpu.h, and make cpu_register() (renamed to arm_cpu_register())
> available from there, too, so we can register CPUs also from other files
> in the future.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/arm/cpu.c   | 20 ++------------------
>  target/arm/cpu.h   | 18 ++++++++++++++++++
>  target/arm/cpu64.c | 16 ----------------
>  3 files changed, 20 insertions(+), 34 deletions(-)

internals.h would be better, since presumably the uses will not leave target/arm/.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
