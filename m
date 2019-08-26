Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3313551wrs;
        Sun, 25 Aug 2019 18:37:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEUJr9BeMtNRLzrLKxVpZ6y3LJQGsiNuEzJ5HM15ZqhfvT6kvJVqhM6ViZNlzUgunBIHJq
X-Received: by 2002:a0c:c250:: with SMTP id w16mr13118238qvh.188.1566783435971;
        Sun, 25 Aug 2019 18:37:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566783435; cv=none;
        d=google.com; s=arc-20160816;
        b=sX6mZI4JRQw2PrkySe3jbt7qQWrjByXXHTAZVCykI0F0VONjV7gxMW/KDI0Q6TEUNs
         ylYhJYa55sV/bFZ2cTS6DiOzr476EvQxZDSnipqBp4SAjii02xjzMoR2+mcRiRetNtOy
         yDQvSwOQOiWxS9UaGrkV8nFYPM8eOEBVaJ3WxQgVl/lNp6+XFjO6EB8yBt7cf0UNReTv
         ierFnBvMuX4Xcc5Akf93OHCsTMwOVlH1Tdt3HdPCqKrBKuhCUiDy/G4YocdbtuxzS48j
         MyCq427j2mXboNbbU9Iv2+bWh+GcIjsVhTZ0RahOeKj36/M4OFrSnYpE5cyHUxlXfRa7
         YGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature;
        bh=OsiSZTEerTwA/BISofCm82PmC6rCQ7KB1dG//WLxaMw=;
        b=PvJDDDLdJhj9EsniFbsJb+KfJtIeC53wbftSckgY4wd7HO8jwGsi4K+PD22Bo9b51S
         4J36af7sCyWQ1Uo52uQ64rV4z/sgWvkUti8reNg/HLdEiOokEFUqFLgNj8/phe+RJcoP
         NW4nO7nCPhPBn2whFvo1oTwxGs1GN3n5nmo57ebiKtAELXU8UV+Ye1rqf+CELpgVT3SE
         1JGHHc+CSwv+nawUe1IpmLBggOVyFXYg02SCeNDZW0oXWfoipDPk7A41o8AjIafkUzL1
         /TqEq/Gn1O0hkQ4fHUkH/MRY9mrr/IxLbkhJpeK1WwdY3S6zjcg7ofu9NCVhscI/CFlc
         apdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P55v7Fxj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l37si7245359qtb.37.2019.08.25.18.37.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 18:37:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=P55v7Fxj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i23wZ-0005Kr-DH
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 21:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i23wL-0005Ka-7d
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 21:37:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i23wG-0004zo-1r
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 21:36:56 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i23wF-0004yK-Pr
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 21:36:55 -0400
Received: by mail-pg1-x544.google.com with SMTP id p3so9512914pgb.9
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 18:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OsiSZTEerTwA/BISofCm82PmC6rCQ7KB1dG//WLxaMw=;
 b=P55v7FxjTYkpVOXAen1hFE6tPtspj1YH6dKm0ZeMyK0yyP8aFAZvecBalN8gd2yRqs
 MTdNls+IdqrCk8rojK2EgZVC7sgtrZyBDWfFIkTE+f0ClMNVuTFo8v9uc03jR145mEv+
 zt+K+cZquzDUcmm/0+Z1jF0wVx4dqgv1u7xCr9uZ+aNWyghZ6B8O0kDKc3bmZe9xSuIx
 VL3IpuQ/sGdNVpA3Pv7ujp05N3cKoKuMGMmUXADtZGRfSAmxEFj3NuI9SqlgKf742OaY
 vwYZ9Pnrfw/YLT9mcjfJzZBU0zQcezNMjT+2NNez3AJyZ2nT7S/c6y3ngJNHBnO9TLr0
 L2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OsiSZTEerTwA/BISofCm82PmC6rCQ7KB1dG//WLxaMw=;
 b=l1st4cBlpPHKqsqsgefLBvTVieVfGMoJJdVT3wkHidOVQf2uLZpHQsjpNGer/OLbOW
 /8rd4jiBFmcfOCAytPhjKvqvzK8obyCmkmf2/eoNOu5pvyezs21+/poz/DJex0Z0quzw
 5CnjZ3wos8uRAXivcWwxRnQYpa+pS8szy1rCnFAB+9xI9dGXEY1eivLc06TwE/wp0OI8
 x1tfZRvS2gOaDNLP5jwB66EPJNUCJJYXNOfV8ptwJOEKeT5JCCfDG1F5qvMF7ebfMWHi
 wNcge9cQPef5t8EOMUqMfsyOrTI71BOBcO1nvVazNSucbrosFAjFy5tpxShHH8HaL1rP
 +gcA==
X-Gm-Message-State: APjAAAVS4LGJacilJpI0QQDHCTCYCWh4PhB4aFb5QTlE6DFQfBqvScmI
 FeKsw2V9doh/v15j/i28bCENDA==
X-Received: by 2002:a62:6489:: with SMTP id y131mr8500332pfb.124.1566783414218; 
 Sun, 25 Aug 2019 18:36:54 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g2sm15000746pfq.88.2019.08.25.18.36.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 18:36:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-36-richard.henderson@linaro.org>
 <CAFEAcA8JGUdM5v0MCb98Jw+iJNC+ZMD5SDrPVR0dHGgtMOdk6A@mail.gmail.com>
 <162644ea-ae46-576f-7dea-6696db364c68@linaro.org>
 <CAFEAcA-m76JW2=t8uX6nC8E54TMKLe4nbCGvd8bOKx+wSYRtGg@mail.gmail.com>
 <516fa14a-2e6c-9496-9318-920ccd164b6a@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f8b85485-ab43-cbce-c5f3-25b6fdc8b07a@linaro.org>
Date: Sun, 25 Aug 2019 18:36:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <516fa14a-2e6c-9496-9318-920ccd164b6a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 35/68] target/arm: Convert
 CPS (privileged)
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
X-TUID: uSmxQ6C2fU/S

On 8/25/19 6:10 PM, Richard Henderson wrote:
> On 8/25/19 1:43 PM, Peter Maydell wrote:
>> I'm still confused, I think. The hint space is
>> +  NOP            1111 0011 1010 1111 1000 0000 ---- ----
>> (plus the more specific hint insns before that pattern with
>> fixed values in the [7:0] bits).
>> CPS falls into that space; but you've placed it with
>> SMC and HVC which don't fall into the hint space, because
>> they have 0111 in bits [27:24], not 0011.
> 
> Oops.  I see what you mean.

So, I've moved the line up immediately following the hint space, and added a
comment:

+    # If imod == '00' && M == '0' then SEE "Hint instructions", above.
+    CPS          1111 0011 1010 1111 1000 0 imod:2 M:1 A:1 I:1 F:1 mode:5 \
+                 &cps

The line *was* still within the same group (which is large), so it doesn't
actually make a difference to the decode, but I do agree it makes more sense in
the new position.


r~
