Received: by 10.223.172.38 with SMTP id v35csp5892211wrc;
        Mon, 11 Sep 2017 11:06:14 -0700 (PDT)
X-Received: by 10.55.58.9 with SMTP id h9mr16354265qka.352.1505153174840;
        Mon, 11 Sep 2017 11:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505153174; cv=none;
        d=google.com; s=arc-20160816;
        b=oPd+Ec+7TGS0YyBv1CbsKFQFnLEtCWP3kQM8eXJ4na2hyIZd6C3PCPmRGuhmCZLuG5
         +t1iVvwfq5BVK4j9uPXSV2JiLbVnBy3uJpbbdiPm49opGa9UYxmsU/Xl2GX+vVxGj54g
         OMO3fMd7wPMJZuX1dDhz3N5zOOsLMZxr7Prnx3j/r12sh6g2xp5dR290ToWvOQv7nIzq
         G6j8eb7vK0Clipky2Hblo3w8GQbAekS8+8d5kXxEE0en+vO1lfPofPg0fZ3tLhkPSxg0
         mxZcajYg4RUQKBkwfBDMoUMko1GGWxpSMn53PuoQqTtdoPB5Xxqltw7fTc8an4cBbQM2
         z9/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xKep9hley5TbaguaVWtO6Ye5Fd2dKcw7HBX33mwMYKA=;
        b=FI3/KZYlqqu85Q28G28gsx39xXnXkXDXFKm584VXkTWzlPk/xlA48OQV1Ws8SDfV0F
         QBwLl3raSUbYvK5W69FGuURRCm6soBVaKLvR+y0t/AN/cQTL7ZizD26J6P4+NJ0S1CyL
         WhvMngUfzVPgW52GyFAVEsj37621bCNpKS84v7JSV12fceNk0M4EWSNcmzjerdT0Ivbp
         m5oafElkjaResActXVzcdDvozJxgxtEVvIBJkVi7hpiNkOrJUiVkXECJaWfTeqXLT7vi
         4Oi7UwzK/8Fkw81Wh3PBD4H3u/kk8oi9Ix3v8Q41Z8kJMu5rgZyx0pX9tfPQVG3Pn4/3
         ob5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NF+pOrKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x193si9671932qka.489.2017.09.11.11.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 11:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NF+pOrKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drT64-0007Mt-GU
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 14:06:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSfi-00077G-34
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:38:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1drSfh-0002pG-51
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 13:38:58 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:35073)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1drSfg-0002om-W3; Mon, 11 Sep 2017 13:38:57 -0400
Received: by mail-wm0-x243.google.com with SMTP id e64so7459267wmi.2;
	Mon, 11 Sep 2017 10:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xKep9hley5TbaguaVWtO6Ye5Fd2dKcw7HBX33mwMYKA=;
	b=NF+pOrKZ5dy2FABmfvZusntiexit9QjA1HUelll/Vam42xT7Clx/yrlqFaIFE26Hlh
	XIutQTgVoojvlOSmsnlqnYrQ4/odhJ6qbrOWiwTCJ4KLs9WBQ/Xdb7+EeWwhXtXI1uZQ
	Sw4fDfE9J1E5W+56GXkOCGF3HSqk/I25h7EzOMxKHaz/hjD7e9LRpxLQO3XnZbC2gj/5
	RSjzUFjp0pJCRGJAEOnip7KjpQNxlnjD7lhSKBx9bs82MUdcGKOoVPlh4POQIwFlF/R+
	wYojZDTNnSUCXs3ofiGzpRWiZAWmo/wQfJ0DBweh3tLTPPezeTYk4GJ+ofln9rWMPXQi
	7JPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xKep9hley5TbaguaVWtO6Ye5Fd2dKcw7HBX33mwMYKA=;
	b=WRQVaLpHbu/Mq3Fp8ORj+TEM4wUFOCaqJ9flOOkebRaUK/hwEQiPYvtiCV7heZHhba
	kmDxQQYV7xOJppcj7NYRgdJdrgy9s4h73RCBsZcAdP5bp5fB7vMGTg/XrRzsVetq7iYd
	yL4e/0zCIVe39MkPxxISF4akjgQaeP+q9rzWucKiT6ftoWd0daWKB36Rl86ZNLJTolYI
	CkssiTEd0u+2+DL5NLxC5+7/QfrG+lj6V5TZuYlx1uoLRpKUuDGPhU/XGghRi4YnJBgy
	Gvbt+DNnv/5+xPT+wb1y2a9rd5jWR7MFjqun6dpMI/3ZUimV1Bwr6EK+6V+9B7wkroTn
	kLuQ==
X-Gm-Message-State: AHPjjUjo6vUqRjfbyvnhv46miAfNe3aRNoiqVEypPiyRbXzHLRz1j+9l
	Ex23lqguH8T/CmzKNFPs+2yj6fKQvnxQMLM1rqA=
X-Google-Smtp-Source: AOwi7QBttE7vWL8ZDhEBkce3gBPSgLv+IYBybAysj57bJzwAUVjap/GMG9YXob644Byc1AZwOgacgjACAcCSfEaOUVk=
X-Received: by 10.28.135.209 with SMTP id j200mr1409240wmd.40.1505151535922;
	Mon, 11 Sep 2017 10:38:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 11 Sep 2017 10:38:25 -0700 (PDT)
In-Reply-To: <1505137930-13255-4-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
	<1505137930-13255-4-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Sep 2017 10:38:25 -0700
Message-ID: <CAKmqyKOF=ahCoBV0sw_J5j7PonwgZg0v_0cSBv=MOoBTZ9b-VA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/7] target/arm: Get PRECISERR
 and IBUSERR the right way round
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHoJLWATeDtQ

On Mon, Sep 11, 2017 at 6:52 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> For a bus fault, the M profile BFSR bit PRECISERR means a bus
> fault on a data access, and IBUSERR means a bus fault on an
> instruction access. We had these the wrong way around; fix this.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

> ---
>  target/arm/helper.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 668e367..1741e0d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6430,15 +6430,15 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
>          case 0x8: /* External Abort */
>              switch (cs->exception_index) {
>              case EXCP_PREFETCH_ABORT:
> -                env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_PRECISERR_MASK;
> -                qemu_log_mask(CPU_LOG_INT, "...with CFSR.PRECISERR\n");
> +                env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_IBUSERR_MASK;
> +                qemu_log_mask(CPU_LOG_INT, "...with CFSR.IBUSERR\n");
>                  break;
>              case EXCP_DATA_ABORT:
>                  env->v7m.cfsr[M_REG_NS] |=
> -                    (R_V7M_CFSR_IBUSERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
> +                    (R_V7M_CFSR_PRECISERR_MASK | R_V7M_CFSR_BFARVALID_MASK);
>                  env->v7m.bfar = env->exception.vaddress;
>                  qemu_log_mask(CPU_LOG_INT,
> -                              "...with CFSR.IBUSERR and BFAR 0x%x\n",
> +                              "...with .PRECISERR and BFAR 0x%x\n",
>                                env->v7m.bfar);
>                  break;
>              }
> --
> 2.7.4
>
>
