Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9072142lfc;
        Fri, 19 Feb 2021 06:40:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ95djUJ8RiUv3pBckfv+bLY2CLskiAilGiJNQU4Dvudb0p7sOlVWDeBx0BzJgC7o65RY1
X-Received: by 2002:a25:ab32:: with SMTP id u47mr13686702ybi.46.1613745657342;
        Fri, 19 Feb 2021 06:40:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613745657; cv=none;
        d=google.com; s=arc-20160816;
        b=zk+VCEU9WdwCd6YVp2HV9DqPQkxe6jH0g6iNjklblbJJfVWxwqxGI2UwPSTu+a0Azv
         fIBPRT6ZrRFNoDvlfYan9DZ7b5UOST0C3/fC+8qeiuWM/5koUOlKtW1/M6qfI/p2AV5p
         8D4SwPZ40dd8ahae+73c5WUbg+V/ELssgU5N4hz7iOcGiVVrgKet0+I7ZiBuk+/eqB5O
         VKk+OLoeepG/0p+1q7M5xwMEa3YAoBAb0XIhoA88/vTjfPnEbcAoW+X/zR2pSayvM2kQ
         XFI9dN9PTF0nHQqykjD1jt098BScnHgChtMqnvje49rMhgJ3Ntu+hNTDHFoDtKxB965+
         LpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sQSovEap1XDFOcCJ1za5jK1eSide1/hIMA4nxDtTl/I=;
        b=D2AXGkinX9+4WaraNWtdbA3mSMw5BzqWO2E6JfPXi7tRlcB/YNGts6G9bqWMqH/t2b
         i1C25rA41KsViGTrfgMhspTYuSFyskkBp4EfvBCYj2480xgK0pIRsKwRM6btrSQSONyg
         5vXARfnMmKVlQ5FM/e5BS4NcgVcylTrrnFu3fC/i9oOevWImEjZpPnKrK6D7fccPKH7L
         LWKhnH3hrMB0dTQBT6gnpxOwHxVbWiUrSyg12uy54AbDKQnnXt4UG264msyNXDRagT7c
         MZV+Ywx79YpTdtz9bw0fGuE0Uri2OVUX/4ujagqL0j7v3/SJoOJcfpud7M1s3iW8J2/X
         wFLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cRHPQqFa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r133si9281079ybc.364.2021.02.19.06.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 06:40:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cRHPQqFa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD6xk-0005Ku-8n
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 09:40:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD6x8-0005K1-R9; Fri, 19 Feb 2021 09:40:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lD6x6-0000fJ-LB; Fri, 19 Feb 2021 09:40:18 -0500
Received: by mail-wr1-x435.google.com with SMTP id v1so8844701wrd.6;
 Fri, 19 Feb 2021 06:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sQSovEap1XDFOcCJ1za5jK1eSide1/hIMA4nxDtTl/I=;
 b=cRHPQqFahXp2WpRboDwVjk0ID57GvmZgSKxPSwlfBqMLBBLfN1CjXNXIWGmOD2pW77
 YlZainpv3K+PSg6TpYk0YSpN/4K7mnDLuV0LYJQknvS3Xs33R+wFwpbF+J8lU1uzslBe
 Ce0Rutra5JMy8rK3zqSYlaM48yVW6wHfsUlQ7M/O4+t7IwgSLnGjLd8OqjStuT24HMnj
 WmL6xANCzz380lyoXQcZlgYrCRl6TLNbYBobg6JCIkLH0JpzxZpCVdao976Hg4+XBkFG
 dd5Jx/GtnrKZOaKVLy5VJ2duPIqylPF98HZmUhYWwfHoAF/A3UeCGpl0ob1pBAYij5IQ
 cP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sQSovEap1XDFOcCJ1za5jK1eSide1/hIMA4nxDtTl/I=;
 b=JJaA6nXx6mwtYgwjAfIzc+kOcwljKMt1xVgJpGAdcemmIxu9YT1yPiF+pBAAOKQzRm
 XJQS+wVntStp9Yls8dwnAkUEBAeT9Snfa0hFTsygVQZyVNp3Zo8c8nXgETzvMy+Vmo5U
 KbxTP8JC9xGvD2WGjSglwMkMhNuIitQkVeE1kEJyK6rxWvBpNjvMDFn7r4slZlyECvRj
 bWqYfVRhpXYtmFLDOmneLu8+kw3ppl5cOwnOQCZaaQPNJQoPLudB9X1hi1GgC569GXfw
 kSt62aWXdtmZj0QpU+HzqIVzZ8O0Ixy3QegqzeIXKS8Vi+3HkEcQz9+O8H3YUnveTS0/
 +DDA==
X-Gm-Message-State: AOAM5329Hn6OYKUQGJs8p+F4ieTYJo4Jgi02skSkSIHEpYEirpb1VIBB
 QqeozRbhau7yE30AC1chD7Y=
X-Received: by 2002:adf:f285:: with SMTP id k5mr9425752wro.285.1613745613575; 
 Fri, 19 Feb 2021 06:40:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l7sm13934230wrn.11.2021.02.19.06.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 06:40:13 -0800 (PST)
Subject: Re: [PATCH] hw/arm/xlnx-zynqmp: Remove obsolete 'has_rpu' property
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210219115123.1938686-1-f4bug@amsat.org>
 <CAFEAcA_9nuCvVrhDZo=RQoFngpY=ZrJCOw9NQx9A9GF_BmgN+w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <10aaa327-e24c-0707-16fb-faa37779fef3@amsat.org>
Date: Fri, 19 Feb 2021 15:40:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_9nuCvVrhDZo=RQoFngpY=ZrJCOw9NQx9A9GF_BmgN+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GxvdDaDQN5FM

On 2/19/21 12:58 PM, Peter Maydell wrote:
> On Fri, 19 Feb 2021 at 11:51, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> We hint the 'has_rpu' property is no longer required since commit
>> 6908ec448b4 ("xlnx-zynqmp: Properly support the smp command line
>> option") which was released in QEMU v2.11.0.
>>
>> 3 years later we feel safe enough to remove it without using the
>> usual deprecation policy.
> 
> This device is marked user_creatable = false, so the only thing
> that could be setting the property is the board code that creates
> the device. So the property is not user-facing and we can remove it
> without going through the deprecation process.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> (maybe noting the above in the commit message).

OK I'll update, thanks!
