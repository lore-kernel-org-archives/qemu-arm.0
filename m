Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp6111227wru;
        Mon, 23 Jul 2018 14:46:04 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdxvIDROd/BKT77t9tTijcYzgRGwCmzVqXkVfueWRb7YAtmAFirX7EaaQPsVDDmhEvA+5uC
X-Received: by 2002:a37:5942:: with SMTP id n63-v6mr13211033qkb.28.1532382364005;
        Mon, 23 Jul 2018 14:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532382364; cv=none;
        d=google.com; s=arc-20160816;
        b=wkBhcrOqaoozr2bP5ZZCMHxJsZb+2vdsrksy2Y1QA4Z7G9lVTutnIM3lO60BQiFNRW
         S+A3Jiqg7eb566SSIMaNopYvDAci/Wzl+svL5JXnUPBmyyGFA27Q1E8Gkc7NtN6NMfiR
         ZWskPaN30SEpcC2elxVildWoJ3DPvXbgEhK8SIwnz42NKyJMI3u7cftlqgkhsv/l+2tZ
         1lIQBw18N4TRDOr6LruaA2nFQTFMJ+dpxS/kHBk1nmjH+xjFhlizida5OEp9dJnpgvSr
         uLYAUcezw9QEouE6MK25vn07A+SG0Qb4VXgUJMv42eKH2IGVJiihMxaB5ORbN6qSM5EQ
         XkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=++QqUYqou+L50n/XsGUEhKiLrPIZP9O/tZzy8+JLp6c=;
        b=XuSY9uksos/Y55dOMBvzJBNeVRekfni8iSE5NR2pkXlyX/jtLUQpBdntoN0WLSMYrx
         C7gMiRIfYDNPJGuKZTqBCryr/xvnEFxoNEPZuCRLnTZrdfRhqDeLuA2uIvSomU86oetZ
         3bbNL/RlDZ/3c8HkXrD0RIQ0KqV5/8YBQnB+mynBteN5po+xTxMxauA6VdOk684u0J/M
         /DioWLg5qIsxbmmrm+qK0zZt/ffSWzurG8PtexKk4l8u3JJHnE2zhV3g4K6CPy3vGlYS
         478h6SNMvT2uyeug8ZcIhvk+0k5HRy8oUcfR7/vAcz7g/pTzesUcYK0cVAlksgosKd4a
         I7oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FIxzJI//";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z12-v6si3855677qkf.333.2018.07.23.14.46.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 14:46:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="FIxzJI//";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36927 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhieZ-0006Ob-G1
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 17:46:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhhas-0001yd-5Q
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 16:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fhhar-0002yu-Bz
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 16:38:10 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:44094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fhhaq-0002yW-S5
	for qemu-devel@nongnu.org; Mon, 23 Jul 2018 16:38:09 -0400
Received: by mail-pl0-x241.google.com with SMTP id m16-v6so706088pls.11
	for <qemu-devel@nongnu.org>; Mon, 23 Jul 2018 13:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=++QqUYqou+L50n/XsGUEhKiLrPIZP9O/tZzy8+JLp6c=;
	b=FIxzJI//dvosIRJRZL+cLEAkzznLxSAeOjL7FmkYQCJ/fXxt78bJyTNSVx1hNEVADD
	8td9Sn4QlZIPczxq/sKcS4oOpY0qcOgjsx8n+2Kv0gOEsR84dp6IbAAxqxFZ5xW9OGIm
	hXogI6E6ZUHxBaSdO5GslkRmkHmyxHYWuH31Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=++QqUYqou+L50n/XsGUEhKiLrPIZP9O/tZzy8+JLp6c=;
	b=iMcpgAwixP2snfiOLvZoI11n3wz71yqXpQv9GBDA1yKN8brQhS/7PHhqISqZYUo2Kk
	SevtbgZCi4KwouZyGRY60SgH5hnuXj/P/pldmbtB1OWHOeBkpcBCK7Uz6H8k+j6HzoD0
	Pb3EnTjn0S+dhSYtNGIEUjL3lxAUnanUrLrplwP/JZFzZWfZa56RyYQzCUri0qJ7xmWm
	JDIN7vNbqTjX8tEUgSVTZPHteDKKFt2Rw+mow69ZuuFJ8KPR7YCtvH6TMLlZKAeIuuAg
	i8cRpXAkCq4sYz4CJC5/Ha76tNkCpr83HWrPaZqVB45qVObJnF/R1+HDgp4TEup9YZVM
	0oWw==
X-Gm-Message-State: AOUpUlEVaatIAk6L+KHsrzSRz+xmnMDDNCXh7D1E3E8gylsB57dmKsb0
	14ZbmdBa+4Qi01NiI6OFSk9q/g==
X-Received: by 2002:a17:902:6b09:: with SMTP id
	o9-v6mr14120578plk.256.1532378287825; 
	Mon, 23 Jul 2018 13:38:07 -0700 (PDT)
Received: from cloudburst.twiddle.net ([2603:3004:4:2500::544c])
	by smtp.gmail.com with ESMTPSA id
	j191-v6sm16197167pfc.136.2018.07.23.13.38.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jul 2018 13:38:06 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180723180337.17378-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fe08bc19-8a5d-a0ae-66de-5a0ba81d4f9c@linaro.org>
Date: Mon, 23 Jul 2018 13:38:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180723180337.17378-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-devel] [PATCH for-3.0?] hw/intc/arm_gicv3: Check correct
 HCR_EL2 bit when routing IRQ
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wOB/xh2L+Ysc

On 07/23/2018 11:03 AM, Peter Maydell wrote:
> In icc_dir_write() we were incorrectly checking HCR_EL2.FMO
> when determining whether IRQ should be routed to EL2; this should
> be HCR_EL2.IMO (compare the GICv3 pseudocode ICC_DIR_EL1[]).
> Use the correct mask.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Cut-n-paste bug we've had since forever. Linux always sets
> FMO and IMO to the same thing, so we haven't noticed this.
> Probably should go into 3.0, though...
> 
>  hw/intc/arm_gicv3_cpuif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
