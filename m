Received: by 10.28.173.206 with SMTP id w197csp4169162wme;
        Tue, 9 Jan 2018 13:41:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBovBCiknDC8IzU8EIPE9ttBaXSyBs0z5LfW9MFAXOvIo1w2QP1hxxoGqnPvwZ9rMYcLeMoen
X-Received: by 10.37.248.29 with SMTP id u29mr7721715ybd.341.1515534117844;
        Tue, 09 Jan 2018 13:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515534117; cv=none;
        d=google.com; s=arc-20160816;
        b=iOgfYD4VRZF6gDbDg2VZvRrEz8Ir2eY0w6rCcFzMn34ayEf+LSrQEt4SxjkfzzMJr9
         NQo9iLfNLukEtmSuXUXLKvbq32zG+UqWm+AXJalvV6LSGZaft9bjifMahQ4O8cgNuO3Y
         uEuOG40QuwVBpJU6/4nR4J317m+C04YdfP+4G0KjqyEgVgDTPiJuQnS0lRe8dTykibcU
         BCSwbSRqOGJSXqjYDw0HCx2g5lG4VHau33jz643q+RTDdnA3dHAszpKkstblqOVE5bGQ
         0wrcwwP56G3N1tSxgBvPl6rxu2z57K/tj/yjlyaKw8jshgZ22bUX+K+Pe/WPjIq2xihu
         ACCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ydGgcauDL/dus8rRyJ33yAKBTIjyszTPbkqZoX4z030=;
        b=nNk34aIRfhTaMFvfwJ/vi+119hhPkSvrg4R/ykZH+9HF/lk6MyKXuGmiPZBZNMw3jm
         P5cTFFTEX0kHYZYzNA5TbX+pCbB6cqi2IiV8fEOxlpVZH1E6xyOryJNXFhk2woEoSIFm
         yLasoyIJdP/epxopy/i38hZwC4fYtiyjjJTsYVXy846GcbuAJDx9XOrEGZ1WLoMt0VeW
         Zd6a/rneY1EUtrFKO5BYA1058o9oo6iirDUIWwCvt8jcLPxb+G+9KJoraqP5/6ixP+12
         4sR3kda01R9K4jh3WL5B1Kbqv6wQqgAVEskpO0pW1NTpjKNIXmeSH1mmSewmmbW6tJyW
         l4Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AkQ91VR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y199si1402441ywy.464.2018.01.09.13.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 13:41:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AkQ91VR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZ1ef-0006BD-BA
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 16:41:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49215)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1eX-0006AB-6w
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 16:41:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eZ1eW-0008Bg-H6
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 16:41:49 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:43888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eZ1eW-0008AB-A5; Tue, 09 Jan 2018 16:41:48 -0500
Received: by mail-wm0-x241.google.com with SMTP id g1so5250827wmg.2;
	Tue, 09 Jan 2018 13:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ydGgcauDL/dus8rRyJ33yAKBTIjyszTPbkqZoX4z030=;
	b=AkQ91VR4/988kjZYd1tMkyIdL2j03yzq2YR5dWWQUIJ/wqUYRjU+fqoZbBeRuU+UIC
	VXJPiSyA9L2sX3nrKIvc/KzeHY9pW3PO1AN/nPNJ23Z5JlMplBja9uPyZOXvvSBHc4E5
	XiFU8tolW1Rvajnx925IsoBac3/lKjjV9Rhyi8nDYPZ1PPXDP6XyomxTav3YMChTXY1j
	f3jfkfcj99OC9cMOtq7MsZT0iXSNq3wq8Ou7ws5Iw/mYL1yDURsIbChL6CzXKrDfMk6V
	XKMsrpxQsWlxXq6ug9ruCLxZl77amq6zkR/T7MAL0crcjSGaDwgeRyPf2vISIeUkYdsb
	dv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ydGgcauDL/dus8rRyJ33yAKBTIjyszTPbkqZoX4z030=;
	b=FVGlcLDyHjG1kN1QoHdpk9b8al0cvP0WbnFlV61imWIeX6GQ9bTnG+fIdVTh5Y/60W
	daLvvWrw4cLOxFhsVaLUId4l9RlTH4ionaGFY0ijMi6uI8JvycZkuHETKrvTehRMwWqY
	kLJALEeC7AW6xXZkVgCsriLd2iee8C+joFJu/aKricRoMH53kHFB01FA55+2hg2oP2un
	bLelHRH/YhBwkGUfmQHhhOCvJgBDPWZjdcRMmaRa4l/nLdoiqzcWoXfJI77cb7aDFt2L
	Pjs0Qk83pbncqBRb1sQOXMAGvGkyh2OCvxn3+VzYWNe0LdWcXXQh31G9BmwZKgDwqjyq
	OazQ==
X-Gm-Message-State: AKGB3mJv+0iL9a5UAGzRgkR/K0cc8D4Tn3/70F3SfLz2ydMMPIo8almH
	omKGYP67ugo07d4m6T1jB6fEFFFvOgSuRnRCmdM=
X-Received: by 10.28.55.74 with SMTP id e71mr13858260wma.50.1515534106974;
	Tue, 09 Jan 2018 13:41:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Tue, 9 Jan 2018 13:41:16 -0800 (PST)
In-Reply-To: <1513183941-24300-3-git-send-email-peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<1513183941-24300-3-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Jan 2018 13:41:16 -0800
Message-ID: <CAKmqyKNjCtKYOP5cnOE5ZiZ_d6_Gg7Vb9ey7=OE-icgK-FdJ=g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/intc/arm_gic: reserved
 register addresses are RAZ/WI
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Laszlo Ersek <lersek@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EdN3wmPR6XLa

On Wed, Dec 13, 2017 at 8:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The GICv2 specification says that reserved register addresses
> must RAZ/WI; now that we implement external abort handling
> for Arm CPUs this means we must return MEMTX_OK rather than
> MEMTX_ERROR, to avoid generating a spurious guest data abort.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Looks good to me.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair


> ---
>  hw/intc/arm_gic.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 5a0e2a3..d701e49 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1261,7 +1261,8 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "gic_cpu_read: Bad offset %x\n", (int)offset);
> -        return MEMTX_ERROR;
> +        *data = 0;
> +        break;
>      }
>      return MEMTX_OK;
>  }
> @@ -1329,7 +1330,7 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "gic_cpu_write: Bad offset %x\n", (int)offset);
> -        return MEMTX_ERROR;
> +        return MEMTX_OK;
>      }
>      gic_update(s);
>      return MEMTX_OK;
> --
> 2.7.4
>
>
