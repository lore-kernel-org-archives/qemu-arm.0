Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3322015lfq;
        Sun, 20 Sep 2020 10:58:29 -0700 (PDT)
X-Received: by 2002:a5d:6cb1:: with SMTP id a17mr45323018wra.386.1600624709215;
        Sun, 20 Sep 2020 10:58:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600624709; cv=none;
        d=google.com; s=arc-20160816;
        b=nLD7sNTjvvcthI7WU0rJgoOXsm/NKWv87mK951zAKNKw0msh/O5b5AchsrhUDi2VE6
         HAuQFRFOpseflVEamiY5eJQ7y9BtHOU6kDam1sLpT/yi8Qd6fuO5ps1Gd1U5V79BgT6Y
         bpw6UFPEdi3AwwEQiE0pETTsVHpxFi1m3bPDzy39KVHmzpa3fdG34bnPjJUazREpzUci
         Ik0kw1dT4HeSbS5ROSz4xi3dcObp/AGbwdUdRKxmRILVR6Vy7zD9LLdO1c4n3dzdjbMk
         eJxQOjBZxxEpoE6dnvnSdmqVDME9GvYhZXNcyPhIUUb5n9nmEhU3TQxuPs+P8xo2aR4P
         EzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=gjFOw5Zj9oE5Q4kDhKw5pc8BNx41CMef2pSlNT1oQak=;
        b=BkBeJ8ZiYXAydog4a9fmbjiqvl7H5m8FF8AaRvuYjrsLyOQj6ppQqd7oXC606fdi8F
         PP3OW7zAoM/bRRysgd/Dd7fwalzkf1LxIBf0TZG1KV8K6oKRqpWpO6iFBcQlC5S1zG/c
         9WXe7/6KYPNKgKpHPb8ap1GOX/ERaW9QH5R2sI2R62y+T/PzyAvUrZqiUHFRqAFDcx/g
         DAQ3huTRIVaWv7tiIZ4mTxAa2R1z7Fz7wmgH1SIWleLlgT3QO2bXXAGPfbU0d4g5jUWd
         1SHV83kmTNzh56eEe3nQg/f5y3c3GUdL7XfiXlmnwsQyUVz5yfp2kuv0Ho64+EsepAgp
         jmNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YgR9Wz4f;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l1sor4170742wrp.20.2020.09.20.10.58.29
        (Google Transport Security);
        Sun, 20 Sep 2020 10:58:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YgR9Wz4f;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gjFOw5Zj9oE5Q4kDhKw5pc8BNx41CMef2pSlNT1oQak=;
        b=YgR9Wz4fm5JbsRmTNRj8JY8gJwvE+Des/NbC9m9cuu0N50cRUWJLnzYmUWzqQTC5DQ
         co05vfpnoBIg31An0iq5wX40fl5fAP/DV07l7SZrwSQNdFtyWQaLTuRn4AtI7mCfXzUY
         I8iosslRoltgVmSw6oMTJ4Kh4YNVtv+7htBWcM5eW5QEZ5B6Z1RxMiFfgsW6coKT5n8f
         6Gv8kN7sPDuDxJJGw6LiImSBaQcyHWwKkr5Xec0/V9zvoXNewZ0X55YjfEtnOPqrsj0S
         y/WMdbB6sn+oJfTw3mDrzHU9iDGf9k9esZy93oDC3qYSClEWsEsadH0tzXHwesfEeGkP
         Nv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gjFOw5Zj9oE5Q4kDhKw5pc8BNx41CMef2pSlNT1oQak=;
        b=qWWtoeO8+OynAh7dYn0R40Qd5hUQic2gw9bidjsx1yQqOiK6JgYqHMl1oMW5hgZQm8
         qNSK9Kz01O7ns3pp4S55yMHQ4iLqyZqpYHfXsSpPyeuuF94nEjgmP+9uxtlri0PKevpm
         6311UX/X/A2/MJD/sREEYI5sIyZvTnpQPMy7gUnk5Mn5X1Bsb5Mu+b5kC39kXY/48r7p
         dGThcDZslQn6ceyqqoxbFFPZahgxBmCf5KpF6EfxUbfBVgXsPy0I4VApNF0t08eZeqym
         XpePjgDQE/sHNb0D03w3ZbDQ41hQlzB/T5gKErlAone4Fp35tk8VUe9Ei+YcKSrigIeG
         juxA==
X-Gm-Message-State: AOAM530qpbtrNShI1hy6hg7XfDLXyQJ8xdDn/pZT8cQ5jfxYRWO4TEHR
	1xdzw0gdG9WnOdbtnFWuxLgreZXrH0Y=
X-Google-Smtp-Source: ABdhPJz/oIP+1CZ+zU7vhPqv1w1jA3pFbEbTUr/DXvT5ZGQZ7XG0RRllezW3eKbk4cyVWTyBHPPxHA==
X-Received: by 2002:a05:6000:1184:: with SMTP id g4mr47993796wrx.20.1600624708996;
        Sun, 20 Sep 2020 10:58:28 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id u66sm15675781wme.12.2020.09.20.10.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 10:58:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paul Zimmerman <pauldzim@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/7] hw/arm/raspi: Define various blocks base addresses
Date: Sun, 20 Sep 2020 19:58:19 +0200
Message-Id: <20200920175825.417680-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200920175825.417680-1-f4bug@amsat.org>
References: <20200920175825.417680-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: uIM+yJUWSa87

The Raspberry firmware is closed-source. While running it, it
accesses various I/O registers. Logging these accesses as UNIMP
(unimplemented) help to understand what the firmware is doing
(ideally we want it able to boot a Linux kernel).

Document various blocks we might use later.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/raspi_platform.h | 51 +++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 8 deletions(-)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 61b04a1bd4a..c7f50b260f6 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -20,20 +20,29 @@
  * You should have received a copy of the GNU General Public License
  * along with this program; if not, write to the Free Software
  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ *
+ * Various undocumented addresses and names come from Herman Hermitage's VC4
+ * documentation:
+ * https://github.com/hermanhermitage/videocoreiv/wiki/MMIO-Register-map
  */
 
 #ifndef HW_ARM_RASPI_PLATFORM_H
 #define HW_ARM_RASPI_PLATFORM_H
 
 #define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
-#define IC0_OFFSET              0x2000
+#define CCPT_OFFSET             0x1000   /* Compact Camera Port 2 TX */
+#define INTE_OFFSET             0x2000   /* VC Interrupt controller */
 #define ST_OFFSET               0x3000   /* System Timer */
+#define TXP_OFFSET              0x4000   /* Transposer */
+#define JPEG_OFFSET             0x5000
 #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
-#define ARM_OFFSET              0xB000   /* BCM2708 ARM control block */
+#define ARBA_OFFSET             0x9000
+#define BRDG_OFFSET             0xa000
+#define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 */
+#define ARMCTRL_TIMER0_1_OFFSET (ARM_OFFSET + 0x400) /* Timer 0 and 1 (SP804) */
 #define ARMCTRL_0_SBM_OFFSET    (ARM_OFFSET + 0x800) /* User 0 (ARM) Semaphores
                                                       * Doorbells & Mailboxes */
 #define CPRMAN_OFFSET           0x100000 /* Power Management, Watchdog */
@@ -42,24 +51,50 @@
 #define AVS_OFFSET              0x103000 /* Audio Video Standard */
 #define RNG_OFFSET              0x104000
 #define GPIO_OFFSET             0x200000
-#define UART0_OFFSET            0x201000
-#define MMCI0_OFFSET            0x202000
-#define I2S_OFFSET              0x203000
-#define SPI0_OFFSET             0x204000
+#define UART0_OFFSET            0x201000 /* PL011 */
+#define MMCI0_OFFSET            0x202000 /* Legacy MMC */
+#define I2S_OFFSET              0x203000 /* PCM */
+#define SPI0_OFFSET             0x204000 /* SPI master */
 #define BSC0_OFFSET             0x205000 /* BSC0 I2C/TWI */
+#define PIXV0_OFFSET            0x206000
+#define PIXV1_OFFSET            0x207000
+#define DPI_OFFSET              0x208000
+#define DSI0_OFFSET             0x209000 /* Display Serial Interface */
+#define PWM_OFFSET              0x20c000
+#define PERM_OFFSET             0x20d000
+#define TEC_OFFSET              0x20e000
 #define OTP_OFFSET              0x20f000
+#define SLIM_OFFSET             0x210000 /* SLIMbus */
+#define CPG_OFFSET              0x211000
 #define THERMAL_OFFSET          0x212000
-#define BSC_SL_OFFSET           0x214000 /* SPI slave */
+#define AVSP_OFFSET             0x213000
+#define BSC_SL_OFFSET           0x214000 /* SPI slave (bootrom) */
 #define AUX_OFFSET              0x215000 /* AUX: UART1/SPI1/SPI2 */
 #define EMMC1_OFFSET            0x300000
+#define EMMC2_OFFSET            0x340000
+#define HVS_OFFSET              0x400000
 #define SMI_OFFSET              0x600000
+#define DSI1_OFFSET             0x700000
+#define UCAM_OFFSET             0x800000
+#define CMI_OFFSET              0x802000
 #define BSC1_OFFSET             0x804000 /* BSC1 I2C/TWI */
 #define BSC2_OFFSET             0x805000 /* BSC2 I2C/TWI */
+#define VECA_OFFSET             0x806000
+#define PIXV2_OFFSET            0x807000
+#define HDMI_OFFSET             0x808000
+#define HDCP_OFFSET             0x809000
+#define ARBR0_OFFSET            0x80a000
 #define DBUS_OFFSET             0x900000
 #define AVE0_OFFSET             0x910000
 #define USB_OTG_OFFSET          0x980000 /* DTC_OTG USB controller */
+#define V3D_OFFSET              0xc00000
 #define SDRAMC_OFFSET           0xe00000
+#define L2CC_OFFSET             0xe01000 /* Level 2 Cache controller */
+#define L1CC_OFFSET             0xe02000 /* Level 1 Cache controller */
+#define ARBR1_OFFSET            0xe04000
 #define DMA15_OFFSET            0xE05000 /* DMA controller, channel 15 */
+#define DCRC_OFFSET             0xe07000
+#define AXIP_OFFSET             0xe08000
 
 /* GPU interrupts */
 #define INTERRUPT_TIMER0               0
-- 
2.26.2
