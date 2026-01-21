Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7EBC4453A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Jan 2026 13:48:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viYZ5-0000FS-UH; Wed, 21 Jan 2026 08:48:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viYZ3-0008Ii-5z
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 08:48:05 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1viYZ1-0003aB-FB
 for qemu-arm@nongnu.org; Wed, 21 Jan 2026 08:48:04 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-78c6a53187dso65621807b3.2
 for <qemu-arm@nongnu.org>; Wed, 21 Jan 2026 05:48:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769003282; cv=none;
 d=google.com; s=arc-20240605;
 b=X27in/b9mTRbDIpw4RydHrd9gW9eNF7LWi0O4uGrIRjYGU9YghSfRX+jqkgcNLoedu
 wc4S3AL8/hFdkjrerOHKSIC1ODjKpqfQ0YgaqSdVajPDT8RPXI7AH/93IV04kJWDZ1dD
 R5FwGk6/ycLcF8QJbSIcm0fmW3vMBd86Dn8/Ihy+oQSwS3rpUbtjc7+Gbzw+5DSdRp0D
 wjQlLxXZ/ip6lS6t8pjaOJZLwQrMitQP95DjV7uFhCKEMQcg2038orAE2e2fGotpz8Ib
 cUj0AP17g0TV90PLZQ33lHKh5UKw4pceoRWjNXMRPZ2zGka9WzUADY8e3qpAD5F84Sx8
 xySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7G6h10Tk4dC5c9iAjzf7lbA5mXcsy/TE9Bg8F3/aNUY=;
 fh=ILPd9jAsFODqmBdJYShKVn2Yjz15ye4Ik8rkASQhSdA=;
 b=Dekxs3XF8o9yXOwJPWyUEqCH71o/Ii8s6UD+ictVdC6tdjb7YX18YH91nkwEKAFnvn
 yGuAH7k+p7eZjsZ7ndK3s83t24OAZdWgTTD+ePDsrlt7t0TU8sdCXZ3b9GPuGVjctL51
 oLnVykb41cuEFdo0tnE5rcbtjDezm6OYItx0/YqqmP5NFkk0V5ZcNSDLZwRtQJsuuqNH
 E5C/+4bExMb4aXXX/NhgPkUwFw1a58uHlwLlX4uiDajKqI4j7xGCpLNtmKQSqNQXDWxR
 EwUlmRY88E18H+zFzlQrlw+aiexKaSKOWWXn+cJ/ASs98Oy4hqn8nVnbb1llmHHndqt4
 IG9w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769003282; x=1769608082; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7G6h10Tk4dC5c9iAjzf7lbA5mXcsy/TE9Bg8F3/aNUY=;
 b=WFYRVqmeVnWjTBm91K1KLLx8RDaPEDffm1FZjJEaaPcBWIZ3zsLui9UoQKLv5+umXR
 6C9yK/qtNAZb1zhfG+CvCBfCKpPj+aQ7tPy+0GC5swjp7j7UYk4/P1F7XgQ2MZd6xYbH
 sBjXS5UrdEOTXD2bH5vBE2owOmC/33HnW1iBp2EwyVzn2KEHYeY4GV8lEj3Lbo8OQ19Y
 SAtuYH3dB43r5OmdvqiNvNNfCfmmI+gDx6YMYm6TgCTFKACpPAlOXK+eEaIa39wy6IDb
 mX7rg0qBDWdNg/os4LZUtx6KhxO7ZBKUlt2j3gJNyQVg1EGpUM9/ne/UNAr8jMxexVc+
 g+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769003282; x=1769608082;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7G6h10Tk4dC5c9iAjzf7lbA5mXcsy/TE9Bg8F3/aNUY=;
 b=EokIE/0KRtgP+SrZxnXUSJkZqR9NjVNwzLXSxy6iqAi9dV+pxI5uYbNswGpO7mnu/+
 cVjVYMo78AoIAf9+owaxLurZ9RlSDriZaFmkS/yOCTRONL+ckuuzBMeVxBC3eC7+kfc1
 l63+osGB9CW2TB8yfncbo0IzQyTT8kIoCfjbaMLQGvwvJY18UitVRfb8xcA9i9rWANbG
 wa/6ydCEsIj2HdujsGsqjKfgoYcly6SOcA1fnxfuloTJZvQScIrI/EIJZCPEz14FAK7J
 7/Es9AsIPhOSnlQG6NxWVtk0Tq73U39yS8j/86BumMQhsxza0PYM6mQTXPqoyrx8gaOQ
 raOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrYcm/PKBKKXAvHxcJi2FT7YSXpQN2f+T/WrNt2gLNHixz4m+4Jidwmsfdb9tdMOkgaVmWHeO4VQ==@nongnu.org
X-Gm-Message-State: AOJu0YwSbTkCqwcqCg4oRfRmxIcXP6FsAOKUvpoBapBTqI++IXFTtGMn
 uqApUUfXKiXRF0RyrLiFxQJuNx7CgxX33Re8ySfpj93IadHQZ53VACUq5utoQkJRCI1XYmIIQBX
 b5Ed/EqlYbacYL63sMFBABsHRyF2skM2RQAIcu4d9vzY5LfouYFrc
X-Gm-Gg: AZuq6aK1E0kl09TGYoxNUA4IrqcqZtBbGNDQ3Os6JhtUb3saRjwdDt244KcAf+lq+43
 CUofrmjWEjg644cvp8fANFUFpJUKFAICCBAKneOMya3xd1iJeZegt/OgI/KAYISAwcH86FMkKBX
 TLki2HCk/t6Ep/fdr4hr0frSPX82QCeCliENvBKMQ4MkKu6gTmZOz/BHoB2l0Qp70iQOR+CQTIZ
 qPBeXcKX8UD0zqESZpd1/glGT4p6bfVnCJv0tcfUzKanb49lsAPW89rAezkqGeba2L/0w==
X-Received: by 2002:a05:690c:3701:b0:794:35b:af87 with SMTP id
 00721157ae682-794035bb38dmr51554407b3.63.1769003282063; Wed, 21 Jan 2026
 05:48:02 -0800 (PST)
MIME-Version: 1.0
References: <20260116135235.38092-1-mohamed@unpredictable.fr>
 <20260116135235.38092-5-mohamed@unpredictable.fr>
 <CAFEAcA-3P6i_w3b7SaFTn4Zmwnot5vpDs89y+zpjcJ=-mEnP5w@mail.gmail.com>
 <8158CEFE-8EA2-40A4-970E-01B30BACC019@unpredictable.fr>
 <CAFEAcA9JC1HRboZ=722dsT7a4nDQNF_ECjLK+z84T5MJisfppg@mail.gmail.com>
 <2FD2C3C6-8FBA-4833-B890-5E81637BE7EE@unpredictable.fr>
 <CAFEAcA-MAsQpaaUx0dJHRHjUJ6bEWwnf58VZN965Npmi7_kHXQ@mail.gmail.com>
 <FF6F91A9-9A09-48B1-8857-FF213C9A4644@unpredictable.fr>
 <CAFEAcA9FMiNZXgRP8OZgvAyPJXfBphXXs4eB1kBZtDgqYDTYUQ@mail.gmail.com>
 <0A38F8AC-2756-4BDD-AA0A-AD1502E2F715@unpredictable.fr>
In-Reply-To: <0A38F8AC-2756-4BDD-AA0A-AD1502E2F715@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Jan 2026 13:47:50 +0000
X-Gm-Features: AZwV_QgTvi0cQAzlH-24fX5AUKxoWQb0Y4mn03noKYc10-t8ZmyNF4k7S7bIhOA
Message-ID: <CAFEAcA8iQu7qatYhW8M2Ud1tow-adb6743XRbGEN--NLQqK0cA@mail.gmail.com>
Subject: Re: [PATCH v16 04/26] hw/arm: virt: add GICv2m for the case when ITS
 is not available
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Pedro Barbuda <pbarbuda@microsoft.com>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Wed, 21 Jan 2026 at 12:27, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
>
>
> > On 21. Jan 2026, at 13:19, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 21 Jan 2026 at 12:00, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >>
> >>
> >>
> >>> On 21. Jan 2026, at 12:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>>
> >>> which I think means we do need
> >>> the its option to be an on/off/auto one
> >>
> >> Hello,
> >>
> >> Would this be ok instead?
> >>
> >> typedef enum VirtMSIControllerType {
> >> VIRT_MSI_CTRL_NONE,
> >> /* This value is overriden at runtime.*/
> >> VIRT_MSI_CTRL_AUTO,
> >> /* Legacy option: its=off provides a GICv2m when using GICv2.*/
> >> VIRT_MSI_LEGACY_OPT_ITS_OFF,
> >> VIRT_MSI_CTRL_GICV2M,
> >> VIRT_MSI_CTRL_ITS,
> >> } VirtMSIControllerType;
> >>
> >> Combined with:
> >>
> >> static void finalize_msi_controller(VirtMachineState *vms)
> >> {
> >> if (vms->msi_controller == VIRT_MSI_LEGACY_OPT_ITS_OFF) {
> >> if (vms->gic_version == 2) {
> >> vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
> >> }
> >> else {
> >> vms->msi_controller = VIRT_MSI_CTRL_NONE;
> >> }
> >> }
> >
> > Is this with the idea that the its option get/set
> > functions would set msi_controller (to ITS_OFF or ITS) ?
> >
> Yes, vms->its is completely gone in my tree.

That sounds like a good cleanup -- I was hoping to get
rid of vms->its but didn't quite see the way to doing it.

> Going to post a rev with it soon, would you prefer to have
> it separate instead of a whole WHPX series?

If these cleanup patches are at the start of the series
you might as well post the whole lot with the WHPX patches.

thanks
-- PMM

