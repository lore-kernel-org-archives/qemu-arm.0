Received: by 2002:adf:a557:0:0:0:0:0 with SMTP id j23csp3606287wrb;
        Tue, 9 Jul 2019 05:10:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNgH7C3Y43mtqnLzN1gbDhMWtQuCm26swwtH6pxlbFcUi9NEhBhasZ3uRQrjlQSeySh09M
X-Received: by 2002:a17:906:1f43:: with SMTP id d3mr20586614ejk.169.1562674248918;
        Tue, 09 Jul 2019 05:10:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562674248; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4ykekRsGvpmd/5VbxpG/84Ai6TyS6PDsxGkj1t/Ps4S1pmM8Z/YHMHlPtbmNq7S2F
         pO9EJnf0pcagbbn8HkdNDAGDfK1tpLzCMMbHI4rIKivt3eIQGg2xfKMd+y9DMYrq07Cp
         hc53jad7MOEe3quA+It/IWZEtfM+rjYKcJpMMoYEYHrfTD+aRlKCFufXJaXTZB8jgNPo
         K+0aaFEjQ5+/UYMInCFBBquAxmfTkrZILWIR3ouDvAraP27FAVAPmMUSSK4nIm1luUXg
         um3RetHC3Wj5zsG2yaR3hYEkGwXgeSSCK5tR0tGFsjapOkyBqq1SbOjKvE4M2sRa/Squ
         8jig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=8JQUSvCxgUt0Zcu2VBjbCtR+wnHkSCBgdtHjjyiw7QE=;
        b=Ac/cWnCDOKyVArKFe2SPkmPRnJZnSgTqe8bNKt1GNzbJz61GmUa5d98e5JzGR4M+Kj
         Axx+YISSzgc/Kha/8STnD7YNtMLMmff/qhTQp+ZQZrUUmDGy3OTWIZzLf/4iyaVTH+pV
         OZjMJM3Y/iiDApxAdIvfOasCd9aQToAdKz7ue7aVD8d/40HGRgOxiloBlR0yOchOcSAi
         P4wYsHi5TmeFBwBCysxSaEIYJjHN7tUJozJ/xSD+GRY7s3NXc0wAOKKoU8FH12YjKgTN
         Kl3ilcPANEyVjmryLN/AvclhtYKQj6kLY7dIinl+0QK+jKHL4+Z8rrKkowyLs9sHSGm4
         9Jhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38si15775290edq.398.2019.07.09.05.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 05:10:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hkoxM-000312-2P
	for alex.bennee@linaro.org; Tue, 09 Jul 2019 08:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54422)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hkowy-0002xI-Ne
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:10:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hkowv-00068k-3Q
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:10:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37601)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hkowr-00064z-Bv
 for qemu-arm@nongnu.org; Tue, 09 Jul 2019 08:10:21 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so11615102wrr.4
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2019 05:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8JQUSvCxgUt0Zcu2VBjbCtR+wnHkSCBgdtHjjyiw7QE=;
 b=leOe3Qtn/j61qPU18p4p8uXcy2a+BCGU5l/Uslyce3V5eW4X0KXjd4os1ZTeNDtwrv
 G1UhXOPlhP2zyGIQ3XqIasN499DgyFGMcGyD0kui/43LiPBd6jAVEgliaTk90UZECNO7
 x2Qh/ECm5G6aBdl1xS34iFFMUr+GpF1GAC2wDZf+7+63VYI1dysF38YkHolh41WsigKZ
 KOnFpmJcXj5VdoZp8E8DmZ0kBaYW7qUmCY3U4EAIuVfBO8Vat+Sj+ekUyZ3U62jRjwfI
 mZU1SOKVQhIlngclVTvW/3H6ET0u0TBPhJQznOuz59dSkuzCxuPFFK5bYUKaNeZcKnH2
 qq0A==
X-Gm-Message-State: APjAAAWa0iK1a5RZiPBHINvEXEEnKWjm3SYHeXLx31j/tsYPKLQAfht2
 qhYVBRcAjw/Q/D/7b/s6yMDaUA==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr23868472wrx.300.1562674215836; 
 Tue, 09 Jul 2019 05:10:15 -0700 (PDT)
Received: from [192.168.1.38] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id b8sm3508363wmh.46.2019.07.09.05.10.14
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 05:10:15 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190708104750.1071-1-philmd@redhat.com>
 <20190708104750.1071-2-philmd@redhat.com>
 <CAFEAcA_NnBYWKs89B5apxmXFBUcA5oh3QShRM-1CkWu4Rp6aug@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <86758a18-b117-a2f0-cb62-1977a6507a6c@redhat.com>
Date: Tue, 9 Jul 2019 14:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NnBYWKs89B5apxmXFBUcA5oh3QShRM-1CkWu4Rp6aug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH-for-4.1 v5 1/3] hw/ssi/xilinx_spips: Convert
 lqspi_read() to read_with_attrs
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
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KIvvAR9BmjF9

On 7/9/19 1:11 PM, Peter Maydell wrote:
> On Mon, 8 Jul 2019 at 11:48, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> In the next commit we will implement the write_with_attrs()
>> handler. To avoid using different APIs, convert the read()
>> handler first.
>>
>> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v4: Do not ignore lqspi_read() return value (Francisco)
>> ---
>>  hw/ssi/xilinx_spips.c | 23 +++++++++++------------
>>  1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
>> index 8115bb6d46..b7c7275dbe 100644
>> --- a/hw/ssi/xilinx_spips.c
>> +++ b/hw/ssi/xilinx_spips.c
>> @@ -1202,27 +1202,26 @@ static void lqspi_load_cache(void *opaque, hwaddr addr)
>>      }
>>  }
>>
>> -static uint64_t
>> -lqspi_read(void *opaque, hwaddr addr, unsigned int size)
>> +static MemTxResult lqspi_read(void *opaque, hwaddr addr, uint64_t *value,
>> +                              unsigned size, MemTxAttrs attrs)
>>  {
>> -    XilinxQSPIPS *q = opaque;
>> -    uint32_t ret;
>> +    XilinxQSPIPS *q = XILINX_QSPIPS(opaque);
>>
>>      if (addr >= q->lqspi_cached_addr &&
>>              addr <= q->lqspi_cached_addr + LQSPI_CACHE_SIZE - 4) {
>>          uint8_t *retp = &q->lqspi_buf[addr - q->lqspi_cached_addr];
>> -        ret = cpu_to_le32(*(uint32_t *)retp);
>> -        DB_PRINT_L(1, "addr: %08x, data: %08x\n", (unsigned)addr,
>> -                   (unsigned)ret);
>> -        return ret;
>> -    } else {
>> -        lqspi_load_cache(opaque, addr);
>> -        return lqspi_read(opaque, addr, size);
>> +        *value = cpu_to_le32(*(uint32_t *)retp);
> 
> If you find yourself casting a uint8_t* to uint32_t* in
> order to pass it to cpu_to_le32(), it's a sign that you
> should instead be using one of the "load/store value in
> appropriate endianness" operations. In this case I think
> you want
>     *value = ldl_le_p(retp);
> 
> That looks like it was an issue already present in this code,
> though, (we do it several times in various places in the source file)
> so we can fix it later.

Well, other places check GQSPI_CFG.ENDIAN bit for switching endianess,
here we don't... Dubious code? Per the code DMA accesses seems
little-endian. However tx_data_bytes() handles endian swaping, while
rx_data_bytes() doesn't.

It seems wise to postpone this after the current release, indeed.

Thanks,

Phil.
