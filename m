Received: by 10.25.27.66 with SMTP id b63csp401463lfb;
        Thu, 9 Jun 2016 09:11:56 -0700 (PDT)
X-Received: by 10.55.117.71 with SMTP id q68mr11068957qkc.192.1465488716364;
        Thu, 09 Jun 2016 09:11:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 75si3790939qgo.49.2016.06.09.09.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 09:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB2Yl-00065b-MV
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 12:11:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bB2Wy-0004uh-Pc
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 12:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bB2Ws-00083L-8N
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 12:10:03 -0400
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f]:33717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1bB2Wr-000830-CL
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 12:09:58 -0400
Received: by mail-lf0-x22f.google.com with SMTP id f6so8609157lfg.0
	for <qemu-devel@nongnu.org>; Thu, 09 Jun 2016 09:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=2fI9Nz8PfUGbZ1Re/pPg9IebwJtPY3M6Gk+GYFCbmBo=;
	b=ZoO1q8flq62paz6kHCC/c3oMzFakJQc6dMrm4Vl9W/sBfKTrq7ODY0hHdKYtpK/4hn
	oo2MuqAAf5ROY8nALZc/bdZMUG58NvyW3pS4kt1wxJmEBV1xuwREqIoLQKv8nzv/Pt9S
	Bakc1N6z3vuDoVfu9qWoYl7QrKPfR9dccs5cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2fI9Nz8PfUGbZ1Re/pPg9IebwJtPY3M6Gk+GYFCbmBo=;
	b=HYE3KKqz/sHdm84dkK4uW3Grt+oPjDq/jbGDGTLCqbFN2/U8YSP2HEgZgpT/dqQDTf
	CVGkl7IZPS8DmVELPDxGHGvXFRmKeJ52ZpvyqcifEQRz+SPvisyPoqMpwBgQ1vyWs9OQ
	T/dH+y+Oz7xK2mq10w687a6wQClKyK5Ja8vGa2AYPPJ17C11ntL8f3uZKcf3R3Ivdmuy
	w/qeXXVlzDYh1iZC0ewq8hfm8Xc0UELtoI49UA7G4vUofmPwC2Ccslkv5dox53jcYOaM
	G6ssNfSnxYcOWj//A7Y44KAWW/eeqLaENsZIQEEdbAWJ8nXiMprlg+aRN2wPNQ5+o39W
	LCfw==
X-Gm-Message-State: ALyK8tIzPTQE+45jHNXsCQxVYbb1abuOunJvwGII6QN4tWEV0kZllJ8IPC1Vc6hzUqnuJ1IA
X-Received: by 10.46.33.77 with SMTP id h74mr3148667ljh.50.1465488596274;
	Thu, 09 Jun 2016 09:09:56 -0700 (PDT)
Received: from [192.168.1.41] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id 80sm682257lfv.20.2016.06.09.09.09.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Jun 2016 09:09:55 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1465488181-31977-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <575994D2.3010107@linaro.org>
Date: Thu, 9 Jun 2016 19:09:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465488181-31977-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22f
Subject: Re: [Qemu-devel] [PATCH] target-arm: Fix reset and migration of
 TTBCR(S)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Pranith Kumar <bobby.prani+qemu@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lra5Zfd+9dWJ

On 09/06/16 19:03, Peter Maydell wrote:
> Commit 6459b94c26dd666badb3 broke reset and migration of the AArch32
> TTBCR(S) register if the guest used non-LPAE page tables. This is
> because the AArch32 TTBCR register definition is marked as ARM_CP_ALIAS,
> meaning that the AArch64 variant has to handle migration and reset.
> Although AArch64 TCR_EL3 doesn't need to care about the mask and
> base_mask fields, AArch32 may do so, and so we must use the special
> TTBCR reset and raw write functions to ensure they are set correctly.
>
> This doesn't affect TCR_EL2, because the AArch32 equivalent of that
> is HTCR, which never uses the non-LPAE page table variant.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Pranith Kumar <bobby.prani+qemu@gmail.com>

Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.org>

> ---
>  target-arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 862e780..c9730d6 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3765,8 +3765,11 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
>        .access = PL3_RW,
>        /* no .writefn needed as this can't cause an ASID change;
> -       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       * we must provide a .raw_writefn and .resetfn because we handle
> +       * reset and migration for the AArch32 TTBCR(S), which might be
> +       * using mask and base_mask.
>         */
> +      .resetfn = vmsa_ttbcr_reset, .raw_writefn = vmsa_ttbcr_raw_write,
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
>      { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS,

