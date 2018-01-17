Received: by 10.28.173.206 with SMTP id w197csp5109745wme;
        Wed, 17 Jan 2018 02:52:24 -0800 (PST)
X-Google-Smtp-Source: ACJfBourGo/BwJJ+mXUQsyBslEiyb5J7X6evR4OvGA72SGgdP04Dd2M3xLLO62lUjWk+yLK3x/5t
X-Received: by 10.37.115.11 with SMTP id o11mr23296044ybc.178.1516186343983;
        Wed, 17 Jan 2018 02:52:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516186343; cv=none;
        d=google.com; s=arc-20160816;
        b=IgihnOcUqts7B8nZ4FRgaTn3iC4EVnv3ULds6eK42T3ni6KvYkbJgUgntjrb6iwUKB
         pbrwhTt78otWGDH5Fc75NMKskT36z8sB5I33ZK6fwY0/9glXFmbYBS53RV5XV6ndZVMZ
         3hLJ4pc2PnWFbZNf0ImQsoIdWoaXrb0xHODUHQVlN9e5WNWW1IahLALb5+EzAOPQFLvD
         RqQEc5TUITspigNBY5daoufb9I3DhjmsOdPh/NHuQ5ce95ke66F+oYGKn/W0pmM6c4kY
         MCxHBUD6Ww0CzXVGDzWadcLCkdus+K0YGDwKgHBlJQok3OrZhMeF7smZteXzFnBl2xDb
         CQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=1a7usvUE8OIXgyKvINzg2H8gL9y0RhFmYOQ65q370cw=;
        b=KHcD0oNq+ud6Hg8g/R6TYG7BNnM+d+9GTmmKKxgWDLUy279zDQqirRokNRGzMD7xof
         8OPAvMOsHxCraomsd9wPDroqNK9Pl1aUk5Fr3b7WsvUEcRj/CW/BRgXifI1r+AFZbpg/
         EfwQbOlMP4zuvTcEPDpJ+gGREfmpE1XJ4ofQbYVVQ8gaVfmeJDteCg47ZMTpUbBi8QJL
         psxCaJ0ijPPqzI0zLVTbN5xHCvbTN2zESPuV37Kt2jv1ZpQUW2OczxFm0bGmGgNcHWR1
         TbzRcYFpHwO95CjKt+/wdkXO4c90QSGkgg0FVJfpzq6pInHcQsIPhAFVnPZAm2tCtrV/
         1bmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NaWYCiid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si1006211yba.672.2018.01.17.02.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2018 02:52:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NaWYCiid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eblKR-0003vE-F1
	for alex.bennee@linaro.org; Wed, 17 Jan 2018 05:52:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1eblKG-0003tb-Tg
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 05:52:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1eblKG-0002Fo-5S
	for qemu-arm@nongnu.org; Wed, 17 Jan 2018 05:52:12 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1eblKB-0002Cf-JN; Wed, 17 Jan 2018 05:52:07 -0500
Received: by mail-lf0-x242.google.com with SMTP id t139so6586581lff.0;
	Wed, 17 Jan 2018 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1a7usvUE8OIXgyKvINzg2H8gL9y0RhFmYOQ65q370cw=;
	b=NaWYCiidJKwof5j6d+iI2KH2ILOJ/26Q8Ku8+WavYGGjLejcBcPg535TIQZkOoDOD8
	h+cf7JgIronRGUs2ZhTy1Jh3SxV2UTtNMyy0RnoRSSqi6i8QmOAqf6hoIxFOBMC0n67m
	P/O0WCRSqWrehIyXLVlMC/jfa+JJ5Eu6tEHXewGZwjpWLJJCEl8CyS4YiV6ZqGF8vRSO
	xCRroeQ1sH2/75I+IQyihae6UTb/wG3xBvvVNNM5+37EY8y+QfA5YJ4GVbVABKTtw9QE
	aryCFPtoyvQfwI32cRZtPu/nhwdrCMQQOuqfFK/ma8L0baGTf2UFJdeyqVO53gITZthR
	T3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1a7usvUE8OIXgyKvINzg2H8gL9y0RhFmYOQ65q370cw=;
	b=scfqklted9q2qVL4EFYXO1Feb7Y177R8YU/MtZ9E7h8CUiBupa2DCLiELZsP5RMI/R
	Cm5uv2U94zehduLeTQmJUGaaW9I5vDPg4art3e2lnJ0+r41OtF5lKi1S0gxfWcIsAcFK
	6NxeHCgf0kBEECK3/20vazWRiOzvfzNPOJmuZBoiN+7/2f2MzhJY1irfQUIiJ/bmbysK
	pVkv8gdJPMIXyYnwbYVnKV/eYRibom55EnPEmhYxmIFHAFURzq1CDwL78k4p/6LJ0KYb
	CgV+mKjNbqJUlADC86R7K1+klTcOKPAbPmUpTH9naNXCE1uln6yfwNdMRKB8gbQOftWb
	trlw==
X-Gm-Message-State: AKwxytdeKSXFlDBfin9MIJ6fIcQJrbkoJ62DRfB8Gq3f0fTC0m3R6mk3
	EcIcNyWR9QolR5yE6AXTpK0=
X-Received: by 10.25.224.17 with SMTP id x17mr9293442lfg.91.1516186326163;
	Wed, 17 Jan 2018 02:52:06 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id 95sm760395lfv.2.2018.01.17.02.52.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 02:52:04 -0800 (PST)
Date: Wed, 17 Jan 2018 11:52:04 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Message-ID: <20180117105204.GA25971@toto>
References: <cover.1516144891.git.alistair.francis@xilinx.com>
	<d1049a00a3c00d8310584f7732492a2064a982ae.1516144891.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1049a00a3c00d8310584f7732492a2064a982ae.1516144891.git.alistair.francis@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-arm] [PATCH v5 1/9] microblaze: boot.c: Don't try to find
 NULL pointer
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
Cc: edgar.iglesias@xilinx.com, alistair23@gmail.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tzak3IQX6Tmw

On Tue, Jan 16, 2018 at 03:22:20PM -0800, Alistair Francis wrote:
> Previously if no device tree was passed to microblaze_load_kernel() then
> qemu_find_file() would try to find a NULL pointer. To avoid this put a
> check around qemu_find_file().
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
> 
>  hw/microblaze/boot.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index 457a08a2fe..35bfeda7aa 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -124,7 +124,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
>      /* default to pcbios dtb as passed by machine_init */
> -    if (!dtb_arg) {
> +    if (!dtb_arg && dtb_filename) {
>          filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
>      }
> 
> --
> 2.14.1
> 
> This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
