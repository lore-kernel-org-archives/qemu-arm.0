Received: by 10.223.159.74 with SMTP id f10csp136218wrg;
        Fri, 15 Dec 2017 15:55:55 -0800 (PST)
X-Google-Smtp-Source: ACJfBotK1T0HrixW+COXA/2VmmrqvbFkvaArwEDjhdPtANhYvGD9XysF/eAlJglWaANOBrPb/vMN
X-Received: by 10.37.178.26 with SMTP id i26mr8173027ybj.208.1513382155695;
        Fri, 15 Dec 2017 15:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513382155; cv=none;
        d=google.com; s=arc-20160816;
        b=xpNC/2QRVmbvA63Vm+AkZ7Z9yuYQb05sTfu2CMiB0qKquJOYksnMstb1Qr3lLa9F4O
         Rr5SP5n9EZqQxcYNWzFaa5a/k/6J/tljBuzLRSS6QVZ0ByYDg/kE2YSxVD6CHyaljdRt
         1dC1a/8zWL3jm+K5RM72uPvGsoi6MBKXgbXZ3xAbks8+1k7mVim7whl3S12d3TIybxmq
         O/BTT8fRA0ulO1F9G2M/thuH8J9OUAdX3Su9QDa4+8jUDs6GJWPiLvwFKKiOnBhRROyL
         wzcIbHbmdyz3lSaiPscUUcEtk5rwIzyRhldyLvAe6wVDX8fHVwSEBekaxvbIANiFcUND
         OblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=oTRf9qAa7s5wP1Sef2VmR2YqlrwvzPpYbuG1VGMc/aE=;
        b=f0sH6I2L9DB1CMU75AlmNr/d+Dn6Fd/49Us15UtUx8f6iupr+BbKItx2gFPu3W1UH+
         wSIsnctNDMK26iEIbqYdxXSUZTzpvXJZgyxJ9f96yMcqnHpEHrvzD51NsNdmkWzICzt0
         8U4xpeMl2L/+QFUmxEJUD+7zCjmsRXwG4ajv7m2RejfjsvWbX3Ow5inVTWBRWvOxJYt/
         kgPB2LkLNDNJdzp4yPP/GzJD8IMy7uL2n8mbE2CKdf4Wvzw91+4s/IQid34rFX+JYCFT
         IQpBymbzziOnxjAHhBgtt4ZBn4/+AhWRORL/mV71exWmBP0ZD/Wz0G1fR5ZZ2CMY+A53
         YFOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R84PzfWl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y18si1462619ybh.799.2017.12.15.15.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 15:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=R84PzfWl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePzpb-0000Kw-6W
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 18:55:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePzpT-0000Kq-T4
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 18:55:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePzpS-0007a4-QG
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 18:55:47 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:37128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePzpS-0007Yn-JP; Fri, 15 Dec 2017 18:55:46 -0500
Received: by mail-wr0-x244.google.com with SMTP id k61so9376384wrc.4;
	Fri, 15 Dec 2017 15:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=oTRf9qAa7s5wP1Sef2VmR2YqlrwvzPpYbuG1VGMc/aE=;
	b=R84PzfWlgCI/fYPUA4bwFNxVmGclXrAPVWIjkiiHdQ97GOfG+L6SVFb58npP77cnGx
	8oMlmorJvmDIXAJUAG2xpJ7CuG5dcDimcx92/p7/zlatjHPkFJELb1S/JRwiUPiUYOf3
	wRBb2paipYGH2uGpm8Xyc0zWpelxzJiDysiDc+Ky4pAZCAMsNfT288DL0lLw0ZpHjZvI
	Xmn/Yztu/3Amqij3kBVeSpe7o1WuutbMegK4n6k+65AG92f9OMr9vy9dQHbcmZ55Ngho
	zdW5zUtfy7Y/rnSafWrqUBlf6sOjNSd5MwK2jLv9To5qZuUBC2Cm3PKP+Qn9JaLrpwk0
	I8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=oTRf9qAa7s5wP1Sef2VmR2YqlrwvzPpYbuG1VGMc/aE=;
	b=CCehiVBezIzNMSa9pC+mPmPF8xbpoiiCF62bAvEh6DBakBUypcWgzk2012vBHD04Gl
	BYgx9vTXUjrtFyvMDhODb2ac4PUId53ZONSqMBVaWJ/755EFEPVX+zM0wobKxmudRPVH
	CoHZy/0B5Xie3KawNcaw9imTFEUxNltFEVzaE3+0EP4IbaZl8K1sPlzErlKHzRKDZKT6
	2EkyZGqwHxx8cy6+tdm5vSLD9Axm1ahXXgN59RkNTPRXuMA95SJ5fOYnvC35X+wt3IV9
	fPAyIbr29FseCKPfsC8vykpKnmVavowQS7c53LkuS4T8iqjjU5JbZI8ggw6gjd0VLzgy
	hppg==
X-Gm-Message-State: AKGB3mLoDvDCKziJn+QzIYbv7K6TF4VpV8U/ptkIvEy5RPYhxP1FHW2B
	dCgAjrch/dEx3VGOqAzy5bWKtZPyBwlAleYGGz8=
X-Received: by 10.223.171.79 with SMTP id r15mr448053wrc.219.1513382144512;
	Fri, 15 Dec 2017 15:55:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 15 Dec 2017 15:55:13 -0800 (PST)
In-Reply-To: <20171214020025.4004-2-f4bug@amsat.org>
References: <20171214020025.4004-1-f4bug@amsat.org>
	<20171214020025.4004-2-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Dec 2017 15:55:13 -0800
X-Google-Sender-Auth: 6cawt-fszB4JyIdGgc3z_PH8oM8
Message-ID: <CAKmqyKMW-v+29fqk-Bn3cuC40ctr0RTv5kLhLg+XW-UXiJZS9w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/8] sdhci: add a
 "sd-spec-version" property
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
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8EEhSGKMiIu6

On Wed, Dec 13, 2017 at 6:00 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> default to SDHCI v2
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
> I am not sure which real VENDOR is HCVER=3D0x24, we probably don't care.
>
>  hw/sd/sdhci-internal.h |  4 ++--
>  include/hw/sd/sdhci.h  | 10 ++++++++++
>  hw/sd/sdhci.c          |  5 ++++-
>  3 files changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index e941bc2386..7e4a9d79d1 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -210,9 +210,9 @@
>  /* Slot interrupt status */
>  #define SDHC_SLOT_INT_STATUS            0xFC
>
> -/* HWInit Host Controller Version Register 0x0401 */
> +/* HWInit Host Controller Version Register */
>  #define SDHC_HCVER                      0xFE
> -#define SD_HOST_SPECv2_VERS             0x2401
> +#define SDHC_HCVER_VENDOR               0x24
>
>  #define SDHC_REGISTERS_MAP_SIZE         0x100
>  #define SDHC_INSERTION_DELAY            (NANOSECONDS_PER_SECOND)
> diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
> index 579e0ea644..f8e91ce903 100644
> --- a/include/hw/sd/sdhci.h
> +++ b/include/hw/sd/sdhci.h
> @@ -88,6 +88,9 @@ typedef struct SDHCIState {
>      /* Force Event Auto CMD12 Error Interrupt Reg - write only */
>      /* Force Event Error Interrupt Register- write only */
>      /* RO Host Controller Version Register always reads as 0x2401 */
> +    struct {
> +        uint8_t spec_version;
> +    } capabilities;
>  } SDHCIState;
>
>  #define TYPE_PCI_SDHCI "sdhci-pci"
> @@ -97,4 +100,11 @@ typedef struct SDHCIState {
>  #define SYSBUS_SDHCI(obj)                               \
>       OBJECT_CHECK(SDHCIState, (obj), TYPE_SYSBUS_SDHCI)
>
> +/* Host Controller Specification Version */
> +enum sdhci_spec_version {
> +    SD_HOST_SPECv1_VERS     =3D 0x00,
> +    SD_HOST_SPECv2_VERS     =3D 0x01,
> +    SD_HOST_SPECv3_VERS     =3D 0x02
> +};
> +
>  #endif /* SDHCI_H */
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index d8188fdc2a..d6145342fb 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -908,7 +908,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offse=
t, unsigned size)
>          ret =3D (uint32_t)(s->admasysaddr >> 32);
>          break;
>      case SDHC_SLOT_INT_STATUS:
> -        ret =3D (SD_HOST_SPECv2_VERS << 16) | sdhci_slotint(s);
> +        ret =3D (SDHC_HCVER_VENDOR << 24) | (s->capabilities.spec_versio=
n << 16);
> +        ret |=3D sdhci_slotint(s);
>          break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "SDHC rd_%ub @0x%02" HWADDR_PRIx " "
> @@ -1263,6 +1264,8 @@ const VMStateDescription sdhci_vmstate =3D {
>  /* Capabilities registers provide information on supported features of t=
his
>   * specific host controller implementation */
>  static Property sdhci_properties[] =3D {
> +    DEFINE_PROP_UINT8("sd-spec-version", SDHCIState,
> +                      capabilities.spec_version, SD_HOST_SPECv2_VERS),
>      DEFINE_PROP_UINT32("capareg", SDHCIState, capareg, UINT32_MAX),
>      DEFINE_PROP_UINT32("maxcurr", SDHCIState, maxcurr, 0),
>      DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_=
quirk,
> --
> 2.15.1
>
>
