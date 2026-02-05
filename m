Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78BEEC1EB9
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 13:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnzge-0007qi-3A; Thu, 05 Feb 2026 08:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnzga-0007oX-GA
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 08:46:22 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnzgY-0000DO-Lo
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 08:46:20 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7945838691aso27745087b3.0
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 05:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770299177; cv=none;
 d=google.com; s=arc-20240605;
 b=i1jM6N8yK2206YAmWHa0N/8jWs603v8BGLDKu3+gLFHq5dFvbPd/ELt0qXGQW8HTiJ
 68W6mDT+NWHjB6j76z8Qwu5/aDo5wZEe6iAeWvGv9ic0DyOF7gH5oer4fjUN+u9d4w9y
 G6EdxyFG+d8ocsqwaMTCMViowSzvlJNgUPyeFEVSHxJumT4TNRQ2tAzWy7MzfeUF8KMi
 LOYJZjynB6ROWdh5vznaFTN+8klL14oSIAQe/pB6BSXaEGFhBBP+2OwGbAwYuGJ4fI7D
 YZeH+KOAn6dPQewjYwn2+ApazCAfoqu+oB4+uZoNJIYwK6brpIBcn1j4Oqiog1UT0fFt
 zuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=WgMtCxykOeFeiJWmSiBNJQyqBtpFFeZg6+ciJoPFqSw=;
 fh=H48TBoXysbALzKb3DmcNTAZWfJ0O3A47I8hOGcBIL5w=;
 b=gAiHFpOx4S5t4quWhTlcAyFOQAixtiHS2dCL9xWDYBsE4dq1V/TORhwUxB3VAkc6Rj
 W5crw+BmEA/pyoHc9ljXNznNBjyXTSIL5GWVQJlITFWfMmM7aKegVPWGGEeH4VmST2W8
 mgx633fFhdAJsat90fACZB28TmeXHcxZ0I5N2uYY/WYHJ3RCrG2RSXLdZydUpDqTca7i
 Siiw9JUKEkPpFJNJTXUpqhooKhpaM1tQr58LFdsCP2b+063bziTgIscZFrdZ+SjlE1RM
 PBAP1HOpUDKW+NBPPtZ513x8y6EL5OWe43Q9J1Kvms33+cvIrf1QL8JhOiO4bPo+AvhQ
 HSLg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770299177; x=1770903977; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WgMtCxykOeFeiJWmSiBNJQyqBtpFFeZg6+ciJoPFqSw=;
 b=ntR8Gpf5vE1SjUNSCVdejR4FfXPWWC/qClV2HgSa5aEBFoDJibsgduaBcDul2sFSkX
 Ic9PmqjifGiauF3+J6HxvSVoWW8HCHpYIX9RPBRPxBnu3vNBEIX4EEMoXyJxT1E5nljX
 nYsoLiOJQU0UknLG0IsZf6fNqIG77BQdxp18D90zLfq0f+XTsWzFrZ+WvlpT7Cn917E1
 0bq5JAC9xrjPNsue836ywQGxZekVMx3qJHnNJ4V/bDs1dXPyUKh1TmNt6RZueL9izvuy
 br0i0S/GLqAXXAGSE9/TcHmR8kTSEX7mGBxsbNfdnD4XOR5J7e0pm48VVURLRO6NBCoA
 Qaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770299177; x=1770903977;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgMtCxykOeFeiJWmSiBNJQyqBtpFFeZg6+ciJoPFqSw=;
 b=Zxi8sPajmpoJNDp1PsiYP2T0g0jPB1LFwOVHjVmtQpbzY1BySVnsyxnYiaAGdKPZIX
 DTxktEsXBMLOkCAySCYSwkHQUMpHR5ajxO67yqvHNJ/l5twonwHaxEq1sj9rTu2frUs+
 ugik6yEhnBuw0iYCMmQh96vxEsZCDNLLCbiCQ1sJWJ9zsPwqjOnGhm9zHvVZmmSFLV1C
 gHMRxKkw1fe/pAmbN4eauyL3yxkl8NCAQfUtS6BRMvcqfBYPl5VPqFpjS4+TImvhyyHj
 Ab462gE1oQJOCM3qi4ByYGya2tgaAdpoVh5qp4+ZPL8kFgCspZrbOObfInMUZoptgds0
 nUww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhMnZYti7bgLqKZEdH3QFskDW07H3cl+622SXlmlstPK0Q/qwq394B59lHOtTVhNOkXHf0kx/vSQ==@nongnu.org
X-Gm-Message-State: AOJu0YzElPk70qMdrRVkVfhdlvlhj5J2tCPktqGcv/1AhwrlpwjZbEsY
 8nOkr4qj5JsGiwub1+/T5WXbcp8H4ukGSef7XJbDBDn2X92mzVSGBedWLVfJo008OYEZd1vhkH0
 ovtzXpK2KJZ5CcuxsPBjbz8MXT2w0f8Kh5L7I+PFLmg==
X-Gm-Gg: AZuq6aLZD50GGLUignktTOahuosEzInfRu5HWfEuuDtDIJFbjm5gWN5o9gEYbQT/khV
 BAtX2fB8mfrHC9La3v3LMfgpplaRLOJBSXJGdr7jxRMQX7VDHMSFW3Ysi9ae6Rn404ahvmjEGMI
 1LOv1IUzvMoGB22HhKkk2X4Y5+AEVC0iokhNCErnCsNdUomr79X0BvotxQLyVGQVbOuAR+fxNtR
 lSPq9hIlBXxo6bjHyS7rdgdzWdGTLE5p5DcF+PULVfnNo0vr8cRrbUw2BP7QfFereTttPfGe8mv
 VTmZ
X-Received: by 2002:a05:690c:3613:b0:794:e72f:85fa with SMTP id
 00721157ae682-79514df1f35mr25891517b3.19.1770299177314; Thu, 05 Feb 2026
 05:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20260205131155.22780-1-mohamed@unpredictable.fr>
In-Reply-To: <20260205131155.22780-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 13:46:05 +0000
X-Gm-Features: AZwV_Qi4tn0jXFyP6Jw9M8-TBtTZhD5UP8Z2RpqefZcJ6xmoQrP5EaVK_W3hdwg
Message-ID: <CAFEAcA82FqmQekZAPhcrCfsxsjbXRx2rHk-TWG5FyxtBf5YpJQ@mail.gmail.com>
Subject: Re: [PATCH v20 00/22] WHPX support for Arm
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, 
 Alexander Graf <agraf@csgraf.de>, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Pedro Barbuda <pbarbuda@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 5 Feb 2026 at 13:12, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu whpx (tag for this submission: whpx-v19)
>
> Patches without a review: patches 3, 5, 6
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
>
> Updates for v20:
> - Rebase on current origin/staging

origin/staging can be any old rubbish that's currently going through
the CI test loop; it is not a good target for rebasing on. (Though
that doesn't seem to have bitten you in this case judging from
your github whpx-v20 branch.)

This still doesn't apply to current master, unfortunately:

lanath:noble:qemu$ git log --oneline -1
739ae3df7b Merge tag 'pull-aspeed-20260204' of
https://github.com/legoater/qemu into staging
lanath:noble:qemu$ patches apply -s
id:20260205131155.22780-1-mohamed@unpredictable.fr
Applying: target/arm/kvm: add constants for new PSCI versions
Applying: accel/system: Introduce hwaccel_enabled() helper
Applying: qtest: hw/arm: virt: skip ACPI test for IORT with GICv2
Applying: hw: arm: virt: rework MSI-X configuration
Applying: tests: data: update AArch64 ACPI tables
error: sha1 information is lacking or useless
(tests/data/acpi/aarch64/virt/IORT.dsl).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0005 tests: data: update AArch64 ACPI tables
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

It doesn't apply on the commit your whpx-v20 is based on either:
lanath:noble:qemu$ git checkout 28a6ca268c
Note: switching to '28a6ca268c'.
[...]
lanath:noble:qemu$ git checkout -b test-apply
Switched to a new branch 'test-apply'
lanath:noble:qemu$ patches apply -s
id:20260205131155.22780-1-mohamed@unpredictable.fr
Applying: target/arm/kvm: add constants for new PSCI versions
Applying: accel/system: Introduce hwaccel_enabled() helper
Applying: qtest: hw/arm: virt: skip ACPI test for IORT with GICv2
Applying: hw: arm: virt: rework MSI-X configuration
Applying: tests: data: update AArch64 ACPI tables
error: sha1 information is lacking or useless
(tests/data/acpi/aarch64/virt/IORT.dsl).
error: could not build fake ancestor
hint: Use 'git am --show-current-patch=diff' to see the failed patch
Patch failed at 0005 tests: data: update AArch64 ACPI tables
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

thanks
-- PMM

