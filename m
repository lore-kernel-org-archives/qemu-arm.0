Received: by 10.223.197.9 with SMTP id q9csp2560321wrf;
        Mon, 9 Oct 2017 08:20:33 -0700 (PDT)
X-Received: by 10.55.165.213 with SMTP id o204mr10014951qke.313.1507562433451;
        Mon, 09 Oct 2017 08:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507562433; cv=none;
        d=google.com; s=arc-20160816;
        b=Aft54ERQochyS4EHmhT70c99NiffW8fYQQq6NhrQ/Ers8E9WfAKsJEClAclhtPLWBf
         AwfUnRZWHvxBDo4i0GHyQglBoFlWe8KUW2GuTjlRgPpkGZ9yvCmQwVV86llz7leQyWa0
         QJ/zDjQI1og22rvSTYAom11AqYCy+dJtT4BSHHIfufIsjKvfO5AwICorXQTYmXI6khH3
         RqcKfDK0SVZhCl7NbiSbpumzZlihBwhr04fcAoqGRA0PSV5H0n+JGmfZXFTZRXoKz5V6
         +fdxeI07/2eeYN1ruNU+YrIpOl9YfV3a3Rw+kJol0F7mcOQE4CS/Ljiwb5dVWpDkQR5V
         MImQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=efzJBKrisxtoKBuMftvbE6gT5lfzkAinRLOSpAwWSaw=;
        b=kDMrzSsNJD6eKEenOPcXGLTYUB1GcekzHDRf2oC0hKHkq2VMTYlyi7NlB98oiwxAZ8
         IHNz2C0P2gsvU5z96DfRoZX9osBd9ADOuMyuOJbN3Im+RKXOzCyCkZVTsOsLfe2BKHdh
         LPRHGWQDgOcMEw+T/fi139ejQaMu9RNIeF2xGjGuIrqy5rAmoJq8LB0CfJk9GynCwLyQ
         oFFryhaVcF5+SL3MmaCy8cSxK3D7W4WXSygZ1/a6Kjt43zc5D4anpDTpXRbwYR54oFm0
         aB4NYyPJkBe9pdGEIPN6Dwf+1oTqPtrEdC9twGqrnv+PMBPaXoukgRmYW4Z974A/0hTx
         sJqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FSZdrjZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s86si6593629qki.90.2017.10.09.08.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 08:20:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FSZdrjZ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1Zr6-0000f2-SZ
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 11:20:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZqU-0000E9-EB
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:20:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1ZqT-0005Ds-Dh
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 11:19:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36898)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1ZqT-0005Dj-8j; Mon, 09 Oct 2017 11:19:53 -0400
Received: by mail-qk0-x243.google.com with SMTP id a12so13880339qka.4;
	Mon, 09 Oct 2017 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=efzJBKrisxtoKBuMftvbE6gT5lfzkAinRLOSpAwWSaw=;
	b=FSZdrjZ2VgpkhYhp6tre+EXeDBYLedq7ZXzOrKyFX3shNBLuAe64WqajhgbHRTuKFz
	wK32dbSzdbN6v48S9kZN0r/U1lZDX/kVJJLfOcYBhe+wxjZFYugQolRux7HjKAfx9Cwe
	XxmpstcCdeFFRAdiHNzBll78AH9RO3bxr6QlvKtaJyF7dM+GMp/wB3Fg77vq9KFZIlDt
	0/lqIMvEvH1x3u9VLKMUnfHYwQyV2RjKnXZkMCAUhcSGXrihYvCPH4IlUvTpnpbevmMV
	fQK256mqv2bB6gqqoC3Np6Ag4lkro7/Es0Xx7dcRlD605f2OedzMkSToeF13c46lrLXa
	7tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=efzJBKrisxtoKBuMftvbE6gT5lfzkAinRLOSpAwWSaw=;
	b=mN/eVWjnPpo2eV1MkGNHx6vMsUMFdwJF09jq/gdRCMFK9gN9cKwfqxWKmRCZVLJWoB
	yVbZoPVN9+Nt3mILJmDXiD6FHkpRjUhc/gbyPpeGmgFW+WEiLncC7vNRLCNi0SVbu0ti
	SoiEz+VkOXwcoN+YNWHOwAL+5JsXZSxpP1j979dcYpvaKgKN6j0Ve8DNSjjMWSpXdd1r
	5XCINDoEw38qRjXBCuFpyoHnn5+DmJCH1OEPHX6mKeINlgST/mvdAuLVlqvhTv7rTqLh
	KoZ6DVXrDxtxQp8tjDecXCb0tnF4juOwlR3bm5Q+K0hqfq0rldkJYhJL5nQC9fAcb4yG
	MOgg==
X-Gm-Message-State: AMCzsaWO1D2myxvM8PC8Qa0a1ARyBr9PZhMZiafvrxkOrkLQX5/u7Ix8
	wsI3loprtuAyY4jt+ABNdN2M783zvcQLr1kdPWs=
X-Google-Smtp-Source: AOwi7QAVcfgLnCC3tU+8dRp3SPcLTa4yPjuydKSMnw+284+6iYPuJrmVEz0wmI8ox+Agxb8SqE52M4mnT5hT3MVjiS0=
X-Received: by 10.55.201.135 with SMTP id m7mr10161619qkl.97.1507562392555;
	Mon, 09 Oct 2017 08:19:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 08:19:51 -0700 (PDT)
In-Reply-To: <CAFEAcA_KTvAN8qa7Qq=kxKSVgJQLQJ++BguQsVHB6PGiFuoFvg@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-6-andrew.smirnov@gmail.com>
	<9a757d6e-6745-9df4-7199-d55ee2510d8f@amsat.org>
	<CAFEAcA_KTvAN8qa7Qq=kxKSVgJQLQJ++BguQsVHB6PGiFuoFvg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 08:19:51 -0700
Message-ID: <CAHQ1cqEtbjLG0cOEFB5p34XCZ-=OuQ0OO_TJv2030q_nsUtK-w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 05/17] imx_fec: Use ENET_FTRL to
 determine truncation length
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HwQfsgZXMjH4

On Fri, Oct 6, 2017 at 7:00 AM, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> On 30 September 2017 at 01:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>> Hi Andrey,
>>
>> On 09/18/2017 04:50 PM, Andrey Smirnov wrote:
>>>
>>> Frame truncation length, TRUNC_FL, is determined by the contents of
>>> ENET_FTRL register, so convert the code to use it instead of a
>>> hardcoded constant.
>>>
>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>> Cc: Jason Wang <jasowang@redhat.com>
>>> Cc: qemu-devel@nongnu.org
>>> Cc: qemu-arm@nongnu.org
>>> Cc: yurovsky@gmail.com
>>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>>> ---
>>>   hw/net/imx_fec.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>>> index 767402909d..989c11be5f 100644
>>> --- a/hw/net/imx_fec.c
>>> +++ b/hw/net/imx_fec.c
>>> @@ -1050,8 +1050,8 @@ static ssize_t imx_enet_receive(NetClientState *n=
c,
>>> const uint8_t *buf,
>>>       size +=3D 4;
>>>         /* Huge frames are truncted.  */
>>> -    if (size > ENET_MAX_FRAME_SIZE) {
>>> -        size =3D ENET_MAX_FRAME_SIZE;
>>> +    if (size > s->regs[ENET_FTRL]) {
>>> +        size =3D s->regs[ENET_FTRL]; >           flags |=3D ENET_BD_TR=
 |
>>> ENET_BD_LG;
>>>       }
>>
>>
>> for this to be ok you need to update imx_enet_write(), such:
>>
>>      case ENET_FTRL:
>> -        s->regs[index] =3D value & 0x00003fff;
>> +        value &=3D 0x00003fff;
>> +        if (value > ENET_MAX_FRAME_SIZE) {
>> +            warn_report("%s: guest requested bigger "
>> +                        "frame size than QEMU supports "
>> +                        "(%u > %u)", value,
>> +                        ENET_MAX_FRAME_SIZE);
>> +            value =3D ENET_MAX_FRAME_SIZE;
>> +        }
>> +        s->regs[index] =3D value;
>>          break;
>
> Yes, and also an incoming-migration post_load callback that
> fails migration if the value is too large.
>
> It might be simpler to truncate to the smaller of the ENET_FTRL
> register value and ENET_MAX_FRAME_SIZE.
>
> (PS: what is the hardware behaviour if ENET_FTRL is set to
> a larger value than ENET_MAX_FRAME_SIZE ?)
>

I haven't tested it in practice, but I assume that hardware should be
capable of receiving packets of up to ENET_RCR[MAX_FL] bytes big (both
RCR[MAX_FL] and FTRL are 14-bits), since that would allow supporting
networks with jumbo frames.

What if ENET_MAX_FRAME_SIZE is increased to 16K instead? Would that
make all of that additional error checking code unnecessary?

Thanks,
Andrey Smirnov

P.S: And sure, I'll fix the typo in v2.
