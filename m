Received: by 10.25.77.65 with SMTP id a62csp118822lfb;
        Thu, 26 Jan 2017 01:43:44 -0800 (PST)
X-Received: by 10.237.35.84 with SMTP id i20mr1680234qtc.247.1485423823950;
        Thu, 26 Jan 2017 01:43:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11si736625qkt.85.2017.01.26.01.43.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 01:43:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWgaj-00021Z-6a
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 04:43:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWgab-0001zo-0H
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:43:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWgaX-0007Df-W5
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 04:43:33 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cWgaX-0007D8-QB; Thu, 26 Jan 2017 04:43:29 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D31ED3D95C;
	Thu, 26 Jan 2017 09:43:29 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0Q9hRxS022361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2017 04:43:28 -0500
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1485255993-6322-1-git-send-email-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <17aeed6e-77e8-4261-e697-28a26841ee60@redhat.com>
Date: Thu, 26 Jan 2017 10:43:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485255993-6322-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 26 Jan 2017 09:43:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm_gicv3: Fix broken logic in
 ELRSR calculation
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t+M3DXyFlGB5

On 24.01.2017 12:06, Peter Maydell wrote:
> Fix a broken expression in the calculation of ELRSR
> register bits: instead of "(lr & ICH_LR_EL2_HW) == 1"
> we want to check for != 0, because the HW bit is not
> bit 0 so a test for == 1 is always false.
> 
> Fixes: https://bugs.launchpad.net/bugs/1658506
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index a9ee7fd..c25ee03 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -2430,7 +2430,7 @@ static uint64_t ich_elrsr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          uint64_t lr = cs->ich_lr_el2[i];
>  
>          if ((lr & ICH_LR_EL2_STATE_MASK) == 0 &&
> -            ((lr & ICH_LR_EL2_HW) == 1 || (lr & ICH_LR_EL2_EOI) == 0)) {
> +            ((lr & ICH_LR_EL2_HW) != 0 || (lr & ICH_LR_EL2_EOI) == 0)) {
>              value |= (1 << i);
>          }
>      }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

