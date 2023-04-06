Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i16-20020a05600c355000b003ede6540190sm4772378wmq.0.2023.04.06.01.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:58:34 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2B7231FFB7;
	Thu,  6 Apr 2023 09:58:34 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Date: Thu, 06 Apr 2023 09:58:24 +0100
In-reply-to: <20230405160454.97436-2-philmd@linaro.org>
Message-ID: <87ile9jsjp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: IWvb/0YURcPA


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> All types used are forward-declared in "qemu/typedefs.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
