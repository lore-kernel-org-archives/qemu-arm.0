Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5575811lfp;
        Mon, 17 Feb 2020 16:50:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxOfZO+AqJs0zTlDpWhD29sTW7rHlFsxL3UUWmrD5ACS0NX0Y6TruLRcDO4Qp4+vKbIQEGH
X-Received: by 2002:ac8:4616:: with SMTP id p22mr15606730qtn.368.1581987034314;
        Mon, 17 Feb 2020 16:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581987034; cv=none;
        d=google.com; s=arc-20160816;
        b=QSm0d45emwuLKh/+13P2jTcU9LfrvJ4SKQA3ReX8WVYajMFMHDPwQPsSObrMZAy2W7
         /HGBaw7fCl9N8bVLKwa4sXqWAg0yj1Z//8uz4WZ7brPu1lCnwvgjB8mDtB/TEeagq5E9
         6RNfNyrlIy88ulD+jO7UqYAuTK9TXhxyAKtQz72gMtptWJ63YWOhcTo6bZUns49JqqQX
         Q8Lc+qPX0RcQk3IgtUIXJ1spjWIIiH7r0bPwdw1UfTPcoMaA8Xx4nl1bq42jtBwfne0W
         QxQbbV/+ZhPe/GEsrrjN0vGxx/+a5xK5ctZsCXZJWeTceVTRUxAX9QY5uC1SHE6/pkVa
         NhVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qX+ns+h1enFhZdytzkhMcZ0cr1TdMMWet4M2Y6Y05es=;
        b=Yf2BY185WLYggbds3iiLdWom3VjClFbIT01DaPMIdoXL43Dx7defmg6ybFBKbu0SYi
         lH4qa/E1dEai2fP/WAfQIIH1OoDiZ4jtkbPZzL06XQeUBWJuHiF0svLhpQMyODsNTc6h
         9ADirIxZkWvTo0cmqHl91y9TMvuY0/4Q9rc+mprMkYCOdGYoq0YHZC1KX5E1c3nXvLih
         wJeLFvWVKHBZEiM55Pk3neyaM1ti1h3o6/lv4wxqRGu1/2aWYPnSjM4KdWg2yYj/7sIQ
         +FcOtRLmigreRMNhVFVTfgfT4tmmyhRGy6GxesxvwtgxYLXQkhbQjysKNfFIZPwwBFOC
         3qZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rh161K9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5si696927qkk.240.2020.02.17.16.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 16:50:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rh161K9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3r5t-00031H-Q0
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 19:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3r5f-0002yT-NI
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 19:50:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3r5e-00031u-Ek
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 19:50:19 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3r5e-00031R-9e
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 19:50:18 -0500
Received: by mail-pg1-x544.google.com with SMTP id w21so10059410pgl.9
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2020 16:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qX+ns+h1enFhZdytzkhMcZ0cr1TdMMWet4M2Y6Y05es=;
 b=Rh161K9GrvRCtssURtPENdF/I8CD7uLG137/dx4SbX/VomUSI+5DwoZu59wCoMTFbX
 9HgW5D7lH+PT40VBW7u17u9AU2HCS+G1xei2pO6rtzA9ATWZXYc9cQ+fJsypuCwSuiLJ
 8HpJk0erPNb5U+HUdP3SZsvnAQMxqzUANVlwS/0y5hO4xa8V+DwnbPQW07Dgxp6b8Jf6
 nTCv9tzsgbKSM/yP0X8+NmXcntO0Tc7CNyBaMtd9xX0A5ZTAQr/DI2vwxVZvlDb+b7bb
 GcWZWwPk2ZE7Q/aU2Z0Qd8l2rsotkA8+1+NfhPaEOgDbhvUpWJyoquxRpcPfPVziPdWF
 mGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qX+ns+h1enFhZdytzkhMcZ0cr1TdMMWet4M2Y6Y05es=;
 b=JYihN8Avg3HikwdO9+mO9m0RaGz7Rds2GAICIwskZedgDJJ+RG8bvP8gWYvv2PJzek
 04vSxx8fspa+NUEkflrX8KxGPcG2RPgyqDXasEO/2UTIIujm8MM4Ryw27SlTp/p1Mefu
 XHIqJN4+er3ds4dfzzeM3KL6+9ttUM53NY2Vj356mXfZQ+gZpJLYlX1IVGEsAAYlkRBG
 fPYjBnJk85X1GPDTyhi1Grv64h5TfoCsUq3VfBIe0Z/feK5ceu5JHobzEvqC1MiT/ddm
 qNfUM/yqUc5Y8AUq0kexcFaQJt7qgV8Bl8tglAh7TDJkRppL/TKrLCCW1GzeS1bYu1or
 3/EQ==
X-Gm-Message-State: APjAAAUKdcyXOMIjd+seZSg8SW8NdvgjojscDkSbOdDahQktD6pGCgfX
 2S5KR9UpyQf/rZp2iU2ZwPGUYFoY+xM=
X-Received: by 2002:a63:9214:: with SMTP id o20mr20266854pgd.146.1581987016739; 
 Mon, 17 Feb 2020 16:50:16 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 o10sm2000732pgq.68.2020.02.17.16.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 16:50:16 -0800 (PST)
Subject: Re: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-16-richard.henderson@linaro.org>
 <CAFEAcA86hhBNLWhAe2UY+0-pS65wpSdPKFPTA9O4m9avjECxaA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3193d3bc-230a-8770-ffd8-d15d26c75ef9@linaro.org>
Date: Mon, 17 Feb 2020 16:50:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA86hhBNLWhAe2UY+0-pS65wpSdPKFPTA9O4m9avjECxaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v4LdeUctOdm9

On 12/5/19 10:58 AM, Peter Maydell wrote:
> On Fri, 11 Oct 2019 at 14:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This data access was forgotten in the previous patch.
>>
>> Fixes: 3a471103ac1823ba
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate-a64.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> index 4e049bb4aa..49817b96ae 100644
>> --- a/target/arm/translate-a64.c
>> +++ b/target/arm/translate-a64.c
>> @@ -1766,7 +1766,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
>>          return;
>>      case ARM_CP_DC_ZVA:
>>          /* Writes clear the aligned block of memory which rt points into. */
>> -        tcg_rt = cpu_reg(s, rt);
>> +        tcg_rt = clean_data_tbi(s, cpu_reg(s, rt), false);
>>          gen_helper_dc_zva(cpu_env, tcg_rt);
>>          return;
> 
> ...doesn't this mean we don't do a tag check for DC ZVA?
> Or is that handled in the helper ? (I guess it has to be,
> the DC ZVA will span multiple tag granules).

It isn't clear to me that DC ZVA does check tags.  There's no pseudocode for
DC_ZVA, which is less helpful than it might be.

I suppose one could infer it from "behaves as a set of stores to each byte
within the block", but considering that stores are both checking or
non-checking depending on addressing mode etc, I'd have preferred an explicit note.

So far I'm treating DC_ZVA as unchecked.


r~
