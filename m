Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E61EC1E92
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 10:21:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnwTt-0003Qx-QG; Thu, 05 Feb 2026 05:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwTs-0003Qg-E4
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:21:00 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwTp-0007jR-2Q
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:20:59 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-794fe16d032so6032537b3.3
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 02:20:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770286855; cv=none;
 d=google.com; s=arc-20240605;
 b=PC3keZZfenwU8pLMjVV3VEAJP/MDEVvRHIXQJ8JYHlx6giYuH8bc7LPQKmwQk80mQe
 Ov4gjFCDAjmoPabUd0QKJK47f67Hryl4K1mGpaFlaBQsLLNhwgs/BhuTCpgA+PjPLoJ5
 eoBrqLDk1rgmuYXQbsi+KaNOEWhWWQ2wI+sBlCSP2FWKzVYZRJM4VU+cZCz3UKqX6kfH
 1/xdHHdhCbCWEJ3fgfCRYkTgDA6+tYtPrwTMKQ5OEBnNjOwhYv5X9pMBlJNkgqqz3PK6
 TBE8KnMc/2YZ4F98bR5t8D/b31K15+YMZ/xKxNZVBnQiL0GWpcCHTi8LjnK8RvjTGWEp
 UePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Q4E6LHdBSFXduGeeqWYUvrV147mNZsLrW4ry41IVI9U=;
 fh=hzLqU0RnVoIIyJUbtbho1ao25lO/OHVBIYn3dOnLrkI=;
 b=DXvsyHeME91aTg/pt17hKoH75RgbvV5WJXV6rZ2FXTda3y8ic9Dmfc7JXhdL21jqJe
 Ok/PfZJVs13zHKgmJC8/VxvjxqMVYn8VyPkyRb5wHKCDewIcn4O9anh6K843l9g03tZF
 a0YqaqIQW68C+cLPmJ5bkl3+aUCM0KB/StvTVVyRain7QG9SjZJ1EX5oAOmNJ3sE/n+n
 BF4oi7tW1xnFfzWhPijXWpy4W0NTxPCW7X2g0YnbE8jE8f3Vo/V9CZd8dhCRM5S3aewL
 49PzODaGdph9fiaogl8xirWExe1onT2LHhOBnOaZL1+4xqmJSzUdPauqsKRuqNrZr8S3
 l0xQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770286855; x=1770891655; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4E6LHdBSFXduGeeqWYUvrV147mNZsLrW4ry41IVI9U=;
 b=sWP8egXS/eKDr12aowQ7c5btUPqbiI76IETv+d3Y2sMhsQg+//KLPCiUfFXWjVdpY5
 t9YGk1HCOglVG0GmioOXr9S8m5tdqWEj4IJSCcvyKPY1sx9EU09C1CPlVyp38dV+2upg
 /AX/cTPKZSqEPx6KpMjoDCCP5xMTX1ZV2FTszKSURKT/RPu5y++2FUlm3P7JQnADF98X
 NyTQovDVy3nImZzLq56JBTN8EZ+tmTa2j5siaWXcKaJ3j6TyRXuloZtjLiVXu9aSZYdR
 YTvgRgVBb25XBKbpzZEzQwSwm72j4wM+fKhIAUHnq+YEnqdcY/w8EM6tMEM3D4U4tu4u
 tCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770286855; x=1770891655;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4E6LHdBSFXduGeeqWYUvrV147mNZsLrW4ry41IVI9U=;
 b=AjCuufNFZkUmlYQAtB+FzHkT9Md5pv4+3vouo6bJtl3rE6L1s+uXlrzfIFSnq1G1DU
 b8Y1jB+b/RrF7Mtjvt1nY56bJQzp7Rh5K4YMaCjuq0M8TFYzXRbWwFSV+TFtpM0TvsuQ
 aBflvrvEbgD7D3yy2g3tjyal2oIC0ZtB8UNDPt52Q0fO1AaSxbTAZdcfVNR9gJGfBNEP
 Uv1ufYUal8jK1zaZbpWIHPdc00SGGdZ4DhMl1HC/NWVh+DxhrD1WfF25YgQBxhQG6Ays
 OySEBygeiPVovOierHLsoNwwa9coSvXTJYRothJrhF0OTUS4Y0LKFd4NDfiiO9hXZrDY
 bhhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLaL0bLNZp/G1NazUczSV2CoP/IgVXLKYLgNqL4J9dm1HuqJ4hiywjhemKtEW2JOiUNcBQIrbFTA==@nongnu.org
X-Gm-Message-State: AOJu0YyI3k2e0aAA5azdznNStgS65wpu6X0j6Xr4IyvBQ2GHB8ad01HJ
 3NMP5dkEZ7zy1298NoNhWY74vUDaolLnUHRfUoYGaqVT7j/aldz7C4A+7xWSpAKh1YFPIzzchI2
 qJmv641C6uvGPXJXyvurjPZKQvZTV+BjmwXWRIZ2zjA==
X-Gm-Gg: AZuq6aLh8Q7AfqeMKkmekpb3l1bgj2xJf41fv3z+Qk890bumOfHXfPo1PC+rFtZDv5g
 2KEshMAEy24zIDRlsbLhuBu4L2koTMRSLIeT71M2UnRaWQe9yvMntTmuxmE8/yblMsuCqEtHW2R
 AhgqIo/1h0f4XlMwafVKrKCn5Q/UpZvyPwou1Txtfg2uZw6MopqG008lgeAefgGa0raNEB+m4CT
 LxoZ4msW+COnA5mdK8mCSwEVRklSXn56S9fkb4TNeDQRM0sSoFruN6TvI2qVnTPPaZ2Xg==
X-Received: by 2002:a05:690c:f14:b0:792:7745:72d0 with SMTP id
 00721157ae682-794fe70f3b6mr52950947b3.23.1770286855563; Thu, 05 Feb 2026
 02:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20260129192009.14707-1-mohamed@unpredictable.fr>
In-Reply-To: <20260129192009.14707-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 10:20:44 +0000
X-Gm-Features: AZwV_QhwkRr6LRvTHk7X7jjSk2flE715Dw6qYSH7QRauPBTxA6SvPseQCCnBACw
Message-ID: <CAFEAcA-4-nwRQCaa9SRUv28SWveC7k0GG5HmA478FhKGuJb_fA@mail.gmail.com>
Subject: Re: [PATCH v19 00/22] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Thu, 29 Jan 2026 at 19:20, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v19)
>
> Missing features:
> - VM save-restore: interrupt controller state notably
> - SVE register sync: I didn't have the time to test this on pre-release hardware with SVE2 support yet.
> So SVE2 is currently masked for VMs when running this.
>
> Known bugs:
> - U-Boot still doesn't work (hangs when trying to parse firmware) but EDK2 does.
>
> Note:
>
> "target/arm/kvm: add constants for new PSCI versions" taken from the mailing list.
>
> "accel/system: Introduce hwaccel_enabled() helper" taken from the mailing list, added here
> as part of this series to make it compilable as a whole.
>
> And another note:
>
> Seems that unlike HVF there isn't direct correspondence between WHv registers and the actual register layout,
> so didn't do changes there to a sysreg.inc.

Hi; this doesn't apply on current master now that the SMMU changes
have landed, because of a conflict with the ACPI data table
update patch, but otherwise I think it is good to go. Could you
rebase it, please?

thanks
-- PMM

