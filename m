Received: by 10.80.163.71 with SMTP id 65csp2748494edn;
        Wed, 5 Oct 2016 09:02:18 -0700 (PDT)
X-Received: by 10.55.20.78 with SMTP id e75mr9320848qkh.267.1475683338555;
        Wed, 05 Oct 2016 09:02:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si5648326qka.36.2016.10.05.09.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 09:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1broe9-0000HY-7e
	for alex.bennee@linaro.org; Wed, 05 Oct 2016 12:02:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1brobq-0007N3-UN
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 11:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1brobj-0004qn-JK
	for qemu-devel@nongnu.org; Wed, 05 Oct 2016 11:59:53 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34005)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1brobb-0004lp-Dx; Wed, 05 Oct 2016 11:59:39 -0400
Received: by mail-oi0-x241.google.com with SMTP id r132so12536825oig.1;
	Wed, 05 Oct 2016 08:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=W0A43MC4zNj7sAkiSAZiLvlsVFAQRSfVtuJLtAgkEB4=;
	b=0JKbLZNJYDaX+DugnBFUth3ZSvtkAiKdO7pDPviMh7eQLYTcIfUh6K90abpAaegNBS
	/kscbo1UdiyMWAsIXe4zp/BaCubYeww6NPF/xGb97Rih6xuw4mIcokIB/g7QJhejByuo
	UAhnWd2vYXqcaErrFFbtJWKHQEZ2qex0kZc8m6CoFbdwaSA25y5wuXEHEKIBa96fAFm0
	2adhGPoBqCQigxm6XeChQ1AaDLda/AVjMLVQG9UoQ6F8XNhgUUvj+UTc6dPvT8S2m5E5
	Lg0UOtPtKSeAU+lGUIgH9uoLU0MaeDCvXvWIaktanlryMvZHqyH+2zg1JtjWeiGjzOUX
	pRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=W0A43MC4zNj7sAkiSAZiLvlsVFAQRSfVtuJLtAgkEB4=;
	b=SY/miQHPW/3OgMqhkhM2IEfS7VbF3COaP1aAoxaTDezwgcffxZCCkfIgHeJOl0Z1Kc
	ZZuUEV1TvE3E9qBOFwe5K0IpYgLwnEYlEsYGQgMn56obwB/vdA5pujWEk0ga/wZswvys
	XNpdUs61sVYNWH7ROqaGsUyPcXbcQWmiYdpWrxLGR5E6By/nMHJawjR5REtR7NQXQZek
	FWtdNzpOHbxpfasbhKauH6jGn420fjr+Q9JDEanOGu9ZltJDk0qJaQl2DBGaOSU5RWKL
	fxaaA5OopmWcqtDpVgJ50n0d5YD2lAUpD0kAy8a2nRBfEGysx9jXJ6BB9RGqsbD6qGOS
	nDjg==
X-Gm-Message-State: AA6/9RldNfCEIsqjDdAwsQXSIR5+m6PC/MG4mVE4Dny9Xk9jCYZugczFG4fePBRMiglWv+vNinuzCTLZ0yyHUQ==
X-Received: by 10.202.235.10 with SMTP id j10mr8669064oih.103.1475683178699;
	Wed, 05 Oct 2016 08:59:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.181.7 with HTTP; Wed, 5 Oct 2016 08:59:08 -0700 (PDT)
In-Reply-To: <20161004205619.GA31579@toto>
References: <1475604703-3381-1-git-send-email-rutu.shah.26@gmail.com>
	<20161004205619.GA31579@toto>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 5 Oct 2016 08:59:08 -0700
X-Google-Sender-Auth: MxQ5qUB30L24s8bKRikkfwiePls
Message-ID: <CAKmqyKNMegok16kHv2FWxeQrOQt=w7QL0HGVd8oKvYoAMsQbXA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCHv2] Reducing stack frame size in
 stream_process_mem2s()
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, rutu.shah.26@gmail.com,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HpcNONs8OMLu

On Tue, Oct 4, 2016 at 1:56 PM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Tue, Oct 04, 2016 at 11:41:42PM +0530, rutu.shah.26@gmail.com wrote:
>> From: Rutuja Shah <rutu.shah.26@gmail.com>
>>
>> Hi,
>> This patch allocates memory for txbuf in struct Stream rather than the stack.
>> As a result, the stack frame size is reduced of stream_process_mem2s().
>
> Hi Rutuja,
>
> A nit-pick:
> The commit message is not meant to be a converstation-like message, so
> normally we don't include greetings.
> The expected format is to have an empty line between the message and
> the SoB line.
>
> Here's an example:
>
> Allocate memory for txbuf in struct Stream rather than on the stack.
> As a result, the stack frame size is reduced for stream_process_mem2s().
>
> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
>
>
> Other than that, this looks good to me:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

I agree with Edgar, just taking out the hi and adding a new line
should be enough.
That can probably be done when applying it?

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
>
>> Signed-off-by: Rutuja Shah <rutu.shah.26@gmail.com>
>> ---
>>  hw/dma/xilinx_axidma.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
>> index b135a5f..6065689 100644
>> --- a/hw/dma/xilinx_axidma.c
>> +++ b/hw/dma/xilinx_axidma.c
>> @@ -111,6 +111,7 @@ struct Stream {
>>      unsigned int complete_cnt;
>>      uint32_t regs[R_MAX];
>>      uint8_t app[20];
>> +    unsigned char txbuf[16 * 1024];
>>  };
>>
>>  struct XilinxAXIDMAStreamSlave {
>> @@ -256,7 +257,6 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>>                                   StreamSlave *tx_control_dev)
>>  {
>>      uint32_t prev_d;
>> -    unsigned char txbuf[16 * 1024];
>>      unsigned int txlen;
>>
>>      if (!stream_running(s) || stream_idle(s)) {
>> @@ -277,17 +277,17 @@ static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
>>          }
>>
>>          txlen = s->desc.control & SDESC_CTRL_LEN_MASK;
>> -        if ((txlen + s->pos) > sizeof txbuf) {
>> +        if ((txlen + s->pos) > sizeof s->txbuf) {
>>              hw_error("%s: too small internal txbuf! %d\n", __func__,
>>                       txlen + s->pos);
>>          }
>>
>>          cpu_physical_memory_read(s->desc.buffer_address,
>> -                                 txbuf + s->pos, txlen);
>> +                                 s->txbuf + s->pos, txlen);
>>          s->pos += txlen;
>>
>>          if (stream_desc_eof(&s->desc)) {
>> -            stream_push(tx_data_dev, txbuf, s->pos);
>> +            stream_push(tx_data_dev, s->txbuf, s->pos);
>>              s->pos = 0;
>>              stream_complete(s);
>>          }
>> --
>> 1.9.1
>>
>
