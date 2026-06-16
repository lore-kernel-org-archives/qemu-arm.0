Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55A8CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 08:48:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZPTQ-0007bD-Tg; Tue, 16 Jun 2026 04:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPTL-0007T4-D9
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:48:40 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZPTJ-0008Lo-R0
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 04:48:39 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-660e9ea23cbso2220017d50.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 01:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781599716; cv=none;
 d=google.com; s=arc-20240605;
 b=MdHT/JEWy4ttDKISVAFtQ8UaWzNc2rD6/uYdN00FxyfcXMMCPOR3I80JIBX0+SC954
 SIoi7kb6IB4SxHs+koM+o3ugirr7W0JGfJmujL6jHC4UcHAOSIBWzcqCc8a4plxqpvuw
 2lrNqzV2ayWuI+UWYB1gh8HIIE/OlqxNabBNOwpeao09jEYitCA+xgpYnTR71fiWAUE1
 ZckkkbkaLLsB2e6Ajo1x+Th+97hjTu4OohSdMwGbncdwO3jdAXy1eWV6MJzRB7pCvqKR
 +Dkqgn9IzAVVJ+YQuYPgbbePPct/2W6Yyvdvp+2ltL03QHijQwGUfERlLmcU920Mz9wO
 K+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XvkHOIzaUam1/lYBeJ7E97rTLbuNkdxLaj6A96hVIgs=;
 fh=KX/qzukQnGKUmqzzSTLXP5PyNUG8LQVVajswSiIBVWc=;
 b=WRwLBzn/Al9eU98PE/+hwsCK3cqXQ0pps2rdalz1/WAx4itvTRdZqhQepaSxHs4z6g
 Mr9nyGZfDdkjKqsdZvgkcC81gcElzkj0uMFA43HHAMyMt/Q5AS5gimwDxPj+ayMGkPz4
 FQ1sk3VzUG4iUC3YzT0S9CTWkkQYyI4aNumI0teKjVjctizJzHkEBcDjOMwSTgFrhz7N
 VaxpoNwaDaZgi+cUtKoOTAClE/sa6JntclmBGTBNjtyoJVqF/jRIxVRU009Hncb5UgUI
 WO1F5o+3oRVIQGf+/wP2g0z5DTBXpUNu2KabLiiCb7N8ts5BUf9wZ6oIDUrJG1F6w6Oh
 2ngQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781599716; x=1782204516; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvkHOIzaUam1/lYBeJ7E97rTLbuNkdxLaj6A96hVIgs=;
 b=HmoR+jBIqdYqFJGchbSVSPYXXXv+OAltR/DGHiAKOrkCYVEKgV4F9tItcOIsyKs73C
 QcI4YybeLx9JMYOCPcWkawROArztl2ZDOnKAKuiAM4+Ah+HDS0is0SmPalKE5HOSuM8P
 55ANx0yIp+4l9IgUAt/m3C4+RQVCnbhhXQaJIjTEDHgg2iA1luOpMNqAg+CRHG8FblYo
 kutGt5yYlq2ULOi6JTMw22n1RgZ48UDVXSyyZRd3mczIF+pcDWNKiNA/vmIZyQqt7tev
 sEdN/Izd2v9pQ1nXQM22861cAkey4ZWqbNhmZ3lo2yBdKq0AbRclybp1/SfrETWobyEF
 YWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781599716; x=1782204516;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XvkHOIzaUam1/lYBeJ7E97rTLbuNkdxLaj6A96hVIgs=;
 b=L/gpUPAsRNeKrsxutyx3cjUX0dXXzavEtJ3m9e2aYpybvNXTtJB6k7QhTYfQLzoX35
 D18eb4KpMyd1M7ILNZoGQbCokZruoQdSTCzevGmQ/Vav1crWc7bnw28IU7mlWOA0eNWs
 j7n1/KHrpFgz4KVx386vAZlEWoT1MhpTI3ObCGTwYCJNmU6F4g2KVdw5IlmecO4O7GEI
 GkIOw78ZC5m20/jPJyexU3W+tANF1DkesHezTInFt/sV0T6RLv9SZxd5rag4KIhnVoYB
 mvDNKQJtWrtDcy/ZD5yJrqiP3vfdiIpZre6Yg1D8DSUw9nYwBs9Yxhh9MUJzcSIowqW0
 zxgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/0BblVyavH7Ks2jNHFSfd4qRZJfGfzK1A/maP8luhXGluCkaumSr4WWQ+jR43YNvlak9rFeToi5A==@nongnu.org
X-Gm-Message-State: AOJu0YzI50XsowL6BqO2LNACCfPKB+JTTbHMXbdiLymSotFuT1ga2s+z
 pcAlx9eKwYT8NtaswVP0tEZiuygSsAbTTukJufVhtrYQorgMIucI3RpsVGN4l6Z19U+pGQaWwFT
 gjN/Aa9IIwo2MV+nBwer86Km8hS2/VULYRq/Nzi0Gm5mFMmOjqoy2
X-Gm-Gg: Acq92OGByRa7w2ORIMw36EqCLrOhULt7SnGcuG7BXIs+TWNCkYVpn4U6rIg/Y1Emnmm
 kJzp0kJ7jcjOzwAGDCZvdDcTfj/JnZMtA7vqGjewxTe9cO+iFm9WXGTnd2kU+tgXntN6uiqj5iD
 5OVFOs+LEt+oFsLPCyY0J7lkhK9vkVn2Oj7SwRL/6Vyn1kDyg81c1AV6pgvW5OdCLsvfMBgSkU6
 NANHgv1qtQ7xTyiN/ASjwCk1CHg8JhV9Aqgzkkg9b73kNRnFdyVHyBzpG1qYS3UYhf33KYTtLT4
 S52S5UCwKewApQvoullUpkm6ikbsfV5IKnGcqqtf+KAmy8PA7Kx8NPidmMqys133I5k=
X-Received: by 2002:a05:690e:151b:b0:662:89c8:4a63 with SMTP id
 956f58d0204a3-662b601df10mr1932779d50.18.1781599715661; Tue, 16 Jun 2026
 01:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260608174900.2227340-1-nathanc@nvidia.com>
 <20c8948f-1933-4410-96fc-10a2d53cb40a@redhat.com>
In-Reply-To: <20c8948f-1933-4410-96fc-10a2d53cb40a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 09:48:22 +0100
X-Gm-Features: AVVi8CdxCl049mvW1EAeYb3g3IBo_qAbujdubuwkskOTdw9SqAB365ERWsrG9EI
Message-ID: <CAFEAcA-Mq4jd6Y5xOJDtLiu5BXMkz_5t8YCQEeUgYmyK5rb_wg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] hw/arm/smmuv3-accel: Resolve AUTO properties
To: eric.auger@redhat.com
Cc: Nathan Chen <nathanc@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Matt Ochs <mochs@nvidia.com>, 
 Nicolin Chen <nicolinc@nvidia.com>, Shameer Kolothum <skolothumtho@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Tue, 9 Jun 2026 at 08:49, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Nathan, Peter,
>
> On 6/8/26 7:48 PM, Nathan Chen wrote:
> > Hi,
> >
> > This is a follow-up to the series [0] that introduces support for
> > resolving 'auto' for arm-smmuv3 accelerated mode's ATS, RIL, SSIDSIZE,
> > and OAS feature properties based on host IOMMU capabilities. This is
> > dependent on the series [1] for changing these property types to accept
> > 'auto' values.
> >
> > Accelerated SMMUv3 Address Translation Services support is derived from
> > IDR0, Range Invalidation support is derived from IDR3, Substream ID
> > size is derived from IDR1, and output address space is derived from
> > IDR5.
> >
> > The default values are set to 'auto' for all properties. If accel=off
> > and the values are set to 'auto' or are omitted and resolve to 'auto',
> > the default property values defined in smmuv3_init_id_regs() for OAS
> > and RIL will remain unchanged, while SSIDSIZE and ATS values will
> > remain initialized at 0.
> >
> > A complete branch can be found here:
> > https://github.com/NathanChenNVIDIA/qemu/tree/smmuv3-accel-auto-resolve-v6
> >
> > Please take a look and let me know your feedback.
>
> The series looks good to me and I tested it with Grace-Hopper GPU
> passthrough
> with explicit option settings and auto settings. It collected R-bs for
> all the patches. Feel free to collect my T-b:
>
> Tested-by: Eric Auger <eric.auger@redhat.com>
>
> Peter, please could you consider pulling it if it suits you.

Thanks for taking on the testing and review for this -- I've
applied it to target-arm.next.

-- PMM

