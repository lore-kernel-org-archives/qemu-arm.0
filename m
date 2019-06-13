Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp214850wrg;
        Thu, 13 Jun 2019 14:34:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5Q2OLGj9x2OiumtYYxRT8SmLmn+IJqOa3MDny4ps+8aeZ1hPHW7ud7A9WzpnmLIVMqnH/
X-Received: by 2002:a0c:96c4:: with SMTP id b4mr5057461qvd.2.1560461683147;
        Thu, 13 Jun 2019 14:34:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461683; cv=none;
        d=google.com; s=arc-20160816;
        b=Y100zXFuRazJMnRxvpjWu5GXPAczLOqCsu7XEjfWoAiDJH4D4FCvNoq6jdXS9Bcmo0
         VYp1Zf4e+tVwrHvNFufuvi5mvQXbWtNJ0yjI91tLS9j1mVVsPYdTkvHm2g3aTsG/HWLG
         B0gYI1r9OwqkNE0soePzdZEGZ443L3fCy3k8S9E7BPbqqHzd/anYrnz2nWn0OJRA/Dwm
         0PqWwinCT+l1hYuMsci0f1KJqLrVnJ6GKOMLZzup+TZHyXe1hKjBHr+n+zUIjBKSEQrH
         YHEOO7ACi12AFtD+jC6XWBUbUALVCxYa2AAIgIrKznY8eU1AkVrp4Nx5B8neqrbiLkAm
         dhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=FWB6SwU2i6bW4tCAqzGhbgtePqP4OCVj2sI0qrB8MNk=;
        b=rpkpvn6ykpVp8G16WWTWrdyGEKFLPh0SRI+JBh33pgpyxzZyIyCTP3Nk5vivm8vnhB
         y7O/9Xb1YFkQin+lgeYei+L9OFEc/h+n5q4wnrNOldCj3CS1bI/NNz7enBIBLsiCWSkf
         SB7JXNSHW+Q9++Xzpe/Jk6LqqCcU4jPzZBwl6kZhd4Df+WZcuSck2iiHW5qKVCwF9WY3
         BI9DpQtHWf1iAegYm4jibIYmEIDgb+C1RBSOj8k9BWiqRmrhzGVxIGrP8cZ4/F6+0t0W
         gCvpRzd5qnhnOEE8e+jtRapAeFsHTLlE0Pdl12NFMPkWGbArQSEDcYZmFhqhdC/WjJ4r
         l+0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KOyZ2pUD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si451734qkd.205.2019.06.13.14.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:34:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KOyZ2pUD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45778 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXMo-0007zx-JU
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXLc-0007xi-Kr
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:33:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXLa-0002m4-7G
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:33:28 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39547)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXLV-0002k4-FA
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:33:24 -0400
Received: by mail-pg1-x542.google.com with SMTP id 196so237513pgc.6
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FWB6SwU2i6bW4tCAqzGhbgtePqP4OCVj2sI0qrB8MNk=;
 b=KOyZ2pUDanB0NS6RRTmeG17bhCEzftjYQ6FIIrOg6wGpJmZKwP18pNX3pa/3/aNS7j
 i13iWg7WhWCKI52yxOnGhLbjXzPnqAOsgAUn9+/lbYMb7SrkwBYR4RXbkjs85l7Fuzxr
 Kio8Gtthy7YkW6QyfRkf0xuitucdXcxrrPOqY8HEoFUyYZdiRziii8a4BWWJvo26lHSO
 788+mBeEs9+GrtVfNGJumpPoZYQSgpq1MQe7qn3l970mMLxbxPMkvkhYnW7mXBabB4xr
 2IvFyNDDVVyhvVU4x52CHmVbKhJc1PTJRM8Oevpl+ERk9m18EOiVWqU7OX2btLPZjCen
 7bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FWB6SwU2i6bW4tCAqzGhbgtePqP4OCVj2sI0qrB8MNk=;
 b=BGvrgygY9zfP9OdG4Dkmge5UGz7Ns6XiEEy7G3UPaWm8ifugZc/FHAtBzAX0Cvl+Mz
 DKwS6mgrDzwB47iUJoaZY+7I/stf1/D9aWh42Kaz/c6c6/Rwd3RDpWO3KYcbwQlK+zFp
 +W37MFwVfwh+m94Qo2pFl9QGQjkMkcFX0zBOtK31y63b/Vja7X6rdxZO11WJNuWXUj02
 ihNSLgD51dYmaPpM71Qw57dikBYZWIbKCv/PpkWpkkdxYqcBD0nnTeyk0ystTPZmrQ+K
 xBU2FD8zxmWjye0K26wa4Aj60GPkh2AxHxBq/0TLEsx+4ro+FflRVEHsOgTAA2S12pXn
 Cezg==
X-Gm-Message-State: APjAAAX9n5sNc+4KtWAH2MequOntYIzno662VrHOEuNkK/rLXnYs6YDX
 4EepR7T7mMZorgJfgDFhA9/mIYlxexo=
X-Received: by 2002:a63:26c6:: with SMTP id m189mr8932336pgm.2.1560461597866; 
 Thu, 13 Jun 2019 14:33:17 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id g13sm623629pfi.93.2019.06.13.14.33.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:33:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5e3ecd68-23b5-574f-79b0-53081866843c@linaro.org>
Date: Thu, 13 Jun 2019 14:33:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH 10/12] target/arm: stop using deprecated
 functions in NEON_2RM_VCVT_F16_F32
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1BgDKKxH8NJM

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Remove some old constructs from NEON_2RM_VCVT_F16_F32 code:
>  * don't use cpu_F0s
>  * don't use tcg_gen_ld_f32
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

