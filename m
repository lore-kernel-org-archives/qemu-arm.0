Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8AEC43458
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Jul 2026 09:25:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wfa9N-0003m0-Ta; Fri, 03 Jul 2026 05:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfa9K-0003lS-Ad
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:25:32 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wfa9I-0006Mi-3H
 for qemu-arm@nongnu.org; Fri, 03 Jul 2026 05:25:29 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-664b3831a20so503964d50.3
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2026 02:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783070727; cv=none;
 d=google.com; s=arc-20260327;
 b=mQeqPk7odDqoV8Rrc0XpJGRLzN3fSWP0WHkNgjrNnr6Ft5zswgNLHYlBsnP9CE2PEf
 aJPZowUCt9KXtmf6aIezHyLCI7rpmnQUodFM7/Ro8HQngNQwaauUtYvy/s+akzIYcqwd
 0xG8XNkSjVPunI6mD4rUiuXybY08ZZPeAU6QGo3YpXdI+XQpmfk4B7sCQWkTb8ODhtPl
 we3erxpJG/xMIvWwW7ekA8ADBBOjBKtahe0iaNtnNOJ4+udVw4FfkgU9yLO/wl3QOSBG
 JOO4Iwu6Tqor3SRRhlrdR1LO0SHz4+2ii9b7QEBgCs6kCtudQv7vaRJTvWc/N+aDNhnX
 nK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jqzkQJPKUaNZ8QKoHFz9ExDM6PHhmw4P4mlQft0nYBA=;
 fh=6y9IBcbu1Bi+CCro97HfmTjIJFpU7a9VxQnN51J+uEg=;
 b=L46efGliRTIGBN0YqHMgLCFVnvPVKv/p2HWTt3r4hxKtL6505qTCdm1F8P58CWerWO
 6ICC+g7MmTU8teqojXknCZVepunj3Rn0Yc+KKAcy1pOo1dn8fzJgn55umzGAjRHd8KOf
 PzGIYPuXlMOlAG/h999QHCGytAhUI47UMRiBIWHPms7cxYsM9csNrplCepPKehaXScRD
 Ecq4svt9QPI4e6u3r45FlRfg0HfOc3tsYB4FQPjGoT6GB68kU5K9dntKbFFVWoxpZMgt
 Xvu76knbBj+Nryw0lDcj+y7EeDzMXvZkv8ZKidgcXdzcq/jLGMoW1f4cYoBoHXhajOxT
 bBqw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783070727; x=1783675527; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jqzkQJPKUaNZ8QKoHFz9ExDM6PHhmw4P4mlQft0nYBA=;
 b=KCFYohIliQtoLXEoEYqHkYBCInkJIGWaf1+j228PgRFc6pWx+2wxYeNuz+82lAI5ni
 CVsfHSpuDM+eiPo34Uyo9P7fzl8GmgrNvDMuxnPPBV8yRvOLlJZpF+hnE1cG7d7FLrDo
 YgwfZQwHowIcEmF/P9Y4qvT5R1FHU0y8y8h7VmuOE1GN3TkN23Kux2I0TL7f9Wfm1ePP
 5XLsTv3oLTLDVGLlgq+n1e83WwwCm6JJCXfVgNswb0dA6Vo6lveuYPEC1AejURWnwaq8
 rxDuOz9q9Oi6MN4WsjpD8+uEsY21Uz1nfzKElMk2g5ATmXfsBpy4XBo55WqN2YVzKbCX
 Xoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783070727; x=1783675527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jqzkQJPKUaNZ8QKoHFz9ExDM6PHhmw4P4mlQft0nYBA=;
 b=JRI8eeUMe9oJskVc2I65Xx9HfhUzOCIXKu5cGMltIu3VEDNSqbt7erlmPdQOVjdSUx
 Hf05GhHi7hyIPgBk2TkhBM6vknhPCY2Ao3+anNmkdnxqzozW4RXcytavXcv+zspBru2G
 CA1jj1cmkPW+RPr8B19/g2o3DlmoxxI9ZBBL21UcfGunjhjFxCbKlEmV6PUVwLDriP4r
 9V7XyJcnI93Q5/WAJ19zqJY7KINJ6A6Za2YTSPKzXWz8p8OM1SUqpRqw3VPvjUzX2D+/
 tnJsqLTEUaEeKtJfayv8GAfBoHShtOjwGUyD8y6iPphyDLKsLXrkw5Fx7V2osUk39vQf
 sTQQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVr7S8JdnAFrcwMwmrVxGtgMwesKtytummQD4LWRsPm+pB5t54f8N5hd7ihNUX9ItjHaeegtD83w==@nongnu.org
X-Gm-Message-State: AOJu0YzvTrdVlXkL+sbMROtO8nbWIzuN4+RpKAFLy+gzW0B+Gpbzhmup
 sZPD/9pxnlu6EaoBRLuUifC08Hq3buBmwCDeScLyW4zHw2wO3f8rABB3IUTL+QdsgH1kNBDT4vl
 KoNoLO5139nLkgVArRGjf6pHHn5Z+6ANGs8erMYg7lg==
X-Gm-Gg: AfdE7clFzSWF0/4W69zPOxPv6w7YaOSrYOtefEKF0283o5Z0B8+I2tpccng8Op02JsM
 lk7gqWikMg6byrDtLD5raMcPVblG3lzcOxNhqfPeEwCw3UK0F7yR68l3mkFE9P/WIvv3su6904K
 xeZt5B656/R6q05rm5ZMr2vsQqS0hSMvoFmxIhi1g0lqCewSZQekLR8VF53paCuQ0HmoKzA3zfq
 fqWdksVDk/gsXRNQW3Qc2Yu8SV+5PhLVG2HRHJwscD7Pdb7J/EODzlGr+2a4Plo2L4XocQLj35b
 J1G8CEfqo9k9QHh/86h8jGCT2RxY/4aCS7qXKnIpX0JIbe+GqJmHsWue
X-Received: by 2002:a05:690e:4847:b0:663:ac22:84 with SMTP id
 956f58d0204a3-66521966d7cmr6526798d50.5.1783070726557; Fri, 03 Jul 2026
 02:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260625122843.107584-1-skolothumtho@nvidia.com>
 <8cc759e8-99b7-489c-84b7-30a6a7031b34@redhat.com>
In-Reply-To: <8cc759e8-99b7-489c-84b7-30a6a7031b34@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2026 10:25:15 +0100
X-Gm-Features: AVVi8CcEk3sC8i3DBM4SSAPthBVSN56xIqBMm0k8bxzS4Kvot7REKUQskxDwNtQ
Message-ID: <CAFEAcA8FVBvGtWYhdYfnkht9VhTtPFpLJoWCdDfodY_xXzjrxQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3-accel: Fix veventq read returning true
 on EAGAIN/EINTR
To: eric.auger@redhat.com
Cc: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 nicolinc@nvidia.com, nathanc@nvidia.com, mochs@nvidia.com, jan@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Mon, 29 Jun 2026 at 16:36, Eric Auger <eric.auger@redhat.com> wrote:
>
>
>
> On 6/25/26 2:28 PM, Shameer Kolothum wrote:
> > smmuv3_accel_event_read_validate() returns true for EAGAIN/EINTR, but
> > no data has been read into the buffer. Callers treat true as success an=
d
> > proceed to use the uninitialized buffer.
> >
> > Change the return type to int with three distinct states:
> >   0  =E2=80=94 success, buf is populated and valid
> >   1  =E2=80=94 EAGAIN/EINTR, no data available
> >  -1  =E2=80=94 error, @errp set
> >
> > Resolves: Coverity CID 1660057
> > Fixes: d4aea0f75b ("hw/arm/smmuv3-accel: Introduce common helper for ve=
ventq read")
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>
> Thanks



Applied to target-arm.next, thanks.

-- PMM

