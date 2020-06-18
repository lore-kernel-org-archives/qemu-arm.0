Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1837361lfm;
        Thu, 18 Jun 2020 10:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9jbwFX0pwC8UESgyJWLjz4OHYLqpli5q5BIQytNRwfazYAAa3DCOCKnCfiv/uhHEHSQlW
X-Received: by 2002:ab0:7715:: with SMTP id z21mr3965436uaq.139.1592500162417;
        Thu, 18 Jun 2020 10:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592500162; cv=none;
        d=google.com; s=arc-20160816;
        b=rXQKmAu6KXSSLCxjrfxti55fcaLq8a1wf+xm7xUDBNFZbPqJD9OV5axf4Ko+puCqmE
         OdWlPBK1D0h3e6xrODcnbFwOli9EYGb8Qbh3nWbSZ81WApPiTcNSvB7taRJhg7MfXbUd
         xZfp5lZYPzY5zoWWWrAS9QOU4mORJNa+pxF1tAOUiZ3C8kUa1CNTEfDgLosVH2f+JcNy
         +uOg5KithpQ7hNx150ZldfBqkdbVEPll5S7Yhbyz9s77FfvOFP9oHfIZvedykPZqYyH+
         HhlOaC4fb+m/2BF31+lcyJWgv5QnduI2EDEXrQNmr/UBKwdJTom+hVTivyrIAXn7fYeb
         c3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=C5wKJJ7ax7plxCcuBaWVymDM740l0fpgaLGM+LdnYQo=;
        b=pPpcW+XQ8rQ3W8GbDhv3rUEOXCBKqiM/ECBYuyBNZJ3ZiAO3LlCkPnbKKa0l1dRUyN
         PiunjwPUrEFMsBO+z97Qrqs/BTJkZn/YJt+mdrxpe0zyW8KYxlfO8gXHNd/0udhT2/Bh
         9oTmW8KPfc4UusiPHZr61Pp80UKLmf0BXl3s3FNIKwP1i8tBA2ndkd6cEr2K/hEqMg+A
         bry9IRwU5GRA9VK3AWI+vqxsVRqOE0J/LUcKQtGAGwcoQbmoRK660q5YjWx9PsJTLqIe
         ISSAZVnBMAa4+H8M9tWNvyO5EADtaxuxjkWGO9KGm3SjfCrHjD/H3oHAOdwF+DCpwf7R
         KItQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jPRx4Hn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m22si492246vsk.164.2020.06.18.10.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 10:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jPRx4Hn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jly2T-0006IP-Nl
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 13:09:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jly2N-0006ID-CK
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:09:15 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:51580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jly2K-0000f1-Gw
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:09:15 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ga6so2817207pjb.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 10:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C5wKJJ7ax7plxCcuBaWVymDM740l0fpgaLGM+LdnYQo=;
 b=jPRx4Hn5ocvCn03H8AGQnUa830kAvSEaWqg6m8il8HgIc3hVebnFaG0Zj9uMXOfp7p
 M28BzAGVTp2mb16xQHoaNMaA++FV7/m1JGPjaNh65rudasysJGKz/SZNJKcbNcIzzq9p
 qiFu7EwA+ieupBLgQvBmTX+DLhjZxVRwFKlQpbOc6J6Y9Ckpusj4VHmqerpAVOh/ujE9
 lw40+qA6uSMdxHu27b0z0x+6QvwBd7CjtLePrlhIlrIek4h6gefdkKvqD3GcOFL8prVZ
 Abvj8b60bNFKSIduwQT3zpDPdSEp+VaBkHw262eltutYeXtMrnLE+n9Mfd5NMhCARTzt
 7uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C5wKJJ7ax7plxCcuBaWVymDM740l0fpgaLGM+LdnYQo=;
 b=o131ZInY+gRMNW2olOayJSp6TKaKOcnjtlruGbaDsBCHOi7q25/Eeqquj2pgRZVTZP
 3i2YY/TdhPOxIdQ13DIQ+pUNjaC8aMIjzwRZrlbQ5PX3pNXidRSit+AfiygeJkQtzHZ/
 Qimhdwm6xuYfE0PUyFIIzFQoMHgTMdoYE22VxhPDWjVJfPEfUBnowMKyfwqdnC/r+S1v
 eHsr64bYdu4zS6Ogh1ryW60jglv6ncewJjXL3QW+A1h2KkYUlQob2NC+2YfBEkvwvRsA
 8Vxbvxf1WiSDhi6+NyY8LA7i/Ooe3mTXACkANXk8PQybVJkl4Ygt1CUL6Upuv6CAXdXz
 hs8A==
X-Gm-Message-State: AOAM532GwtURLO4eptK1lmKwNyax1MoA8xqJQF7taQrAosZsJPKacx3T
 oKpXvEkNd8DDUIJxv+AH8iVImA==
X-Received: by 2002:a17:90a:69c3:: with SMTP id
 s61mr5295822pjj.212.1592500150949; 
 Thu, 18 Jun 2020 10:09:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 125sm3289713pff.130.2020.06.18.10.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 10:09:10 -0700 (PDT)
Subject: Re: [PATCH v7 15/42] target/arm: Implement LDG, STG, ST2G instructions
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-16-richard.henderson@linaro.org>
 <CAFEAcA8LEApobASw-D6PMdkR2sAjJfnu5DzBeD29hjdoHtuXJg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e64175f-14b6-4347-df89-866bfcf75a92@linaro.org>
Date: Thu, 18 Jun 2020 10:09:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8LEApobASw-D6PMdkR2sAjJfnu5DzBeD29hjdoHtuXJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eCwtL7TEYQn7

On 6/18/20 6:56 AM, Peter Maydell wrote:
> The pseudocode for LDG has an
>    address = Align(address, TAG_GRANULE);
> in it. I don't see where in this code is the equivalent; have I missed it?

Nope, I missed it.


r~
