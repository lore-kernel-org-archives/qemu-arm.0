Received: by 10.223.197.9 with SMTP id q9csp2527920wrf;
        Mon, 9 Oct 2017 07:48:14 -0700 (PDT)
X-Received: by 10.55.46.196 with SMTP id u187mr9628107qkh.174.1507560493982;
        Mon, 09 Oct 2017 07:48:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507560493; cv=none;
        d=google.com; s=arc-20160816;
        b=DQvVLxjAW7wHOHy3OTHPlNgBuAYlc3TLHjMIp9hDgONQgBd2Q0C3IfuPP1pD739H0Y
         bNtz1M0WoS3B6vL5yKlh7Iu74ftKwy+Cs98EmkcImCCXrP9vcpu1ualquN2x2gZClbcx
         ZNfQALzcKIrTf0Y2Ds+u5o48PX7VRhygBH3KnwGEkXFLWHIldn4WrfDqeVaUls4xrKBZ
         Y/xwQ7txnkAaIbd2S0ZzkiPP9GSQp/VKlW84rRdC5cmUK3emcXNGzWbnId+NN86luFCr
         y80wpahVQpKSBYFz/C2hzUDNr6ImUfpRhfjsARCALCJExoQ1qFJNzd/Dhq66Z3vkhHxo
         RdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=f9Or1PXrSFqPfyHzgDO0z6qGkWM8EN7eXH38NXaOKcE=;
        b=oMTYPKhXsn3qwj5rv3QEqMVPyQT1E2QEIjkWFud5ZwAoTPbS5z4moR3cjdKS1czC74
         WBt9Efr+AG6tMsJDGNFP4HwTJ8nkWAbmmrXfY8XJ5rnkaJYXWGRyCTOgEakkpENptZYn
         MYE+PmrG8fefHhT+fk9t8pAR3u4oBAligjJiRcpuqFbK0ZApCuCdmv0yjtYmIGIjJWGy
         6ZuCs0n0C1+0FfNPK4irDx41LxOqn+YWKN3Kde4eNsYhWEBvPpRR+ua5h2YEV0WUkY4J
         2uUHr0vbCXUQP+UXt61ru2/Y304td81AvW/wv5kDRxKttaNDKgQT6wUOIUVDUcg2/O+A
         Z/fw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IMkZLLtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v26si1191252qtf.378.2017.10.09.07.48.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 07:48:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IMkZLLtC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1ZLp-0000XX-Dl
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 10:48:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZLe-0000V1-0I
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZLa-0005Zb-1f
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 10:48:02 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37299)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1ZLZ-0005ZC-Tr; Mon, 09 Oct 2017 10:47:57 -0400
Received: by mail-qk0-x241.google.com with SMTP id a12so13817232qka.4;
	Mon, 09 Oct 2017 07:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f9Or1PXrSFqPfyHzgDO0z6qGkWM8EN7eXH38NXaOKcE=;
	b=IMkZLLtCuz/h41YNtMYEijSJc+64Hd/7M0akOzVtkIV6BN4JMi0DcQwoCFp+2odNYO
	TsSbGl/SGFWh1siehfCK0D6nyTU9CWP1EcsGRn/NBFYWkNTSoZ2nW/pqV3brGm3yjSRo
	GJbAm/2fsSgNngtI6SpGKuSmHPqJx6zgLAelUfbmS1tZuCFEBL/CMYtJ+zt/ywqt5VB5
	X4ZG2yjvXGeWFoxGjv0nBJLG6O2oMd7hdydmCHimTF+T2Vm+UKcfjhYm9GjBYZzdlc2G
	AtJ7HCGT62o56HMxLBjss945wV5Qb++YuOrQJBigH2MJyPOm4Fj3wy7Upk3qzAAOG6KA
	6BaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f9Or1PXrSFqPfyHzgDO0z6qGkWM8EN7eXH38NXaOKcE=;
	b=kPPpOhzQxV4KnDjD9+NmByCf2C0UFTroVggGIPUcYkXXLM/YVHOhpi9D/te7HHMWv0
	8IKmjkqeQ/5hjF2ZYYaFRVrQv548q5YJB1HLlpdF865kER7kcgtPgh9+2efnNJXYW9Sv
	CdKah5ExqhrJidH31S8IeeI02b+By7JAJCjKTyDMbiw3tqSyctCMtMDdfqa8Rj0QFfhE
	i+c/3CNVtieErejg2ZUfcGX4tYItwI6P6WulorcXNmeXkQbIqDZiEQs0AxqtcjJLYf3I
	yYekbausUaCJot28MX5yACoD/P8P+PgVODvBcUngWvXWVI6F/n2LX105hOIcef/5haO4
	3nKw==
X-Gm-Message-State: AMCzsaUaFjazjxrf5uGAQ6I7z1+CezhPmT7YKjob6B420FnZGL7uI43R
	p+QU74XuGzuW8893PjbNuUKP4GKGN9oBnK7HyY8=
X-Google-Smtp-Source: AOwi7QDPfhKeI/gKmZOa8RXCM7fArx37MYmMM+Kdc3iDin5WmBMHhCWjlqg7P04pg8tF53oVKMpmrhZ/OpBisuOctZ8=
X-Received: by 10.55.127.7 with SMTP id a7mr10023433qkd.45.1507560476851; Mon,
	09 Oct 2017 07:47:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 07:47:56 -0700 (PDT)
In-Reply-To: <CAFEAcA9M9ZpcAHB4eZ2zh9jA6YSWpLoEPiAznnL2-SSdJoW+Mw@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-3-andrew.smirnov@gmail.com>
	<CAFEAcA9M9ZpcAHB4eZ2zh9jA6YSWpLoEPiAznnL2-SSdJoW+Mw@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 07:47:56 -0700
Message-ID: <CAHQ1cqEQpgr1Qgwr9rUnpiUXs_=jKSnzpJFQ=Q6GK+5vpT-x6A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [PATCH 02/17] imx_fec: Do not calculate FEC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +zKk4ENXJvDo

On Fri, Oct 6, 2017 at 6:48 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Save some computation time and avoid calculating CRC's frame
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/net/imx_fec.c | 9 +++------
>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 88b4b049d7..75822344fc 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -1032,9 +1032,7 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>>      IMXENETBufDesc bd;
>>      uint32_t flags = 0;
>>      uint32_t addr;
>> -    uint32_t crc;
>>      uint32_t buf_addr;
>> -    uint8_t *crc_ptr;
>>      unsigned int buf_len;
>>      size_t size = len;
>>
>> @@ -1048,8 +1046,6 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>>
>>      /* 4 bytes for the CRC.  */
>>      size += 4;
>> -    crc = cpu_to_be32(crc32(~0, buf, size));
>> -    crc_ptr = (uint8_t *) &crc;
>>
>>      /* Huge frames are truncted.  */
>>      if (size > ENET_MAX_FRAME_SIZE) {
>> @@ -1090,9 +1086,10 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
>>          dma_memory_write(&address_space_memory, buf_addr, buf, buf_len);
>>          buf += buf_len;
>>          if (size < 4) {
>> +            const uint8_t zeros[4] = { 0 };
>> +
>>              dma_memory_write(&address_space_memory, buf_addr + buf_len,
>> -                             crc_ptr, 4 - size);
>> -            crc_ptr += 4 - size;
>> +                             zeros, 4 - size);
>>          }
>>          bd.flags &= ~ENET_BD_E;
>>          if (size == 0) {
>
> This looks a bit odd. Doesn't the hardware calculate the CRC here?
>

It does, it just seemed to me that since the hardware also has a "CRC
error" bit in its status register, there would be few if any users of
the actual calculated CRC value. Given how eTSEC emulation layer gets
away without calculating CRC I thought that it might be possible to
have this optimization here as well.

I can drop this patch if this seems risky.

Thanks,
Andrey Smirnov
