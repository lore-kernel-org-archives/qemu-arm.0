Received: by 10.223.159.74 with SMTP id f10csp4119342wrg;
        Tue, 12 Dec 2017 10:05:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBouh3wRPhwcgR45ixyd5dfgyI0l/9IKScxfKBKRq4DoYFe5lupifWgNx1cOHrR1ILzBwa4FA
X-Received: by 10.37.231.81 with SMTP id e78mr3795535ybh.138.1513101900913;
        Tue, 12 Dec 2017 10:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513101900; cv=none;
        d=google.com; s=arc-20160816;
        b=sNDpyDpkSweAMKKBPXP7JeJCMtbkZgKoSJMjoBq4Q5hG/6974CQSRTaweT4BqKlobu
         i6c7oI1jDDPZmP60nFLYwusj04q/+ds24LJIVwgskQcPfUV2JsnTrqlsHf4XHjnDxIXz
         0ArIXwrrrTjW8yBNmh7wpT4J6uFxklzcRLZt0cqTJ0pjwYyIDqi7+hMiS1FeeXt+lwJ8
         CpaNU/pPUkE57FXeIq+J1Uh25BZ11+NZmIqwvaxgwdrbQYRmcEuEpFswkAki9bzYu+Qj
         WpNAX4EsyMpRNqd00Bka09cmcZqNAe8iwri/qm9sRkb1M0lvZjXPqnJp2TynFjF/E3LV
         eTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BlnHaGy7Napt/8S20tyNkTLzYPo4LvsTHm+A4sVQbWA=;
        b=XwGqN8qGeD3IOZ8ITHhq5X9yv9Uk+/OlLSATGYyusP1ATJf2jIlAtUbgBePcVajqC8
         97CwlORiGOqiEs43VdfwvwZtMIHowRSM/JAXinbOt8+CJrRuemAC3oUeJ6Wn2DX4Im9A
         pPiQwgwsLKhYsNfWBNXInzU+WgG7bAxGWt2BcL5z3vXHN6+lJ9nD3qbB+KPhGnP83G3v
         xu+6d9g+WRRNVDGBylfuHaahvqUpF+BFdLsDRyDKY4LNrmNdcerKXymOfg6vxfR1cWCe
         WAqLfo4HuWD7VDh9tsV7Iv3qrh5GUr0aiKYlsAfNMYm5XLtFDff8/noBPbimVcijZ/DE
         bbZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A36sYuME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o123si2470135ybo.666.2017.12.12.10.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 10:05:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A36sYuME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOovM-00022v-CQ
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 13:05:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOov5-000215-KS
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 13:04:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOov1-0000zX-TG
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 13:04:43 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:37164)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOov1-0000xq-OW
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 13:04:39 -0500
Received: by mail-ot0-x242.google.com with SMTP id s4so18565819ote.4
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 10:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BlnHaGy7Napt/8S20tyNkTLzYPo4LvsTHm+A4sVQbWA=;
	b=A36sYuMEHNIKQ0eGGfHOaBxUy8m2xzlAsljjUWKS9OMl/jIXSeYseczxb5gEkHv40m
	94ddgFgja5q1rNNrHPXRFLGtew7NSOHt0eP+f+Nvph8HD8jNGWb8a5zUlJ+ziLDT44v+
	4zrGlO3lHTtaFfUWNmuDb99LNc0jFgw5JXZzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BlnHaGy7Napt/8S20tyNkTLzYPo4LvsTHm+A4sVQbWA=;
	b=dzCx230kzkEqTPbseM2xvG2fd8X9Ftv5Jaqx56zfeEhA5PTLnr/zVClS/RyJ+drOMz
	H6G1eRCrvkj1MYsccNejXhlpSzibFxlSvWKia/rRdlyklno4wlwdc8UR+oH2OdDGk5ab
	/2X72HLFY/o4kGl3n10WiMMEcMXUb84XQX4yK60Oizwzyv0PNqESQFwOYh8LDZkTqkKK
	94njcjA+9GQqifjG8yQDr513bvYtK+sJK2wxAlJAgBtJK79jZZ6bk9vF/TOuZro8iCo2
	q059staTZI0G6x0uNXY2VTrXMxlkj1BcOFjcXfO+Ml8lrvofecgrycoVWkXe0WYi+WYo
	VqgQ==
X-Gm-Message-State: AKGB3mJ1hbdQzv/zeAuiu3th1XtLpVWJAXyZ71sFGSAxdGpFRUiAKhfu
	jzw9aNdbmGDtjJ6TfNABQoO3ti+ERQmg29m28WW6/w==
X-Received: by 10.157.49.54 with SMTP id e51mr3923959otc.24.1513101877094;
	Tue, 12 Dec 2017 10:04:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 10:04:16 -0800 (PST)
In-Reply-To: <1513058845-9768-1-git-send-email-zhaoshenglong@huawei.com>
References: <1513058845-9768-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 18:04:16 +0000
Message-ID: <CAFEAcA8XxVAU-U0fDGUfHbYCDnGbWUgiQd7W29+bMzNdyBme2A@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: replace the unavailable email
 address
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ph6vB52seU4s

On 12 December 2017 at 06:07, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Zhaoshenglong <zhaoshenglong@huawei.com>
>
> Since I'm not working as an assignee in Linaro, replace the Linaro email
> address with my personal one.
>
> Signed-off-by: Zhaoshenglong <zhaoshenglong@huawei.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0255113..45e2e20 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -543,7 +543,7 @@ F: include/hw/*/xlnx*.h
>
>  ARM ACPI Subsystem
>  M: Shannon Zhao <zhaoshenglong@huawei.com>
> -M: Shannon Zhao <shannon.zhao@linaro.org>
> +M: Shannon Zhao <shannon.zhaosl@gmail.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/virt-acpi-build.c
> --
> 2.0.4

Thanks; applied to target-arm.next for 2.12.

-- PMM
