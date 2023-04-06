Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003ef6f87118dsm4798573wmo.42.2023.04.06.01.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:59:40 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 32B481FFB7;
	Thu,  6 Apr 2023 09:59:40 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-3-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 02/10] accel/kvm: Declare kvm_direct_msi_allowed in stubs
Date: Thu, 06 Apr 2023 09:59:23 +0100
In-reply-to: <20230405160454.97436-3-philmd@linaro.org>
Message-ID: <87edoxjshv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: uUNQZYpid8xx


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Avoid when calling kvm_direct_msi_enabled() from
> arm_gicv3_its_common.c the next commit:
>
>   Undefined symbols for architecture arm64:
>     "_kvm_direct_msi_allowed", referenced from:
>         _its_class_name in hw_intc_arm_gicv3_its_common.c.o
>   ld: symbol(s) not found for architecture arm64
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
