Received: by 10.25.221.202 with SMTP id w71csp2305747lfi;
        Sat, 12 Aug 2017 09:41:55 -0700 (PDT)
X-Received: by 10.55.197.195 with SMTP id k64mr23558293qkl.281.1502556115107;
        Sat, 12 Aug 2017 09:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502556115; cv=none;
        d=google.com; s=arc-20160816;
        b=YUOrd+LiTFuphgDIJ4FP+XdZbb6FfX4pURkeQj+VH5A5ELLmDdRR5lwN0NIY1Bx2cc
         zYDxhph2gzN8H8inwtBpkJJeSVB1LhJ3CdUQyN5vSFgzbIFp/yQ1kKO7w8agBEIMX7aK
         3LTRwwvRQoPMzu2rpqcm4H+037MUzebiTo9D/rgviYEPt7a4YoukhWZIkmMvxqhzl8fV
         MPVhNcLSCGWiottbX5RaG6tECRb+/mGtGA11yA7jkiZ2sirdPAKEORKVT3mn+St3G5wO
         +VisQSVUaBFZZy4/MdV/OVy4NUP0IEg+SSKAtN3bhuDybBHZxmNbobSbOA/lIV7FpG+v
         UPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=sRPhTJr6cUXPVWn5Tm0h2oHf50BQHSx2WVEV9TOs36M=;
        b=Pgti56x8ETVxURBJmdo3Xx+LUmPdriTXs50n8rfqGKl1Ll+Wefnwv7LIO09lolFmfT
         d+s/sUqIrOTQu6uM7zcwcOD7g+KVm+Nx5jnBMSqrr7xJrSCR4gTNxrBl5jYRutlC7M5/
         Spp2b4/LI/9ar8NKmQnZZ0IiD2M2V28TlqEMJsmBxS1ebTSLphQTE/HXkCg1wMpOXjeX
         wYyQxB2iZ2JFfQCZ5OHuqGOz1kJp2JwlD7hq6INtpcvtLxDHc7jbtjQALKQmoOG6A9gp
         OADD4cmGof/OGvvnAurUt8o+kYkava52bYxjtHJZ/djzMFblOlIdiIxji60Fn7bziqLo
         bVBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PZ+cwnO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189si3034531qkb.462.2017.08.12.09.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 12 Aug 2017 09:41:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PZ+cwnO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgZU0-00057c-II
	for alex.bennee@linaro.org; Sat, 12 Aug 2017 12:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgZTt-00056q-CL
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 12:41:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dgZTq-0004Qo-Ag
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 12:41:45 -0400
Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c]:35572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dgZTq-0004Qc-35
	for qemu-arm@nongnu.org; Sat, 12 Aug 2017 12:41:42 -0400
Received: by mail-pg0-x22c.google.com with SMTP id v189so26453619pgd.2
	for <qemu-arm@nongnu.org>; Sat, 12 Aug 2017 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=sRPhTJr6cUXPVWn5Tm0h2oHf50BQHSx2WVEV9TOs36M=;
	b=PZ+cwnO9h5MZYNJ79kjq/BpCrOPHE606sBYjfTEuzwNeB4OzxaGjaOCLDS3WNTcIWh
	7XUna3kOw4Ol61jIPKY7+CbgqU6kVJkztt9IaaMU1IXY57KKBWKsOKUxv4lTJcixg9Rk
	OHxYUoeEklC6trY5DlZosECZ9N8YmMuG0XOcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sRPhTJr6cUXPVWn5Tm0h2oHf50BQHSx2WVEV9TOs36M=;
	b=EDzA8ZQLtKBKQp+uGg8tDKm0e5tSDAa7iDHdfntwRdirvs7OM/3fOWHpQZyos4kT0o
	63m+0n1EbQE5vNSieJPxepSFK6BwMBfHkkBC2HoruT9BFPSrNEGaXAgypbX7plQiEcXE
	YKRF3wOL6R+Hve7cvVd86QsC1aRkCBD2jXCyqmsdZS9aYoKXogyNkjY9N2hChZGau/+q
	klPaK3+mhGFvF59FudgtwEf7hXDJjJCe5TRmYjNIfq0oaTnGemdTuU2H3UNGkl020+h0
	kWM39ZfvuT6LsideGcgsY+KTqOGfMVwYBc644PQTo04erMJpuqVHASgo9D9DjDZ4od3U
	rCTA==
X-Gm-Message-State: AHYfb5h5qXl6GwyGWi8MwEpRw25rBZ1YtL9KDIUFYtvWdwLLtpeZXegK
	vQeLU9u+byXffuWD
X-Received: by 10.84.167.2 with SMTP id c2mr22073695plb.336.1502556100719;
	Sat, 12 Aug 2017 09:41:40 -0700 (PDT)
Received: from bigtime.twiddle.net
	(50-233-235-3-static.hfc.comcastbusiness.net. [50.233.235.3])
	by smtp.gmail.com with ESMTPSA id
	l24sm6256167pgo.43.2017.08.12.09.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 09:41:39 -0700 (PDT)
To: Alistair Francis <alistair.francis@xilinx.com>,
	Richard Henderson <rth7680@gmail.com>
References: <20170812154131.29372-1-richard.henderson@linaro.org>
	<CAKmqyKO=+QDLgEAyqrdTCkDsu6nojmDsdqsu5+po3OP_KOwYQA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7343971c-2563-d18b-cdac-60c4d66f5240@linaro.org>
Date: Sat, 12 Aug 2017 09:41:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKO=+QDLgEAyqrdTCkDsu6nojmDsdqsu5+po3OP_KOwYQA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Correct load/store
 exclusive pairing and alignment
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nn2q/PsuGiTK

On 08/12/2017 09:29 AM, Alistair Francis wrote:
> Now we aren't ever checking cpu_exclusive_high. Is it even worth having?

We are checking cpu_exclusive_high for 64-bit STXP.
See paired_cmpxchg64_{l,b}e in target/arm/helper-a64.c.


r~
