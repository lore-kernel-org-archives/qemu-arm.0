Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD124CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 10:27:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64u9-0000am-0U; Tue, 07 Oct 2025 06:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64u7-0000aX-S0
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:26:47 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64u6-0007Oy-Dm
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:26:47 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-72e565bf2f0so68239317b3.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759832804; x=1760437604; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CJfBaHSeb2p+mhjbdkTcOnUg14vCHi5O+7cpMqX2D5w=;
 b=ZzAFQa+VJVTm2V2+tRkTJ0eKVWX3ud3w2EpqukC7k83vYaVcCrrDHfSc3iVsrKnDOd
 hbPB7fX/q1zErczfP79RLhMIK88OWIAmw8Y3yTFY4nmHsiVeFEY3kwBvPBygV2iF1NE4
 g1iLoa9/8kb2tAFLtQLoECCcFAMcRp+CycRaWD+5lxbqvyX3zrLVYM4GqvpJMx9CO/0Y
 216JiUpNdPVxbXYRVjaq/uLfcrLtfGJF92/DouuR2JEsiPyPWolqpcJVuGZ0AgkeObMH
 S+7Lzdh7n6YVA3aRwA9cQTzYORe7pHvZM+573Mh7lo9hTmjsYeFNnV5tpJcR1aH8dIyX
 G4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759832804; x=1760437604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CJfBaHSeb2p+mhjbdkTcOnUg14vCHi5O+7cpMqX2D5w=;
 b=PLCt2GssmYMaq/ayeWJ+KEHLHgIXtIohWvfGvB5fYK6kVePDn1SV/lqDnutTBporqG
 Ad88yWWw5MqqJMT5JPDQjRr6yKhm00U79xne4TxqOBYRtESNjoGiJ9oMhRuM9u19iZ8y
 DzFF//TmXW8di3WsJPH4D8ZkrV2sZ8wAKbIsf771AjGBafDCYjLmAFLCYCa55iSh00RQ
 5iaEJ7SP8e3+tEGgVPzUtl55wU19UhLBcVWqX7yDwW6qFGlaPgoitOyZl2pSg0C/FsPo
 nmMqY0U1sKP60JRmWZOxUlJmeovlFEMceMzGurjOV7k3sLGZhuI6fl2k2DOkIatUqUNP
 X3TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXta+SW3J0z/TH5tkfDrwY/BkKMKStJuuA6h1ouuxGS4sMmn9h4tkrCnPVoem+mpANB13xWl84XtQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx0ilyrVp8Go8WdyzWtVPblzcnv12lBEDOyZIIuvPgDsP04CI3I
 Jgt0v02p4IjJCjrtA/nmXk52ixaT6u8GWV1d9LPJWYOvdDfGhseKuWJ8P4L3HaHRlPZB1O6THjN
 P5ICEoCl/6JhS9PWpK1Mnak75i0mWS6oxepWjY6c1bA==
X-Gm-Gg: ASbGncttufSY4nhF69NzYywRHgC0XpBCIk4IMAp0B309dnJP3X7dGgKdNOWvhonu6Sn
 HrPl9a7Aaa6zMhXRPurhhXxFxOVrljx/WBS8kZNP+IwQGJvke2HsjbO6GFwoJfvjej9zE4OWVZi
 njYWxzJW/2U+P3z+5mbR7w06sEP7Y+mf9yYc3rNMebjZkShcTKI/TkII7hYakPIq7O+Fjn/rEhb
 5Ub+N+KF2YGTnN6Dp1y7Pu7n7lYgyty8DyT
X-Google-Smtp-Source: AGHT+IGjAR7oZm3W0hSqPgdWw693/wZ6pY7k31QPSErGKdxfUD/dNifeSsKibkCCYdx/v3ytybXm131wigXfIeQFWxQ=
X-Received: by 2002:a53:ba89:0:b0:633:acda:8c77 with SMTP id
 956f58d0204a3-63b9a0724b1mr12888115d50.22.1759832804327; Tue, 07 Oct 2025
 03:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250926001134.295547-1-richard.henderson@linaro.org>
In-Reply-To: <20250926001134.295547-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 11:26:33 +0100
X-Gm-Features: AS18NWDwmlEkC2hOyR9yw4giDNpAU3Vg4AK4Vrg94-BQWq-H3yYA7jaABKrp8zY
Message-ID: <CAFEAcA_th5UvJOv+a8L6Ezw8Qc-isprCXXUuW3HVCXmYprc1Rw@mail.gmail.com>
Subject: Re: [PATCH 00/10] target/arm: Implement FEAT_RME_GPC2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 26 Sept 2025 at 01:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that patch 4 will conflict with patch 5 of the FEAT_GCS patch
> set, and I'm inclined to think this cleanup might go first.
>
> This is otherwise a reasonably simple extension.
>



Applied to target-arm.next, thanks.

-- PMM

