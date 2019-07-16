Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp591762wrv;
        Tue, 16 Jul 2019 00:19:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZGepu0Aabttv9lwsCzsEbm49X7o+L5IN7JkHrQYVADB2DumNPI5ZqLK+hVoAItPd6xiIa
X-Received: by 2002:a50:a942:: with SMTP id m2mr27539190edc.73.1563261595847;
        Tue, 16 Jul 2019 00:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563261595; cv=none;
        d=google.com; s=arc-20160816;
        b=uCZaKWynRGPxp27rDRstS0ggXSRYDzl9PHRp3r+oOMZ2OZ6aUr51lxYf1PhEs4HzXZ
         YJION/BTYQ4AfeyquxtuIQ537x5ftJ37fO0LelGY+APcIPEto4wL4D/Pb1nvIWjJTwVP
         9ohVd7V+/HCrXDiQXyDEw+1+ooYk1iiriHBckiSAfTR6eie89pcqaFfpSmYXWvVCCvdN
         mvkFMdZ4jUzSBCjlUl6ZxPuOAFUx5/WyJJ6TmDbuKxKYBDeAcYAsGnZFOZ0P2qq8z882
         l2UCk4hUGVxlXqZpgqpB13I83WBwHYemOEuPx1v9Q+FHN7DKpBcd0uHclzR0uz1+QEEc
         IhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=tnVNqHoiSgR4rP6XelwFnflFmdAT2038/qPRxCmlvno=;
        b=dKDxKRxrFbURFqnoLDy4pbIRrVbqqJbbwblXEkUKGKQaE2edcdb9tOIkQYk/4luzI0
         5yrkC3KiHpLkFU+JREcM/U2x6ujN6JUK5Z18AccWZ+ADLKU5FDgjL9uZeV6K7MBhcZx+
         0R+ITLQNSSFljnlTDYsxrKPMOOBOMRyW6Yewhb1TZiJGybZasi3KNwic1GHJ8O5Z5/Pr
         yfllUoHB5MmRcjI4mxOPKU2qMAz3UQafp0+9HUNCjXU/GPizQXbSNW/UzWy8LQ95ISs5
         cNCbbDPJtB7g9StWi2nA77gEw0T7IGSdB/cQ5ElEwvpyUISmmjWS/uX3aTwxud2mkW0R
         h2qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si10162611ejb.1.2019.07.16.00.19.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2019 00:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hnHkg-0002TQ-DQ
	for alex.bennee@linaro.org; Tue, 16 Jul 2019 03:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43556)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hnHka-0002Py-Pd
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 03:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hnHkZ-0006gZ-QU
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 03:19:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38461)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hnHkZ-0006fq-Kn
 for qemu-arm@nongnu.org; Tue, 16 Jul 2019 03:19:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id g17so19685003wrr.5
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2019 00:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tnVNqHoiSgR4rP6XelwFnflFmdAT2038/qPRxCmlvno=;
 b=RRwHm5Usx+Pp1EcPpiXcmfgcsOPmBJ4vJ1mHgNhEP9E/Zt5lgWQNQhghqs2lb/O1hZ
 LfG+M2dbnTiR9XhhrWvRvlZMnYZeocZM9EIhcJB7KEiPoO+SJZGaBwbTqRUTd5zFllwJ
 qRGpeuYkvp0dBWhIwxh/qNTSDRQGjexJTMH+f0sIMkvTybKLb1vF5lP2cRn+ZeoJYH0S
 6JOD0Uspg8nrU5Kcrk9ZPGmxLMzgrjdjPcvXzHOSUo2KUKFa1PJvTpE4EhmRMEdhF2f+
 Vx6HFwICuHA3uuOHmjj8bqlvo1wp3PacTSZ5uQ8tfuGcAZ+M1X0Ay/p582ms2aCbOXa5
 2SvA==
X-Gm-Message-State: APjAAAW94y/wfTMGT4fRqcCcoixKdYXGj9TlynZDylzESw3DyTyJbISi
 onirCoM2r02XenH6EvOgdR62pg==
X-Received: by 2002:adf:e504:: with SMTP id j4mr33075107wrm.222.1563261586434; 
 Tue, 16 Jul 2019 00:19:46 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id x20sm40687579wrg.10.2019.07.16.00.19.45
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 00:19:45 -0700 (PDT)
To: Ramon Fried <rfried.dev@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20190615051722.13994-1-rfried.dev@gmail.com>
 <CAGi-RUJazCVVh9NwpQ1AHfPdPLW1aYxKst6w6PKfCk2doBz_9w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <8422687a-f410-64a4-1211-b06a4f26681e@redhat.com>
Date: Tue, 16 Jul 2019 09:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAGi-RUJazCVVh9NwpQ1AHfPdPLW1aYxKst6w6PKfCk2doBz_9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] net: cadence_gem: clear RX
 control descriptor
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:Xilinx Zynq" <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WgdZd043UCnt

On 7/16/19 9:11 AM, Ramon Fried wrote:
> ping
> 
> On Sat, Jun 15, 2019 at 8:17 AM Ramon Fried <rfried.dev@gmail.com> wrote:
>>
>> The RX ring descriptors control field is used for setting
>> SOF and EOF (start of frame and end of frame).
>> The SOF and EOF weren't cleared from the previous descriptors,
>> causing inconsistencies in ring buffer.
>> Fix that by clearing the control field of every descriptors we're
>> processing.
>>
>> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
>> ---
>>  hw/net/cadence_gem.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
>> index ecee22525c..d83a82bdb0 100644
>> --- a/hw/net/cadence_gem.c
>> +++ b/hw/net/cadence_gem.c
>> @@ -406,6 +406,11 @@ static inline void rx_desc_set_sof(uint32_t *desc)
>>      desc[1] |= DESC_1_RX_SOF;
>>  }
>>
>> +static inline void rx_desc_clear(uint32_t *desc)
>> +{
>> +    desc[1]  = 0;
>> +}
>> +
>>  static inline void rx_desc_set_eof(uint32_t *desc)
>>  {
>>      desc[1] |= DESC_1_RX_EOF;
>> @@ -994,6 +999,8 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>>          bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
>>
>>          /* Update the descriptor.  */
>> +        rx_desc_clear(s->rx_desc[q]);

Maybe move the call before the comment, regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>> +
>>          if (first_desc) {
>>              rx_desc_set_sof(s->rx_desc[q]);
>>              first_desc = false;
>> --
>> 2.21.0
>>
