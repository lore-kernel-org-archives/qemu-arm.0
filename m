Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E853ACD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:50:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waAKQ-0003eg-9A; Thu, 18 Jun 2026 06:50:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waAKO-0003dh-5W
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:50:32 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waAKM-0004oh-H0
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:50:31 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-662dc3879acso755465d50.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779829; cv=none;
 d=google.com; s=arc-20240605;
 b=QHNIeBm4Qx+BtNq1g6qDKKQVUloPhRnMnkVQzPR6Vmpqa0oEgacvMk1UmQOOayl88c
 sr4/68Ql/JeC5kSiUw2YhoOVVrSIWcYQEhdQhiljNssB9vIB5QiR9ugCMwsXqDtHkvI9
 JOrj/yIqHN+0FTSxykZWViTu6TvgeSDLqlAlgr07UK0E+zhbuvMoNyMmaS4xY0ASQKWa
 1QFNlV+DqRp3Nw07v6u2wXpFL5XC0sjLubY8DfWhj29KWLwLoid1NOA1Xp7VgS1yxA84
 E9kRt/KYty2kGY90KVhX0H8q2s7pdJyjqS8+q9aXIIQc5Zn6dCe0CxGT7Y5QPCoW4rjQ
 5kmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=/K4CiDUbzDT4I7+ZNcqP46vQLFKnFUOJzNTb8XQEagg=;
 fh=7D/sMB8yMUbzBwUczsK45xcb4au+gaUYNUmd4zM141U=;
 b=kt6pROtLznjnZV31n5/wjhd6E1WasXzM7f51m9wRL9IIGGtfTtGlE5xupPLP2blhrM
 heRBxfoYjkBUsD+ITBFIks+wtthCzk4rLIZ6o/CyVVkh8DaLEv7a0K2+nJCpnWEcEPOt
 7tZyeVhoLDeiLAVWrkkXFTO8dKJH0Lp0u2tIQpa9Pj2k4k/tbL9I2RbthVU8vVyxaeBe
 oWAF4G2a0pRw0YXfcUpzGLK8LzLUFKvJ+Y8lvqqkuIzY51OPh0ISPnzURZaJwClRi3Am
 L+LLzd86aEWG4kDbYzQs5P2kCI3BEbceLYVq6m+hrzmsvaoyYw9dpOOzdxXvDEpPRLDy
 hU5w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781779829; x=1782384629; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/K4CiDUbzDT4I7+ZNcqP46vQLFKnFUOJzNTb8XQEagg=;
 b=BXVM6E+UDxYa9gS28g5z3/aevVYDo1qCYwrIsAsFTaZDss7c/eGm3IVQova9k8CvnL
 NwyDZ6arTPU/7pKSGQt2xsRvIbDrLfAbiopE//ISuEa5djAXA2A9Cr1Eh/lwxii4awN9
 VMzoHBeksRyobLKCUrqT8KD2vy6fZoOJVC+1+yCCB651VClwT9cXQvFFrwP9gwLL837A
 lpvoMZdSbDplG4XtK648xv9BDFHClI+whHkPoMyCgvoAFnNkJaeY9xfIEPaJ8+5kvv66
 pSgBk8blIS236uVCEP7kIhnPFsPg2TY4v910ImHcxb+k1KrfsxHqjnrJrcy0QLjti/eC
 P8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781779829; x=1782384629;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/K4CiDUbzDT4I7+ZNcqP46vQLFKnFUOJzNTb8XQEagg=;
 b=dvbyRnrS+HNeN2BtLGTR5AVNpiBiYYGhK8eGGdaR8OEUOAgTT0/Jx2YmQAZDtnx9Ia
 kbC6pz3V4rUd6hDZf0FYZLOVpBh7VmJfC6xewhnfq6qnBdtp9WTwhpdddoatTtmss/Hs
 gPB/Rt6wtTf2pwOvEjJLyK15+oB47/rQ5oe+5JEJe4rVbKFhO6Zgu0HT5sUDVwifkmtj
 5DZrkGFIzY5VGBNaSA2iM3kXAiZbtRCeWSvWhRvvu51gJihGcII/ShokeI+cN2TDAWj0
 9cp+8fwuuaxXE64yNoX9HeVA6b5g81dPcIWfrANSjJFRv0YAJDlrEOmNzppykllqW0xo
 PpSA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9cMBjjV4Rq+QlMpJ0hYeLjrwMxoPwjTn4igOcvQzKXYMHwkpI4uqmx/CMoeIFu8zIUNHk+KJRipw==@nongnu.org
X-Gm-Message-State: AOJu0YwvwtQHdSLLZTP7Q1BOu+/co21VcrxXZNkvcWWUDmS+S8pQtZLO
 wreyvKr0hhNw78HI4K7MAC5mkm8ExnxsnnbAkSflmGvY3x/2H9unMV2+qykcLkCkCYweQ3slgx9
 /ty1SSZmFhBJiN6GUKIM9MHZNHIkmqPnQ82acAi6F1w==
X-Gm-Gg: AfdE7cmVFkWm1I7JBtL1dQFIrRKvo9cE7u9qgljomXE066TnaM6vn1vSVw84BJzgnb+
 v5vL7PR1YVVSgDhSIPs0NN4maW4RyZtlk9PVPEYQN+ryJxmp+e6rBWMe1eC95MjLCzN0UyhQ4H0
 3fsq+PKSsyQbmbj+g37KadxhH6gWY/N5qGxXoMgMQp8HutqhOqOTrzl9ASgeXx9MUd63JbB3Vsi
 EPtqXZxH3Xv+fEM99GAGL1XBSKtz5rUzelFvHSyzJdGHY25GslJFb9lAmnzh9Q0E5r8+TX5ivpU
 AQUcTQzV6M/Df8Ex1vlZLQ2I2ip12MR7hMQogZn44hGaQYAQz79uhlXy
X-Received: by 2002:a05:690e:d41:b0:65e:5aa3:9640 with SMTP id
 956f58d0204a3-662cb9bbcd7mr7382103d50.25.1781779829056; Thu, 18 Jun 2026
 03:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260618104654.3840263-1-alex.bennee@linaro.org>
In-Reply-To: <20260618104654.3840263-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2026 11:50:17 +0100
X-Gm-Features: AVVi8CeV9ZILRtwNquhZr0S736TdDOt9YatIrliXJT5zIwqfWL-KFcgK2CJy1ds
Message-ID: <CAFEAcA_TgWCqVOBFfbQmPYn2zz3EEE1dKesecr1=ULajz2Kw0w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: use cortex-a9 mpcore base for CBAR on npcm7xx
 machines
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Arnd Bergmann <arnd@arndb.de>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, 18 Jun 2026 at 11:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> CBAR is an IMPDEF register and according to the A9 TRM [1]:
>
>   In Cortex-A9 MPCore implementations, the base address is reset to
>   PERIPHBASE[31:13] so that software can determine the location of the
>   private memory region [2].
>
> If it doesn't we will confuse the Linux kernel as it probes the system
> SCU registers [3] and erroneously assumes the system is a buggy Aegis SOC
> and nerf the emission of SEV instructions, deadlocking any WFE's in
> the kernel (or QEMU smpboot code).
>
> [1] https://developer.arm.com/documentation/ddi0388/i/system-control/regi=
ster-descriptions/configuration-base-address-register
> [2] https://developer.arm.com/documentation/ddi0407/g/Introduction/Privat=
e-Memory-Region
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/arch/arm/kernel/head.S?h=3Dv7.1#n550
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>

Cc: qemu-stable@nongnu.org
Fixes: 2d8f048c25ab ("hw/arm: Add NPCM730 and NPCM750 SoC models")

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

