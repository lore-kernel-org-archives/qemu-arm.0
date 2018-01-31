Received: by 10.28.71.27 with SMTP id u27csp2860220wma;
        Wed, 31 Jan 2018 08:25:28 -0800 (PST)
X-Google-Smtp-Source: AH8x2263MuuwrlyJQWtjlLEFvAiAl8SW03ivgDG58q8BShzaRHrq2UO47YF8XOO+GT9DI2qewEhY
X-Received: by 10.37.195.193 with SMTP id t184mr5974882ybf.310.1517415928715;
        Wed, 31 Jan 2018 08:25:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517415928; cv=none;
        d=google.com; s=arc-20160816;
        b=d7IDF7NdcfCtOl1aHonMF/dzhzyvWOqoAOJGrlEc5Pxv0lkeKrCoVv9sKWV/y+oZVy
         sIjTtfIlOS2hUXc+zwzAukohrS55j7fQe/SlIJm/Wa+4WI2kQVPhlYReNEddBlWDnv50
         7AB5jWIahP6VgDlczHRdJu3yHFkWUnwG9oT8P26+GG1TOWaQa840MX3r5QArQscJ8xFk
         WwozVcS4SJZ9aBHlOmWbK/3EzzwwzUb5wnKrqfqxkvvILRzxzivJBfqRBCeychYoEswc
         FgUwqQtlWZhfXvhd/UNVGqSf+cxdvLXhzekjOYtbd9ewQGfqKdt1zZlDBLOWO2F7/laG
         978A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Fr6imYoe707CtCMxRQWx5L4F7y/2XloeUQPc3Y+Oo+0=;
        b=diitds00c0B1up5ZjpUgH6GS/hLDrIKojQFnNmzn8mHohW/O6GhoudbpFrOKZxBZuV
         E7VALyZVNqY/ei0cE11S3aj/dpPm5S7PdCNMoXmhBigpvSPUUrC6++efWJ69Ze+IDsyl
         k+v71HrwJH6W4lok7GB1vpvxN+4C2R9Z7PJcfmOzoCBWc8QbI4nfHMjb1LdoCxB4sD5m
         nWa1LFZ6iR380DfAOnCN6JA+FL+IwcBnPu97G1UdmTnvcShYPldr4+hz85OExxT+q9dx
         yNCEMFAA0TGuxEVB9sluReudzhKtaR/etwugf9NzcGd9pqOUY6Dv7kKiy3jT4VYGrNic
         4Apw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tcgf3P1e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si5880449ybf.404.2018.01.31.08.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Jan 2018 08:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Tcgf3P1e;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egvCS-0004fi-5f
	for alex.bennee@linaro.org; Wed, 31 Jan 2018 11:25:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1egvAM-0003NB-Ox
	for qemu-devel@nongnu.org; Wed, 31 Jan 2018 11:23:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1egvAL-00037B-Q8
	for qemu-devel@nongnu.org; Wed, 31 Jan 2018 11:23:18 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:45182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1egvAL-00036a-Iq; Wed, 31 Jan 2018 11:23:17 -0500
Received: by mail-lf0-x243.google.com with SMTP id x196so21581587lfd.12;
	Wed, 31 Jan 2018 08:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Fr6imYoe707CtCMxRQWx5L4F7y/2XloeUQPc3Y+Oo+0=;
	b=Tcgf3P1e1aer43I7DA/nMxASKsl7KxT13yaska2v8dR1HQ6zy9mVv3S1usGhXM6Cex
	r473vTcY2Q9WEK28wCg6XUihPq2++SIalppjvQtOUD974Qj4795eYqY92zprDHB0cqwu
	U78eTHObaH3jRiq6eQeA5aDLCDJQlVeoaJSo38XxeGd3iH1ZzMfzKn8Xx2mNA84ZJ5Sy
	woKwVtkQy9w1PS+dkvmpd6RQlL1WwWbDal3mdzZBj/qJX1Y+5rHlqXWObBgcAVBGmbvR
	GQz7/dPNPCOkramMLFReN8gN7m+HmDiH0/yea6E4BZ+PkpBX574L9uyadD+ysPFjVyk3
	SnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Fr6imYoe707CtCMxRQWx5L4F7y/2XloeUQPc3Y+Oo+0=;
	b=OMwvemjjVedXHdetNCK1BP+Mr7w2bpmWN459osS8NPVesCl21vlgAzusD5D1Q4SmwT
	RgEtJPu8k69CHP5mKcedwJvASLWZJv1UqnW7fxsT7ptOzePBU4rxnU13g4ejnJWuKf9u
	jbLh2JwlllH+nRHqSIf8RGoQERMIvACy78oRsyp+V4dGD4N1Iaz7hXLvjwzXhZAFiZOB
	5YzDbuNPzDYDQJOoMwBB56MNp6aIATI8kjodxhI9WHd0rT86xXzAMsffcaLO9Btne8Pa
	ajH6uLOxXlUs763OgASAx31Nq33VLuRvzWJLHEN/Y6YH+7PfcHqH5FU3uLA+wf76HaaJ
	t/Bw==
X-Gm-Message-State: AKwxytdUSO6E7rMf0iGsoTY1DXvy/2+x7MJT/3+9SRFLFS1nH0xjC9xo
	2xQdXgnLMSZRXa0DKES9s8muqNztGX6QjVrom0k=
X-Received: by 10.25.20.31 with SMTP id k31mr19583674lfi.87.1517415796360;
	Wed, 31 Jan 2018 08:23:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Wed, 31 Jan 2018 08:22:45 -0800 (PST)
In-Reply-To: <20180123020820.1288-16-f4bug@amsat.org>
References: <20180123020820.1288-1-f4bug@amsat.org>
	<20180123020820.1288-16-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 31 Jan 2018 08:22:45 -0800
X-Google-Sender-Auth: YxBR0W7WY-8ioHk0dO3OuaWx4rE
Message-ID: <CAKmqyKOanfqL7c1=VNN0LrPaOPDhn++aEif=wo-y_0KFkxW7=Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-devel] [PATCH v9 15/16] hw/arm/exynos4210: add a comment
 about a very similar SDHCI (Spec. v2)
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Kevin O'Connor <kevin@koconnor.net>, Stefan Hajnoczi <stefanha@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9mYhuSMpEtUH

On Mon, Jan 22, 2018 at 6:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/exynos4210.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index d89322c7ea..06f9d1ffa4 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -377,6 +377,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *syste=
m_mem)
>          BlockBackend *blk;
>          DriveInfo *di;
>
> +        /* Compatible with:
> +         * - SD Host Controller Specification Version 2.0
> +         * - SDIO Specification Version 2.0
> +         * - MMC Specification Version 4.3
> +         * - SDMA
> +         * - ADMA2
> +         *
> +         * As this part of the Exynos4210 is not publically available,
> +         * we used the "HS-MMC Controller S3C2416X RISC Microprocessor"
> +         * public datasheet which is very similar (implementing
> +         * MMC Specification Version 4.0 being the only difference noted=
)
> +         */
>          dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
>          qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITI=
ES);
>          qdev_init_nofail(dev);
> --
> 2.15.1
>
>
