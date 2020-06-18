Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1858557lfm;
        Thu, 18 Jun 2020 10:35:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy99kWz9veSkXO+Cl4aUuU4KWWK1J0xVyyC5xiCpMl3GQ0u0fG7aJrPXobjSpGdOjYxrQl
X-Received: by 2002:a25:3bce:: with SMTP id i197mr7993806yba.436.1592501738807;
        Thu, 18 Jun 2020 10:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592501738; cv=none;
        d=google.com; s=arc-20160816;
        b=YFsKenHXibR4QTHaEZAq/xlc94loidRORyNzBd72/cxn3rbTeeT24oPzUX5DnsOVea
         skSb97IP2ODzxHLrPEvLp9oL0x8uh+NiF2Q5h7e9dyHj1nyVHrC8PR9Jbv4QmXjuLw2D
         f95X4rVwLHqa26ZwlshcYPigDmJoo8JODlrE8eEO384UlobG6DmQ32Rfy1DDV8ZIuXy3
         kAw0s315M7t9qykdYFAXONeXG8d58gwSgNvGrK3ei6zDqHoUh0IYaWJ9tsS5z34rnKOH
         0Kq5l4oXL0+yEetcKdbLcRlATno8+/8JqUs+qh98wG07Xao5YcdswshrqZaxelkC400i
         8DoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TSe2y6vq2iDFC/V5hLR+mmaFKnIAn3KvGSjCLSEdV8M=;
        b=vNjd7ZCKbEMalFbMnEuhb4qbd/+jMd43VjEb8qUyfAlSUTR03KxFwMqlaotx2iYxTN
         u26ade1GPb7zHF6/MPqBhBTP/A96DDpLy3YPmkBiwWXVzenDlPTVNS/0G2S6cxNrcF0n
         dx5EF2CcWvZ08jo1v9BfHo2dBZWSj67YER47xeBV5Xvay4/lB2oUhx1hn9CHmLQG5/eF
         DOE2Uhs2knqexYVKzjHL0eeym3Re8usdDA3If9GHgU8vgIpofGO6i4Sgi3p28xM/K8eS
         1RcEQ7C7RBb/ImGAQZlGVq93QBfQ2K+TxgGlqDHjDJGzJewMK6/lLboPoRC8vsW0wcKe
         8T9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sVq4j1rk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w78si2949559ybg.320.2020.06.18.10.35.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jun 2020 10:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sVq4j1rk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlyRu-0001v1-4P
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 13:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlyRk-0001uO-M4
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:35:28 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:38350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlyRi-0006rA-LG
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 13:35:28 -0400
Received: by mail-pg1-x542.google.com with SMTP id l24so3213761pgb.5
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2020 10:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TSe2y6vq2iDFC/V5hLR+mmaFKnIAn3KvGSjCLSEdV8M=;
 b=sVq4j1rktIcGeAAEeHSHqzFKvKR7pN2XAJ9x3vuf6qTx3Y63aPdZEb4kwk2univoGY
 cOYjmyyPfhRJTYMojCFtjUvL14eWf7rBssp7GQmwpXyaNV3Ze/ejdhsx7AEIn/Ifj95T
 0iCOUcRsf0VD/LchrewQIWrCTYQOt+qq0eWFTHqcgDs/GSKNH7sAMJGhF0SawtldyTQ0
 Xtvg9R/FEqF3eLpY1XXXz2gtediVyd521M41BUHZb+1lAtfTYMGYIdoTzjZaalHziUYh
 MkCq3SUz47HwuJ17yyDNBDMygKWkkRhcaCTzBcS+v6uaTcbueYSed0OVjCKdD7LTdaUE
 FvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TSe2y6vq2iDFC/V5hLR+mmaFKnIAn3KvGSjCLSEdV8M=;
 b=i7XmpspKz7KXi16/cySDRo2JN71gKZ5pQl0mYyWixWdI+gNtcF+WCt/8QrphKd+Evm
 2FhfQ31Vk2n2dWKzR+Ku7b8SdJcvyUnEmUPholTbWd3RnFrS5+ieOsz3ZoqTXtOY4BOZ
 cglpQNKYqyejBQXLtBn4xg6146XmszLHLoRWkJsaopjhtZ1nzvXzP6EuF/fEqqkWfX0v
 LwqxcIL9bA/dMKBsZYJe7arfWvaJBpVU105dA/fwHQFUo8UEqovuIi/gUx2vW3b0sbz+
 zufYapzz2qiVQqea4sz/VV++4Ld8iS07wrouGSsfPkfIyyJmLwg+qo5pSCB7uBFIQAw4
 6NZQ==
X-Gm-Message-State: AOAM533H5Lr0h0VKPOq5/WmbHLxh7rOfIC9QM4qzgVOxrcgds3fUQuAy
 pE70l81rdrnYo+NQxyYgikLrKg==
X-Received: by 2002:a62:848f:: with SMTP id k137mr4222458pfd.99.1592501725072; 
 Thu, 18 Jun 2020 10:35:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id t186sm3572152pfc.39.2020.06.18.10.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 10:35:24 -0700 (PDT)
Subject: Re: [PATCH v7 39/42] target/arm: Enable MTE
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-40-richard.henderson@linaro.org>
 <CAFEAcA83Tb0r11R6EUFPrqLWrXNx4+9Q13q0m8X-jwO49Wgysw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <39a5f769-50f4-d79c-f469-18815551e764@linaro.org>
Date: Thu, 18 Jun 2020 10:35:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA83Tb0r11R6EUFPrqLWrXNx4+9Q13q0m8X-jwO49Wgysw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
X-TUID: QvdOtTyy9xv+

On 6/18/20 9:39 AM, Peter Maydell wrote:
>>          t = cpu->isar.id_aa64pfr1;
>>          t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
>> +        t = FIELD_DP64(t, ID_AA64PFR1, MTE, 2);
>>          cpu->isar.id_aa64pfr1 = t;
> 
> If we don't actually have tagged memory yet should we really
> set the MTE field to 2 rather than 1 ?

Well, we reduce that later in arm_cpu_realizefn.
But perhaps this patch should be sorted after patch 41.


r~
