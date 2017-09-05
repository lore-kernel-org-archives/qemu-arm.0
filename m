Received: by 10.223.172.38 with SMTP id v35csp1357479wrc;
        Tue, 5 Sep 2017 05:28:56 -0700 (PDT)
X-Received: by 10.55.17.73 with SMTP id b70mr4912854qkh.270.1504614536685;
        Tue, 05 Sep 2017 05:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504614536; cv=none;
        d=google.com; s=arc-20160816;
        b=WRbsNsKzBNJR4qAqFJZvTCAFRadbv/PI3Demc5H7DSnjsgx6AuJMO1+Y9uZ+VmeA5o
         J3HbWwRyG3MbfyremxS8BnZLrdjTuQv+jGtFzt9AdYUcbsdxhgZXWZt6YI5680/RxD6Z
         WjquDZUjlb9+KASaGP0rMViNYjEZc0nsJgtf8HAg/aW8YPTIIJVh28SHUtmvsui62tHx
         Vryyv1wQnuLWPjZBs6+e5ms3LWWp+hSBrCHCl6NXZhOdKN0qR0/f2stFLCT/TLji+uus
         oSje9j34ab5z3ayZ7W5bvUyP9CfK/QcYpm3B1iRD5LZHW5ptbpYHPohU8JM3UQd9h5RC
         O6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=iCFiqilpgd9SOaebqJic1eUs196VDxeLEg/+i8wqcVk=;
        b=qgo0OzHcx4zed+hgYyJqSy8Id1PPxNN16ed4B+kHMNxVcot69798eQYHFCeaOAIa+3
         dD0dvbjHMdRYMr9mLKvc0NkHqV1ExMVGoygz7DnctAdSfYwRjBU/LqYIKZL0MYMhu+Iy
         bKjZFvlQpV1qEw8qjl2EKwr/Ed0A0vuYKuBSRlac0OMawLkxGUWiXZeX2Shbn3rqJUpk
         SQdTGOEKTztbjX7D9yO8xBaPJTzVMcXMllzv4zVeT400Iw/VpICtlw3M8qgvYgnZb7X4
         caIqGo9eCgDPP4GGb+UrkHpfD11hb8NT3pvA27yYdq3sj3TvvMIWTkvXSZ2lSIcVKFFH
         o+RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QFB4UxCu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q82si311800qki.107.2017.09.05.05.28.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 05:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QFB4UxCu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58653 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpCyM-00067A-G6
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 08:28:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpCyF-00066q-E7
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dpCyA-0005UQ-MF
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:28:47 -0400
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:36035)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dpCyA-0005TG-Fe
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 08:28:42 -0400
Received: by mail-wr0-x22d.google.com with SMTP id p14so6482673wrg.3
	for <qemu-arm@nongnu.org>; Tue, 05 Sep 2017 05:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iCFiqilpgd9SOaebqJic1eUs196VDxeLEg/+i8wqcVk=;
	b=QFB4UxCuh8cXwXdTEypiuzV9p7wQPKYy3ACTKUJO2OwWN86ovtycyZCL1KyVFKnDmL
	SYi4yopUGW6LFel1a+P0EpOL6YzxQwYTrae4UveHuY/HUJAtyGIR05gM8mr2gsutzW+S
	29R4KHzMKVxUFZa6YtFx1JwtSikyybY9AuMbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iCFiqilpgd9SOaebqJic1eUs196VDxeLEg/+i8wqcVk=;
	b=t/vSL2Je2RhwkWHyHYSRXgVEcl5LsDKij+lQitEUZREeTDvGXNkrqp6D3ppKJIpmsX
	4cX1mnxVmj7p2msVy/GLlQKKJLVHOUkfPt9koYrjHSqIFyaBjTfa3yiQ74LwFQkfcNfR
	gQu2Q0dGwA21NDAlFSHYNt3XKxdoFUDgwKzN2is9aU9Kmpc2EyASTC0VfK+JWllIULPb
	gYL/nJuoIZ66NLULT1t3D9ivsoogVwaPaAXnZ1a4pchVH1WmzFfAfN8+ZWW8ElZakC6c
	djgltPUnrR5OJehTKWqhKJcumEnFZkFAZtWMHXrqG3LYCymrNbDGdB3frgb4hZ0h/bxM
	3qvQ==
X-Gm-Message-State: AHPjjUjp/t9ZhGm2BaYVqeJ9+RGBPJVguNih5dSWwPWE+esKE51plNiq
	UzXqV2X6ojxy+F352VsiLjfx2w4L1DcH
X-Google-Smtp-Source: ADKCNb5ZCABSRgSvmwwk4OWPuJxBjTGljhsVefeGUUNboRgMQEO37yPUZREsb4b6i3nD6w9USCmtNuB/HuP2/DWO1CM=
X-Received: by 10.223.145.41 with SMTP id j38mr2162183wrj.314.1504614521390;
	Tue, 05 Sep 2017 05:28:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.159.68 with HTTP; Tue, 5 Sep 2017 05:28:20 -0700 (PDT)
In-Reply-To: <20170828221901.12827-1-portia.stephens@xilinx.com>
References: <20170828221901.12827-1-portia.stephens@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Sep 2017 13:28:20 +0100
Message-ID: <CAFEAcA-5tT6X=N7UOiYMecN-OnxOfDAfoGswa01QXCOt4JDWig@mail.gmail.com>
To: Portia Stephens <portia.stephens@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-arm] [PATCH] target/arm: Remove 5J architecture
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	stephensportia@gmail.com, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NDs/ldzNozW2

On 28 August 2017 at 23:19, Portia Stephens <portia.stephens@xilinx.com> wrote:
> This fixes the issue that any BXJ instruction will result in an illegal_op.
> This is because the 5J archiecture is always unsupported.
> 5J architecture doesn't have a feature set and ENABLE_ARCH_5J is hardcoded
> to 0, causing any ARCH(5J) to result in an illegal_op. The only use of
> ARCH(5J) is in the BXJ instruction disassembly.
>
> This patch replaces that ARCH(5J) with ARCH(6) and removes the 5J architecture,
> this isn't technically correct since the v5J ISA does support the BXJ
> instruction. This change means that running a BXJ instruction on any v5 will
> cause an illegal_op but it is better than the current state where any
> architecture running a BXJ would cause an illegal_op. The correct solution
> would be to create a feature set for v5J but that doesn't seem worth it as the
> v5J is so old.
>
> Signed-off-by: Portia Stephens <portia.stephens@xilinx.com>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  target/arm/translate.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index d1a5f56998..4a30c0d7e0 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -41,7 +41,6 @@
>  #define ENABLE_ARCH_5     arm_dc_feature(s, ARM_FEATURE_V5)
>  /* currently all emulated v5 cores are also v5TE, so don't bother */
>  #define ENABLE_ARCH_5TE   arm_dc_feature(s, ARM_FEATURE_V5)
> -#define ENABLE_ARCH_5J    0
>  #define ENABLE_ARCH_6     arm_dc_feature(s, ARM_FEATURE_V6)
>  #define ENABLE_ARCH_6K    arm_dc_feature(s, ARM_FEATURE_V6K)
>  #define ENABLE_ARCH_6T2   arm_dc_feature(s, ARM_FEATURE_THUMB2)
> @@ -8389,7 +8388,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>              break;
>          case 0x2:
>              if (op1 == 1) {
> -                ARCH(5J); /* bxj */
> +                /* This should actually be ARCH(5J) but there is currently no
> +                 * 5J architecture in QEMU.
> +                 */
> +                ARCH(6); /* bxj */
>                  /* Trivial implementation equivalent to bx.  */
>                  tmp = load_reg(s, rm);
>                  gen_bx(s, tmp);

Thanks for this patch. However we do have both v5-no-J
(arm946, all the pxa2xx cores) and v5-with-J CPUs (arm926, arm1026),
so I think it would be better to fix this bug by adding an
extra ARM_FEATURE_JAZELLE, which would be set in
arm_cpu_realizefn() if ARM_FEATURE_V6 is set, and set in
the per-core realize functions for arm926 and arm1026.
It should be a fairly small patch overall I think.

thanks
-- PMM
