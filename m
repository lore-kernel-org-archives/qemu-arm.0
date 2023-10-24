Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1877412ejb;
        Tue, 24 Oct 2023 00:37:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC2SVIXbEMOC8vlMgHlvZChuhr/ggEm0IgKqGIUOks3iOnTA4Wueyyds2cZkBRjl+bQJKb
X-Received: by 2002:a05:6214:e88:b0:66d:1219:f2ab with SMTP id hf8-20020a0562140e8800b0066d1219f2abmr12473164qvb.8.1698133046784;
        Tue, 24 Oct 2023 00:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698133046; cv=none;
        d=google.com; s=arc-20160816;
        b=mvIdoNcA0Eelr/TiRE1pB42obuwkk6j5Krb2AkIZnuqgNAKYykbHBoHz90l8SefHm+
         OhON5dopPPyoPdyv3lh0Ap6txvkaFemE/9kPewkaQaxUhASkIqSmG7JIhEOrR2wCi0Sh
         PfuXkIGjyLwJRmbDNL2OGRi2mLwH3H7pkp4cDD6Y+7/XbWWgirQISqtybmEH7c51kQmf
         quHWqHt4ORh2IynX3lehR/OCoAiNUvVMa428SNjLYSO7mGuageNvZ2xKyjPDPlitFe8o
         vUMzPfCg7uK5Y1/DuqI7lyVwuT+VH8+xHVrAZtyRlW4JwWk2EIb/JeQjrzEQXPyBb+hd
         GeYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=JR90RRRSka0kWAG3H6y0qxsM2lf9kPU/7/WzDn5F03w=;
        fh=JKTnjfgLebdI6Uppdd2zUuo3nA3KHnzgaaV6K84+8TY=;
        b=H/v74PanvVuQ5C9HJeQRUQ6NNgN6zzk8m+Gusx/FOPOm1/SYz6OdVSahmyKemR8a54
         AEp7ydYgZ24ku7n2jgH8pCFPgpoU+Pd+flZGwYbbBxlXmpDFcxk7wdGlSNCU3flh1xCP
         YvPiEiFOfXYJeJv1ZZ8EWjob6p3ne9OkXW4i3N8kTeeW1VQzDnE1HT5h+1zxegzW88Zc
         jlzIttIXuqw2CRoHmyFCMhnCo1RnxNtACHO88RBuwDK/AwBtHxHQWTAfARLdrJLaBvU5
         kcWlfyizGhFGOsa0h7MNdzljfmQJ77NEwOyAGFwyQBtd/z1K6ahhxM3OKM6lTTjrWpHi
         rKgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi17-20020a0562144a9100b00658900baafasi6986952qvb.609.2023.10.24.00.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 00:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvByd-0004dA-Cr; Tue, 24 Oct 2023 03:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1ohf=GG=kaod.org=clg@ozlabs.org>)
 id 1qvByb-0004cq-T7; Tue, 24 Oct 2023 03:37:21 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=1ohf=GG=kaod.org=clg@ozlabs.org>)
 id 1qvByZ-0007iA-8d; Tue, 24 Oct 2023 03:37:21 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SF3mW2Nx8z4x5k;
 Tue, 24 Oct 2023 18:37:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SF3mR6TKrz4x5h;
 Tue, 24 Oct 2023 18:37:11 +1100 (AEDT)
Message-ID: <ee85f3d0-7ec8-47d5-b157-60d103553502@kaod.org>
Date: Tue, 24 Oct 2023 09:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] hw/fsi: Added FSI documentation
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20231021211720.3571082-1-ninad@linux.ibm.com>
 <20231021211720.3571082-10-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231021211720.3571082-10-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=1ohf=GG=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: x6GLF/q6SmLU

On 10/21/23 23:17, Ninad Palsule wrote:
> Documentation for IBM FSI model.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v4:
>    - Added separate commit for documentation
> ---
>   docs/specs/fsi.rst | 141 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 141 insertions(+)
>   create mode 100644 docs/specs/fsi.rst


Documentation build is broken.

a 'fsi" entry should be added in docs/specs/index.rst. More below.



> diff --git a/docs/specs/fsi.rst b/docs/specs/fsi.rst
> new file mode 100644
> index 0000000000..73b082afe1
> --- /dev/null
> +++ b/docs/specs/fsi.rst
> @@ -0,0 +1,141 @@
> +======================================
> +IBM's Flexible Service Interface (FSI)
> +======================================
> +
> +The QEMU FSI emulation implements hardware interfaces between ASPEED SOC, FSI
> +master/slave and the end engine.
> +
> +FSI is a point-to-point two wire interface which is capable of supporting
> +distances of up to 4 meters. FSI interfaces have been used successfully for
> +many years in IBM servers to attach IBM Flexible Support Processors(FSP) to
> +CPUs and IBM ASICs.
> +
> +FSI allows a service processor access to the internal buses of a host POWER
> +processor to perform configuration or debugging. FSI has long existed in POWER
> +processes and so comes with some baggage, including how it has been integrated
> +into the ASPEED SoC.
> +
> +Working backwards from the POWER processor, the fundamental pieces of interest
> +for the implementation are:
> +
> +1. The Common FRU Access Macro (CFAM), an address space containing various
> +   "engines" that drive accesses on buses internal and external to the POWER
> +   chip. Examples include the SBEFIFO and I2C masters. The engines hang off of
> +   an internal Local Bus (LBUS) which is described by the CFAM configuration
> +   block.
> +
> +2. The FSI slave: The slave is the terminal point of the FSI bus for FSI
> +   symbols addressed to it. Slaves can be cascaded off of one another. The
> +   slave's configuration registers appear in address space of the CFAM to
> +   which it is attached.
> +
> +3. The FSI master: A controller in the platform service processor (e.g. BMC)
> +   driving CFAM engine accesses into the POWER chip. At the hardware level
> +   FSI is a bit-based protocol supporting synchronous and DMA-driven accesses
> +   of engines in a CFAM.
> +
> +4. The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in POWER
> +   processors. This now makes an appearance in the ASPEED SoC due to tight
> +   integration of the FSI master IP with the OPB, mainly the existence of an
> +   MMIO-mapping of the CFAM address straight onto a sub-region of the OPB
> +   address space.
> +
> +5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in the
> +   AST2600. Hardware limitations prevent the OPB from being directly mapped
> +   into APB, so all accesses are indirect through the bridge.
> +
> +The LBUS is modelled to maintain the qdev bus hierarchy and to take advantages
> +of the object model to automatically generate the CFAM configuration block.
> +The configuration block presents engines in the order they are attached to the
> +CFAM's LBUS. Engine implementations should subclass the LBusDevice and set the
> +'config' member of LBusDeviceClass to match the engine's type.
> +
> +CFAM designs offer a lot of flexibility, for instance it is possible for a
> +CFAM to be simultaneously driven from multiple FSI links. The modeling is not
> +so complete; it's assumed that each CFAM is attached to a single FSI slave (as
> +a consequence the CFAM subclasses the FSI slave).
> +
> +As for FSI, its symbols and wire-protocol are not modelled at all. This is not
> +necessary to get FSI off the ground thanks to the mapping of the CFAM address
> +space onto the OPB address space - the models follow this directly and map the
> +CFAM memory region into the OPB's memory region.
> +
> +QEMU files related to FSI interface:
> + - ``hw/fsi/aspeed-apb2opb.c``
> + - ``include/hw/fsi/aspeed-apb2opb.h``
> + - ``hw/fsi/opb.c``
> + - ``include/hw/fsi/opb.h``
> + - ``hw/fsi/fsi.c``
> + - ``include/hw/fsi/fsi.h``
> + - ``hw/fsi/fsi-master.c``
> + - ``include/hw/fsi/fsi-master.h``
> + - ``hw/fsi/fsi-slave.c``
> + - ``include/hw/fsi/fsi-slave.h``
> + - ``hw/fsi/cfam.c``
> + - ``include/hw/fsi/cfam.h``
> + - ``hw/fsi/engine-scratchpad.c``
> + - ``include/hw/fsi/engine-scratchpad.h``
> + - ``include/hw/fsi/lbus.h``
> +
> +The following commands start the rainier machine with built-in FSI model.
> +There are no model specific arguments.
> +
> +.. code-block:: console
> +
> +  qemu-system-arm -M rainier-bmc -nographic \
> +  -kernel fitImage-linux.bin \
> +  -dtb aspeed-bmc-ibm-rainier.dtb \
> +  -initrd obmc-phosphor-initramfs.rootfs.cpio.xz \
> +  -drive file=obmc-phosphor-image.rootfs.wic.qcow2,if=sd,index=2 \
> +  -append "rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a"
> +
> +The implementation appears as following in the qemu device tree:
> +
> +.. code-block:: console
> +
> +  (qemu) info qtree
> +  bus: main-system-bus
> +    type System
> +    ...
> +    dev: aspeed.apb2opb, id ""
> +      gpio-out "sysbus-irq" 1
> +      mmio 000000001e79b000/0000000000001000
> +      bus: opb.1
> +        type opb
> +        dev: fsi.master, id ""
> +          bus: fsi.bus.1
> +            type fsi.bus
> +            dev: cfam.config, id ""
> +            dev: cfam, id ""
> +              bus: lbus.1
> +                type lbus
> +                dev: scratchpad, id ""
> +                  address = 0 (0x0)
> +      bus: opb.0
> +        type opb
> +        dev: fsi.master, id ""
> +          bus: fsi.bus.0
> +            type fsi.bus
> +            dev: cfam.config, id ""
> +            dev: cfam, id ""
> +              bus: lbus.0
> +                type lbus
> +                dev: scratchpad, id ""
> +                  address = 0 (0x0)
> +
> +pdbg is a simple application to allow debugging of the host POWER processors
> +from the BMC. (see the `pdbg source repository` for more details)

+ from the BMC. (see the  ``pdbg source repository`` for more details)

Please check before sending.

Thanks,

C.


> +
> +.. code-block:: console
> +
> +  root@p10bmc:~# pdbg -a getcfam 0x0
> +  p0: 0x0 = 0xc0022d15
> +
> +Refer following documents for more details.
> +
> +.. _FSI specification:
> +   https://openpowerfoundation.org/specifications/fsi/
> +   https://wiki.raptorcs.com/w/images/9/97/OpenFSI-spec-20161212.pdf
> +
> +.. _pdbg source repository:
> +   https://github.com/open-power/pdbg

