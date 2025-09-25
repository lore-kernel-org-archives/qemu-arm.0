Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EADCAC5B1
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 16:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1oNb-0006IE-GP; Thu, 25 Sep 2025 11:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1oNa-0006Hs-7O
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:59:34 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1oNU-0007NF-AG
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 11:59:33 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-6353ff1a78dso616584d50.0
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758815963; x=1759420763; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uzASJePoYprN1HeknVxKlWJ+aJB92keRULtXdkBKq1s=;
 b=Xyr/Fs5wDe0VVSLn3+KiQJVw5aT2pq/4uMza0X5ASuXC3IDUvNQ/41nmRwSyCypdHZ
 9zL4eztcNn4JF7+8TwA26C9FFOZRrAD2MYBvfpOj7jOzdOysIjrSB68VXlJuTW+xexHF
 DQhzQErCsStI0btuB4B/r1mg/5dCDdjFes+uKmFRMrXkztdTFmBP9arKItlQiCli2Rh5
 Q9lEycOsNMloH4//M0Rxr5YQ8Oguf0z1vY+NyAIq87zD3y2pnsq58CVeDmgrsIodWFCh
 I2Q0Q1mvWBFM52sVv6PqIE+wETBAUoNTicPiE3h2EktKG6kSHEa34joBvU5dgHBCbceb
 AXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758815963; x=1759420763;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzASJePoYprN1HeknVxKlWJ+aJB92keRULtXdkBKq1s=;
 b=GToICpUxCHfEsFPuA4+UDmth1DmPSKwRWgd5ifwE+hGC5Y5othp0LXFR3V+V8whhU5
 1AnHBA5w8tZpT5LnUit0CyZkS4OgslnE9Mkj7xi28ayb1QgzAlOtY7f547kI069gZ52N
 /mYDHZdGAdW37SWQIFNIFz/hnlPf3DuMnrM68rtbsuFxuB3oStLAPMldLNo2aRc1ROFf
 OKRg08gcQ5ns3ryV4oF+j9eor7MLwRb8x6XgNW4t/EhpX24mPa1BGFhCpMivnXY6fDzj
 ppw6p6qDMF6PIhxCHauOOxk8/w+E+ntdIG5xgWXLazUhyvo80DqvIT2m6V/PLZbfK5G3
 8fKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDWPd0kA976j73m9a/hLDH4+Rnq3ZqNdTnUbPM28IHtAIedQvD2eR2SnFj9ruyll6w3OcA8ZBxJQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy2vilmzfTTS0Hel4WLFz1OI9aCPqXXpTKt+jVqESuDp+Tczm08
 N5wJSCcftUfcVe05mD+OIPq+Cq5UdsPvin0Hnmv8kRWUfWHus+3ubF/6I5Z6d+vX1wN0pZ1OFjZ
 LqAZa8PmZblJFzkhvqogOAy5A66Xd3xMoaT3q/SqbnQ==
X-Gm-Gg: ASbGncudy7t6DEyu6bz08jrffLxujFLRaOSXnXqTmDl5xeT122pyeRw13z1msZO2a46
 rciNA0mRv4iDWiD42oqdx0DkHn6qFB5icrkrs2Z0ZAHWKpvpMB20X9FjpigoK2UXqAt6Xw7uDvc
 utDaB+PWhQXlvz2RvW7TA+TfAUjayevH3IXpRf06uHZDOXrs74XSR65ndswW/kbqmiU0C5qKhBP
 jeVRuxV
X-Google-Smtp-Source: AGHT+IFSPhwXk0JvVn3LcsH6qtiVAFaDSeMlxlAMOGYHS/Bpz5/ipt2MOWiRViVkhVj3++SEhbBiPd+BvNljo70N1Wo=
X-Received: by 2002:a05:6902:6309:b0:eab:9d16:f038 with SMTP id
 3f1490d57ef6-eb37fadbba3mr3248959276.3.1758815963070; Thu, 25 Sep 2025
 08:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250920140124.63046-1-mohamed@unpredictable.fr>
 <20250920140124.63046-5-mohamed@unpredictable.fr>
In-Reply-To: <20250920140124.63046-5-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 16:59:11 +0100
X-Gm-Features: AS18NWBVfN6et6UqDg1jE2B_lcNu6A2J_kHt6qeSd9RBy04PUlwbM-UoIWXBlq8
Message-ID: <CAFEAcA-cAt4q6HfS7--T4Qd8qag-+fMYu9PQh3SoEtvPbd7VpQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/23] tests: data: update AArch64 ACPI tables
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
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> After the previous commit introducing GICv3 + GICv2m configurations,
> update the AArch64 ACPI tables.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>  tests/data/acpi/aarch64/virt/APIC              | Bin 172 -> 148 bytes
>  tests/data/acpi/aarch64/virt/APIC.acpihmatvirt | Bin 412 -> 388 bytes
>  tests/data/acpi/aarch64/virt/APIC.its_off      | Bin 164 -> 188 bytes
>  tests/data/acpi/aarch64/virt/APIC.topology     | Bin 732 -> 708 bytes
>  4 files changed, 0 insertions(+), 0 deletions(-)

This will break 'make check' during bisection. To make a
change which updates the ACPI table test data, you need
to do a three step process, as documented in the comment
at the top of tests/qtest/bios-tables-test.c, which will
result in three patches:
 * a patch which lists the tests which would otherwise
   fail in the allowed-to-fail list
 * the patch which makes the actual change to QEMU
 * a patch which updates the test binary blobs and
   empties the allowed-to-fail list

thanks
-- PMM

