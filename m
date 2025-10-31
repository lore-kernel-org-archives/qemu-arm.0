Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3D2CCFA02
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Oct 2025 18:19:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEti5-0008L5-AR; Fri, 31 Oct 2025 14:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEti4-0008Ko-4f
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 14:18:48 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEthu-00048I-Oq
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 14:18:46 -0400
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-429c19b5de4so843340f8f.3
 for <qemu-arm@nongnu.org>; Fri, 31 Oct 2025 11:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761934711; x=1762539511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r1am3pKGXD9x9SZaUO2wtY7r/m8jhSkSuLVNWAPfUqs=;
 b=sQbWpkgaHiCY4gbc04HiPNv8srcP52xc7OmFzJfYryINkoP1dXf9e8leEYIvJR1i2L
 sfoFJbCfpnLWJyYCJXZBBuLIV8wRC9k83bgNYf0ps42iKQZoT6imD+uI2hZZajnzxJT+
 u3epk257/Vscw95vrCMb2LOYIfEBLncvNviZrzD3efq+97UlA54Y5bxzBVBXx728gTNA
 S6T9Yc9QIoAJ79jH2IYzUbUqVqW30wFw3BluTgfzWZNGnt+eK4imIItnIWKqRtlwSe9E
 x65E0mCnKHcGHvMaYnxEWIV3ITAj1hqCpslYnEMmlLqEWj0LpWtkrcuazgK7tGo8eMWG
 Gh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761934711; x=1762539511;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r1am3pKGXD9x9SZaUO2wtY7r/m8jhSkSuLVNWAPfUqs=;
 b=jzpsabM0kivgQ8AfgcioY29e624NUh5r1vPOzG6BA/2Pwrc30hmy+JK/+0dG8aLbT1
 hzgIQ4yOKWceK8F4jhjgUeHsDB7+62ZKfrPgu07NbbLEGptgsmIkhybs10v6nc9r6eqC
 4fB4vKwixnPVZDqveC9/s6uasNkxX3bKc43ZWoVdSxolaFvFVi513gWtgND2Zkb9miTk
 3s377zdwFV6pjczgbgjz1f0PFgnUk8xlel0N5NkS0oimrmqYxxEKrE55BE/QyfrSbuD/
 dYYP9zZc2/sOxr4q8IZnpTSqhBf2iDiE0B/JzaTwATajveESw6OrAXKBdOyEb9YsTuBZ
 Zt8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ7jWYgf+sNDBz3s2pGzgGnFnkItjtkDR9XKi7fTX1mrLb8PwB3EP24/p0G0s2EHN6s/2PDQsl5Q==@nongnu.org
X-Gm-Message-State: AOJu0Yx9imqvYBxvkLcK5ULtbxcwHpjCVcpSYzSC2NHmkN6MfroshPM3
 iQOp2AtLxEttI9o2Rr17UP4PQOwyfjVBcDRp9n8YS8w6QAXcxTHsfo/mwPm/Gc9deSs=
X-Gm-Gg: ASbGnctPqUps1yLJdZrPp6zG7JCzewXC4Y5hBBcXhI45+EXtungJclw0kQSjQi45ql/
 YsWnRXjVWKgOv6CU5x8HZ/BOwgxibgrjzcOIzMeMFfAvfn8GZgk31stnyHio5+INJhW6V79Z6hW
 XA6iWIXA0DkvIrtR4KHQY7d9sfca28ohirAGRcbjjpXdtNm/B8redM+l+9LsFlvK/UVAnrrQyBg
 1VVQ1SxeYycA7wkLjpSJOYgXIc8gc+NMP5WXC6dbk9nXOi+j0uPfoxgoVQJh8JafKXUfX355R21
 OYBZ2X39S5v0OPf6e+gIQDinD6+sCS8cXUH6h1edt1HJsk6WslWRR/wLloEc+AKG+UYZOWlYIxe
 bP+DwVvzh4x85QnftQdAkS8xAzBvO7kojf1tHYZnUjuvorXAz8RalsDG+j5+Z1DYouofheYXilG
 I3og0s2TGfs/AzHf5ay4uIf3k2ZV7gl6H9BB1wsh1hJU1Tz4uwKLul9zXY8xzfGFwwng==
X-Google-Smtp-Source: AGHT+IHEM8C11IyAEGJe9D+DTYpOv0paYH88dJVL32W4vksAVJUm9puJPouxPATPlZpjuOZKUqSnsQ==
X-Received: by 2002:a05:6000:2f8a:b0:428:3bf5:b3bf with SMTP id
 ffacd0b85a97d-429bd6ac07dmr4340119f8f.43.1761934710709; 
 Fri, 31 Oct 2025 11:18:30 -0700 (PDT)
Received: from [192.168.1.17] (adijon-656-1-155-31.w90-33.abo.wanadoo.fr.
 [90.33.190.31]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13eae16sm4760884f8f.32.2025.10.31.11.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Oct 2025 11:18:30 -0700 (PDT)
Message-ID: <a7f5d348-1243-4c52-8dc1-66e2c3da40ae@linaro.org>
Date: Fri, 31 Oct 2025 19:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] KVM Support for imx8mp-evk Machine
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20251029142311.2986-1-shentey@gmail.com>
 <CAFEAcA-CGQ2JwDoBVZNhQyBMNKXbZsy2Ds+=m0MAPq0hrsWHhA@mail.gmail.com>
 <CAFEAcA_sbvMEJ-oTxTYOutgUrH0iapNcJrsZd3=Ov6wNn-NE3w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_sbvMEJ-oTxTYOutgUrH0iapNcJrsZd3=Ov6wNn-NE3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x441.google.com
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

On 31/10/25 18:12, Peter Maydell wrote:
> On Fri, 31 Oct 2025 at 16:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Wed, 29 Oct 2025 at 14:23, Bernhard Beschow <shentey@gmail.com> wrote:
>>>
>>> This series adds KVM support to the imx8mp-evk machine, allowing it to run
>>> guests with KVM acceleration. Inspiration was taken from the virt machine. This
>>> required a device tree quirk for the guest clock to be kept in sync with the
>>> host. Without this quirk the guest's clock would advance with factor <host
>>> system counter> / 8Mhz.
>>>
>>> Testing done:
>>> * Run `qemu-system-aarch64 -M imx8mp-evk -accel kvm -smp 4` under
>>>    `qemu-system-aarch64 -M virt,secure=on,virtualization=on,gic-version=4 \
>>>    -cpu cortex-a72 -smp 4 -accel tcg` and `qemu-system-aarch64 -M imx8mp-evk \
>>>    -accel tcg -smp 4". Observe that the `date` command reflects the host's date.
>>>
>>> v2:
>>> * Mention various tradeoffs in the board documentation (Peter)
>>> * Accommodate for single-binary (Peter, Pierrick) by having CPU defaults
>>>
>>> Bernhard Beschow (2):
>>>    hw/arm/imx8mp-evk: Add KVM support
>>>    hw/arm/imx8mp-evk: Fix guest time in KVM mode
>>
>> Thanks, I've applied this to target-arm.next.
> 
> ...I've had to un-queue it, as it breaks "make check":
> 
> test:         qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test
> start time:   17:06:52
> duration:     3.70s
> result:       killed by signal 6 SIGABRT
> command:      MALLOC_PERTURB_=155
> UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1
> PYTHON=/data_nvme1n1/linaro/qemu-from-laptop/qemu/build/arm-clang/pyvenv/bin/python3
> G_TEST_DBUS_DAEMON=/data_nvme1n1/linaro/qemu-from-laptop/qemu/tests/dbus-vmstate-daemon.sh
> RUST_BACKTRACE=1
> MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1
> QTEST_QEMU_BINARY=./qemu-system-aarch64
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1
> QTEST_QEMU_IMG=./qemu-img MESON_TEST_ITERATION=1
> /data_nvme1n1/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/qtest/device-introspect-test
> --tap -k
> ----------------------------------- stdout -----------------------------------
> [...]
> # Testing device 'fsl-imx8mp'
> ----------------------------------- stderr -----------------------------------
> unknown type '(null)'
> Broken pipe
> ../../tests/qtest/libqtest.c:199: kill_qemu() tried to terminate QEMU
> process but encountered exit status 1 (expected 0)
> 
> 
> I think the problem is that you're trying to use ms->cpu_type
> in the fsl_imx8mp_init() function. This doesn't work in the
> device-introspect-test setup, because it is just instantiating
> each device for test, not running a full machine.
> 
> I think the way we usually avoid this is that if an SoC
> device object needs to know what CPU type to instantiate
> it has a QOM property, and the board model tells it.
> (Annoyingly this then means the CPU instantiation has to
> move into the realize method where the property value is known.)

Correct, this is the same issue I tried to address with the Raspi
machines and I noted your comments:
https://lore.kernel.org/qemu-devel/CAFEAcA961WKB4fxwAS0WHXXKwYEO7TnmovD4z-BPGehr6sxBQw@mail.gmail.com/

> 
> Philippe may know if there's a nicer way to deal with this.
> (Would it be too ugly to just handle ms->cpu_type == NULL
> as "assume default"?)

I will think about it, but unfortunately I am not sure I'll have time
before the freeze...

This might help (untested) -- although going backward w.r.t. single
binary but not important for the 10.2 release --:

---
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 61c66ee2d0b..151ed020d1a 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -62,4 +62,4 @@ arm_common_ss.add(when: 'CONFIG_ARMSSE', if_true: 
files('armsse.c'))
  arm_common_ss.add(when: 'CONFIG_FSL_IMX7', if_true: 
files('fsl-imx7.c', 'mcimx7d-sabre.c'))
-arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: 
files('fsl-imx8mp.c'))
-arm_common_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: 
files('imx8mp-evk.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX8MP', if_true: files('fsl-imx8mp.c'))
+arm_ss.add(when: 'CONFIG_FSL_IMX8MP_EVK', if_true: files('imx8mp-evk.c'))
  arm_common_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
---

