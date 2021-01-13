Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp215975lfq;
        Tue, 12 Jan 2021 23:53:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+2u5Hn+44SicdtwDq2WfixsnasYBH7jK3842hVvRtnBu5l0EZmc4YFjrn+ZjDmuZzvhaq
X-Received: by 2002:a25:40d1:: with SMTP id n200mr1557335yba.266.1610524431826;
        Tue, 12 Jan 2021 23:53:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610524431; cv=none;
        d=google.com; s=arc-20160816;
        b=XHPxYVNFvFRKPOduoGdsSPdMMf3ixeHh6bfX6XSUtCX4RfPXiMOzjS7m7NilBlJn57
         hT+WOCRaparBde1y4jANFkBtOYaE5DJqxWHIu57pu3CHlt3+GXkN5PtPcdwYZ71K2RrL
         qj9fMoZ8kPaqrOe/4R3owQ1zdR3+munLc34k1s2dCy0bZGhGoK/WROXp0rNIfOzXnfQ2
         jWpIfRsQqzpUV6L0FEHNMcc6iWAEoEcykAIQN3h3Ap6CZFJdTRBlOoVs31ySuv90rS5y
         fpYUxwNgkIJI7CUQqq/vuoahisrK82kkFRLe6zMgtMjaohFJyHxV4sxZJ0Qqh38Jn2cp
         qUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Y7TP/ToyRctzKrumSjXsq0lzD4QST81QsFkYS/qUk1M=;
        b=fZ2avYCrgdvl9AhTSGm8shiKR2MR8Z6V6b1+sfv5Rin99mtD+L1aDzOdVZ9f2YZaH4
         BokeuadVMsv9F2aLohiHMC0mGS/ecT5u21QWdqfBTJ9EHB7PaR2RuXCjxEBJOjN7tUHo
         JeIk54+sLxzsLp5Jwdw2MeGhRMWHtOicvg+0AD1Mvmkt7HYoO84LLIGHYt9oP0mKDZSG
         SghiEMpyrgo3MkkLPG8UPM4KWCwrhYFUaU1/NKUh6ngTyjFmk/0Pkusl80PktRoVzrud
         iXJG7Hnp8UPCb/Jd4eCwh310VFBqKKjh2vlzicPhZQN+rECBia5v6Kk9CiUoafyPORQX
         i3uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j92ieSna;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si1311935ybk.260.2021.01.12.23.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 23:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j92ieSna;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzayV-0001sT-8d
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 02:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzaxr-0001s7-Lk; Wed, 13 Jan 2021 02:53:11 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzaxp-0004qW-Ki; Wed, 13 Jan 2021 02:53:11 -0500
Received: by mail-wm1-x32e.google.com with SMTP id e25so688394wme.0;
 Tue, 12 Jan 2021 23:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y7TP/ToyRctzKrumSjXsq0lzD4QST81QsFkYS/qUk1M=;
 b=j92ieSnaEEvlHyUBI5mRV2vLmjSAcq2O8hXq4Dlyie3W1Llvkoxskfd0R4H1NtieuI
 8ORFqT67mCkFv65Gv4fZ4qYGJ/4lETB9D2OT0e2IqjC0Tats3NaOOMNW8qFFhUIp4K4q
 PSnkVUNbcTEc9WF3f1bL3PGEe/+wDze5RMAxnBeBFBDAhrudmgIG7bRtkQ1OY7biC4Gm
 J9Q9SqU1wQq7pK0loOowk44fT+ukE1lKr0I4/MUjp1K0TUSU/JN3RKNWtU1AmcC+rbsJ
 5JyQo0zo8WCXhIL93erhgqYbe9zeaJN5kfzSwpGLmiE+WKzkSpiQ6e1V8du3qyTLCmOM
 blJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y7TP/ToyRctzKrumSjXsq0lzD4QST81QsFkYS/qUk1M=;
 b=TIGKDtg0o+EPKRH4Ez4z96zHOwP67aeX3n7ACxwXa6ucmq2/V4gJ6pSRy5LoAFq+Ea
 l/IlYMfoDzmy0eViCqDc3CDVbcTyLgpBj1KJBhV/mmSmqkT/xqFXKKXi4mbm1KFobM3e
 2d8XskdJlbGIy4YG+CH506X/joh/680ABoRx3LkymRGlVXUFIygyuhPYhd0LhjL+zT2+
 x3yJPTyqQagn0b8FjAFgt2a5SqtKo2LsHHrTZ1jhe3MGv1Q04nRkTm7XYQnM82K6ttbI
 6cJV5jqBSgUnBo0pVeyt60DqdIpW9yJMnjFjfLisxARGk7P5ncuFFf5W5J52oJRkhO1H
 cbaA==
X-Gm-Message-State: AOAM531XqBnwyQAAxSdVsX5LLrCxajRflLwXpCghmBARN/wWZenSLBTJ
 xi3peKWikiDempRn+53MK98=
X-Received: by 2002:a1c:6a10:: with SMTP id f16mr893542wmc.106.1610524387785; 
 Tue, 12 Jan 2021 23:53:07 -0800 (PST)
Received: from [192.168.1.36] (190.red-83-57-173.dynamicip.rima-tde.net.
 [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id g14sm1610957wrd.32.2021.01.12.23.53.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 23:53:07 -0800 (PST)
Subject: Re: [RFC PATCH v6 00/11] hw/ssi: imx_spi: Fix various bugs in the
 imx_spi model
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <CAEUhbmVmqYzCg0Edirp4UFhLpGGWbm5jFiTjOw=0=EhnSMsz3g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <74a2566b-cd32-743f-8088-c59e992be755@amsat.org>
Date: Wed, 13 Jan 2021 08:53:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVmqYzCg0Edirp4UFhLpGGWbm5jFiTjOw=0=EhnSMsz3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
X-TUID: M2NwPCHyr0/L

Hi Ben,

On 1/13/21 4:29 AM, Bin Meng wrote:
> On Wed, Jan 13, 2021 at 2:35 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi,
>>
>> As it is sometimes harder for me to express myself in plain
>> English, I found it easier to write the patches I was thinking
>> about. I know this doesn't scale.
>>
>> So this is how I understand the ecSPI reset works, after
>> looking at the IMX6DQRM.pdf datasheet.
>>
>> This is a respin of Ben's v5 series [*].
>> Tagged RFC because I have not tested it :)
> 
> Unfortunately this series breaks SPI flash testing under both U-Boot
> and VxWorks 7.

Thanks for testing :) Can you provide the binary tested and the command
line used? At least one, so I can have a look.

>> Sometimes changing device reset to better match hardware gives
>> trouble when using '-kernel ...' because there is no bootloader
>> setting the device in the state Linux expects it.
>>
> 
> Given most of the new changes in this RFC series are clean-ups, I
> suggest we apply the v5 series unless there is anything seriously
> wrong in v5, IOW, don't fix it unless it's broken.
> 
> Thoughts?

Up to the maintainer :)

The IMX6DQRM datasheet is available here:
https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/i-MX-6DQ-Reference-Manual-IMX6DQRM-R2-Part-1/ta-p/1115983
https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/i-MX-6DQ-Reference-Manual-IMX6DQRM-R2-Part-2/ta-p/1118510

Regards,

Phil.
