Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D048B109319C
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 09:18:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Vzq-0003Ca-2s; Fri, 20 Mar 2026 05:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3Vzj-0003Bj-B5
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 05:18:15 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w3Vzg-00051e-Oj
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 05:18:15 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-64e8ae85700so358202d50.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 02:18:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773998291; cv=none;
 d=google.com; s=arc-20240605;
 b=TNvkqz46+epTSnCFQWgwVxJrIdDz5Ziz3X/WxvtHXHp/M6OhDFFvlfY9ieByIkl+q8
 W1WmIe5SN2F4mrD+S9si4o5NCqN2bOCMU1eaitRgFtqDlZlrDlFu21PAlI8U1rW7od7s
 wwtNph3bw7nseoVaIE6kbA2KuWZlxaCd8s5XA8nWVqZtKqzQ4GIEgfOT9M89gZPofBPv
 NP1Sde5kH4W6hWGpiX7d8J0oxjDl12L3CAOoohaHeJ+5KcLRRESbMOiM/cHYpvBOtGsY
 i8GFbQ7lGeXXO2zZkx9rwMCg6jmjO7dPoUjduuGNKGdvBALjnnh9GkPKhJfRctFEcgJq
 m+AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=l4Z7aNuRjzUBmRND1DHS7Om+q5WS6ASYWfNDtxCuz/g=;
 fh=OWdsZA9hRnwY1gGXFKrfvScBwB84RBFKpS2fNzZ5urM=;
 b=XtYXeytHfuN75Juz0jiqL+OxP4/t2ryV+9pGRRYw+IJkLbGGoDM4j+I9BdZ87gvMiT
 Uco6NeVGPF6jifo20CtSwQpjJ3Z8sKcf/m5h8fUCCcpxYnGnLbzeab3ga2PIsMK/QmVI
 LDrFQ7+zgHrYdbv9h2I3NWff21C7Nq1Vzmsjnr9OJL1alQ5kQX+GJtjUJ/zaVl8qc+n0
 YhlX31JIu+AtMoiKQOSo+CsVLdoVn+KgmHXW3/yL8zYxhB3OS6hOEzj7kl+4U0qi0tAj
 4ILJvDprYg5LFBlbLXFMaBxH1LV0ra3kwVOgw1CGL89W/ULaX2sLyFJjw3W0Euad/SeN
 WKnQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773998291; x=1774603091; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l4Z7aNuRjzUBmRND1DHS7Om+q5WS6ASYWfNDtxCuz/g=;
 b=DZwEtEj0pJc/tfmGaOZ3dQhwW1xBEIyLTHE3WsoyyTrYYUEr1ZMTyc20Ew1ZsYkCm7
 junaKwjXh0IGMiQBtz9YPSKp3iOr80gsoXAoDK0qDVxo/nW2PbKTheZYMR4UrHwJaq1W
 y3Kf+b7a9LBoE4lsyxPJjc4OEn2cKxcf5Vmi8qs+fvJ2urrhhybGvtU1fyREtouutR/t
 JPIUSQX1FEt7MCU1trIU8Kz1gYqOT0ssjFp4Pyl5zTe1vcg2XvsiNFnRTOAirYLNeyqt
 nNYtU9RO4UK6skSqe3L3kwXqMMbBtbWFE+kY2SvVXt9Ca2olwNmx1ktwrOk3ven4zCu9
 mvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773998291; x=1774603091;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l4Z7aNuRjzUBmRND1DHS7Om+q5WS6ASYWfNDtxCuz/g=;
 b=XqXVRsR4kG0SQCQ/CcqFS7F3Q4Z0fwSzB4uYFz93euM7LKQVbyk0lK9OGWU+AQTlRI
 qP2YmW6pbQZP0/mygMlFRyWGkfDVWxFPT267kydwKji1nZA8aqhWDGSFu4OCXETK9V5e
 ZvnrtOpkadSLSk46xxM1og825l4BAoeDopnoy5UDr6CtBUN2SN/sEB1qMnw0qvoAy91c
 nSD12j6rK1t0OFU4oucWa3/FBVOBiE0W2mjEz3ws6waNLv7jyrNBhFyf0xIw/EedQF9V
 hxCqMLKwTK3C6Bv3/22sSLAhTfeM25209KaXNbvKT2/evfaR3oYViDxGTXAvF21VOda1
 9asQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGeKpP/fQ5HRQxneUldqVO001Xj/Eo6+JPANKN93mgq3hW9VtBDhFTU+tH5Ay5nfsAhCWFz4JDww==@nongnu.org
X-Gm-Message-State: AOJu0YySrgGfw49UtPMUOBerUa44qiuUhDyX7Sc8e/ukj4C+QAjiSSnt
 x4jCWs9tDm7eiiVvuniy5hpanCKdo/jtvKenoc8MAgBnzeAoz+KehsyzRJCh8lQjNDJFN6vVIoc
 wtMOSCVTaFh/W/or9rJj8q6UDT+M1RTz3dOfynkkpgf2i9hBN4pBirm4=
X-Gm-Gg: ATEYQzwN1f6RRMWscJUtWNZMNGc6vp8JAptW+WtIWNK/TClGbB9M5aLRZAw4/l8d8QD
 +iAbDXRjMjPyIJ+9wAok6GaH+ttWOd2NF8jOBLQ7jaMPpNPewOwooEzUAYwuzHsS0B2zlktYaxH
 KOFNP4wqqbL1f0/DW8+4zR8N+gzk+RQmn5SbbRYLLhZ79MQ+Zf21NxXHWwRiz6jZL9Cg67AzGDm
 RqZaWi4iBnqHLx5f4dkA3n7mCs6lmPFrzvfT7v+LzMvUByc/rrXmQ7jdMvW15bniO/s+xcbLSqE
 LolBWffXICjBBPrffWZln107bS765vutxQRIbK768cwV8cW3MmxVzcaKmKIBZis5PY4=
X-Received: by 2002:a53:da51:0:b0:64e:885b:412f with SMTP id
 956f58d0204a3-64eaa86cf57mr1833154d50.74.1773998291472; Fri, 20 Mar 2026
 02:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260314221529.47841-1-mohamed@unpredictable.fr>
 <20260314221529.47841-4-mohamed@unpredictable.fr>
 <CAFEAcA8v59wSwRvig6NRjWHyvBGY=gPhWFN1B_jD9k+aXqo9Ng@mail.gmail.com>
 <4387E53A-E140-48E9-80C3-721F9C0B9A9D@unpredictable.fr>
In-Reply-To: <4387E53A-E140-48E9-80C3-721F9C0B9A9D@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Mar 2026 09:17:59 +0000
X-Gm-Features: AaiRm52U5H1VAFgWENUse7TnvPutr7-mdKyQN69nWTB1e3TKSviiyWfJY2RaKG4
Message-ID: <CAFEAcA_wVD+mMFhwzDyHx1pY_aMtBvdHjZqQoFoniM_JUCcceA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] whpx: arm: enable more enlightements
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Thu, 19 Mar 2026 at 18:50, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
>
> > On 19. Mar 2026, at 19:13, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Sat, 14 Mar 2026 at 22:15, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >>
> >> Linux uses AccessVpRegs without checking availability and panics if it's not there. Expose it unconditionally.
> >
> > The commit message subject says we're enabling enlightenments...
> >
> >> @@ -953,13 +953,15 @@ int whpx_accel_init(AccelState *as, MachineState *ms)
> >>     synthetic_features.Bank0.AccessPartitionReferenceTsc = 1;
> >>     synthetic_features.Bank0.AccessHypercallRegs = 1;
> >>     synthetic_features.Bank0.AccessVpIndex = 1;
> >> -    synthetic_features.Bank0.AccessHypercallRegs = 1;
> >
> > ...but the code change seems to be removing one as well as
> > adding the three new ones. Intentional?
> Hello,
>
> The AccessHypercallRegs bit was set twice - with the first one being two
> lines earlier - removed a spurious one of the two.

Ah, right. How about this for a commit message ?


    whpx: arm: enable more enlightenments

    Unconditionally enable some more enlightenments for whpx. In
    particular, linux uses AccessVpRegs without checking availability and
    panics if it's not there, so it's important to expose it.

    We also had a duplicate line where we set AccessHypercallRegs = 1
    twice; remove the duplicate.


If you have more rationale/info about the other two we're enabling,
that would also be nice to include.

thanks
-- PMM

