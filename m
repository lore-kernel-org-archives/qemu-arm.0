Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4069353lfq;
        Mon, 21 Sep 2020 08:27:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHPpCmdH8o8JLoxySbdi2WK569nPLPTfHyMgqP1es/ZJbjsySyM0HVFqkmTIw/Dd/Ty7Xw
X-Received: by 2002:a1c:818f:: with SMTP id c137mr217331wmd.0.1600702036849;
        Mon, 21 Sep 2020 08:27:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600702036; cv=none;
        d=google.com; s=arc-20160816;
        b=CLTOAg2/M1oU0lZgR1jS9ARLAAY7uXOnvL6JHqLvTJwnpR9tuFuJeMMyN66MI1vr6C
         N+IfDWrjAeMmhwyxLgTzgMA3HU1tOsAMZKb+TFbrkc1uv4GOqLywrin4+EKOShfc2wG/
         ZK82b5a4r820hQYgNrOMAnSBRKMJFRuneNx1h6lxDF5S+/3UcjYCxG5VeVr86oZElwCE
         LMktxSHTFrHoRzT8lSqpfSsmI7iVJ1vhZTfNzgV7dR9g+OT2znV6Libdut/I6e7BqUmE
         hXtTYh4gK2G5trXrKzlioiCE8pJDKGIYVsMhmDsx3CVytx2RNs3NiKywz4225xw0In7G
         1I1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=hxJ4PdvFYAs4L5U0XHX5tLQsiwbC0irTnH3fLQiq3Cw=;
        b=Mp1VxhbiUNG2w5FPdgjco1iiazvftux3KhPvp6ymN/3QuXu/f+9DNdyDJdMP8i+uky
         DiTiSOXU5kD3PrcWryoxtbJjCOdJGaS1YwpfF01sG9fRoVVWywFT+k01ZTsdCViPXFXJ
         wrG+t3XfX28DFfmsKK7iQNI0FFrkqoCh4RLEsRPrOOzA/7awT8RGYz1zfRoPs9PYxTNQ
         RD85aJOf3gReur2u4IdBbOlG1prEQVVekLerTXdI6X97UF4f0+N7V1N6GCYoZglfD988
         xYIjJiBUylFs5MYyM+alBd7EVlf8LdBe20MhOoLfRF7OLbwyArbvxEYC0bcAcvOqufzu
         e9mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=uEMKUZGi;
       spf=pass (google.com: domain of luc.michel@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=luc.michel@greensocs.com
Return-Path: <luc.michel@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id f15si12113571wrq.110.2020.09.21.08.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 08:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of luc.michel@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=uEMKUZGi;
       spf=pass (google.com: domain of luc.michel@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=luc.michel@greensocs.com
Received: from [172.17.10.14] (unknown [172.17.10.14])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 0D19C21CBD;
	Mon, 21 Sep 2020 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1600702035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hxJ4PdvFYAs4L5U0XHX5tLQsiwbC0irTnH3fLQiq3Cw=;
	b=uEMKUZGihkqoMNTwjD/WPgqYo+VxxQ6heU+/YXEROCjpcUufzRhdaF0MuiTwKUwPeRd5xo
	T+4VedncEwNo4m/VFhjfx5ZegPQ1yKvnuchwgRxp+crd8d2eYfEGhjiYEaWVRkJsvzJ/nP
	F0V8lH0KSoxPTHiHcl7JelzlJ3ogLhs=
Subject: Re: [PATCH 1/3] hw/arm/raspi: Define various blocks base addresses
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Paul Zimmerman <pauldzim@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200921034729.432931-1-f4bug@amsat.org>
 <20200921034729.432931-2-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <63cb517b-87a4-b6a3-a895-f778e3d1f37f@greensocs.com>
Date: Mon, 21 Sep 2020 17:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921034729.432931-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: AiVXvPRN5hJ3

On 9/21/20 5:47 AM, Philippe Mathieu-Daudé wrote:
> The Raspberry firmware is closed-source. While running it, it
> accesses various I/O registers. Logging these accesses as UNIMP
> (unimplemented) help to understand what the firmware is doing
> (ideally we want it able to boot a Linux kernel).
> 
> Document various blocks we might use later.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   include/hw/arm/raspi_platform.h | 51 +++++++++++++++++++++++++++------
>   1 file changed, 43 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
> index 61b04a1bd4a..c7f50b260f6 100644
> --- a/include/hw/arm/raspi_platform.h
> +++ b/include/hw/arm/raspi_platform.h
> @@ -20,20 +20,29 @@
>    * You should have received a copy of the GNU General Public License
>    * along with this program; if not, write to the Free Software
>    * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + *
> + * Various undocumented addresses and names come from Herman Hermitage's VC4
> + * documentation:
> + * https://github.com/hermanhermitage/videocoreiv/wiki/MMIO-Register-map
>    */
>   
>   #ifndef HW_ARM_RASPI_PLATFORM_H
>   #define HW_ARM_RASPI_PLATFORM_H
>   
>   #define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
> -#define IC0_OFFSET              0x2000
> +#define CCPT_OFFSET             0x1000   /* Compact Camera Port 2 TX */
> +#define INTE_OFFSET             0x2000   /* VC Interrupt controller */
>   #define ST_OFFSET               0x3000   /* System Timer */
> +#define TXP_OFFSET              0x4000   /* Transposer */
> +#define JPEG_OFFSET             0x5000
>   #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
>   #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
> -#define ARM_OFFSET              0xB000   /* BCM2708 ARM control block */
> +#define ARBA_OFFSET             0x9000
> +#define BRDG_OFFSET             0xa000
> +#define ARM_OFFSET              0xB000   /* ARM control block */
>   #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
>   #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
> -#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
> +#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 (SP804) */
>   #define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Semaphores
>                                                         * Doorbells & Mailboxes */
>   #define CPRMAN_OFFSET           0x100000 /* Power Management, Watchdog */
> @@ -42,24 +51,50 @@
>   #define AVS_OFFSET              0x103000 /* Audio Video Standard */
>   #define RNG_OFFSET              0x104000
>   #define GPIO_OFFSET             0x200000
> -#define UART0_OFFSET            0x201000
> -#define MMCI0_OFFSET            0x202000
> -#define I2S_OFFSET              0x203000
> -#define SPI0_OFFSET             0x204000
> +#define UART0_OFFSET            0x201000 /* PL011 */
> +#define MMCI0_OFFSET            0x202000 /* Legacy MMC */
> +#define I2S_OFFSET              0x203000 /* PCM */
> +#define SPI0_OFFSET             0x204000 /* SPI master */
>   #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
> +#define PIXV0_OFFSET            0x206000
> +#define PIXV1_OFFSET            0x207000
> +#define DPI_OFFSET              0x208000
> +#define DSI0_OFFSET             0x209000 /* Display Serial Interface */
> +#define PWM_OFFSET              0x20c000
> +#define PERM_OFFSET             0x20d000
> +#define TEC_OFFSET              0x20e000
>   #define OTP_OFFSET              0x20f000
> +#define SLIM_OFFSET             0x210000 /* SLIMbus */
> +#define CPG_OFFSET              0x211000
>   #define THERMAL_OFFSET          0x212000
> -#define BSC_SL_OFFSET           0x214000 /* SPI slave */
> +#define AVSP_OFFSET             0x213000
> +#define BSC_SL_OFFSET           0x214000 /* SPI slave (bootrom) */
>   #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
>   #define EMMC1_OFFSET            0x300000
> +#define EMMC2_OFFSET            0x340000
> +#define HVS_OFFSET              0x400000
>   #define SMI_OFFSET              0x600000
> +#define DSI1_OFFSET             0x700000
> +#define UCAM_OFFSET             0x800000
> +#define CMI_OFFSET              0x802000
>   #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
>   #define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
> +#define VECA_OFFSET             0x806000
> +#define PIXV2_OFFSET            0x807000
> +#define HDMI_OFFSET             0x808000
> +#define HDCP_OFFSET             0x809000
> +#define ARBR0_OFFSET            0x80a000
>   #define DBUS_OFFSET             0x900000
>   #define AVE0_OFFSET             0x910000
>   #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
> +#define V3D_OFFSET              0xc00000
>   #define SDRAMC_OFFSET           0xe00000
> +#define L2CC_OFFSET             0xe01000 /* Level 2 Cache controller */
> +#define L1CC_OFFSET             0xe02000 /* Level 1 Cache controller */
> +#define ARBR1_OFFSET            0xe04000
>   #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
> +#define DCRC_OFFSET             0xe07000
> +#define AXIP_OFFSET             0xe08000
>   
>   /* GPU interrupts */
>   #define INTERRUPT_TIMER0               0
> 
