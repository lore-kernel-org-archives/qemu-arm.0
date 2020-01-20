Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp315509lfp;
        Mon, 20 Jan 2020 07:13:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyah0qp4xOyOVvg6QGa/zaHHJWsyr+f3koTrqTMfqcvBSVqqDkcOW6nSlPkUkuJcG/avQFc
X-Received: by 2002:a17:906:728b:: with SMTP id b11mr21306335ejl.126.1579533233017;
        Mon, 20 Jan 2020 07:13:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579533233; cv=none;
        d=google.com; s=arc-20160816;
        b=KGLJk02mWxWYPvSV9M0qYFqemUDh/wafee01ZHTk/g6o+YePrjGPUApQUfWIdNNRym
         w6b9V3gdTgRj/t6UVWshvaGXtAD4y/h/o9O6s5hCr6TblnCEPCZzGudiRBKNjHlED+Xz
         qrMgf00EfleM8LgxUlXBKWIti20JtII8uNvpWAZ0uDt7tYlCBjognrDYRQg39nTiXmdj
         cGc8kwqe0Hv/mqdaxgyPfEshGFkxEI4lV3EMFypNjKKZ09rz7tnsVT6E3yHuS5RWa66w
         N1XLj8tqQypv4N3pZGi2t68dK5TPZSvayFTNn/Wfu/kmMH97i9Vf+oWh/cXMp34146Td
         PHpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7wmGLD3FxzDo4Qx/leRHIRfy/hhT4P6n4YaMsQ4AyN0=;
        b=ehIqBqutMJ5zaFX/BwtMmKfxdW5JISQ5XvKoWhXjtVTu8VPHUE4FDiJL00H1uWPmiz
         9RmizycKjiOisTAxJOaf9arPu0EJli5LNXmoyq5eKz5gcrX3efRyi1IIQyXo+UVZNlP7
         FOXLgJzAxQFRAp3cCV9tHXax44nC/cPolDv392EFnGR/z8MesZ0BfblUBXn/6TrVWzqi
         oFnzjnYE76yK1VzchL168lZR/BYLhVE7aiOU7LA00Ky48SXcxLjuqdPZ4D2lU8NN76ET
         69mQ4kFO8dCWM9t1nu6JAabvowQwrTX6oqgt44pJRxoU5vXevqHaiMhNYhZ5JvJWbzYw
         VACQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gakwTrm6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si22904126edx.311.2020.01.20.07.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 07:13:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gakwTrm6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itYkR-0001v2-E4
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 10:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47461)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1itYiT-0000EM-NP
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:11:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1itYiS-0008L1-7B
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:11:49 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:41980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1itYiR-0008KW-VX; Mon, 20 Jan 2020 10:11:48 -0500
Received: by mail-pg1-x543.google.com with SMTP id x8so15682117pgk.8;
 Mon, 20 Jan 2020 07:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7wmGLD3FxzDo4Qx/leRHIRfy/hhT4P6n4YaMsQ4AyN0=;
 b=gakwTrm6YofyPH/0EjTZtzRtzAQVDPCnBBbuqh4/L/lpF4X4i4nt+Zf3sPCUNk7APd
 3VJPRYk1cFjMOUKQQJUj4BXJEX8hkmT2sq0FhkmNGzVNaLxhs+jKgTx59NO/5UQL4QtM
 I0KgOYGMARZUXo5PUIfZ7PQkn3z489LlJ+8UuLm8OEtILOcRNX7KDJqrwkOUG23r1Dbj
 lw7Z+DoupzTJVQXPxqnBYU84Dw1yNqcJJsZpt96cjhDMrF/duFKZ02WO6MSIhqDoLK8/
 Z4+pWiozTSFROY1eb7GWt8dPKSVpPZ20TOZx8mf4TNVhDehXZ8K1cOwPvr2b9T8ti4wX
 iPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7wmGLD3FxzDo4Qx/leRHIRfy/hhT4P6n4YaMsQ4AyN0=;
 b=MFkmHIaiA33OEH+SGkU7VuRmy78xifN6ywpw8VQesdvw2bDNRLDKeNAlCI5h5NvVPG
 O3BXT/070/B3EonHsW/XL86tWQ/cURT3QaVFJ3UEIVHm2FLnLcf1NJHMqVbIFJaq/zG9
 9Q9vIPDR5I8pmVoDT2CyOGoOE/PlGH5DZXO+4Z35oanH00lVHrQx4cc31JHt0JfGL92q
 1Da1hLPfEOwKJE7ohKasslSadlS4weOOmN5izNSj/R/wVnXbxBJEzyRsPerSevHo9L7W
 WvaxL1WR1fCpkJqZWRblohrFP8vS5m+kH2HLTozY0PF4pgH17w9PopzvSJ6WaBxgUF0R
 PwWw==
X-Gm-Message-State: APjAAAUUm38npFF2n/crhzvwii0QJcDtEW4danJJjkNXfK+TThVOnmWd
 YLGGgT9jreoT6MWjupuae1gfhJsA
X-Received: by 2002:aa7:8096:: with SMTP id v22mr17570821pff.240.1579533106552; 
 Mon, 20 Jan 2020 07:11:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 a2sm37978328pgv.64.2020.01.20.07.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 07:11:45 -0800 (PST)
Subject: Re: [PATCH v2 2/7] hw/arm/exynos4210: Fix DMA initialization
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-3-linux@roeck-us.net>
 <CAFEAcA8yH8deTL6PrX42Lh_TbR=gx4QbukuKUOo1XgLod=2ZXg@mail.gmail.com>
 <526c74cf-bbaf-2c79-08ec-9472288aaa59@roeck-us.net>
 <CAFEAcA8j=RnrBcoJzpYJZcLUgyq4N-o7TVKhutoDR27idUu-1g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <aae690a7-d580-e08c-c8cb-5aa6b30e5c2c@roeck-us.net>
Date: Mon, 20 Jan 2020 07:11:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8j=RnrBcoJzpYJZcLUgyq4N-o7TVKhutoDR27idUu-1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9qqLvAdgewbe

On 1/20/20 6:46 AM, Peter Maydell wrote:
> On Mon, 20 Jan 2020 at 14:30, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 1/20/20 5:35 AM, Peter Maydell wrote:
>>> As the comment in or-irq.h notes, we can safely simply bump the
>>> #define value without breaking anything if you need more input
>>> OR lines than 32.
>>>
>>
>> Yes, I noticed the comment, and I did that initially, but then
>> I noticed the complexity of actually doing it in the code
>> increasing it from 16 to 32, and decided I better leave it alone.
> 
> Yeah, the conversion from 16 to 32 was hairy because our
> initial implementation made the migration-compatibility
> awkward. When I wrote that conversion I was careful to
> avoid creating a similar problem for my future self if
> I needed to bump the value again :-)
> 

Ok, with that in mind I'll add a patch increasing the limit.
I'll set it to 48. Then we can discuss if the new limit is
sufficient/acceptable ;-).

Thanks,
Guenter
