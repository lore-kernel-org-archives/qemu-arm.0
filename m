Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp649223lfg;
        Mon, 24 Feb 2020 10:40:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZsH+PXwl0L85j1oNQSLKP2Q4aL/krRROybsGwk7SPqtDCECCA930FlBOf0Dp6bjPR5TsA
X-Received: by 2002:a05:620a:12f0:: with SMTP id f16mr18144795qkl.311.1582569606982;
        Mon, 24 Feb 2020 10:40:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582569606; cv=none;
        d=google.com; s=arc-20160816;
        b=UwJ9KdJuMSvu9Ry0lW9GMvrG4PjBtf/i4Q1swbfg2pdb7ezHebn3YsLPoEmhbrbU/e
         AjT5Mm7kJly9Mx50ebFz2jolAmmoDjxUAq2rJ1kkeBPcT6jLj68opD8O3vAO3MIM6Mkh
         WTLakO/kKHX9W5qlLwJny8ZGjf3uwEp5UEgFHXgCYNrmtE3vFGslShLODmqfEYgAPULv
         8X5Z6QRtIGdZK8LOG5FHkoAbG33InMu02huL+60die+Ht96QOxWBjMLG9vemjh+zH+49
         n/jr4oLQQq6lY4OoVWgyuuZZc+hz1fiS0hQQr7vd2jsH8a76F/slWq/g1H1MiIDJSBnZ
         /nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zubGseT9wH0F1ENLP7Fhgu5xm4hXEL++f8sLSVYuPcM=;
        b=Dj39FR0K1PQyos6RpizRm+uq6yOOSPvctuujYvVJFyMX3jbFrr/Y6TI7gwu86QjVgw
         DCpAQYkuve9ZP86m3UQNIJfqCfb0NjOXvphNGaD2wPhT4Pf4pv0gqdMlWL2vi0dQfdxN
         S0HMOnnCWVhklUsnuwQL5CVutclITgQHHJNA2hh3G8XAOMCe7NY277mq5cKxckwXIZb0
         sjoAdJ9BYPfEmO269NV4O0RF9R+/HfaNySsBRherP6ejsJ9T/omAkWbYZSnyIgtIzx9P
         awM5Z7nJ2L2fQjJUcBCegK6VF71dnXPcYQM45oh4Xigh2uOqValUuW/KgociSdBlsxjf
         9xQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wzts5uCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si6148561qtv.179.2020.02.24.10.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 10:40:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wzts5uCd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6IeE-0001gQ-Di
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 13:40:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Ie4-0001gA-Az
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:39:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6Ie3-0000Nc-8D
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:39:56 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:44204)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6Ie2-0000ME-U5
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:39:55 -0500
Received: by mail-pl1-x644.google.com with SMTP id d9so4385947plo.11
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 10:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zubGseT9wH0F1ENLP7Fhgu5xm4hXEL++f8sLSVYuPcM=;
 b=Wzts5uCdxXl37sV/RTAwXeHqkGXaUR7gyYIXGjI1r4MWf3DrZZMMSjFFWNxJ89sK8Y
 pY4Xyy+EcvLup+bm/TlSPCt5oa1ATgE8fWU+PSd23WruIi99WYLYvYe9UMKnzMk4YGlk
 Sa5G8I0QqNkjjXllS0owNpE633paRfgfFDCM/cdQTRghDnOUOQFmnnmJfX7i0Gqn/mQq
 TF1l5fjw6v3EAxF5zVWiNfKPOCKolnWv+n4y1ChJnW/wGRiYfntacfPirZyVS+3DvEzu
 32iePuEKnbQE0f5mGJ8g1L80ul4eFNrzV8G2iHCaYNDg6PPg+wCQmHXoiqylUOvjj6sY
 ZL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zubGseT9wH0F1ENLP7Fhgu5xm4hXEL++f8sLSVYuPcM=;
 b=mYnEZHc94tGCANc+7pvC7WFs0LQrrsNQZ/jYJX6Khxl33+xFbr3avEVGaimYGB3JFS
 CWJC+tEkFc409uGbFnPQFL6OfzKRAobPglgF0lReu4UOJmwzdlULwozSvwuSXtOMX+Ow
 jhE59C6WdV7dsh35PqRoVU5diPSkwV8BtiMusHLnAQbul0Fj0IOJcXpnvJzkrop2fFs0
 4Jm/cjeCiWEBSYwi4FDUc1BClGSAdYifLEir5vG1RueLxUazDlMn5q6HsPdXWVFigh9f
 8ZmHQT4YTZ5kQzpzmjuxL53P3emY6Rsu47TkhIrAIls7FUGBbGFTfsoWgN0BWDHKKtDu
 20dw==
X-Gm-Message-State: APjAAAUWOhhXq4S7utUAs7ofyYKwuaC5Zl2yEE9ztGkFgv2W6xvB3baC
 0JxuHjgmXtQXz1tSqWoG6cAkNw==
X-Received: by 2002:a17:90a:d104:: with SMTP id l4mr533337pju.60.1582569593620; 
 Mon, 24 Feb 2020 10:39:53 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 hg11sm179602pjb.14.2020.02.24.10.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 10:39:52 -0800 (PST)
Subject: Re: [PATCH 3/3] target/arm: Implement v8.4-RCPC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200224172846.13053-1-peter.maydell@linaro.org>
 <20200224172846.13053-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <60d47c82-1c7b-9e75-f4fd-fbf752092a82@linaro.org>
Date: Mon, 24 Feb 2020 10:39:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224172846.13053-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: tqH80SDRNyXN

On 2/24/20 9:28 AM, Peter Maydell wrote:
> The v8.4-RCPC extension implements some new instructions:
>  * LDAPUR, LDAPURB, LDAPURH, LDAPRSB, LDAPRSH, LDAPRSW
>  * STLUR, STLURB, STLURH
> 
> These are all in a new subgroup of encodings that sits below the
> top-level "Loads and Stores" group in the Arm ARM.
> 
> The STLUR* instructions have standard store-release semantics; the
> LDAPUR* have Load-AcquirePC semantics, but (as with LDAPR*) we choose
> to implement them as the slightly stronger Load-Acquire.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++
>  linux-user/elfload.c       |  1 +
>  target/arm/cpu64.c         |  2 +-
>  target/arm/translate-a64.c | 90 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
