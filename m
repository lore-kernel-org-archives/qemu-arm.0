Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6422EC83F1B
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 15:21:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZt5X-0005rm-KB; Thu, 10 Jul 2025 11:21:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZt4Z-0004lg-0X
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:20:31 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZt4W-0001xS-2x
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 11:20:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-710fd2d0372so16850117b3.0
 for <qemu-arm@nongnu.org>; Thu, 10 Jul 2025 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752160827; x=1752765627; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lStpNvlclqQGLHSJg5wy7W8AoeA01L1kwc4/Dsb2mGo=;
 b=dGU4fekdmjM2yr1AHOY902NLIikIhx/j/PneiV0fvevm6iMswitTYgJnEWaPghnirV
 gP3+M+/vByWxAidj9nO43p4pf+Ssx1dYKSr2mXA7bNDDf+BRQCpqS1R08Y7FjZW9AQ1B
 jQtb5liCnuqGgBVgXJd+4HBG51bFd+S9hs3H37c5yECVkZgbEtfzi353sK0lM+/TNqW0
 47LF6hjchftJYwgcOpbdr86nqZzBsM+8mkTPP8y7Net65Df2SJ55k+4SOouQ0jKz9prQ
 mg/WEGhCog6LkmzYFkWRMsI3E0IItklo2OUCq9iqMDmSQuIh0nk+CpwKRxNs76Aq6XM9
 qT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752160827; x=1752765627;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lStpNvlclqQGLHSJg5wy7W8AoeA01L1kwc4/Dsb2mGo=;
 b=vo/PuxVdRdobBf9iMqvzDOSq0iebcufOa+e0ewjufSX69oiuOOXKQOl7YrhLVNHSYD
 pNMwWJN+eeQ0FFr5UJ2oxuzPqRxSMySXOjvSnTw07i3t4TjPKWV0SOhgqzJoZYlQyAhv
 NpGTIGSvWF2KvVAe00rXdPyVYngl9X1t1eLorOMKFcO2lwAtsEQjxetOrpCYfxovDZ0G
 nHcX3ZN0ordsS1Uh8I9LS1Uixu6tYTlkQ5nVoU+pfjfVNuhwF0iOGzNJJJJ1wMR4OtEF
 GfblEInRvmnc33qx6QO0NxHsUWNqdCK7vGDRLwheH8Una4csBYVFL7iRG0924ml0BcUr
 Mmkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwLGXgKCn2FCEM20no1zJ7zIUhLRi7P17B060iQcGtc9JvgTwrEv6IHurR5qNbmKpurvrUtZqTGg==@nongnu.org
X-Gm-Message-State: AOJu0Yyi+s1Qu/6p56Gs+3QzMaItAkWFV7UjhESE8drH8lYmDzTh5/s+
 Qcnpz1QFlUeBO44WQpwHgLslzIEhyRMLofqfn4aSaseG1cSBSIftv90QxFJAR6YH+YWDAbQg63U
 XXrFIlBcVmcWQFaoeA2m2iA8W5F9d3rvPoqtu0CDV0A==
X-Gm-Gg: ASbGncu2hYKSDotfSd37BAY8AV944mWabkkx6QTNK/ZcKBfQqDS4JnKMbW5deQhadc9
 SqQde5M7g8W3AXPjiJgXlp3oTnSSq4Q76d6VoqZ5EG/PoKkJ+KCI6BoLY/q6oui9T2EK7C8RtO4
 UJWZNn+2yqaBuY3U4nMzIzpREuu+QOU5upAFNZU0am8jze
X-Google-Smtp-Source: AGHT+IEGFB2jIbBsNQKCoBKAUJcFeenrGSdoTYoGbo+6mPQIitw21TZDUxjNfourt7paa/N95Z0zMh14wTbk0PTvM5c=
X-Received: by 2002:a05:690c:6601:b0:712:c55c:4e5c with SMTP id
 00721157ae682-717c14d8b82mr57192967b3.5.1752160826429; Thu, 10 Jul 2025
 08:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250708154055.101012-1-shameerali.kolothum.thodi@huawei.com>
 <20250708154055.101012-2-shameerali.kolothum.thodi@huawei.com>
 <61464e90-9be3-4be5-a0af-ab15b92776e5@redhat.com>
In-Reply-To: <61464e90-9be3-4be5-a0af-ab15b92776e5@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jul 2025 16:20:14 +0100
X-Gm-Features: Ac12FXwXrK49iN8S6SpNmQv1IC1bvkSc-LrO3vFcRIuFuupyeCT_lLTt9sxkxfI
Message-ID: <CAFEAcA8YYrkwaU3ghdCDiA3rqLVj_to++yg3R69EVY+2dP0R2w@mail.gmail.com>
Subject: Re: [PATCH v7 01/12] hw/arm/virt-acpi-build: Don't create ITS id
 mappings by default
To: eric.auger@redhat.com
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, jgg@nvidia.com, nicolinc@nvidia.com, 
 ddutile@redhat.com, berrange@redhat.com, imammedo@redhat.com, 
 nathanc@nvidia.com, mochs@nvidia.com, smostafa@google.com, 
 gustavo.romero@linaro.org, mst@redhat.com, marcel.apfelbaum@gmail.com, 
 linuxarm@huawei.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 10 Jul 2025 at 15:00, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 7/8/25 5:40 PM, Shameer Kolothum wrote:
> > Commit d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables
> > when its=off") moved ITS group node generation under the its=on condition.
> > However, it still creates rc_its_idmaps unconditionally, which results in
> > duplicate ID mappings in the IORT table.
> >
> > Fixes:d6afe18b7242 ("hw/arm/virt-acpi-build: Fix ACPI IORT and MADT tables when its=off")
>
> At least please could you take this fix?

Sure; I've taken this patch into target-arm.next.

-- PMM

