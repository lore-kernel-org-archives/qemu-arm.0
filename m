Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp694060wrq;
        Fri, 13 Jul 2018 06:34:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeeYOEvjQ/2VrBoZxphWl3n/E8F8x6i9ZZ2PpbSUMB8QwyJIkMoobwXvb46jFSyoTU5cWfO
X-Received: by 2002:a0c:9aef:: with SMTP id k47-v6mr7018132qvf.134.1531488847298;
        Fri, 13 Jul 2018 06:34:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531488847; cv=none;
        d=google.com; s=arc-20160816;
        b=z8YH6s9QXgHUS/n1xrLOmmYnqo5JoQN2lm5YLB1h42FGh8n3rthnEyMgCYLTN9KQTe
         UbjnkDgmjMbXkv6KqvC9+y0pdFRN6aGfr8BsHyCTp/JdUGfXSPirdS/m0Z1NMThocxI/
         WyTsm3no0GMiN0s8ynufhBPcQfYm6WZMF3LEkpGdJ+lZDTmTPep56zjHFssuOqNaOfwC
         Wcz5DmG4TbRlzODquxM23biljT7DaAFODb3uE6PWjqONdZ+/tlxr/yw/lnuxESCmoKcm
         yCUJnd9QmWnzQLuXhUlKZkdPBfQ0oBM8q58X1VJtVkU3qctWPZFsCnlY+jmjzR9mrBSy
         0e3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bj0ewBigBlZ5pgroXQUcWbLbC4d50aXRMB4a9hxae6Q=;
        b=NsHPbxA5SQjfyLdwXT7/OLhs1UKRwE08whTF9EvB2UFJ3K4mTqV9tdpy1WRLBkFQwP
         u/v0hDVlDsWNqCKxDq7WG/10fJb0GnESUZGulvRK0DgpczVQzZSzAiLGOHgsEmhSQvxe
         80wYsxhYPlvQHkfYBdWeNpOMcj/YNceMJpfZ97k2O5D20haKTOSSXTQofXsHqAthrc1x
         7BGCzAagxCGOr4kDWL1xmxylDGwK4jJuqvd+7AN7bxlPOOtjw+3y/U3GDZGA5VVJ7Ah+
         YvXWW5S/OiaPYIArqZOuQiKzDkgI/ZrDtoJQcRbiY6J73TpezM8qn+1yDAdFQAy6zUYw
         k9VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=RhTWs6vn;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C0nWLXBc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C0nWLXBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 198-v6si7306839qkh.21.2018.07.13.06.34.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 06:34:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=RhTWs6vn;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C0nWLXBc;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=C0nWLXBc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdyD0-0006P4-P4
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 09:34:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdyCg-0006Ki-BA
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 09:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fdyCd-00016c-7j
	for qemu-arm@nongnu.org; Fri, 13 Jul 2018 09:33:46 -0400
Received: from greensocs.com ([193.104.36.180]:52796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fdyCc-000166-O4; Fri, 13 Jul 2018 09:33:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 245E4C7AE0;
	Fri, 13 Jul 2018 15:33:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488813;
	bh=qLNOvcv+7wGSzEPBqrP9q9dcKO4hQcSRgpWXx4JYfdg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=RhTWs6vn8teXX4FlfcRs3fhi1Vefl9c8dKwtRMGFxOOL9XMbuVyhw6xBfFxe/HVzx
	smUpXnZTf0GUirHeUkEKVF19B6C0JuxfylZ6z87bJmg2h4Wqdf6UdLxj60loFwjFo2
	Q9Sp4np2ErLUIXLP4ppZYibi8nBMttWez/NonMq4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=C0nWLXBc;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=C0nWLXBc
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id onrKWwntEWMZ; Fri, 13 Jul 2018 15:33:32 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 391E7C7AEB; Fri, 13 Jul 2018 15:33:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488812;
	bh=qLNOvcv+7wGSzEPBqrP9q9dcKO4hQcSRgpWXx4JYfdg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=C0nWLXBcZT1X63RpqkIX4LqLEjEV0UwB3ULEURfp1xhMUpj0v1rXQ/hG9njLMFcMB
	132Z/hfiOti90AJvqEN4MxhEbJYTKbVoG0ZVuPiNdZyIIBYdwfzb+dbhSd4NC4JcCq
	lBUBTrjw3f1snQM1F6XXqBUax8mu8n1yIDv1pp58=
Received: from [192.168.1.5] (unknown [105.98.62.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 8A859C7AE0;
	Fri, 13 Jul 2018 15:33:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531488812;
	bh=qLNOvcv+7wGSzEPBqrP9q9dcKO4hQcSRgpWXx4JYfdg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=C0nWLXBcZT1X63RpqkIX4LqLEjEV0UwB3ULEURfp1xhMUpj0v1rXQ/hG9njLMFcMB
	132Z/hfiOti90AJvqEN4MxhEbJYTKbVoG0ZVuPiNdZyIIBYdwfzb+dbhSd4NC4JcCq
	lBUBTrjw3f1snQM1F6XXqBUax8mu8n1yIDv1pp58=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-17-luc.michel@greensocs.com>
	<CAFEAcA_fFsqwr316OLcZVwBs72ESLob1AKDZN24JfFo78zQ=AQ@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <f32095a2-72b7-662d-ee58-670c2b322218@greensocs.com>
Date: Fri, 13 Jul 2018 15:33:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fFsqwr316OLcZVwBs72ESLob1AKDZN24JfFo78zQ=AQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="jNatGSrGE5zBqU40d5GY8YLanGzNDm563"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v3 16/20] intc/arm_gic: Implement
 gic_update_virt() function
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33xQ6gqunh8v

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jNatGSrGE5zBqU40d5GY8YLanGzNDm563
Content-Type: multipart/mixed; boundary="k49D1KCkNrugmEALO2u2ar1N2Fg39hCNs";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
 Mark Burton <mark.burton@greensocs.com>, Jan Kiszka <jan.kiszka@web.de>
Message-ID: <f32095a2-72b7-662d-ee58-670c2b322218@greensocs.com>
Subject: Re: [PATCH v3 16/20] intc/arm_gic: Implement gic_update_virt()
 function
References: <20180629132954.24269-1-luc.michel@greensocs.com>
 <20180629132954.24269-17-luc.michel@greensocs.com>
 <CAFEAcA_fFsqwr316OLcZVwBs72ESLob1AKDZN24JfFo78zQ=AQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_fFsqwr316OLcZVwBs72ESLob1AKDZN24JfFo78zQ=AQ@mail.gmail.com>

--k49D1KCkNrugmEALO2u2ar1N2Fg39hCNs
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable



On 07/12/2018 03:56 PM, Peter Maydell wrote:
> On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
>> Add the gic_update_virt() function to update the vCPU interface states=

>> and raise vIRQ and vFIQ as needed. This commit renames gic_update() to=

>> gic_update_internal() and generalizes it to handle both cases, with a
>> `virt' parameter to track whether we are updating the CPU or vCPU
>> interfaces.
>>
>> The main difference between CPU and vCPU is the way we select the best=

>> IRQ. This part has been split into the gic_get_best_(v)irq functions.
>> For the virt case, the LRs are iterated to find the best candidate.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> ---
>>  hw/intc/arm_gic.c | 170 +++++++++++++++++++++++++++++++++++----------=
-
>>  1 file changed, 130 insertions(+), 40 deletions(-)
>=20
>=20
>> +
>> +/* Return true if IRQ signaling is enabled:
>> + *   - !virt -> from the distributor to the CPU interfaces,
>> + *              for the given group mask,
>> + *   -  virt -> from the given virtual interface to the CPU virtual i=
nterface.
>> + */
>> +static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bo=
ol virt,
>> +                                    int group_mask)
>> +{
>> +    return (virt && (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK))
>> +        || (!virt && (s->ctlr & group_mask));
>> +}
>=20
> For a real CPU interface we test the GICC_CTLR EnableGrp0/1 bits here.
> For a virt CPU interface shouldn't we test the GICV_CTLR bits ?
This test is still done in gic_update_internal() (we test
s->cpu_ctlr[cpu_iface], with cpu_iface being the index of a vcpu when
virt is true). I can move it in this function if you think it's clearer?

>=20
> (This doesn't actually cause any wrong behaviour because this check
> is just an efficiency check: "if interrupts are entirely disabled
> then we don't need to do the expensive look-at-all-irqs checks".)
>=20
>=20
> Otherwise looks OK.
>=20
> thanks
> -- PMM
>=20


--k49D1KCkNrugmEALO2u2ar1N2Fg39hCNs--

--jNatGSrGE5zBqU40d5GY8YLanGzNDm563
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAltIqioACgkQd8knW3Qn
Tr5zNA//dGn7wc0V7Gg1AwhLxLSYLB6WFuUDMTO8Io8SPpyDZPuyUox9qJF+z5qy
pxAhMjp5hHM7xb2v5jckK1hIk8A0cZsBG++sug3Y4P/PML+VUGGLP3G8gXTQ1Ypm
6u+BiZDhq6o2SCd1ZJ7b1YOEnb7CvWnKqD4mh83XFFL/6VPrhB8vHossqLLr5s9j
AnQcZYuz/2KDJGh0Bo4sN87f7vtFslP9vOH/iQLFnnxYZPRBRCgfxNuTWql917MF
dQrtIyuSC2pXLidgsF2FyAeyfcCZpKweuWN6A8/CruOR02hgvubC1QasokfdeH46
HmJglAHqsOup+m6kioVYT0npXI8cs5egVlQlGm7CBmdoYE7oIJ9xgKfNC7HcG7zf
VPtaBln9cN1a0V9JALcJeIH9MPYQ2maAkSaP8L/ytxn5Z2Eq4ed3Jjk3gRJTi7RO
rl/lgmrAy6FUfzLLMdTkP41n9dTR17R229QxYjxp16m7/rOZiWiJSZhlngLp3A7h
FMa3k8mMf6s6k8ItsGApAJF18mOlm6TrbiQHsWRugVH/r07JZ87iCT4tj1di57kN
CfAvXSsvdy/sEwx22snyjJ5w7dyPHu7MIfrkgrrqDrxrL0IimQYkYnDOzL8SPr86
OV3yU7wfcZVORBsLMd9Ir41h9gJjMKFoVgeZbX5CKNE82npn9yM=
=0rBD
-----END PGP SIGNATURE-----

--jNatGSrGE5zBqU40d5GY8YLanGzNDm563--
