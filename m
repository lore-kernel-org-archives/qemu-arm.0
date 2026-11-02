Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2001606A32D
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=C61RSYqt
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNqUI-0003Bt-4f; Mon, 02 Nov 2026 06:46:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNqUF-0003BR-M7
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 06:46:03 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNqUD-0005Bg-Gh
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 06:46:02 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8b0f59a5fdeso22179297b3.1
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 03:46:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793619960; cv=none;
 d=google.com; s=arc-20260327;
 b=MPuW9iZH0UiJ/x3gm9FXydTZFm7u6aW6nf4lnLkLa1/w7XcS7ZwrxrWH1/4/tUnRw5
 qAm1hzabGm/2XBuefufiqY24EKaR1CxaoTNoChhr3PRdUQNWXUuvm4t975hEKIl8YcG/
 jJm1VR4oRyvjt4ulv+0s37CjYH48ggDJnY4jscJctLFU5EcnTTDcEvn4yy3RPzZSwNCZ
 fgw9q0DZhJU/9tMVCP3od1S/8DZSySp6fOI2AZBaxV3YPSB7Pt85Qq4bw0QoMIslQ/o1
 ktJL1aZ18VAzVaprVVUAwcImbU+nVMAu7iHojFNUL70dC8Abh19vIS4BQ8bOcjTBnMiN
 R0FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cM+d+OkFK3FPcZOT97afCrApBvNj/83gzoTWtrFajs0=;
 fh=mp07zjuVbIqU1cQgy/+5bX5wkcC6RWgMTWejQ6OhAkA=;
 b=BPUh4LO7zQ0pGUxdrp1i1TlK2stbItVSgAIWXlT3KvlJds8VFBaxCk4WMLsr5/733P
 41w20fXKZDJ+R9xA0085pdcwzWa6NLjDsy+iHt/7RoOnQZNWSMkK78XUFHX3cbQXAcdv
 qVXmXOHLEyTjEHk5NcNjDNzm8smmwaKWvkGpV5vpghmB6wpGoG4jqichzwj503+c6bYr
 2RbFfFCbI5z4jzbGxhGL1j2ecoFwfg6U+ut6csx4+3/2gYsD9S+6d35rNS9KUNnC1ABP
 iewsTXCbiQPW1xjpil02JqLlvEQDAE7WhoSNEAj+bMLfqLe+JzmzeGdasd3M8psmvqoR
 vM2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793619959; x=1794224759; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=cM+d+OkFK3FPcZOT97afCrApBvNj/83gzoTWtrFajs0=;
 b=C61RSYqtps6kAyvmuLQOMQ4vNklNy+JFMJEhCtwMN1zJ6fNEo/ND62l6YYofwXhHVf
 mWbl++4acmrUKRIN95/w5d+zKIFB47I/xqWMG3MOO1c1MgUccYSiY1XGyENy7M/0Dlb2
 x635oITqD8OZiRjxpBqwKPX6jVcsZhQLq1ER5CLWteLuvfkctzkTu1TEEue9vAwT5VPq
 ryYgPMOVCx/0OjKEHsFZVJIjsAGZVdPa7EMqk+yEl4vFg/SERGaWIdR7icWOsWp1M6y5
 n5/KxmCVL3Yiew1cRqF1+3vqC5332Ev6zMEceb1eCEHjtwbmdNd5G7T2PAcaAFfspBOq
 b2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793619960; x=1794224760;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=cM+d+OkFK3FPcZOT97afCrApBvNj/83gzoTWtrFajs0=;
 b=LSyVp3a3sP7UjSRqViOSnN+VKfCLv70qGBUt12letTtEQrEmxfmEzJqyA6MMZnODKR
 5qkCszsofgQL3iBgrTT7wGlSQmjNddJg7VONNn0U7JI6d0Aa5IlItB2hHofwXkwTCndm
 VTLa6WP9IoK2+shX6SMEJ94iP0scAetOLVAwennLRK6b709AN2+Q2sIVvsgOxLGKmydI
 iYSaln47OYXwVgi5yUTX2dH0CqciSdRqvof0jR1abkXJySB/8a0OO1qAFDOtn2o2LH+z
 3endvBne0lZUQGlJLSXYWV5/kpH8CQVB5VW01qZHx1rzHJghPu1nOjqR+5bVCUqdPxSq
 h95w==
X-Forwarded-Encrypted: i=1;
 AKwUvBwiPYTjDlDN4ucm7p8ovsqq06pc0pF47T9XlyQVQ/db+X2pcjUPEvp7t2BdTwwMsU3VdaEH44DKaQ==@nongnu.org
X-Gm-Message-State: APuU4Z8H3HmHleJ1C8KHV/11/fkQSx8kspF8D1/ATPkvjrd3rA1/SyNW
 n09WpN60Sz/8DOCqmIWnTDnH3+sE7e0NmHv5TbqCTr17Xlpw9L/sIoHLzvq3vgNPN7Sl/JnHTev
 ChUaUxAVrB7ZGkbF2gBOvu/Kjw72ZSE0ZcgJ3TfUE3w==
X-Gm-Gg: AYBFou0mXIr0BoVjbYVaUZSqm4pLBM5lH3fHweV+SGGHrIxpd+TnxzTXqWyl7nCawju
 bdRey0tt0R9MT1NlOKZJ1PRn8X8cPzRLNMYRH3FIjYYFL+FMUU1ZsuL+wp5IMF6fwoPrO5BNKUf
 7mxK8xJn8UAPm/pDIPbG2jseGbRXA2BYNIW6142yhiYHtdosPJKUYKU6i1EDN8vgh1Je6i5t+yR
 08QzeK91JGXRUGTI6GRTUy4dmMvX6XBBxq8fiRRegKDhgtzM7YMegSaX5ux14zkDoP6i8lXRF9X
 7eUnkT7kzk+OnUrX84fKSs38XaFT4zUVwHB3rc1bdCGT/krBUoQW8JZ37ccnZJl/O0R9fgu3qpe
 S/vmsDic82fCNPVBnyxiQ6EB1yu5oGpnT2phToTXoFVAPSbhDcUM7LSFKGbtuzYLrQY6v5q1Sfb
 +mFJH0BKbdwGIFAAQVu5JecNAHjvA5xgPcWn29glacFw==
X-Received: by 2002:a05:690c:a845:20b0:8b0:7c07:559e with SMTP id
 00721157ae682-8b2b671f358mr49202097b3.36.1793619959549; Mon, 02 Nov 2026
 03:45:59 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
In-Reply-To: <cover.1793613972.genet-ring-fixes-v1.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 11:45:47 +0000
X-Gm-Features: AclHuK-wDrJgfslnMYOmifVyRPkEII5gwoMgNS-IC5bvGS7LjBqYob_ZN0YKpbQ
Message-ID: <CAFEAcA99W4x7WJPnGX+1b_uLmmyzi+WGsipkxfdkxhSka9-ePw@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/net/bcm2838_genet: TX index wrap and full RX ring
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 jasowangio@gmail.com, marcelomanzo@gmail.com, serg.oker@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:42, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> Based-on: <20261027143036.44973-1-marcelomanzo@gmail.com>
>
> Two fixes for the BCM2838 GENET model of "[PATCH v6 00/17]
> hw/arm/raspi4b: working PCIe and GENET (real networking)", which is in
> target-arm.next. They apply to target-arm.next; if that is simpler,
> they can also be folded into patch 12/17 (implement GENET TX path) and
> patch 13/17 (implement GENET RX path) of that series.
>
> - The TX consumer index counted past 16 bits, so the first transmit
>   across the wrap never ended: the device sent the ring's descriptors
>   forever with the BQL held, and the guest and the monitor hung. A
>   guest sending a sustained stream hung after about 65k descriptors.
> - The RX path wrote frames past the consumer index of a full ring and
>   overwrote frames the guest had not read. The fix keeps them queued
>   in the net layer until the guest frees descriptors, as e1000 does;
>   real GENET drops them and counts them in DISCARD_CNT.

I'm just about to send a pullreq with the GENET changes in it,
to hit the softfreeze deadline. I think what I'll do with these
bugfix patches is put them in for the next lot after that, so
we have some time for code review, rather than trying to apply
them in a hurry and maybe merge them with the existing tx and rx
patches.

thanks
-- PMM

