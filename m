Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5571599lfa;
        Wed, 21 Oct 2020 03:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUkPgD5lDmTjtXtv1I5hjh9YlRmldnf36Hs39pEameh40Y1xiPeNTI3au71neEbM2U7ElO
X-Received: by 2002:a5b:b86:: with SMTP id l6mr4018376ybq.258.1603274891939;
        Wed, 21 Oct 2020 03:08:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603274891; cv=none;
        d=google.com; s=arc-20160816;
        b=aJEiM3QpNz/7MMIMjvKt9t8GR1OYKMMXJHSQe3kVIryMwScumFU+FgmfY5FjW74Auo
         Lknn6NHqmoDUDmgtI8ow2R3whN3+LOX3LtxqFCqVvAjKTkBErHxmIZIRCeNUeIEuDG1f
         VUcnM9veebUF9dUJigfax/wai6993MVFpuJr+pEUzrMaeP0BJGLwavcI+KZ/ZL4EM4q/
         TljWDzKKGE1ldCQvlopg94eN7vAHF9X4cErkXHGazcVDn8vhoEAM4GLASz+0ub5afoxR
         R6fKomWLGUgN2OD4PDDUGeAJAUZzSUdMWMb3A43UC0mAGKWbIkDWxPbxcS14i8j9CT+y
         mbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hLGyuiHrDp/2Z+PZgBWHYpwiNi7leOuhJtGLXUFdT08=;
        b=nNKZXcRyLz+tDR+CP2h+wUVATaoi5jg4cZsNjOptfvhMDYBz+zcN1QmAJSVlUUb6Ee
         wVyUrM7ud5ma00jd0IT3oKVDT5901o1dYXEkyaz6vMFFskA5NgTeLBXBf6EMohFRwXHG
         iq+uA9Nmt4F9A+gDp1M5iuUP2XAGnP3z1HMeaJkSpmDoCGgoSkmtenVzx9NIY+zl6MKH
         IttVh1aDWMaPgM0gJ2v7yz+5DnyD2UeJmpoKxHQdtLvv3bDv/oqW/5tNQ6+IjQWpU+y5
         lau8FIRoPzA6wqW6lbY3R0Qq9Wdyk85TQ/7YVgv19mgJ4fK7IyMLOjPbAqjLAO6Pp4Im
         zgDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pQ7ygtCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j134si1834376ybg.406.2020.10.21.03.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 03:08:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pQ7ygtCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kVB2R-0000Bc-AY
	for alex.bennee@linaro.org; Wed, 21 Oct 2020 06:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kVB2H-0000B5-32; Wed, 21 Oct 2020 06:08:01 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kVB2E-0001zJ-MN; Wed, 21 Oct 2020 06:08:00 -0400
Received: by mail-wr1-x443.google.com with SMTP id e17so2285296wru.12;
 Wed, 21 Oct 2020 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hLGyuiHrDp/2Z+PZgBWHYpwiNi7leOuhJtGLXUFdT08=;
 b=pQ7ygtCBiqNjRhGzroxr+76M45Sij2EhhkLkBvQuIoyAFVrlj+9U+DzbGycHMYmZxq
 hSVMwyNRq7a5szQ9CnvmaYh/m1KZOl6k6lLG2bZv+ZoTMx0g9afRXdclUQSNFd/nFB+i
 9rkTGXxr2FMYTXO8ssdHAHzRDoINimrzfLswOChRD+tpiuMmtbMUglZD6M9rsmkUzjIK
 uBiZVZJ0kM9GM85k0xvXAgHhrFyf0j6ahLrioUt2Omp1LZFIf53TMcm3GiLTXqIW3KEe
 ZjLY4mgpIrtnB92AZO+NzotA6hjz/u+wpaSOvTFHKkUcp6xjJLEb/l3KZ9Dnv8JWYf1b
 DnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hLGyuiHrDp/2Z+PZgBWHYpwiNi7leOuhJtGLXUFdT08=;
 b=OCrV6Gi2XRqiduFuMLN/LjHbRG1rxJVaQSxvEukJgpddCVR4MDarNDQEymKi091ixG
 OSleBhou9XhnqZD3i6AJ+TOyDNaCrSgAQL9dfgOgLXFnomdWX2jXTTlzp6CnUS2o/vbU
 UC+aTxva7B3JZQEgdMmdNPnoAxAeUvi4co235zR/MBYz81RPPRGSHnxWVxRrI/uBBNGs
 XiF6kZ7ABsnjDYRccEGVP0YDu7nmI1tSFe/fST6P1PAhVxYN0yIRcE38e4bqv5JcaBom
 vExWpNIfC3mzRaoOL05puwsbOvn+C8vlNo+RQYvQjS0cxEODnulNiHTqNgE+Ms7UJyqr
 ypvQ==
X-Gm-Message-State: AOAM531I2s3en8si0yYCYJNE5VEITLI04GO4ece/gOPbEISi1RxoArvG
 Zun+e9vV2fnVKgr3mR7hXFY=
X-Received: by 2002:adf:e94b:: with SMTP id m11mr3722553wrn.35.1603274876391; 
 Wed, 21 Oct 2020 03:07:56 -0700 (PDT)
Received: from [192.168.1.36] (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id 10sm2635331wmn.9.2020.10.21.03.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2020 03:07:55 -0700 (PDT)
Subject: Re: [PULL 22/23] hw/sd: Fix incorrect populated function switch
 status data structure
To: Bin Meng <bmeng.cn@gmail.com>
References: <20200821172916.1260954-1-f4bug@amsat.org>
 <20200821172916.1260954-23-f4bug@amsat.org>
 <e378932a-1de3-83c1-834f-ae6526604cb7@amsat.org>
 <CAEUhbmVFZ8aWdv48D8acdfFRp6WMYL6n=ENeo4hBZfmqE9TrDA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a0ac3805-ec48-2a0e-6511-b142bfc6f214@amsat.org>
Date: Wed, 21 Oct 2020 12:07:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVFZ8aWdv48D8acdfFRp6WMYL6n=ENeo4hBZfmqE9TrDA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Walle <michael@walle.cc>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijpx/skSlCY4

On 10/21/20 11:57 AM, Bin Meng wrote:
> Hi Philippe,
> 
> On Tue, Oct 20, 2020 at 11:18 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Bin,
>>
>> On 8/21/20 7:29 PM, Philippe Mathieu-Daudé wrote:
>>> From: Bin Meng <bin.meng@windriver.com>
>>>
>>> At present the function switch status data structure bit [399:376]
>>> are wrongly pupulated. These 3 bytes encode function switch status
>>> for the 6 function groups, with 4 bits per group, starting from
>>> function group 6 at bit 399, then followed by function group 5 at
>>> bit 395, and so on.
>>>
>>> However the codes mistakenly fills in the function group 1 status
>>> at bit 399. This fixes the code logic.
>>>
>>> Fixes: a1bb27b1e9 ("SD card emulation (initial implementation)")
>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Tested-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>>> Message-Id: <1598021136-49525-1-git-send-email-bmeng.cn@gmail.com>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>    hw/sd/sd.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>>> index 7c9d956f113..805e21fc883 100644
>>> --- a/hw/sd/sd.c
>>> +++ b/hw/sd/sd.c
>>> @@ -807,11 +807,12 @@ static void sd_function_switch(SDState *sd, uint32_t arg)
>>>        sd->data[11] = 0x43;
>>>        sd->data[12] = 0x80;    /* Supported group 1 functions */
>>>        sd->data[13] = 0x03;
>>> +
>>>        for (i = 0; i < 6; i ++) {
>>>            new_func = (arg >> (i * 4)) & 0x0f;
>>>            if (mode && new_func != 0x0f)
>>>                sd->function_group[i] = new_func;
>>> -        sd->data[14 + (i >> 1)] = new_func << ((i * 4) & 4);
>>> +        sd->data[16 - (i >> 1)] |= new_func << ((i % 2) * 4);
>>
>> This patch broke the orangepi machine, reproducible running
>> test_arm_orangepi_bionic:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg739449.html
>>
>> Can you have a look?
> 
> Yes, I can take a look. Could you please send more details on how to
> run "test_arm_orangepi_bionic"?

Looking at the previous link, I think this should work:

$ make check-venv qemu-system-arm
$ AVOCADO_ALLOW_LARGE_STORAGE=1 \
   tests/venv/bin/python -m \
     avocado --show=app,console run \
       run -t machine:orangepi-pc tests/acceptance

> 
> Regards,
> Bin
> 
