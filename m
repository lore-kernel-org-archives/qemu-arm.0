Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA2FD2ECE9
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Jan 2026 14:24:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viCf1-0004x1-LP; Tue, 20 Jan 2026 09:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viCf0-0004sT-3O
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 09:24:46 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viCey-00040N-LN
 for qemu-arm@nongnu.org; Tue, 20 Jan 2026 09:24:45 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-7927b1620ddso77086667b3.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jan 2026 06:24:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768919083; cv=none;
 d=google.com; s=arc-20240605;
 b=YHQZ8eG8LuQj5enBa6NguGjtWyHf9gZ06dNdrzgA8gKZ0IgB9qy+Qd9avPLLsJX4//
 WfzBctKc9NSKyqxRo+y5An8ABOzMb8Pyc2wInUGlCH4wKHQi+OgeDUZElurkDWA4uyJ6
 tcURW3NNyYEIq9LwnvmjtSKvxcRVDdr4Et5/GacGUAXckJXIK1YmNJzSI0E4F/IdIHO8
 jwyJ0Lvm4crCc7JzKsB528r9Rh8FfaxXEwqWN4MSjOFQLa7koRjyeQMoagIdrHH55wrk
 XLYQgFE7UMdC/+tA8X9r3Lt10+FFOHQdWO+S/dCWYLdhXS+1wFwklVBdYszYHxRac62G
 aW6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jC5r4tunGuWaf7NoeOgcrPyqJzxy1AIdc+TYbWNUrCg=;
 fh=cwz/S8PyPGj5ZIMWYqvuVbXeHorp+U3BASjRIDmkN6o=;
 b=RQ8wPOJuy9ifq+YrvUMS/F2O5+3E56LXP0jCGoWrFAFYblJFhmnjfEVvF/ZaRu7/fq
 vU6K/d4U3fc0a+sA8pC2ArdVYQPecrFhUUkVypIRme1yfxaMz52PSdFOO3SlrJsTtGgJ
 vd8MTebXCQwItCBVhhouaQsgoU2Pe2NM0EJ9lVmSBhIyfSRZjXIoxzAJ6ydDmd16lHk9
 VdvtWCzJQHCEYRbzymfvv60G5c8HjfzXgUXkckt3eff9oO3CAb0bUk0e3sVB7TwQcFXn
 kbOztwaFQCrpZu8v7gWPs41cTWKD5iHn52KbbO+PAurcs1wqbOUkXWNddMD/4yDhp4tX
 bPGQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768919083; x=1769523883; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jC5r4tunGuWaf7NoeOgcrPyqJzxy1AIdc+TYbWNUrCg=;
 b=XyyZqzmMLtE7uKSL5+0vVORp0vnIqOHuVvnPLNY9UXiu7bEJm1xEpae4FbwZ+rU6eD
 fvMOByxDuKYPpB4BhFx24LvPFco4ZGufpuzMHpOARKzqkLmRxAfoHE2toYNcfWNXoeR1
 qNtLpO+CevHqw8Pv1jgs6Vr65GZAszZbK7/rBesfbGpYukzipRytIn2aSWNglMVYXXzJ
 cpPGwyOs3JKZ/3VABSUD9WVk/6toLWh8386MGrBWrpIpUUR6q3wCb6ZOVMVhQfwW8Z+G
 YwUyKmuAGRBpgQ0jSyz8QzUp3nUv7kA4+gNwZIh0ngJrCHzNmTSs6ZA3kqycKlWjdgi8
 ZZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768919083; x=1769523883;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC5r4tunGuWaf7NoeOgcrPyqJzxy1AIdc+TYbWNUrCg=;
 b=ZbRvreQKbPt8aX3JveRMPXKeteR67EcAO/HVnh7Cd4dqwuImo0zCkqadbzqO5RNNXt
 x/dmKMrRuv/pzR9ldSHlP7MI4+ghsdz46c18QKuB8zlX/ck2FT1E3xTpHIpGD1j6dAqV
 Bnn6qwL9C7rTFOiGSFnvioYAl0nrEdyVU609sQ1DwrtgSDiK7wxwrkRjMmmOwDznGmJv
 XPykvb39tVY4EE1LKCIATfjSWuh1oqLeRV1jGM/laQmUM3hfd8pacQXKSB87oJr0OHzD
 l2K7oZtshnr+b21qrHLLS86PgF5KZhsk5AUc05dKcnb2TG2dGe4/YDNrNjp37rX/IEDS
 m+jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXijxf4d0VY06EXYxZjQDC1+AFu/qq4kA7RtX1hUuJLIxASkRdEjj8c8XTrULkAlc10IzpwqZhKKA==@nongnu.org
X-Gm-Message-State: AOJu0YxNQjNPhyl4gMR8B58hKyJrpWw18bACtQvpcLhS5iKM07GyZP5Y
 GHvpMK/A3ijvwLLEkPHDxQcMfs6jfn5RGmjZ4kLjqCeEsQy6RicjXG1xls0LQGPq1W6poMh2GIt
 LPojNHgPh93acDfTg9FLybZau466GFeB6ApkRtbxmrg==
X-Gm-Gg: AZuq6aIk25olunAw04ZxKEWKFRPnYNCvaxD3mwZlGGAznFKSo8+6XBXKLIOpT7CNVow
 z9v689sUpP3j+ppkQG4idEwVKry8bqYhNBa/n4Xb0R6zTl7zrKcnUBTLH7FhRv4OkVeY9CMflHO
 2QGcpPxMDhCIe82ZCyZvXy60VHryEZIAZmT1/VU8O2CESHgGsP/s/ZyKvmHvfS888xF+p7bhppW
 x980IKZS98pdV05nDO+Ji8RUzBgCtwG6y8T9+IFlIWqi1ynYaZfGa3TZPI+o9TM53mMOQ==
X-Received: by 2002:a05:690c:7108:b0:793:e57f:2249 with SMTP id
 00721157ae682-793e57f22e4mr63373377b3.7.1768919082864; Tue, 20 Jan 2026
 06:24:42 -0800 (PST)
MIME-Version: 1.0
References: <20260120122108.131708-1-thuth@redhat.com>
 <CAFEAcA8nzm+CEN_Dp+X+AggcTg57wAt8D43x-7oixLeNH4TDdA@mail.gmail.com>
 <791eac72-f4d2-48b5-9973-c64006e8ce13@redhat.com>
In-Reply-To: <791eac72-f4d2-48b5-9973-c64006e8ce13@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jan 2026 14:24:31 +0000
X-Gm-Features: AZwV_Qi-nhyfIqRDBywfAotFoUlG1bfyXsXVaPJvMuSacLTD2jMGWLZeHMty9-o
Message-ID: <CAFEAcA_0xM47w6tLgGSrXZO2v1S+ncq92N_h3U=HQENapzyU9Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: Move the "arm-cpu" compat settings out of
 hw/core/machine.c
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Tue, 20 Jan 2026 at 14:15, Thomas Huth <thuth@redhat.com> wrote:
>
> On 20/01/2026 13.55, Peter Maydell wrote:
> > On Tue, 20 Jan 2026 at 12:21, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> From: Thomas Huth <thuth@redhat.com>
> >>
> >> The hw_compat_* arrays in hw/core/machine.c should be used for generic
> >> compat settings that might affect all (or at least multiple) machines.
> >> Target specific settings should rather go into the target specific
> >> source files instead. For arm/aarch64, the virt machine is the only
> >> one that cares about compat settings, so move the "arm-cpu" related
> >> switches to hw/arm/virt.c now.
> >
> > I think it makes more sense for all the compat stuff to
> > live in one place, rather than being scattered around,
> > unless it is truly machine-specific (which this isn't).
>
> It's only used by the arm virt machine, so it's IMHO machine specific.
> If we will ever get other versionized arm machines, they won't use these
> config knobs, so this never will be shared with another machine.

It happens to be only used by the virt board, but that's just
a coincidence that we only have one versioned arm board right
now. The config knob itself is not at all board specific:
it applies to a device object that is used by many boards and
sets a behaviour that would usefully apply to all of them.
If we ever did have more arm versioned machines in the future
we'd end up with a weird split where compat properties of the CPU
object that happened to pre-date the addition of that second
machine type would be in one place in the source code, and
properties that happened to post-date the second machine
type would be somewhere else.

thanks
-- PMM

