Received: by 10.25.21.96 with SMTP id l93csp355002lfi;
        Thu, 30 Jun 2016 06:51:27 -0700 (PDT)
X-Received: by 10.55.191.129 with SMTP id p123mr19453916qkf.1.1467294687123;
        Thu, 30 Jun 2016 06:51:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u21si2670283qkl.71.2016.06.30.06.51.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 06:51:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIcNK-0001Vt-Gc
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 09:51:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIcIP-0003Gk-GB
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 09:46:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIcIK-00046u-He
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 09:46:20 -0400
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230]:34707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bIcIK-00046e-DM
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 09:46:16 -0400
Received: by mail-vk0-x230.google.com with SMTP id c2so110208745vkg.1
	for <qemu-arm@nongnu.org>; Thu, 30 Jun 2016 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6p6qFBXZZQIPxMQjG1G8UVLHOaVRVlAwpH5QpiwJdqk=;
	b=VDWBiax4CcyuwQhfnPRR7ndLxEemoxd/gZnXXJF+5E5qn7QeXIfm5mR9fmkpOguYct
	GdTMzeQ+UiOFvRXdy9rhzA74mTUAhyhC1w08ghaXKstt76NGxQi87jMLHr8zGcjARpY2
	DPeEeGi+QPwU7iNKBoDk+b5FBnfQJn3WVSVEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6p6qFBXZZQIPxMQjG1G8UVLHOaVRVlAwpH5QpiwJdqk=;
	b=f4oDXbYNWRMikflSbPC8if39GoHSewpbvnyxnrRnBZiXt5um4g6qIZ/DzoF+6M++4J
	jQ8aNVzMb72zasQ2qGX0LgppBi8NkjEwn3Jy0eXQfdEBaT1/V1ECxCfmx9wkTwnJcn9t
	kj/dL/4KtYsO1gW3EQLD2MKQkKYhKwsMnqTKGEFdzDt8Gs9lnil52eEiVsJ6SYSSAIIP
	k3dLMn7drsvFhzHQaEHP8vIDqhY38GH82tyK4JuADF0CB+FAhkWUiJsKfyIut587quiS
	g+rAGnpCZUsEuIdMyvl4YJ7qeLmmcfT9SdoezHUCOS7OTbgFneO8B1h64VubhGfugMAs
	rTLQ==
X-Gm-Message-State: ALyK8tJdjhNPzkuC5/twtKG8JhYQPqxyJBKjtwiCMYtd60aFIJ22DfIZtuV3uf3nmosFY7VQjGwgwlUQ0BKRd/Ai
X-Received: by 10.176.65.7 with SMTP id j7mr5630288uad.38.1467294374817; Thu,
	30 Jun 2016 06:46:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 30 Jun 2016 06:45:55 -0700 (PDT)
In-Reply-To: <1467190029-694-2-git-send-email-vijayak@cavium.com>
References: <1467190029-694-1-git-send-email-vijayak@cavium.com>
	<1467190029-694-2-git-send-email-vijayak@cavium.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Jun 2016 14:45:55 +0100
Message-ID: <CAFEAcA-Ro3tN-4aGvivH864o0Sk3+FY=Z0W8=_3yooxk5+x=4A@mail.gmail.com>
To: Vijay <vijayak@cavium.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::230
Subject: Re: [Qemu-arm] [PATCH v3 1/1] target-arm: Use Neon for zero checking
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
Cc: Prasun.Kapoor@cavium.com, Vijay Kilari <vijay.kilari@gmail.com>,
	Suresh <ksuresh@cavium.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hMA5wky6OM9o

On 29 June 2016 at 09:47,  <vijayak@cavium.com> wrote:
> From: Vijay <vijayak@cavium.com>
>
> Use Neon instructions to perform zero checking of
> buffer. This is helps in reducing total migration time.

> diff --git a/util/cutils.c b/util/cutils.c
> index 5830a68..4779403 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -184,6 +184,13 @@ int qemu_fdatasync(int fd)
>  #define SPLAT(p)       _mm_set1_epi8(*(p))
>  #define ALL_EQ(v1, v2) (_mm_movemask_epi8(_mm_cmpeq_epi8(v1, v2)) == 0xFFFF)
>  #define VEC_OR(v1, v2) (_mm_or_si128(v1, v2))
> +#elif __aarch64__
> +#include "arm_neon.h"
> +#define VECTYPE        uint64x2_t
> +#define ALL_EQ(v1, v2) \
> +        ((vgetq_lane_u64(v1, 0) == vgetq_lane_u64(v2, 0)) && \
> +         (vgetq_lane_u64(v1, 1) == vgetq_lane_u64(v2, 1)))
> +#define VEC_OR(v1, v2) ((v1) | (v2))

Should be '#elif defined(__aarch64__)'. I have made this
tweak and put this patch in target-arm.next.

thanks
-- PMM
