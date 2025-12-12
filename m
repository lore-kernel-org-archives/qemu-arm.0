Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B501D44166
	for <qemu-arm@archiver.kernel.org>; Fri, 12 Dec 2025 10:51:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vU0ji-00085m-Kh; Fri, 12 Dec 2025 05:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vU0jh-00085T-Cc
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 05:50:57 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vU0jf-0007bg-RM
 for qemu-arm@nongnu.org; Fri, 12 Dec 2025 05:50:57 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-78c33f74b72so10032627b3.2
 for <qemu-arm@nongnu.org>; Fri, 12 Dec 2025 02:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765536654; x=1766141454; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qxws8ka21ttXeCW4oYk8itW09Z7jkXtxCGVc34Etq6w=;
 b=U9Yddgjdu2vGD26LyOkWNEnBkU/fQQy5zCgBr7i2o8rE1zJkGbGQK8Q8o3wYt/Ly8M
 uCuheytD/Gy+TjlZrdm41KIWY8MkV5yX8Vq0r3Uch9j+zYrzugZHJWOMQwVhb6EeNkoM
 ZKdMOXc8OM194yJkfyuDMx6BGbs2UlWXfYvY20oVeseZW2SItU2lSbucTm9fcar2emJH
 /VdvPg8m65o1Ey6MO+lZ6OAlNmgLuhjevPoIK/T6lIR/an2bKE6DXrHb+iuozc2+0d6/
 GV4hgsO76QVjXWNA3PCiwxKOXoyLHlE4duZliprSrU6YCD0+pmTtN7Q56NgsamIiaGE0
 vYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765536654; x=1766141454;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qxws8ka21ttXeCW4oYk8itW09Z7jkXtxCGVc34Etq6w=;
 b=X2ie+YhOAIzoZxofgb6rZ3EaOupSO9uL8Z69ly/PimkYYUL0EMIGWzj0L9Hfp55WWZ
 ZK1BDhgVhKEP53JVNiHM6X930OL9boggHOiXmy4MQukoRh++soemU0uHtEE6igX3GHoa
 oOFHlng8/ligHR6u9/OLIcgBb+KWSH66WziOmRWizjfUP9uG8A+Y6uDttpiNYXiOLuWy
 vXZEE/+bIn0V39C7UhZ7/+yprjtrqrSNpkKuc2tZIUrhtJSfiYdxHKjXo+TmHIy7jTa9
 1nJvDbP7jaLxdkWxiBgjn5tKZghb8PiPW2/wL54vl8i4SjsWAlXchooPuWLVn8aDRoHB
 NAGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuKn27CPcECo0LdYOSxaxzq9jTUijb2XA4TIhEV3cEI1dbxOwVbzqMKy2QcQzFY26Q9d/e3uzD2Q==@nongnu.org
X-Gm-Message-State: AOJu0Yxt3N/kx3MHNWA9nYnL42I3qAVxCO+t8Qv2RsA+qdS+aPlrcFSj
 6W5GEIGPDbiDJh/NOv1jVEWFvWvb6zN2Ote4/vdv+40kxokpbmYgc3kxlR4dC7NCrS8JF1UTsjR
 5aYQkavoO1KkabJkLVUkqc/uvxtrkr0K9jRZjL0kxKB/AWTe0hwVALxc=
X-Gm-Gg: AY/fxX4pk/tXmkBIy1vf7gfm7pYoTpyw0AT9MYtBGYoQF5VKFdZ+1WF1BgXWC6hLMCo
 1C62XdOdZe2rD5Q2Rdu/4BlMLbs4NryypjN7qWUXvS3vbSbuzXLKYQ/0O8FD1BJHKOK18BoHyBD
 nOh0Ybj5mvKfKbfFlbc+dOEbbJu+StgiTr/DqcNfl/stMdkAVWSolD2fYs0uSAYeXps7+RpaRL6
 7al9SAllBGPicDVGcDxuya+PmWli6BcrgzQe585Zi+NT/5pyi1UkEkFkcRwPQUqY08Y0BaN
X-Google-Smtp-Source: AGHT+IH1Hl17F3VP+vn+4468w5RKbCuKd2KO9s7WfFQ8WaQCT/Z2rr2Shp5IwTZIxhIBNYS7/LQGv05k8ZjInsrwkpk=
X-Received: by 2002:a05:690c:4d41:b0:78c:2db5:c40f with SMTP id
 00721157ae682-78e66d4d37fmr12129477b3.7.1765536654477; Fri, 12 Dec 2025
 02:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20251211221715.2206662-1-pierrick.bouvier@linaro.org>
 <87a479e9-21eb-4c4c-8e64-32744eea1f96@linaro.org>
In-Reply-To: <87a479e9-21eb-4c4c-8e64-32744eea1f96@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Dec 2025 10:50:43 +0000
X-Gm-Features: AQt7F2qVzsx6GaEHa2U0We30s5xQdtv60XW0t2uskNdTHLjDb1juxI0OM5LC514
Message-ID: <CAFEAcA9cd+v5GrWK3KPjQ9ZURHbNzx+_SywcBaZdeAxYEk_NBA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/smmu: add memory regions as property for an SMMU
 instance
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, tangtao1634@phytium.com.cn, 
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Fri, 12 Dec 2025 at 06:16, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Pierrick,
>
> On 11/12/25 23:17, Pierrick Bouvier wrote:
> > This will be used to access non-secure and secure memory. Secure suppor=
t
> > and Granule Protection Check (for RME) for SMMU need to access secure
> > memory.
>
> Sorry yesterday it was late for me and I forgot to post the similar
> patch :/
>
> >
> > As well, it allows to remove usage of global address_space_memory,
> > allowing different SMMU instances to have a specific view of memory.
> >
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   include/hw/arm/smmu-common.h |  4 ++++
> >   hw/arm/sbsa-ref.c            | 16 ++++++++++++----
> >   hw/arm/smmu-common.c         | 24 ++++++++++++++++++++++++
> >   hw/arm/virt.c                | 16 +++++++++++-----
> >   4 files changed, 51 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.=
h
> > index a6bdb67a983..0f08ae080c9 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -227,6 +227,10 @@ struct SMMUState {
> >       uint8_t bus_num;
> >       PCIBus *primary_bus;
> >       bool smmu_per_bus; /* SMMU is specific to the primary_bus */
> > +    MemoryRegion *memory;
> > +    AddressSpace as_memory;
> > +    MemoryRegion *secure_memory;
> > +    AddressSpace as_secure_memory;
>
> Has SMMU concept of "secure memory"?

Yes -- IHI0070G.b section 3.10.2: when SMMU_S_IDR1.SECURE_IMPL=3D1
"the SMMU can generate transactions to the memory system, to Secure
PA space (NS=3D0) and Non-secure PA space (NS=3D1)".

When the SMMU has Realm support then further (3.10.3)
the output PA space can be Realm, and also GPT checks are
always done to the Root address space.

So an SMMU with Secure and Realm support can emit transactions
to any of the 4 address spaces, the same as a CPU with those
features.

Separately from that, at the moment the way we model Realm
and Root is by using the same QEMU MemoryRegion trees we
have for NS and S and just using MemTxAttrs::space to distinguish,
because we don't have any need for devices that appear only in
Realm and not NS, or only in Root and not S. So for CPUs we
collapse the 4 architectural address spaces down into two QEMU
ones.

For the SMMU we can presumably follow the CPU there
(with an equivalent "give me the AddressSpace I should
use for these MemTxAttrs" function as arm_addressspace()).

> My understanding is just a
> different memory to access GPT, so I'd name it "gpt_memory".

I would prefer that we use the architecturally standard
terminology here.

thanks
-- PMM

