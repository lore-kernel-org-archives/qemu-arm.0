Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0641E10AB830
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 14:19:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w682B-0006FN-SM; Fri, 27 Mar 2026 10:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w6827-0006BS-C4
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:19:33 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w6823-0007UF-1l
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 10:19:31 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64937edbc9eso2080435d50.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 07:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621164; cv=none;
 d=google.com; s=arc-20240605;
 b=XHEXJxvPjfR/WpObD3cBmV5Z1UvJyi1pKYX8tqNW77JFPZHfXNQdoNR+B+GRWxf0Zo
 jLxnKfUYDA+5sDB9LsKXhJ/l7ZwtVHH1uFx9FdFDkWtIuYxRePo7DllBoPNVhQkUs1Pj
 Roivm8hj/nJbsySqoAofM4b9oJ5zHUTs5LT6TGgcGpIpIXOMD60wDtpW+lN6o1UtNCej
 cjjse8hHTU7/kDgVnt5EUkHYGxKSSYBi/PWFrukmveqpTzuWbje1DCDjv+IkWCfgkkNo
 qADzKMtwPxTl/eScjKldYPpV12RMJ73cny2qeki4BZqwvHaP27TZ/n1jEW7B5F2P8Z+h
 yCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=4WjmeaXgV82+aZtxwTz6uUGHzaGhq1ymgyGOqGfqkNs=;
 fh=bX5F0phiYcsDbzcx5p62OZQJFh6jQGYwqXNqLkkcnno=;
 b=Ef49OFeFh4lRpcOFvZSJsvj035IDbENMyyQ6tXeNeQa7W3DVkABMJG9xzixm9MAN9a
 7VYshNg4OOGO4h2msLq6C6yW7VFsf7ge+pJzjgd+UaThy/xVoKNfbV2nEJnJp6RABvVd
 zvwFuZA7H1ywQmX6OdUkJmGwJZZnIJdzYYCJ9hY+uDDSS7KPTpQiCLcfOrVtltzi7TOQ
 8CP21dDPSoWRnEYrjhbtW7em7ELxRGr9ysOIOTemZbiE9/ZnGi1I+zZy5PDjQ33jl3Qs
 sybbbqf0B5DjQ6Df18Pcw3oTdD3cyVCmtl3ZDTxRFbnHPWCWFQcMFeLjlMyyeCB32XhH
 RpOg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774621164; x=1775225964; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4WjmeaXgV82+aZtxwTz6uUGHzaGhq1ymgyGOqGfqkNs=;
 b=E9GO3Hs5UEJzTOylNTclcKT9dATa9kBCJVuzKZZ00AGOXS6aqsbCgWXWF0dCvPN4qA
 Etsy67mE0lE19UiguMi+bJW1que4j3SZgnVFXHEHtAXtkPVsuiKqe+y106CoY/jEwLWd
 r2YuhOppvIDzE4w7UwPQDtXsh/KlaO7KnT3CDNIkD3IGeRJYAdHUnYFMTT/DwxGtt1ac
 a1CJNM4X2zsJhM8d8yOnobN+gutePvrjGvf4fYvpkBSjee/ngjab9SVn79yT9fQyDcQ0
 ZVK7Zzt3tYuZJIRpzGFI8xg0JBTFcn6maCgHgJsd6vruYIqjg9eW9UcatSZavZ3Gr1Uo
 UgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774621164; x=1775225964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WjmeaXgV82+aZtxwTz6uUGHzaGhq1ymgyGOqGfqkNs=;
 b=lxiBEbvOrEsT6smWd1FyvjDZDDOhgt/6qjiXvCQAL32IchN4DwDbbfRQjECkIQeTHY
 DpHoOiHSPKS4ONAGgk5GGM7lHf1y09ZSb1ZgdXxGCd+OI6KTui1/ZBNdF9/DLeihE+Td
 mW5FJ1/2D3Zcrc2ccK5EIwqfZGsl/q095UyPg7zViVQsmmJvuEEORwEK9zIzsbqUM3hY
 A/r3/IKcaSdzStZ4TVVzyllKvMqrrNTgA29E6OaTzeUsTUPpRTdlpSCGPjfNU5cOlzvy
 ax5Fgp1hXK72EEswV2ZM1aYcuARuNAeyQ7kGyFmfmgITvzijR/aDv6vHmuc4RMyswjvM
 AC1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6wmEOIHIpq9v4En3h6VMgNstO8eozO0Y6mdFFzwi3YfcqAXtchDDBlFg/bXMPE65cdDZuno5rlg==@nongnu.org
X-Gm-Message-State: AOJu0YwDB+Wex9q2O22ElDabzB7YAA9cqOQAag8z2A3KXY7PNkL4w5D9
 r2zR7cPRbsYJSaMrjS44qcXkmCydqh5JboqqZuYJaPmcNKXCVWJKzaYsrfLmJINIPIUrux51CZD
 qY2MGD/uK8BcEBPd9hWdhxavhasAUsk/4DC+fcT2QCA==
X-Gm-Gg: ATEYQzyhVkBfV0mK5tNyREBKyvCIXFwFCJR3HeUS0x+96glHsR0I9TCwtT926uQ4ODe
 N00KwMyY10KYrfWaiUCieBWX1ZVz/9WaEfjofyWeOm/99O1D2sDYiN7Xlt9chEB+NotZrap8dpu
 4wbM/EE7LVaZpsnzIxS3fMeJ1pqlcv7ivWua6etaJVWpgG8reuVYPsTqG0P3X4g4iI3c0yjRash
 fnYk3ah4d1LJhd1PMpufnSLx8MwoiYOmhV0WnwadCEj55AQJRGXJk0+lgs/Ko96fRmhXelxygkg
 PiD/0b6XihHC2f6rPYqYC3+o9Pzj2BZ/Oo7P01h0fhr3zS6VeMXnZ6XfLMu03yaAOlE=
X-Received: by 2002:a05:690e:4810:b0:64d:6193:a760 with SMTP id
 956f58d0204a3-64ff71d6b38mr2131553d50.27.1774621164224; Fri, 27 Mar 2026
 07:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260327134401.270186-1-kkostiuk@redhat.com>
 <20260327134401.270186-12-kkostiuk@redhat.com>
In-Reply-To: <20260327134401.270186-12-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Mar 2026 14:19:12 +0000
X-Gm-Features: AQROBzDFKAtaDnZ_CkP8sLNQj62KF0xDt5c24sJEJyOSFn4rOw6Vt4Bc3wmhX_U
Message-ID: <CAFEAcA-7uAnDm56JLJh-ASDGdSAv6EGoB5NNcKtbVGPuZzAYPA@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] osdep: Remove unused strings.h
To: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, kvm@vger.kernel.org, qemu-riscv@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 27 Mar 2026 at 13:45, Kostiantyn Kostiuk <kkostiuk@redhat.com> wrote:
>
> We don't use strcasecmp/strncasecmp anymore. Also, we don't
> use any other strings.h function. So this include is no more
> needed.
>
> Signed-off-by: Kostiantyn Kostiuk <kkostiuk@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

