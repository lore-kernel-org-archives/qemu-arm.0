Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2710035wro;
        Mon, 5 Nov 2018 07:23:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5d/LV9xnDzdT7clG3cw6LBuo1319K9Hsvz2osxV4Fw7g3Bg9oxm6RJC1sjRPHgSFken8Rs/
X-Received: by 2002:a37:d2c2:: with SMTP id f185-v6mr20782191qkj.30.1541431433729;
        Mon, 05 Nov 2018 07:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541431433; cv=none;
        d=google.com; s=arc-20160816;
        b=fwteP9dWzy7UwaWJ8Y8qDIVWznFHwodd+bL0O+6VsxhN1RcC3eT1lQh+7vvu+iEXAs
         Jmkm9WW8zTnA4PSEOf2bxUTdxUXVPR84ikVUSBQ2HAYcbXNkY8apoCFXchA5Oe7eBBm4
         jX62nCJAEUI7ckgiUYeQPKVsehe7yTK++x5pVcC9VYLseTsf2X00uHeqxhy3OBEJ+FPc
         Vqa+ry6ddFJ6mFL8X90yoWQNug6wUUFj8Z6rW8ap7kGoElE6fdOeRGnArk2zr1twkkGl
         AynRXWRMIPVqRboElbCBzAMmIBUnzzvDnXXvn6bCFZZGEE2g2DU5ZICqHizVkwGrL8N8
         Rnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=bH4BLTgaCXefXlO6QruZORVRfV8Hz/AVVJ0mr/9JkIE=;
        b=x50pWdBOagUMqLT+xo8VNQptRvLCSg5CifYbOq+6fl/D0PoX8D2vMSXBmlCgEMk/GT
         EuafrcBlmYN5jPg02JHwS5bJ+yDPY75ctxeutZ03UCwN7DnBM06gBoz1pWd9oM9JMFSy
         C3Ab09HcnTCNPhTSM/flLReqX3IGl8fYVg+npPWuS0YuFuE+oxo19v21GyaSibdojYxY
         +uyWXbzSLLEVYd39tDZDRw/8o3eYLBQzs459BwOa36+4nOWiURSnfKyH8wSvZe4I5Zlm
         8kwVwYGsFrjwfsEae/sU5S6+uNWnkNc4okGUn6/FAu9JIS0uMnN6P6AH9KFWycEKfn3Z
         +1dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWHu2FuT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w11si564124qvf.141.2018.11.05.07.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 07:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=jWHu2FuT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJgjJ-0007Or-87
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 10:23:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gJgjA-0007OU-F2
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gJgj0-0002rA-AE
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 10:23:38 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:40355)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gJgiv-0001jI-6P; Mon, 05 Nov 2018 10:23:31 -0500
Received: by mail-lf1-x144.google.com with SMTP id v5so1429074lfe.7;
	Mon, 05 Nov 2018 07:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bH4BLTgaCXefXlO6QruZORVRfV8Hz/AVVJ0mr/9JkIE=;
	b=jWHu2FuTu0Nsk/+yHpdx3y2Fe0CFF0yXK5cfCnLmFLX511TSm2BqmcErfafbDgLbXb
	o+fk4dmXyWJcS6gT5oTNiLTFpzmZz7cW8x8QUwxiudOtDeZzb492bV7nxX7ewW+Kx9O7
	QmJNQfgZJ/gS5foFtKA1CFy5AuBDDndyQ1J8KDejQZnpSQpofGAvced8WOMqz+uo8tjQ
	muCtDNEIvAbntLD7c+IBDSksm6X2IQ4vLxWrJBkuw4cckazzroo89NDYwNuRR4YZ6hg3
	ezBRjp4hfcPGL46R7aY5wzU9fJiZzy2meRrOkYi30DsllTdJvfhJMvnhdtflviQszhkT
	n4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bH4BLTgaCXefXlO6QruZORVRfV8Hz/AVVJ0mr/9JkIE=;
	b=BU08POJJVJSHE0mABFzfn88W3fsefpgqpc50bna3kopdIBFa4Q2pyhsXF1GW7gdUR7
	qaX+132F7Ta1DyYX7ruTKRw+N/TzUpH6n8+bOSotTu8beb0Jw7j0hkmnmH5H6gMVE9hH
	b29Yr4iwivM8v5qifZujW4a5UwcPqxBOkmeqzzQm8Db9APioRON3/Rkz5wdHGQ0X6KVK
	jXzP8zLlNGO3Tmh1d+hbZrjw0PJrUSc2z7YjzNFdF4jgBP59qQUo6v431og9L56wnErq
	DPpvELwgo2zYaNRnD5XdDSzGsxrX/PuH8wctdRZ8YSfmecNsnqczEPMnOoaNLyodpiuB
	V7rw==
X-Gm-Message-State: AGRZ1gKpU9HDNUvj/boHsm7bccQMnm0s/deTkbnzHoUuBsXSYrH0MkYj
	uRykFVKFL2FYzbXFh9EitvM=
X-Received: by 2002:a19:1f46:: with SMTP id f67mr12226377lff.1.1541431397362; 
	Mon, 05 Nov 2018 07:23:17 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	t77-v6sm7621832lfi.63.2018.11.05.07.23.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Nov 2018 07:23:17 -0800 (PST)
Date: Mon, 5 Nov 2018 16:23:00 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181105152300.GA1148@toto>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
	<20181016093703.10637-2-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016093703.10637-2-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [PATCH 1/2] target/arm: Set S and PTW in 64-bit PAR
 format
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fIhfzlG0IVZN

On Tue, Oct 16, 2018 at 10:37:02AM +0100, Peter Maydell wrote:
> In do_ats_write() we construct a PAR value based on the result
> of the translation.  A comment says "S2WLK and FSTAGE are always
> zero, because we don't implement virtualization".
> Since we do in fact now implement virtualization, add the missing
> code that sets these bits based on the reported ARMMMUFaultInfo.
> 
> (These bits are named PTW and S in ARMv8, so we follow that
> convention in the new comments in this patch.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 43afdd082e1..dc849b09893 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2344,10 +2344,12 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>  
>              par64 |= 1; /* F */
>              par64 |= (fsr & 0x3f) << 1; /* FS */
> -            /* Note that S2WLK and FSTAGE are always zero, because we don't
> -             * implement virtualization and therefore there can't be a stage 2
> -             * fault.
> -             */
> +            if (fi.stage2) {
> +                par64 |= (1 << 9); /* S */
> +            }
> +            if (fi.s1ptw) {
> +                par64 |= (1 << 8); /* PTW */
> +            }
>          }
>      } else {
>          /* fsr is a DFSR/IFSR value for the short descriptor
> -- 
> 2.19.0
> 
> 
