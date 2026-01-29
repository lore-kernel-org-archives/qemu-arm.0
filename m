Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A081CD61020
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 15:06:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTan-0002pK-18; Thu, 29 Jan 2026 10:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTal-0002nq-VY
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:05:55 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlTak-0001Yd-Db
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 10:05:55 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7946a1f2430so10559027b3.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 07:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769699153; cv=none;
 d=google.com; s=arc-20240605;
 b=jqUbH1ZsU3UgSNB/UW1pTtsCcxi34ncrn0DMgBz9MdLim84N2OkOZj9XzQw8qxHXVj
 tHsXlDbTbln35yCcTgsc+4b9BTPWgCC+N0LnpNA+qJMQrpNXNBI7v2ZHlCf9ZRzpVlGQ
 q9VjoHo50VG0Vy+TGIkt3/fTStLg+/T0EPttm4rjbx+jZs9eVCTEDtHfWJB02hhbV1+s
 iF1E6Ou0W+31wnoCQgvGOuDJQIYyaeFX47qLkQIgC6I1/YOxoyy/Fn59FXZYWAPHy4jz
 T6/JSPpciXr+H82rK5avRnyB1VXS3rFzbSU/05f2mG55HjxUX/Z3suQqtV/N5ob6MD73
 JFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=oVE1o4D7voep0UOCj4pOdunoE2WIlpwfx9NVsylsdPs=;
 fh=hMcMTYObkHU83RRNPXGQoRq3IWKoIYd246h4M4pHURw=;
 b=b3OthSSpE3Fly6XYEmyuGsp0YnP8XBnRLWxvuxqY/2hb9sRj10CDmHS6tnHsGw7K25
 wV+4PP4hzHtSCXypxHRvECUsM0NzF4QvgDy4o3bl/De87ra242rIcnmRV4AN6wYa3Ti4
 ceJrLagbrForotBctcMBpFuOq/AdWqd2GYNYVrG4BxwZUyfgSwAQNAI/UphTeNJWKrro
 hm+mAvPwzQoZ3Re1B26JkjomLsj0GEx3N2iGZdHEF6y7Sahz4FF4FtXpceIh4F8P/QkX
 J5cQd5kYHKMtkQpOhaQCZweeioRhQO7fPO7a8+vSDjRAid12m9m8S7S5fsWrPGQ427wL
 N91A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769699153; x=1770303953; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVE1o4D7voep0UOCj4pOdunoE2WIlpwfx9NVsylsdPs=;
 b=ot7lL9fHQJ7SqizzCCl9Px9chPTZmWEOlJv5EXorf8nusv8FqKUPIPFavuU9bOA/uh
 QaYEWP/SvAqHymaqquQ//pXXaO2CjZWkEPeBb6W4ztnOtGZJKYdTIMvuQmAZtvUL81ly
 5UIwdV6Vko0Y1TNSIO6DT++kjXdO3/LlBtiekkSyNYkSKHAypNmBoqX/tHX6N1LsXbak
 iBS2W+xyJl1SdZKqiHR/KRhM40WR+ncpTt55Xeay9DjUNWEfVEGFY8nZGTEkpysenhN0
 NVUiWAYp+xk9MW2u/FtcMAmtDrwjaUUrR8y/E9lL4PS8DcIn/lRmQLE0Akdz6D3ws3li
 5z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769699153; x=1770303953;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oVE1o4D7voep0UOCj4pOdunoE2WIlpwfx9NVsylsdPs=;
 b=AiUHCOvftycCo+Y9nS+DKEZvTaLP9x79ZU/oQBfdxI1vrr2dLO1KvaoOxe4QRi9rkm
 kQpgzFu3xiBMPvSKTL226ogOiJiwIq4dK1LdL8muTJs0ngaR5stxf0zFPYMhaF/bKqid
 6LZC4XRLi8dCIMc6AEebeNBXbQszhCjrODF0S9+CMAZnLi8pS1095u43d31VDHRsgCKe
 RYZGNfwAY/uasF/FvbPQA2cpLNxcIesNmY/VME0py7cHn8XySQWDhH3XhG0K70gLV7b2
 AVFEvGWizEIIj9HOEJXzwAPYQ3L+T7cNX5UlK/qpDVScd08m37QxZZmhqUV3q3FDxySd
 apMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNRw2G6Y/z989OpGit7v0uZdv9H8L1kRkXa87WjzmiwVaFH7T5qNNcfD/rxhLE2tyUcwTd7+9qag==@nongnu.org
X-Gm-Message-State: AOJu0YzT3f80tYeGc/Ww+GSO0oSlwN+dZ4JBZ9ARlO3WkCyq46hIeKqs
 I1YoAslWQi7r0VytqbR0l0gKLWt/7ZC2bI3OL5DHaeMtkOe2dAWc1RlzHUix5ULHSouye4pDFhB
 k9us5oPV77XPOvfGIOPLivt85K3NQZ4AMOmGutel9pg==
X-Gm-Gg: AZuq6aLWysIE/hGLYe0RHpcY0MJ6lPYIRrUmg1UduxzK2CRUxX7FQ6QbLB+OWRX8e4+
 X4PsGY/ZmljzEaUomVxedgOt0kX/Ovh8xWNgCHhXqB7y3VqlDyskRxZ+HuBTAIw7M8+t9b8O78r
 9pseq0X/UCyDakm9uBQEZGOGhMSy6LBqnNJSE2Xu+fZzBpZFklr+UrchBqaD8n0EQL1YZQ+5NP/
 afzg/puNkJsQVh45psmFVZatB5j9n9sUsholsXOMzLC6YkZ5HyUCxrX2TwFuce2YYk8SA==
X-Received: by 2002:a05:690c:e3c2:b0:788:1b67:d741 with SMTP id
 00721157ae682-7947ab12873mr82537367b3.3.1769699152757; Thu, 29 Jan 2026
 07:05:52 -0800 (PST)
MIME-Version: 1.0
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-6-mohamed@unpredictable.fr>
 <CAFEAcA9qtLv1wOKkEmtNO5UsGTAM0x7YD+y8Fsu8hCQRAD_o5A@mail.gmail.com>
 <7CDB1385-1197-4D36-A46C-80A8F71DA9C1@unpredictable.fr>
In-Reply-To: <7CDB1385-1197-4D36-A46C-80A8F71DA9C1@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 15:05:40 +0000
X-Gm-Features: AZwV_QgLUSyk8ByUG_iGviQ9jpofwmkYLtayXeIUV3rA1ZqFjI-MmiKkoRY7y1c
Message-ID: <CAFEAcA_ES6ZyoDFbMu_98NmbLTGTXuWPuuM-QwvS7NTpwvWv5g@mail.gmail.com>
Subject: Re: [PATCH v18 05/22] tests: data: update AArch64 ACPI tables
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Alexander Graf <agraf@csgraf.de>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Phil Dennis-Jordan <phil@philjordan.eu>
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

On Thu, 29 Jan 2026 at 14:34, Mohamed Mediouni <mohamed@unpredictable.fr> w=
rote:
>
>
>
> > On 29. Jan 2026, at 14:36, Peter Maydell <peter.maydell@linaro.org> wro=
te:
> >
> > On Tue, 27 Jan 2026 at 18:28, Mohamed Mediouni <mohamed@unpredictable.f=
r> wrote:
> >>
> >> After the previous commit introducing GICv3 + GICv2m configurations,
> >> update the AArch64 ACPI tables for the GICv2 case.
> >>
> >> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> >> ---
> >> tests/data/acpi/aarch64/virt/IORT               | Bin 128 -> 84 bytes
> >> tests/data/acpi/aarch64/virt/IORT.smmuv3-dev    | Bin 364 -> 260 bytes
> >> tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy | Bin 276 -> 192 bytes
> >> tests/qtest/bios-tables-test-allowed-diff.h     |   3 ---
> >> 4 files changed, 3 deletions(-)
> >
> > The process documented in tests/qtest/bios-tables-test.c says
> > that this commit is supposed to have the diff of the disassembled
> > table data in the commit message, so that human reviewers can
> > confirm that the changes are as expected. (If you git log
> > tests/data/acpi you can see how this looks.)
> >
> > Can you provide the ASL diff, please? (If this is going to be the
> > only fix needed to this version of the series, which I hope it
> > will be, then I can update the commit message as I apply the
> > series, so you don't need to respin, just reply with the updated
> > commit message with the diff in it.)
> >
> > thanks
> > =E2=80=94 PMM
> Hi,
>
> Here=E2=80=99s the expected asl diff:
>
> diff otp/tests/data/acpi/aarch64/virt/IORT.dsl otp2/tests/data/acpi/aarch=
64/virt/IORT.dsl

diff -u, please. But you're going to need to rebase this so
I'll let you redo the commit message at that point.

-- PMM

