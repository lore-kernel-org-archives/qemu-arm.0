Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3822850njn;
        Thu, 16 Jan 2025 07:17:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVwOhMccgU3rEK/cfYzPr5yEvUh+GJbRp3QCf9ZWZQ5RLsPSZe6NdDySTnAMgKZnW5/O7xt7PoSor8vw==@linaro.org
X-Google-Smtp-Source: AGHT+IGB6KWypCgt3UDY1gh2ucPYVZ5WxH4F4WDSxLe08r2Q5mOvHA5tPGeFM1sKhDMECh1lHoJw
X-Received: by 2002:a05:620a:4515:b0:7b6:d4b9:b5a6 with SMTP id af79cd13be357-7bcd96e8e2emr4097207285a.11.1737040633556;
        Thu, 16 Jan 2025 07:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737040633; cv=none;
        d=google.com; s=arc-20240605;
        b=CVEUcHP0SacSbIz6Qr59Y52kCbQvba+pHnQQC2tWe0xrXE2FrtEPOVtF95vP807M8M
         9UVGQufnXeQiGpUGK+E/m75EZpAFLN+k5XE9dlhcWrzqdLULsgEPIPmcBYdcAO6X/h9v
         /5hR1CeNgmEDArEpP7h/EoZ/f09r1mQF3L55VoWG4VufxveA5ek+uCSmUKxn4goZNT9v
         FZd03fb2CCTmo8DNuQ9y5ak/esBJl2XJgLMo5nNvza5iir+07Gw9IKhWr0fmWLMZzhPN
         LmFUmKK1RZk4GzqhIqDLvzbIcTH+oUmCUAKgvpAVglApRnWuwVWUZH36IQdvpTVAmmxp
         HM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=JT2gSkujXsePMz+0NLWXC5dK9R4EnVu/GkcnRqkTwNc=;
        fh=gkogd9Y9rnki/qSFNx4a9IufRA9K4RD1fmlMis5dJ0U=;
        b=Ue58QYIWd+wftubczPsouK0GYDy8Ueuuo6UXdQGf27QWMUwXJcUSEedCCqyoWfmqnV
         G+oYIFdjt33740yimpEgaXLiUknCxAyE2p5HuAsabXxmrKNKSLhs/rbuo8dx0qursHsJ
         kSUcr4DUtG6qMLiIokEMmT8uKD5WtFk+QUKaknJ4/zBphsSMcYrj2mdliGhu0IbLI9D8
         CvXmLpabUJwmckjJ34zc6mlWaW9xLboMAHtYMmYLcx5rRzWCGU2r7T3N1vJL5sCquD8v
         HhgKPdqCmjjdqKAVfCAEUFkYs7tXJInjof0V4m18V03ttALS4U5ZPCyeGaMOjhAwmNLo
         BV5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Vbc6Tiqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afbfae6csi1893276d6.30.2025.01.16.07.17.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 07:17:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Vbc6Tiqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYRcB-0000Ev-A0; Thu, 16 Jan 2025 10:16:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tYRc9-0000EW-LK
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:16:57 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tYRc7-0004py-MZ
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 10:16:57 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436341f575fso10724205e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 07:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1737040614; x=1737645414; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JT2gSkujXsePMz+0NLWXC5dK9R4EnVu/GkcnRqkTwNc=;
 b=Vbc6TiqmKEBE4kMBHicr9WgRgPdrKhTCDR87enSeha3KCz41ZKDL0W+YsMZ7fkTLIa
 Y5LXhA2IGYX8LN+b1nd/SaYxLfjMan+FVkDuip+lUnaakepZ4MBd49OkHablNx6u2w3a
 cxDSknQXvYS1FL5sQwYIkUA9rt2kmZSnijDppybfiPmMfnC2uEhSVXnGbgqHmkbPgA5M
 yAYkBYoyHq1CHdA4yHe6QltG0olb7avFW/+gHFYiMiEymEEnOORaQJFs97ArHTfxR0my
 UrhhoqxPkO9ClEoK4Whmki5xlJR/pYo7G8vGUVrPTibnbWbHVldzn/oOTHZ2jOWpmu9d
 7+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737040614; x=1737645414;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JT2gSkujXsePMz+0NLWXC5dK9R4EnVu/GkcnRqkTwNc=;
 b=xKaM3Clv8JCzJ9+a/V+D0sKYTdPA9JRxuxqqz/pvQNF642VKj+yIxQICjWKtGhpIAf
 8dQ+6PtxX1v27NN2y7+v2NhLcnSVZtnMMu1EbTVji2w2uOCtukADZTLiR3vtaTAzO8oE
 xQsokHm1gHYvXQgkAPPOq/RQJeG/tD6EEOtcl37HHI6NgqGtgSnUTZn9cGJfWMkMte9Z
 vzlkUGzXmU0QXNQcBwE0opGz/Avix/7xfscK/OPAybNpmCPjDCrfHRZVsRw+t29R6Zut
 jV7HzStM9F8bpc8UfNPdqj7gE2aDuVa90O/JKiLqtl5ul22zF7KDoXQvdF4Ki9OGIAFm
 kBvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3w0JkKzctzmOCdcuPUGnslFZZNbPLwop4krrORvzopjLHPCnq009/yFj14tSA1G9KbnNzCzBAUg==@nongnu.org
X-Gm-Message-State: AOJu0Yx5hFyHlhEqPn2lOFQeUIAifLEPvo55nQctrpNWyrI3rf1j8tQO
 qdn43oFRPNTb+mw59PzbhyyHrMwXDH1PSCaL4BOwE2RB3jhudRbVkjVA0FzsdU8=
X-Gm-Gg: ASbGncvtVlfgEYQrSvGBDuuqwHK1NZP2PupU7Y9jMOTjnCi2iYmT2qch5V34ACDKENE
 /yW6Vpz1rYl3OhTtIr+jfzuAvG5fJEzPLQ4j33L7qDfmRjqPpNW2l3bB3saRdus0m3l2DKInili
 K8xnf3Ycx3OaMXi0xpdXdg6b3V51yFtsQvuXhZR3PCnRpcfcd6EowEwo6neQ+cKk6n0MBH+K8vP
 IjVDhmx63Vtj3X2mB7lxORn565x4i9lF5S+racnrdf2sQCc7HsH0q42Nb388d8JvkZWO0DttrIE
 q+HwCE8ggRfk9zVtdR1YjdVg1v/zmf5thDfcKffGXQ==
X-Received: by 2002:a05:600c:1e02:b0:434:f131:1e71 with SMTP id
 5b1f17b1804b1-436f04e048cmr240677835e9.8.1737040613949; 
 Thu, 16 Jan 2025 07:16:53 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041f7e9sm2355325e9.23.2025.01.16.07.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:16:53 -0800 (PST)
Date: Thu, 16 Jan 2025 16:16:52 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH-for-10.1 v2 03/13] hw/arm/virt: Remove
 VirtMachineClass::disallow_affinity_adjustment
Message-ID: <20250116-bf7d225d9fef8277a6315e63@orel>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116145944.38028-4-philmd@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wKbg70hTdoG/

On Thu, Jan 16, 2025 at 03:59:34PM +0100, Philippe Mathieu-Daudé wrote:
> The VirtMachineClass::disallow_affinity_adjustment
> field was only used by virt-2.6 machine, which got
> removed. Remove it and simplify virt_cpu_mp_affinity().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/arm/virt.h |  1 -
>  hw/arm/virt.c         | 30 +++++++++++++++---------------
>  2 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 27c5bb585cb..5d3b25509ff 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -117,7 +117,6 @@ typedef enum VirtGICType {
>  
>  struct VirtMachineClass {
>      MachineClass parent;
> -    bool disallow_affinity_adjustment;
>      bool no_its;
>      bool no_tcg_its;
>      bool claim_edge_triggered_timers;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0080577e1a9..53f4a96e517 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1759,24 +1759,24 @@ void virt_machine_done(Notifier *notifier, void *data)
>  
>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>  {
> -    uint8_t clustersz = ARM_DEFAULT_CPUS_PER_CLUSTER;
> +    uint8_t clustersz;
>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>  
> -    if (!vmc->disallow_affinity_adjustment) {
> -        /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
> -         * GIC's target-list limitations. 32-bit KVM hosts currently
> -         * always create clusters of 4 CPUs, but that is expected to
> -         * change when they gain support for gicv3. When KVM is enabled
> -         * it will override the changes we make here, therefore our
> -         * purposes are to make TCG consistent (with 64-bit KVM hosts)
> -         * and to improve SGI efficiency.
> -         */
> -        if (vms->gic_version == VIRT_GIC_VERSION_2) {
> -            clustersz = GIC_TARGETLIST_BITS;
> -        } else {
> -            clustersz = GICV3_TARGETLIST_BITS;
> -        }
> +    /*
> +     * Adjust MPIDR like 64-bit KVM hosts, which incorporate the
> +     * GIC's target-list limitations. 32-bit KVM hosts currently
> +     * always create clusters of 4 CPUs, but that is expected to
> +     * change when they gain support for gicv3. When KVM is enabled
> +     * it will override the changes we make here, therefore our
> +     * purposes are to make TCG consistent (with 64-bit KVM hosts)
> +     * and to improve SGI efficiency.

32-bit KVM hosts are dead a long time, so we could definitely trim
this comment to at least remove those sentences. We'd also have
to double check arm64 KVM to see if the comment is still accurate,
since the comment is so old. Or, we could just delete the comment.

Thanks,
drew

> +     */
> +    if (vms->gic_version == VIRT_GIC_VERSION_2) {
> +        clustersz = GIC_TARGETLIST_BITS;
> +    } else {
> +        clustersz = GICV3_TARGETLIST_BITS;
>      }
> +
>      return arm_build_mp_affinity(idx, clustersz);
>  }
>  
> -- 
> 2.47.1
> 
