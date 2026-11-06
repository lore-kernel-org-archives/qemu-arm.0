Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D126606A32C
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5qKcdDC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPLzp-0007IE-FC; Fri, 06 Nov 2026 10:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLzk-0007EE-AM
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:36:48 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPLzi-0007if-Oi
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 10:36:48 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-8b305e10ac7so6217307b3.0
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 07:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793979405; cv=none;
 d=google.com; s=arc-20260327;
 b=XBnnLTUe0rZXmcrdBww5Bh9lqKQ+R2FUbKv1yXwVECNG36G+gf7gyyR+QaOca1oLw5
 /n2ZAnnVTMX7hki7FA2WNkuo94jeryUeN7adUrJJTQZbx/szeuitS0ctUtnEm4SX9fYD
 WkhaaqgTWCZqAwHSlA0qBPzLbIHi2X/L/ehw7bl3/yRDLLXbHzzm58CgRHk5RXFTTqXi
 U8AD9iSPhh+/LuyDMoZCTKhL77YrNnavRHyWSP3xTDSk7Kgvp50efazkxsfHtm3UJRg+
 EhH2MAt5zS6aXg85o3qrGVuibAIDlwh4d+ZLaSilY3SVU0/KX6fY0/q03BeaFOctzvOU
 4Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lA4GEPoU9ZOmt6nI2Rttty0979Gqih4iTATMuirj7tw=;
 fh=oiUB9N6Ez9b0HLu59oZs8F9V05BD+7+AmTOg55lXnP0=;
 b=cpu2UCOgCcWUCWY1rK8G2NfAQ9iLq6YFJAzB1Wmlig5yWI3R8GkxjNd3afsdAkTZaS
 OBSSnCaH4w8wXqpgu3s+d3eUuEQgGUuEos2jEUl3I51XbDowwIogeiCigV3JXrICUb8j
 dmB46fdGD0dUarPoDv6ocMIKk8x8WJGZmWOdAe2Kc+Q9EshHUxpDSlCioq7uOqXoDGoq
 5EwU5rWOn3jLAhmcu9cW0iODRd2SDRQ9LsXuco8S1vd5olPtQwtRdZgTAnBAOKan4Xlt
 /SLB7hPZEc2k7bNOaBBqoQYFqLATPUYOIsfuqCHRz9Q5qL6BZYTo6Rb+sRT5j2+TR+gJ
 yEMg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793979405; x=1794584205; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=lA4GEPoU9ZOmt6nI2Rttty0979Gqih4iTATMuirj7tw=;
 b=m5qKcdDCktCyl5ZMfv+nyqDDY0bKVxjrXx5xTsIKX0Vh8j/J8P6K8usg/tYORSXfVD
 fSwX1rIvjU4Cn6eFP3GZ2ngNVJrfE46ZYPvRwWCuNNR4l2BgycrMtvSS8mf7YQswgxUr
 R+d5iakpa1NAMgJc5sC++tHkrkxxSmaYqLGEUIXHvL1FNpUdMMaI9USC2VMKrpUN1b0C
 Q6h+zZLKysVr2Mca9duJSdKFvU7KGYlHMwJY2laZtM0CC3zBa6SX7gMhxlMj1UOpd/WW
 0LUvuQ5H7egEHRNXY4EYGgV/V09zVPhiUAVBw1K7IP1w+3Lq1NLX7LrJdXWDnHxK/UsR
 XHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793979405; x=1794584205;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lA4GEPoU9ZOmt6nI2Rttty0979Gqih4iTATMuirj7tw=;
 b=yxJxqKFK1narx7Tp2IbIdXYKeJTujjEcwIyjyEA+EzqbjYkvYisAm+o6IQgtWw+odl
 aUjzb+iQ/+xnak5VETPxVjnkjQgsWxrNXVP9DUarVhQ5K1c8PZY5rMBsVWV33EAf1WZC
 ONFUb3slvoJ0jjkr0wCa04cOB+6aTxEdfswIcH+hNlDDgAOHcsvkkMxZWVvy8B5y79EG
 Gn00/QNJy0WF98SwpZ9VivmK4lLUXTJCU6WWB+zGo5dMShL5+PWLC+3wjtn1BdDVrTCn
 5nSoi+CiIuSfls1smS7Gb4Yet9ycRiB30QdYzdFlBtpplzQAvhrviVbEnnhcnUVPTO0g
 7QiQ==
X-Forwarded-Encrypted: i=1;
 AL+hErFg+s4hHhP0vAdovnpUF4t/nl86RFDCeEoovUzq9rBJUaa6qrpygbMr70c9Fl5R2rgB3oHU7G5zfQ==@nongnu.org
X-Gm-Message-State: APuU4Z9SuqLLX9gTSrzmmifZ6qQR93mo+/JbxWU+SVXZSQ3R6kkcXuFl
 rKZpleJdPc9+9D4RyNlkzmbzLOgPZdtHCB03KzoncTcqJw1cT6LAKavdmmZbiFuLK98PJ7syyLe
 fQQqsdU+m3B1mZ8i3gdKHpjenNLNwD96b+aKg8/Iq1Q==
X-Gm-Gg: AYBFou1TFv7Yu7+EHBpO2ujhJaHHr4fN9I6myfS73MxSD3zSPDTvx0RcJB5uO/QH7wV
 G7mGyhftX6Qsm4JxSsPrElln0DWIWPVlKhJlVFKC2DfiSGEWmsrNqGFpfnE997kg9O4lOBBehqE
 XlBx5sR8oqJgXN7J6bzqQ5s/zIXRavN0iAs/gbMnIsCHcW5MQIXQ4/F0XKWN4uXhe31ijClCvQC
 DyQZXM6xiv9NkQKmhr9yZ6Ua2TwyQICOz7B5HTME8homtA0jyo5am6Uri3L+yiS8nzZf4gzx8DN
 k/WQYOI7fhxxywyHrbyBjZhnWjGL6Ch3UiRCaEUmna07zPfI5yXFMnIFigc2u93y4Dln+RWRB3+
 tVyZz9jlLk/kPjZdW9UwPPs32TaugXZ2cLqv5jcCDhQ2YGd2WzonsbHaeI2NO5OeSwwYdImB+tf
 ioCDdTsGBt/y89V+1NvBBn
X-Received: by 2002:a05:690c:c5e5:b0:8b0:dc6f:40d0 with SMTP id
 00721157ae682-8b341928dedmr13484657b3.21.1793979403282; Fri, 06 Nov 2026
 07:36:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-gic_read_bpr_from_property-v2-0-9f096cce4814@linaro.org>
In-Reply-To: <20261106-gic_read_bpr_from_property-v2-0-9f096cce4814@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2026 15:36:29 +0000
X-Gm-Features: AclHuK8ovCrvEFYfrd6MUbi1A_HYZBNDt_CW-yGFhQdcF7DIlPdAdNqgSJxf50U
Message-ID: <CAFEAcA9GCg0QzcKUcsOO+oVMxATHJG_9OEL9Zi0uLCjvN-Do9g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gic: read bpr from property
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 at 07:12, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Calculate minimum binary point from the num-priority-bits property,
> instead of hardcoding it.
>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
> Changes in v2:
> - Moved GIC_TARGETLIST_BITS back (thanks Peter)
> - Added an additional patch suggested by Peter
> - Link to v1: https://lore.kernel.org/qemu-devel/20261105-gic_read_bpr_from_property-v1-1-7e7392bfd321@linaro.org
>
> ---
> Manos Pitsidianakis (2):
>       gicv2: do not hardcode minimum binary point
>       hw/intc/arm_gic.c: move num-priority-bits check

Applied to target-arm.next, thanks. I moved the second patch
to be first, since it's a prerequisite for the change we
make in patch 2, and adjusted its commit message accordingly.

-- PMM

