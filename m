Received: by 10.28.4.212 with SMTP id 203csp2269979wme;
        Sun, 15 Apr 2018 22:23:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49WoSsCTPEMMIURfG/A2GOFEXR5gqKYNMGezmAYTly8NYUqtDER9wj+FW8nqmU5+qdKD8hW
X-Received: by 10.55.21.170 with SMTP id 42mr6878206qkv.332.1523856238795;
        Sun, 15 Apr 2018 22:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523856238; cv=none;
        d=google.com; s=arc-20160816;
        b=DcV8OB39Mtuomn0VyfshRqZY3ywfx9pCXcHLnnM32PyFdtGrBxif9OSZHkrdpBin+i
         5t63pukVQ8I8bq2o96GvAsNmfl3sxvp2LzYlOQxrqUupPm5RrDL4JgWA12CqWm+FUXPo
         x9XO97yNdWdTGtwEBBNGjE9Gut2toMl4VhI0LDp51xtvyyYoZDvv0v3ViK6T+VTC9Zya
         oJJwGhiFSDmBzxibi/IqDdcnH7RtpbOnT6WsMRj/s/VErEziItLcpL2VSbgDN54ac0Gm
         KC9P/XrpqhaFuCKqA+BD+AHhr2AUPOWBdAbgs0ZTAqQh3RgCgBmQMBrchOu8s9lBV0FT
         IjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=2P+rxSSdvF4je0UgX61yFye0X7OHpIW4anXN8i25mPo=;
        b=h/6yxNfoiZdQ1dFwUYBY7AKOFUNlv9pYdbO97roc++qjqIz7dvfsxiA9affKiHJ5rY
         PfeI1KzDfnF0JasFC/wrXWc8iXyqwBpUzQSESvfgoNVwf7+c1gqMBVhdAHA4Au1edEnr
         +rbXJ86dv/cigmmj8XCPbewb6dFK/TVeU1l8+MV2ngNwf1Ttv9cn/baii8oIX8cjQOXm
         ozHMcMNirude9giXsZkVU9z3PW+gNF16ZPXwt/3OZFoFaa4VI9SCqAvXBkxBXci/UJrG
         aY1hwhEWcCfmuOm97cKHP6Qj6+es6BYsEZQQ8dG6JtQRlPWCCHSVqNa5rNh/Qj9zFRUr
         h2fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si10777313qkf.36.2018.04.15.22.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Apr 2018 22:23:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f7wcQ-0006GQ-A9
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 01:23:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1f7wcB-0006EX-H2
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 01:23:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1f7wc6-00081F-J5
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 01:23:43 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:50610
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1f7wc6-00080U-5O; Mon, 16 Apr 2018 01:23:38 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 6BB49DABF79;
	Mon, 16 Apr 2018 07:23:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id n2Ke-glL8Ama; Mon, 16 Apr 2018 07:23:33 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (pD9E018D8.dip0.t-ipconnect.de
	[217.224.24.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id EBAB7DABF60; 
	Mon, 16 Apr 2018 07:23:32 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>
References: <20180415234307.28132-1-f4bug@amsat.org>
	<20180415234307.28132-34-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <f11c4eac-fcbf-0aa3-06bf-570ff57144c4@weilnetz.de>
Date: Mon, 16 Apr 2018 07:23:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180415234307.28132-34-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 33/41] hw/net: Use the
 BYTE-based definitions
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org,
	"open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kcI0fGxPXQx6

Am 16.04.2018 um 01:42 schrieb Philippe Mathieu-Daud=C3=A9:
> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include=
/hw/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/net/allwinner_emac.h | 5 +++--
>  hw/net/e1000e.c                 | 7 ++++---
>  hw/net/e1000x_common.c          | 3 ++-
>  hw/net/eepro100.c               | 7 +++----
>  4 files changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner=
_emac.h
> index 4cc8aab7ec..4b53b6485c 100644
> --- a/include/hw/net/allwinner_emac.h
> +++ b/include/hw/net/allwinner_emac.h
> @@ -23,6 +23,7 @@
>  #ifndef ALLWINNER_EMAC_H
>  #define ALLWINNER_EMAC_H
> =20
> +#include "qemu/units.h"
>  #include "net/net.h"
>  #include "qemu/fifo8.h"
>  #include "hw/net/mii.h"
> @@ -125,8 +126,8 @@
>  #define EMAC_INT_RX         (1 << 8)
> =20
>  /* Due to lack of specifications, size of fifos is chosen arbitrarily =
*/
> -#define TX_FIFO_SIZE        (4 * 1024)
> -#define RX_FIFO_SIZE        (32 * 1024)
> +#define TX_FIFO_SIZE        (4 * K_BYTE)
> +#define RX_FIFO_SIZE        (32 * K_BYTE)
> =20
>  #define NUM_TX_FIFOS        2
>  #define RX_HDR_SIZE         8
> diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
> index 16a9417a85..101efe7c83 100644
> --- a/hw/net/e1000e.c
> +++ b/hw/net/e1000e.c
> @@ -34,6 +34,7 @@
>  */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "net/net.h"
>  #include "net/tap.h"
>  #include "qemu/range.h"
> @@ -81,10 +82,10 @@ typedef struct E1000EState {
>  #define E1000E_IO_IDX       2
>  #define E1000E_MSIX_IDX     3
> =20
> -#define E1000E_MMIO_SIZE    (128 * 1024)
> -#define E1000E_FLASH_SIZE   (128 * 1024)
> +#define E1000E_MMIO_SIZE    (128 * K_BYTE)
> +#define E1000E_FLASH_SIZE   (128 * K_BYTE)
>  #define E1000E_IO_SIZE      (32)
> -#define E1000E_MSIX_SIZE    (16 * 1024)
> +#define E1000E_MSIX_SIZE    (16 * K_BYTE)
> =20
>  #define E1000E_MSIX_TABLE   (0x0000)
>  #define E1000E_MSIX_PBA     (0x2000)
> diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
> index eb0e097137..58c8db77e9 100644
> --- a/hw/net/e1000x_common.c
> +++ b/hw/net/e1000x_common.c
> @@ -23,6 +23,7 @@
>  */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
> @@ -111,7 +112,7 @@ bool e1000x_is_oversized(uint32_t *mac, size_t size=
)
>      static const int maximum_ethernet_vlan_size =3D 1522;
>      /* this is the size past which hardware will
>         drop packets when setting LPE=3D1 */
> -    static const int maximum_ethernet_lpe_size =3D 16384;
> +    static const int maximum_ethernet_lpe_size =3D 16 * K_BYTE;
> =20
>      if ((size > maximum_ethernet_lpe_size ||
>          (size > maximum_ethernet_vlan_size
> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
> index a07a63247e..a02e2b55e8 100644
> --- a/hw/net/eepro100.c
> +++ b/hw/net/eepro100.c
> @@ -41,6 +41,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/hw.h"
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
> @@ -60,8 +61,6 @@
>   * changed to pad short packets itself. */
>  #define CONFIG_PAD_RECEIVED_FRAMES
> =20
> -#define KiB 1024
> -
>  /* Debug EEPRO100 card. */
>  #if 0
>  # define DEBUG_EEPRO100
> @@ -104,9 +103,9 @@
>  /* Use 64 word EEPROM. TODO: could be a runtime option. */
>  #define EEPROM_SIZE     64
> =20
> -#define PCI_MEM_SIZE            (4 * KiB)
> +#define PCI_MEM_SIZE            (4 * K_BYTE)
>  #define PCI_IO_SIZE             64
> -#define PCI_FLASH_SIZE          (128 * KiB)
> +#define PCI_FLASH_SIZE          (128 * K_BYTE)
> =20
>  #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)


Technically this is fine, therefore

Reviewed-by: Stefan Weil <sw@weilnetz.de>

Practically I'd prefer replacing all K_BYTE by KiB, because that is the
standard name with a precise definition:
https://en.wikipedia.org/wiki/Kibibyte.

Stefan
