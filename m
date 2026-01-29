Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B65D61013
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 13:43:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlSHX-0008QS-O9; Thu, 29 Jan 2026 08:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlSHE-0008Ll-Tl
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:41:43 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vlSHC-0005b9-Jf
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 08:41:40 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7942fca0da6so7579667b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 05:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769694097; cv=none;
 d=google.com; s=arc-20240605;
 b=ZKrFGGwlcoApqCURRG1yQUKnJPUPGGG+neiz1WqTWvIw8GjNbcz4ogL340bJ0E/TRW
 H80F1skpitBvYG6a8a9INU1ViGtYMGBzoIbgmi7p9CRF2UTtVzaV+M3+weF+8fFUkG3H
 9JRE70JAXqa+JkR1AlRCEqzJ022/tu3RA9qrW1xZbzGsvaztaT1JkMUf31+I0t9pTPXE
 t6gxaAjwTYJ8fFZcr7JD1YO7NIhggnnb/LS36glOPR5jR0/EPhdrPUgL/TfMFoHtPGx6
 biAPTczRIEMsgz3muLTz5+Yq4kntsnOYlDKiEqhOfcmqV5b2jUimmmc86pR+fq8t74zN
 BmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cwyLYqO384PsM59QyIlQBNjYFKFwiiWXYOM1AFGJlzE=;
 fh=j4gRX9p8oTEi/+LBsdtlp/hvMAbp96Mn73PJ8zPWq3o=;
 b=XuRKjnl7wfD08+JrDUslx5CdKINte4nbFtF36qURVQ0JP39+8KDhabD38OLC1jwdpk
 D8CSXlyBKhbaB/hqNKA2kE+DyCZasA4fM8WS43HU99tNCj/f6cUkNvSMTl7RpYc41Xwy
 ijprqwIRKZD/EFnZzhq66OnKqy3bgfvPNBl459XMkvf3WoBqLaZq4aDg3c2AQ4p703pA
 PZJspXQW2T/+FBIHoUqsXNaRyGb80QQI1yzc1UJw5bfFujbl2HUKvl+jlXAkhrXfr/Oe
 yDCB4C9EDriIsJyDwuzXazGm/Vf7ouZYzlOHDIis0YTP8rDIwamAd64JdPYg5NXMV/ma
 CRHQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769694097; x=1770298897; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cwyLYqO384PsM59QyIlQBNjYFKFwiiWXYOM1AFGJlzE=;
 b=pYSqQAyrL/RyEXWSh9GQvFk/V6ThoN5vUr34YYf7J37uLqOVsCODGfU99/LaQsGdXw
 pHj0BfENB+5svwqwg24Mz3GUETDWdTMGnxGCx7FDA8T+d6yFW3n0NUZRmOtcNhwqUAWy
 1QhhKLRsDF7y3IBwQrId7YXGIkCFi4jXvmvFuHWX5HFUxHF9VJnRd8O0V48IilM0bvcc
 Wf/45MPflG5ltW8CRk269Y2VW3/Fu7KqEYenu2N9NaJPlW07QPoQ/E0gwAa6YeL1jzTb
 5hxWuWlY5y++MEZfrkJwfCiFoLI947bccAhsw4W6vfhl4stHYve0Hf5BvIOG5H3Of0lu
 WLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769694097; x=1770298897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cwyLYqO384PsM59QyIlQBNjYFKFwiiWXYOM1AFGJlzE=;
 b=Kf9m0YjTIE4/QEIdvoZfix4BLBYm9M0OhGDUSc3qYR5n9i4ivnxI03B84SSP7Vej39
 BAzcghj8IxBSC7wWDqauuMKJ8wmgnJVrFM4Le8kodVFxoZF29zMh07honCc+IZDiH/CS
 FF5uMR2jVWV4OHiPtYRImoBqysjacgaRih5dFOa1skQ8UpUhqY5RmzJQ7LuDg0glv35/
 /X1mxDCIH0edgo7zKudBWZnhJhCBzq03gDsGHp3GPS2FECPicsjWwNR/jQm0Ai/lQsCv
 Zoh/5yVkHx/oOHQzvpaNyVCB1DO2ymIzOgKkmOonfg8kP1EMmU8s4lazZtbTGqTGWT3b
 Zz3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXENLSfbRtjJ1RxU/1meMAjWSpYO/kqEbzsQxnG9NdIe+Z2lIZp26J1DyGA03HZ4pj/ki7ZnVxuiA==@nongnu.org
X-Gm-Message-State: AOJu0YylPGpamfZJ5Y1lNSuRK66OsxhOxK1WY0LOlxQ8vVMcqImcFK1F
 MUtQSIWeYDgZr4Po0SZEN3ILQ51/SH2RDqrfbXKh2BypG64LNRDmrrx1EgUwzqEyLaCegjK/teZ
 VAGcnoH15VpoUqcVVomPy/eoX00deZqoykLDyvA8g6A==
X-Gm-Gg: AZuq6aLt6jtVIlJnyaEfcSafTM5JTyMdmXfpG7d38uFjAz5fsJjRxo9HO5zP2TWYHrl
 2sN3d/gcwcum3U091s3+TmxRDGl2Sc8676CgLReVThkvJPoH11jnRsJ1l1gnanCRoz6XeFYezzG
 j54jgwiGbgfpJ7n0+VrMGHKFeETZUaaBt5ncBSTpH5dAufvcetEdxUmwc+GXLSPH5srwpgxYEFO
 AhnnrnH/IRVZzIchTGNN8H2095egqlJzDOCdItu4Zfs/nQWWfMScDkmtPTvs041I/XHfrS6z27p
 cKh1
X-Received: by 2002:a05:690c:2904:b0:794:9317:bad2 with SMTP id
 00721157ae682-7949317c25dmr13631087b3.56.1769694097379; Thu, 29 Jan 2026
 05:41:37 -0800 (PST)
MIME-Version: 1.0
References: <20260127182805.73212-1-mohamed@unpredictable.fr>
 <20260127182805.73212-6-mohamed@unpredictable.fr>
 <CAFEAcA9qtLv1wOKkEmtNO5UsGTAM0x7YD+y8Fsu8hCQRAD_o5A@mail.gmail.com>
In-Reply-To: <CAFEAcA9qtLv1wOKkEmtNO5UsGTAM0x7YD+y8Fsu8hCQRAD_o5A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jan 2026 13:41:24 +0000
X-Gm-Features: AZwV_QjiaSc4bQvvEHjcRpY3vBoosppBqZv5nrEesKh4Q49SBnntHhtw_EfBkXE
Message-ID: <CAFEAcA-3akyfdwprPe8Fr_P-BOUAauxJqAETEj_+NN-XeBD3BQ@mail.gmail.com>
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

On Thu, 29 Jan 2026 at 13:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Jan 2026 at 18:28, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
> >
> > After the previous commit introducing GICv3 + GICv2m configurations,
> > update the AArch64 ACPI tables for the GICv2 case.
> >
> > Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> > ---
> >  tests/data/acpi/aarch64/virt/IORT               | Bin 128 -> 84 bytes
> >  tests/data/acpi/aarch64/virt/IORT.smmuv3-dev    | Bin 364 -> 260 bytes
> >  tests/data/acpi/aarch64/virt/IORT.smmuv3-legacy | Bin 276 -> 192 bytes
> >  tests/qtest/bios-tables-test-allowed-diff.h     |   3 ---
> >  4 files changed, 3 deletions(-)
>
> The process documented in tests/qtest/bios-tables-test.c says
> that this commit is supposed to have the diff of the disassembled
> table data in the commit message, so that human reviewers can
> confirm that the changes are as expected. (If you git log
> tests/data/acpi you can see how this looks.)
>
> Can you provide the ASL diff, please? (If this is going to be the
> only fix needed to this version of the series, which I hope it
> will be, then I can update the commit message as I apply the
> series, so you don't need to respin, just reply with the updated
> commit message with the diff in it.)

...ah, it looks like unfortunately this is going to conflict
with the smmuv3 acceleration series I already have queued,
because that series also updates these ACPI blobs. So I think
the best thing is if I get that out in a target-arm pullreq
and then you can rebase on top of that.

thanks
-- PMM

