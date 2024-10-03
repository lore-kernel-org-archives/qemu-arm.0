Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7a01f539sm38206725e9.31.2024.10.03.01.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 01:06:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7BB6A5F756;
	Thu,  3 Oct 2024 09:06:32 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org,  agraf@csgraf.de,  peter.maydell@linaro.org,
  pbonzini@redhat.com,  rad@semihalf.com,  quic_llindhol@quicinc.com,
  marcin.juszkiewicz@linaro.org,  stefanha@redhat.com,  mst@redhat.com,
  slp@redhat.com,  richard.henderson@linaro.org,  eduardo@habkost.net,
  marcel.apfelbaum@gmail.com,  gaosong@loongson.cn,
  jiaxun.yang@flygoat.com,  chenhuacai@kernel.org,  kwolf@redhat.com,
  hreitz@redhat.com,  philmd@linaro.org,  shorne@gmail.com,
  palmer@dabbelt.com,  alistair.francis@wdc.com,  bmeng.cn@gmail.com,
  liwei1518@gmail.com,  dbarboza@ventanamicro.com,
  zhiwei_liu@linux.alibaba.com,  jcmvbkbc@gmail.com,
  marcandre.lureau@redhat.com,  berrange@redhat.com,
  akihiko.odaki@daynix.com,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
  qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 00/14] macOS PV Graphics and new vmapple machine type
In-Reply-To: <20240928085727.56883-1-phil@philjordan.eu> (Phil Dennis-Jordan's
	message of "Sat, 28 Sep 2024 10:57:13 +0200")
References: <20240928085727.56883-1-phil@philjordan.eu>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Thu, 03 Oct 2024 09:06:32 +0100
Message-ID: <871q0xmwzb.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: MihD1k8yBptk

Phil Dennis-Jordan <phil@philjordan.eu> writes:

> (Apologies to anyone who has received more than one version of this
> series of emails; my git-send-email was misconfigured and this is
> a new attempt.)
>
> This patch set introduces a new ARM and macOS HVF specific machine type
> called "vmapple", as well as a family of display devices based on the
> ParavirtualizedGraphics.framework in macOS. One of the display adapter
> variants, apple-gfx-vmapple, is required for the new machine type, while
> apple-gfx-pci can be used to enable 3D graphics acceleration with x86-64
> macOS guest OSes.
>
<snip>
>
> There are currently a few limitations to this which aren't intrinsic,
> just imperfect emulation of the VZF, but it's good enough to be just
> about usable for some purposes:
>
>  * macOS 12 guests only. Versions 13+ currently fail during early boot.
>  * macOS 11+ arm64 hosts only, with hvf accel. (Perhaps some differences
>    between Apple M series CPUs and TCG's aarch64 implementation? macOS
>    hosts only because ParavirtualizedGraphics.framework is a black box
>    implementing most of the logic behind the apple-gfx device.)

We don't currently have TCG CPU models for the Apple Silicon processors.
They are not too hard to add (basically setting the correct ID register
bits, c.f. aarch64_neoverse_n1_initfn for an example). However that
would only cover Aarch64 architectural features. We do no modelling of
the extra instructions that Apple added (although in theory that should
only be run in Apples own ML libraries).


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
