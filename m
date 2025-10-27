Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6ADCCF9EB
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 17:07:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDQh3-0001tc-OV; Mon, 27 Oct 2025 13:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDQh1-0001su-VE
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:07:41 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDQgv-0002ha-Au
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 13:07:38 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-63e255e9a20so5282662d50.0
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761584846; x=1762189646; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9a3+v5SSQm9CFNXUiTCelKARraMR9+J5h+medQHzgkI=;
 b=ew89DRQTbAZ2bt42btZ9ncMMfm7c3OGV/7kzc59vOWvdxDBD5MOZ/5gm9iMxkduZCG
 7wiqi6tmfjBhGk8L0zaaPSSfwjSmChBp/y1A/Si9Ou8olHR6IaFmTc0IpxnKn4KkGJMY
 HGiY0ObtcjQywxWEhDoeZEt4oDKdLP4bFayMUSzzu9JtXelDBJmj59eFGZ9jauslU/VP
 Hf9o43Ix6hIkaRnvMokjJLm7hOjQ6y0c3VuZlc/y9LygayFo7uI0+8A5Rv5LVS/+GCGd
 9UqZT8YEcVtGslHphueNNXoGcs77G0aPNWMeU4NMd/eYDNQMC6MKgSMF1mqei930tYnL
 9V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761584846; x=1762189646;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9a3+v5SSQm9CFNXUiTCelKARraMR9+J5h+medQHzgkI=;
 b=s2KvK2XNsONn36mTA8/ZnvCoUoBWI4IANZGJfjp/IH+4mpZtd9YXJ5rkB8SfGB4MAF
 b1vRz9gW1savlmNk0m6yCgEfiQXgNDxZojttJaRV/C9tAKSCBauc99rrcPg0cmD0yoQ9
 9aZTCBFihzd0fatPZ3uLydRljmYrerUU2VXEIkaX2BI/KSWTROtl9IOkCgn21sT/uu45
 p3rSJFLTYRDc74OF8nalyE3jqH04EE0xxTrxhqmn4hmY61uLt/FsUyEbsMD3DmcmuHtE
 Eu8CL72StbGAURnEfitMCF2AbL667K+ciNdjf5QjRRneaieRu0dlGXBEpGxBasuWJlfn
 yXiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWA0j8XpPeR90mi7VEeF+aSjMdZRr9BxhT1fCHgCDjpEP2x67YeTtQ/uP+GXMuxYeeXJzZO0dBMg==@nongnu.org
X-Gm-Message-State: AOJu0YzRMhKa1x59P9pGoltszJPiQ/i0lxWgTBNyx/mOkdya4ihmeYZT
 p0ore2+7zoG5na6BiGOtIzJdiiVRfyeOIK+SB+0Mo3MADiua9cQ6o365cCXtVyNrRnNROG0bJBq
 +uwjpS0xbHyDR8zsK2gaZJYgDJc64Ka34gsbrZC4GEg==
X-Gm-Gg: ASbGnctfX2S/bsIO4mmm0ycFopTkSRCqSAObhzHgnhnkFlWDOdh+HybKv5xEUHVRDhN
 f/yHPHr/JTKGphTCPBYsHno4oMGZcY9/47II1+hUmGDVLr+MkZDaD/GmarXBumBDNVXeFBuUSVm
 8xhG2hDMbriFD55Zvjri9XhW8Dnmjs4zez2uVPQltvSH8tFrpmjKFCFAqoV7uyfVjHqXjPlgUJm
 nN4NOSDZAnnkEHiKfroECJX/ZgDtTVWW82tkO4eTtkZykG1H5LRb7aDia74hQ==
X-Google-Smtp-Source: AGHT+IGaTaPWC/WOrfEqNVYhpfV9r0OjkR1NtUO5NaJbkPQpnMmVRGjIDGUpgnQjORUQZ+ZZt7Q98zHS0ED+M4U4bI0=
X-Received: by 2002:a05:690e:2c7:b0:63e:1031:9a2b with SMTP id
 956f58d0204a3-63f6ba40150mr496652d50.40.1761584844928; Mon, 27 Oct 2025
 10:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250920140124.63046-1-mohamed@unpredictable.fr>
 <20250920140124.63046-4-mohamed@unpredictable.fr>
 <CAFEAcA-398ZMeLUbHWyUw4np81mLikEn2PkQnFQMY4oY_iWRFA@mail.gmail.com>
 <29E39B1C-40D3-4BBA-8B0B-C39594BA9B29@unpredictable.fr>
 <CAFEAcA93e6GL9agaCBZ2AabB21JrS6KS6MsbRHGPwdc_vj7xDQ@mail.gmail.com>
 <890B1091-0ADB-459F-B1C9-173EC32DDADA@unpredictable.fr>
In-Reply-To: <890B1091-0ADB-459F-B1C9-173EC32DDADA@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 17:07:13 +0000
X-Gm-Features: AWmQ_bkJ5wc1isPc1iZpVsJRHdyiMm-ivEfqxZwcgJGUfHx4zKryr8V0lPngkKg
Message-ID: <CAFEAcA85m9FPGfm_tqfM6zsLC2C2+0fi+VWSBk-bojtaP_LYTA@mail.gmail.com>
Subject: Re: [PATCH v6 03/23] hw/arm: virt: add GICv2m for the case when ITS
 is not available
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, kvm@vger.kernel.org,
 Igor Mammedov <imammedo@redhat.com>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Alexander Graf <agraf@csgraf.de>, Sunil Muthuswamy <sunilmut@microsoft.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <anisinha@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Mon, 27 Oct 2025 at 16:53, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> > On 27. Oct 2025, at 17:03, Peter Maydell <peter.maydell@linaro.org> wrote:
> > I guess that would be an argument for the "give the property
> > the right name so we can say "msi=(off,its,gicv2m,auto)". Then
> > you could say
> > -accel tcg -machine gic-version=3,msi=gicv2m
> >
> > to test that setup.
>
> Is there guidance around renaming properties?

I'm not sure if there is. So the below is just my
initial suggestion.

> Would it be proper to do:
> - if its=auto, consider the new msi property
> - otherwise, use the its property

I think we should write the code in a way that looks ahead
to marking the its property as deprecated and eventually
removing it. So the handling for the new "msi" property
should be done in a way that doesn't need changes if/when we
drop the "its" property.

We don't currently attempt to detect oddball user
commandlines like "-M virt,its=on,its=off", so I don't
think we need to go to any particular effort to diagnose
the equivalently odd "-M virt,its=on,msi=off" etc.

We can implement the two options as essentially
independent, where "its=on" is equivalent to "msi=auto"
and "its=off" is equivalent to "msi=off" (i.e. what
we currently have as a bool turns into an enum, and the
set/get functions for "its" and "msi" both operate on
the same underlying struct field.)

thanks
-- PMM

