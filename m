Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F88D0EE0D
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Nov 2025 16:53:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNwGy-0000AE-74; Tue, 25 Nov 2025 11:52:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNwEJ-0007m9-Fz
 for qemu-arm@nongnu.org; Tue, 25 Nov 2025 11:49:32 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNwEH-0001dd-Uu
 for qemu-arm@nongnu.org; Tue, 25 Nov 2025 11:49:27 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-78a6c7ac38fso62841547b3.0
 for <qemu-arm@nongnu.org>; Tue, 25 Nov 2025 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764089364; x=1764694164; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/kjj+RKvFaJ6vDXt4saXc8XoJ4xnopLukQ4IyJvevYE=;
 b=wvtuEMIgtqcR3jt9HJoEAvhH+mB7tMcEkmHE75bDqrYjfIIdcKzunMLMFm9CUC3KkI
 L1+GupslrbbMohkViV57SQldMkXFh3HHtKjN0bo5e4wepkACN4Us2WjVIR6dZyMgDbW9
 qPMo/OsGjnuqSyygQDnHUhe8log7u+lCaV228J9X4cdgfsvkVGfTSxiqcf77t75orS2h
 8qBZ7PAG63adVnZXBFz4YGiGoOoRS8RqjKlOdbv/ZM7Ms3bRjOkUSGS8MLp3U6+UXn7D
 bYJNo/RW1seTDH50a3DPFpImUYQh2a68iT53X8HsLW8MdbDXLwq+Mwna7RmQG6lwfrf6
 2yIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764089364; x=1764694164;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kjj+RKvFaJ6vDXt4saXc8XoJ4xnopLukQ4IyJvevYE=;
 b=lYsrFnnqUPTo85t40BXDlztPSWXW4PBxfLo4KfJru1+nXKd7VaOjtjNFpMTvHNKzdK
 QhaTvvbOACIt4KMupMT9Cf453pjtSrFz6vcEtclcpe7ddVsrkdkg5SuE9++aC23SUPqi
 EYt12zrUXyxpnDUvwAlPDcU2yoJ6m5ZWhL1trjZJXwKm1RM5jtmL9l22LDRwMsR8hJP8
 9vmmnWqDliLBvFHFCosqzQWuHYgi2GSaybWut9Tpejn7mlkeoS1JBncNkiN68LnwkT4T
 xJfROqhoRHPkeheXqU/O18+YVDwDiojbltNoUlaEV4cxYlVHWRjW6dqTkHfS7iuu7I7S
 sWFw==
X-Gm-Message-State: AOJu0YxtyH54cJRvtTACb0gZUKbU2qSJPIlHoOWeSJXd+Okh7vWJUENF
 vL5LU+Hm8Sh6UdyG0/A8HoJpUTSVrQOihCdPqVroJTCuViG/rKhfbtYfDIPHhRnEUJZ61ljgNrQ
 sQ4BdCn+YEPHJKZlIQUaFtqYDAqHy/CWl6mnUkLf+dw==
X-Gm-Gg: ASbGncu+MU7aRPcsCNgG4oV7WOOoO4ZMmSLbPP3/hLQdJemHkPg4W22ZUoPTYG1t/0X
 gHZvU0siGJOZzSf6WglyYws7EPGvQR/lDfDvUoyvqbyv30BGpHqqhlPH/kE9i+eaFxEXyKe+RHv
 7BXzGcbO+AhlWUMQttNVs0aPYLkMCXu6Jyl7SU/ILjaIQJo033/OpwL4jveHyPXMBIqZiFQd6Ri
 +ixmSdFfaUd78+QxGUU/E/kF9iElWHrPDmUCErffdiyTFc2hSa7jqrG7YGswm09o29K
X-Google-Smtp-Source: AGHT+IGp+SLoUduLe8zReNeXV3tVdoUyB2PFwrNnHS/3dpyAOoK9/eGfLmwQ4uDeY8iTT+wOz/QTKv35togdnxgLqH8=
X-Received: by 2002:a05:690c:e3ca:b0:784:957a:16a1 with SMTP id
 00721157ae682-78a8b54efcdmr139898677b3.56.1764089364030; Tue, 25 Nov 2025
 08:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20251119134414.2892640-1-cohuck@redhat.com>
 <CAFEAcA8r7_6fbEFtkEL4vi-wqABewcPU3P73RWh08RRQnQ5Baw@mail.gmail.com>
 <87see2ozzu.fsf@redhat.com>
In-Reply-To: <87see2ozzu.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Nov 2025 16:49:11 +0000
X-Gm-Features: AWmQ_bloi0DHLO1PvOwQvfEGf7gFitdSqt3kj3nP6WOqEve4r4S7uQZq6UTnw7M
Message-ID: <CAFEAcA_zXVk39GzeMeTtpMVPr5xm23H7RPzbvX9Sxhgr=WzN+Q@mail.gmail.com>
Subject: Re: [PATCH for-11.0] arm: add DCZID_EL0 to idregs array
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Tue, 25 Nov 2025 at 16:09, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Mon, Nov 24 2025, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Wed, 19 Nov 2025 at 13:44, Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >> This requires a bit of care, since we still have to handle the EL
> >> specific part (DCZID_EL0.DZP). Callers can set/access dcz_blocksize
> >> via a wrapper working on DCZID_EL.BS.
> >>
> >> KVM currently does not support DCZID_EL0 via ONE_REG, and actually
> >> does not need to work with it, so provide a dummy value for now.
> >
> > That seems like an odd (unintended?) omission -- is it worth
> > adding? (We would need to handle older kernels that don't
> > expose it anyway, of course.)
>
> I'm not sure whether there's actually a usecase for KVM exposing this to
> the VMM - AFAICS, KVM doesn't do anything special for DC ZVA and
> friends, and doesn't tweak HCR_EL2.TDZ which would change behaviour.

I guess the only one I can think of is to correctly fail
migration from a source CPU with a DCZID_EL0.BS that doesn't
match the one on the destination CPU. (We can't lie to the
guest about the blocksize as part of "tell the guest it has
a different CPU type from the actual host" unless we want to
trap and emulate all the DC ZVA etc insns...)

thanks
-- PMM

