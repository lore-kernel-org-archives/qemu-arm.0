Received: by 10.28.4.212 with SMTP id 203csp161422wme;
        Fri, 4 May 2018 08:36:23 -0700 (PDT)
X-Received: by 2002:a17:902:b216:: with SMTP id t22-v6mr5974293plr.105.1525448183648;
        Fri, 04 May 2018 08:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525448183; cv=none;
        d=google.com; s=arc-20160816;
        b=jo4GcEO7Xi/ajALTgGZmyNlKXwMEnIkMwkVtoU6sUlWkBxyEb6jhOcVqJ/a6WpFS+Y
         zQG7F1g9Jibc6m4KLW8MiASrm17G1FDfrLoFjmYepjVAVUYrm1GfCvNIIQ18EH67JRtc
         ka21aUoc5rqy9WVeHwp7zM1/GJYgseUBaEN4bmDkmV3fsq3K0eSZc5CS8F9In8FVviRs
         wGPZNMcsBQumIBtwOLnGeTIRpVo05lHjOXHyf8sTPoMugWqtuDVPP54n98NbJwGC07t2
         /XNeNxjLfKLp4/bXDQZ5+oNwguQG2zd1IX7xBC36e6lYjledO70Rf9Hwvte1RStZonJB
         OhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=HIgXCaEwdNYfkD2HK7j15oiWCfh1+S5nTLzZKcpaBN8=;
        b=nYhNj0Mta0sVoETDwOJUsKTJSmXP32WKxCYlI/YKvGTGkztmwA+VxFwlTSuh2nSMBk
         W/ntItmp5RTzXSmc/q2naUu30UMYHXxjqQ1kJrdurcxGbUcrRvfYhhbEQiPXOkfcpDIe
         vnrT+aHpXEL2p2c0sLpHxQgvAgtQ9O361ViS66+ZsA7g3Hq3raQkNhItfxp046RU2i71
         e8peoygd/oPXvcswCvD6DeySl4CcHM5m+0qlwtTGG//6679QfislheCQMlHowNDb0yVp
         fZNV+FOy8vABviL4ej1gAEgoPgbpT7eZnxibqv4Ji84xUdIPBPymm9mbhF57dlYrolV+
         K36Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AwX1fEq8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v8-v6sor6138902plg.73.2018.05.04.08.36.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 May 2018 08:36:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AwX1fEq8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HIgXCaEwdNYfkD2HK7j15oiWCfh1+S5nTLzZKcpaBN8=;
        b=AwX1fEq8J3gBWtPEelw3VI1gm+li6pQS04EjL085zV1bf7fV+kY+ehtS86PYgs72FM
         xy1pkdxxqg9GWlqHKNfcyEBLDxQ5PEhmCnwnfGDd7JapKu44By6X8J3qn/vpWEoorqOB
         iWEgv14cKwcySWLuP//zmAOouEiHZCU/f8ebY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HIgXCaEwdNYfkD2HK7j15oiWCfh1+S5nTLzZKcpaBN8=;
        b=Mx3uXW9Mvh61YjdDAdSY3CuOUeGcpxYfOhXZ3WRX/Eh8xgYq4h/mwIyDXIj62Fp4rW
         RmgH6L5jpwTKBtWQo1ylDZrGbEg9IfTiZlDHAjqUxHOtKGQJZwRFGbLQYDb5DRT35Lkr
         Z1KeJC0FEQQj4gVagF94x5cRWQUwipMRYo8257hvBZzDGPp0yl7tDcSP7YqzrodAQmOl
         HwSREb8urR8iM7gRcwq3HkgJikTNY/ANdTXtbKVs6H8CLdy1mlW00pnsfuszptGtksfE
         Agz3+lzMZFSNYV6amtCo8lPbsgp8rnjdDCpnKtKz7wfAUPB6XHT7h6Y3OsQ+hldRt+5Z
         9RjA==
X-Gm-Message-State: ALQs6tAkJ31WUOIaZbeejWQJWxgaToYpbpuSpeWx6EUigEPdsuKKU1CN
	9PNOg0y7ydsY3bT9APn1JB/jYa9Y
X-Google-Smtp-Source: AB8JxZpGPev9BWfhuVfgndNjkCSunibBnOn9LEKy44tvXNRXIobZaql9zOrz7wswm1rpfF/6uJu60g==
X-Received: by 2002:a17:902:1c7:: with SMTP id b65-v6mr28264344plb.298.1525448182994;
        Fri, 04 May 2018 08:36:22 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net. [97.113.2.170])
        by smtp.gmail.com with ESMTPSA id c20sm15571549pfk.63.2018.05.04.08.36.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 May 2018 08:36:22 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] fpu/softfloat: support ARM Alternative
 half-precision
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20180502154344.10585-1-alex.bennee@linaro.org>
 <20180502154344.10585-3-alex.bennee@linaro.org>
 <CAFEAcA80vTz25WHGKteTU3nxSi2fUHN8dp+z8paNP03conAghQ@mail.gmail.com>
 <9549d686-899d-7b3b-dae3-d3cc22528e50@linaro.org> <87y3gz8v4u.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a65d185a-1cb8-727d-1f44-5b3a1cd910a6@linaro.org>
Date: Fri, 4 May 2018 08:36:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <87y3gz8v4u.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: JF5ZrrmRAQVD

On 05/04/2018 05:26 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 05/03/2018 11:17 AM, Peter Maydell wrote:
>>> (target/i386 notably does not do this, we should check how
>>> SSE and x87 handle NaNs in fp conversions first.)
>>
>> Hardware does silence NaNs.  I tested that earlier:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg03114.html
> 
> Does that include SSE?

Yes.

> I know the hardware will silence NaN's if the
> value is ever pushed into an x87 register (as GCC will do when
> spilling/filling float).

Actually, loads and stores are purely bit operations that do not modify data.


r~
