Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1112095wrt;
        Fri, 4 Jan 2019 15:20:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6wlfcG4c6gj+ihr9QOX5qQyiLEAatXI9owE4/Wf3/bg3vsaOjGZv3EXitHNNDyFEMjTiOv
X-Received: by 2002:a1c:70b:: with SMTP id 11mr2787224wmh.74.1546644022637;
        Fri, 04 Jan 2019 15:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546644022; cv=none;
        d=google.com; s=arc-20160816;
        b=CnJhTMe1ce2LsUuU45ad63/tK4ZA/vWGzuBKpprrTsyB7QtcuUEkqPzOdNfmk1HGdf
         89e0SpP+gw7TtNAEDrXAvjr28RNZW0SXCU+SjwFb9+T/JG2RSq7BOL3tN8DN8kaBriVo
         LSsSafL/QDeUMcGUcJkO2NT9QekdDPFn++CGDGmDtxarvwOrfmOu7LxMnmFHh4is4TeN
         xxj6l45+/FevWa+cFqA4xGvY7uwHWO6Bvy187JP1IqCUqMNzemlX6pUmeFLsaGAUjQYE
         scqwqitN+qDesQ91TSUjYPV3z4AodPiO7QgSTyg0dqQwMAzalY+A4EY3eQnVwtamon9U
         o4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LPlVYj0zfJn6pyyr2vc3Lubju6XJwf5dj7I6pLPLIis=;
        b=ofwbKA5XvPZLJNKdLrx29MyojFNo3K4vYyFR928JlDPP4/w3chbyAkzfOeSi0JYInz
         aBHL3R+SeDV4Ypo6uChPA7pi1o4/cIGhKKsrmWHje9u2c+i2s16JGVTitMhVdCf7pAOL
         ncIoiw7yZTiL34DMPu/DEO3F9feOZXlSsfV1/xZSM2yjx6dXzG8aKkeOsjxfTHi15jBR
         WT5Gwiq0PoUsmOaGolLUQAB0+712aK4Gok4fSi1xPaDRQBKTbeLYXX531P7xoYTiXjgt
         zMqz2cGDXeM3BTTkIp6lbXAr1SIuGB+/aztUsZ2qAFC4rKtgB06C1F2mElusDBpQRp8H
         TQjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PapDSYnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 70si713440wmy.162.2019.01.04.15.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Jan 2019 15:20:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PapDSYnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:40223 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gfYlJ-0007OL-Lf
	for alex.bennee@linaro.org; Fri, 04 Jan 2019 18:20:21 -0500
Received: from eggsout.gnu.org ([209.51.188.92]:38503 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gfYl4-0007Ly-KO
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 18:20:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gfYl3-0007oS-Qc
	for qemu-arm@nongnu.org; Fri, 04 Jan 2019 18:20:06 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:35364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gfYl1-0007mF-O6; Fri, 04 Jan 2019 18:20:03 -0500
Received: by mail-lj1-x244.google.com with SMTP id x85-v6so33706056ljb.2;
	Fri, 04 Jan 2019 15:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LPlVYj0zfJn6pyyr2vc3Lubju6XJwf5dj7I6pLPLIis=;
	b=PapDSYnk3enpzSddxLbnG87iLMQtomxo3V2xoTAbrcP/QxKJrx/8W9h/DAsPw2U3uc
	sN3t/yNYsOd4k1TE4v1JmSlfoo5mVZlT/guyZMvHO9GLVIl183pEb6fFKtNOWUvBSYDm
	nPG7pTW7jHpFKONCNG9S6eRjDi05QMHcmBfqIQHoZQjZ7trYiVzWwyNKNQ0qAO6GkbNU
	N0LYlx/1MB9JLmXGyucrhUI3UXIkYOovThtZORQSuIaJSBRh5WsUBpkieTyeKYRmQl4Y
	ZmTUN+l+p1EK7elJjMWBLgrFLEeEwvLDnvGOZSQaUqkdgp/mUIp2NLu6u0WVFYpgUzQR
	jbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LPlVYj0zfJn6pyyr2vc3Lubju6XJwf5dj7I6pLPLIis=;
	b=PfnHAavTix/4I8EJxIBrm1nyDhnHO6bE7QgvjXD1qoTl3la0Gaqs9GXKdThKo89g7G
	hoFekaVPgDZp90intvSemUOyHktyfppYaNN1lKkJNEnCy2FjsiqpT0vkRU8Xn447tqbh
	SAClCvy21LF7+j+wSn+G6QXefbSQiU1gF0mWly/zsPVwajCUPJoFkwMHoUus2EYYdQ3e
	sQfTc1QxVQDLKMgBg67JLBK8W8csOFAPot/N6G6Waheymn++s8I8UZSbYq5rBHICCQb9
	WCJrJKfODPeeppxdN4WnQHiQrHqCQ41dtXtEoMqf1k6Bz0bU0PhS31wd9HOz8kyVgikD
	yVNw==
X-Gm-Message-State: AJcUukdJWaE0AwB02+FyyJ41+xRoFrVS1gMXErmXdiT/TG28ZjcgN6OL
	jqJ7GnyCVryjzzfDCVpVgne0fop4vQ13MEqt0nU=
X-Received: by 2002:a2e:131a:: with SMTP id
	26-v6mr6353291ljt.107.1546644002166; 
	Fri, 04 Jan 2019 15:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20190104142812.20444-1-edgar.iglesias@gmail.com>
	<20190104142812.20444-3-edgar.iglesias@gmail.com>
In-Reply-To: <20190104142812.20444-3-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Jan 2019 15:19:35 -0800
Message-ID: <CAKmqyKN0ow18Wkst--cJ8+6d2h-1xTsU-WakTXL2AvDkeavdDw@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target/microblaze: Add
 props enabling exceptions on failed bus accesses
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dnIzsP9KymPA

On Fri, Jan 4, 2019 at 6:28 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add MicroBlaze CPU properties to enable exceptions on failed
> bus accesses.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/microblaze/cpu.c | 12 +++++++++++-
>  target/microblaze/cpu.h |  2 ++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 49876b19b3..5596cd5485 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -202,7 +202,11 @@ static void mb_cpu_realizefn(DeviceState *dev, Error **errp)
>                          (cpu->cfg.use_barrel ? PVR2_USE_BARREL_MASK : 0) |
>                          (cpu->cfg.use_div ? PVR2_USE_DIV_MASK : 0) |
>                          (cpu->cfg.use_msr_instr ? PVR2_USE_MSR_INSTR : 0) |
> -                        (cpu->cfg.use_pcmp_instr ? PVR2_USE_PCMP_INSTR : 0);
> +                        (cpu->cfg.use_pcmp_instr ? PVR2_USE_PCMP_INSTR : 0) |
> +                        (cpu->cfg.dopb_bus_exception ?
> +                                                 PVR2_DOPB_BUS_EXC_MASK : 0) |
> +                        (cpu->cfg.iopb_bus_exception ?
> +                                                 PVR2_IOPB_BUS_EXC_MASK : 0);
>
>      env->pvr.regs[5] |= cpu->cfg.dcache_writeback ?
>                                          PVR5_DCACHE_WRITEBACK_MASK : 0;
> @@ -265,6 +269,12 @@ static Property mb_properties[] = {
>      DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_writeback,
>                       false),
>      DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
> +    /* Enables bus exceptions on failed data accesses (load/stores).  */
> +    DEFINE_PROP_BOOL("dopb-bus-exception", MicroBlazeCPU,
> +                     cfg.dopb_bus_exception, false),
> +    /* Enables bus exceptions on failed instruction fetches.  */
> +    DEFINE_PROP_BOOL("iopb-bus-exception", MicroBlazeCPU,
> +                     cfg.iopb_bus_exception, false),
>      DEFINE_PROP_STRING("version", MicroBlazeCPU, cfg.version),
>      DEFINE_PROP_UINT8("pvr", MicroBlazeCPU, cfg.pvr, C_PVR_FULL),
>      DEFINE_PROP_END_OF_LIST(),
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 03ca91007d..792bbc97c7 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -308,6 +308,8 @@ struct MicroBlazeCPU {
>          bool use_mmu;
>          bool dcache_writeback;
>          bool endi;
> +        bool dopb_bus_exception;
> +        bool iopb_bus_exception;
>          char *version;
>          uint8_t pvr;
>      } cfg;
> --
> 2.17.1
>
>
