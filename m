Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3764504lfa;
        Mon, 2 Nov 2020 01:22:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+R+QiU1GwlvEl28Im7lnlER0rPD8w0dUQt0KgzR+Z7avzhjpKCpg4i5zfWLa1ZgW+7hPE
X-Received: by 2002:aed:2b03:: with SMTP id p3mr9944803qtd.167.1604308972728;
        Mon, 02 Nov 2020 01:22:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604308972; cv=none;
        d=google.com; s=arc-20160816;
        b=fSu4m496tCOx9YE1Rz6GcAqRajXLD+idcvc6gHZw9TYlBxTDDmAORPe/LrQJJXuRmb
         KUz2CzB4hNhw6q9Vw1fRm3oxB4I+qsaig/4z3Ptu7yqpwjoEYHKZCNvjmyy4NvztDg2E
         8dhcogaQ5LxgZ2rCizsL8jXGjZyQxe347HawARIbobtIIGKGenBBJTB7k4LVeH5Y9a5F
         ailk8p93BC11+/cWR3tF9ujMvXPw9dB2VCIh8IpN7fK49wlH3jm20mEiB6jPnkt8IG0I
         WAV5z4d3My/anCbdv8nvkhqvHpi/OujzdkNbezWe57/BTLS/F5ZWTkfuIGo1p4YyGAas
         FUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=P5icln4fb7PU4PWzymKQrJYsY4r19rE4xQh+/yEcYUY=;
        b=Z/pxH71JvZNM6sVzUynK559go63xItfW4Ah7cSGgfB7DbYJaaExYnZRmYfNzKT8Nx4
         DGDPHLSrOe6HCc//pEPDhr5AUIo/SRRBHfzFNViz+snQr6hhlgKW5cPRtJSMZsWOztTv
         ulkhJAoQb97vSewUE0lD5KVw76ceq0h+HB9hciqWmf+SupbKlI/0aOB1UpJxAJPh8F7X
         On8vLQ77PREa+tbBWC/gY04yE2wNrLCmZMZJ9COxGXLdki2/9cOK9CeJO0Ske2VAeGD7
         ZQuO9jjgz4y0N7kFto9pQS1HEwfhxlTdvc2fHZyM/wI5SfULB+okmn9hV1aT6RJONKwz
         p9pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QJE7Mro2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21si3111768qkl.152.2020.11.02.01.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 01:22:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QJE7Mro2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZW3A-0008TS-73
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 04:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kZW26-00083u-Lo; Mon, 02 Nov 2020 04:21:46 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kZW25-0005BF-6T; Mon, 02 Nov 2020 04:21:46 -0500
Received: by mail-wr1-x441.google.com with SMTP id y12so13671538wrp.6;
 Mon, 02 Nov 2020 01:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P5icln4fb7PU4PWzymKQrJYsY4r19rE4xQh+/yEcYUY=;
 b=QJE7Mro2uI76EjDU96ULyor5HDREj4DuhHbqbR4YjGLz3Un19C4oXDYwt8jZfBJrPi
 whr611SmJ1+xdoOhnLwtMJZ/QAM7/XcG2qmRQqhG9t2K/5NxO7kioPAJJU1ke0rCEIWe
 kut1/HZrvvPj2/4M4Ua0bNaNfJjHkzGlZB3HKSz0hCmar5kT30hqOFh9hqBMJQArJfID
 1vxiVIG7FWmbzP4DJwkabQk6Yi/lOSvi7TkzXv7+rM9Ic14yXt+pTMOOSq9EJz7sFbak
 IdSx+JRjnGwpO8cGDKo3ZVqEtEC+qwBw6bQCJWewvK4r9jROEgNvmXN2pm0rXYOnUQP3
 sQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P5icln4fb7PU4PWzymKQrJYsY4r19rE4xQh+/yEcYUY=;
 b=pDlbgAz5BuJPAHbqVke+BfRaJc54wlqStoeyZWmc3YH3oBTH/dTdRm9FSXT9D6Md0e
 Ilq01uHYQjBbOug4ib7TStrwrMmIBVzkrvvtz4wpGd1L62mkLh1h/qqInzFH3GjPgDKg
 bJtiG97wSb3bcJllpenhozOqyh2oWNCX8vEc9vaiRWEBecraVIiQFmVJ6F/iZWK89CqP
 fM7zGkwBjogY/Y7REbKcgWrcvJkntp4UiUdW7MTF3JzPLbV8qF5Fe3cSortcUTNPd3g5
 VdHCDN96XIn1Rw5Nc4QDSARK8CvOPfuujLSkB/I9D1O3v7fepHPekw+7ENpJog8wjPRk
 2eAg==
X-Gm-Message-State: AOAM5313nfB9hXU88308Z2vFcjfUlR32gsihghwEtUTWVpQbGycCHGms
 qwZ7Ne5QhH4V2j9T8ZeHO+Y=
X-Received: by 2002:adf:f64f:: with SMTP id x15mr9747073wrp.228.1604308903592; 
 Mon, 02 Nov 2020 01:21:43 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id e5sm20422026wrw.93.2020.11.02.01.21.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 01:21:42 -0800 (PST)
Subject: Re: [PATCH 1/2] target/arm: Fix float16 pairwise Neon ops on
 big-endian hosts
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201028191712.4910-1-peter.maydell@linaro.org>
 <20201028191712.4910-2-peter.maydell@linaro.org>
 <9d6d53ba-8513-4d40-ae44-43a4a2f33332@amsat.org>
Message-ID: <89bf60e8-fc2a-f82a-0712-970becea9492@amsat.org>
Date: Mon, 2 Nov 2020 10:21:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <9d6d53ba-8513-4d40-ae44-43a4a2f33332@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xL6WS/WfwQsm

On 10/28/20 8:45 PM, Philippe Mathieu-Daudé wrote:
> On 10/28/20 8:17 PM, Peter Maydell wrote:
>> In the neon_padd/pmax/pmin helpers for float16, a cut-and-paste error
>> meant we were using the H4() address swizzler macro rather than the
>> H2() which is required for 2-byte data.  This had no effect on
>> little-endian hosts but meant we put the result data into the
>> destination Dreg in the wrong order on big-endian hosts.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  target/arm/vec_helper.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

