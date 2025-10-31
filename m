Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A6BCCF9F8
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Oct 2025 17:13:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEsgC-0005Iu-B9; Fri, 31 Oct 2025 13:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vEsgA-0005IV-5X
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 13:12:46 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vEsfx-00029R-AY
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 13:12:44 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-7829fc3b7deso25906707b3.3
 for <qemu-arm@nongnu.org>; Fri, 31 Oct 2025 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761930748; x=1762535548; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2SB9POBkjg1Us0sUG+3O3Z6wvadHIuK9NbeMFU1sRIY=;
 b=H9zC2g/4z4VCFEpXKV635DP31/HU3FpTNWrE6owcHzMgviGsyDWKeT1ZzqfEY7XdX2
 FuMvBfmCTBRjKh2AAGMk7i4Vr9/N7b8jrm7EDE8KsIBGq5AHnZyI/S6DKP6Mi/AOhSMG
 txcDT7D9G9PP6xYCUCVlY7xGmTp4ZPWoV7im/wvkSeL4Dxis/xd0gagbwJ5UR3CeFItm
 enEL9rUk6p3Qf/hc9Q/8x6PVecE3UO3iP6qZxmvzLGOwug7ANV6lZvBkcKh9KaGsFmpA
 e+Kc0ML09il/TpggocCYJtu9dBLZIowa2NuZqy+3uR+3Td4pNo+iO3BxT1IwGngtM6Sh
 ukyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761930748; x=1762535548;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SB9POBkjg1Us0sUG+3O3Z6wvadHIuK9NbeMFU1sRIY=;
 b=RI0Eyt6oBQIA1VZAk3usyzHMbyIP/27YprFTdQJzu2KvJ6dOkICqVk73kOeS2YS6xO
 L+rMeA886cmzFdE6lNoLtV9LpL8Q3wgrLOoFVQlF52aLnd9ObjoHk3HoNEBKUCewnetH
 3rj/OKTO0TTuwF51dct0XyyJSQ8OCzbVOYWP9ytMkAJByhQRaSWcm8ZMxzUlQrUGNh42
 Xm2+ejHuj5XGS5Fx83aSeCe7AKJiQCDdbybqgbeof3kYyUh7/X/3QmuieKXWfHH+thXN
 nM+UgT8qirH8hQgdKTbu4TGaBWD1LpxJ/42UAmPvfVc/qcGqK5cNtF3sxAq6GvAYSl1F
 hYFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNNxaZNsNoql1cO0arXlxcWVbezzFihG/JmgWZmUaFs/pCNXS3qS8eNUVAwGI41dMsdKoGeIUqlA==@nongnu.org
X-Gm-Message-State: AOJu0YzR9pHmk4vJodsaScK7eGnrq/RsDwLZBR0g2+cl4Y1LGOUXSxy+
 F5pazYvVayA0g3/Guv2qeN5lm+oNeHNLYTbJk8HogSwXWBF77j0xqDqUtoUZGWgLRDirXI5uArM
 Uy7iyNm+RoMf0btJGuqCBjiWj56mm0CseLIyxPInabw==
X-Gm-Gg: ASbGnct2dnxyMhX0kSX56NpYcdVH1rZVm0B1NnvZcRzPo+yqxaJxopQdJzzhjG3i2S7
 yKbbqWwodJR4+BzScckTP4pQmV8adHpDVM4YYfNtCJVt8dKdoQTVLGO8rXlTIsAcn4U959fUgCb
 gnl4UlvPntsCcHMhyRv/1pz43YBujgXnkAUzMAXRIH3df595doZ6ac9oxH61wlGYkN4kpa+IiNx
 CjziMIU9dLJEt5y+MQgPM0PPx5VbEk53ySFyez9sDrJ4TsizTHpULi3pqA4nFfdqchF+sUqwut7
 RnUhTNc=
X-Google-Smtp-Source: AGHT+IFCte1X8y4YsdxnWBtbHiM0a3qAzsqv3mQGAYobUBkzvYIkCor5esJxpwIj7FPkYrgHHWC1AZbfBR/c8surOxo=
X-Received: by 2002:a05:690c:3385:b0:784:a2f3:85e0 with SMTP id
 00721157ae682-786483e8aa4mr37133117b3.2.1761930746785; Fri, 31 Oct 2025
 10:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251029142311.2986-1-shentey@gmail.com>
 <CAFEAcA-CGQ2JwDoBVZNhQyBMNKXbZsy2Ds+=m0MAPq0hrsWHhA@mail.gmail.com>
In-Reply-To: <CAFEAcA-CGQ2JwDoBVZNhQyBMNKXbZsy2Ds+=m0MAPq0hrsWHhA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Oct 2025 17:12:15 +0000
X-Gm-Features: AWmQ_bkPj_LxqpykJudvE1UxVO93iHQc-pfGpj_kX67HAiWOeDGk0rwbnXgfw7I
Message-ID: <CAFEAcA_sbvMEJ-oTxTYOutgUrH0iapNcJrsZd3=Ov6wNn-NE3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM Support for imx8mp-evk Machine
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Fri, 31 Oct 2025 at 16:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 29 Oct 2025 at 14:23, Bernhard Beschow <shentey@gmail.com> wrote:
> >
> > This series adds KVM support to the imx8mp-evk machine, allowing it to run
> > guests with KVM acceleration. Inspiration was taken from the virt machine. This
> > required a device tree quirk for the guest clock to be kept in sync with the
> > host. Without this quirk the guest's clock would advance with factor <host
> > system counter> / 8Mhz.
> >
> > Testing done:
> > * Run `qemu-system-aarch64 -M imx8mp-evk -accel kvm -smp 4` under
> >   `qemu-system-aarch64 -M virt,secure=on,virtualization=on,gic-version=4 \
> >   -cpu cortex-a72 -smp 4 -accel tcg` and `qemu-system-aarch64 -M imx8mp-evk \
> >   -accel tcg -smp 4". Observe that the `date` command reflects the host's date.
> >
> > v2:
> > * Mention various tradeoffs in the board documentation (Peter)
> > * Accommodate for single-binary (Peter, Pierrick) by having CPU defaults
> >
> > Bernhard Beschow (2):
> >   hw/arm/imx8mp-evk: Add KVM support
> >   hw/arm/imx8mp-evk: Fix guest time in KVM mode
>
> Thanks, I've applied this to target-arm.next.

...I've had to un-queue it, as it breaks "make check":

test:         qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test
start time:   17:06:52
duration:     3.70s
result:       killed by signal 6 SIGABRT
command:      MALLOC_PERTURB_=155
UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1
PYTHON=/data_nvme1n1/linaro/qemu-from-laptop/qemu/build/arm-clang/pyvenv/bin/python3
G_TEST_DBUS_DAEMON=/data_nvme1n1/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
RUST_BACKTRACE=1
MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1
QTEST_QEMU_BINARY=./qemu-system-aarch64
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1
QTEST_QEMU_IMG=./qemu-img MESON_TEST_ITERATION=1
/data_nvme1n1/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qtest/device-introspect-test
--tap -k
----------------------------------- stdout -----------------------------------
[...]
# Testing device 'fsl-imx8mp'
----------------------------------- stderr -----------------------------------
unknown type '(null)'
Broken pipe
../../tests/qtest/libqtest.c:199: kill_qemu() tried to terminate QEMU
process but encountered exit status 1 (expected 0)


I think the problem is that you're trying to use ms->cpu_type
in the fsl_imx8mp_init() function. This doesn't work in the
device-introspect-test setup, because it is just instantiating
each device for test, not running a full machine.

I think the way we usually avoid this is that if an SoC
device object needs to know what CPU type to instantiate
it has a QOM property, and the board model tells it.
(Annoyingly this then means the CPU instantiation has to
move into the realize method where the property value is known.)

Philippe may know if there's a nicer way to deal with this.
(Would it be too ugly to just handle ms->cpu_type == NULL
as "assume default"?)

thanks
-- PMM

