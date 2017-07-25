Received: by 10.25.44.15 with SMTP id s15csp4675588lfs;
        Mon, 24 Jul 2017 22:24:47 -0700 (PDT)
X-Received: by 10.55.19.29 with SMTP id d29mr23504879qkh.296.1500960287843;
        Mon, 24 Jul 2017 22:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500960287; cv=none;
        d=google.com; s=arc-20160816;
        b=0KqGzplyhLiH3nelpkmVHWQbI9dKAnpi6svADDFHLlVGIheULdnVCprTU4rpl1XvfI
         aq8cBXt43KrSXLL9l7axuhJa1YaL02eNElutw9L7WmzSIEvyJr/Ib7wGNsxu1//8TsXh
         /aX9CfP4exPxpOAcUe1+6hggAyeaxsPnV9DghNEHYWBUgKBRn9OAdu2D41t+rfYXUWKM
         Ka/ie00Sm9fcJKIc9K40qoYlGUcLOdMykUvJJVx4GTpLoTqYn7hlSNbuTqgErt0sGslm
         REaDCUcz6LyRsPA3NwFfyrKP+GrXHuOeITT5sGbo20/7UBz2mNKgUsz7ls1LL06Fjzdp
         1z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=7/SuPlhVdMzS+GO3Daut3MAD3stuEMXm9FRFwivzkLs=;
        b=y38o4grglhdNJ5szRn6u7cfUO8C3RYkJQf/NF5wi11gZLgCgD7TRUFQZefgnNe6VvH
         aG62hDFlFJ6cjpv+fkEJvZBvc2QSN4HFAJsgRvz1byNgpxVBzIU1RJ5zQBrKTb21aJti
         7qXZ9PCoUuSi839XI1xGOFKMqAlOTx64JDMXUCacFfTSzDs6PV3xFXd1QWX4Q77Fhdt1
         yRTskgsvgaefoYSHOe3v3ViK2CHHGayIEu+pxT9UMJChiQToHGbCixyycdsktAQ/sjkT
         IETtNjaHG6kqvvvYQMr1f+A+PIZnsu2iokh6of2HlAd+dzG7TlRkDHVDvAYJV0Gdzd5h
         3aPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=RfxxUFyo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e88si10557687qtd.476.2017.07.24.22.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 22:24:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=RfxxUFyo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZsKr-0002wv-6p
	for alex.bennee@linaro.org; Tue, 25 Jul 2017 01:24:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZsJf-0002NM-9A
	for qemu-devel@nongnu.org; Tue, 25 Jul 2017 01:23:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZsJc-0005jV-3u
	for qemu-devel@nongnu.org; Tue, 25 Jul 2017 01:23:31 -0400
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f]:38433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZsJb-0005jP-UL; Tue, 25 Jul 2017 01:23:28 -0400
Received: by mail-qk0-x22f.google.com with SMTP id g6so66835209qkf.5;
	Mon, 24 Jul 2017 22:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7/SuPlhVdMzS+GO3Daut3MAD3stuEMXm9FRFwivzkLs=;
	b=RfxxUFyoK/uNLJ8YZwK+Z2eVtFI1W2j+fdkjyalHHx1u8TCnq0pRheCCUbAVNtcYS1
	67tiq2tuxVf7xtetIxUaZnO4RhhAq9m3L63clQe38WBH8w2qcmtIsimBXnYR9smfqWRE
	xRDA1dlkV7Pp3J3aktSZOfUDGTJX84R0aP3CN48wmsFxJ2hcq8hVC7XpV0/SmINiV7T2
	xjTvyu1pnJUM2K53C3vdmu8pTDfOFJ6sIXjjB6HeuTFh/mWpkvz9iycTR2JSIgZUQSAa
	yFADk5w7dpUrOgzIWFxhHikYLNs1dSsDbeiVSAC6OJMDyGRMm9z8oTHKHEREcilYxV0m
	rrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7/SuPlhVdMzS+GO3Daut3MAD3stuEMXm9FRFwivzkLs=;
	b=r4KGlCNhlxKPFVk8UeEe65SmabmIeJlf3iCqPxlshBzkdlXUHFT8Co1Ejl2yDl/VQq
	RurkPC5GI4BUG0nfYbDKnz9tLHk/T+PEOkxPkCiJVYHrEdHjoNY/5rWWAbT2EZNnJ1Fr
	IRRCL28rzvg8c+mIiN+7B5M9v+69ixQ4G16bnbvTyfz+sbh9UvgLINfDiDw1b3aBd7l9
	CKAtGWn+/y2oUoRfuotZKR2ZNVDlTG7IBbhNPkzU+g3sJJ+nDCmcJmb4WniI07NGNTTt
	S/rcvayobfWNCb+EAFU4kGaecIzoleq3+8vitdTLkcsg+0TXh8WEbglsBqKxBQ+jKoSL
	iPuw==
X-Gm-Message-State: AIVw110WIHgtPtSZmi52bNwPxG6ejkff3NomTMpx3NquBm2UIg2926XI
	RT/3+Q4u8xgjxYmRIWLkjg==
X-Received: by 10.233.237.211 with SMTP id c202mr23207021qkg.1.1500960207152; 
	Mon, 24 Jul 2017 22:23:27 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	k90sm9316001qte.44.2017.07.24.22.23.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 22:23:26 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-12-f4bug@amsat.org>
	<CAFEAcA9nkfXfXn3fiZMS3dnrp7v8NVysqFS+pb-Ehf=+xOFfWQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d8f9188c-d60f-b873-d012-1d2436fdbaac@amsat.org>
Date: Tue, 25 Jul 2017 02:23:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9nkfXfXn3fiZMS3dnrp7v8NVysqFS+pb-Ehf=+xOFfWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22f
Subject: Re: [Qemu-devel] [PATCH for 2.10 11/35] i2c/exynos4210: correctly
 check i2c_recv() return value
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UQROAcS31np+

On 07/24/2017 06:13 PM, Peter Maydell wrote:
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> i2c_recv() returns -1 on error, if the I2CCON_ACK_GEN bit was not set this code
>> was setting i2cds = -1.
>>
>> i2c/exynos4210_i2c.c:117:20: warning: Loss of sign in implicit conversion
>>          s->i2cds = ret;
>>                     ^~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/i2c/exynos4210_i2c.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
>> index c96fa7d7be..4424dbd233 100644
>> --- a/hw/i2c/exynos4210_i2c.c
>> +++ b/hw/i2c/exynos4210_i2c.c
>> @@ -111,10 +111,12 @@ static void exynos4210_i2c_data_receive(void *opaque)
>>       s->i2cstat &= ~I2CSTAT_LAST_BIT;
>>       s->scl_free = false;
>>       ret = i2c_recv(s->bus);
>> -    if (ret < 0 && (s->i2ccon & I2CCON_ACK_GEN)) {
>> -        s->i2cstat |= I2CSTAT_LAST_BIT;  /* Data is not acknowledged */
>> -    } else {
>> +    if (ret >= 0) {
>>           s->i2cds = ret;
>> +    } else {
>> +        if (s->i2ccon & I2CCON_ACK_GEN) {
>> +            s->i2cstat |= I2CSTAT_LAST_BIT;  /* Data is not acknowledged */
>> +        }
>>       }
>>       exynos4210_i2c_raise_interrupt(s);
>>   }
>> --
> 
> Have you checked this change against the data sheet for
> the device?

Here is the relevant part of the Exynos4210_UM DS:

[*] 14.3.5 Data Transfer Format
... If the I2C-bus is operating in Master mode, master transmits the 
address field. Each byte should be followed by an acknowledgement (ACK) bit.

[*] 14.3.6 ACK Signal Transmission
To complete a one-byte transfer operation, the receiver sends an ACK bit 
to the transmitter. The ACK pulse occurs at the ninth clock of the SCL 
line. ...
The software (I2CSTAT) enables or disables ACK bit transmit function. 
However, the ACK pulse on the ninth clock of SCL is required to complete 
the one-byte data transfer operation.

[*] 14.3.9 Abort Conditions
If a slave receiver cannot acknowledge the confirmation of the slave 
address, it holds the level of the SDA line High. In this case, the 
master generates a Stop condition and cancels the transfer.
If a master receiver is involved in the aborted transfer, it signals the 
end of slave transmit operation by canceling the generation of an ACK 
after the last data byte received from the slave. The slave transmitter 
releases the SDA to allow a master to generate a Stop condition.

I2C-bus last-received bit status flag bit. (I2CSTAT_LAST_BIT)
0 = Last-received bit is 0 (ACK was received).
1 = Last-received bit is 1 (ACK was not received).

An I2C-bus interrupt occurs if 1) if a 1-byte transmit or receive 
operation is complete. In other words, ack period is finished. 2) A 
general call or a slave address match occurs, 3) Bus arbitration fails.

--

So the current code is not wrong and matches the datashit, crap is 
shifted into I2CDS and the guest has to poll I2CSTAT to check the peer 
ACK... Still it is weird to shift 0xff as of the current implementation, 
but it might have some usefulness while debugging, who knows...

I might add few comments in that file during 2.11 cycle.

Thank for the review!

Patch dropped.

Regards,

Phil.
