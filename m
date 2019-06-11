Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4457656wrg;
        Tue, 11 Jun 2019 08:09:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQcXcUH/8kFxt7RBjZpiLflyq8FzLk7Pvf8afxid8ceMiTUAh05xUAsbA+/uDTF3BGbTws
X-Received: by 2002:ac8:2cd1:: with SMTP id 17mr62990864qtx.356.1560265750676;
        Tue, 11 Jun 2019 08:09:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560265750; cv=none;
        d=google.com; s=arc-20160816;
        b=fnl78Ro2T1mUH/O58blEiJ8bSwotPkVC4YQm8xjPL62bVN0mfPgRVDqKtGGpgfSI3o
         VI6J/pAvWx2FhmI8kSV9AFw3V1/zdfpFragTS1bF5nZDDfHx1TyA0s0hS6xuDVMbYEs+
         VtsS1lmJl9h8LNQhgJQlt73Sf++m1fzsYslv0L5f54JGnNmsujkrs4z0M9AjcmHcSHzt
         Re/UlizdALQ3OaN+ugV3bBkEprkNuz6CdpWcxBzrj5BNjm5BRuPaJ/To/ycExtaw0sHr
         CI7+RZnE3A/VlII+UTY4nxfkALkqPHqoEXtAK4mMcPR4LETXb/N/V9Qygzwrg5Zg/9IL
         FR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=5hhOTa9j+6PbeJA576fNKK+wBlbYayOk4gc+6fEirqY=;
        b=pIhQJi/VCf5dz0HJ4VAA6WxU/r8uwtW5+Encm1QcZV87emuSSFlLnVuDlRFoVL2SKl
         RXViVowDGxED3ze6EVioBAMHpXINaqb6M1kIbIsRl8a+PVw1O8BYlqHWB+YEJ0GrGZog
         GPqcuBpMGdNgYW2djt6aD8jEJ1j0qozEDN8W7fC4ARBfyOoyrGDpg/nW49n8Kc+9XOy5
         Qqf3doS0D8S0X+XZbUnWyV0fkU0qW8Vaa2TkSeJ+fPhbhYi5WSWDNnXIuiJkMAaeRiRS
         sG3gflDK3Ro0J7NJKhd/G/IvFYP2baf2sBdep0wgCNg84Qel3ArvNQ1yDIs38PK+316i
         sVzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FRqjsDKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s190si2916090qke.148.2019.06.11.08.09.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 08:09:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FRqjsDKn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1haiOc-0005I6-48
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 11:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51379)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1haiO0-0005FG-IL
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 11:08:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1haiNy-00015F-Oi
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 11:08:32 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35298)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1haiNy-00013y-Dh
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 11:08:30 -0400
Received: by mail-pg1-x542.google.com with SMTP id s27so7138715pgl.2
 for <qemu-arm@nongnu.org>; Tue, 11 Jun 2019 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5hhOTa9j+6PbeJA576fNKK+wBlbYayOk4gc+6fEirqY=;
 b=FRqjsDKnDkxVsvLzgJKc0WRHEL3qClm9d/cCyMvRlqtOJz1+aTu5+XUJT0KrRL81FV
 EEEBeKQ4oiNE4BC2E3JgspIJ7E9P02v6chSYELphpnJvs6kKdKOmIiBU+MxoJ6e3jYCb
 lCK8nDH+VxyJ063Qh7nii2FFeW1fp3zcefBTkGDpPKE1iF4QmFO6G63PPpXdB+S6Bunf
 LB0uXTBnR0ZDfHpdNFVJfqfp6b53mYHyWCHgIUgTaH7L1EFwkLa+Kof2jfLrIwMe+Kgk
 Npl6yRKO3zvVNdRlvmogIENdk7k4FVzUaceYdj1JO2jBLkH7JT/vBr81y5hv6EMVgbv/
 Tiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5hhOTa9j+6PbeJA576fNKK+wBlbYayOk4gc+6fEirqY=;
 b=f8AR4XATErKT0U+VklVbAZM5UQ6QfBZOWF7m+yxV7jHX2TW0YsWqlJJkhX9ucss2Mb
 3CVksbMqC9M0eSnr7dTYg9y0297ev8PCEOCUcg+0bxL5T1zEK4CGf40/pEfkKNNKjb27
 Z+2vY59msKEzG49+0kwQcG8J5CEOsRZ9sthCx4++R90JlR+uOAlueiNUrfp2h45CytTz
 oRK82/ljhP8Ul5mC5HrKxkHL1LqGpM7FrHXF1A6AODEb8GVIkyRwgYkr4oeHdvkX7HRg
 5FXjEV03hAn4ap0BaJkzIr/EoGR0NpxYe2o0v/CwY24d8tGFkOkd76lQF8awgAWmRRF/
 CIQA==
X-Gm-Message-State: APjAAAXwooO+V2yY7HzjyS8lwVaxSo0IagBbVivGX0vRO1Kvap2XAbIj
 WxIielkBJttJXUnc5AgqIp0YmQ==
X-Received: by 2002:a17:90a:db08:: with SMTP id
 g8mr26518267pjv.39.1560265708026; 
 Tue, 11 Jun 2019 08:08:28 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
 by smtp.gmail.com with ESMTPSA id s7sm29470pgm.8.2019.06.11.08.08.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 08:08:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190611105351.9871-1-peter.maydell@linaro.org>
 <20190611105351.9871-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <10e56723-82a1-c87e-a84b-37ee4698fb83@linaro.org>
Date: Tue, 11 Jun 2019 08:08:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611105351.9871-40-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [PATCH v2 39/42] target/arm: Convert VJCVT to
 decodetree
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
X-TUID: s1a55Ckl5h8/

On 6/11/19 3:53 AM, Peter Maydell wrote:
> Convert the VJCVT instruction to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 28 ++++++++++++++++++++++++++++
>  target/arm/translate.c         | 12 +-----------
>  target/arm/vfp.decode          |  4 ++++
>  3 files changed, 33 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
