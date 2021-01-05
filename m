Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp16312946lfq;
        Tue, 5 Jan 2021 02:56:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrJFaZS1jGgdYKqfqExIFsNUXra1AxX8HuLl4YuwNOyjoO2rkDzK7QZB5dAJ1aDN+E5wuw
X-Received: by 2002:a25:5c3:: with SMTP id 186mr115020298ybf.131.1609844212262;
        Tue, 05 Jan 2021 02:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609844212; cv=none;
        d=google.com; s=arc-20160816;
        b=a37EMhI22MeeMAQoHj99XjdnvITarNlWRxBePsLKv9xFBE2Z+yRD+7JJ7NNeUyYDga
         OQgqszEJodnnjh/Sxj8c7Y55f9XNCIvej5zePhVpTc3juXs2qBzYXTIqfgjOjRMGiVZw
         SqD8iY+UcDj/NDTuEz5Kg832DHlGgathPIA5SagrKNabQsEw+mHkE8xRBlHN+jzce6zu
         BgIJJY6ZZXYgKGi0nUaf3qHLYzUdfayTtMUyDG1dImsbCAOItawO0XksnR8DZSXEpZLf
         0eYS+jcZTct4ZoJxfBWOL4MJ0E3H6eEAf5oXYn7PrvY9kbmrSi9vSu7cT1adVnsNg7CK
         PavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=N4eE/I/iYxVLEloIym09b1kOSFCaCgrJ67UK8teDUkc=;
        b=UBWSEB0JFts5KPGj7mg8KnV8nLoclR7vBRihV4/YxZQfNH10BXy58uO9POC6WUECpg
         R5E53HUa8Up2EuLqZ69GDwdEA/gi1ccI0bJDJuXLERB4fRHFrf46fRr4paNnKY6XskF7
         0MLnSC2+iIvtAZZyo1aMoi4oL00/UY/FdfLcFz5AvknerLEjxQm/bvSx49/4ofEH8ge+
         w6iQlZTxGcKI8HXVpb9CJGuX9zUKM646kDwD/r8Cc98CLa5O/gltyL3Jd5LjmPnRuY78
         vShmk/dXStqfKi6re+Ulu6h1CoU7RYaD8gALH5mXxVVDXDLfsksuM4rWeJWeuIUSp8Ih
         KlXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UmrLFKIo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si66283048ybt.256.2021.01.05.02.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 02:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UmrLFKIo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwk1D-0007vD-Je
	for alex.bennee@linaro.org; Tue, 05 Jan 2021 05:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwjzh-0006tk-Id; Tue, 05 Jan 2021 05:55:18 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwjzf-0003li-K6; Tue, 05 Jan 2021 05:55:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 91so35699786wrj.7;
 Tue, 05 Jan 2021 02:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N4eE/I/iYxVLEloIym09b1kOSFCaCgrJ67UK8teDUkc=;
 b=UmrLFKIo8Y1/qfrOghBLEPVLcJMTVF3Qm+D+LZ7X92PQ1AmCr9/E8TkHVLWLHAj/XQ
 K/uO66gCzVsutXDwen0ZvvTlUqybKRxqDUnf+kHX83Q+jhYzhUkI3744DwMnXqO1XgI3
 bWNyEdq7gIOxMtzpXyYJl0kUWfwk04dlNUGjizEHwpeUvq94PSGFxA+mD2gJEIr+6wYl
 wlQCMB32Kn4I1HAZ3QiLcE7pIU4byY1KAm5iVom5WRC14XEbv1Dxyeh1uFON4V5kDJuB
 DZh+tEAYHoRaHJh5ZYWRzzKSyqlApu35/L4ED/2VR2tpT+Vv4Ii/kzdhrVSl+VjngDRm
 ph9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N4eE/I/iYxVLEloIym09b1kOSFCaCgrJ67UK8teDUkc=;
 b=fJJ1t5LUgi6IoyiJJwpejf5PpwAb6IXOb9YWH02Lu6bI2CTDHqywD0e0C+Y/ybrTlv
 +2aYt9YxGoGIvVi5WWBBabe3EFasCtCTUEQoWcEvJ2277mgqU7QtJ02LD0cmSJuTWrGT
 xHFj3oUaSH7RvnzSilfuMQQWpe39hoNzhLTwp8Bt33m5Gj6qE0SMXJH04ExXmxtzeuTi
 d8QL8z2dHJYQMfabQuByr12St3uHqMuSvmJHas+SWL2ivf08hzLofIrU+2YRF7NyAIn+
 iVq/pyL9MniKyAQ6ncMiMPvueGlw9x+iyrmA5w3qKPfCYzHPHCfA8Y8x+/fFp2hDjO+k
 ACBQ==
X-Gm-Message-State: AOAM533Z40QD8AU9zj/YFldMdMLy3avVNoNaeh41nMqwobdKPJdLVMGi
 jSE8rokqv8JF4H3BdJTXJgI=
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr81031556wrg.328.1609844112836; 
 Tue, 05 Jan 2021 02:55:12 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id w8sm95858067wrl.91.2021.01.05.02.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 02:55:12 -0800 (PST)
Subject: Re: [PATCH] hw/arm/highbank: Drop dead KVM support code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201215144215.28482-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <24e9f6e5-4700-7e31-bd04-8aead370415c@amsat.org>
Date: Tue, 5 Jan 2021 11:55:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215144215.28482-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Rob Herring <robh@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hsh5pogUJM90

On 12/15/20 3:42 PM, Peter Maydell wrote:
> Support for running KVM on 32-bit Arm hosts was removed in commit
> 82bf7ae84ce739e.  You can still run a 32-bit guest on a 64-bit Arm
> host CPU, but because Arm KVM requires the host and guest CPU types
> to match, it is not possible to run a guest that requires a Cortex-A9
> or Cortex-A15 CPU there.  That means that the code in the
> highbank/midway board models to support KVM is no longer used, and we
> can delete it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/highbank.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
