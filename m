Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6834029wrt;
        Mon, 3 Dec 2018 06:10:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UiSlM5dNHS/m70bbW6jjOPxouU9ekyN9Ow3j//8OvWPGt7pP4ktHm0/bYlou2qLdwg59lK
X-Received: by 2002:a37:be02:: with SMTP id o2mr15119300qkf.133.1543846204431;
        Mon, 03 Dec 2018 06:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543846204; cv=none;
        d=google.com; s=arc-20160816;
        b=r8kHmsDaWUukxivnYV/jtCNPtq8S50+IXuleVVGt7J7HONiXmozsJBtWSnOj/ckZTa
         ulWP/qiHXFvMbDGKLJ8XIXOLbtp12hza5amYGxHWPkPaSCs1omSjpvqjl6BGiByaBOWC
         ElGhFFRAa/1WhbFGVi+OLJ0VmFPOWAPGlHfVxZ1h7yP8GhykmmHjIHlpOuEEL9sXrtud
         ojMzWBoCNLBTCkdc1YaoQCRXK9h9pUZwbS2rP0BkCxyeGxgdsmAD8krZ4wh4pVED888s
         OknIKmL0Ib+5riUhmXlmZlymRt5REpehmQCQW/VIaHzf1xw86EbhBs7WQRWO3itkXlSr
         5x+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=pUzL0eDK4lT9j7sfC/jTYxJhapcQuGTyJwbuy0SLROU=;
        b=oJxbWL2Ms+qqu+3VTlD5eZeOi1wA5KaFQiIy3ilZYorQkTb0n0FxSjtW4pEH5HclX6
         D9ivJrGt7Jic5xQIawLscrVZlgk+nsajQSEws3S2z8TawzGzkt/PCLcYwVd3P9uaWqQI
         0WRvXnpja5zVP9wXbT9i64WFZ5ccRSrT5mH3vaW5sP6kWhHBUypormgKFY3EE1bro89Y
         0kZXt4ZcI+9AtSUhpl/vxySiA/tvtLeBzVP5mdT+PPJBWm+XLyIoMyl08C4vuQMwFXLv
         qKfjPsF4q2AlfZup4Mz7vdBWPHxgTaYLCAb86r1Y0QHdayLjJDr0ieLH3xQuQmVF/sU5
         qEOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yKuKO0Dp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wyQhM3dx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1JbtGMhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o21si5536716qtq.116.2018.12.03.06.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 06:10:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yKuKO0Dp;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=wyQhM3dx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1JbtGMhT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTovD-0005HZ-S0
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 09:10:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gTouo-000566-Ir
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 09:09:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gTouj-0005fz-3p
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 09:09:38 -0500
Received: from greensocs.com ([193.104.36.180]:43949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gToud-0005Xx-Dn; Mon, 03 Dec 2018 09:09:29 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 79EC2645DD2;
	Mon,  3 Dec 2018 15:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543846157;
	bh=gK2/NOnoVNNFdNruUF+EFs8/fefiPZwBYs1ZHDlCPok=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=yKuKO0DpSASHiY5OKl7GWDlTkNuBM4/EzhhcrSIg2PzsL+T6Hg1qusTl/dqBEuxFE
	vvOfqGLpwzE0JmZ6m4SfLotZvxQ6RchHHoFTdOQnffxFznlFXmanmTaHVsBHWj4Vrp
	bX3b2QZyz42R/OrGBkSAWI2WZrSM2iDeSXCSw0ZM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wyQhM3dx;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1JbtGMhT
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PvgYvrXWlRtV; Mon,  3 Dec 2018 15:09:16 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 5F23D645DE7; Mon,  3 Dec 2018 15:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543846156;
	bh=gK2/NOnoVNNFdNruUF+EFs8/fefiPZwBYs1ZHDlCPok=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=wyQhM3dx9p3lHhtd8eEsE8wypYyTLxMIbo0GyUMOiMqDzYKS4i5IynW3X7l8Lqt1c
	8HGxR7UftLNXUpWENfmCQWJicPSESDrNsHBDJzkEYuZoiPTgtJTM9WKo2583/oYUfD
	9bFPQ1X6k9FIxEhdHq/1f2QiWwCpKXHWczXvCjSI=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 82392645DD2;
	Mon,  3 Dec 2018 15:09:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1543846155;
	bh=gK2/NOnoVNNFdNruUF+EFs8/fefiPZwBYs1ZHDlCPok=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=1JbtGMhTB3JrAu+5L0XWfaQB0S1M9bUZQflYbxdun/q5Kn+c+XfUG8/NuFU9ggN4e
	ffBX0BdumL8VkCE44N5ylDAEaeOXO1gnqFygkNs4DfQE4huLoOpuKS+7J5bvksXRrY
	YLlYaA78w2R5LLVcKn0bBuclte76Sgjmdo54Us9Y=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-2-luc.michel@greensocs.com>
	<20181123181059.GN18284@habkost.net>
	<65d3a572-9a80-f332-1f88-69e43e8a3663@redhat.com>
	<20181126132731.GJ18284@habkost.net>
	<CAFEAcA8D7ZjO059Sgrx-4i0iT+V3gxT4f=DvdmUAJS7KomtyOg@mail.gmail.com>
	<b8e20686-e5d1-a844-48f7-a4ae471e3fd5@greensocs.com>
	<CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	xsFNBFYyFyABEACxIM3H5/MVdqhQYYyw27qFMEYuXyxQWaTPDMajYmh/c1BwtXLR+J0wDinX
	MJeyZSgTlA2KUaJRf8k8ufpRi/+BYNi1a04z5hpiGHYL3RxqFBSsvRREt5Gk1bmIYgiINdyC
	TiSf6e2gczsvn6TDqpPsZip4qP0GwT5JuQdsrwzlr1oxC++E31JND4NXyz14piBqvAfM2XD1
	+YyTLVtJfUP/bkum77rDOW/CEXNfR4BNLFDJmJR23kAZ598biL8O8Yr5Wtnso1iiSugR7tP2
	8XX550AYQSmYH8FV4HeX5ziee+z2vjdVKBwDHGALU0P0kRBbzYhoJLFUAsvAVt67kf/F41l7
	M76oDCNPinP4xrrMSDSV46P9ygbYAV8z0njuh0GvAMz6F34n2d1csoyVnnc+xJfhJECj4Rpf
	gkuqWoJHwy8L2zQsB4B21vTxvgNOI/SLWtYr9pdtyZsdNAmdbXcSZElSCjOvsFECPuk1Fnge
	rbAVeXVtt1pkhwsbbD/ChuHv7PKc+HX1aiUWs6PHpIDBQVWpJxoTCMNompoqSq83iWOTFwvk
	k/90Qm1qc8qxCnstlvmSMUrtJNl/XleWCtf41EfRYbJoLzdzEbpAze4Ta8viRHRgpqUxAikE
	AWfsROJ+uBXSita8919/r1lSKgUNvK4dPgJp7oRhnBZBk1BcnwARAQABzSVMdWMgTWljaGVs
	IDxsdWMubWljaGVsQGdyZWVuc29jcy5jb20+wsGXBBMBCABBAhsjBQkJZgGABQsJCAcCBhUI
	CQoLAgQWAgMBAh4BAheAFiEEUvSC0Bi15mxw2PT5d8knW3QnTr4FAlqUA0oCGQEACgkQd8kn
	W3QnTr4DXQ/+PbmVLmhOaI5NGxJP+c3j/bjU1m/mnE7trwyWD5YjgewTd7Mo1t3Nk6+XQOjH
	Fz+3Etd05SD+9rOStOEjpLb0AXsWLvKZahDrJ/OsyOuTb2xI7BkVyW3OOCuMMcIsIbofUmAD
	dTJ2ujRgCd7mqWocXAwqAq5IVcuZ328e0zwXW5XJ5w37yxGKxLiDNMGtjLs+hK6DoDctwMyl
	EbahHubGdezOBsKpWPSh6HXDIV/Wg1SO0qxpHohoTp4/4uKkdJR08M/I7LoYeSc7V+dXdQMR
	DKffY88RezLs03nCcQaEnJA7nW6Uy6AClZUPkmxx+kEcm4CtVVmoEomljiM1YnTzS1pZTQhT
	KGGfy8JhO7dr/vGaJZwRm6qkIHot96KtyTH9W84eFMTETPrOVrCHc6kJUUymb7++xZ0xInhx
	aWAT8NSCdThd+dxa85MSHLYdX0tfI5rIruVhGTqa7Rhkg5sUCp5jDiOUe2ZAsc2bgMnPzrZO
	zvL50DTvJtOJdDoN+ZQNSK8gJ4qIXhBY+ZFXmguKjfW8Vp3jos1wJCzYm2QG9hnOCulaowbH
	yVyS+7MHLzWlbn3CdWMa87ejv5FmrZuZnSSLIV9YeZfghxz+Y/VVW1MGNdIOe/06oQxm/fin
	3+q6NW8wpuq73m2DrGm0PZlw5rqnysop7eaTeQOWSHHNw3DOwU0EVjIXIAEQALQgCoikJPdc
	nPi7wx3QHWwdG59rs8XQQEjnBqQBY2HnnFEZjaPUOfKRhYVrxcwNmjIVWauX1Razr3XPrUuU
	FqWRiFvrnya/LgHUB4CPTAwl3OpfFZ2B3er1F+qjslzyCHKnbU98eTBo9mF9LdeBUB9m4yUF
	6atcnwailWAqdfzkdrubxa4WZauD/D8dheeAiy5o370Xo9B79NMyqBm8xtONLE9Tg86AEiq1
	MuvDMZhWTvkTXai1+DkYBdH9UPs1HFDiDlFNe+JMolPt8XJJYvYgurr9NWhhSYtwAL9ERz84
	hkIWQfQQpv4G8aQ0o2jWrmfl8zs6ocKk7N+Lf3eYtwaCZ3UPdQGnQ7LA8m4ihZLlXiO8O+s7
	a1j6z8r43MFpA3WL45QB1qlaTeUIaHqS3GGAaSeqnI7B3MocE/g1KAmsFjT18FmvVWuikTUD
	5xNBLUIIZr5SCawawHNC7Kcb/UzpT8a0C9oN8s+7nJJR5s5M5y3zZ1fJRNgz0CIEIueRafU0
	26ZP7Ul1St6DHIF688g4jryxDd6+mh9Pw/Vby//J4bS41zNIUWFSWNZIYF7WsUEMIFyLgL1c
	vwkdiK1W3CIS5BdnqrahGeudtcRY5vKpZvgzx1P+Alklrq7ZvAn4Z2MfMbQjr9aDaNxDYjuk
	HAknRFqs+tM78eZHuzY9tTPFABEBAAHCwWUEGAEIAA8FAlYyFyACGwwFCQlmAYAACgkQd8kn
	W3QnTr4zbxAArmqKzXFscJiHqKrWcMKzrIb1RZGw+PDVD39iRbphmARZYfz+UoLSx4942K2r
	MVXYCMPVFt/10/eZmqvJ9KlIN38uLiZhTVTSFzFnr2pOggH4HYvpVKK7rm1J9fQBn/DJxkqa
	Ec5XNZZUA/tOHqhH+xbExU3Rx/Sn+OFIQxBcCf9FuPckvJv4EBGdpKjsX18BshuZ7/TgvyCX
	W5BxTplu5v3XUPTxDN/OcwkmmvD+pHrjj7umpakEA5qQFCY5rhrES/bYUblCjU754hYb9vpn
	D/8Lsri3M35sXavoK20v9QCkhT6He8/yDD79M4eclXVkLUm4Ij75AuWyIffCKOTO+pFIxUAO
	ndMJ+vlr/Uk0pbj+U7gyXxHVr4OTDfdt3t9RtzH0SD3j1rp9zpuSoIyowBwh9i0+Fx+iJk8B
	rkfp5koA5Fbt+M7oe7nQ18mlowRHzjoP5uJY7nTUwZ1/KLLfT1KiML4OvaS0F4ZTKkZFUzx+
	RQRqLclXLl1hUF7XxUYFDJG64ljAbaCpVL43OkziHejUeM1oC7fZg3U9rnEwnc/JEnCpsHS7
	bNHz5jlV9+JIV2sxFa1xVKZ0PdTRrZ4EuxO6CyXaOsjPGp4uqd+CWobc7wD77bFwdO+HQVt4
	yXDhZGT0TxMQKXHtw1paExHsZq1xw1GvaFsutGLyX2S71jQ=
Message-ID: <50645862-a638-ad2a-bafe-1b46be42aec4@greensocs.com>
Date: Mon, 3 Dec 2018 15:09:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8j4xTiS3_ktiA0hm2N4cu5RvxAtYqUHgvY-bUXgcwbjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 01/16] hw/cpu: introduce CPU
 clusters
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GQm7vmMDZDhA



On 12/3/18 12:23 PM, Peter Maydell wrote:
> On Mon, 3 Dec 2018 at 11:21, Luc Michel <luc.michel@greensocs.com> wrot=
e:
>>
>> On 11/30/18 5:52 PM, Peter Maydell wrote:
>>> Luc: what are the requirements on boards using CPU cluster
>>> objects? I assume these are both OK:
>>>  * does not use cluster objects at all
>>>    (the gdbstub puts all the CPUs in one process?)
>> Yes, when no clusters are found, a process with PID 1 is created and
>> used for all CPUs.
>>>  * all CPUs created are in some CPU cluster
>>>    (the gdbstub uses one process per CPU cluster)
>>> but what about
>>>  * some CPUs are created in a CPU cluster, but some
>>>    are "loose", not in any cluster at all> ?
>>> Is that just invalid, or do the "loose" CPUs end up in
>>> a default cluster (gdbstub process), or do they get
>>> one cluster each?
>> Currently this is valid and the "loose" CPUs end up in the first
>> available process (which will be PID 1 if we are in your first case,
>> i.e. no clusters in the machine).
>=20
> So if there are some defined clusters 1 and 2, and some
> loose CPUs, the clusters get PID 1 and PID 2, and the
> loose CPUs end up in PID 3? That seems reasonable.
No sorry I was not clear, the loose CPUs would end up on PID 1 in that ca=
se.

The current behaviour is as follows:
During gdb stub initialization:
  - A process is created per cluster.
  - If no cluster are found, an unique process is created with PID 1

When trying to find a CPU PID:
  - If it is attached to a cluster, return the associated process,
  - If it is loose, return the first available process.

--=20
Luc

>=20
> thanks
> -- PMM
>=20
