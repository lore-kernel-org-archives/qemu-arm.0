Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DDFCAC5A7
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 16:25:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1oly-0005S9-PA; Thu, 25 Sep 2025 12:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1olx-0005Qn-3E
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:24:45 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1ols-0004Ag-0z
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 12:24:43 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-635c9db8a16so60307d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758817474; x=1759422274; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mFjmNLr/5g6yHzhx7AeEowYbwd8gsENi5VESj/oPYlo=;
 b=HUj/jl3EyjSx7UpryadXpVQqxcOXBvBJI2gf11LN599EmttXH38YWdcsajwktsl9Mm
 Aejrwm5vKbRSV5nrHB3k8xTlPrQMmqGz36kfoympD8uqVoTSh06eLxHStG2d3IHjjXSW
 465mwPBPRlKYOlBiJ9cpFC3DWQEmHST91+Iod8V8EnqsLZhAxWAaMFP7xZO8QW+FjsRi
 rhkGxY79GwSqbKqz8Hp0AjtbFep+gsWyTpGht6LYnJHe3GCOmcxl6xTqY1HYZvUHPySY
 B5IUJu+ojRVK2o8fquCAwwTBgmmTcRlEkJd/Z81ldHSisVcuZxjgNWMTpsBaonYBVHrQ
 iwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758817474; x=1759422274;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFjmNLr/5g6yHzhx7AeEowYbwd8gsENi5VESj/oPYlo=;
 b=sgrQ5A628U8L8k/pcgJQjRUr+nE0WFdSzuIUrfXivLPcrlKXOUYAEace8DjLY2szYh
 sQ2odMGCxo1gEwJPt5dN/wUAEnm4GiuYNVSuon2nFxWdVrrCgSiugc9hi3Qep0MVOdTW
 gHjlj6rpysensckA25MbLK+AamQ/vj6VdzkzJpjw5vekmE4G5l0WNHENA4ZNu+ln6UWc
 UR77YCIIMvyrDXulSgO7tEdUJqLzyztDYmTpZ76c1NPFh29D42sBPvQStNoVwYzQsx2G
 hI1g+OkDrCaThKdqPsrmdXl/rFuiTZw+B0kwZ3lG0oM2BClZvhGqIZzcuKgFRjQhomyk
 X3iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8MMpEOvInEcpTkrPBxo1YPcGSF4nIRAxphugeesX6PM3KGu7zXYexiTubVE6CAx8fwEzUvpI/xA==@nongnu.org
X-Gm-Message-State: AOJu0Yyj5gsa5ju2sgLaTN9dczmkzm9K5RDszHVj2jTouZeKTU9sxYM6
 mxCvLwguJHbvbE9VkCu7bc5q1uOoyNAWTNUXGQ1Nidhr4Q7BEjCpAWxlQXX7aOLVckDMuS3wVUP
 311k8UYhv8TNAA25T/5+nrGo1Dyyb0ojyViESQ7ODgQ==
X-Gm-Gg: ASbGncs0R01xA3v6T/Cn8Kcl/GDFLadtdcXc4EK5+0/jVbfjm35AVOSLRMnmX/qNAJZ
 70NwM5MeAhIiiDw17hhoHmgFil68ikKPvnwKvoODc6j35zhMR9YGtldBnH5hy4enhvxS4swRSXU
 t+VONoIMp6JjspxQkNZ0rvdJi9Xf3et1iCMm3C7VHhQWNAwdLwMZXnkC5dmMmxIJZoKL/S6v4qi
 nrkFERX
X-Google-Smtp-Source: AGHT+IE12IosBY1ByRI9crTKRkKTut/TYCvZHGTpRTLSzEBxrKqDsm+1ao3s/LRX5BcWQp38IEh1BgBa11rEQAK+vZU=
X-Received: by 2002:a53:ed11:0:b0:633:ab16:f82c with SMTP id
 956f58d0204a3-6361a7bf340mr2478091d50.18.1758817474111; Thu, 25 Sep 2025
 09:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250920140124.63046-1-mohamed@unpredictable.fr>
 <20250920140124.63046-4-mohamed@unpredictable.fr>
In-Reply-To: <20250920140124.63046-4-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 17:24:22 +0100
X-Gm-Features: AS18NWCWah7mgqpnrCZyELqD3G7reW_ZdwmZM5Jp0Wr6Jo1dbHsbHx-sqSJyajM
Message-ID: <CAFEAcA-398ZMeLUbHWyUw4np81mLikEn2PkQnFQMY4oY_iWRFA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Sat, 20 Sept 2025 at 15:02, Mohamed Mediouni
<mohamed@unpredictable.fr> wrote:
>
> On Hypervisor.framework for macOS and WHPX for Windows, the provided environment is a GICv3 without ITS.
>
> As such, support a GICv3 w/ GICv2m for that scenario.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  hw/arm/virt-acpi-build.c | 4 +++-
>  hw/arm/virt.c            | 8 ++++++++
>  include/hw/arm/virt.h    | 2 ++
>  3 files changed, 13 insertions(+), 1 deletion(-)

Looking at this I find myself wondering whether we need the
old-version back compat handling. The cases I think we have
at the moment are:

 (1) TCG, virt-6.1 and earlier: no_tcg_its is set
   -- you can have a gicv2 (always with a gicv2m)
   -- if you specify gic-version=3 you get a GICv3 without ITS
 (2) TCG, virt-6.2 and later:
   -- gic-version=2 still has gicv2m
   -- gic-version=3 by default gives you an ITS; if you also
      say its=off you get GICv3 with no ITS
   -- there is no case where we provide a GICv3 and are
      unable to provide an ITS for it
 (3) KVM (any version):
   -- gic-version=2 has a gicv2m
   -- gic-version=3 gives you an ITS by default; its=off
      will remove it
   -- there is no case where we provide a GICv3 and are
      unable to provide an ITS for it
 (4) HVF:
   -- only gic-version=2 works, you get a gicv2m

and I think what we want is:
 (a) if you explicitly disable the ITS (with its=off or via
     no_tcg_its) you get no ITS (and no gicv2m)
 (b) if you explicitly enable the ITS you should get an
     actual ITS or an error message
 (c) the default should be its=auto which gives
     you "ITS if we can, gicv2m if we can't".
     This is repurposing the its= property as "message signaled
     interrupt support", which is a little bit of a hack
     but I think OK if we're clear about it in the docs.
     (We could rename the property to "msi=(off,its,gicv2m,auto)"
     with back-compat support for "its=" but I don't know if
     that's worth the effort.)

And then that doesn't need any back-compat handling for pre-10.2
machine types or a "no_gicv3_with_gicv2m" flag, because for
10.1 and earlier there is no case that currently works and
which falls into category (c) and which doesn't give you an ITS.
(because we don't yet have hvf gicv3 implemented: that's a new
feature that never worked in 10.1.)

What do you think?

thanks
-- PMM

