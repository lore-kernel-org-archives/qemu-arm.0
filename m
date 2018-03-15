Received: by 10.28.91.67 with SMTP id p64csp1351313wmb;
        Thu, 15 Mar 2018 05:32:02 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtzRzbOS/8VhQxeBdnLaSJmCWeVZ2CsHL07Gfi8xRZBSsLq9oW1gBRi32pcVsdSKGrb3D0n
X-Received: by 10.55.31.25 with SMTP id f25mr12246016qkf.24.1521117122258;
        Thu, 15 Mar 2018 05:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521117122; cv=none;
        d=google.com; s=arc-20160816;
        b=RwKkKAuCzptlfCTsAW9dZP5gB19JKQxg/W9Th3SHy/SfLT7g2K6d6UDZdF7e7KlAiR
         T8cGp14P/o+jfCNNFGK3bFw/PW8aW5njO1lZUKMzz1KTiW3k2YnXvbf2zqYhQjaG34yi
         1uCN354khsyzRSyeRWAPYRm6SiQypITx5qmG2oij5RTZKGkwlpzJFN9MdIoNZqIX6v2l
         dc0kn/wgZLeHDpXy1xaH04DWHrav7vbe+2oJFMN2DGnPtBB9Jgu7e9mN0Yo50AqQyPAH
         4hue2eepM2XjHtHUDPaQA/iCYdhIyUaNlpSl3QS9qeitbmH3aqpy+Za9cYtziz6j4Qbj
         +Asw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=PO1MXS/jvFmy8wzTlODb/bh7dT3Wb0NPAUTnPequk7o=;
        b=JrBmlYIJxBATzovnar1HMpWSDeAaLiysjAva3+hO5X96Nj5SB19E6rZdDS6LCopCjW
         yTnmNJmYdKL/XSnfIxi61pAkkCq4aSYweFQH7tCBR4hdiIxuWd6pYcr1Elhviyc+szkz
         FqZVrDTVmL1yaS4ogDEGFIZS2qSMI732eGsHGzCvFfKZbF574pEE0U9Z0OMPOMitePro
         h7aH4wB/HyUfHEKpWkC7/ahD2puFYUcJmscA5SBt5j3jvHX5qx1iJgmLGUhTtu8GCZca
         Rgs88DcqAU7tSuFSYYUNQ9Evh8SutefWrzKeZsESRpFrZoo36Cx1CLWj1PRPeGJBcF2o
         mf3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t1QrZ6fR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i29si5438795qti.400.2018.03.15.05.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Mar 2018 05:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t1QrZ6fR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51229 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewS37-0005y1-Mv
	for alex.bennee@linaro.org; Thu, 15 Mar 2018 08:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ewS2m-0005tN-3m
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 08:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ewS2l-0001Hq-2J
	for qemu-arm@nongnu.org; Thu, 15 Mar 2018 08:31:40 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:36002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ewS2f-00018B-5B; Thu, 15 Mar 2018 08:31:33 -0400
Received: by mail-wr0-x242.google.com with SMTP id d10so8126465wrf.3;
	Thu, 15 Mar 2018 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PO1MXS/jvFmy8wzTlODb/bh7dT3Wb0NPAUTnPequk7o=;
	b=t1QrZ6fRgsggUX6G/C+fhR2pcZI0vWvIpBd/Ng4yNEZDyQh7Ryu6Aj38GdTtwmVRt2
	UNsy9qs/91V+mgTajwEZ+U+7P5AdaCzHnDiBI7v5LyOwF2qBXWaK618qZYZwSXY5GNwz
	lBrkeHyYBiFspiFtBdHrC7FTpjjQsirGqtwJbPKVsbGBzaTiYgyhfgwHi08QCUK3r9fm
	FZB3HcpKDiTPvw/rm5hVkx3lMxweax91KOfqMTig6WiGcyC6yxaxDpv/RWW0bIokjsIZ
	sKvP3meAeuAl16+LW13rteNg711h6aHFsLFvLHetZDzuKgS1nSz5udlAl4KtMO2u/7KO
	WnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PO1MXS/jvFmy8wzTlODb/bh7dT3Wb0NPAUTnPequk7o=;
	b=bQgJfT2e7fLF5gIzyuYJxzz58dfvs927awnws7XjCeGc8tJ9VUZizluyFIG7gbrK8J
	FcA4LtUnBjQu7e9VWg5IeeaiANXCJSUhxk6uXhYH4eFvp4soWooT07hlkZwc7AxZshSI
	9ZATSkuRpsnyDXynSoE3PQxC3sEJ4MaIyV5dx2gGzLccSRjeIuLNcMG+rY0I8GsfhjN6
	aabVCoEZkDhxRDEoyEn1zqAnL81BmyGQVD4EE6zwb4dZ6B4ScznJm0GX30/FZGOluOOn
	IZPUXUqeMoHYduPbVWs5ysYywTCmrWjYCTp+yyDSaBgUiloXJdLBgP+4I/Anot1eb4Gm
	DrmA==
X-Gm-Message-State: AElRT7FzNPFK84vWfwOjb8quCUTJ7is8m3V9pZ/9g3itRKXjDjoGw3Ss
	QCSPwEB0t5fPdLW4m/IrugA=
X-Received: by 10.223.152.142 with SMTP id w14mr6245936wrb.210.1521117092027; 
	Thu, 15 Mar 2018 05:31:32 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65]) by smtp.gmail.com with ESMTPSA id
	w16sm5194110wrc.26.2018.03.15.05.31.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 05:31:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <1d6ab08a-c21d-8a8d-abdd-b99a40605787@amsat.org>
Date: Thu, 15 Mar 2018 13:31:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [PATCH 9/9] hw/arm/raspi: Provide spin-loop code for
 AArch64 CPUs
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47yMBOEAfaSU

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> The raspi3 has AArch64 CPUs, which means that our smpboot
> code for keeping the secondary CPUs in a pen needs to have
> a version for A64 as well as A32. Without this, the
> secondary CPUs go into an infinite loop of taking undefined
> instruction exceptions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/raspi.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index ae15997669..06f1e08ca9 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -27,6 +27,7 @@
>  #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
>  #define FIRMWARE_ADDR_2 0x8000 /* Pi 2 loads kernel.img here by default */
>  #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
> +#define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
>  
>  /* Table of Linux board IDs for different Pi versions */
>  static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};
> @@ -63,6 +64,40 @@ static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
>                         info->smp_loader_start);
>  }
>  
> +static void write_smpboot64(ARMCPU *cpu, const struct arm_boot_info *info)
> +{
> +    /* Unlike the AArch32 version we don't need to call the board setup hook.
> +     * The mechanism for doing the spin-table is also entirely different.
> +     * We must have four 64-bit fields at absolute addresses
> +     * 0xd8, 0xe0, 0xe8, 0xf0 in RAM, which are the flag variables for
> +     * our CPUs, and which we must ensure are zero initialized before
> +     * the primary CPU goes into the kernel. We put these variables inside
> +     * a rom blob, so that the reset for ROM contents zeroes them for us.
> +     */

Checking with Linux doc/Documentation/arm64/booting.txt and
arch/arm/boot/dts/bcm2837.dtsi.

> +    static const uint32_t smpboot[] = {
> +        0xd2801b05, /*        mov     x5, 0xd8 */

x5 = &spintable;

> +        0xd53800a6, /*        mrs     x6, mpidr_el1 */
> +        0x924004c6, /*        and     x6, x6, #0x3 */

x6 = clusterid;

> +        0xd503205f, /* spin:  wfe */
> +        0xf86678a4, /*        ldr     x4, [x5,x6,lsl #3] */

x4 = &spintable[clusterid];

> +        0xb4ffffc4, /*        cbz     x4, spin */

loop if !x4 ...

> +        0xd2800000, /*        mov     x0, #0x0 */
> +        0xd2800001, /*        mov     x1, #0x0 */
> +        0xd2800002, /*        mov     x2, #0x0 */
> +        0xd2800003, /*        mov     x3, #0x0 */
> +        0xd61f0080, /*        br      x4 */

... else jump()

> +    };
> +
> +    static const uint64_t spintables[] = {
> +        0, 0, 0, 0

the "naturally-aligned 64-bit zero-initalised memory"

> +    };
> +
> +    rom_add_blob_fixed("raspi_smpboot", smpboot, sizeof(smpboot),
> +                       info->smp_loader_start);
> +    rom_add_blob_fixed("raspi_spintables", spintables, sizeof(spintables),
> +                       SPINTABLE_ADDR);

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +}
> +
>  static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info *info)
>  {
>      arm_write_secure_board_setup_dummy_smc(cpu, info, MVBAR_ADDR);
> @@ -99,7 +134,11 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
>      /* Pi2 and Pi3 requires SMP setup */
>      if (version >= 2) {
>          binfo.smp_loader_start = SMPBOOT_ADDR;
> -        binfo.write_secondary_boot = write_smpboot;
> +        if (version == 2) {
> +            binfo.write_secondary_boot = write_smpboot;
> +        } else {
> +            binfo.write_secondary_boot = write_smpboot64;
> +        }
>          binfo.secondary_cpu_reset_hook = reset_secondary;
>      }
>  
> 
