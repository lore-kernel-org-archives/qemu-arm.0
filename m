Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CC8CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 16:34:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyC9X-0006UI-DK; Mon, 15 Sep 2025 12:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyC9W-0006Tx-Gl
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 12:34:06 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uyC9E-0007Nt-J1
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 12:34:06 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-724b9ba6e65so28991157b3.2
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757954020; x=1758558820; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UUK0/U8MeQYanHUvMO6n7yY2GDZDIGnGIxzeB837oBk=;
 b=QMIHimiy5fynn+QRL7eol+9E/zCb5fej/L2Pe/mqUeO+tClkW/fmg7TeH5f7Y4b9BU
 0nGN/ciZi4yBDgVXiN01ZgKmFMzBxpqK2Dp6a5vQNJXn08SOmO7+ahBfkYlSz0k3E9zg
 0/ZcCawSlGYtqGBdvF3rScHeF3E0S4U8TC4IvyjGqVDV0L0kmOntboBgTb7KRA/0gpla
 0aEr/2W0MSaI6uLhRbIeMOB7VCy/ilWGPUolm7onZcSsxtHEf+2ZFKotp1sULgQWPqgr
 EWFNo3Zwzh2rjjNiJ11AEiN28kNt+LCUJDne2PzKvbIk98EWsqcVSo6B3brdgTKgAL5y
 4c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757954020; x=1758558820;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UUK0/U8MeQYanHUvMO6n7yY2GDZDIGnGIxzeB837oBk=;
 b=bSX6PfnZCkJGMzXhr/cSMsYP3hBYyIWMhRVT3P6qdhQXXCqvFxWcCzogWlx/BoKHk0
 XrNVhFMuQI4SZECGfD3iK1x6gMtMe0pubVxxpTD8gX0a2HfGJudstngVomVyaMCzlsSt
 z+/xLISlH18aXGT0PfJ1u4m0woXYcfFcY/GXQc5oda8ynsKhkTrQru3y5fTUWPAfHdkp
 o57DEga9It3/Huz3z1JGoMe93IgQ7OY+FJY/F6njZSC8I4ASNOHJeJIt9uKn6gpMvd63
 cYEdEtut19hmSoi4fho9yQpjqSqfJJtJuPNpeK0lNNSb9VVK48FnatOD8+h3NlKdvKD3
 D0VQ==
X-Gm-Message-State: AOJu0YzCiVByY704H7G8yUz088Uht5+Ik3QZgOpbggkC+RzoWLDZqa+P
 KW2YlqWZKv4LNY7Qa7oBmNE4CBjIrZ7ixlOESfBlmIJExe7r+ZFC37SGkKDiM0PB7WJHRxjaUqc
 W3+ODjQ0wwlYXRd2QlCPQHHHd1hVySVC5D0KG238S/g==
X-Gm-Gg: ASbGncu7//uAyg56C0Rp9GhfNLLcGf4S3jEdetqC6hBs2ZwHYouXOrLjezUF0GOyeBc
 SX+cuoPAhfxNLrou+ZVLqoRff6JbNVK7e29cvcEtxgLyiDnR5YQWXXTbYAdFmNc1rm1IVeksgT1
 K8PRAIhTfmSe7mGhX+orIoahq9NS/rT1oApwwLPSF1C9rMrhUXuB24w9W+6M96gK4Fqw4kgEBHD
 Sy9
X-Google-Smtp-Source: AGHT+IEeILQk7ztH7t/2RwF0eZ16bh+vpubxJrjxEEbBg6SDdKHvuIBQueLviP5SWilz1B91EJ0F7JywA4eydE2qqzk=
X-Received: by 2002:a05:690c:dc3:b0:71f:b944:103c with SMTP id
 00721157ae682-73064fea3edmr121790477b3.45.1757954019875; Mon, 15 Sep 2025
 09:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250911154159.158046-1-cohuck@redhat.com>
In-Reply-To: <20250911154159.158046-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Sep 2025 17:33:27 +0100
X-Gm-Features: Ac12FXxBcR-8P91RCP-I7VXj00AnR2TXSJfpKfQ7HrpKyEwCy4jiMxRlz0u__1Y
Message-ID: <CAFEAcA8-UVGTaAM8=kCPgm5vYn13CKnV6S-vZjSk8w5af0tv9Q@mail.gmail.com>
Subject: Re: [PATCH v3] arm/kvm: report registers we failed to set
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, 11 Sept 2025 at 16:42, Cornelia Huck <cohuck@redhat.com> wrote:
>
> If we fail migration because of a mismatch of some registers between
> source and destination, the error message is not very informative:
>
> qemu-system-aarch64: error while loading state for instance 0x0 ofdevice 'cpu'
> qemu-system-aarch64: Failed to put registers after init: Invalid argument
>
> At least try to give the user a hint which registers had a problem,
> even if they cannot really do anything about it right now.
>
> Sample output:
>
> Could not set register op0:3 op1:0 crn:0 crm:0 op2:0 to c00fac31 (is 413fd0c1)
>
> We could be even more helpful once we support writable ID registers,
> at which point the user might actually be able to configure something
> that is migratable.
>
> Suggested-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

