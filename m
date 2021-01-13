Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp643098lfq;
        Wed, 13 Jan 2021 09:57:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2Xa06xVCS3tXdUiciigtF7PjLcj1FdixgCr1X0KGuNmsfuGYrHdNdVLeumBr4y3D5nNAS
X-Received: by 2002:a25:2d49:: with SMTP id s9mr4814719ybe.65.1610560624008;
        Wed, 13 Jan 2021 09:57:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610560624; cv=none;
        d=google.com; s=arc-20160816;
        b=hsBSUdInrbd8k87K/njrqVwg5iD5uo03qlbMlPqOgnnOtF23PH5O5BWcp/SHs+phYb
         UFLL5RxFnLFInv5iRf5zXgHp5pIDnWEdUjpVpDu+FAKYBJmxS6X93CP7vUVG77cvNWyV
         i1jAfZCAPt1kZsGFhR4oEBFWoJagMA4SdEhJKp10CIBcB1nHjmzM7WNOiNHqZY8tc67+
         2gWDbI3q4V6GYZbE1+Ui3tJa3uuLWfv0N81MfjvIm4Z4GQAG7RAM9IxjXa8unoeYKsPk
         9j8/gNFKsdq9und8gHJvlbP85wZMkez8nIwe8ADRhHMFZ16neYQSH+yJ3ZXZ9rhRe/v/
         OVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KCk7TfTfwRCek4wOSD0IP+5auBOMydUqU5Lqt7Lsjo4=;
        b=chK2ULigUC9/aiC1AO+5bYjGKGveY6OCbRK+e3u60oJvG+Hy+rbM/P1V6BVXInGzjV
         GcBc6Z/jL6v3Gvuk2J2xRMAuX8720x4veuLWK09lWSopzmAdqXpJb3TRhV6IouGWclg8
         zOflUHi+I5bwTrm+yZWzRYX63t04dOI9FUyaJVTVHWWJty3+rKRB+dONNc6HczATfPdN
         6RTCzWfABPqiQQv5cbZt/8HPxuKqT/nINlawIa26sQb6LXGiyJfooFIlKOWeRqLhd+jz
         i+2qMgQ7JC/NdVtM4rq+X3ZnfGjW1nTZJE/c22KAGE3Mz+7CFReulAFCzdN8qUpOVVmA
         lV0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GcO1E3t1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si570123ybw.376.2021.01.13.09.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 09:57:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GcO1E3t1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzkOF-0000om-6B
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 12:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzkNz-0000ny-Bm; Wed, 13 Jan 2021 12:56:47 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzkNx-0000XH-CW; Wed, 13 Jan 2021 12:56:47 -0500
Received: by mail-wr1-x432.google.com with SMTP id t16so3079081wra.3;
 Wed, 13 Jan 2021 09:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KCk7TfTfwRCek4wOSD0IP+5auBOMydUqU5Lqt7Lsjo4=;
 b=GcO1E3t136W7ipN+PcgDa7+Uqb4U5X+hDR9H//PEZcl+f+6jLM/dmibSnbwmCzX5Ia
 ox/RG0oomu0Saa1GxAnsLvXlEKomo4pqcaQAZIl/wo2G8B821UupG5W8F3s1CgzeyEfh
 Bi+Fp96brtpuNRGpJ5YHgt7byvrZY7vKXAmRofEeAB9r5bxfosjTWYvy+wDsmo9FpZj9
 slEcD5ZOGgaCbJYte51bVdt2nC0mUg7lK4OJz+e09M0/Qj34Wb9lkBAq+nxCtYoWoAnw
 IqQoqQAUPLpJrrCFgLwB5bIAwjY5VKlXqR55p1mI9j8RnxOrgxz0aJZcqoh/VtopuwRe
 g4jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KCk7TfTfwRCek4wOSD0IP+5auBOMydUqU5Lqt7Lsjo4=;
 b=OCdny0MewH3N9IrRF4/ceYWDXQrXSzfqRVCuW/+/xrMV6sQLZoUdB0uUPpyagPDyGK
 Ay/4yZh9uc3Dvf6ks0DrcNK6uUVKY1nizdcJ8+Y9dAtLlrsJGFxs4Zy2TIcWIwigkqFi
 17fkWO7NTNXtj1KFh8vyXUtcI5RKf9JOPYlgS3rxlaapxLWI79qk50uw7hDVV6ZbjHnN
 gQAdBXxxpiBlQQgqAYw6BLsgn4RgP7pxwr3CYT9kNeiUazEiBz6d9BFb55AnJZakN6lG
 WBPP/FagssU+xHPJe7DJ/Di9M+T5QwULJgO8aV4aIg8Dlhy0V6qP72b2S+rcgmeerBxG
 /OCw==
X-Gm-Message-State: AOAM531hYhh8Xi0aUvDKaXVUR6NRemsB3uZeK9npcxZP5n+y2NRZIjHA
 iD94s9uz5wM3jD7csiy7dno=
X-Received: by 2002:adf:bb0e:: with SMTP id r14mr3870914wrg.159.1610560603560; 
 Wed, 13 Jan 2021 09:56:43 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id c20sm3795276wmb.38.2021.01.13.09.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 09:56:42 -0800 (PST)
Subject: Re: [RFC PATCH v6 00/11] hw/ssi: imx_spi: Fix various bugs in the
 imx_spi model
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <CAEUhbmVmqYzCg0Edirp4UFhLpGGWbm5jFiTjOw=0=EhnSMsz3g@mail.gmail.com>
 <74a2566b-cd32-743f-8088-c59e992be755@amsat.org>
 <CAEUhbmU4wDdjY+nEiqHFpFsa6H1vJVpAitSjKt1+p1POEAONEQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7c8e33c2-d86a-44ef-8d4c-0f6dcf9f7b2c@amsat.org>
Date: Wed, 13 Jan 2021 18:56:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmU4wDdjY+nEiqHFpFsa6H1vJVpAitSjKt1+p1POEAONEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iqzke3TaWlSd

On 1/13/21 2:27 PM, Bin Meng wrote:
> Hi Philippe,
> 
> On Wed, Jan 13, 2021 at 3:53 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Ben,
>>
>> On 1/13/21 4:29 AM, Bin Meng wrote:
>>> On Wed, Jan 13, 2021 at 2:35 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> As it is sometimes harder for me to express myself in plain
>>>> English, I found it easier to write the patches I was thinking
>>>> about. I know this doesn't scale.
>>>>
>>>> So this is how I understand the ecSPI reset works, after
>>>> looking at the IMX6DQRM.pdf datasheet.
>>>>
>>>> This is a respin of Ben's v5 series [*].
>>>> Tagged RFC because I have not tested it :)
>>>
>>> Unfortunately this series breaks SPI flash testing under both U-Boot
>>> and VxWorks 7.
>>
>> Thanks for testing :) Can you provide the binary tested and the command
>> line used? At least one, so I can have a look.
> 
> Sure, will send you offline.

Arf, stupid mistake in patch 7 :) With this diff I can run your
test:

-- >8 --
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -343,7 +343,7 @@ static void imx_spi_write(void *opaque, hwaddr
offset, uint64_t value,
             return;
         }
         s->regs[ECSPI_CONREG] = value;
-        if (value & ECSPI_CONREG_EN) {
+        if (!(value & ECSPI_CONREG_EN)) {
             /* Keep disabled */
             return;
         }
---

Regards,

Phil.
