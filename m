Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1110710wrm;
        Wed, 9 Oct 2019 09:00:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqycvACi7RtTyLsc1nO6Fu6dGBgr6gOsOLXKZu1cUQ5SgC2Qmt6GvVKdH7CFP15J0JfMHDqr
X-Received: by 2002:ac8:822:: with SMTP id u31mr4387604qth.352.1570636809125;
        Wed, 09 Oct 2019 09:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570636809; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJT6uQjFCIOtJ69ACfWYkd0trspbZbFEwXyLkXokpIExfZmGuOZ9sp471OofA0898E
         d/ZiFnIpMT2nT61EHiviGNDlGHIGPLLfjVLSkYCTeCQrefa6/lg4ArbIcIgPDFyVVZcR
         rWjurKjgHzXJ6Li8ICt0ma56fqbQZM2eUHRTihAqPcAeILfQpgLUlyLmTMohSA06WZ7m
         wBYJMwAQXvP3r46/7kOrMWxliWRmuD2jZ9ZF5mBfDdvoplwnKs4+2ayNzXE+pYDutCpp
         btxWEhtuDBtsYa6lUTmk87JWBCj/nzYAm5JpdYD5/U84a6iI0g/njnyhbrzu3uH2/Bg4
         Pxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=JOJE61qMJjGlQtnnZ9I+alSujAAfTQcuSsTU4Qnd/4M=;
        b=TdL/Kbq48wMPDXH3HLxLFU+FQmEgkvOwriu82ukD959SUz9E33adq54FDIe5IRGR6v
         Wd0+FBCPDuK+r0z1nk6Z7YH03XgaxqF5WvpYA/hcQlbaVl7Lyo40BwQw9iNRqMfAWJH8
         r6K20wGuNbfjgucThDytP2dDpfOV1An/HSx3FKO7lwRMgGGauogcw/WGmFCHOPERWlUl
         PuYo4wDHN4DSAJk/os7+3xd8VqfBo+Wm+mN8dHZ4a6X/9i/tBxVinvU+n0Cq0J1oaR+x
         aUbx3MhrL9/mh1HCpsJcLgA8Tr/2CyGsOQlJAqUx994m1fuCfQB+sjUS6rpCF3hpyn6E
         WCXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s7QgXkEq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x187si2564152qkd.117.2019.10.09.09.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=s7QgXkEq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIENk-0007yQ-Bq
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tL-0001lf-OY
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1Mh-0003We-EH
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:06:12 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:45396)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1Mh-0003WG-9V
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:06:11 -0400
Received: by mail-yw1-xc44.google.com with SMTP id x65so225489ywf.12
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 19:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JOJE61qMJjGlQtnnZ9I+alSujAAfTQcuSsTU4Qnd/4M=;
 b=s7QgXkEqmu1LXeQSwhUTTBYQL3CIDy+O93KIo0AQLTzd6bMKYy94rgF7HiEPiGazmV
 pAWibFl4h16wrsECrWfQHr9EeGZUM0fxUuWQgFm2d6lhX7D+pJnB426LLcyTG5pSEiQf
 46iWVoBOvZnNy6OAC16DVztlV7JUBgjqD1uCk4/qVAe7oSQmLgnhN/1DWx8ISQICNBq+
 VJWy6SIO4FDWfd98WxlfKzZ4n3gQ/oqTm5hJDs5UNPGAeOFxsZsmjEtwCRF/pe0spvtp
 LPM366mBETa+2m1ceoT4MHWJmkDAaMFDx7j2TOJ55uIiv7YvECYKoaaZbtl4Bl3XocCM
 9a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JOJE61qMJjGlQtnnZ9I+alSujAAfTQcuSsTU4Qnd/4M=;
 b=fomFshHWTwl8H0cFHeH3hK6+q7oQrJwIxtzvzYMjwtlPkRq3wjygHhc4PTqPP380hA
 ytseNdWqzD6XCjzWw6H7KCEk3+PMPpNu7bTsVn0JUwfxZ87onNvZ+ib/jj6tCzaQqMGg
 g8TuvFizz5fbXcnPRO40H8c/y8nRz1DCazYhE3zZbkPO/UXm/4KACeqVXu2uRwsuCdoe
 /yUn0Jitt1MfplQlVxGW0fbeKPlvWNgNgEEQA1CBLNIgEPeW0pEX52E/EEiDpCdY1S3A
 NFSgqZlrytsxlufn8xrBURFVxDRKAoPf2rjcEcGipFF4D/4lYWFxw2GU7zxWbRmPKUor
 8wJw==
X-Gm-Message-State: APjAAAXFlQmJ4+VvNxUSAKyUTdrW3QuKqiw15TCzvOrIp716mOcGKfi7
 P7f/dR/STfVooAnoIYuiUt5Zr5HBei8=
X-Received: by 2002:a81:49ca:: with SMTP id w193mr1043470ywa.431.1570586770711; 
 Tue, 08 Oct 2019 19:06:10 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id 83sm253527ywd.51.2019.10.08.19.05.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:06:09 -0700 (PDT)
Subject: Re: [PATCH v2 19/21] hw/timer/mss-timerc: Switch to transaction-based
 ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ba2722bb-a77c-0f83-602c-6d3f46193f84@linaro.org>
Date: Tue, 8 Oct 2019 22:05:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8RlWm67jZcGN

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the mss-timer code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/timer/mss-timer.h |  1 -
>  hw/timer/mss-timer.c         | 11 ++++++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
