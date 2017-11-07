Received: by 10.223.133.150 with SMTP id 22csp3511881wrt;
        Tue, 7 Nov 2017 04:57:54 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QG1iKLrH8J2Wc4Et7eFohKMWDNcUV2XodjAJ1BkK4Owh23Wh+Ux0vqAiVdUFF9vN2jHZsj
X-Received: by 10.37.97.199 with SMTP id v190mr38328ybb.106.1510059473949;
        Tue, 07 Nov 2017 04:57:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510059473; cv=none;
        d=google.com; s=arc-20160816;
        b=ID//FYaPuNodM+qkziAHOpIrXZr59scBehXi9ODrF7EErYf9eV5ZyWPEw6aGYsks+E
         1neKaBRX+aNmOzch9cTEsud+cfGHulTxTkd7t5pdPDRMCbfGDBehGetGrG5/XmW34SQL
         0mcXu6uraJXq+K3x+pIB+7F/S1YIjIyOlEpfXzRYv88Za8lnOcc4OUmGdtGTUJ+JlZuJ
         HHL5qLxCZo6K4pnfxoLTSb13SoJoJcaFuKhlXg3sVpqP/mqO1bynYSuUhdhe0DEWNQZX
         sAtw+Py73xo9EDbUBlqUtj+1reeMrAMPf8D//QexWmrpxMMHtehCYfi30rPQRHzhtZo8
         RZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=KQi9+Pss/urwP4WNyZHW8jt81uESTNHkRcOuqZMhjKM=;
        b=jgd36axCXsv/O+/HgAKTLnkT8NKTvUlv+qM1Ln4GV8400fHoYJTeywyN+C85XxPSm2
         nRD/G38zMyjJ3+9QmNatXnj7+j47HHVTO5a5V6vcRTueGC/w7JViYezSLZp+4FQIiSR0
         XfEGd/7/hX3FmMBHei5UL7FP396GjVgjLJxAulBuIou/fIffTU9OBjLtyzVTWO3Qira2
         p8V3xCXTphmeWbABpkh4Mx+Itxx8tw55boafRf9vjrie8jKCliB9ItdkBkzycFOcH7yv
         Vr66QLt21l5dvBSPijcn5t+/5Hqiii0dSd2Cwx4hYImxA1yKjlCe1TqUeFH91mk+IdqS
         1Elw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iKftxSFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1si238262ybi.823.2017.11.07.04.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Nov 2017 04:57:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iKftxSFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eC3Rx-0005HB-CH
	for alex.bennee@linaro.org; Tue, 07 Nov 2017 07:57:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eC3Rl-0005GX-Oo
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 07:57:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eC3Rk-0004qq-UW
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 07:57:41 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:52702)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eC3Rk-0004qH-Oc
	for qemu-arm@nongnu.org; Tue, 07 Nov 2017 07:57:40 -0500
Received: by mail-wm0-x241.google.com with SMTP id t139so3692084wmt.1
	for <qemu-arm@nongnu.org>; Tue, 07 Nov 2017 04:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KQi9+Pss/urwP4WNyZHW8jt81uESTNHkRcOuqZMhjKM=;
	b=iKftxSFl6yi1I68YeXCfOxUmXeSpWaO74nvqRpoXd+ItS4te974nmY089eIduQCP85
	SC6MTLsLNTm1R3LuZeYEeiE2rjbr/JWvDipXGymDkkrlZtrgnpkttq/WT9l7FLUfWJMo
	FFGuraIyFMp5ht8kOffxsWywhoBa4zBcvo3MM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KQi9+Pss/urwP4WNyZHW8jt81uESTNHkRcOuqZMhjKM=;
	b=MoQZh9M46N/wW+h9yfE3cZH6JFiJAEEpTXVWRM4YL23NA1HK+k9cHmhHacWdEffYck
	eANS9a1Tiaq36HATXTPSbfpuZvZwSWrackepQz/EyufVpxwxkI7d4mKHNHtpjX/vJ1bE
	VLbW6F+uTBLFQE7DyLs1i7MG5TEIDhTWXk9JHpcbIFp0M9p2f7SOEtv85f42qw2FLLFz
	Kp4qKqsQHTUqZMUiLHZ8rk0QPpQhSrEicyvEOadlM70hCeKDdtGZ4hX0GDVP/HyoHrXa
	WBTM2rw/miu9YK7jzMkuSZtYNribWY81yzpEiyVRTjbq4v5W7Hu+RIel29ElE6h7t7XE
	fn9A==
X-Gm-Message-State: AJaThX4QTmqykQ9gVji/TFMRPQ9vVYe984G8CxGXQfxl/SGAkwWA6Upd
	/1Fl1v9HTeAElZu2mucrFO8YOEmYoyzJK1Sd57dyVg==
X-Received: by 10.28.46.136 with SMTP id u130mr1220357wmu.127.1510059459572;
	Tue, 07 Nov 2017 04:57:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 7 Nov 2017 04:57:19 -0800 (PST)
In-Reply-To: <alpine.DEB.2.10.1711061412330.30448@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1711061412330.30448@sstabellini-ThinkPad-X260>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Nov 2017 12:57:19 +0000
Message-ID: <CAFEAcA9txp80bxgV5dYCPx7xoxqgutpbLyZ7PDkkL_OfVjSxYA@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH v2] aarch64: advertise the GIC system
 register interface
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
Cc: julien.grall@arm.com, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +F5eEcXUBoUg

On 6 November 2017 at 22:16, Stefano Stabellini <sstabellini@kernel.org> wrote:
> When QEMU emulates a GICv3, it needs to advertise the presence of the
> system register interface, which is done via id_aa64pfr0.
>
> To do that, and at the same time to avoid advertising the presence of
> the system register interface when it is actually not available, set a
> boolean property in machvirt_init. Check on the boolean property from
> register_cp_regs_for_features and set id_aa64pfr0 accordingly.
>
> Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9e18b41..369d36b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1401,6 +1401,9 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_link(cpuobj, OBJECT(secure_sysmem),
>                                       "secure-memory", &error_abort);
>          }
> +        if (vms->gic_version == 3) {
> +            object_property_set_bool(cpuobj, true, "gicv3-sysregs", NULL);
> +        }
>
>          object_property_set_bool(cpuobj, true, "realized", NULL);
>          object_unref(cpuobj);

I thought about this on the cycle into work this morning, and I
think that rather than require every board that uses gicv3
to set a property on the CPU, we should change the definition
of the id_aa64pfr0 register so that rather than being ARM_CP_CONST
it has a readfn, and then at runtime we can get that readfn to
add in the right bit if env->gicv3state is non-null.

I'll put together a patch this afternoon.

thanks
-- PMM
