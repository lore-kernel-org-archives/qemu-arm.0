Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6C2C44524
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Jul 2026 16:25:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wlqoS-0002sl-KF; Mon, 20 Jul 2026 12:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wlqoL-0002hs-Ce
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 12:25:50 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wlqoJ-0001aw-5t
 for qemu-arm@nongnu.org; Mon, 20 Jul 2026 12:25:45 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-80dc4a68e4aso80288657b3.0
 for <qemu-arm@nongnu.org>; Mon, 20 Jul 2026 09:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784564742; cv=none;
 d=google.com; s=arc-20260327;
 b=qUBVDYr8L122a5wtOOyPttPAyAoqYjSii8hR83K+3Jvtf+acmVzzbf03XfirLZoDP6
 xiYO6Aj45qBvIc2lRpMCM/qZJLN6BJkegpCxijF7UeYdL2aWkiwfFS7H4mQ3qF8fLmyE
 dC1X6lkqTzrpgcuiIkTJ+toz2BtvGV5a9400flis5K96t5ofTz0UUmHS5G20k96qHu56
 uKXcp66PaQCowjQFBPBXd0lGhln/wA7oXkJpjEOxQNWOE+gmODG7gDg5EdSFS+NfE6mU
 W38Zv8S8K29sUX8zBQWVtx0dxSfMpuTD5hfO0+Ibic8HQgPezwX2why9iKSCdiNACbfB
 iZhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4stJnlufFrYX2bqL3aW+PyOpKqwq+AN0KLFnOp2Kpbw=;
 fh=2yy7lSv0y/8uPrKb9JOGDVXrkV/gtXzcydx2yA2DRtY=;
 b=T2aaeYBamv/ajQpwxhKwqu3lSvJJg5o+Iuj24v9wdf13FV7wHsak1GyfuqvX6wuQJK
 W/yma7Vuh9wnC5DlZjkq3xKp3UTDRfl5NBEHRGhfYFN4+MjbRdMibFPVQtX86tToiBbY
 JhQzYtPrZgh6idun7gWdqd588pw+YC3cZHzvyledJgJwAlcTOjUANQ1rebjp+huDwM9E
 6kGvfoTO1OLhE9sHo8qxQ3E40BU+mJ+p2IGwoZ8nnlDirVSUproK+QzVDuMZhxJkqDQm
 UW+1lgHBJzIh66ysjXR8Ee/rJMtg1AD8Rt48UeFlY5RK+9/Qb1JK3FsJytkdk/KbduEh
 CDBw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784564742; x=1785169542; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4stJnlufFrYX2bqL3aW+PyOpKqwq+AN0KLFnOp2Kpbw=;
 b=Bx4VKQwsttmi/1LkIJ5XTOaOQyrpjLJj4K0jz04L47m9ukG9KY+XkDy8chYx9FtXL0
 tgL6e+eJszbssG/iZ3bs37tI3YtUbNYmaiWZ3j7JpP4q4EEF4rKp8+NwpcuKtN/NC0/m
 DU1UgSPyF/yjefkOxA6/00eCVLq7NYVsAYs5w0symMHLjzWISVLPs8kAjhng3iA/MpU6
 yymhc+a5OClx/ZkCqsPIDV+tuwTx301nLkptlk9BsgCwrXeySixxNRkfvIY0Jg+HUkAF
 cinZC3qq3T9SivMBSEB9edQLRvddGRmU1cfp8frEmAc/QBEWZkFDA5mLdR1RyQEddOXq
 DuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784564742; x=1785169542;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4stJnlufFrYX2bqL3aW+PyOpKqwq+AN0KLFnOp2Kpbw=;
 b=N2Xd8DnBv08CoWtAAs/1a0ilfgTU5sBSWFCqZX4xTl5au2o8RTnDz8eF64Sn65FFKH
 B5vVndIZLoJcLzSh7fhGQJroaaRBNVw9yeqSI6As6/0YsMkG4eLfy6QvLwYNq6FbEnry
 7cLWF3WFTjllicr0ZoQFtrpi8O1Qf07TP+W5cf+cIbsfzVkQgs8oxoIJHNEgSDYmFz13
 BmxGpyM6UjB6W7zduK+A0iqgZTBA3Zp1MvTq51znlXDpe84gRvp4LrYuyUf8H2CinR5i
 0r8WA3SBhW/+o6ywi5Zh5748i7XnLvQjZS32ykZI2dxi8yz6gx40MNg5IMz35M5Rc/Dl
 Nqgw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpi326fB/dmV1WZ4XJ50CmgMY+vGyBSUGQkq1I73HdouTuPlBfFpbWEcPjHwq6PoPgzFcua1kmHWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz4UJMlBm8jpE4mUzUoHPtCu8C5MdRfae0UlfnLzeqjWZjKU6fD
 6k2amX/8HS3JGaickvJRAfaU3rWEvWR35pGE27bn7WVJaMm9Nkp5xXClPi4W2odya0Qk6SoJTGs
 ukmPFa+vthsEPmchRkBmsGJRsfS7nvMe4cR8Q+Ja4KQ==
X-Gm-Gg: AR+sD13NCY9yyXP5L65sJECYie/bOkjzL/uafAS+RowtkuRu51fV253KnWX6yCHqbbF
 nQhpWKW79hBnRdM5vKdYzSjs/RJI0scatGbksJzxb8nNtcRbDZzYdRP2F/4SSDjPf5tlIjdgOh3
 sjhXyqNLl6DtOUIFef8Idu5XD/lqNNWAFX5bTtrYgjIbGfF3i+BeJHplZcXope7+TYDm/pZScxc
 v0o4LYFbL3RVmrlISl7YFN3w/tfdsfwC6Ey2NoehcfkEeD+ZkF10RbdzbKCjH3eLiaY9ZsFlXdZ
 47JEh1N0CGGIyYejtZDIVQXsjlTCw/NNfaTCVduL3nCv+g==
X-Received: by 2002:a05:690c:64c6:b0:81f:2401:8017 with SMTP id
 00721157ae682-81f24018066mr1204527b3.51.1784564741883; Mon, 20 Jul 2026
 09:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162321.3497633-1-clg@redhat.com>
In-Reply-To: <20260720162321.3497633-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jul 2026 17:25:30 +0100
X-Gm-Features: AUfX_mwVEx_D4OhUv4vto-foAMLrcSBGAb1GrKbSvUhqjEttupHuI7cJxqLOZTU
Message-ID: <CAFEAcA_bRH+YW7u4oF_7ccC8GqYZuhonBCgHMcX0N25P8MxfLQ@mail.gmail.com>
Subject: Re: [PATCH] tests/functional/aspeed: Fix remaining hostname-specific
 login prompts
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, kane_chen@aspeedtech.com, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 20 Jul 2026 at 17:23, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> Commit b04746bd0d7c unified boot completion detection on the generic
> 'login:' prompt but missed several SDK test files that still matched
> on hostname-prefixed patterns. Apply the same fix.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4059
> Fixes: b04746bd0d7c ("tests/functional/aspeed: unify boot completion dete=
ction on 'login:' prompt")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

