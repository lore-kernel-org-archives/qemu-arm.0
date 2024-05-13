Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2084649ejb;
        Mon, 13 May 2024 03:37:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUTX3hghIksBwINsikC0zX1qMpkqt/Wlp6KFE6k9yG7zUEdUarh51D+wYn9P+Ipo+C2Ltih2JxD4Q7ZNkgdUXUh+YsKo+WS
X-Google-Smtp-Source: AGHT+IFSme7ar0knagv7+ADbJaxx9mT58GvrsWEeK0k3oH1JzTqhDrgDyDc9c5+Kx7MPt7JYNvQI
X-Received: by 2002:ae9:c009:0:b0:792:c268:fbf0 with SMTP id af79cd13be357-792c7576ff6mr969024985a.6.1715596640084;
        Mon, 13 May 2024 03:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715596640; cv=none;
        d=google.com; s=arc-20160816;
        b=PX9ITKpoond4d3EObXbSatr2fRsDq6sPYpV4HE2QngZcu1MSe+WOX+cZcJu7DkwbfS
         Z9JD+ip5+RFJVmpJHHR4YDi5TkkAsuZJ0zKcqtUblIBEbvMiOzUMEorvQ3lTa9Vh0NnM
         NaDn0WvY49fpVwpqBHBvlKpXMCLK7T4rDmuElkLJ2pmvHjuLZ/KupcGC6II+F36DT/CT
         DsHWiwLQmc54N4FU65HoZ5Ur9LDMObkLi+1oXERbebRnJzKiiVjlYVjFEitIAGmKTitW
         TejByoDwlREEXAr9LUIHYgRT5D7Eu+8e+oB0Q24VBVXRbFMi/SbT3mNTJvagDya8ID9P
         h+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=74BE1kBokuyrBS5zaS6ZNTdWvkN4NdLOXCPer1bfnaw=;
        fh=B9JULoQfI26EuCQytIg7m5FxZWmwqBr24ETuAahxRpU=;
        b=OarglCg8G9Ba8LEj1hk3qZQ+baDa4kGdxb5xa+XE/XSJIn+SzPh1EwzCAUhlI1oIPA
         MYsyX7yh16/GrYnyK+PPyZXMkAVefin6rQlNyrtBrQ+BhmDlgzVizYdZ8VkAT3LWSr2a
         qneUGM1vqh8tbsjoZJ+18LH1NLdxnYF/P07MotXwkYMIfrVguRPCxxqAcAVRbJrRZSky
         6e2eXDV5L7x3CmvCQdkDK3vmFeMPYLQPQLgfuTeHaQDA8UvU8mxgrbCStKM9sNhpXTPY
         bTMuTwVQfNZdb4JYICU0RJrqPpfkDCefBvJzh+gW06Ais1SHL2QxtzF7mzPw8GBGXnMy
         T1Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gY8qlerd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792d89f4fd9si407828985a.109.2024.05.13.03.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 03:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=gY8qlerd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6T3I-0006wx-4U; Mon, 13 May 2024 06:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1s6T3G-0006wH-9f; Mon, 13 May 2024 06:37:02 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1s6T30-0003g5-Id; Mon, 13 May 2024 06:37:02 -0400
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-47f3e985a84so1482387137.2; 
 Mon, 13 May 2024 03:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715596604; x=1716201404; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74BE1kBokuyrBS5zaS6ZNTdWvkN4NdLOXCPer1bfnaw=;
 b=gY8qlerdLHwF/FISfUkwwGBBv/z5BaYmzqWn2KBY3tTf0vL28c4SdidFRDSV5OiW2G
 vTT5fwN8ZL00Cp7bK8OrpSqsKaMT0If36DNnUQhSxqohnb+cEokadLNkvdpiKko/IOgw
 bJs/SF4AKlYEuNaBAfoQa+hmzeJUEIlcG3GAvGyAmc9EcZMohZWg1QMp7AaMijqUxoq+
 0M2QU8EOgWenOeYHWRJdyyJic14VJ0zcWt7UzQJptbwTOIZhElE5QNb+jYwTnNiSs5Nq
 ZGeRD3ShDPZrnNs3NV0dn6AzFOukft1tb3QIOt7hlhIiq9cY0hGvabNdJeyvgpPIVGY7
 5SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715596604; x=1716201404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74BE1kBokuyrBS5zaS6ZNTdWvkN4NdLOXCPer1bfnaw=;
 b=Zx2rMI5zAQmW8RhGB1dre6+KiF5S+x2M0/QOOsmaSaT/Kmj3Wh+uLaiCABCV5e1xUN
 SpNIvQTzNFSu9XHyZU8+VzCP8+X8NHypFDwgNYP8bzIUUt/a10so+ODNFrXImrQtgnhe
 jXy+B6RJcLm/Nivvm70AEhl5W3smsFMJfJ+9KAhxQ7bL1yAiNgrzAc4YSJ7Q0vevAD5j
 asOgZNUq6n+08gW74KDHHTHIjzDTS/ThSu3vLsqnJWhxeBlganqtdrQuBREIATOKnZcz
 HYcppDjqCTIGuCSypca98NoMDPYBf7R8pqkZYQoGidzv7FYJXRx5krZv631/nWyG3cpQ
 J06w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz8m2rf3Rzzjf4b3yZ8NqHjaTQCsIcGZfqvlDaGNCcRDD/4FYKy96GjI3TCkS2/OFj80gKvQNZ4Ik8HYP10DGl90feiR3kScaNvJQhn7aXIFn9ki0qK/pYLkj7V3WwXoVRVAO8/L2Fgm6jH1a7f7VAsQ==
X-Gm-Message-State: AOJu0YyLSuBrzVy/1tYo8i9Kmoui/wlXBfYvoAE+Cf45TIVt1h27TzeC
 4diCHxz/lvlNsl6Q6dI/2jcaiWUjVlJ5AWVzKPUwTPIBU0Zd0UC5HFcCQjsB1ncL9kMLPUEZPyB
 Ud7bNPtD5uUVaakL9cXQn637RNgo=
X-Received: by 2002:a05:6102:3e8d:b0:47c:14eb:5fdd with SMTP id
 ada2fe7eead31-48077eb638cmr10423783137.29.1715596604693; Mon, 13 May 2024
 03:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240507052212.291137-1-jeeheng.sia@starfivetech.com>
 <20240507052212.291137-2-jeeheng.sia@starfivetech.com>
 <CAKmqyKOmt1UAbSnVbQ2fLVwoPP3u=6r5hX+gVO2xhLKidQ-8-A@mail.gmail.com>
 <20240513023110-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240513023110-mutt-send-email-mst@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 May 2024 20:36:18 +1000
Message-ID: <CAKmqyKP1fmvyNsY0uXasK7jdHK9C_cizJdiqivK=Nxtfo37OxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] qtest: allow SPCR acpi table changes
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Sia Jee Heng <jeeheng.sia@starfivetech.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, imammedo@redhat.com, 
 anisinha@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com, 
 sunilvl@ventanamicro.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iBXGeQrDbOHz

On Mon, May 13, 2024 at 4:32=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, May 13, 2024 at 01:55:50PM +1000, Alistair Francis wrote:
> > On Tue, May 7, 2024 at 3:24=E2=80=AFPM Sia Jee Heng
> > <jeeheng.sia@starfivetech.com> wrote:
> >
> > Can you describe why you are doing this and that it will be reverted
> > in the commit message?
> >
> > Alistair
>
> What motivation are you asking? This follows the normal acpi test update
> procedure.

I find it clearer to have commits describe that they are disabling
tests for a specific reason. That way it's easier to track what's
going on.

If ACPI test updates don't usually do that then that's fine with me

Alistair

>
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > > ---
> > >  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtes=
t/bios-tables-test-allowed-diff.h
> > > index dfb8523c8b..3f12ca546b 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1 +1,3 @@
> > >  /* List of comma-separated changed AML files to ignore */
> > > +"tests/data/acpi/virt/riscv64/SPCR",
> > > +"tests/data/acpi/virt/aarch64/SPCR",
> > > --
> > > 2.34.1
> > >
> > >
>
