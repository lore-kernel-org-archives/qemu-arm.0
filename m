Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB9FCCFA03
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 15:48:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFwmm-0005Q5-T0; Mon, 03 Nov 2025 10:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vFwmm-0005Pv-35
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 10:48:00 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vFwmY-0002r3-Fj
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 10:47:59 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-7866bca6765so12255707b3.1
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 07:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762184860; x=1762789660; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D1kjkvSm01QnehMt7n8aEDTF3ZghshEgLjDcv+CpV6Y=;
 b=G1+1aqKjYuiThKNhX8GthRhH7c9c/WVvoDShQDvIalehYHAzwCemMmVbQGX1Nu4E1b
 4S4I8GVXWYReNnE8L/kfcI/cawNIplOpzjMaKx1jQCB+XW8ZYP0JfgxgdtrDT5/58j7f
 +Z2hLKIP9vNyguuPx8TqKaWn4ye5gjC6KZSAWaecOWz+kaNqeQ09B67pEkWiBzWRAKh6
 YvECxV7JJIacGs+s+/cdKyICPu24syLln/jGjdPEgc4fOrURhSSpmdV6YzP5IubMx9va
 jKidnDpOs50iTD3L0CSt4hxtFWs5y49cTJgddJWGyQINEoRBQDZrNJU2jOYO/n+P/bPZ
 7rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762184860; x=1762789660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1kjkvSm01QnehMt7n8aEDTF3ZghshEgLjDcv+CpV6Y=;
 b=XZpk1NJnPAdDdylPCcTce11ScvS1Fsrh3IIhG+6ATUSagqMr1VujZbtP6F7OWxa2YW
 Q/G9UIV1QDppGSUDyUaQV/2CrbjREGibcIOnPVmwR8kSsRwFybK8jFC7GRBl1hy9xzlQ
 MhJo8puzzba8tTn82Sq+P93/CON0OjP6dCtxokep/1YzSuegof+Nbhafhq+GBHqXyiiz
 pxdtyg4yMpupOVXkUyIaAXfKyW/ZXMeT4DxJv+NCtCNlGUszwLJr4q0GqLCQIva8IVgA
 olXVBN/r3OsmSC2D5lnmHzmgIvlMApgNpn65PS1VWp01c6apJBFYbyqx80OpV6tqpSfE
 93oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX9wPdTU1515SAJxO81BtgcPbM4eH9iqbCz7U7MAJdul3eDe7V7/WDwpW9XnLpYX9/LeQS6ph0bA==@nongnu.org
X-Gm-Message-State: AOJu0YyWEZZttXXAbDS/NTy9u+Xo10oYRVyC4Fzt+V1t1tQW0RfHibQt
 B6nerl94ky6oZx7u3uInM9alm+SzYpAgYEJPjYuOB4A0VbUeUFPfW4MXxc30Pobl87RhScy4naa
 RsEpoUYqHUcteWGyPvcJtkKQcgAnmy0zzr64hG5MlCETQYfChfh6ZyxA=
X-Gm-Gg: ASbGncuAAMk4Z8tuZPToIZtUxsRkSpG8nw14bkTvy5z7sb0hzbvcTHI22obf3yNTJV+
 C2bBAv9WtNh7PpwYr8gO8y4F9D4NpdpraLg3seOZl95NOmhK2QCy54Lph/OwBUYK796XdThOGwe
 QfXxXZpeIJaj56tZDr/745bRqtJKE9mYIYBmzJhbUOJiqWrTKHmVazL8KMWpXYdlHNksHyIghQx
 +xgNmDC6llDph2lAcVtPQKRwW1Er0jebFHeMRd0jgzI492fMLYRpYhErIOing==
X-Google-Smtp-Source: AGHT+IEBqd2EDS5Pp4oieOKzJW+Y4BeYLfgiBZEaJIk9hRuLddQ5W97WqvSOMhboXTuSR4Eru4pWOjA9qnITV/hdt1s=
X-Received: by 2002:a05:690c:4b13:b0:786:5789:57cb with SMTP id
 00721157ae682-78657895981mr95236537b3.50.1762184860320; Mon, 03 Nov 2025
 07:47:40 -0800 (PST)
MIME-Version: 1.0
References: <20251101120130.236721-1-shentey@gmail.com>
 <4D17B8A6-28E9-4E65-B0DD-15BE2AD4AB04@gmail.com>
In-Reply-To: <4D17B8A6-28E9-4E65-B0DD-15BE2AD4AB04@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Nov 2025 15:47:29 +0000
X-Gm-Features: AWmQ_bl4nfWeFBgSFu4cOy2ckqnbpLntfAhtTUfQJYvbLUm9gx69SsQEmjtdWz4
Message-ID: <CAFEAcA-7dMCjK2dnTP=82qtk48D4WHCP4sbyQtaxTcRsDb=t+w@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] KVM Support for imx8mp-evk Machine
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 3 Nov 2025 at 08:55, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 1. November 2025 12:01:28 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >This series adds KVM support to the imx8mp-evk machine, allowing it to run
> >
> >guests with KVM acceleration. Inspiration was taken from the virt machine. This
> >
> >required a device tree quirk for the guest clock to be kept in sync with the
> >
> >host. Without this quirk the guest's clock would advance with factor <host
> >
> >system counter> / 8Mhz.
> >
> >
> >
> >Testing done:
> >
> >* Run `make check`
> >
> >* Run Buildroot image with TCG
> >
> >* Run `qemu-system-aarch64 -M imx8mp-evk -accel kvm -smp 4` under
> >
> >  `qemu-system-aarch64 -M virt,secure=on,virtualization=on,gic-version=4 \
> >
> >  -cpu cortex-a72 -smp 4 -accel tcg` and `qemu-system-aarch64 -M imx8mp-evk \
> >
> >  -accel tcg -smp 4". Observe that the `date` command reflects the host's date.
> >
> >
> >
> >v3:
> >
> >* Fix crash in qtest (Peter) by using cortex-a53 CPU when ms->cpu_type == NULL
> >
> >* Apply Peter's style fixes in board documentation
> >
> >* Apply Phil's R-b -- thanks!
> >
> >* Rebase onto master
> >
>
> Is there still a chance to get this series into 10.2? Soft feature freeze is tomorrow.

I've put this into the pullreq I've just sent out for softfreeze.

thanks
-- PMM

