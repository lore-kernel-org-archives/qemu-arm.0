Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6413954wrt;
        Mon, 21 Jan 2019 11:37:48 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7oFtLdefD8KbY1LsSDjodT462inIPVAEHmaFwg2aZIAA7q8CcoueBj+koEyknBYbNRA60I
X-Received: by 2002:a1c:448a:: with SMTP id r132mr642670wma.47.1548099468206;
        Mon, 21 Jan 2019 11:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548099468; cv=none;
        d=google.com; s=arc-20160816;
        b=htGtghVOhUj6ftx+pd6oOeqCmlYK9G+ms6P/32us0/XR+41EpNWIhCcbH5Hw1MM7h7
         tZPyUH0M0ttRdjw58k8WQAXdh3u2Qmc6rGVRo39dhrJDc9FCOnjtzlV/3K1WD26CSzjP
         ONe3Yp1hguhnvRMKKHu1VoVlWdNU6DJP1lbjx8igSF4eyI0bcLEwhaRYKS2I/oMLHmen
         1le8JAG4UT5W5lPvt2wWHGnexzli2nwdlso0Gmush/V+7CfyaefrHwEIQYHpKlT1iSv/
         u+kOG3/dI8xGnd9RM/KuI5oFVuMFNCAJ+/avQueB1iKoyM8+gpaVo3js59RAVkT+EhSd
         YYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Rk4ERuFkCVWZV8GpC3HHcz3iNdF2eBvQ8Vb2DOcQ9Ik=;
        b=ivdNg3tpcqfTEtEfQi6alrJFO8sSZv06Vpt4RlwUq3fZHLsV+zhv+obynrRnGIa7Or
         nTAw1guB0vWD0ARQPNg0EisKKTrWsFUn2EODYI/igMj8GYTwbR6jD81lriBru6CVh3Bf
         04YqxsIAlsSVvDaB6P93VShLvrCBnAu3hzZxhxDNZVVnl+xYwq2nY3/qnl3B/Lm7kJMj
         Y9mknjM7erxexfmKc5MZED74OhCDR6Jf8G3j0pDbeBpvRBPc5un6daGdvlFkvqXWaJwb
         Z0Ky3+qJADBo2i6yzNK4KPCKjgdrD9FPG7x2KAGecOtBF0LnJENQXhhpQ14m7wctqjDZ
         71bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W4XK1LYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si34679266wmw.89.2019.01.21.11.37.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W4XK1LYI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:58797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfOF-0006lA-93
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:37:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfJP-00039W-3w
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:32:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1glfJM-00011I-Qb
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 14:32:45 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:36715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1glfJM-0000z4-DZ; Mon, 21 Jan 2019 14:32:44 -0500
Received: by mail-ed1-x544.google.com with SMTP id f23so17476504edb.3;
	Mon, 21 Jan 2019 11:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Rk4ERuFkCVWZV8GpC3HHcz3iNdF2eBvQ8Vb2DOcQ9Ik=;
	b=W4XK1LYICdIwwbRLLr1m02/NZqRWFIKCK+fWj1X5HRoQZvWkWzolZFEBPuBeL+/snz
	Xe0ZNgw+iqCFzxkY3ItZDO/8R0LsqhUKGF+Y5ipTHZZbjZAd9Vo5GgVbKPLFCqi1g/H8
	29CbM8dseNDyScIwTcCKhalKx63Ro5d4ycF9uT6xWDjSc+TFKFj+LSQ3ndi61uZcCAvo
	dEvyOKdkvSPpRzhXR6WRPNKaUiqrZuwlpRbg+Jx+qBUU2cmPxahp8JduOrU6xlxJFulA
	TAMgee+qI1x7Qu1sHGYiD6uzA5Fk3hotfPPabduMlxMN3hc0IG/drnvNZLt57TcZYWD4
	vRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Rk4ERuFkCVWZV8GpC3HHcz3iNdF2eBvQ8Vb2DOcQ9Ik=;
	b=eGpPuy8o+7B6BbOGoYm0JRFbI8sViWKsiusiZd/1EiI4NSUcCnx8WUSJnqHdRmiuMg
	6k2TlCmz5KsIxxx9N0CUK+4ZIGfi1p860ZRwQgMfOvWRlIgod7IvV4sAOVh74MD3rFml
	uS177qFLNoxe5CXzNQY8gtD4cPVHnUoToqVH14MfRknpFwrxhxcObN5MOCy1mK3CZaZx
	0PA6Dv2OX7TuGSaMuyjuTdOsHC5PsaynZIFEwk2RArl0oVyrV89w+a9dcSlv4MZmU+MK
	xvJ7StrDMvQDwAnMIK7/SbAPWOo1iS1SWBq7LVqoviGUrsIQrhldVKYnwNRaKoGdN8vO
	ag+w==
X-Gm-Message-State: AJcUukd4DSBb+DDVaHNA3zCJgdvVrLsAzurDYWN+qXqomE1D/LKRty7B
	4hR43EsHu9XmJmqOYvLbBmY=
X-Received: by 2002:aa7:c605:: with SMTP id h5mr28385163edq.9.1548099158365;
	Mon, 21 Jan 2019 11:32:38 -0800 (PST)
Received: from localhost ([149.199.62.131]) by smtp.gmail.com with ESMTPSA id
	m26-v6sm308893ejn.38.2019.01.21.11.32.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Jan 2019 11:32:37 -0800 (PST)
Date: Mon, 21 Jan 2019 11:32:03 -0800
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190121193203.GB19750@toto>
References: <20190121184314.14311-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190121184314.14311-1-peter.maydell@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
Subject: Re: [Qemu-arm] [PATCH] xlnx-zynqmp: Don't create rpu-cluster if
 there are no RPUs
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HyWWi26pzWO2

On Mon, Jan 21, 2019 at 06:43:14PM +0000, Peter Maydell wrote:
> If we aren't going to create any RPUs, then don't create the
> rpu-cluster unit. This allows us to add an assertion to the
> cluster object that it contains at least one CPU, which helps
> to avoid bugs in creating clusters and putting CPUs in them.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a preparatory patch that is necessary for the series
> "[PATCH v3 0/4] tcg: support heterogenous CPU clusters"
> (20190121152218.9592-1-peter.maydell@linaro.org)
> in order to avoid the xlnx-zcu102 board asserting if started with
> fewer than 5 CPUs.
> 
>  hw/arm/xlnx-zynqmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 370b0e44a38..16cba433cb7 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -178,6 +178,11 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>      int i;
>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>  
> +    if (num_rpus == 0) {
> +        /* Don't create rpu-cluster object if there's nothing to put in it */
> +        return;
> +    }
> +
>      object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
>                              sizeof(s->rpu_cluster), TYPE_CPU_CLUSTER,
>                              &error_abort, NULL);
> -- 
> 2.20.1
> 
