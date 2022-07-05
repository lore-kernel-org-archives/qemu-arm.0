Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3720609lft;
        Mon, 4 Jul 2022 23:49:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tKBrl5kqE9cvH3qsn5UJeq0PBnAB3SigpcC8hGTrGzdxq0zdnd5o111kVPcpf95Ja6IWdm
X-Received: by 2002:a81:1587:0:b0:31c:82a5:ff0f with SMTP id 129-20020a811587000000b0031c82a5ff0fmr16877452ywv.152.1657003761448;
        Mon, 04 Jul 2022 23:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657003761; cv=none;
        d=google.com; s=arc-20160816;
        b=Eoa9UslPwb5CZUP9cGHCoKHsmwz4uP7bOyXEUdG0ndR3YSs4C247hLskNjRRm6iKLL
         QSfLMbvZeeLUv9R3cPnT3dQzzhRYkHfyCDyLZgLXEmPgWJcdBISsD88Y1odVnfPgTfVu
         N2EMjjZsGNjffbJY7qaxOOqqBZ8TC5uxVI4nrTzArwYI658saLOjGt5AIk/jd3PE6W6I
         Qy8QwuvQt1xvHJ48CXR/vMknXPWzGfOtRwktJyb9bKAShQy1BludFmfIqX+0StAe+z1i
         ph+A8q4UmFwU6Z0+Bh3e89NF2V4xNb3z1jUSnRq4wHYo+Q+IETY+6s0q+a1Le1idwc0b
         2G1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3FvGtyERChTZuvu+vh4EyPEVLkniNQ6HiN9PUfRbr+4=;
        b=gNz53+S1yA2G7cTBnHbWDvocIkyPmoGyC4QPXwu9YL2yK7UOXEsWDvO3Kswj0AXby9
         yylJgOgclz3qPE6IBcjBIlrkL1/9CeQ2K3dfVu3ux7D/wHk79FVaLHtcS2ylWuyoesK1
         vFwJz3k0YTmyxO8KsShDQbmb8oFE09Im3GPAqgeGnqmaLjnnYVIwuF2jFPLev4y9xZeu
         luq8C9lhWjVdqU6aQ/syZ6+EkbfMT/NqDnxnk1VWnCZUv5sIRcNXEwpvV4qKpV/VZs7y
         LqkaXR2C0yRq1I0R5imgS5s16mJOG9YW0NjwfdDhfmDqzjcV9xbhmfJ0cjJsOk/4pnOw
         asjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=txa2fQPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i129-20020a252287000000b0066e6d58b648si1634255ybi.640.2022.07.04.23.49.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 23:49:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=txa2fQPU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:34076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8cN6-0001vI-Rd
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 02:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8cMs-0001uk-2K; Tue, 05 Jul 2022 02:49:06 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:59616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8cMn-00055k-6j; Tue, 05 Jul 2022 02:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3FvGtyERChTZuvu+vh4EyPEVLkniNQ6HiN9PUfRbr+4=; b=txa2fQPUdaeJgwT1Jfg2vnZQRE
 MVl+BJ+bIxPJjVR2prb4AfPCNlrxVjNMP2AMZ7A4c9lEBnZgt/H53dabZPLkLvkoPOOSkl4O/8k5L
 rVrYldk4rDpfS27rtJSIb0j1mNrjtvsW9+3VHoRfUtHjvB/1XacqDkWxv8R7jV78YC57nuQRhXA+s
 prgIQtUV6Sc+/+26FOYVgFAaTbqkkdkaXPpSGboCcdHMYkXX1ILW7XaLjK1IwUexPilfMevDHWG7z
 bOLGZqNFU/ElhGfsSoD3AOYDn9VbxqR/n2rROmjZga3qMCsIaY1GodBIbYQYU/9bGUYmeM25RO6ec
 8wPrkQhR4Ir2N3yVD620q5+WB2nktzmBnipysGWAglzesQxXp2Zscruecd9bHRHMo1pWMuySFAUjh
 k9vgzCxo2GR2HJyjogRoP0KMeOiQgyhcechEZ0Bn3tzQziW6AIZ1tkxs77oq2+Y5jHV/fTRcezcZp
 ugNnoVLYmP3Cv3ovSM5VuUxKyMQ9dkbf5Fj+f7Yp1xS4F4sT0I1O+3mpKjhFC6qZ1rjgv7ny7YNFD
 1KDJGUeOeBz6ZR38ov9qA3Yx3GqRbvjYP6Q6ksR7ALVjMDRfQchySgbcA3LQAIHkinBypcjRMmBN8
 Ld86p/eVIfL5Bv5SFUjmu/JZqqxui+mIfsGkVBy+Y=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o8cLJ-000Apr-Ki; Tue, 05 Jul 2022 07:47:33 +0100
Message-ID: <becf7d89-3d40-b40a-aeeb-9d99c79ef7a0@ilande.co.uk>
Date: Tue, 5 Jul 2022 07:48:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-35-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA-D6GhmGA=Det6PGvXC-sup7pKa3KoBsUHtBkK5e1K_Eg@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-D6GhmGA=Det6PGvXC-sup7pKa3KoBsUHtBkK5e1K_Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 34/40] lasips2: update VMStateDescription for LASIPS2
 device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9aynf2vJNrw+

On 04/07/2022 14:38, Peter Maydell wrote:

> On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> Since this series has already introduced a migration break for the HPPA B160L
>> machine, we can use this opportunity to improve the VMStateDescription for
>> the LASIPS2 device.
>>
>> Add the new int_status field to the VMStateDescription and remodel the ports
>> as separate VMSTATE_STRUCT instances.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>   hw/input/lasips2.c | 25 +++++++++++++++++++------
>>   1 file changed, 19 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
>> index e602e3c986..ea7c07a2ba 100644
>> --- a/hw/input/lasips2.c
>> +++ b/hw/input/lasips2.c
>> @@ -35,15 +35,28 @@
>>   #include "qapi/error.h"
>>
>>
>> +static const VMStateDescription vmstate_lasips2_port = {
>> +    .name = "lasips2-port",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(control, LASIPS2Port),
>> +        VMSTATE_UINT8(buf, LASIPS2Port),
>> +        VMSTATE_BOOL(loopback_rbne, LASIPS2Port),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>>   static const VMStateDescription vmstate_lasips2 = {
>>       .name = "lasips2",
>> -    .version_id = 0,
>> -    .minimum_version_id = 0,
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>>       .fields = (VMStateField[]) {
>> -        VMSTATE_UINT8(kbd_port.parent_obj.control, LASIPS2State),
>> -        VMSTATE_UINT8(kbd_port.parent_obj.id, LASIPS2State),
>> -        VMSTATE_UINT8(mouse_port.parent_obj.control, LASIPS2State),
>> -        VMSTATE_UINT8(mouse_port.parent_obj.id, LASIPS2State),
>> +        VMSTATE_UINT8(int_status, LASIPS2State),
>> +        VMSTATE_STRUCT(kbd_port.parent_obj, LASIPS2State, 1,
>> +                       vmstate_lasips2_port, LASIPS2Port),
>> +        VMSTATE_STRUCT(mouse_port.parent_obj, LASIPS2State, 1,
>> +                       vmstate_lasips2_port, LASIPS2Port),
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
> 
> The set of things we were migrating and the set of
> things we now migrate don't seem to line up ?

Yeah I should probably have documented this better in the commit message. The 
existing VMStateDescription isn't correct since it misses both the buf and 
loopback_rbne fields which are accessed across port reads and writes, and the port id 
is not required because it is hardcoded to 0 for the keyboard port and 1 for the 
mouse port.

Rather than have the extra code churn throughout the series, I went for doing the 
minimum to vmstate_lasips2 to make the patch compile and then fix up everything 
(including add the new int_status bitmap) in this one patch. I think this is fine 
since as we're introducing a migration break in the series, there are no concerns 
over backward compatibility.

Would an updated description for this commit message be sufficient? A quick skim over 
the emails indicates that the only queries during review were related to the handling 
of the VMStateDescription.


ATB,

Mark.
