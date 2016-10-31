Received: by 10.80.166.35 with SMTP id d32csp199555edc;
        Mon, 31 Oct 2016 08:29:06 -0700 (PDT)
X-Received: by 10.55.100.204 with SMTP id y195mr27793972qkb.23.1477927746020;
        Mon, 31 Oct 2016 08:29:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si9005279qtc.143.2016.10.31.08.29.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Oct 2016 08:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c1EWH-0002sS-BF
	for alex.bennee@linaro.org; Mon, 31 Oct 2016 11:29:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1EGb-0005N3-2r
	for qemu-devel@nongnu.org; Mon, 31 Oct 2016 11:12:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1EGa-0006Og-5Q
	for qemu-devel@nongnu.org; Mon, 31 Oct 2016 11:12:53 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1EGa-0006OV-17
	for qemu-devel@nongnu.org; Mon, 31 Oct 2016 11:12:52 -0400
Received: by mail-vk0-x234.google.com with SMTP id w194so40232185vkw.2
	for <qemu-devel@nongnu.org>; Mon, 31 Oct 2016 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EIeSM+R9eQmQfXo39ojH8a7CHhCyhvGQnRRG98xjarM=;
	b=DSI59ecg7tDmiDFwY33Jojm0KyixSnnTbbR6amSk2qyx/8yqVvi7QaozwYoKVMa+FI
	9rc+ePR1NDMkPpO/GrrAaSZ2jNm39ln19j5ZuqLZwNpqw6jq0r/dL1q/QNkqxePkg9sp
	mr8a6KpO+vLDnrTVrQDakOZCe+8mBPFXICMgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EIeSM+R9eQmQfXo39ojH8a7CHhCyhvGQnRRG98xjarM=;
	b=bdPlz3IB21aAjs5oCGHbJURZGLbh3b35L1hmNaH2h7/OJlFbH/+azXv3emT4a9/yDT
	j9zNh7KWZL2VT//MissnB2UgloX+IYkreLKv37GBQelGJHoa5wNQlncCarcxXHTje0EW
	eBgfGeoLQeotdzmDa9vAd9KMRpkB7r6Tn+fdnjs/LV5bQNJ7cbsr0lcERrJNUMC5Q+15
	OpkvP3ywztIVRwkl5Tag2/qG5b+iqrw+Ql/Lga5+TjH/aNM39AKDqG0GuJD1Fh4KibbH
	LnKfj5pwnq7JAY2gHmbJSI8CnxLJUL2sPTMyNO9aBUD4V23d55Dw0cVO6SeE+rxrAvv+
	5GvQ==
X-Gm-Message-State: ABUngvc1joDEgwA9Hozgo+uFJmh8ftsxmx+k80vnZuRCj5DOAuIDCCj0/23/3TcoYqt9fe8J/yEYCsogGDtiW0/H
X-Received: by 10.31.102.6 with SMTP id a6mr18636612vkc.175.1477926771257;
	Mon, 31 Oct 2016 08:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 31 Oct 2016 08:12:30 -0700 (PDT)
In-Reply-To: <1477397577-25251-4-git-send-email-vijay.kilari@gmail.com>
References: <1477397577-25251-1-git-send-email-vijay.kilari@gmail.com>
	<1477397577-25251-4-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 15:12:30 +0000
Message-ID: <CAFEAcA_y_LntrR9YwdjuyYh+OrJztGvSZZBvF8P_SxwHXPeB+Q@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-devel] [PATCH v4 3/3] utils: Add prefetch for Thunderx
 platform
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GjeviQtQpAru

On 25 October 2016 at 13:12,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> Thunderx pass2 chip requires explicit prefetch
> instruction to give prefetch hint.
>
> To speed up live migration on Thunderx platform,
> prefetch instruction is added in zero buffer check
> function.The below results show live migration time improvement
> with prefetch instruction. VM with 4 VCPUs, 8GB RAM is migrated.
>
> Code for decoding cache size is taken from Richard's patch.

> +#if defined(__aarch64__)
> +#include "qemu/aarch64-cpuid.h"
> +
> +static void __attribute__((constructor)) aarch64_init_cache_size(void)
> +{
> +    uint64_t t;
> +
> +    /* Use the DZP block size as a proxy for the cacheline size,
> +       since the later is not available to userspace.  This seems
> +       to work in practice for existing implementations.  */
> +    asm("mrs %0, dczid_el0" : "=r"(t));
> +    if (pow(2, (t & 0xf)) * 4 >= 128) {

Converting to double and calling a function in the math library
just to determine 2^x seems a bit silly when that is (1 << x).

   dzp_blocksize_bytes = 1 << ((t & 0xf) + 2);

   if (dzp_blocksize_bytes >= 128) {

> +        cache_line_size = 128;
> +    } else {
> +        cache_line_size = 64;
> +    }
> +
> +    get_aarch64_cpu_id();
> +    if (is_thunderx_pass2_cpu()) {
> +        prefetch_line_dist = 3;
> +        prefetch_distance = (prefetch_line_dist * cache_line_size) /
> +                             sizeof(uint64_t);
> +    }
> +}
> +#endif

thanks
-- PMM
