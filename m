Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4933600wrt;
        Mon, 15 Oct 2018 13:52:27 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60/8xq8jcBnG/Nuo8NnAZCj11EeQJmKeB/Nf+U53P2oVLDYAmMWO16qMy5Wz4UBgz5rUM9S
X-Received: by 2002:a37:d95d:: with SMTP id u90-v6mr18313643qki.244.1539636747900;
        Mon, 15 Oct 2018 13:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539636747; cv=none;
        d=google.com; s=arc-20160816;
        b=TJFeLLlskCwLfT67K54UH2ZVm+JXb/Fy9ecOfPJAa22mvQlGb8s3AujVrtSe3i3AGj
         cgo7C2CJeYc56f9x4cYVF9r215pS0q8STUVekoDZHv9cqXG6zMZmySr52CiWgbmXP3Uo
         8DA9hbQ0BySjJyfhthV1kbPuW+yMyZ5arBwVR8omwrrFZqFf1X6enFGrdSOiQEnoibDE
         zM4pETQBjbe/YosrHmRVvBePT8vFbJgWraQ4uF5vsRBNwiBRIDj4GL0upi+T7b9v8ctl
         W/70XRXwk/MUsbWiULhZITN8VwH4fkoIqPSQ5ZszUUB0kVsk6vFP2Ij7geQj4nQsAfR/
         FcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=EfCBV8O2KHhKv77TwaYwoB2A8iuDsdttc0CQsMr9mfI=;
        b=K0HcUWRS55gYauJFC/ZZ5VG9xNrNgowY56q+s3H76bxC5by0P63DND5lqtViLG/lOa
         oXzQFl9Zn1Omy+gwK6zMweks7Os4AWEeZahICHQb6RHXM6DqSEHxgMLqxQYG2tWwZ2W3
         jHmKg7aYbMo5zAdVh4OAQWA2RfeuKe+I2XWmarpKSHjI+DqBZsCnE2u35cm4ZhhNP4Iv
         pmeSK4/cMPK2oCJSy18B/Dhe1JWj/6Kdj24DyVYZ6L/59NSrALN0VS0givpG2oB1Qp6h
         7uGrVjuB3DiJczVTD5DdoyyXTzcZ+brjvbKSrJJKnvfJ2v3H4jRip80QiSQGcScBQcAt
         pF4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NhLY+ycI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62-v6si1089566qkd.89.2018.10.15.13.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Oct 2018 13:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NhLY+ycI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gC9ql-0002Gb-1L
	for alex.bennee@linaro.org; Mon, 15 Oct 2018 16:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC9qc-0002GR-Mi
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gC9qR-0004S5-1F
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:52:12 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41693)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gC9qN-0004IQ-Kn
	for qemu-arm@nongnu.org; Mon, 15 Oct 2018 16:52:03 -0400
Received: by mail-pf1-x441.google.com with SMTP id m77-v6so10275708pfi.8
	for <qemu-arm@nongnu.org>; Mon, 15 Oct 2018 13:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EfCBV8O2KHhKv77TwaYwoB2A8iuDsdttc0CQsMr9mfI=;
	b=NhLY+ycIfHM6t9BrAlhbiXgZ5z/gj72j1DhZWdqQjbskmI6FFguOQBoaq+vFRZIzna
	2vin60cTIQStUnYf5b1BCRd42fLae5N+Nk6vOkc9A1jZcq6JlttGujVuP/ApQeMS83Be
	XQZACdRIv8RJoh4if6Tyt0GzH1bZMyUsYsy5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EfCBV8O2KHhKv77TwaYwoB2A8iuDsdttc0CQsMr9mfI=;
	b=B+1nmz7j9K/ZPrE9YeSc4lWw0TWi3CVFHqG15wfrVYSDRcUNTvNyY2/QixFAi6DWTz
	qjby2Wr5G42jLCkaER5AzwKGf7zW+cVDGyXuN8BGISV7nXe87vsr5zipgVf5hv5CylHM
	irQ++5dOKoe0njIK+wnp5x2/HrBf0b46OxuUAqKPMR4BAJjbqNOl6rF4koRlXPxvZsUa
	v5nMFQGuRARwX23CHxX6shJI7lE/bb2z9MVd7dK/nseC1r2qRG3u6XTT+tMiIgvLeJAN
	GyqFtK0S27j+qxCVXA0Rg2SzezdkOKYboOvWf1TWGOCeHSkudvtPgf1WKc4eB8wmJL+X
	N+MA==
X-Gm-Message-State: ABuFfohMgYzFrXzpv4vyEvq7hCFq0v0dR6pILAp6koM0lpsWspdknjn5
	VTsHcANFBM8NyZ5Cjj0W4bSM4A==
X-Received: by 2002:a62:4b09:: with SMTP id
	y9-v6mr19084389pfa.93.1539636714316; 
	Mon, 15 Oct 2018 13:51:54 -0700 (PDT)
Received: from cloudburst.twiddle.net (174-21-9-133.tukw.qwest.net.
	[174.21.9.133]) by smtp.gmail.com with ESMTPSA id
	n82-v6sm17553418pfg.21.2018.10.15.13.51.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Oct 2018 13:51:53 -0700 (PDT)
To: Aaron Lindsay <aclindsa@gmail.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-7-aclindsa@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <b58c1b9d-f3d7-198e-e31e-d276effc42a9@linaro.org>
Date: Mon, 15 Oct 2018 13:51:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181010203735.27918-7-aclindsa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 06/14] target/arm: Filter
 cycle counter based on PMCCFILTR_EL0
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zFYnrBdrdJUb

On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -584,7 +584,7 @@ static int cpu_pre_save(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
>  
> -    pmccntr_op_start(&cpu->env);
> +    pmu_op_start(&cpu->env);

Does it make sense to move this patch earlier so that these hooks are modified
once?  No big deal if not.


> +static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)

Drop the inline.  This function is pretty big; we should let the compiler choose.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
