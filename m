Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E76ACD98C7
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 11:02:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ552-0006HO-ID; Mon, 15 Jun 2026 07:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ551-0006H4-E5
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:02:11 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ54z-0006hl-S7
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 07:02:11 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-7de68222e96so22323797b3.2
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 04:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781521328; cv=none;
 d=google.com; s=arc-20240605;
 b=SA1+J2WDJitgd6ZjsvQUKBOsyhVO8GTwD4Wrg11Ggbf+fmsdrel91sPlOc2myTDPlQ
 q0UTM5e+5MNAwvdl97GLDS+kTfL2B9vOYeCGvSJY6MyHchG+BoUq0HW4YERtjnsf0q8U
 aZVdejk2lMMWsSrBtlGIF3wNKh5P7TxgG5iAeBObUYjfodnQ+HhXmQZbr9Sa6ePaPreN
 21xq/QRj0NuSpJz9p3SeETOBIRPKW4UqVvGDa1MEaAm299rDHPhvRQ3hZtLKD3iKpIVh
 rlZtUorAYF4cO9DwmjjfCwfacv7dtTJi/ySgxBcPOW0EyuPuEP15+rvhYrgc77GdUcOE
 V6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=jNfQreTErrv2hEpql/5UQFkOkdcHpUgBEKbRJ+ec8rc=;
 fh=G0XBkzYLFJe+3deFu1LW80qiJhQ+4/3XNOobfib0vLo=;
 b=McvcQspCblEMTc5R1OSm0aaGXenGSXn7v91wykne9kdMp/z7Dbu7Rq+E43vcDkXgWK
 yU4BF/TZXM6ly6y/UfV69acQQ3fLd62seH0bslkvXO9/lqD+Jb0rn8wlyNSWp5qmF7EM
 3Dy0s+Uy7QORWapDQmOomX19P3ePr8RdKq1uXnwcikLVL2G/CQ4T+PeSU4tZaLqcVzT1
 e948gqML+I+FCp1+M2Tm1N51lbcYjuTGy1EmSAyblgSgSIn2j1rGWjrfuNAeBwAdY/a5
 il69b3mpR474LLasfzyBCpmkWL0TXC7RRYWQuIUQRjW1fSH88s0j3gWYzfnF5O2+HBw7
 5ouw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781521328; x=1782126128; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNfQreTErrv2hEpql/5UQFkOkdcHpUgBEKbRJ+ec8rc=;
 b=CNVHqE+OgP6OOSpVoueszODsVOpNFe/PQqRtPdkpiZ1BDUFofbmYyk3Yp+L6/KK/G1
 t7Z1dHT67kt78Eu7KsaplaeoaEjfSq4HmVhDMaobM7Y/I9v7K4JHBB2au8cQT9wsANWA
 SL05DA1krCJPO6t0Xc42Wur9FjqIMhyJM6IgmJjbciIvTvtBrNf77hLeiG0Ryl8Lh55y
 ihSaKj1BaBfT470D+skkA3XUefTO3mqvUjuJY3tC6z2CsmQjwnKwui1SaOf10w8CHy2s
 35a5GtKFIEfmFf0/YcUNNP1BmNmnmCOTuKWD8k8bCyXrBL+sK2N46Nz2xqP3gofhhjnN
 5FDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781521328; x=1782126128;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jNfQreTErrv2hEpql/5UQFkOkdcHpUgBEKbRJ+ec8rc=;
 b=F1okbr+Tmqip8fmEP94zLPm+lfdwjUqq0uCTbGaV+CPpDvWtucXiPXl3amFWBTm2tK
 bOV74Jg3FbD7cCvySMKgTjBXL3KvRRvv6nXUmgdkA7gYDrCug7/NJMVSv47GgxzTADhb
 o2OygsUU0cJk9/xX6M7s8yzUDchAApCQABAIBCxmLvOmgNmGsYn+PlcdVgJtZTH7wNcU
 2R25SikzgiuBS2wT349uCvxYqRwEqN9KJpdLu8TengrX/FbyR91OzsnlTwrr30MrOR4Q
 8QXmkD+Q8QqCejFpft++f6m1W1DybIaZ2WFDEE08+pFCB1eFs67tkGr82uPhCYUTGiPN
 jGmg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8LIy79jYz/ijSHh6raDJG1RL9E0Nxhp71TrogTxjl7gD9pYuROT4/cLXUpaRzS4jVqepSXuMSTJA==@nongnu.org
X-Gm-Message-State: AOJu0Yw9YKlWCqIEPfXoMM3DWokfQwkDaFn6LtrmYE/2+eM8meSIk48k
 iG36pnaYq/cPgi77KeUtSZd39clG1D3hiHtigan2BTbj86R6w7dgOcOneL5GxPCGuWYSVeZNsaL
 UJWr/PSOEYvrvTJmyrZnCZwtDRXmfNgCGPCSy0mtuuw==
X-Gm-Gg: Acq92OGKHs/92ex6TFzLGyHVpy+hIA7FaKHwQhPqTvBY7BHlWXeaMUd6VoaLsXITD/1
 93fE9qbPiPI4pIwt/nqw4GVYczd1fFnzJvlsIvYPjkJBaWrg3VzII4k4SrOEMemk3A5A+WxGJ0T
 MsFc0xQsN7O72dhFqcI9Hm4arZcJnP5XjuMXHAcWVeR9JdgeBy2Z4KQ9w33yDSX4U5BwT5xVkRu
 u9HNr6kNazmsdciLuLw6jF/lXT1+tX8VYyVaKg7nUvvUn/22kxGBdfiieAzqrbVZ1HFCuhsQNay
 6N/CNhDv7wcY38qs4y+ZijE1jco5jlv8b1j7fq7BCDZBVv0w6tTfiwTJuUuD/TXJAus=
X-Received: by 2002:a05:690e:1c20:b0:660:5df1:f23f with SMTP id
 956f58d0204a3-6627834a0dfmr11152146d50.57.1781521328563; Mon, 15 Jun 2026
 04:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260529082948.363931-1-alex.bennee@linaro.org>
 <20260529082948.363931-8-alex.bennee@linaro.org>
 <CAFEAcA8719Q=VCwOm790V6FPA8FyaFZEux=N-7PmOGaaq=O_sw@mail.gmail.com>
 <878q8gjcms.fsf@draig.linaro.org>
In-Reply-To: <878q8gjcms.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2026 12:01:56 +0100
X-Gm-Features: AVVi8CetPPb2pY0cel9IN6dR-6aJAbVnjHAtVmBC5Df3VBbHh0Upbt0eeYxUK3I
Message-ID: <CAFEAcA86_a3GfXCDOo2G-R6v3ALwUwNFRkspyTCR0umGiAB2Hw@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] target/arm: handle the WFE trap case
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Mon, 15 Jun 2026 at 11:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 29 May 2026 at 09:29, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> Now WFE can actually suspend on A-profile we also need to handle when
> >> its trapped. To do this we need to pass the instruction size so we can
> >> deal with the is_16bit syndrome encoding.
> >>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >
> > Doesn't this need to go earlier in the patchset? Otherwise there's
> > a point where WFE can go to sleep but doesn't honour the trap bit.
>
> Hmm - the way I read the description was we would only trap if we were
> going to sleep. Pre 6/8 we never sleep so we can't trap.

Yes, that's the point. The guarantee we have to uphold with
the trap bits is "if the WFE would actually go to sleep, then
we need to take the trap".

- before this patchset: we never sleep, so never need to trap
- after patch 6: we can sleep, but we incorrectly won't trap
- after this patch: we can sleep and will trap

So there's a window in this patchseries (after 6 but before 7)
where we don't do the right thing.

-- PMM

