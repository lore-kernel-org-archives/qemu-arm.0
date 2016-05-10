Received: by 10.25.208.137 with SMTP id h131csp2004107lfg;
        Tue, 10 May 2016 03:33:30 -0700 (PDT)
X-Received: by 10.55.145.6 with SMTP id t6mr41559476qkd.206.1462876410133;
        Tue, 10 May 2016 03:33:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q78si925752qhb.82.2016.05.10.03.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 May 2016 03:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b04yn-0001cY-Lf
	for alex.bennee@linaro.org; Tue, 10 May 2016 06:33:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1b04yh-0001Sh-JX
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1b04yX-0008KD-P7
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:33:22 -0400
Received: from mail-lf0-x230.google.com ([2a00:1450:4010:c07::230]:34118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sergey.fedorov@linaro.org>) id 1b04yX-0008Jz-Hq
	for qemu-arm@nongnu.org; Tue, 10 May 2016 06:33:13 -0400
Received: by mail-lf0-x230.google.com with SMTP id m64so9681849lfd.1
	for <qemu-arm@nongnu.org>; Tue, 10 May 2016 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Db2Hyy3ak7BmQ3w3bu71FJB4wSAZk3/H+Il0zbiqEDk=;
	b=FPI8T3MOhmtrb/eKpAN8Mo4TB7LOczDmYyprd7isAlVBH8nf7LIVBHUNWv7kVIIjpg
	itKd+dwtucGSBaWj1a96k3PM8LLIX/xdDtzhLyTQpDiYPbjSr7/MarCcEIVmq1qZ7udv
	So2trgFcSfO0EIKlCmmWzwzGx/4sh/op7Mcko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Db2Hyy3ak7BmQ3w3bu71FJB4wSAZk3/H+Il0zbiqEDk=;
	b=VXzv404IPIq6j+oVqezgIMyWn/QxMGQ4Ek2atIXAHzSIC7g7NwPMsIMMChusp6nzBz
	mA0sVxBZ60qYz/kXRhaOK0+ZTilw9KG9MIhq9wPeBeVkSPSyY7NL/xFQNGeglsuPhRpP
	xomMaP2jLWbqbHkp+kcCKOPOKspSX/vnK8V9G6pYae9K7mF4OEDzwa+YUN5ThmgiQDEn
	rcfVS4u2ZHzKLi1rt6K6uJm268Lj0LlwP9xDTLO33F7xQsd9rs5roQkpG5Brd9W8n4LC
	VaDOozT4hx7OBXmQclpfflW2H2jI9Uc1GnhUddBM3YSlSfc+pNr1S+3lGkhdr49S484+
	jgkg==
X-Gm-Message-State: AOPr4FUJ5gsUvU4Hy4MhT8ckSfi1T04hLdMyUZq1aNpKT7mKRytxVFO6jAoIdIeXfyqmwuG0
X-Received: by 10.25.212.6 with SMTP id l6mr16909288lfg.163.1462876392389;
	Tue, 10 May 2016 03:33:12 -0700 (PDT)
Received: from [192.168.1.35] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id uc8sm263665lbb.30.2016.05.10.03.33.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 03:33:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1462875073-7127-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <sergey.fedorov@linaro.org>
Message-ID: <5731B8E5.1080608@linaro.org>
Date: Tue, 10 May 2016 13:33:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462875073-7127-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::230
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: Avoid unnecessary TLB flush
 on TCR_EL2, TCR_EL3 writes
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GpuVKJCXtlsZ

On 10/05/16 13:11, Peter Maydell wrote:
> The TCR_EL2 and TCR_EL3 regdefs wer incorrectly using the

s/wer/were/

otherwise:

Reviewed-by: Sergey Fedorov <sergey.fedorov@linaro.org>

Kind regards,
Sergey

> vmsa_tcr_el1_write function for writes. Since these registers don't
> have the A1 bit that TCR_EL1 does, we don't need to do a tlb_flush()
> when they are written. Remove the unnecessary .writefn and also the
> harmless but unneeded .raw_writefn and .resetfn definitions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2 changes: extend to TCR_EL3 as suggested by Sergey.
>
>  target-arm/helper.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 09638b2..cbb9d92 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3559,8 +3559,10 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>        .resetvalue = 0 },
>      { .name = "TCR_EL2", .state = ARM_CP_STATE_BOTH,
>        .opc0 = 3, .opc1 = 4, .crn = 2, .crm = 0, .opc2 = 2,
> -      .access = PL2_RW, .writefn = vmsa_tcr_el1_write,
> -      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
> +      .access = PL2_RW,
> +      /* no .writefn needed as this can't cause an ASID change;
> +       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       */
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[2]) },
>      { .name = "VTCR", .state = ARM_CP_STATE_AA32,
>        .cp = 15, .opc1 = 4, .crn = 2, .crm = 1, .opc2 = 2,
> @@ -3753,8 +3755,10 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[3]) },
>      { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
> -      .access = PL3_RW, .writefn = vmsa_tcr_el1_write,
> -      .resetfn = vmsa_ttbcr_reset, .raw_writefn = raw_write,
> +      .access = PL3_RW,
> +      /* no .writefn needed as this can't cause an ASID change;
> +       * no .raw_writefn or .resetfn needed as we never use mask/base_mask
> +       */
>        .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
>      { .name = "ELR_EL3", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS,

