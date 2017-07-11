Received: by 10.25.44.15 with SMTP id s15csp4815523lfs;
        Tue, 11 Jul 2017 06:10:43 -0700 (PDT)
X-Received: by 10.200.51.172 with SMTP id c41mr11497101qtb.71.1499778643131;
        Tue, 11 Jul 2017 06:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499778643; cv=none;
        d=google.com; s=arc-20160816;
        b=cXIkrEi1YnZi5futPgVV9en5nQdzk6egs5QgWdX74UYMkAhHuqa8ieHYwLDY45YgSG
         Ej29tu4hYMnmcXgzgjsyyy/k+2kYQcdhBksGn3T07YM+XGLTSXgz9gQXOOWgF0Yz6FQe
         t9UmAOtNYzeab92u+xfsncMhP6ubVsbqMUzv5LPZghN88s8UvcAH3PfnTvnuz2QQ5TRu
         vGbuuxhLrDh/C+OoZFqf/FVJIUWZwIipj+GN/jT7EZXWWS8en459IAAXr5FsG3FIFJBs
         qCrsvGrArNIJWTj3vf46DDU68FCxllr/vUU8JkcB+IBhLuOHOnxhWhdjqW2t9ujqq1cl
         XPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=YSNex5T6OdXqL7lFT/5KfvQ5r9DDjdRUDPLus5viEFc=;
        b=PVy4MZSVsjUW7aNxCY7NoGs0FQ8BvJ2RhztztWARRM9DTs27f/m2G1EKQkznDIU7V1
         ZgsAaBMEU/fq0lP7rZKOUcMySh6/+wL1/OcBuyMOgPYMEfKw0wxgOzwcrv7JwRURP+Zn
         vAqJE9HY+fagSrxU1NAbUv7rl/mvNisn+S5B104rNn4A0twR8qRs/Q9vCjDx15RW3G+s
         kYANvjP3h5RVY1m+EKuDY48fqUgqMdwst5B7cMLcLq28NKD9SC9dlYBv5Vqbs0Qm4oEx
         7WU2Wz2deg3+Dx5BxLdvLTjOxgAp5LuroZ2PbF9rH7+wwIAnKZOUu5Ydl9LV1hJ6U8Sv
         SDjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=a5Lb7VQN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h16si9358074qke.283.2017.07.11.06.10.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 06:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=a5Lb7VQN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUuw4-00070r-Ay
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 09:10:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUuw0-00070j-5r
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 09:10:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dUuvv-00010q-O3
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 09:10:36 -0400
Received: from mail-wr0-f180.google.com ([209.85.128.180]:36424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dUuvv-00010M-G7
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 09:10:31 -0400
Received: by mail-wr0-f180.google.com with SMTP id c11so182972877wrc.3
	for <qemu-arm@nongnu.org>; Tue, 11 Jul 2017 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YSNex5T6OdXqL7lFT/5KfvQ5r9DDjdRUDPLus5viEFc=;
	b=a5Lb7VQNinY/3KhyZIHAJmCIan6YXOAbumKVc1hHrisIdHzFmiaSwW7Pqlblt2g/b2
	yp8vRDI5r/Yf9EOQ9rhl4vMubgQtSfYjxC4U/DNv/cuCdTbRFc2ddKQwKkWOJKQwgr27
	Rhqzss+DcRYtj1n0bx+m55tq4lsmhuUWojZlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YSNex5T6OdXqL7lFT/5KfvQ5r9DDjdRUDPLus5viEFc=;
	b=phMegNpTMKCRSzjq8wa9FNoD8Qh/py3Dxmwd5uB1NlhSG5sG0hT8vsbXGpDQT9j++p
	bltJMbx/hcpPI2SLuKCLByxcsun6XPrnvSy6E5Ib842XEQt5VSSvWXzxMPz74fWpnSFY
	5uZuPoy23u99W1mezdrqBUNK3nHow8AyxUSXNQdtvLLAU/VKtbVj6SKUzLSIg13HJNNf
	DRLxCfWQ7zgPFwPnghXnc6BD8E+M4FmjNTf8vTc2gga7+9OjiLGqdfm91XvUoLXgA8zT
	qg4EzIAzl4dprjWfeUOIc4RkWIjiXTOV/bQRyz9RrsOscfgvzn+nfSwkvo2aPbMMplF0
	d8zw==
X-Gm-Message-State: AIVw110tfEtqdga+CsWf1ZCvfxZhB72fnAQ+hfyucwdejwLUA28iYlxp
	6Gk1yQax9RmUXvCwXq+Jh9KGbB2yjSyqs4Y=
X-Received: by 10.28.129.203 with SMTP id c194mr6199736wmd.120.1499778570442; 
	Tue, 11 Jul 2017 06:09:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Tue, 11 Jul 2017 06:09:09 -0700 (PDT)
In-Reply-To: <b3cd94f2-8a32-9b09-54b1-0cfa6eff0c36@amsat.org>
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-7-git-send-email-peter.maydell@linaro.org>
	<b3cd94f2-8a32-9b09-54b1-0cfa6eff0c36@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jul 2017 14:09:09 +0100
Message-ID: <CAFEAcA8cxuj04T5qDE7xPjTEXOcGZdhnZvaGOdmb08KjyjsE3w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.180
Subject: Re: [Qemu-arm] [PATCH 6/7] hw/misc/mps2_scc: Implement MPS2 Serial
 Communication Controller
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hGsmk3g4E43o

On 11 July 2017 at 13:53, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> I Peter,
>
> On 07/11/2017 08:17 AM, Peter Maydell wrote:
>>
>> Implement a model of the Serial Communication Controller (SCC) found
>> in MPS2 FPGA images.
>>
>> The primary purpose of this device is to communicate with the
>> Motherboard Configuration Controller (MCC) which is located on
>> the MPS board itself, outside the FPGA image. This is used
>> for programming the MPS clock generators. The SCC also has
>> some basic ID registers and an output for the board LEDs.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/misc/Makefile.objs           |   1 +
>>   include/hw/misc/mps2-scc.h      |  43 ++++++
>>   hw/misc/mps2-scc.c              | 310
>> ++++++++++++++++++++++++++++++++++++++++
>
>
> Hmm I understand hw/ssi is for Synchronous Serial Interface, this interfa=
ce
> doesn't belong there?

No, it's not an SSI bus -- that's a standardized clocked
point-to-point serial interface. This is just a fairly
ad-hoc communication channel.

>> +++ b/include/hw/misc/mps2-scc.h
>> @@ -0,0 +1,43 @@
>> +/*
>> + * ARM CMSDK APB timer emulation
>
>
> ARM MPS2 SCC emulation

Oops; fixed.

>> +static uint64_t mps2_scc_read(void *opaque, hwaddr offset, unsigned siz=
e)
>> +{
>> +    MPS2SCC *s =3D MPS2_SCC(opaque);
>> +    uint64_t r;
>> +
>> +    switch (offset) {
>> +    case A_CFG0:
>> +        r =3D s->cfg0;
>> +        break;
>> +    case A_CFG1:
>> +        r =3D s->cfg1;
>> +        break;
>> +    case A_CFG3:
>> +        /* These are user-settable DIP switches on the board. We don't
>> +         * model that, so just return zeroes.
>> +         */
>
>
> Shouldn't be hard to have a property (thinking about having multiple boar=
ds
> and using those switches to have some board unique ID, not switches one
> might toggle at runtime).

No, on the board these are wired up to user-toggled switches.
Board ID information is in the ID/AID/CFG4 registers, which we have
properties for.


>> +    case A_CFG1:
>> +        /* CFG1 bits [7:0] control the board LEDs. We don't currently
>> have
>> +         * a mechanism for displaying this graphically, so use a trace
>> event.
>> +         */
>
>
> Well MIPS Jazz uses hw/display/jazz_led.c which is kinda nice :)
>
> Now than there is interest in simulating IoT boards and so, we might thin=
k
> about a generic LED display.

Yeah, if we do this at all we should have generic support (and
ideally you might want to see both the LED output and the
LCD screen output at the same time). This tracepoint is a
low-effort placeholder because I don't want to get into trying
to define and implement a generic LED-and-switches kind of UI.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

thanks
-- PMM
