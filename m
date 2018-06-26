Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4801573wrq;
        Tue, 26 Jun 2018 02:40:46 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdIHQ2xxzxLwQctqu9SKQ8HfUMB0snqqlzAxlvmOpqHWST2RE4IeHor09CWb2HJFL+Q9hxW
X-Received: by 2002:aed:3f7c:: with SMTP id q57-v6mr634762qtf.256.1530006046722;
        Tue, 26 Jun 2018 02:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530006046; cv=none;
        d=google.com; s=arc-20160816;
        b=cRQSXrmE1APRRBMoy7MHlClciD1C5QmhS6ij8dvAWo6mmdE4EbgPUkxw/7oWTZlswe
         jp4m4EiXaHK4c8pWry0Swgu3PSSyeDU5CXhCYLhgBPIqPNJ2AIBNSV3J+biyEDu6eQyI
         t55YElGnm2WRfmnEDq5HgAX0PCuYW/knS0MG/10l9wywrrsnubs9bqEq4FvfXqz8Mv5x
         qZsNVALgX1sWQOTVp2Y3ewImTueI6jNlC83MW3ngtEbkTkw3hds0snMhIvyfcrHrmXw9
         nYbY5wtxl8UsjcdMWqzoLuPi1maDsI33DhPnpSWU2aR3eX/SNCPZE9uLH4bsF+JFI8WZ
         Vw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:openpgp:from
         :references:to:dkim-signature:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=fYyjrLOt7JozZ+afQOc4QLjRNjCC408ChdRhls3Er/c=;
        b=VvQPJOwjRQY5dfv+yY2wTn7D9MyV9mXvLMvJF9zu9RXCQMtaK8mg1pNG4p+Y8kOUPR
         UTyRcxYv3ih17CJqKt4X4jw/u8mQJtxUxHfj8Xs4+LPXEUIpPZYb9lt+uP1PqTjMwvQ7
         8P/DvkZQ7qAcxn8oShJIdC+Hj71JAWY5adgiOVSVKXzj40QJ5vC74IPYsNfCsWm9JVw7
         QLC5c2CV01HnbeRDIoYdHH1ZSeUFHWxh2fCmzLsScUm31x8m80ZrnXwtKbFqGN0bRq73
         l6yAWPzGpeBaXdYvJ8R8oqaBJL1DTYTP2GuBYfsvBaModfnufdaJQdkT7PE3GgW87atu
         Jt2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YJkpdufi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U6CAari4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U6CAari4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si1130098qtg.212.2018.06.26.02.40.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 02:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=YJkpdufi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U6CAari4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=U6CAari4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXkSs-0002D2-8O
	for alex.bennee@linaro.org; Tue, 26 Jun 2018 05:40:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fXkCs-0006GW-5v
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 05:24:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fXkCp-0002SE-1W
	for qemu-arm@nongnu.org; Tue, 26 Jun 2018 05:24:14 -0400
Received: from greensocs.com ([193.104.36.180]:53662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fXkCo-0002S7-Ln; Tue, 26 Jun 2018 05:24:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id D2A1844B85A;
	Tue, 26 Jun 2018 11:24:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530005041;
	bh=l/jQRZkdBbPtTsKq003+SnEhATjEL1c7cJLZvL2BHhY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=YJkpdufiUxWut5WnSviF0IZPccqeKcqlnPehohnHdHl6lW5VbJq20MoFC5WV5IWZo
	okq0Ghuodc3Ts8IANvlOUFZjKPctnHWTEsEuuGUnQzBYzjwkTa/bI5eVtBka4zzZZL
	Z8D4re5bl4OtjuYARFYEcWhJL6sGGDt2ShpvU5qw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U6CAari4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U6CAari4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-au7WUp2FnS; Tue, 26 Jun 2018 11:24:01 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EF35244A0E4; Tue, 26 Jun 2018 11:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530005040;
	bh=l/jQRZkdBbPtTsKq003+SnEhATjEL1c7cJLZvL2BHhY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=U6CAari4w351jF+y3FUEx85EM0kdseQyLZbny14Bn+ROgzL8HvsCO+P7mKhZmEL/C
	vcXiF7OqFPcHUA+7MYgGGshsReqe2r/FhpBUsyxRo1cBMQYlGzcrk3ybZF+Dr7RWuz
	RwxVIcQ/niJ/nGgelZyOhlvV60U8N61xfrFMKor4=
Received: from [172.16.40.3] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9558E44A0E0;
	Tue, 26 Jun 2018 11:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530005040;
	bh=l/jQRZkdBbPtTsKq003+SnEhATjEL1c7cJLZvL2BHhY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=U6CAari4w351jF+y3FUEx85EM0kdseQyLZbny14Bn+ROgzL8HvsCO+P7mKhZmEL/C
	vcXiF7OqFPcHUA+7MYgGGshsReqe2r/FhpBUsyxRo1cBMQYlGzcrk3ybZF+Dr7RWuz
	RwxVIcQ/niJ/nGgelZyOhlvV60U8N61xfrFMKor4=
To: Jan Kiszka <jan.kiszka@web.de>, qemu-devel@nongnu.org
References: <20180619093124.24011-1-luc.michel@greensocs.com>
	<d3c05355-4eda-f501-8f04-d808f416393a@web.de>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <3c8fa899-e420-15a0-a2af-8d92ca390a85@greensocs.com>
Date: Tue, 26 Jun 2018 11:24:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <d3c05355-4eda-f501-8f04-d808f416393a@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="zKodnuYuSGrEwEQDM9SmVJ0VPRCh8jBds"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v2 0/7] arm_gic: add virtualization
 extensions support
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
Cc: saipava@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	edgari@xilinx.com, qemu-arm@nongnu.org, mark.burton@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z9NvemwqzVl3

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zKodnuYuSGrEwEQDM9SmVJ0VPRCh8jBds
Content-Type: multipart/mixed; boundary="BoEn6kjaCnjFF4muXnIcwcmrgxuUZO5CO";
 protected-headers="v1"
From: Luc Michel <luc.michel@greensocs.com>
To: Jan Kiszka <jan.kiszka@web.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 saipava@xilinx.com, edgari@xilinx.com, mark.burton@greensocs.com
Message-ID: <3c8fa899-e420-15a0-a2af-8d92ca390a85@greensocs.com>
Subject: Re: [PATCH v2 0/7] arm_gic: add virtualization extensions support
References: <20180619093124.24011-1-luc.michel@greensocs.com>
 <d3c05355-4eda-f501-8f04-d808f416393a@web.de>
In-Reply-To: <d3c05355-4eda-f501-8f04-d808f416393a@web.de>

--BoEn6kjaCnjFF4muXnIcwcmrgxuUZO5CO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 06/25/2018 06:55 AM, Jan Kiszka wrote:
> On 2018-06-19 11:31, luc.michel@greensocs.com wrote:
>> From: Luc MICHEL <luc.michel@greensocs.com>
>>
>> This patch series add support for the virtualization extensions in the=

>> ARM GICv2 interrupt controller.
>>
>> The first two commits do some refactoring to prepare for the
>> implementation. Commits 3 and 4 are the actual implementation. The las=
t
>> commit updates the ZynqMP implementation to support virtualization.
>=20
> Is it enabled for the virt machine as well? Seems we are missing some
> mapping of GICV and GICH there.
>=20
> And what is the recommended way to get the ZynqMP model running? I've a=

> kernel that works on a ZCU102, but just passing it via -kernel to the
> QEMU model seems insufficient.
Hum, I think it should be enough. This is the way I run my tests with Xen=
:
qemu-system-aarch64 -M xlnx-zcu102,secure=3Don,virtualization=3Don \
                    -m 1024 \
                    -kernel xen-kernel -nographic -smp 1

--=20
Luc
>=20
> Jan
>=20


--BoEn6kjaCnjFF4muXnIcwcmrgxuUZO5CO--

--zKodnuYuSGrEwEQDM9SmVJ0VPRCh8jBds
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlsyBjAACgkQd8knW3Qn
Tr6e4Q//XoMOFLjSiLpUI9Ley1wkFmrakm/0EOG0aBE4rZheJy1EXpQc5AX3eAiG
s4oA2Cw6gwaSgGpKqLf3VUOA9/u0lfNSquJrQlEGhYKbZqQuxGfxn9cGpMDWQdmQ
pTXMoVHM6CuZSdLF77GYVYYg4X+kMBpVTkaE1qjNuCYccennAeg9RNlX8tUH1byR
uRdNJACJjz9hCDPhtEVYoh4t7NOYprV+dax1WBBrolTgTtXSArL6WSRJTgRA5Xy3
kEDd+L7iG9chK1PA959L2gCLSCFK21xhj/JAT4TjNvODcrJbHb4DYo8HG5i10Vsy
hhpwVo1JI+869EpnMb4FmjvKDVY1lcItAc1VPabzJiiD9qD6zv1BdcMV9ffgWgMa
wpq6yfuEZvxpRASHhDm9h2YQuel6jZ0PHyXLg7PBCp+akyx/zYZheHsXkAWNa9fm
43cAyIwpFKxuLO12SGO6R7yyy0CJfCRjkEZKzLShM6y5d2KNGdAbCMeBwZkhDRAv
dB08LtkO9XbSbHxBFJoBJvkDT1Vx6gY9NPwZzEn39iFzrQZfOwDiaudsBPjuJyXl
rY3yjEGJcgtwX1AOZr1ymu3zvQd3R1AOPdqV81mIFsBvsobMQmbsjhMn3uWcqHku
fMZBN8aqpTkQuOGERc/yGOaZl5rSGR7OP63dRuh6qeqQpJ22qSM=
=dT8Q
-----END PGP SIGNATURE-----

--zKodnuYuSGrEwEQDM9SmVJ0VPRCh8jBds--
