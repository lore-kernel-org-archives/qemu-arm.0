Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp640347lfb;
        Mon, 4 May 2020 10:02:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypJbguwnjp/PyyoCUkRcFaURvtIlGomZi4mHUjF3PYRoYmKxcndZwbdKmP9LB3EQvCtZoXoj
X-Received: by 2002:ac8:75d8:: with SMTP id z24mr43547qtq.324.1588611741778;
        Mon, 04 May 2020 10:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588611741; cv=none;
        d=google.com; s=arc-20160816;
        b=g3pKh7rqsBubCepURcabqiDOMcbYYPeUxX7Dv3HLIgFanTjNvj8FFchi4UhFrpKYnN
         9TaU/VXPL5+Q1rpRfaWsEPII4MF70kz4EE4EyX7g2nquKmptWB1VYBF0svPSntak/UtS
         ED/BBzLzzNSxRJ3nLanq14HVmVlEBwBlD2ZSpBIq21hBFA7fyEhGlfwUcLl5PBaSscoM
         xsyWv4lYuLZvpdC+lrCKBV129X5ONxv+OCP2be+VlF+ovPB6l2DjL1FwCS6odMNKQHCP
         jPF9zyRzvD11i5lH+UqU99HtSeYtBAMjP2XVMm2iwNs2xsohF2SrEhaifbQGjiaBkosF
         Z+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=06JBLAVZa5sN96JGmqVGlCxc3EcQhU2HIrajLol3cnI=;
        b=fiVfDTFmk0knXPixIBY0IbQxBdzmVqYCOpiMkIYdH8qA6/222inlKZ1mxRYNQU2wHO
         8w0DgqpG8Ck2x1RCbKkMFiZgAcwI1tCGh6xAklkgRLQ9PqWNTVS4JO7AkCOunF2OvDIU
         QHgpIh3bdzZdXxMp4cUUiS2CeFY1nS5+wPkMjNvn9CZPjAVsVYhBq5mRvcQbLgxvPf9A
         jkBUbnD21sxl0oTctGwt9PazJH05jHSruyZSC6UrvoPm0cSzkANkoNWlO7MiBedCTx/K
         ICXlnzpZmkJAxDav5geqfQNJIogJ3Sb6XFPejsJsp9weKW1rcDUKS3ywC/CJjLhXcE7K
         bpng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GueWZSNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id n27si6802310qtb.257.2020.05.04.10.02.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GueWZSNv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVeU0-0002z2-4I
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeTs-0002xV-OU
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:02:12 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeTr-0005R1-PY
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:02:12 -0400
Received: by mail-pf1-x444.google.com with SMTP id y25so5802962pfn.5
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=06JBLAVZa5sN96JGmqVGlCxc3EcQhU2HIrajLol3cnI=;
 b=GueWZSNvXgKljp72Rdj2Cduw51RH2riNP6KVRc3jekEMECH9UifUTQ5dWeKJB4n7i9
 LCWwG5snx6FjY4u7FCSEXhfFAFMb/ornqDu37sxbECKrJgbJmqHPmQ0EcRzZ2u2Jsn7a
 0jWGa1+fYftqPIIU7JHztVdXStldwTk+uE3A1hIZNyXWoYVlnvjdC0G7DUrXFhm2HBzc
 NNhDN0t9qS/B+lF25qkRKA5aR24iovm3EyIdYgX2DaPxm5+dEucOqWBYGSlOwRc2jjNO
 JX1ZvJmx5jPLxHgppa/rwi+ao+QvTxEaICLfRa0qmaRAQi9IWHBqju+BdajJ+PwBwK+2
 yimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=06JBLAVZa5sN96JGmqVGlCxc3EcQhU2HIrajLol3cnI=;
 b=O/mGKhH4dKTuEnH17ADOd166W4ZI3tvXSUOwShbtlIPHLFMsp681Y6OjytNQkzfotH
 jSPtqezWiRELrQwC99HlA+4H0Vzdmdx1Pq/ieR5vx9ZKggxOXHEb7JYa5ohnWongzuzg
 X2w3LiYdwG6HR/uuWjWbNfhFIbnYPb+zuRMmw5pBrjI47E+6xpLlBHTktHtLbfvZucni
 z/3C6YyuMZQf7nU7XjNlgDBvGqTZGz9re0JjvMIYhyRLD5vepA/n5YiGbBaAwl5QdWMt
 5aVmhgHDy579jKhDgEgyMM0sV3sTNyI1wk3acr+Z/tGl2D5kaIr1QdnAsMM5E/BJs+Xw
 HBow==
X-Gm-Message-State: AGi0PuZy/NfbLFreWnFjn13paM56NL1GrTr5W6X7KhU4XTA5rv1ZjuvD
 jm5I1Q/yHS8Kvz666DRz7XPsKQ==
X-Received: by 2002:a62:a504:: with SMTP id v4mr18095681pfm.117.1588611729960; 
 Mon, 04 May 2020 10:02:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id kb10sm40776pjb.6.2020.05.04.10.02.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:02:09 -0700 (PDT)
Subject: Re: [PATCH 1/4] hw/arm/nrf51: Add NRF51_PERIPHERAL_SIZE definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504072822.18799-1-f4bug@amsat.org>
 <20200504072822.18799-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <48f917e3-69a4-1f2f-caaa-959a1d67acde@linaro.org>
Date: Mon, 4 May 2020 10:02:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504072822.18799-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O47ojSCml98h

On 5/4/20 12:28 AM, Philippe Mathieu-Daudé wrote:
> On the NRF51 series, all peripherals have a fixed I/O size
> of 4KiB. Define NRF51_PERIPHERAL_SIZE and use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/arm/nrf51.h        | 3 +--
>  include/hw/i2c/microbit_i2c.h | 2 +-
>  hw/arm/nrf51_soc.c            | 4 ++--
>  hw/i2c/microbit_i2c.c         | 2 +-
>  hw/timer/nrf51_timer.c        | 2 +-
>  5 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
