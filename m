Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D18CCFA1A
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Nov 2025 11:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vImUV-0007OW-0k; Tue, 11 Nov 2025 06:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vImU4-0006nK-An
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 06:24:26 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vImU2-00013g-SM
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 06:24:24 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7866bca6765so33379887b3.1
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762860261; x=1763465061; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WcY7qXm1KIBGyF4OCvuAoUyRqQhFOzSEarmV+Skm5kI=;
 b=N9stHXkkVqJcbGM2Rmt/j5Dl2FbK9S2fqDfWLFYWMCO9ZqFBkEHOmloXV/q1qcFb/Z
 2pI7d08LefcJzPKD/zjfmEgbXvm516X/mta+CA8OKWFnx/3oqLCfupsCkVnwagOaK8Lc
 FCJA5/hWkNThgfiawFLqrTeD65ItlJXmnay8T7d65wy0+9qq7AEaAQaTw4iihuSOV8hL
 SUPfkJUbA7rT42hs+hAGrjGO5qUXlD2AbG+4LI5KTmVbyED6mXbtG2uzHQy7MFHwl5fk
 4WPAulvPHZX2ZpjljrB7CgwD/I5M9OXDy6ydU2llkI0QViw0h/jOvLIkyDsZhIuSJ7ge
 2a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762860261; x=1763465061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WcY7qXm1KIBGyF4OCvuAoUyRqQhFOzSEarmV+Skm5kI=;
 b=hHu7rH4a6DKglvUWcQnPucXMmL+szCuBXYbWIzm3Xp0ze0bx7KgIUI0mgeE3RR4B4N
 A8MoTRMo0mXR/M5c/yPSPda/rGHilixqk3Yt6KeC+juVT6Hsn6PNaxRNPzUl+uX/MXDF
 45IyygGEovPX9gT/fYx2h5OowBI1BVGzSysIYrmmqGFm4epSBhHN3IWhpJogl8tKc9qt
 cRc/SH9/V7HnRhau5bZetSRqCMrD5eyzGO5GnCDQQwYHGn3UTAfWwd3F5oTmSr37Vhk2
 QT8IVgedcq5EVDIQBpYvDPOzORCG/kQVxNj1GFfgsRVTEXgI4HsVdyghJiR1/tie7PNv
 jmiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvsQ5NGqf1YuZGEY09Qjrgd67OMnoPojKmoT4xmKiBB9Ez2QcmzzqDRM0yBRcs+QnG4wcyUTY9bQ==@nongnu.org
X-Gm-Message-State: AOJu0YwGjKo6j0F6c2YD3H38KDGCRw486v1s8V0wdNfEru+G3Te+jNqR
 37p3HtyzUoOjHmL57ymRymxWZZl6i+EEtlFUhiS3Wo4osj7H9s/ugP984jTFJ7R9Dtbg+aL28bY
 uTw570j74MjfEMJGwfgjVumBmp2I3QChkS3DCr5NfBA==
X-Gm-Gg: ASbGnctkgrDxpuVkSKn2ZvBxnkDeJporfMk+G28fflXzJKQ+UYQyuAE0mn+s5AUs+2d
 dn/onJzVtmb7FxzQVBs4muROuYjwe1IMivNLd1/QdbeXKQGU4rUbrIDKcBdqFuYmKLaIgJN9jzr
 cx1QnFVqAotOYtc9F+w1UhFM9y0K0OlVQODWc8AIPpYymfLfp+idvKrd11mp6bPY9hcbAGSxGOg
 Y7g4H+Zn8UdO4Vy3LMZoLiE/mlgkcWHSv9j0l4GwPemOuVa+Q5Kzh50Y2eGtQ==
X-Google-Smtp-Source: AGHT+IGpPyj0pTulSPWP8p9SkptX98IO3pHR3PUxhluogXt4Pd56wFpXTYvaC/yZcKf+m3CSY+bdGROHTR4eaSfXpzU=
X-Received: by 2002:a05:690c:c014:b0:786:8ce9:3b55 with SMTP id
 00721157ae682-787d53625ecmr80492517b3.5.1762860261251; Tue, 11 Nov 2025
 03:24:21 -0800 (PST)
MIME-Version: 1.0
References: <20251111105429.3993300-1-alex.bennee@linaro.org>
In-Reply-To: <20251111105429.3993300-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Nov 2025 11:24:09 +0000
X-Gm-Features: AWmQ_bkCn7uxJ27SoxbLjgrFeOgm2PxXoLp0jMgLNcy8eusSVGzrWNASYMkzF-8
Message-ID: <CAFEAcA_AUxECwpnfuoz28fUrwrMtbHxgesBwGscS_v3ocw4KPw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/dma: don't allow weird transfer lengths for bcm2835
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Tue, 11 Nov 2025 at 10:54, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The datasheet doesn't explicitly say that TXFR_LEN has to be word
> aligned but the fact there is a DMA_D_WIDTH flag to select between 32
> bit and 128 bit strongly implies that is how it works. The downstream
> rpi kernel also goes to efforts to not write sub-4 byte lengths so
> lets:
>
>   - fail when mis-programmed and report GUEST_ERROR
>   - catch setting D_WIDTH for 128 bit and report UNIMP
>   - add comments that the DEBUG register isn't a straight write
>
> This includes the test case from the reported bug which is of unknown
> provenience but isn't particularly novel.

The emoji in the comment seems like a bit of a flag that
it might be AI-generated :-)

I would at least clean up the comments to be more in
line with our usual style and degree of detail.

thanks
-- PMM

