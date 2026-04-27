Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31356FF8861
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 10:49:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHJW9-0006g0-Cq; Mon, 27 Apr 2026 06:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHJVb-0006Zs-Mk
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 06:48:18 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHJVS-0003N0-Pw
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 06:48:07 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-651bc8f864fso5394715d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 03:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777286877; cv=none;
 d=google.com; s=arc-20240605;
 b=Y0inMFBBEP19DDRGJwotU19FwBjCzU2SHziFyh15cJF6H124pV7SMB0g50nLyovG8E
 ACGAIKqXS809U1bvJuDYZxMA067Qa/NYwWDgd3sBiIW6B0fcrL9Mw/qX13XoCVPWKUDl
 jNayIjENy5H7Szd2uEDEHypwPqkexAw8nj+f7g+ertsu+rJmHr55nYBGqIQCSWoOXX5Z
 asURE7CV/cGXhXRFWJzpMsJ5Tc+DSKG97oJD3tFfFx+9o0C9e6w1pZx8hDuYg+rc8F9W
 jLEiDNC/G3xnLtU6iLcCunrEJk+HPGxwAypMCYGRb5n1fyKJXkbHpwi5enG0mqWPRNab
 Kq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=z0t2lMK8mMOQqjFYJtMIq0BWSHEnCJiR8+4AnCrJmw0=;
 fh=SiHvsRlpIgLH7ZsVUk5CXb2Ed6DqRKPQ2IullXXJHxA=;
 b=CO6fbrXq69x3Jsvh7Y2F4CkkohPgWNHTBtgimqDWBoT0H0sYZzmYlt+xVWXsJJ0UMl
 Q3CNNdKlBGcQpa58U7+o3ynGMytW0T/yEKsmoR+fO/FQ4UPGUMCSJ/kkcGpUk//810wY
 2M3Z3xkuLha350b2HRJt1zQM7PyOBdR2cMrFGLJ35ND1XQFANPGzmpZZYCU7Rn1xh8aZ
 xO23NWwzhPC219wHQXyOjR/k5r39nnTOzlsUkdxtcz1HBBtJkGEOlx/EhkLFcxWZ22OU
 BcbpG/2NhWK3LAdHtrVP+pNeW55PVRB+qm8dEiEzjB2mpkGID59EtkqcJIWryXfLCNRd
 qH9Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777286877; x=1777891677; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0t2lMK8mMOQqjFYJtMIq0BWSHEnCJiR8+4AnCrJmw0=;
 b=F3xHqwLkjDDIxAMxHtdqtKpMc5ffB7PCAIqKro4Nq+I5LZUuJURQoah9q64vu9WZSR
 RGbZpIY8/43/t84J8bV31SJ8NstPENsQlF5FfF/XbS09n5CJSau69IcQ2Ny3eG7px2DP
 YK3s5pW7PIbJlJzXVyHF8DfAi+lulIN48Iolrsbg9kibiTe9ogyqIltwQ9CDOkZVrE8w
 DcRyl/wRCTiXrVA1azvTaw/yAe3RFSdQFVqZEQ6UQH0BUHK2Aokdbm3wRHdvCq+Qcun/
 g5uUHqvzXfITYDvXTY89KaAQBTDM3C1euVtGzUuLIZacbC7zTrecE2q0E9A2QTXHmbu5
 YRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777286877; x=1777891677;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z0t2lMK8mMOQqjFYJtMIq0BWSHEnCJiR8+4AnCrJmw0=;
 b=Gw7dTh6BsbejSvgnEmEDK1tGf9tV0XGXwTvo4JsnAcUEPkPN0jS2JTK093AtwkMDAa
 Jp+5pmEtG4/+SIfOdbjJGKO+k25fFkx40MA9PwWIO+xikFb25nkEbosmzB/1Lcc5ioO4
 qbUyXQgh64kM6O5j/fAxeS7/Er++10ZmI9Z+1g3I29GWLOp2tNdqp1HvSsMofmg5GSnJ
 UPSEe4V035r+MYlKm3ZBOEpMWlzagsXQHf5x1p7oHv/GvqsjjXmg519YQc4M7ATpD8lf
 Nq2aR3fq9taw4bKT08n5AT2OCuy963xGd/Dayl6thSALJ1D41VNvh26F46ehgQ9vskCW
 WYnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+IpgumPYeYtZCtmU3zjXuAhf4Zk3RImO/axgPs9ZZmT0sEOmKKALDBgs4utTx7adJMUwJCX22b/w==@nongnu.org
X-Gm-Message-State: AOJu0YzzWpOcIEsvcig/muoRljNAq8bMyhTDV14NgN5lx+cFZKi8KKaJ
 fZaQJvfKUqA0RhkF+w2WYDyqJQNMxInb/ze++9F/iKwWRM3aIANpAlCVG+7GbnN8SMMUUkYxXSe
 mJyO3WFdOy/AmvLCZh8SnnSxJCYxvthq3LzdtgY7a+Q==
X-Gm-Gg: AeBDies4wVJigjDBkLpoqH1QEhaSWBC2fl26ONjYtsr7YEIi2YPDNzrcIe4QbVRRJyf
 wEEXs8nsUXJi993DF8R3RH+eOB8NFjK43h3n0e95/3PGCLRYL5nhaJySUufIwTIn++h79aTNMBZ
 S39h/b6XtAPpzncoe+HDiR/Tit2ZLl5BQEBLnP1In5ejRmSH9KE04tA8EuaNCRSV/vxD2MLNs/r
 qzItpUWutfEUL+82LH0ixbc0sATjmga0h/UHEE6eYYdYIm7HST+G3JzfAxK8HOrVqjxhLSUKl1x
 jcyu+vVUymQMAkqmS0Z6KOguLO9ucyxe6ZkXCn+DfQjB5utZvOFW7SYPsJpnzmKMkVG7fhP+LNB
 Gu3MSl1p29t9q
X-Received: by 2002:a05:690e:1905:b0:657:1da9:7b36 with SMTP id
 956f58d0204a3-6571da98231mr10668146d50.17.1777286876891; Mon, 27 Apr 2026
 03:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
 <87y0ic43v1.fsf@draig.linaro.org>
In-Reply-To: <87y0ic43v1.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2026 11:47:44 +0100
X-Gm-Features: AQROBzAuWfBl6vKMDHcIkxAyChVzQ7RDQMDZuaOHzbl4_ymulHU4IgwrU8kBqe4
Message-ID: <CAFEAcA_R-B7QHzSPmR+qhdn_ZRj=hx45Z4WrWaDmjnOpPn=b7w@mail.gmail.com>
Subject: Re: [PATCH v3 00/32] target/arm: fully model WFxT instructions for
 A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 24 Apr 2026 at 19:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
> > This series fully models the behaviour of WFxT instructions. We
> > already had support for WFE for M-profile but we left off A-profile as
> > it has more potential sources of wake-ups. The main one is the event
> > stream which includes events from significant bits of the timer
> > ticking over.
> >
> > The series starts with some refactoring of the syndrome register
> > helpers to use registerfields. We then expand the WFIT trap handling
> > to report the register used. We then implement the event stream events
> > for SEV, global monitor and the timer related ones before enabling WFE
> > for A-profile and then finally WFET.
> >
> > Note on AI usage. As an experiment I previously posted an RFC series
> > with the help of Gemini. This series however is a ground up
> > re-implementation which takes some different approaches on modelling
> > the event stream. In particular rather than running multiple timers we
> > use the same wxft timer and just compute if the timeout or timer event
> > will come first.
> >
> > v2
> >   - I've kept the tests separate, see:
> >
> >     Message-ID: <20260417164328.1009132-1-alex.bennee@linaro.org>
> >     Date: Fri, 17 Apr 2026 17:43:20 +0100
> >     Subject: [PATCH 0/7] tests/tcg: more capabilities for aarch64-softm=
mu tests
> >     From: =3D?UTF-8?q?Alex=3D20Benn=3DC3=3DA9e?=3D <alex.bennee@linaro.=
org>
> >
> >   - tweaks to global monitor behaviour
> >   - STLR/STL will also trigger events to avoid deadlocks
> >   - see under the --- in the patches for details
> >
> > v3
> >   - fixed the WFE exception handling
> >
> > Alex.
> >
> > Alex Benn=C3=A9e (32):
> >   target/arm: migrate basic syndrome helpers to registerfields
> >   target/arm: migrate system/cp trap syndromes to registerfields
> >   target/arm: migrate FP/SIMD trap syndromes to registerfields
> >   target/arm: migrate eret trap syndromes to registerfields
> >   target/arm: migrate SME trap syndromes to registerfields
> >   target/arm: migrate PAC trap syndromes to registerfields
> >   target/arm: migrate BTI trap syndromes to registerfields
> >   target/arm: migrate BXJ trap syndromes to registerfields
> >   target/arm: migrate Granule Protection traps to registerfields
> >   target/arm: migrate fault syndromes to registerfields
> >   target/arm: migrate debug syndromes to registerfields
> >   target/arm: migrate wfx syndromes to registerfields
> >   target/arm: migrate gcs syndromes to registerfields
> >   target/arm: migrate memory op syndromes to registerfields
> >   target/arm: migrate check_hcr_el2_trap to use syndrome helper
> >   target/arm: use syndrome helpers in arm_cpu_do_interrupt_aarch32_hyp
> >   target/arm: use syndrome helpers to set SAME_EL EC bit
> >   target/arm: make whpx use syndrome helpers for decode
> >   target/arm: make hvf use syndrome helpers for decode
> >   target/arm: use syndrome helpers in merge_syn_data_abort
> >   target/arm: use syndrome helpers to query VNCR bit
> >   target/arm: remove old syndrome defines
> >   target/arm: report register in WFIT syndromes
>
> Peter,
>
> Do you think you could take the patches up to here so I don't need to
> hold the re-factoring patches in the tree?

Sure; applied 1-23 to target-arm.next.

-- PMM

