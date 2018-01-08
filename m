Received: by 10.28.173.206 with SMTP id w197csp2966328wme;
        Mon, 8 Jan 2018 13:56:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBovi0ZlU3S2wHu0SSsvIU/uFRtwKNjAdI34XV8OtYR2lnvU9ghwFHmbrFYsPFJtqCRlc2ag+
X-Received: by 10.13.229.65 with SMTP id o62mr12124098ywe.307.1515448579811;
        Mon, 08 Jan 2018 13:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515448579; cv=none;
        d=google.com; s=arc-20160816;
        b=pXF38xK2O0+QydMs3t0J7sHSPVGoA+3Wi3p0wKfwQnvxW8vmO8HUj69FAas53BJArJ
         JBdKXFjBIKQAwvAfkmqVxy8U3WNVth3erXn6+Zz6vKJjj2EujXdmUcvo00g3msFdUf0T
         z4/L/JfOLttVxJjxUSQ12i3XmVTBRQaf+s1dZNNunwCii6QxWJ7sa0zEM6vmmXTzpjxn
         z0xKcl3tgUv7iYPAq9VsRumAni0xa0q7QFZonw31b3hLl+VX00MRtMKv6bRtujjsA2AE
         zOINVpIRvn5mASUzoaIah48XIWXofNrAb4GULDYFkAp3RxKg7Jl7BVS3YL1nxt71+zbv
         C0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=SKRPNpCaU/2HxEc2TDm5391Q9SR6nIdEDIhOXAvEIsY=;
        b=yFCiUc/fd+zXkLBo/pnLRoU01Q7A6qHd5yaGtn5mKy3448D1G0nubmf/ElLcVx2GN4
         RTO1Gz4JrUocpE7kF24VM709+lcCpb2MeNCoSgwHyy8+Vpymb5LlEkQD6q0YBqDYYGo8
         Q038aSmdTvucQzDZCap0B43kyOTJeXN+Tu4jHAWWU5086C/NJq3DmAZEgYRK1L4MPuT3
         uARglziY0Nzj7HqQ3WMeSc+2CI70JgpCFEwBb5dAnAPwQ+f3fzkxgnGo+1Q45xb/EUwS
         8JUG0+eEOZoe7EmUxnM+F1ofyhbV2QFYYwcmugmaySpzdECcFihlF5VVROKCIPaFHS5c
         IOWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jXYvccwb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18si513484ybk.600.2018.01.08.13.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 13:56:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jXYvccwb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33273 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYfP1-0005OF-6a
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 16:56:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfNR-0004bo-FZ
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 16:54:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYfNQ-0006Qz-EG
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 16:54:41 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:32847)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYfNQ-0006QP-4S; Mon, 08 Jan 2018 16:54:40 -0500
Received: by mail-wr0-x242.google.com with SMTP id p6so12247906wrd.0;
	Mon, 08 Jan 2018 13:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=SKRPNpCaU/2HxEc2TDm5391Q9SR6nIdEDIhOXAvEIsY=;
	b=jXYvccwbWYjgG7+aZaGn73ezTV9q+7gvMU55yUSM5+8s/6aez5wj9rH2/jVPFKsZVW
	z5fIh4pPkiOlezFmOMT0AzA9LxvZQE7zbdhpAWLrLQBWl7WUAxqqAUdwDUUIorIUjmXq
	ZjD2eER3Gcq8eN+9kZH85YcBviTqZztOHjesqKa5x6pw7fYwscfncXeGlpMKjSfvoVMU
	zFLcc1UBhzoxLYeCZPsaVW2Pstv7lARwwV81L12N2LxE9zgBCsn9yFMiiPF8c1A+4CFH
	rSG28HvE6YthdBjKDWR1sBNNsUCm8AtGaZ90Lo6PB35RqKaLmjIq3YPhQmhBpFTJ6x0S
	aaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=SKRPNpCaU/2HxEc2TDm5391Q9SR6nIdEDIhOXAvEIsY=;
	b=O+hmAmrJXrEfQhjGLoeTwjhnDKTiPChW2zGbLJiXzKjqYfhOOZoFV2hTsaQnb7nOaZ
	rLYpOAkov9Tg+TlCNFxua2bXI4/BQfLYLJkmiSFrxgV6kwfzQFxOSDW4v0+KBmQpriOd
	ya8K8O1Wgf0gLm9UQD0wE/lx5kGQNXU8BwEM7OutRaEHGxcPP3Lu/EaXbDrnImy9MI0/
	b3rkj0wB+8Ss6/buBFbZ2C0yUR5nbEiyO4fJ/ydv5s7WobbuSr7h1vk1+13Ba02RVdAp
	pVNIFTPSIC0NxYd3YlrbyDzdQOvp20IE1inBIS8mFx+s8H6AMkY/f/PQacgA8khNQ3BM
	5cyA==
X-Gm-Message-State: AKwxytc0iWEzcUH0Xke7mJangp6nWgGyW/8owckvglDYZTr7OULIk3Eb
	cSLhNZ9rDzAXLWg4u0A0fdgnYH1RBzvBWnARWrU=
X-Received: by 10.223.196.147 with SMTP id m19mr1311281wrf.56.1515448479042;
	Mon, 08 Jan 2018 13:54:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 13:54:08 -0800 (PST)
In-Reply-To: <20180108154303.6522-18-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
	<20180108154303.6522-18-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 13:54:08 -0800
X-Google-Sender-Auth: Nz3YbaX29oHUAc3a-SGxjeYDWS4
Message-ID: <CAKmqyKPG=0jN_xGR50fefcndj36_YNAwCRchBH1pxOtcODG7pg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-devel] [PATCH v5 17/31] sdhci: rename the hostctl1
 register
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
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ts4o7wSp7Wjc

On Mon, Jan 8, 2018 at 7:42 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> As per the Spec v3.00
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  include/hw/sd/sdhci.h |  2 +-
>  hw/sd/sdhci.c         | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index c0098fc920..ecd192ee47 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -65,7 +65,7 @@ typedef struct SDHCIState {
>      /* Buffer Data Port Register - virtual access point to R and W buffe=
rs */
>      uint32_t prnsts;       /* Present State Register */
>      /* 0x28 */
> -    uint8_t  hostctl;      /* Host Control Register */
> +    uint8_t  hostctl1;     /* Host Control Register */
>      uint8_t  pwrcon;       /* Power control Register */
>      uint8_t  blkgap;       /* Block Gap Control Register */
>      uint8_t  wakcon;       /* WakeUp Control Register */
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index 3f5e0760f6..d7e247cb48 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -600,7 +600,7 @@ static void get_adma_description(SDHCIState *s, ADMAD=
escr *dscr)
>      uint32_t adma1 =3D 0;
>      uint64_t adma2 =3D 0;
>      hwaddr entry_addr =3D (hwaddr)s->admasysaddr;
> -    switch (SDHC_DMA_TYPE(s->hostctl)) {
> +    switch (SDHC_DMA_TYPE(s->hostctl1)) {
>      case SDHC_CTRL_ADMA2_32:
>          dma_memory_read(&s->dma_as, entry_addr, (uint8_t *)&adma2,
>                          sizeof(adma2));
> @@ -789,7 +789,7 @@ static void sdhci_data_transfer(void *opaque)
>      SDHCIState *s =3D (SDHCIState *)opaque;
>
>      if (s->trnmod & SDHC_TRNS_DMA) {
> -        switch (SDHC_DMA_TYPE(s->hostctl)) {
> +        switch (SDHC_DMA_TYPE(s->hostctl1)) {
>          case SDHC_CTRL_SDMA:
>              if ((s->blkcnt =3D=3D 1) || !(s->trnmod & SDHC_TRNS_MULTI)) =
{
>                  sdhci_sdma_transfer_single_block(s);
> @@ -898,7 +898,7 @@ static uint64_t sdhci_read(void *opaque, hwaddr offse=
t, unsigned size)
>          ret =3D s->prnsts;
>          break;
>      case SDHC_HOSTCTL:
> -        ret =3D s->hostctl | (s->pwrcon << 8) | (s->blkgap << 16) |
> +        ret =3D s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
>                (s->wakcon << 24);
>          break;
>      case SDHC_CLKCON:
> @@ -1016,7 +1016,7 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t v=
al, unsigned size)
>          MASKED_WRITE(s->sdmasysad, mask, value);
>          /* Writing to last byte of sdmasysad might trigger transfer */
>          if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->b=
lkcnt &&
> -                s->blksize && SDHC_DMA_TYPE(s->hostctl) =3D=3D SDHC_CTRL=
_SDMA) {
> +                s->blksize && SDHC_DMA_TYPE(s->hostctl1) =3D=3D SDHC_CTR=
L_SDMA) {
>              if (s->trnmod & SDHC_TRNS_MULTI) {
>                  sdhci_sdma_transfer_multi_blocks(s);
>              } else {
> @@ -1068,14 +1068,14 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
>          if (!(mask & 0xFF0000)) {
>              sdhci_blkgap_write(s, value >> 16);
>          }
> -        MASKED_WRITE(s->hostctl, mask, value);
> +        MASKED_WRITE(s->hostctl1, mask, value);
>          MASKED_WRITE(s->pwrcon, mask >> 8, value >> 8);
>          MASKED_WRITE(s->wakcon, mask >> 24, value >> 24);
>          if (!(s->prnsts & SDHC_CARD_PRESENT) || ((s->pwrcon >> 1) & 0x7)=
 < 5 ||
>                  !(s->capareg & (1 << (31 - ((s->pwrcon >> 1) & 0x7))))) =
{
>              s->pwrcon &=3D ~SDHC_POWER_ON;
>          }
> -        qemu_set_irq(s->access_led, s->hostctl & 1);
> +        qemu_set_irq(s->access_led, s->hostctl1 & 1);
>          break;
>      case SDHC_CLKCON:
>          if (!(mask & 0xFF000000)) {
> @@ -1284,7 +1284,7 @@ const VMStateDescription sdhci_vmstate =3D {
>          VMSTATE_UINT16(cmdreg, SDHCIState),
>          VMSTATE_UINT32_ARRAY(rspreg, SDHCIState, 4),
>          VMSTATE_UINT32(prnsts, SDHCIState),
> -        VMSTATE_UINT8(hostctl, SDHCIState),
> +        VMSTATE_UINT8(hostctl1, SDHCIState),
>          VMSTATE_UINT8(pwrcon, SDHCIState),
>          VMSTATE_UINT8(blkgap, SDHCIState),
>          VMSTATE_UINT8(wakcon, SDHCIState),
> --
> 2.15.1
>
>
