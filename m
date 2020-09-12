Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp612438lfq;
        Sat, 12 Sep 2020 01:07:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIws7U9GYcpIJvFEXKKKMKlaPoqDSNSP0p3QbBGr5OBy87EfEVCn6hU4jj64Et2CuWF9xt
X-Received: by 2002:a25:404b:: with SMTP id n72mr8051167yba.523.1599898041224;
        Sat, 12 Sep 2020 01:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599898041; cv=none;
        d=google.com; s=arc-20160816;
        b=GRff9DO/a+5UhnmsCB978C3kqG107IWAV1dVEVkxPLbcdLBb6O67B68xn+/BYEp7QL
         PB5j4n3IjVyTMHy/7g3gZ7RA95x3GqQzgOYh3RfasB04tVOtEypUqpm707OSAVQrrRCQ
         Jgb6NFFkOx73zr4KbV4rrw4fbBPAp4N4TAssMkuSLdmWPUoCt3bgjF2bwA2J/EBP8OvZ
         v/3piKy2whg3fsIJEMh46Aw+761SqTM3Ai+NkNdpIJUIvuizKqACd2WfOtnIHGpnibEa
         MswUuJAoPHa0Kx5j5Wa/exAD88x7JAibYtuAWuMnSq231yqPAaXOmTs9z1/hmxD3GGSC
         mGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=IIt2T9X0xyRXM+0XlSWeN8sXU8EnQg8GjwWbjHYzBZs=;
        b=Lf8CTEVYn36/r1gzozSpJ7oaZIhQ3ZEPQ/87yO81Az0vRb4rvYf2FbAOEv0s/UgwsR
         f3JdWGMWcsUOB5jL3h7nT4GnppEIB8FLRqFgGLWdjL/tEUAhg/dVYAEhAzCnXpN3NKKW
         xMd91Ze3I+QkPb6/kWcG8ykCLfzAzC9mXHoKPyjgwfaGJX+ABX+2pl7wu3RkKH88r00v
         CICYnAHgFVS3G01pWFz+stLgyDCmLW/vKoID3EQ/DmBMaF/BZw3HCy91RPvERfnF79e+
         qMi5uGqMFoYpBsWfEVyyWm2wj3SvVzwueezVphFtmNxlDDXWLW0gaSqGLDfI+E3D+Cu2
         dDHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LBHRhVdH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 202si4513074ybd.434.2020.09.12.01.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Sep 2020 01:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LBHRhVdH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kH0Z6-00050y-M3
	for alex.bennee@linaro.org; Sat, 12 Sep 2020 04:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kH0Yn-00050X-EH; Sat, 12 Sep 2020 04:07:01 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kH0Yl-0007zR-KX; Sat, 12 Sep 2020 04:07:01 -0400
Received: by mail-wm1-x344.google.com with SMTP id y15so6753969wmi.0;
 Sat, 12 Sep 2020 01:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IIt2T9X0xyRXM+0XlSWeN8sXU8EnQg8GjwWbjHYzBZs=;
 b=LBHRhVdHi5eRpEJrN2nqaYUl06QO37ZqTv1yKT0SLuZjnF6pTRuQEWFtTNuWMKzOjb
 PkN3AZ7gqTpk2N7aAfs0NrvgDFx21Usg1OtuOBJY/A0QYCuZIpGDmaV7ti39usO3rczz
 nA4CBlEVzAgB1+0STKxMJTsqrWPpbZQYR7bBkq/NFoPrtQlfoE0Sj8Lg1Tb5QW/RCD/P
 /dJfcCMc+huDsynp4rZHOUKJmceAxt8jPv2DvAfP6FoWdDfiTZIRJ7qfKjIvJYQe3/rc
 lcUS3yEuaD6JFu58l2laslHx8yHFZK8wZ+j8Kd2qruPdz8hIfBCMqk2BEGZBcPpJ3KUI
 945g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IIt2T9X0xyRXM+0XlSWeN8sXU8EnQg8GjwWbjHYzBZs=;
 b=ZmLcWxVpLd7PU9/8AwOxsE3oxHAFnx5R6q/ayOGMTabsJOQd9gLu6GA5fkzG9WjWEL
 x35nFXGbqO/hYeC5GsY8+eXodcA3WKX8RhWRukzzjpUgBHXF1vBmknXwxmF57eKVy4nC
 xJVDpLOuH4Y2r3hbiSXZQhT66/TO9aicNK+YHFPyCTKBAnVWZ70BMDwL8tqO6hg0QWqH
 +tn8BWpxACwGd2dd4lj9kvTucfG3Q68In3FSaqOmMDiU5B1A7G9zgFVAuM1XcTtjBHCp
 lHb1yukHtjhwrsVSneoV6fNMvxcyXAYN4dpPYRi8rCAO3DrugUMlRqDQV2F1SE+4QDtu
 ngAw==
X-Gm-Message-State: AOAM533Zr38qid9tXNeaCGjFXzznAtCZefXx2Q0Zd9ZEw6rNHah6/qPm
 CGQ7tjOriRZp0DUmNGVNZwg=
X-Received: by 2002:a1c:2543:: with SMTP id l64mr5567221wml.96.1599898016954; 
 Sat, 12 Sep 2020 01:06:56 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id b18sm9295622wrn.21.2020.09.12.01.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Sep 2020 01:06:56 -0700 (PDT)
Subject: Re: [PATCH v5 5/7] hw/misc/mps2-fpgaio: Use the LED device
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-6-f4bug@amsat.org>
 <5630d710-09cb-bc8a-a67d-b9f01308fb12@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f9137411-66c0-1cac-bac5-63d48621a003@amsat.org>
Date: Sat, 12 Sep 2020 10:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5630d710-09cb-bc8a-a67d-b9f01308fb12@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9nXbiMwQzQdA

On 9/11/20 10:12 PM, Luc Michel wrote:
> Hi Phil,
> 
> On 9/10/20 10:54 PM, Philippe Mathieu-Daudé wrote:
>> Per the 'ARM MPS2 and MPS2+ FPGA Prototyping Boards Technical
>> Reference Manual' (100112_0200_07_en):
>>
>>    2.1  Overview of the MPS2 and MPS2+ hardware
>>
>>         The MPS2 and MPS2+ FPGA Prototyping Boards contain the
>>         following components and interfaces:
>>
>>         * User switches and user LEDs:
>>
>>           - Two green LEDs and two push buttons that connect to
>>             the FPGA.
>>           - Eight green LEDs and one 8-way dip switch that connect
>>             to the MCC.
>>
>> Add the 2 LEDs connected to the FPGA.
>>
>> This remplaces the 'mps2_fpgaio_leds' trace events by the generic
> replaces
>> 'led_set_intensity' event.
> 
> If I'm not mistaken the LED device being a DEVICE and not a
> SYS_BUS_DEVICE, it needs to be manually reset. So you probably need to
> reset it in mps2_fpgaio_reset so it doesn't get out of sync on system
> reset.

Correct...

Alternatively we could see a LED as a SysBusDevice exposing a MMIO
region of 1 writable bit =) But it is unlikely to be mapped on the
main system bus.

I'll add the reset, thanks for reviewing!

Phil.
