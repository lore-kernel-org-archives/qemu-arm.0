Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1607633lfy;
        Thu, 6 Aug 2020 06:02:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLAfWXyZfMeEUlPZun2YzsPFzCTCGzSCUq2XNAxT7xkoCmeaVgsslqBebQwi9bXgeO9ydE
X-Received: by 2002:a25:cfcc:: with SMTP id f195mr13417624ybg.490.1596718930985;
        Thu, 06 Aug 2020 06:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596718930; cv=none;
        d=google.com; s=arc-20160816;
        b=sGlznnTJIe3Qtkaj22GvM2Pd7Mw1IvlT+6McakbDqPgtPKvMJs8tBfUvR0cUz8fH6l
         Vzk7u4JBP3VCcl8Fu4BpGoPQ9yJ50RSOyUOdZLn0QSUtvAWxBQL0q/c6XHFhsODNI5Nz
         jC8yEEZ/ScM4WgtjKTvLL/9PwLDYkG9M6G//iEnraLfAmADk+TWAGMPLYH9WCiM+qyd7
         HArnxMz3BRrv3Wb89bx3VaPMVTRykhVIhrf+PNSjpEOHgo6749ZA7okZASi5C7ob/I3n
         wy6E9O6g1K3TQimc81X+++K4VkX2u6ewfie1V9XWY7nzk7n8Fw032t8pTpwAo+JnL77P
         N4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:feedback-id:x_cmae_category;
        bh=Sb1eZxitC6uIv+hlWKLcho2pwg8K9+VTy8F7JfVhUwo=;
        b=HGmMItclBHUQJ6WPvjbj1k4puF5wIBQkuww+1aC1XYfIRXj4fMPPFI3+djtd6JX/Ig
         /r/1xt0UXYjIuyVlY/FhqyyIY0W3XC9SPwXtBe5UIQ+cj56h7Uc+e+j4yiM9W6olI83W
         Ctd9p81Cnsd7SgLk2p0A6wgfQ/hqnyaSEsD3izKLUyXx6fqzTbD47M1VgkgNwmtiKJmO
         R7fsrnuSntFsdfNpSb0owbzJZ7yZImolTLlIbY68oFRzflgmwNdRPnpBCMILpZ/L7K/g
         H9Vk0DNJF8rPA6+fI/rRDlz6Ihh5XrSkMdxCwaD6gO8oEUqLSYYXvgsHKhAfnFvMOWSy
         x/Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f82si4924629ybf.177.2020.08.06.06.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fX8-0000as-D9
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:02:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yates@digitalsignallabs.com>)
 id 1k3fVB-0007lq-3z
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 09:00:09 -0400
Received: from mail.onyx.syn-alias.com ([206.152.134.66]:56302
 helo=smtp.centurylink.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yates@digitalsignallabs.com>)
 id 1k3fV9-0006cq-Bl
 for qemu-arm@nongnu.org; Thu, 06 Aug 2020 09:00:08 -0400
X_CMAE_Category: , ,
X-CNFS-Analysis: v=2.3 cv=QYkYQfTv c=1 sm=1 tr=0
 a=+BvlVZVS74/p9mKwrR4qzg==:117 a=+BvlVZVS74/p9mKwrR4qzg==:17
 a=KGjhK52YXX0A:10 a=IkcTkHD0fZMA:10 a=y4yBn9ojGxQA:10 a=PPsO2EghCewA:10
 a=eQrCS-SpgXYA:10 a=Ixn1CAxRAAAA:8 a=riSzfaxeulHGD2guDgUA:9
 a=gHPTvc8h__eXD_09:21 a=N-NUiAowhh9YROm2:21 a=QEXdDO2ut3YA:10
 a=_0vDLAJOulx5KDpLVjVP:22
X-CM-Score: 0
X-Scanned-by: Cloudmark Authority Engine
Feedback-ID: dfw:ctl:res:onyx
X-Authed-Username: eWF0ZXNmcmVlZGFyYW5keUBjZW50dXJ5bGluay5uZXQ=
Authentication-Results: smtp02.onyx.dfw.sync.lan
 smtp.user=yatesfreedarandy@centurylink.net; auth=pass (LOGIN)
Received: from [64.98.102.7] ([64.98.102.7:54300]
 helo=galois.digitalsignallabs.com)
 by smtp.centurylink.net (envelope-from <yates@digitalsignallabs.com>)
 (ecelerity 3.6.25.56547 r(Core:3.6.25.0)) with ESMTPA
 id 55/21-23904-5DEFB2F5; Thu, 06 Aug 2020 09:00:05 -0400
Received: from localhost.localdomain (fv-nc-f7af8b91e1-234237-1.tingfiber.com
 [64.98.102.7])
 by galois.digitalsignallabs.com (Postfix) with ESMTPSA id 554D02E0ED9;
 Thu,  6 Aug 2020 09:00:04 -0400 (EDT)
Subject: Re: [PATCH] hw/cpu/a9mpcore: Verify the machine use Cortex-A9 cores
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200709152337.15533-1-f4bug@amsat.org>
 <CAFEAcA_Sbaai_TPMVkGHKGGhfyjc1Mk2Z6pWSVkLcwHLVZVzNg@mail.gmail.com>
From: Randy Yates <yates@digitalsignallabs.com>
Message-ID: <7de5e47e-4347-1e0b-6f4b-922d3adea4fe@digitalsignallabs.com>
Date: Thu, 6 Aug 2020 09:00:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Sbaai_TPMVkGHKGGhfyjc1Mk2Z6pWSVkLcwHLVZVzNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=206.152.134.66;
 envelope-from=yates@digitalsignallabs.com; helo=smtp.centurylink.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:00:05
X-ACL-Warn: Detected OS   = Linux 2.6.x [fuzzy]
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Rob Herring <robh@kernel.org>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Randy Yates <yates@ieee.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C6eHIY0OsAWz

Good! Thank you, Philippe.

--Randy

On 8/6/20 8:54 AM, Peter Maydell wrote:
> On Thu, 9 Jul 2020 at 16:23, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> The 'Cortex-A9MPCore internal peripheral' block can only be
>> used with Cortex A5 and A9 cores. As we don't model the A5
>> yet, simply check the machine cpu core is a Cortex A9. If
>> not return an error.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/cpu/a9mpcore.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
> Applied to target-arm.next (for 5.2), thanks.
>
> -- PMM
