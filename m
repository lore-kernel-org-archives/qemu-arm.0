Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp994338wrd;
        Thu, 23 Aug 2018 03:16:31 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzkRtNrC41gU+9uSiZ10RKsGQ1v6xm8+p1lejZ7IYwYnKm8CF4QzHp8eRqD3LlhxXdp/X1i
X-Received: by 2002:a0c:fa4e:: with SMTP id k14-v6mr48154663qvo.35.1535019391254;
        Thu, 23 Aug 2018 03:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535019391; cv=none;
        d=google.com; s=arc-20160816;
        b=bSy2vCagRw3f0nqhexKnrrY0RXzaz0CAFoKX8lem84D811TixA7lRveIypCwuJ/y2h
         vdFqxj3pMMSlAmYc+ZDEWtIdPuR2cZGdZT6ty6bGRW4SjfmX6slrQyXBxK/rnQxIHluh
         l4a9TNjt33QQi+JlnkzQAhzZH6A924vl1gbCWVipFlNPluvYOU+eS8NYyqW3R5e/eTiz
         hM/lZias8SSQNUVt6qZgTjJ4O6S05ZITGEXELyn56GqDHARx8Ji2nzV+sMxXBu0kYVqe
         +V2gUulMjXFfeq5pgRZMUdvQLDdRgTxZYFLxcMNOtlLEDLIiX3ogX+w/KRwabTiQTA7I
         wxtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=m7UqRsZINfm6EuxujadMg0X2ODcDAKGGwJPc6rt3n0s=;
        b=Lf2dz5z3JFNVlXTOPyzFVqWpf5jKY5jy0Vc8PCYmx+ZEz3PqP1P4JguQtp8fA/WtfG
         EylPAnSsgNPAARHYPATfJJl/81LclVeyZlAeClxubx8wCWqn6fg2KfyZhBeJy2DZWIBG
         ApxQlYEspM/OPl08/4b7rC+oJpU8gqBz+r2LI7MY6jZdrbpaCTLvvrSkIkuR9eponEnH
         bs/FkrWytxhrueWo3gAV0hAV5FW3DKCVNBcwBXli9kwryZzABz9+nP5l4ODX9jQdTnKJ
         j6del/+9v5KaM1GrsYEV294cc/LIImbbec7XkoBYQo9wQ39wf2hP8iWZ2f3yuTB5cDX9
         yy1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gMAhew33;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g28-v6si52600qvi.238.2018.08.23.03.16.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 03:16:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gMAhew33;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fsmfG-0000qD-OG
	for alex.bennee@linaro.org; Thu, 23 Aug 2018 06:16:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsmf5-0000q2-PC
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fsmf4-0004Vy-9G
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:16:19 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:45720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fsmf4-0004VI-14
	for qemu-arm@nongnu.org; Thu, 23 Aug 2018 06:16:18 -0400
Received: by mail-oi0-x242.google.com with SMTP id q11-v6so8292196oic.12
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 03:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m7UqRsZINfm6EuxujadMg0X2ODcDAKGGwJPc6rt3n0s=;
	b=gMAhew33iBpPVu3eKWQS4CmlPWvRuq8ADc7G9xw2IJaV51eMMztGXPgRHd6Hd/pPch
	mkesrEzNEyGjOQd7DQyOAi4qp6uS5JcZSxnX1ISQj9/XoeH3NVkH9noWstHL83BoIleA
	I4FRbIANHVAZzSCrWKDInuqvQwJzwprjfcfvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m7UqRsZINfm6EuxujadMg0X2ODcDAKGGwJPc6rt3n0s=;
	b=krQvMs+E91/WGG/skKaU0svOmFfF+Qx+M7B2PvEGZ2OL+7CDspCF8Me48dEUklbBoo
	3u/EHXxab944UguGF261GhtIsEX8lTxoOStKE9bVphToJq2zEg1zuWNGKxqhxWxWpAkp
	bpzE4rY5natyshF1RLfj9q+aCyksnaVvUqx9jsWpHWk6DvItIOlvwo2vEFG2PCtfE6Ms
	2buW9oTujO6WPKReoIoceBOHUw4A9wQ/6IcGX++OR0nBgxZi4rbYVYodXf+CC+KJsqeX
	IhlDX7AMdApPcnUf23PBetPVc+DFSwxl13/RUE1lZgpnZq2HySwMQdSpMbGm4vtttwB1
	m/6A==
X-Gm-Message-State: APzg51DUzLPLeO3dkdjVFLaniVudS1hvGHc/R/u33tVRm/iGdVNqNPYF
	R7f4hnnENtIP5GVgGkwPkCXuGDvgxSeU5SradIuzaQ==
X-Received: by 2002:aca:ac54:: with SMTP id v81-v6mr7377145oie.1.1535019376465;
	Thu, 23 Aug 2018 03:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 23 Aug 2018 03:15:56
	-0700 (PDT)
In-Reply-To: <7421acd0-4c9d-95ca-dbd2-a903ef0ee2b8@greensocs.com>
References: <20180821132811.17675-1-peter.maydell@linaro.org>
	<20180821132811.17675-2-peter.maydell@linaro.org>
	<7421acd0-4c9d-95ca-dbd2-a903ef0ee2b8@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Aug 2018 11:15:56 +0100
Message-ID: <CAFEAcA9iZwxtBLVeungN5FNc2AhhZQzKQ+C5sJRj0S4XJ6qA6w@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 1/9] hw/intc/arm_gic: Document QEMU interface
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
X-TUID: roPThU7+D+sX

On 22 August 2018 at 09:15, Luc Michel <luc.michel@greensocs.com> wrote:
>
>
> On 8/21/18 3:28 PM, Peter Maydell wrote:
>> The GICv2's QEMU interface (sysbus MMIO regions, IRQs,
>> etc) is now quite complicated with the addition of the
>> virtualization extensions. Add a comment in the header
>> file which documents it.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> I needed to write this out to figure out what I was
>> connecting to what in the a15mpcore object :-)
>> ---
>>  include/hw/intc/arm_gic.h | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/include/hw/intc/arm_gic.h b/include/hw/intc/arm_gic.h
>> index 42bb535fd45..989bc837606 100644
>> --- a/include/hw/intc/arm_gic.h
>> +++ b/include/hw/intc/arm_gic.h
>> @@ -18,6 +18,41 @@
>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>
>> +/*
>> + * QEMU interface:
>> + *  + QOM property "num-cpu": number of CPUs to support
>> + *  + QOM property "num-irq": number of IRQs (including both SPIs and PPIs)
>> + *  + QOM property "revision": GIC version (1 or 2), or 0 for the 11MPCore GIC
>> + *  + QOM property "has-security-extensions": set true if the GIC should
>> + *    implement the security extensions
>> + *  + QOM property "has-virtualization-extensions": set true if the GIC should
>> + *    implement the virtualization extensions
>> + *  + unnamed GPIO inputs: (where P is number of PPIs, i.e. num-irq - 32)
> "where P is the number of SPIs"
>> + *    [0..P-1]  SPIs
>> + *    [P..P+31] PPIs for CPU 0
>> + *    [P+32..P+63] PPIs for CPU 1
>> + *    ...
>> + *  + sysbus IRQ 0 : IRQ
>> + *  + sysbus IRQ 1 : FIQ
>> + *  + sysbus IRQ 2 : VIRQ (exists even if virt extensions not present)
>> + *  + sysbus IRQ 3 : VFIQ (exists even if virt extensions not present)
>> + *  + sysbus IRQ 4 : maintenance IRQ for CPU i/f 0 (only if virt extns present)
>> + *  + sysbus IRQ 5 : maintenance IRQ for CPU i/f 1 (only if virt extns present)
> I think it's more like
>
> For a GIC supporting N CPUs:
>   + sysbus IRQ 0: IRQ for CPU 0
>   + ...
>   + sysbus IRQ N-1: IRQ for CPU N-1
>
>   + sysbus IRQ N: FIQ for CPU 0
>   + ...
>   + sysbus IRQ 2*N-1: FIQ for CPU N-1
>
>   + sysbus IRQ 2*N: VIRQ for CPU 0
>   + ...
>   + sysbus IRQ 3*N-1: VIRQ for CPU N-1
>
>   + sysbus IRQ 3*N: VFIQ for CPU 0
>   + ...
>   + sysbus IRQ 4*N-1: VFIQ for CPU N-1
>
>   + sysbus IRQ 4*N: maintenance IRQ for CPU i/f 0 (only if virt extns
> present)
>   + ...
>   + sysbus IRQ 5*N-1: maintenance IRQ for CPU i/f N-1 (only if virt
> extns present)

Yes, indeed. Since this is just a comment patch, I'll apply
2-9 from this series to target-arm.next and respin this patch.
Thanks for the review.

-- PMM
