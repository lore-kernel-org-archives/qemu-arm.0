Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp827002lfc;
        Thu, 12 Mar 2020 09:08:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvzimE8hDgg1Pk6ezKfBtRjvJXOM7l3NUeuZ8AX9vNtKzkBXb9SP5ZnFZtIEk1ITTbUPU2+
X-Received: by 2002:a37:4b0c:: with SMTP id y12mr8672176qka.268.1584029338836;
        Thu, 12 Mar 2020 09:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584029338; cv=none;
        d=google.com; s=arc-20160816;
        b=M4ZJttkTUEIN7P93A36nNeOHYgoIIV47TG3e6m8TobaHHwDpzHVx88hT45JAfbfgPD
         u5Z7Mm9PmRFpE7cKxWV9N403ToDtYLmgttkp4y88V8QvYgiH02I6gtbMpwATrU2VwNrt
         z08D++DYgY2zqTZ6u8fhEyulcLRtzmYw0/DBxgg+e9EENqYPtqmtx45FAc3pKLEM1HV7
         URXrdR5S0KPd+DtpPRItCGd7HcJU4t3Yfs8yc3CpUJADPef0XjDOrGpy6GogAF7UJWd6
         OJtkqiT02ymJf86IMVR76gHS9aJUOrLW8d9pTQ0XDjWamClorlbQOyLHPGb8A2Ki5EWU
         3Jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CfOlm33yq7HPm3H++4bpQOCqAWPyMg4tSknKyEUmJYs=;
        b=zhHibVK7f2YTcvsMqMKWX250vWPPn5c5+KuYqtTTbWuPnvrKFVSPsAbRwMgkgM8WE4
         LZ+WeNWlM3CEKOiHvzr4dScuZuM+ZL9jpoQUK5SG8G5zOM4nhW7NLDFy//XD9xUNZEtF
         Jmvzmbrv4Ha+/0mK2tH8A2m+eC7oXgX2XHDMX+99xTGGYn4e9oMKVrUjtfA8Uy+ndlEU
         YonhEbOpFog/K5wUVD5tkUjp/0bTfXttONBY2uA0eCe+iGsgpBOgfWDoxH816cBV69RN
         4RGIEmItgYk7zLRRfYF8YB+EVg0aKM03d1tBhH015eEx/UuSI+OkB2VbHhYuxNTCMiGC
         KxEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vNFfwPbx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si2933707qvy.194.2020.03.12.09.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 09:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vNFfwPbx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCQOH-000652-Vm
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 12:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jCQNA-00035W-7K
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:07:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jCQN9-0003je-3n
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:07:48 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jCQN8-0003gF-S3
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 12:07:47 -0400
Received: by mail-pj1-x1041.google.com with SMTP id y7so2740567pjn.1
 for <qemu-devel@nongnu.org>; Thu, 12 Mar 2020 09:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CfOlm33yq7HPm3H++4bpQOCqAWPyMg4tSknKyEUmJYs=;
 b=vNFfwPbxrxQAQRsMxb3Z+Rdpru2vPF9ds/jjHlbJ6BxRxFxfjoUFXX8bPHJ+F9Rmuf
 qA4G5N+OjIdIJ7Q9hFx/swwbx30/Ta5WfERFXdNG6eZX18Rb/mkmkfcak6THWgcFknA9
 FMkYNPaecdYEz9D5ZmOIDjY6q/LeN7Yh+J7h/TzPnfqDk3hSINV/9Bd9XM0ODqfd6t+1
 +zqntGwa74Sc+SlPNocs2kqtwb+TOdz3sW/S2iSaZiOH8/UwdORYhsdjtK+xlHNJBjdE
 6EQM1mcp33RUd32/6ixXhtVcOTEFTXUmbWbL4uD+qk710H3z0QeRsSC2TzAqYulXTmIp
 4xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CfOlm33yq7HPm3H++4bpQOCqAWPyMg4tSknKyEUmJYs=;
 b=kMASnSgpgo18GpIGYa7+MZK3XZATLCUT2vd9QzkhgEC3lHBQojr2B3WZZlqPzKTppL
 gP7/eO+sBCYZp+x5YszVAB7PlW87xenTdEEiBXmpYsfmyR+Q+ZVOkvm5HUBIzOzUC1iX
 zcdVbX0Y4GlvZ+y6z4C5co8XEZjRz8jdnjBTO+D4hRB0WXtch7TJqi8LAUBeTcrnbbBv
 iTU9MNG67W+HMMvJh2muGMEeeVZax52IXiv7mC8jPATcHrOF74EwV8ecPySC0BZ0yHaD
 XoBOcfD01oaybVHDfSMCq6DppCHpQXmQ+i39UbO2k+wesgCB1BwTQDlUEdecqrHlpzSx
 hSEA==
X-Gm-Message-State: ANhLgQ1S+M6hqodILfpjOL+Ai/ewu33UOyQQAIlr09qqMIqJYvxbrgC7
 9hyIGOk+XsY7dW1G0F/cxrid8A==
X-Received: by 2002:a17:90a:a48b:: with SMTP id
 z11mr4992016pjp.1.1584029261958; 
 Thu, 12 Mar 2020 09:07:41 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 y1sm51319631pgs.74.2020.03.12.09.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2020 09:07:41 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] target/arm: Misc cleanups surrounding TBI
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200308012946.16303-1-richard.henderson@linaro.org>
 <CAFEAcA9KdR8ZcjngFfSf7Y_zG8+VL+6pXDOJpWxP+VM7dj-XUg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a34362a5-3f77-7e84-70af-a29ff100603e@linaro.org>
Date: Thu, 12 Mar 2020 09:07:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9KdR8ZcjngFfSf7Y_zG8+VL+6pXDOJpWxP+VM7dj-XUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 586C4eGJDmwr

On 3/12/20 5:02 AM, Peter Maydell wrote:
> On Sun, 8 Mar 2020 at 01:29, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Changes for v3:
>>   * All but 2 patches are now merged.
>>   * Use regime_el to determine aa64-ness of physical memory addressing.
>>
> 
> 
> 
> Applied to target-arm.next, thanks.

Amusingly a bug report came in yesterday about this.
If you like, you can add

Buglink: https://bugs.launchpad.net/qemu/+bug/1867072

to the final patch.


r~
