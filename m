Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610D5CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 13:47:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBBhW-0000rE-RU; Mon, 28 Sep 2026 09:47:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBhT-0000pe-9J
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:47:24 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBBhO-0001hR-DH
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 09:47:20 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 956f58d0204a3-674138cbe59so2149943d50.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 06:47:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603237; cv=none;
 d=google.com; s=arc-20260327;
 b=C3YXOpx/9RVoZjFk2qnR7x1Crl25ZpX04erFSxeFk4dG9G+Sgg0C+j9MChUUWlgAgs
 LWbEVLISnTIH+vycu0qZ2VXXPNDfAJCVz3qWRfT4e+gdFXFK9bSnIf2aGaBLygBI57gM
 zhCJ11gcNB5/v8XAR6JLyzylF43qxoOIFVJa5vHbA+N/QlCnkVmN6RkgV5rqLJj9ePMB
 IPJBfVeghxUgfqpomUfApdaTKY9Uu42YCk7KMarmtMsYmhX8poqSfUtXcKc9/EmMUE/j
 S3S+CltaOkUc5woKyWgqf1clpHdbDcHVR7KhRSnL+B4MTCp0O1L8YnDkJsoYCJMA6IDU
 r51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=D3EhREK3ZFIioeDYjJjTdCtC/aZbDyqG8MQ9EpA7BPg=;
 fh=DI+8W5/Zvwu62cT4fPOEj1oZjnMrWJ5bAjyzLp+HY54=;
 b=eaVTHN83A1CzN6HlgBdc71grSoYUyFsRSMErqr+pyJ0z0Ke5GQ9JAgLjx5P85isbYT
 0VczkhK/DrthE3Xq8vw8w99kn8ZzMuLMn1qp5BsWyv59oz48c9jqBAA7PWcOYZwoLZ7/
 96JY6Qd1UecaP/ymXO4Ha35qG5LzajLaAaiMowFfDRNFWrC8vAPSafk9OIIvKk+mVN09
 HSMTyIu4cAifgMUKmCnb7ewD2H3ZoUa/ediJwdfyc8dUEH2itrX/8kPWDcrkv8FLwfWR
 LKcCDv/80Tr6ZIOUOSIli54Q4X1yOuKbhH2aklw8FDrzbQLYg6GXp+zqZQWUFtzgat0y
 f5Mg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790603237; x=1791208037; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=D3EhREK3ZFIioeDYjJjTdCtC/aZbDyqG8MQ9EpA7BPg=;
 b=weUNMWHwgbvxFc4Me6PtZDUAzMAcQDNcYrMoOVXUqye3cLMN6gOzYOEu/iyRXNAJKh
 J34Z7g7Zg1cs7ATQdXsatIBH+TIufT9m+KgUetljkSI8629U2p6GOBFpUwjpPJEJ11iU
 dw4K3Nsx11PCeqzgmv3P+o91T098SHcDzYq5vIrYb8uKfwhKY3rTi9y6V5EcAMkXwdxC
 h+MBBPQva6CYzTLd1e2flmagF9RF8SESEHp2Ml9+PagD9xgWZuqgRWU02t0DqUOZMYUI
 riwkUy1iP+JOMf1760iPONi1RZ/4enHPdVVJc65/1tdkTeNj4Fy2bGs1pmj9OqUkkQI1
 ahQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790603237; x=1791208037;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=D3EhREK3ZFIioeDYjJjTdCtC/aZbDyqG8MQ9EpA7BPg=;
 b=xFKaqXhzxuDFw7qdlpjxZ1iEnPB+XHUtRKWiEV53Wrg/mfuNlZgCdqPr89jznEJEEJ
 fd/7cDYFyI6GRmLnQS8gDSwYrUoesIyjZuzzoci5UcOrTlLtPOP900s9GWLVl+Fa1Wrf
 IU/0Rxkn+M3e+bB65CDC609ZnyHS4MWcKtIf52eXLshh4HmJmCZIQq6J4PVK6TjoVV0t
 a+0QWDwlYbP3x+v7IAb9nBUEtRbeRNKRhqCDKsC6bwV2Y1lDOeTHX0KnTbtFL1hKLZKQ
 f2XTW/gXVW+TM89MxKw6L2XRMGcorWI66K3ZbilGkWOR4lEXpmEOYQbwo/HgdB3ZHBts
 gIeg==
X-Forwarded-Encrypted: i=1;
 AKwUvByXePBr95hfm/CSJ3yPjvwIZQbzxOom8E5p1zC73F+3zerEAVqZLvu8zH+0Sj6gg3mS6TMcZRWrKQ==@nongnu.org
X-Gm-Message-State: AFq9FYIyoP5gWZ+SczHjhZJU8upAPPfYvO2s+ESw8NavTzKao5TPl2YY
 gjzzzOnw+O7ktYVqfXrIqE+edobLGqpSZ23f9v+H76IAG5M0Utji2sbCGY0nFhaNhxsU91t7CcC
 T80vj9I7yzg6nf5dIH33K41wx+R9vT/0wP2zgFq7ItA==
X-Gm-Gg: AYBFou0FWIWcjH0bXTG96yQzjISIpxjyrDxGC3Ap+jWk4RgH//0xiIwZfwDpbZ1434V
 9cDeOimr2/Zkp78tgbGt+Qb31m7l6xMT/wccXIua0Y1JFpmXJW/JsHWq/KGgAaqtSH1HZ5tVDwz
 6BOJMYgnX8DoZCv/OYeVx4H5uEI9pgrPpTTxbt1Pft1VTiglfSqI5pYpC/Q8aHIkJ1NRvjg2pQh
 WZrYhp0gsvDHh0niR8yyFMAjRcZ+lqZ8GMBmY5tB6kCa1+xUHLEJl7fzj2cw8VW2i3YSHV/fF29
 PZFBBobbeoDKYx7/lZTlRz/hpbeu+cyZzue/T9k6RDiTCbpTxTG3nVRYQmrC79jCfB6VSkc7QuY
 XtdS6uDdHYd9FrT900odQSKcRvFogEq386vXaLTk=
X-Received: by 2002:a05:690e:191a:b0:674:14bc:49ed with SMTP id
 956f58d0204a3-67414bc4ac9mr3058152d50.58.1790603237060; Mon, 28 Sep 2026
 06:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260916165117.39764-1-sebott@redhat.com>
In-Reply-To: <20260916165117.39764-1-sebott@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 14:47:05 +0100
X-Gm-Features: AclHuK_0cWJvuXI9w6ckERpSxL31YnHPnNaz6MLenPc9GBO34luEAup-VxU6JiE
Message-ID: <CAFEAcA9p9X0A76O1Dt8bQEfy4ZsOwXtK-fC1HQ=K4kzEQQesGQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] arm: demuxed ID registers (CCSIDR_EL1)
To: Sebastian Ott <sebott@redhat.com>
Cc: Eric Auger <eauger@redhat.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alireza Sanaee <alireza.sanaee@huawei.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, 
 khushit.shah@nutanix.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0c.google.com
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

On Wed, 16 Sept 2026 at 17:51, Sebastian Ott <sebott@redhat.com> wrote:
>
> To support efforts to generalize handling of writable System ID Registers
> [1] this series addresses the demuxed registers that are kept outside of
> ARMISARegisters namely CSSELR_EL1.
>
> CSSELR_EL1 is moved within ARMISARegisters and accessors to retrieve
> and set the demuxed values are provided. Initial values are gathered via
> the usual KVM_GET_ONE_REG ioctl.
>
> V5 of this series was posted here:
> https://lore.kernel.org/qemu-devel/20260909144151.26803-1-sebott@redhat.com/
>
> [1] https://lore.kernel.org/qemu-arm/20260616132625.1732031-1-eric.auger@redhat.com/



Applied to target-arm.next, thanks.

-- PMM

