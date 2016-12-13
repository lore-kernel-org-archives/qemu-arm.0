Received: by 10.25.205.13 with SMTP id d13csp2177575lfg;
        Tue, 13 Dec 2016 04:45:50 -0800 (PST)
X-Received: by 10.55.114.2 with SMTP id n2mr80059958qkc.145.1481633150429;
        Tue, 13 Dec 2016 04:45:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id i24si28053573qkh.205.2016.12.13.04.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 04:45:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37912 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGmSp-0002Yx-Mr
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 07:45:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmSj-0002Xo-Bh
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cGmSe-0007om-Kj
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:45:41 -0500
Received: from mail-vk0-f45.google.com ([209.85.213.45]:33577)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cGmSe-0007oR-GW
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:45:36 -0500
Received: by mail-vk0-f45.google.com with SMTP id 137so59321684vkl.0
	for <qemu-arm@nongnu.org>; Tue, 13 Dec 2016 04:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DhN9r66jPCGVGEWD/7goFVL+UuOQBvnPaeD8vvk8NNQ=;
	b=Ql2VyJPRSeGpP12h9wHgbSaXVrbNGqanBwXzFbgUL5nTudiP5oqMltn2aXMLSP9Xru
	4xQpLFj2r1Qbflp0vTbbPeIUNw99fCevYq9BrazDkkLbyWpc1i2lM6k93HW2iYR2gV8L
	mFAUGPtzX83cHYKmBiQEFmjpwhq3qzuTsj6ns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DhN9r66jPCGVGEWD/7goFVL+UuOQBvnPaeD8vvk8NNQ=;
	b=QvRyH1peIGHEwlq0N2lHUDvHeksoxuWVCSjXaYUWQO6sBB6CgPCQquIflR8L58Yyx6
	r47Ws4fXSYAocIfN40ZKG/Y6gUd/DIRkUUGwkRPRJ4LB5zlRcQP2f50UEFeKi/TpslPQ
	43kzJ8NiBVJVFEZR+zVFEp7n7eVMfVgufltGe+/bHpIZtMhdKn8TMzD1AJ4QnCnRoyec
	cuUUP3Q2w28aRQmBWgvPV+99glfr2S1DdooAIvtC57Y/ywdAm/MpLjkCmsoT2cDfOQth
	6PfgPeL0Ed7ADL5rOzWRNwG81/RQzJSZOeiNnu8GmQezA+nopjUIWJt6QfUA0xJNQeWG
	rcFQ==
X-Gm-Message-State: AKaTC01nvjdAojBzyKMdC7Kjt7nNHCyfShfbcrLZ7TVoeEnYqztSvQEhJc5S2KE4DQaVytPM5j4O8pg6xSZCcnA8
X-Received: by 10.31.65.3 with SMTP id o3mr33684772vka.3.1481633075804; Tue,
	13 Dec 2016 04:44:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 13 Dec 2016 04:44:14 -0800 (PST)
In-Reply-To: <20161209143703.29457-1-drjones@redhat.com>
References: <20161209143703.29457-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Dec 2016 12:44:14 +0000
Message-ID: <CAFEAcA96=O+ui5PNtOEC_-p=nuj-HCuDv9smSC73FsaF0g-g8w@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.45
Subject: Re: [Qemu-arm] [PATCH] hw/intc/arm_gicv3_common: fix aff3 in typer
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3CM2NgJa3lEM

On 9 December 2016 at 14:37, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/intc/arm_gicv3_common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 0f8c4b86e023..0aa9b9ca6655 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -204,7 +204,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>          /* The CPU mp-affinity property is in MPIDR register format; squash
>           * the affinity bytes into 32 bits as the GICR_TYPER has them.
>           */
> -        cpu_affid = (cpu_affid & 0xFF00000000ULL >> 8) | (cpu_affid & 0xFFFFFF);
> +        cpu_affid = ((cpu_affid & 0xFF00000000ULL) >> 8) |
> +                     (cpu_affid & 0xFFFFFF);
>          s->cpu[i].gicr_typer = (cpu_affid << 32) |
>              (1 << 24) |
>              (i << 8) |

Oops :-)

Applied to target-arm.next for 2.9, thanks.

-- PMM
