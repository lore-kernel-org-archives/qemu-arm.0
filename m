Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1205671lfq;
        Sat, 16 Jan 2021 08:04:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyba0uFse5cFhw2afm0pGRHAZ7N+aulIURb7TUhLm+2enU2kyOZgc5AuAk6lJvrasveqKot
X-Received: by 2002:a5b:610:: with SMTP id d16mr754950ybq.507.1610813093882;
        Sat, 16 Jan 2021 08:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610813093; cv=none;
        d=google.com; s=arc-20160816;
        b=xRSjXTRL4tHPSg/5IBy5a1+BO3tT9mfOMmbNrJ9VuV+43u6+Iy04qAgTOWHDTSx+cl
         I7MooW5kgXypwfvfcvpCTljwSfLeLfE40qPDLPMk09ord6NmUMe62WDFh9/gCYGbVBLU
         ryfS7hNFgXcfvmftOD0D7AMseHXUTbX7bOzqNNnCBDEoIzv8q0YWjuMr2+G2Shykr8oI
         kaJ0msXTSMEeLJtRaS4fjRtcTiUDg6w8U1fNWGK0ONTjwo8gZIu/OMmD20bLWvZxtKCY
         WNOizK4FHkbIpVjygDyp94b7/ZNYd7LGGpwO2wCJFU7UbTgatfFJxJIAjqHm8yv/i1iD
         dsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ZjPbJg3XfI2Oq3s/+61+tvtAFHWI6eDfktdagW1X7IU=;
        b=ZsGIMqkz6S+cAjgRMCEfzPqZG6eG9jYGvPU+P/eOfjSwtLJGlGnJ3Coi/D81jX6iLZ
         LJwSKkOE+W8Pdnu+JAP9g5ph4R3i7TNvPwkBMrjnT4MsYJNn/J1CAFdwklXk0syyz0lt
         xwlyGUn8a0S/5/dCVJlkURsok5j2jcBwi6rRJNAO/ZhRolj6JTOwqtW0+43y3cu3vtVs
         JSOvVyVYPCW4n6EzIsswsiE7qh2u3m9r4G9V0+0zlQTdrR8LldZHcLkJNoT/pWaNswAe
         5PxL9vbYGUsrCHJZ3fI+4cJk9Hu34O8RO0fBoIZPojNRH8MGjjeopFlyQ9i3OREac4qc
         pvMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lZqZIqvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e59si11523261ybi.158.2021.01.16.08.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Jan 2021 08:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lZqZIqvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0o4L-0000Jp-9T
	for alex.bennee@linaro.org; Sat, 16 Jan 2021 11:04:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0o4B-0000J0-Pm; Sat, 16 Jan 2021 11:04:43 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l0o4A-00048C-1u; Sat, 16 Jan 2021 11:04:43 -0500
Received: by mail-wr1-x432.google.com with SMTP id d13so12241544wrc.13;
 Sat, 16 Jan 2021 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZjPbJg3XfI2Oq3s/+61+tvtAFHWI6eDfktdagW1X7IU=;
 b=lZqZIqvCjRs/NnPFt8fkgzZoqXgOe/ojnIJ9fmc0N04y/X+mt5T1CZJZJFIsyP/K59
 Tr0oqQXEjGSqc9TLPwu5YABop6aayu1EC4ngTddmNWDfNOLOcJ7X5gRhyVXPwst7DbTX
 qoY37NZOr+QmcE/7xFANHaRLnf0pO/MuJ4fafpKnrkcROO+0JJ9KZKqZ7LChAz2cfoKo
 V/HCAGKu8oTiJzh5CSY25diSeHpBhwAyKJaT0kzyMJxXPKlEuB0FYRYJ/ngFYNiuKZRJ
 +GURIkd27B3KHo3sbb3OwCDYxyJOdurdUATMV/IjcLHUja6PqXOz1Ao8Svz2PuvMKn5b
 zI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZjPbJg3XfI2Oq3s/+61+tvtAFHWI6eDfktdagW1X7IU=;
 b=joaKh10H0f0YR5pUXY+wGt+CJDT1l9Z+5qXwgJiLKCGNiZnYf0drpXdjhl4iJPTrbA
 bzsUdurbGqUp26UGyPiEFWR/Bt/o+khGt5xq8Rfyyn2LnpkwGuW4ISrD8O5/JZfmRooE
 5MKsSD/4wQHo2skE93UFQRxxJMi17zf83YlNAT50KXKNWA2PMH14193c5a2wQVCY7PSL
 pUOirUojHs1JFTP5Pou4CJPjUelY64ip0WHZLdTyXCs1GziUbexbavdPWxBUiI4DIZ0v
 K76QJ1TDvvrbnRrMi7dHs87dzsDkBsmMSy/ba3KSD2K9tYvDoN0um4eHf4cbzuXOj94q
 oz6Q==
X-Gm-Message-State: AOAM531t1TmEaozlXEjuHTttNEOpHa49gAZo51ZT+wQSnmTSEPsmIxPE
 nzOq3WFS0sIfCrtoYi4aAq4=
X-Received: by 2002:adf:f70c:: with SMTP id r12mr18529589wrp.234.1610813079438; 
 Sat, 16 Jan 2021 08:04:39 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r20sm21884665wrg.66.2021.01.16.08.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jan 2021 08:04:38 -0800 (PST)
Subject: Re: [PATCH v7 4/9] hw/ssi: imx_spi: Rework imx_spi_read() to handle
 block disabled
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210115153049.3353008-1-f4bug@amsat.org>
 <20210115153049.3353008-5-f4bug@amsat.org>
 <CAEUhbmXJqF442vLcjm=g4TCJCOAybxxkE5cxKqpkPh=rRuGLZQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <56ae54c7-5608-9670-af2f-8357e3acd214@amsat.org>
Date: Sat, 16 Jan 2021 17:04:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXJqF442vLcjm=g4TCJCOAybxxkE5cxKqpkPh=rRuGLZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.039,
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
 Juan Quintela <quintela@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2L9qY0KiovAu

On 1/16/21 2:35 PM, Bin Meng wrote:
> On Fri, Jan 15, 2021 at 11:37 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When the block is disabled, it stay it is 'internal reset logic'
>> (internal clocks are gated off). Reading any register returns
>> its reset value. Only update this value if the device is enabled.
>>
>> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
>>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/ssi/imx_spi.c | 60 +++++++++++++++++++++++-------------------------
>>  1 file changed, 29 insertions(+), 31 deletions(-)
>>
>> diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
>> index 78b19c2eb91..ba7d3438d87 100644
>> --- a/hw/ssi/imx_spi.c
>> +++ b/hw/ssi/imx_spi.c
>> @@ -269,42 +269,40 @@ static uint64_t imx_spi_read(void *opaque, hwaddr offset, unsigned size)
>>          return 0;
>>      }
>>
>> -    switch (index) {
>> -    case ECSPI_RXDATA:
>> -        if (!imx_spi_is_enabled(s)) {
>> -            value = 0;
>> -        } else if (fifo32_is_empty(&s->rx_fifo)) {
>> -            /* value is undefined */
>> -            value = 0xdeadbeef;
>> -        } else {
>> -            /* read from the RX FIFO */
>> -            value = fifo32_pop(&s->rx_fifo);
>> +    value = s->regs[index];
>> +
>> +    if (imx_spi_is_enabled(s)) {
>> +        switch (index) {
>> +        case ECSPI_RXDATA:
>> +            if (fifo32_is_empty(&s->rx_fifo)) {
>> +                /* value is undefined */
>> +                value = 0xdeadbeef;
>> +            } else {
>> +                /* read from the RX FIFO */
>> +                value = fifo32_pop(&s->rx_fifo);
>> +            }
>> +            break;
>> +        case ECSPI_TXDATA:
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "[%s]%s: Trying to read from TX FIFO\n",
>> +                          TYPE_IMX_SPI, __func__);
>> +
>> +            /* Reading from TXDATA gives 0 */
> 
> The new logic is a little bit non straight forward as the value 0
> comes from s->regs[index] which was never written hence 0. While the
> previous logic is returning explicitly zero. Perhaps a comment update
> is needed.

You are right, if the device is in reset, it will return the reset
values (eventually 0, I haven't checked). Simple fix could be to
better place the imx_spi_reset() call in imx_spi_write().

Since we are discussing the reset bit of this device, I wonder if
it wouldn't be clearer to use the the 3-phase-reset API then...

> 
>> +            break;
>> +        case ECSPI_MSGDATA:
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                          "[%s]%s: Trying to read from MSG FIFO\n",
>> +                          TYPE_IMX_SPI, __func__);
>> +            /* Reading from MSGDATA gives 0 */
> 
> ditto
> 
>> +            break;
>> +        default:
>> +            break;
>>          }
