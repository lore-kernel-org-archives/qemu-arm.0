Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp798304wrt;
        Fri, 28 Sep 2018 07:44:20 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61LPNKhJO+J/Fu2yk6Q+R1Nn6QVAQ2G0RZzjRSJgwdl8AfCJ17paugqUjoMWdYkcyPeip4Q
X-Received: by 2002:ae9:e515:: with SMTP id w21-v6mr8836096qkf.105.1538145860806;
        Fri, 28 Sep 2018 07:44:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538145860; cv=none;
        d=google.com; s=arc-20160816;
        b=DKHmgumgRMZmR7Ka0skQ1d3huhDryBzUpPiowfanf51+I3zNYtBTBBKlpNznKPYakH
         GE3RZYb0NU6uogxUJ6GrfonnSzRj0eABTIdB+FvKcDeG52IwyH65yKXIxdrSj2ZHwQU1
         J8TKZ3dsAMlrXkG8dNFBOIjaA1/rHkkcdNEkX0K16pE9XgXX87iM42b74p/RLKlBoYS6
         g26+q2freSLMWbtMU7oPXFA+Pci08s066NvPs+zdE4bYqlqhh+lJtEdNdVIMY0mraUz0
         RDAjqZTRtvlLQV7krZqPOnRAPPc7hUCxuOXT701Snd4fdwBbGq4AIpNnfBq5fdQSYuSh
         T4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=nEYzZZHwyY9VTOA1iaKQ0QGkxhnLG8Jrz4pwPUsCC5o=;
        b=ozuwzRe3bFR7a1VA2dhOWY5NO+59ZnwKAWoEejKGMGv/8idQaZYf9BBht7oE86zGWb
         XRupSNk+cUplb7RMF7lXQQ1dINtHhshk1j/fljAEdKT8LFJ1pNyvdGEGOIGjwrmwUlWO
         vMPb4l3s8HsLzF0SY8RITWun0C2RHfr6WqNP5mFm5XhO7i140+STr8ZVX/ab8RgVstU3
         ysvJTHYuRcyGs8XnBhuG5YxCc3dNcqDZABxQ3iAOGxhxoJy0SHQzPWRvtQlKr2auFkiC
         LJMN+a8uO2YWR9VvqeTEtJ9AeYRgorRmBBZUqEgS6mqxzcouXi5HFbpZO9IbkRDYhYnY
         szvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q1y7VX/B";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6-v6si212830qtc.39.2018.09.28.07.44.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 07:44:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q1y7VX/B";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43762 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5u0C-0000VN-9z
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 10:44:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g5tyN-0007km-T7
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 10:42:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g5tyN-0003FZ-98
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 10:42:27 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:43809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g5tyN-0003EU-1O
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 10:42:27 -0400
Received: by mail-ot1-x341.google.com with SMTP id e21-v6so6232594otk.10
	for <qemu-devel@nongnu.org>; Fri, 28 Sep 2018 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nEYzZZHwyY9VTOA1iaKQ0QGkxhnLG8Jrz4pwPUsCC5o=;
	b=Q1y7VX/B3FYYUSPYVhesx4htTv+8OaDvfk3/Yf30p3FZWshlcq5kOBUrb6/dQpkwWf
	sIr5m1zuyq1ZH37n+i36mfTT+xGoAnEs+2qpbRR2tbtTR8DLtha6P7I1MbQInehs2ALY
	+WfRM+IGEMdJIUZjuRGVWtxIyGpffnxolzn6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nEYzZZHwyY9VTOA1iaKQ0QGkxhnLG8Jrz4pwPUsCC5o=;
	b=aTfHrLS/6BgvfoWPj6v+OnQbM8PPKmN+SgSbj4k7OMVhEiNHOCceh1SZbn2TSK2yko
	t8KH6vtH95KehLTUBLDdVJZUopWbdKe06hH3hoAamUreOSlPiVLsn3cnNKUHsX43PngX
	sOI+gClCZ2wJ19COPghclF7lVGbZ0zdNL0Rgreg+0CCrO0Rn/WfWqU0MdhrU711l8eGc
	ruTlnjqPwPtVyVqYpsOyc2+eSlLnWbTxjijKPVcESzVR0OwkrCG5W+jYfFKqxA97GIpj
	3VxUtaaMCE8JR+ksmTTYWPvPsIrmBnOfvMjN0+if6EjIVQfs7Tdnac/c2nDjJGy5vVfR
	yaPA==
X-Gm-Message-State: ABuFfogDLLP5DQmTvhAZwXqLSnI+t0Qvee7eV4t2a6wqTZ9+93Z7rtIa
	0ZVqfD0Jh7V50FwaWtFM5Guh/pSLyZmX4/TYmhzdwA==
X-Received: by 2002:a9d:740b:: with SMTP id
	n11-v6mr10243297otk.363.1538145746168; 
	Fri, 28 Sep 2018 07:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Fri, 28 Sep 2018 07:42:05
	-0700 (PDT)
In-Reply-To: <20180928135003.8650-10-clg@kaod.org>
References: <20180928135003.8650-1-clg@kaod.org>
	<20180928135003.8650-10-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Sep 2018 15:42:05 +0100
Message-ID: <CAFEAcA_c3dG2sBh0KOzGRYjBEubj+E4OUvuf-NXZM5ox8L07zQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 09/11] net: stellaris_enet: convert SysBus
 init method to a realize method
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u7XbSK2KGKhd

On 28 September 2018 at 14:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/net/stellaris_enet.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)



Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
