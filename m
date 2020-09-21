Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3621396lfq;
        Sun, 20 Sep 2020 20:47:32 -0700 (PDT)
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr28789790wmj.33.1600660052320;
        Sun, 20 Sep 2020 20:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600660052; cv=none;
        d=google.com; s=arc-20160816;
        b=pntqe46cCSZr21oGGQOnNa/oipNXLZU69iTuGl27QDnt4pYGB9y4XETZ2TC8urdaka
         Am5mkDsjNtbYBTgDTHNeCy/JtL4vrBcv5zgHGxubgtM5nnqKGteg0Mzvo5MDaibnHhKE
         Hmpms/r8iccV5t0KI1EPlyp4bMuqbWfCD+yPzs5rHsIagyeRGgC27+3XoOZNbRsl1mlX
         78p4iGur9nXJ8iOzZRXKDCergqJEmf/cUKyCBooGPZIVRUocKGE2Rz7EoJTw/hB6Bfta
         ueLq3K6y1OUU6Acu+30DFmLYnVEXviE6gW+relAXph4UfXKIvNgHw7s4s5NY8mfZpAhS
         YRTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=gjFOw5Zj9oE5Q4kDhKw5pc8BNx41CMef2pSlNT1oQak=;
        b=VTHiv4tzQtiUH78nHRKZOtR+Vq72eyIQszcl/H0GuBiuUhVpjKh6R7hYxIbzBfV5K5
         9eOGarNsbPfVEsV2sLgHkZDvFGlyWfiLX/PwQKsN0WAPt/18ByRRz3rO8Wtcrg9XzbIv
         fwh256Nh1vk0VQpIzfWpj5hIz72/SkofkR/d1JMPbeJ98c2+i9KXsxoqIwLYg+7n7e39
         vSXUc8+NFiSgnuy4O+zsyOMDs01eCO3LC06FRIxoWLtampQJdJteqwfmZ7Y3szuD2a9E
         horWY5Oevk/zoY8cNsRwpM/vbML6tsFqIel+SE00dA3EGkw/B31MoKVPaNN5ltFuWevM
         lfbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PqFk3RfY;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h2sor5035870wmm.21.2020.09.20.20.47.32
        (Google Transport Security);
        Sun, 20 Sep 2020 20:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=PqFk3RfY;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gjFOw5Zj9oE5Q4kDhKw5pc8BNx41CMef2pSlNT1oQak=;
        b=PqFk3RfYkE2fEY9sQUESGF65cG8IP119Nf4csUpfi7MtCsn4Xtg18uhd1j0e3cOqMb
         jIHpLvJHxlcNe0d8X2tfNGl+wZhsVbzeP3c+QkfiTVHpPKx03E9j9JA2QmVM/3rgcIk9
         RSZwdJADuz9vcZw79UaGBO5Oj8FbGleRTN3FEo2Yw5OlztJScQ4Vdqv9m2b5+3uf8EJ6
         4y2uZh7vqoJFLUIyxEBqsEgms+uCi5v41Vsn+vEocURaAoh0q9uzocWcX88XYT40cXag
         oEIK6dr3TpkXJXEGohSJA+6TXpikEsJ43HhzlKRy5pgg53+tk7f4eo3O2OiIQkMpliIN
         j8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=gjFOw5Zj9oE5Q4kDhKw5pc8BNx41CMef2pSlNT1oQak=;
        b=m7BBnHooOtaBIlh8fSCQfZ3nbedcICXUPlo9c8h25j0VM2V3cz7glOS598wNX2BgMC
         YaLVvDjPvId2URotELnwjD0a+5o71h/R+m5UBHeY4X9Y0PoZgqWcHdTaoIIx8n2TgQsU
         kfiD1u2jylWShvNSjeQDccEsdURC3JJGn0m6oZ/X9kKZVnQXhkfK/b8PZCYovQOof0Xr
         89WMP4RbslzX6NTfbT/sN3OkJQOhfILjURIVP3fUknQLGpr1W5S453PBZSMNlubyOFVN
         xISsCyyrtuZ/0nnQ7TzgXJwyuzWaLCbLmPqpmdPnpKZkn7LmfhL/U+09IPLawj8gHDyN
         d5pQ==
X-Gm-Message-State: AOAM533tPDeakYFa16F9D0zk1GQWcmilN9I95/3UzBUKhuo+yNe3p4ql
	2a5/LfEcxJkekVWXvqbgO7edT7j6Rv0=
X-Google-Smtp-Source: ABdhPJwPIRGpy2AfIzFVhHI1+Yxk1V6zMZRSV5kganUbl/5TBTptK9Wlx7cXxhCY7AWTi5hGrLgiEQ==
X-Received: by 2002:a05:600c:410e:: with SMTP id j14mr29335293wmi.13.1600660052083;
        Sun, 20 Sep 2020 20:47:32 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id u63sm11751440wmb.13.2020.09.20.20.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 20:47:31 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Paul Zimmerman <pauldzim@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/3] hw/arm/raspi: Define various blocks base addresses
Date: Mon, 21 Sep 2020 05:47:27 +0200
Message-Id: <20200921034729.432931-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921034729.432931-1-f4bug@amsat.org>
References: <20200921034729.432931-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: WUECgLEvmMh6

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
