Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1001958ejb;
        Fri, 2 Jun 2023 02:08:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VQ6lN18KqEHNaraXMBGYiNA02S6BW8QLz5It48E5/BglHit+qCmLqWpGJ+HZJ3XqS6OHj
X-Received: by 2002:a05:620a:400a:b0:75b:23a1:35f2 with SMTP id h10-20020a05620a400a00b0075b23a135f2mr16992265qko.3.1685696898221;
        Fri, 02 Jun 2023 02:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685696898; cv=none;
        d=google.com; s=arc-20160816;
        b=k+VjlayPg7FsbglhBxGlBaV3TTYqq/17Y1SgXvJIUUX62ifffYJ13ZUpDijQAyEDhk
         3DkZMkXXpeojwzsVEvmuHXVhyODI+o6QTVMIFMpT6SQex3p0TfLHG1f25fbHDlJ0Up0Q
         KfMMhociaex56ZubCN0t/goghvZE3QEH7cfikbOGzCjLFYfz3iRwUWqzHudhRhWrT6m3
         HfagJcF+1gdy65wJAnSFRCQPHz8yRV1qEa9P+vKQfwOW3F+2/Gi+o8zTfvz6J/iix6l3
         fjO6rfsYKnMIh9mDjnJEOfHnowvVPvxij/G7rpfgP7wX8XbMdHQMe+lTGukeo94TAtgC
         mW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bu14ceylCClaJySjbsOXEaE9OqiNUXwrQIr4+8JYXZU=;
        b=VnG03iL6yQAzThrq51tumGknjtYwOnvACjUmMh+1eAZ0JfK55qIpWbbU+SYW3w6Wwv
         VCF2OIB6SD0JGzggKSEpUewIKVdxocHJDqTvvsEYL6tCiE3iNnB4zaLeABoOPrvNlTC8
         42k5XzOPPD9bOQJzR0g4sLUZkXL43cRj8myFOyBrnrgsRK4NmY8CvBn/tggp07DMbYg7
         1w6EkunN6fTCtUsKk/fVeNWh7W5gNB87A2HmbzES5NKZWcPDbmR85bZRrubdOrUIIDaL
         2fPJeac5C7G091niV6sNk7TmSyfa7a/bE3AVz1tanEeukktsZ0XcltCF42C+y4b5gs4N
         7+MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GZay4lqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h7-20020a37de07000000b0075d1c827758si330172qkj.575.2023.06.02.02.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 02:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GZay4lqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q50lX-0006es-Mf; Fri, 02 Jun 2023 05:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q50lW-0006eU-Mh
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 05:08:10 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q50lT-0003Jw-Ue
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 05:08:10 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5148f299105so3974609a12.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 02:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685696885; x=1688288885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bu14ceylCClaJySjbsOXEaE9OqiNUXwrQIr4+8JYXZU=;
 b=GZay4lqKzU4XU7SA7g7DB8nfmzmyYxR2hZsx1zg+oWpAMG0Bev+nN8dtsmG4LPnNMA
 LA5/KOwKnKbR94WJQDj5xJTPG9/XkYzAQ3aP6SlzW3GwIhJK2MIjMgygSdPIohyUQ9XU
 zHn3dauPIdTtt4h5jXoXu+3L7v7LrWipTK9J2AuqHEOE3AAxyF1RcBgczzlL1u/U6VoV
 YlVkbhLySkynZSmsmjXW76wJ0SLRMJ/mS2J4cQLqOCmngmvnAsTeJ5iA5cmW4HYcfr34
 AyFCNfB0YmlOFMNqm6K2L0aRrikjKm4cGnG4FVtZepwdLWyue//Gn+/hTazP+DlU1pXb
 FRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685696885; x=1688288885;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bu14ceylCClaJySjbsOXEaE9OqiNUXwrQIr4+8JYXZU=;
 b=CUMpItO/WDf8HvxXnYrGhjtX7/nbXpB5DsK7p08eWIYmQP7HGxKmcdsGx8WTxeSi3H
 AkIMOPuNyFr1iaqmpojgBMfmNodWDDroJbArb6Ks53ItGt17oC1FQiY6+m6sAL2PtLRu
 VjFBfGVqddGmazDbI2oR3caQGeo16C863j5jO5wAnqCElLBbLo6uLAugovdDt3QyQJbK
 O717FtZWjsRxKJCSc4MzPMgYFHyNKuxsx+jn16osu2fdvux8xz3GOBiT2006l6T+rcuU
 48ZzP31uzJJpWtpXJvHYY2P+avESzyQFqSmmGNvXnO21Ubgx3+l1aWQLnqKd9wvrl2uY
 BZgg==
X-Gm-Message-State: AC+VfDw5ONxQiTSOKB/BTuVXnBQlFCUga0391mE5BDRV3gCN/BFjhz84
 OA60x4CqxUoBjZEow/S4CTpRw/+7rNoT/eapUThsZg==
X-Received: by 2002:a05:6402:8c3:b0:516:2aaa:9bdd with SMTP id
 d3-20020a05640208c300b005162aaa9bddmr1948946edz.7.1685696885539; Fri, 02 Jun
 2023 02:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230601143312.69691-1-quic_acaggian@quicinc.com>
 <CAFEAcA-92-zExcOFMwaNYvP5pXLTUETsYi3mpuvTp2txfVEp9Q@mail.gmail.com>
 <11f8fb60-abe7-d99d-c3bb-aaa405425668@quicinc.com>
 <B0A9BD1B-B98C-4710-987D-03ADDBB993B7@quicinc.com>
 <CAFEAcA8tCZ0shxEiA4hOVsHhOBvGmQ6HLJq1dPKDuSqBXKdtJw@mail.gmail.com>
 <033C707D-C8DF-4DA7-BE50-F19DE2A17FB4@quicinc.com>
In-Reply-To: <033C707D-C8DF-4DA7-BE50-F19DE2A17FB4@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jun 2023 10:07:54 +0100
Message-ID: <CAFEAcA-CSzE=bzCR-zx6hPqmiV9pv8CqwXqv9ui3sZXbWkZZjw@mail.gmail.com>
Subject: Re: [PATCH] hvf: Handle EC_INSNABORT
To: Mark Burton <quic_mburton@quicinc.com>
Cc: Antonio Caggiano <quic_acaggian@quicinc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8C+jy2VpKl8m

On Thu, 1 Jun 2023 at 20:21, Mark Burton <quic_mburton@quicinc.com> wrote:
>
>
>
> > On 1 Jun 2023, at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote=
:
> >
> > WARNING: This email originated from outside of Qualcomm. Please be wary=
 of any links or attachments, and do not enable macros.
> >
> > On Thu, 1 Jun 2023 at 17:00, Mark Burton <quic_mburton@quicinc.com> wro=
te:
> >> This patch came from a discussion on the KVM call the other day.
> >> It may well be the case there is a better/different implementation
> >> - so the patch is more by way of asking the question.
> >>
> >> Re-phrasing your question - I think it boils down to =E2=80=9Cshould H=
VF
> >> (and KVM) support executing instructions from IO space?=E2=80=9D.
> >
> > I think this falls into "might theoretically be nice but is
> > probably too painful to actually implement". In practice
> > well-behaved guests don't try to execute out of MMIO devices.
> >
>
> >> In that case, this is a =E2=80=98partial=E2=80=99 answer to providing =
such
> >> support for HVF - partial in that it relies upon a memory
> >> region being created =E2=80=9Cdynamically=E2=80=9D for the IO space th=
at
> >> has been accessed as a side-effect of a normal access.
> >
> > But nothing in (upstream) QEMU magically creates MemoryRegions
> > just because the guest tries to access them. Either there's
> > nothing there in the AddressSpace at all (definitely can't
> > execute from it) or there's already RAM (happy case) or there's
> > already a device there. If there's already a device there
> > then something would need to do a "put a bit of RAM in
> > temporarily, fill in the single instruction by doing an
> > address_space_read() to find the data value and writing it
> > to the scratch RAM, tell KVM/HVF to do a single-step, undo
> > everything again".

> Indeed, that=E2=80=99s basically what we=E2=80=99re implementing. In TCG =
mode you =E2=80=99see=E2=80=99 the access, we=E2=80=99re just making it so =
that in HVF you equally =E2=80=98see=E2=80=99 such accesses to the =E2=80=
=98device=E2=80=99 (so you can put the bit of RAM in, out, shake it all abo=
ut). A cleaner implementation may be some sort of =E2=80=9Cpre-i-side-acces=
s-op I=E2=80=99m about to access this device/address please register a =E2=
=80=98memory region=E2=80=99 I can use (temporarily)=E2=80=9D. I=E2=80=99d =
have thought that could be useful any time you execute from e.g. a temporar=
y ram of any sort (whatever the accelerator).

This patch doesn't do any of the "set up the RAM, single
step, tear it down again" work, though, which is the complicated
bit. It just retries an access that ought to have worked directly
when HVF did it; which isn't really what you would want to
do if you were trying to handle HVF or KVM exec-from-device.
In that scenario the "read from the underlying device" would
be in the middle of a large amount of other complicated code.
And without all that other complicated code (which I tend
to feel is not worthwhile as a feature) this change is
completely unmotivated by anything we have upstream...

-- PMM
