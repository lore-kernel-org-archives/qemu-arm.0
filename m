Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110A0D1D482
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 16:34:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdsxn-0006hi-Uu; Thu, 08 Jan 2026 11:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdsxl-0006cI-Sp
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 11:34:17 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdsxi-0001YP-U9
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 11:34:17 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-432d28870ddso445368f8f.3
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767890053; x=1768494853; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wncA/0B9sgl5uEU7J4z03kPWj2ZDnbUF6l+a/mPs1fQ=;
 b=gTsFZ4xZqZMFfvfmQS/C9Ou6J00x5SHXHnz6nUoZ2ed0eYIhag1YATPnAnsnpB9ejc
 X5nLkn1/TSZf/9Q1O0gP4jkKvzPxBPUSWRj1pVP8Yx6PhPVUU5f1mxr3/3OwkwfhpuJ9
 64OcuN/qFDTW/DYvvbfy8TyixHFN13NiPTPCLSSLg3Pm46ktLrolzcbOSt9NXSrYpjDG
 F7gDs8kvjd+hMCLbJ6SZB1jFI8MtOpKLMA9mjVY8suLE40Ka86hzgm3E56Hy3ULSILrI
 V+WUjLTloOIK8k1X/WlMllFKB0pBARcUgRca9D5f4QE0NvUYXqjam6Vnovo7w5drKyX+
 icmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767890053; x=1768494853;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wncA/0B9sgl5uEU7J4z03kPWj2ZDnbUF6l+a/mPs1fQ=;
 b=BoHrxq8bU822aC4JLQMzyNSJLbxkHZCWDQcuRvALZ4KExum4+bYIbm27VhvstsLLaC
 GWH2T9FEvFMKCUfUe577olcWdltsG9cXNbmo/h1hT+xJjmnaGl3tR1rueXgoTDb9qEvc
 ewFudBSwEfPHO13skOKuzibWYnsVBrqPrPH6fgKGLdH/hcYMHyiQZkob0JvSo04yFm8K
 DFxidWQXT2v6HZKKlZ7O4yQk1wErbTdGRuLRd8TvaREFnvsrpo1SPtOz0F9H1SATzFAV
 8UJB88eV4bGTuLF2w2vd5jx+5u0ryiH9TN6iYKG1LxB313JrwHU9T4rOvVyuOFG1QEfQ
 1YvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVCGUxN2VcENKOVik/daaCM7axHH6PHHfbEU53njXoox661APJ2iy2nApehKgakJHoLMOv4BE/HA==@nongnu.org
X-Gm-Message-State: AOJu0YzwcQQsHVeGI7JF7n+IP8ctX0Tf1vUk7/or81r8zOmaSrHeEArW
 iaoElw5LkWBw6p9sPrakJf0HpE11ZPoU5pTKcc6rn7Hkw1IiSANByoY8W+g0TGmq4rY=
X-Gm-Gg: AY/fxX4gP70c5cxORauBcwc+SIq+kdmbBMMuEuXRDC2ezu6/cgQUi2cnIGi6uGVemii
 CjOoXuNPeuLAoors9deAersL5tVC2nh8cFs/Yk2eo/vf57GNu6srA+2nvPyJtcEIa6tPCHPC0VL
 LL8ezVvkA96RxMBEWVfkzvsvquKV7INb+P8wUrhh9Dy1of0zW4ZbJBOlypQAq1aiMkh58FvFO89
 0z0jWld/sLfH7+ol8rFgQOLoXp1iq5a65NYzZhQH7x4mYOZFbRaxtZS5X8Hq98f4144QAO5ArUu
 kr0Kwe1cDtqhfAzRh6PGuSKQO50tYjvIbkwejN89y999sEj/TWidS/sd19lllJzuCimLLaHPfSi
 0fGrzQ9AaVgPjcT/cAuHAG2yTIiQBeaSF1FpcVNvLgi99EqoikV0Fie+zyEokzpDX/3YSxbhM5E
 DGaBK4/J6Ib4Y=
X-Google-Smtp-Source: AGHT+IErwJT/c8y8fIHVz0jcyjWsx9XPglphWLWJvWwjjnQ5t8C73F+OvbeaRIGebdmWfkZSlQw5Yw==
X-Received: by 2002:a05:6000:40df:b0:431:a63:d3d3 with SMTP id
 ffacd0b85a97d-432c3632b3dmr8688961f8f.24.1767890053113; 
 Thu, 08 Jan 2026 08:34:13 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe67csm17023929f8f.40.2026.01.08.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 08:34:12 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 7584A5F804;
 Thu, 08 Jan 2026 16:34:11 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Aurelien Jarno <aurelien@aurel32.net>,  Jiaxun
 Yang <jiaxun.yang@flygoat.com>,  Bastian Koppelmann
 <kbastian@rumtueddeln.de>,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org,  Yoshinori Sato <yoshinori.sato@nifty.com>,  Yanan
 Wang <wangyanan55@huawei.com>,  Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>,  Eduardo Habkost <eduardo@habkost.net>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [RFC PATCH 00/12] cpu_reset clean-ups for arm, sh4, mips, m68k
 and tricore
In-Reply-To: <79bd03ad-3fc5-4d83-ab4f-55f8f840cc6c@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 8 Jan 2026 16:35:56
 +0100")
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
 <79bd03ad-3fc5-4d83-ab4f-55f8f840cc6c@linaro.org>
User-Agent: mu4e 1.12.14; emacs 30.1
Date: Thu, 08 Jan 2026 16:34:11 +0000
Message-ID: <87wm1s83ng.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> On 8/1/26 15:34, Alex Benn=C3=A9e wrote:
>> We tend to apply cpu_reset inconsistently throughout our various
>> models which leads to unintended ordering dependencies. This got in
>> the way in my last plugins series:
>>    https://patchew.org/QEMU/20251219190849.238323-1-alex.bennee@linaro.o=
rg/
>> where I needed to shuffle things around to ensure that gdb register
>> creation was done after dependant peripherals had created their cpu
>> interfaces.
>> Regardless of that we do have a proper reset interface now and most
>> architectures have moved to it. This series attempts to clean-up the
>> remaining cases with proper qemu_register_reset() calls so reset is
>> called when we intend to.
>
> Last time I was blocked at this comment:
> https://lore.kernel.org/qemu-devel/20231128170008.57ddb03e@imammedo.users=
.ipa.redhat.com/

From that:

 --cpu_reset()  <- brings cpu to known (after reset|poweron) state
   cpu_common_realizefn()
       if (dev->hotplugged) {=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
           cpu_synchronize_post_init(cpu);=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
           cpu_resume(cpu);=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       }
 ++cpu_reset()  <-- looks to be too late, we already told hypervisor to run=
 undefined CPU, didn't we?

I would posit that the hotplug path is different as we online the CPU as
soon as its ready. Maybe that is just special cased as:

       if (dev->hotplugged) {
           cpu_reset(cpu);
           cpu_synchronize_post_init(cpu);=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
           cpu_resume(cpu);=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
       }

Unless hotplug should also honour the reset tree in which case that
logic could be moved:

  void cpu_reset(CPUState *cpu)
  {
      DeviceState *dev =3D DEVICE(cpu);

      if (!dev->hotplugged) {
          device_cold_reset(DEVICE(cpu));
      } else {
          /* hotplugging implies we should know how to setup */
          cpu_synchronize_post_init(cpu);=20=20=20=20
      }
      trace_cpu_reset(cpu->cpu_index);

  #ifdef CONFIG_TCG
      /*
       * Because vCPUs get "started" before the machine is ready we often
       * can't provide all the information plugins need during
       * cpu_common_initfn. However the vCPU will be reset a few times
       * before we eventually set things going giving plugins an
       * opportunity to update things.
       */
      qemu_plugin_vcpu_reset_hook(cpu);
  #endif
  }

Do we have test cases for hotplugging CPUs?

>
>> Alex Benn=C3=A9e (12):
>>    target/sh4: drop cpu_reset from realizefn
>>    target/m68k: introduce env->reset_pc
>>    hw/m68k: register a nextcube_cpu_reset handler
>>    hw/m68k: register a mcf5208evb_cpu_reset handler
>>    hw/m68k: register a an5206_cpu_reset handler
>>    hw/m68k: just use reset_pc for virt platform
>>    target/m68k: drop cpu_reset on realizefn
>>    hw/mips: defer finalising gcr_base until reset time
>>    hw/mips: drop cpu_reset in mips_cpu_realizefn
>>    target/tricore: move cpu_reset from tricore_cpu_realizefn
>>    target/arm: remove extraneous cpu_reset from realizefn
>>    include/hw: expand cpu_reset function docs

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

