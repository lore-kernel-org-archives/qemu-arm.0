Received: by 10.223.159.74 with SMTP id f10csp3316595wrg;
        Mon, 18 Dec 2017 17:17:26 -0800 (PST)
X-Google-Smtp-Source: ACJfBouJ568ixgBc+2Hh/siq3TlIZTHqG6+PCcK4dkmz7QDd+Njj83R+8/chFBXP7PfINU/7RW8X
X-Received: by 10.37.133.142 with SMTP id x14mr1316796ybk.89.1513646246585;
        Mon, 18 Dec 2017 17:17:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513646246; cv=none;
        d=google.com; s=arc-20160816;
        b=X0Kk0w39nmDsMTzBv/hTkCG9o/73ryzc9CyXFx/JiNOWCx2OKWCGy+FT/THZAXNi6t
         JE87rIzZJb2pQgwnzhRGztGEsTFhNxlm8qTMcHdNU1Xk8bBKtXUoOm3zQC61Kb9o3pQv
         8oa9cmdyP92L2Eq3dmoD3lGSnqNs+Gmp/EI+W9XL0KLkV1B2ai8nyos+lkBfAUuQK5Dm
         791mjVfjPiPVopx2hhZyNTkS9V5tnfXmN0SryaS5XHWdLRitUVw0Rj25yU7axdT2OCXo
         6/JR6AbVH7kCdSCz5u7MMoiMKXjQmIsnRl5CASN3UUrJ1VSeUr9QTa2xSqmmVoS8mriS
         s/Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=NBporhOrq0tSellPDKIVTS6qypz9l448jni6hQ4F4/o=;
        b=UHCacxk7iBNZom5JR98im72gSoHWBf+V2epyKUOp55vImJHvf2omYKwl8tMqW7LELb
         ujRpLP684Yd9mEuUFZEPXpBPkwd887DFVFrJrYJ0ZD3cNCgDVjl75ZVRvC5irQDzw3l/
         7f9Wk2OzL2pp2k+q4kWlx/bYhxfjXen5cx6s5nt5YHKktMAoQJOwdcvgMOCUmRpfgrMt
         3KJ/vbRPAAvo70xegSFBwTxVxjM7lz7+GtraZDL4kOIK1smVGS0yfL+kyBArM84vLDRH
         6usZ4v+w8hTsq/xmyEn32rD3qHkf/w2k82NcgLVdxwj5ZbWobw/1ANWMjsbs0zS0u5u/
         Pr2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WuRPhKr/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u17si2342818ybk.360.2017.12.18.17.17.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 17:17:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WuRPhKr/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR6X7-0008H0-S3
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 20:17:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50592)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6Wu-0008AY-S3
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:17:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eR6Wt-0000aj-WB
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 20:17:12 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:44080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eR6Ws-0000Zm-2k; Mon, 18 Dec 2017 20:17:10 -0500
Received: by mail-wr0-x244.google.com with SMTP id l41so4063641wre.11;
	Mon, 18 Dec 2017 17:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=NBporhOrq0tSellPDKIVTS6qypz9l448jni6hQ4F4/o=;
	b=WuRPhKr/kjlAmQ5JtaA78Y0GAtcTNMeo8ddn4y94TXQiNalAmqeiWxYncI7yYEs4G6
	EE5D/6Lh01ZNlVzgPuqCTyCuxLoaY5afumHCIPmKFvVhnL8AxdsXdatqUo6MXxFd4fA7
	lgPezYuk6YyeBkwpTC+PbVHJAeJfa+xmdJVDKDbQbrYOihCXpmMpg2uDqoNRjgmV+uK9
	EUtW35onwYCg0lDcAXy3h8JBXbIxoxz1QgeY3ZYRqJ0A5NJQpsnkp7MrE73klQcme/jb
	31RgAJUR3VJ2bxtD73wI7Cc3EbnRbqNF3iXP9L798fuIAiT0Kg+3gYT2Ffr0xdHqaipQ
	lEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=NBporhOrq0tSellPDKIVTS6qypz9l448jni6hQ4F4/o=;
	b=L5QrHj6wKPq/SEFn8rIPnjJ8kc6Ged/V6UkQTN8p6sO1BF8/DQKsOUvRfhgHL5eSvB
	16e8vza13tldb2vrt/3FzvUCo7mUiiE3SxXRXX5e9r8pNbjFccP3iu0G+xB9DLf38aRy
	bef626LuydiXr3GxXxfVLCRjircUXVoIAkIbztf72DlAXSPDc9R8EKn3DZJWSfuYMPsV
	NhTHYaq1OeC5UMtjTj+6MeBIlWhZ+LCjDMuXX94aUobZ4KPYmcgR2PRvkEAgXe4XfAH2
	/X5T7ZlOKzlF37tcQ62UF3LJU6pMmrdL6KbasBM8TWVdAke6aBKjVxa8y822la12zB1C
	K5MA==
X-Gm-Message-State: AKGB3mLhIGzKvuJjQXdugxTdJ2TyZrS1VekpxdAnOtx/3xNGCLSTtPeo
	4iI48xdwYID+ujI4AX3EHTau9XQTsr1e2xQRGc4=
X-Received: by 10.223.144.110 with SMTP id h101mr2435171wrh.83.1513646229124; 
	Mon, 18 Dec 2017 17:17:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 18 Dec 2017 17:16:38 -0800 (PST)
In-Reply-To: <20171215031547.31006-9-f4bug@amsat.org>
References: <20171215031547.31006-1-f4bug@amsat.org>
	<20171215031547.31006-9-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 18 Dec 2017 17:16:38 -0800
X-Google-Sender-Auth: oguqb8B8-Wr2tYpFUFLoaQpFySQ
Message-ID: <CAKmqyKPyzuwX7zhH8YuYw0Ru==R4=pk=CopH2bDuNqsd58Lxjw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 08/20] sdhci: use
 qemu_log_mask(UNIMP) instead of fprintf()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7HmibkQvsV+i

On Thu, Dec 14, 2017 at 7:15 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/sd/sdhci.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 53c1f11855..ca71a70148 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -945,7 +945,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offse=
t, unsigned size)
>          ret =3D (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
>          break;
>      default:
> -        ERRPRINT("bad %ub read: addr[0x%04x]\n", size, (int)offset);
> +        qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
> +                      "not implemented\n", size, offset);
>          break;
>      }
>
> @@ -1149,8 +1150,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>          sdhci_update_irq(s);
>          break;
>      default:
> -        ERRPRINT("bad %ub write offset: addr[0x%04x] <- %u(0x%x)\n",
> -                 size, (int)offset, value >> shift, value >> shift);
> +        qemu_log_mask(LOG_UNIMP, "SDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0=
x%08x "
> +                      "not implemented\n", size, offset, value >> shift)=
;
>          break;
>      }
>      DPRINT_L2("write %ub: addr[0x%04x] <- %u(0x%x)\n",
> --
> 2.15.1
>
>
