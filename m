Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1691684njc;
        Tue, 11 Mar 2025 01:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWAQoqZOzMFQIQJKjVwUJdDA1s6UHqh0zM+vZvENjpMDYppD44u9Equ6qLyNceZ/JkIKHY/iDD0tvhK7w==@linaro.org
X-Google-Smtp-Source: AGHT+IFV+gxiplaaV8kan+E2NmIrNPD2TsEFci/BUIGr1enWDYaouIUmQqBSRo3Yj+3j0rlkNHfH
X-Received: by 2002:a05:620a:2841:b0:7c5:464b:671a with SMTP id af79cd13be357-7c55e911cedmr385966885a.42.1741681252563;
        Tue, 11 Mar 2025 01:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741681252; cv=none;
        d=google.com; s=arc-20240605;
        b=ZKiZsZjWCzO5h6CaolqbU95Eg3obBLkpg5MA2/JyP2X87mlXHZ/24DFPIqNtcxIlh7
         iFRfVr37pP6KhpuD/kFyeFEBeuv6l9wvJYHzsjCEBy/vXk7mLwc0OXedeo/OzgmK9fmU
         K9wmcGB5NpRoppsLozTd+slPgXD/U3mvLB59PAazLeptnFa9BO41s81cjhz28X0zKmx9
         ILKXljp4uK9K+5FUuU/AEDWYFVDkrYCcqg0aKX56ru7GTrooNMjbfHuFlKmrLAg9QKuV
         C+QAzIvSNzHnyXn27K+ShZcwO70tEeA6qzhUWcq+FS24kkeIY0XNHXX0Wrn6Akj+6oGU
         MVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dKpI07T4/YTgz2s/hDdMabe9A+22Lp9DW33+N6JzTKs=;
        fh=BYgdQw4GZpiDtgp6rAPfEmum+9Z9ZuxzPM9zPjCvHCg=;
        b=TW5vM5BM499JacZln+ZX4cT4j29aMzS7IKwgu59Z/bE7en2Oyh/hTZOWF/QiptnVHE
         YN4+nHJ5EAaNG9gIaxPPVmBKAElXkCRjq2Ji3jxU9oTiIIQBve5H7UzOITAWsPnUCCKO
         e1olg4KRdlQi/fUvogldvuFOTYp/pLQplGjhfej6D4KiBsSCX8eFdHIilPi7nEwTMetD
         QGo8kkfX/2tmHA4o4Smoc2IgntVoG3iv+Q6isXHhJ5V5J2GdPxyN2xpCSD4Ig/+NHsCl
         cINiab37EtWtdBjJ4PgRAmUd1fa0Efz5z9HFSxZYsOnCRmngWK/YZh+rUYHyZzUGp3/4
         95eA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vno5EbYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f716361csi105275736d6.255.2025.03.11.01.20.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 01:20:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vno5EbYb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1truqe-00045f-U6; Tue, 11 Mar 2025 04:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1truqZ-00044g-AP
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 04:20:19 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1truqW-0001le-K1
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 04:20:19 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so11162205e9.0
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 01:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741681214; x=1742286014; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dKpI07T4/YTgz2s/hDdMabe9A+22Lp9DW33+N6JzTKs=;
 b=Vno5EbYbk/BbgrK7StOKb915xDghwJWl2wjxBspAUMNcPCh5uBvm+RvlNR6TlIQQ6U
 jrAUmMn+WrlQ3LRoVF2cnQlBxauxUpINLtojzuLmuH6b4pwR/mQkaZqXR8ZFLaSi7ZrP
 t4QGICPQginIt7a6S1BZsfZBdbwa6DKM7RXTCQeVrzfcUq46fgHutNAftUQNZHrITnPx
 3SdArS86cKJw8mbH3x9GJUxtrAbBkSCo+0OamNhgNzmKs7JL7g77DJed8IRQt/uHhvh5
 vot/CT9jgXI8jJTOtgdd7BTuh39GS/jJXMXeHS7whp6yfge7pZMJH4AS5hfqojjJW9EQ
 1Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741681214; x=1742286014;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dKpI07T4/YTgz2s/hDdMabe9A+22Lp9DW33+N6JzTKs=;
 b=CLBHrb8JlHPTLgfqjI62G4t92qKVLz8rMidJFmS0ydVWoHNmZiMrn9nitdBqZiZwaP
 /oVmCVYJsevINZGVapdYB/Z+EP81ARbxjPmvknPMMDyQ0AwsPCDgk2ii+aa/wZouJ9Qd
 2WqF5itkrYkvY6MHn5elvsDewmr3tD4VavKssiGQxc3X80skA82RQsCD8ijS2n9GvRCx
 QS3HDfPGAnUAG/QIMxZj7OsCR/8ixWUWVG/hp1NAli2gsjLRVMdvBl22UMRQNjXO7Pd6
 qp3BZGGBhTt2fvcHsTHMrw2+x+LnQOgM+83Y4UZADvfeF2YGncLTyKLbNCe4fLMfMZ3K
 NaEg==
X-Gm-Message-State: AOJu0YxpPTbLT4XyODU5dBDFJCauTM7DH8iN1nURR79wWeRpZC79iDHd
 uun8bQD0g90l0xsdEcuaP5ITRPJ50LKMNOZmuGQ2wC8VGXpIntvPJdRh/4tC08Q=
X-Gm-Gg: ASbGncvSx9ZXQv7uotH3PlaVwGOdzeT0cHtOXAnEUGzGQPbZTRxRWnolbTo4bZ5leOF
 Gg60kykCAeKaIYORkHZOZ+rnPAd+pACklgw4oShrJhNBzNC0jRoyex7R0x6/qqNJe0YU8zdDBlo
 Jue/+UU2pcCYHy8qhIZE3AFY5n4UAEPLO3UkbNA8sOyQKS/JUmYZqtQfJMNfpO8S9s6sS3ZBno5
 18qFdJhVaJsIF03fH13XAeu0fAW7OIjxgNbAohaCU6qkbCiEt4e94loDofKRTP3w0lmYnh0zF45
 xMCv/vCaQ49orEvqvSGC3qgWUYI1Pos81ZOn1ieBR5WDRRxjbfAiFJIFaMN/yY1RUuqus0uJBn8
 E8zkNSw9MsUK1
X-Received: by 2002:a05:600c:1c22:b0:439:8634:9909 with SMTP id
 5b1f17b1804b1-43d01d50313mr30915695e9.14.1741681214471; 
 Tue, 11 Mar 2025 01:20:14 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce3d5a0e2sm119808045e9.12.2025.03.11.01.20.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 01:20:13 -0700 (PDT)
Message-ID: <47b847a2-0547-49cb-9291-20c25c3f4376@linaro.org>
Date: Tue, 11 Mar 2025 09:20:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hw/net/smc91c111: Sanitize packet length on tx
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Jason Wang <jasowang@redhat.com>
References: <20250228174802.1945417-1-peter.maydell@linaro.org>
 <20250228174802.1945417-3-peter.maydell@linaro.org>
 <f4262519-017d-4ed7-8c17-5d4d72a219a6@linaro.org>
 <CAFEAcA9vw-Qgt4MBd=g-RTC1joHsHYBmtASHpL=SBnBjoW0nWA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9vw-Qgt4MBd=g-RTC1joHsHYBmtASHpL=SBnBjoW0nWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Hb3w80NYxkGO

On 10/3/25 12:06, Peter Maydell wrote:
> On Sun, 9 Mar 2025 at 19:01, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> On 28/2/25 18:48, Peter Maydell wrote:
>>> --- a/hw/net/smc91c111.c
>>> +++ b/hw/net/smc91c111.c
>>> @@ -22,6 +22,13 @@
>>>
>>>    /* Number of 2k memory pages available.  */
>>>    #define NUM_PACKETS 4
>>> +/*
>>> + * Maximum size of a data frame, including the leading status word
>>> + * and byte count fields and the trailing CRC, last data byte
>>> + * and control byte (per figure 8-1 in the Microchip Technology
>>
>> If control byte is included, ...
>>
>>> + * LAN91C111 datasheet).
>>> + */
>>> +#define MAX_PACKET_SIZE 2048
>>>
>>>    #define TYPE_SMC91C111 "smc91c111"
>>>    OBJECT_DECLARE_SIMPLE_TYPE(smc91c111_state, SMC91C111)
>>> @@ -240,6 +247,16 @@ static void smc91c111_release_packet(smc91c111_state *s, int packet)
>>>        smc91c111_flush_queued_packets(s);
>>>    }
>>>
>>> +static void smc91c111_complete_tx_packet(smc91c111_state *s, int packetnum)
>>> +{
>>> +    if (s->ctr & CTR_AUTO_RELEASE) {
>>> +        /* Race?  */
>>> +        smc91c111_release_packet(s, packetnum);
>>> +    } else if (s->tx_fifo_done_len < NUM_PACKETS) {
>>> +        s->tx_fifo_done[s->tx_fifo_done_len++] = packetnum;
>>> +    }
>>> +}
>>> +
>>>    /* Flush the TX FIFO.  */
>>>    static void smc91c111_do_tx(smc91c111_state *s)
>>>    {
>>> @@ -263,6 +280,17 @@ static void smc91c111_do_tx(smc91c111_state *s)
>>>            *(p++) = 0x40;
>>>            len = *(p++);
>>>            len |= ((int)*(p++)) << 8;
>>> +        if (len >= MAX_PACKET_SIZE) {
>>
>> isn't MAX_PACKET_SIZE valid? I'm not sure at all but I'd expect:
>>
>>              if (len > MAX_PACKET_SIZE) {
> 
> Yes, thanks, good catch. The max value in the byte count
> field is 2048. We subtract 6, and then look at p[len + 1],
> which will be p[2048 - 6 + 1] = p[2043], where the value of
> p is data+4 (because we incremented it 4 times as we dealt
> with the status and byte count fields).
> So p[2043] is data[2047], which is the last in-bounds byte,
> and a byte-count field of 2048 is not an overrun.

OK, so using '>':
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> (Also, I just noticed that the data sheet says that for tx
> frames the transmit byte count least significant bit will be
> assumed 0 by the controller regardless of the value written
> in memory. So we ought to zero out the LSB of 'len' after we
> read it from the packet. That's not an overflow, though
> (since we already subtracted 6 from len), just a bug...
> Plus it looks like we don't handle the case of "odd-length
> frame and CRC field present" right, since we don't do anything
> about the last-data-byte being behind the CRC field. I think
> that given the unimportance of this device model I'll settle
> for just fixing the overruns and leave these other nominal
> bugs alone.)

While agreeing it is not worth fixing ASAP, a patch adding a pair
of comments with your findings could save time to future contributors
and not make your analysis in vain :)

Regards,

Phil.
