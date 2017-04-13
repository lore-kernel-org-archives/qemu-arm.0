Received: by 10.25.0.144 with SMTP id 138csp697503lfa;
        Thu, 13 Apr 2017 04:36:19 -0700 (PDT)
X-Received: by 10.200.35.184 with SMTP id q53mr2252675qtq.235.1492083378959;
        Thu, 13 Apr 2017 04:36:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p56si5402984qta.327.2017.04.13.04.36.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Apr 2017 04:36:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48627 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyd2w-0000ry-DQ
	for alex.bennee@linaro.org; Thu, 13 Apr 2017 07:36:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cyd2q-0000ri-PG
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 07:36:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cyd2l-0003gR-Rs
	for qemu-arm@nongnu.org; Thu, 13 Apr 2017 07:36:12 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33761)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cyd2l-0003g0-Lq; Thu, 13 Apr 2017 07:36:07 -0400
Received: by mail-qk0-x242.google.com with SMTP id d131so7836490qkc.0;
	Thu, 13 Apr 2017 04:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=msrHC6bjck/qTvdcKYMlJ97pfcLDLrx8aydMFaxy/jA=;
	b=Wc6eYm7dZlify2ZY4QXYX0y6mx80nKxfBlpqY5eajhLd1iSioIFFt1mZKWo/XkSrhC
	+8IH3V7jum2oZ3TAqPE2rpyaOgF5LIgEh88nLnzyrnOQGSFE+IxG8Tk4CUSYDBcAxcRS
	5/3BGw8ERy6PajsH4YrPyL9qLUS9OSD++X+7BNWyt9GhgIDbTX/b8UGB0t5Bs5NdFQdr
	KShnzoQGS1BXuhNPt6GJvQK+UK7Z3TIuscg03CCXm3Gr98HzTTDzTz2E6UuCbJlQ7iEt
	hA7kq+H+YZWINWDWpDg64rQ81aO1lfWJPj8Mudyn6uD6MA594H2ikxbA7gv2nAAKivof
	Oq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=msrHC6bjck/qTvdcKYMlJ97pfcLDLrx8aydMFaxy/jA=;
	b=eidQXEfGpXSIRH/nrGDtdI9IThLspCbdKFBeeQIHUNiFQIcFaGsyOFKw62rjOXhfkN
	ZVACLiLXMy1Dbg0+qXl0cLPKTF+TCzLkYPLKcrt8T4cgU1j7aX9lqREV618ILMPXavpR
	AbpRYIs3pfeGFykXjvT0QrHJALAjYCMpndEkYpiRP/JazUfdQYlJqfPcYxqEq41H5Ayc
	NzwfmCazifxRCifXjgZPuEkWKD/hk2P4NjrEMBdiv4yy+FHrrVUI5NGqs7cD1TD/MwkR
	cPTboRZBaSuSsBqWlE8zTvVaEBFGXFpO1EkUiUoRn8JcDs6+rOr5NkXfuW4DeSXz5iJl
	9gzw==
X-Gm-Message-State: AN3rC/4eXw6UbqxCcx8nl1Ya05pygJ/0LtttF87zU9esrD5dsks/cnti
	w34myleZ2Hr/Kw==
X-Received: by 10.55.160.143 with SMTP id j137mr1962843qke.119.1492083366697; 
	Thu, 13 Apr 2017 04:36:06 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	k36sm15585940qtc.10.2017.04.13.04.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 04:36:05 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1492076514-28821-1-git-send-email-clg@kaod.org>
	<1492076514-28821-2-git-send-email-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ad46ff4-5ec9-4165-bcea-a0fb1b613c4e@amsat.org>
Date: Thu, 13 Apr 2017 08:36:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1492076514-28821-2-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [PATCH v2 1/5] hw/net: add MII definitions
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XMgweoQIn6US

On 04/13/2017 06:41 AM, Cédric Le Goater wrote:
> This adds comments on the Basic mode control and status registers bit
> definitions. It also adds a couple of bits for 1000BASE-T and the
> RealTek 8211E PHY for the FTGMAC100 model to use.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/net/mii.h | 71 +++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 53 insertions(+), 18 deletions(-)
>
> diff --git a/include/hw/net/mii.h b/include/hw/net/mii.h
> index 9fdd7bbe75f1..6ce48a6d7802 100644
> --- a/include/hw/net/mii.h
> +++ b/include/hw/net/mii.h
> @@ -22,13 +22,20 @@
>  #define MII_H
>
>  /* PHY registers */
> -#define MII_BMCR            0
> -#define MII_BMSR            1
> -#define MII_PHYID1          2
> -#define MII_PHYID2          3
> -#define MII_ANAR            4
> -#define MII_ANLPAR          5
> -#define MII_ANER            6
> +#define MII_BMCR            0  /* Basic mode control register */
> +#define MII_BMSR            1  /* Basic mode status register */
> +#define MII_PHYID1          2  /* ID register 1 */
> +#define MII_PHYID2          3  /* ID register 2 */
> +#define MII_ANAR            4  /* Autonegotiation advertisement */
> +#define MII_ANLPAR          5  /* Autonegotiation lnk partner abilities */
> +#define MII_ANER            6  /* Autonegotiation expansion */
> +#define MII_ANNP            7  /* Autonegotiation next page */
> +#define MII_ANLPRNP         8  /* Autonegotiation link partner rx next page */
> +#define MII_CTRL1000        9  /* 1000BASE-T control */
> +#define MII_STAT1000        10 /* 1000BASE-T status */
> +#define MII_MDDACR          13 /* MMD access control */
> +#define MII_MDDAADR         14 /* MMD access address data */
> +#define MII_EXTSTAT         15 /* Extended Status */
>  #define MII_NSR             16
>  #define MII_LBREMR          17
>  #define MII_REC             18
> @@ -38,19 +45,33 @@
>  /* PHY registers fields */
>  #define MII_BMCR_RESET      (1 << 15)
>  #define MII_BMCR_LOOPBACK   (1 << 14)
> -#define MII_BMCR_SPEED      (1 << 13)
> -#define MII_BMCR_AUTOEN     (1 << 12)
> -#define MII_BMCR_FD         (1 << 8)
> +#define MII_BMCR_SPEED100   (1 << 13)  /* LSB of Speed (100) */
> +#define MII_BMCR_SPEED      MII_BMCR_SPEED100
> +#define MII_BMCR_AUTOEN     (1 << 12) /* Autonegotiation enable */
> +#define MII_BMCR_PDOWN      (1 << 11) /* Enable low power state */
> +#define MII_BMCR_ISOLATE    (1 << 10) /* Isolate data paths from MII */
> +#define MII_BMCR_ANRESTART  (1 << 9)  /* Auto negotiation restart */
> +#define MII_BMCR_FD         (1 << 8)  /* Set duplex mode */
> +#define MII_BMCR_CTST       (1 << 7)  /* Collision test */
> +#define MII_BMCR_SPEED1000  (1 << 6)  /* MSB of Speed (1000) */
>
> -#define MII_BMSR_100TX_FD   (1 << 14)
> -#define MII_BMSR_100TX_HD   (1 << 13)
> -#define MII_BMSR_10T_FD     (1 << 12)
> -#define MII_BMSR_10T_HD     (1 << 11)
> -#define MII_BMSR_MFPS       (1 << 6)
> -#define MII_BMSR_AN_COMP    (1 << 5)
> -#define MII_BMSR_AUTONEG    (1 << 3)
> -#define MII_BMSR_LINK_ST    (1 << 2)
> +#define MII_BMSR_100TX_FD   (1 << 14) /* Can do 100mbps, full-duplex */
> +#define MII_BMSR_100TX_HD   (1 << 13) /* Can do 100mbps, half-duplex */
> +#define MII_BMSR_10T_FD     (1 << 12) /* Can do 10mbps, full-duplex */
> +#define MII_BMSR_10T_HD     (1 << 11) /* Can do 10mbps, half-duplex */
> +#define MII_BMSR_100T2_FD   (1 << 10) /* Can do 100mbps T2, full-duplex */
> +#define MII_BMSR_100T2_HD   (1 << 9)  /* Can do 100mbps T2, half-duplex */
> +#define MII_BMSR_EXTSTAT    (1 << 8)  /* Extended status in register 15 */
> +#define MII_BMSR_MFPS       (1 << 6)  /* MII Frame Preamble Suppression */
> +#define MII_BMSR_AN_COMP    (1 << 5)  /* Auto-negotiation complete */
> +#define MII_BMSR_RFAULT     (1 << 4)  /* Remote fault */
> +#define MII_BMSR_AUTONEG    (1 << 3)  /* Able to do auto-negotiation */
> +#define MII_BMSR_LINK_ST    (1 << 2)  /* Link status */
> +#define MII_BMSR_JABBER     (1 << 1)  /* Jabber detected */
> +#define MII_BMSR_EXTCAP     (1 << 0)  /* Ext-reg capability */
>
> +#define MII_ANAR_PAUSE_ASYM (1 << 11) /* Try for asymetric pause */
> +#define MII_ANAR_PAUSE      (1 << 10) /* Try for pause */
>  #define MII_ANAR_TXFD       (1 << 8)
>  #define MII_ANAR_TX         (1 << 7)
>  #define MII_ANAR_10FD       (1 << 6)
> @@ -58,17 +79,31 @@
>  #define MII_ANAR_CSMACD     (1 << 0)
>
>  #define MII_ANLPAR_ACK      (1 << 14)
> +#define MII_ANLPAR_PAUSEASY (1 << 11) /* can pause asymmetrically */
> +#define MII_ANLPAR_PAUSE    (1 << 10) /* can pause */
>  #define MII_ANLPAR_TXFD     (1 << 8)
>  #define MII_ANLPAR_TX       (1 << 7)
>  #define MII_ANLPAR_10FD     (1 << 6)
>  #define MII_ANLPAR_10       (1 << 5)
>  #define MII_ANLPAR_CSMACD   (1 << 0)
>
> +#define MII_ANER_NWAY       (1 << 0) /* Can do N-way auto-nego */
> +
> +#define MII_CTRL1000_FULL   (1 << 9)  /* 1000BASE-T full duplex */
> +#define MII_CTRL1000_HALF   (1 << 8)  /* 1000BASE-T half duplex */
> +
> +#define MII_STAT1000_FULL   (1 << 11) /* 1000BASE-T full duplex */
> +#define MII_STAT1000_HALF   (1 << 10) /* 1000BASE-T half duplex */
> +
>  /* List of vendor identifiers */
>  /* RealTek 8201 */
>  #define RTL8201CP_PHYID1    0x0000
>  #define RTL8201CP_PHYID2    0x8201
>
> +/* RealTek 8211E */
> +#define RTL8211E_PHYID1     0x001c
> +#define RTL8211E_PHYID2     0xc915
> +
>  /* National Semiconductor DP83848 */
>  #define DP83848_PHYID1      0x2000
>  #define DP83848_PHYID2      0x5c90
>
