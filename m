Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805BFFF885E
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 09:35:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHIMS-00051G-Fp; Mon, 27 Apr 2026 05:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIMP-0004zA-9b
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:34:38 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHIMN-0000ih-VS
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 05:34:37 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-79ab5fd969aso109639307b3.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 02:34:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777282474; cv=none;
 d=google.com; s=arc-20240605;
 b=GlpDao4Y6OfDuTE/D/Ivf9a7Ax11iDv+WTdayJ64JGm5GY4qtuuw7I1e2CuIp69CNS
 MkpNpOazXg0JOQyzaIIMOdAwUnbXjCdkumPEDzFNShPy8v6s8Ji6angoEK1ZV2j/WTLs
 4A4+CxwD16bhInMg9jJDMIReUFv18kMxtRJIlJ50bjM4dx4e9BffVGnVggZMds6ZzC2x
 49gImyAel6Bjl7XUj+c5+xOXVgPimu9ueEOz04oU0x6gVwHbhRGFnidonXaHovavduLF
 NmmAWyeNEF5N4cfXsliiFcchN9ifGg9YzwVmF+nzQtM92PlVz2+j1H4yFtO6sgX26LT/
 1zPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=j8eCnf4hQDjmLnHyqRUzu1wlRsZ31O/dfDDbavavQnk=;
 fh=A6e1OfMIbwstKohpa3tY3Fa648dG/F5Ue33HXRf9jak=;
 b=ZyuXr1iYlwc3z+GKyugZP2qUxIx7G3vKQnXO2r6Szb4josiwajXnBgpcHFl2GKo1JF
 z7Vd2IdZDwN18Ljzee/nC48FFAGpT7XADdb5nvqhD6PreeCiZhpdYIfrWTcIb2Uzub1V
 V+PB2G5W63i2ZzfbEJYGEd23qDyS+O0Sfr2NJcP2g3ayblSPgkLmmIFx8FPrDIA9z0oj
 AlK/JrESiGqNlIBX5z11gMOc45PR+gsxPJjqaw0baoeXXoKPW55Q59myIymiYf0ePotX
 6vAE8hU/wtDcctsNoqFTfXH0oAlIQ6ulGP7kVktxlDWLMrvdL06epeyryzr8Si6yPw/v
 65Hg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777282474; x=1777887274; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j8eCnf4hQDjmLnHyqRUzu1wlRsZ31O/dfDDbavavQnk=;
 b=n7FIXrCpHmTvFRAv0lbGFVvfvw4xuTf9ewEPLC95grGepa6EsWt3eb67ar3/CaTotw
 9gkwatNWVNS3FhCbqSy4jkFCeBsE5fh+Wz39ytY4G6NdJso82oQz5eL1UnmY9Oend8WJ
 XDkOkU1sWR4mQ3AefT1ASKIjVrLs2u/NQGq2kTa++HeTHTP7tS58cIduwtAM1ebXJzQS
 uFYHuCUEwFuqEPm3Sr3GEKx1Ih0kewpI4F1FHCPD8OlSqxqhHWMEeNHoIDBG/e1ico9y
 Dw8ryR/8uMEH0aj9KUgQp8j6PlpJgH3QcxnQjXG67NZf5xMa8BA/1EXFNilDuSsVw1q2
 Itzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777282474; x=1777887274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8eCnf4hQDjmLnHyqRUzu1wlRsZ31O/dfDDbavavQnk=;
 b=jC0NWrfd8hhc4FObjRokJ9p6h7Mw8mnYizxoHSypTz45Wzw41TPXaDpNU0gZXVc8xg
 W6T7pbfMlTntzOZO+OMqiWoa+k4621iZSnMl15CCYAYq6NjbB9JNDyOyvPZ1J8ruqAhT
 rJ33B9D2rnRCRLsyXfU32GBWF6DseHWWkJl2FVECqOqYqiM8mulPtYQNCRL/QqvT5wsN
 340Gj/4dV7yU51N8vMrvwp6F0+Zy3mBk8fciaat1gNUalw4wc0mIHx6lbZAtQ1z/08wQ
 z8N6OBy2FBVUhi+LkuwnOtipsZ+S6RYuExIPay4PgDpQUvCOubicg2rbGy3XmEGoLWrc
 laLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+/SpMx8mpnd+mFHLjCdEx43+8XROqactwTPz2jGSY76/mKsTw/vS/5gyMBB9jiCT5LIj8GuZINgg==@nongnu.org
X-Gm-Message-State: AOJu0YxZvXAuy2/EWgkH35aiOjOINI5bh2FPG1zU+VSQPZ3gerKnrpAs
 zBgfnt7Zq5EWL6barOBHI0nf2TZagTcLlYq70JCNoZ+MdP10NaScEj3YxRleZd+787qJVJO9KTi
 XkjGL3QS3YV3+JbaakIGxBkct7Zy2h9RgSSbyaLIrGA==
X-Gm-Gg: AeBDietALtpz4BFR3aW0rPoQ5sOg2/FuY1DxXXYWoHEVE0YvrZb2hJ6zD6SrPqghK2G
 v2A7uCQBwivGDMZpLHriDTmah++8yGDRrfYUrwFtYdT1ki34KC+WI/2HvS0/13Whfs3goqctxSR
 Vq4TBsLoA6D+TXMSCG9SCgTZG7m7kG3Ea2083UTxYarYQsK22WW7f8diXiDnjmCkCI1hAYhqFYA
 nKiFX/LXv4/JcrNQkfK/2FRsD9hSs9hJXSxQdJegDDB1WxhSysLmOCjL4xBB6Ci4VUzvqxYyopK
 1Dm1Or7qFcQlM2xNqgZeLUlIu8Xnl4a8Lsb6GVYoNm9KSWfaQLH1Upr0XyZwy8WUZnH9iaW6/Rt
 sPn/g3U8lTO3A
X-Received: by 2002:a05:690e:2505:10b0:650:37e7:e590 with SMTP id
 956f58d0204a3-653108302fdmr30094151d50.15.1777282474314; Mon, 27 Apr 2026
 02:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260420140552.104369-1-eric.auger@redhat.com>
 <20260420140552.104369-4-eric.auger@redhat.com>
In-Reply-To: <20260420140552.104369-4-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 10:34:22 +0100
X-Gm-Features: AQROBzCyIpeUT0xpTLJFjZkFZrop_TbmUsK87Ixbfl9wzVon3mCXRRlLtkkCcTo
Message-ID: <CAFEAcA9sOn9hB+n+4QUtZqMUVY0axNs0MCFUM_S+b6P7q-LNqA@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] target/arm/machine: Handle
 ToleranceOnlySrcTestValue migration tolerance
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 20 Apr 2026 at 15:06, Eric Auger <eric.auger@redhat.com> wrote:
>
> Pass the value of the incoming register to
> handle_cpreg_only_in_incoming_stream and check whether there is
> a matching ToleranceOnlySrcTestValue tolerance.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/machine.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

