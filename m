Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1062870lfm;
        Fri, 24 Apr 2020 13:18:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJZhdO1gBYMer/cJ5KGa/86UiSDDvIEaOi+2l/sfYs92umG9XhlLbc79C9rWQWnpDYfGeUN
X-Received: by 2002:a05:6214:1812:: with SMTP id o18mr11362021qvw.64.1587759504518;
        Fri, 24 Apr 2020 13:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587759504; cv=none;
        d=google.com; s=arc-20160816;
        b=B06GPDx1ID1cH3Txe30jLVcAbvJOgNuRNf8O34FZoWIVH6txHxZbTeCHwA0BdixCOw
         20tXaW8j6fwPHuwHmkNMzgxfUdcDihnU+RI8Rxce5qS5aCtHXZAQYuotatIHuYRtj8Qv
         376XT08AInkxitZsgJWMht1X+i1yuV5Icl1tp+2h+cl+nTPQI8jhixwCyY+73QvSXTSt
         03EObX8SnmAjVq9pAtXkEyYlfewVgWr1XWbtKyNQGhgerfcwgs1uOgZnzoALkv52T16O
         KlQZW281AxBCLnYmqNYsdWOJP0RY1mKaee5M/Qj79f+obrGrE0KYg4gxKOcuD9vRPfOF
         Br2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4nLYMVwdqWzcDZNSakvBh3gvehkY4Zpi0kf/RMQHkpw=;
        b=DgFWF8P9jZH2/KFSFW2WqZe6UtOZwjS8AT2jhvPXIZV6yhCAfX9kCVmBZonnSlPP9X
         SEfqKzhv+rISV+i9sZeQ8dQNl6Y+KCVyHZGaGHsIaqDU4XV+TYrJzkCG6uUQ1reO1GdF
         yKx3jG+qoiA4Skzc+99vccdx0dHGscnMv68QIlHd6QEOAxBYjw9MJPl4wAtmFfrHMO0d
         qCNz42Pu9dK/EqkUyYNYOLR5pYDTsQ0YIjFIvq2IKUr2U7i3p9lNG5zsxUmoa1XLeBmy
         FgSxuGUJ4d/IDHxpp+q8GdU7wvcv5sb7OApEV+hrJIXKSyfa0dQHEVgwmsm1kc+s6ZUX
         yFEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNZAqSOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x83si4059609qkb.339.2020.04.24.13.18.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Apr 2020 13:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FNZAqSOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jS4mF-0000RU-Fx
	for alex.bennee@linaro.org; Fri, 24 Apr 2020 16:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS4lz-0000Qo-41
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 16:18:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jS4ly-00046B-7E
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 16:18:06 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jS4lx-00045u-Iv
 for qemu-arm@nongnu.org; Fri, 24 Apr 2020 16:18:05 -0400
Received: by mail-pg1-x543.google.com with SMTP id r4so5141505pgg.4
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2020 13:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4nLYMVwdqWzcDZNSakvBh3gvehkY4Zpi0kf/RMQHkpw=;
 b=FNZAqSORpbFoOI1/TnwLtoRRmzLsJlw7TjyDrk8bP34nUrHeUN4QEu5L3CMgPUqbnv
 rJfaG406mMY/cqLlvXCoMME9DHw5WDMZHdNATSzTySmNPua+YhlcA63gslgJrGe7cGF7
 gnSEI3VwGoWCTp5W4PximV4XlZujQJ1v++3ZoX8ytPc7lzbRXcplLoTQ7alLSIrSqP2+
 5ht45GHRZHa94wYJ+kWmySco61QyWAaw6xqWlphzu5MBns9xSI0a6aKnDiMaWYqGFMmX
 w5UI21kAiDKQIUnFd3QGJRsigiIKPfXnRgfyjgmt5JQSgbbvAfQtDkm4NaFCViKd2ouC
 8OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4nLYMVwdqWzcDZNSakvBh3gvehkY4Zpi0kf/RMQHkpw=;
 b=njTHM4Bd6NSRG6WAYudmsowaXpc8tVEPsmo2BPCMGx2GqsSJXOmRNJbXlxrYOEbhfV
 TtiwoWCFRJvtsSdRV9CRSVTp/9FfV9AvQveYep3IHmZN+rw0OjXdkDEuySBFMbNjZYBL
 GGL69GcVGUx/R464C5m58ZZXiC46bW6m6pLSEHBrUhK5nvBI0mp4Y4vc16bp/BxfUf8B
 QNrF4IR8tMFQwcP5xnNU0TaZKlxysgOmpxSS77uQMM9Bjr9gQ77lkBSli1JcXpLmkPfi
 l5k4JdGUtqN7WGuZlUpFI8NEopVQnP+BGh0cIjDih0WhyLvgLMp4AaP95mrvY/p+U6Xc
 8bog==
X-Gm-Message-State: AGi0PuY2FWVMGK8ns+46ztLWWlHegClR/iuvgH7VLGw0F5jhEC3QhMs7
 wW8F8t2kYnT7/N0DMRXCxIynZA==
X-Received: by 2002:a63:f849:: with SMTP id v9mr6360244pgj.395.1587759484004; 
 Fri, 24 Apr 2020 13:18:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id a2sm5336380pja.44.2020.04.24.13.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 13:18:03 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 gather load insns
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200422152343.12493-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de85dea9-439b-8de1-8f96-af38851f0d6b@linaro.org>
Date: Fri, 24 Apr 2020 13:18:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422152343.12493-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y4DauUsoNZ/1

On 4/22/20 8:23 AM, Stephen Long wrote:
> Add decoding logic for SVE2 64-bit/32-bit gather non-temporal load
> insns.
> 
> 64-bit
> * LDNT1SB
> * LDNT1B (vector plus scalar)
> * LDNT1SH
> * LDNT1H (vector plus scalar)
> * LDNT1SW
> * LDNT1W (vector plus scalar)
> * LDNT1D (vector plus scalar)
> 
> 32-bit
> * LDNT1SB
> * LDNT1B (vector plus scalar)
> * LDNT1SH
> * LDNT1H (vector plus scalar)
> * LDNT1W (vector plus scalar)
> 
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> 
> I'm not sure I'm initializing xs correctly. This also goes for the
> scatter store insns in the previous patch.

You did.  xs=0 is 32-bit unsigned offset, xs=1 is 32-bit signed offset
(directly from the SVE encoding); I repurpose xs=2 as 64-bit offset.  There's a
comment in there next to the load/store helper array to that effect.

> ---
>  target/arm/sve.decode      | 11 +++++++++++
>  target/arm/translate-sve.c |  8 ++++++++
>  2 files changed, 19 insertions(+)

Applied to my SVE2 branch.  Thanks!


r~
