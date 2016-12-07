Received: by 10.25.159.131 with SMTP id i125csp536728lfe;
        Wed, 7 Dec 2016 13:03:40 -0800 (PST)
X-Received: by 10.237.40.4 with SMTP id r4mr60260165qtd.103.1481144620436;
        Wed, 07 Dec 2016 13:03:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id f131si15412193qkb.34.2016.12.07.13.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 13:03:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEjNL-00085k-RV
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 16:03:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEjNA-00083T-RJ
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:03:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEjN5-0001RW-UW
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 16:03:28 -0500
Received: from mail-wj0-f196.google.com ([209.85.210.196]:36315)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cEjN5-0001RH-O9; Wed, 07 Dec 2016 16:03:23 -0500
Received: by mail-wj0-f196.google.com with SMTP id j10so24499174wjb.3;
	Wed, 07 Dec 2016 13:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=noLY17S961xV++oNoAylnSPU/K/OuZqiXSkU+0nZKbs=;
	b=paSWpoWoG6Fr65lifj3MfBcPrIqwDEBsIARdE4gC8m3lMdrB2jB4yN14xLTq0xoe2P
	9pPlnWrN1eSAiv9DBB45BkoKNkMvRyYVnZ00pgM6AiQjrI3HFDoEWIYzpn1EWMFgY+2c
	PEzSDMW9Bl4iaphdmnBORCWfOWpA11AZVddLYnQrMpEeF0R63kCWFN07lF1uYETiuR5x
	qtkln9yebG4lF7PbSygKPc257oCfLqQWTpN3RHqCfOptjerQF//F7mJRvd+57vZkCQnO
	vVo9tiU7HT/U5T+xUs3qsdfkc7iSQ7odEmKSyNJ/c1lThtxgW+bhU/9eDBwZyNqaZiGD
	Sfdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=noLY17S961xV++oNoAylnSPU/K/OuZqiXSkU+0nZKbs=;
	b=PGnRGYZfjyBXm7hNXXrNle4o1L5EYcyDervKuLAdB3BB6h3Fs39uSnxIGvw4oNIJ/R
	2zGNQG0piWIKxUJYk/BB9QYrS0x1uVgt+PPTUsAn8WtcFgdCLC7eDbhWNjo2mlTu+O9D
	Xsy4N8orIhCanf9NRRvA7vX3Um7URnY62/UaNWMEry3w8or8y5SqMxOAsQMzgYFLSLJf
	r0dB5LF5fyMR/i71bcZdnqRE4U23BWKSq7GcDUtfPwtYiOne+Fm5dgg1882cX9L0rgEn
	LJ8vLuM2vB8VzPvoIk+4Ed8eiSm1hIefzcbPUmeuSxxktMac7fIgzaQ4fdzdU4r452Zf
	nbYA==
X-Gm-Message-State: AKaTC02k9XhQxJmAn7X0c/OvOVOLdCIx9tpM1umw+aBD/RgWiVgNjsx7XMig9VHusutVpw==
X-Received: by 10.25.72.215 with SMTP id v206mr25290419lfa.12.1481144542577;
	Wed, 07 Dec 2016 13:02:22 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	b76sm4976387lfg.41.2016.12.07.13.02.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Dec 2016 13:02:22 -0800 (PST)
Date: Wed, 7 Dec 2016 22:02:21 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161207210221.GF9606@toto>
References: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
	<1481046379-32632-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481046379-32632-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.210.196
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/intc/arm_gicv3: Remove incorrect
 usage of fieldoffset
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +oo1YuiXCCWQ

On Tue, Dec 06, 2016 at 05:46:18PM +0000, Peter Maydell wrote:
> In the ARMCPRegInfo definitions for the GICv3 CPU interface
> registers, we were trying to use .fieldoffset to specify
> the locations of data fields within the GICv3CPUState struct.
> This is completely broken, because .fieldoffset is for offsets
> into the CPUARMState struct. We didn't notice because we
> were only using this for reads to BPR0, AP0R<n>, IGRPEN0
> and CTLR_EL3, and Linux doesn't use these registers.
> 
> Replace the .fieldoffset uses with explicit read functions.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index bca30c4..35e8eb3 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -1118,35 +1118,35 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
>        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 3,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL1_RW, .accessfn = gicv3_fiq_access,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_bpr[GICV3_G0]),
> +      .readfn = icc_bpr_read,
>        .writefn = icc_bpr_write,
>      },
>      { .name = "ICC_AP0R0_EL1", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 4,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL1_RW, .accessfn = gicv3_fiq_access,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][0]),
> +      .readfn = icc_ap_read,
>        .writefn = icc_ap_write,
>      },
>      { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL1_RW, .accessfn = gicv3_fiq_access,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][1]),
> +      .readfn = icc_ap_read,
>        .writefn = icc_ap_write,
>      },
>      { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL1_RW, .accessfn = gicv3_fiq_access,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][2]),
> +      .readfn = icc_ap_read,
>        .writefn = icc_ap_write,
>      },
>      { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL1_RW, .accessfn = gicv3_fiq_access,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][3]),
> +      .readfn = icc_ap_read,
>        .writefn = icc_ap_write,
>      },
>      /* All the ICC_AP1R*_EL1 registers are banked */
> @@ -1275,7 +1275,7 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
>        .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 6,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL1_RW, .accessfn = gicv3_fiq_access,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_igrpen[GICV3_G0]),
> +      .readfn = icc_igrpen_read,
>        .writefn = icc_igrpen_write,
>      },
>      /* This register is banked */
> @@ -1299,7 +1299,6 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
>        .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 12, .opc2 = 4,
>        .type = ARM_CP_IO | ARM_CP_NO_RAW,
>        .access = PL3_RW,
> -      .fieldoffset = offsetof(GICv3CPUState, icc_ctlr_el3),
>        .readfn = icc_ctlr_el3_read,
>        .writefn = icc_ctlr_el3_write,
>      },
> -- 
> 2.7.4
> 
