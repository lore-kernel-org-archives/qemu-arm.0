Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04202F3C24F
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Mar 2026 13:22:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzaYy-0003Cl-6f; Mon, 09 Mar 2026 09:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzaYw-0003C5-I6
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:22:22 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vzaYt-0002A9-TD
 for qemu-arm@nongnu.org; Mon, 09 Mar 2026 09:22:22 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-64ad79dfb6eso10822548d50.0
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2026 06:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773062539; cv=none;
 d=google.com; s=arc-20240605;
 b=hC0D15Xux0ODKVE13hoKTalOXZQsXBXAKd3cnkJ0fT8kiBlyCAwmEwEPKmp+HmiWWT
 o/UmZc1Auiv4BAKCsvUqWkNtwFbsMjAk8U7kRwupXFnwH6vA8KXPPKVpQPo4X3dS+nYT
 s/p17rYEnl/rZkuwDJQr/GV5JPvFefIK+gxx/qY9UUNQFWckB2zuWHR+8xHjrg+Sk1do
 71fd2J4uJPLvNpnUW16GtXptbZO/bGzcH9dlvpz9UaEaFj2dQTlKFInKb5aofGkFGewR
 HUpc86oCernA1AIMlbpTI03Hc5Uh1FIgSdfbwrPAqEVJEWQQ3cwWNdb1057DgEo2VSis
 ZJKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+91wLnR/ml88XGo1yfd93vaRMNM9/VSMNMg2aUuLE2U=;
 fh=nJh3NHTHuhYRJhDjkOiTGgvefUpF+kn9TlaC46/XTkw=;
 b=fw6eXwgi/rm1sjxVOYkTSUIr+fXNm9YHWdLRnzko7t2/qJN5EPrzMrocQCSm4ZARyZ
 JdNgTJ4djEQrStxvLKuo+cpGn3nuPkzSW8yOoySIef0JEO/yYKjejyZRHwVvCtBjvlMH
 ZhyWWRICIlMgoZqsZCWNpT1iRLW6+jvWEZt/x09l+OKOHi4L8rATz7t85EJorD7b5C77
 g5bpVYWR8ve//06mP2Ae7YKanKTHYjQZYA8lZiv+RYgvOmxmggQVgZtT7fCNkt+WSf0/
 x1IELdCgU91U9vddeEBq9HT1mIhUXBjeLkjQwtWgKPVI0iluNrWd4P0hbjYIi6ZXq108
 rf7Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773062539; x=1773667339; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+91wLnR/ml88XGo1yfd93vaRMNM9/VSMNMg2aUuLE2U=;
 b=lL91XeWbUw8rpJ6eOYcdmAr6Ow4V4LBeVZP7aFHVK7qiPC3vjAjPoo4c6lopTIUsBL
 77cnkPMnCyv6WYOKrcT2dyvvPgYVzGvq3S1w8xkD9vQLtIpvER2ppGOo01HQzGbmHNi/
 zMQLLwnZNotWm0PP7Zp6QV413bXCckqWxX7mGXPY88ofBcicLbYK66qWDncrOgxACXpG
 /VaJfHOZ4jn4S+yvjIYfFQtU6HH7b+iRNlkUobRz2ntH7DuUVICGvb77hjlS0ZJmY94p
 cWky4EqBbxCjmZg8G+Mie6JlUI3YZ5AoHZ4lJ9M34D+DY7+/fjRyl60hnERUDytJDVM6
 LJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773062539; x=1773667339;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+91wLnR/ml88XGo1yfd93vaRMNM9/VSMNMg2aUuLE2U=;
 b=OvZRsIQl0iu66tjG2RcIAlTewwfAPQq7wCNNCVLTkc9HrX6b63KSKMbzg/s7/2jkmE
 V9lHUQZJ3iGbrVGCU8MG8onB4LhMTd9m3kDhwnIBMnjD6wdrNLHmbY0Mv0flmhEfl1A8
 I+5Jq8qR3BeZl+Z9rW6URsgVkc3YLjde3JmApnx2mPaBviJU4kweDDNA647aaZHL1whL
 hB68UvKafXOxz0hul0dBoGkMioJ8qmreNtm+QA4QORF57dO2kymmYzj/iZ8Ph0g3LGhI
 EDnI/+UXyCf+/EGcW2gIxLHjghpulqyvDAwkNX+K0l95Uj+ws9zQiA1DMCbd01zaQhqi
 6BLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0MoiQlZvBDcnKf/2vZMyUbpvezMk3PjB9XZ8wsS2ZKCdo+5iiSQv993g51063z/0+DexKTMZclQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywz8dqHJw2m/m5jg9OQBLO1I7w196wJiBis75QoDyzBlR/TVJdS
 Agp4EGza/4mYDqaB8619gPPaQ00OtYkvVev0ZX5obg3yI5GCygDD2uJao0GPTrvU5WYYD+w+8VX
 qDjkRvicovUyVW14/43E0ZPwwpXJHDI+wi2WaGyUVRQ==
X-Gm-Gg: ATEYQzzspHwMh/x/WwsmDNfuX56x7UTAl4v5Sm8yxPGl1nMjnLO9/VxrkcxoqlR3sqW
 F7uXCkDOxA9gqSx0lyt/vuHr+QZmridX50Z+g70FEtG2jdn7fQcYoJi1Nybn7wlIehGJm79wNlP
 7tLyET5yKcDT4QkXUdYROXa0KQN23nIKQl6zWKWCS5Nw7tqNqdnW1Mx4tMr0Cf0Iq/QqIMm4Wz4
 5SrR+Sev+k74ncCGztn59asIWmLZA4SyWLJqd2osVSqoFCCt5V8Ax04ChcyD/2KrMtAyn5ovDpt
 c92/vBZzjPWmp4tUCLqUYhZBzde1haFuxJrW4h8Hyib/hZN82EX2miGL1DU/2MTqpg63vaWfSMX
 piA==
X-Received: by 2002:a05:690e:1a4d:b0:64a:d705:31d0 with SMTP id
 956f58d0204a3-64d14147eeemr6931531d50.28.1773062538545; Mon, 09 Mar 2026
 06:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260306150302.203112-1-eric.auger@redhat.com>
In-Reply-To: <20260306150302.203112-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2026 13:22:06 +0000
X-Gm-Features: AaiRm5297MrNNPxp9AiUic3V-M7z2fA1RZbxUvsrvtEO9j9rYAsEDCDsOzhXyGg
Message-ID: <CAFEAcA8i4aRqCrXRwpizbAeXXQy9ntk3OQofRF3HUXPsav_jAw@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] Mitigation of "failed to load
 cpu:cpreg_vmstate_array_len" migration failures
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series applies on top of
> [PATCH v3 0/7] Improve traces on migration failure due to cpreg number mismatch
>
> It introduces an infrastructure to explicitly tolerate some
> mismatches between cpu cpreg indexes/values on migration.
>
> We especially handle failures due to an attempt to migrate
> more registers than exposed on the destination.
>
> Once the infrastructure is in place we can handle the following
> known issues:
> KVM:
> - removal of unconditionnal exposure of TCR2_EL1, PIRE0_EL1, PIR_EL1
>   from v6.13 onwards. Causes forward migration failure.
> - unconditionnal exposure of KVM_REG_ARM_VENDOR_HYP_BMAP_2 FW pseudo
>   register from v6.16 onwards. Causes backward migration failure.
> TCG:
> - We can eventually remove AArch32 DBGDTRTX register which was
>   erroneously defined.

Hi; I have this on my list to review, but I think this series has
unfortunately missed the 11.0 freeze deadline, so we should aim to
get it in for early in the 11.1 cycle.

thanks
-- PMM

