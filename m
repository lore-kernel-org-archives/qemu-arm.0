Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z6sm4285367wmf.9.2021.05.06.12.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 12:21:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7349C1FF7E;
	Thu,  6 May 2021 20:21:26 +0100 (BST)
References: <20210506133758.1749233-1-philmd@redhat.com>
 <20210506133758.1749233-7-philmd@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH v2 6/9] gdbstub: Only call cmd_parse_params() with
 non-NULL command schema
Date: Thu, 06 May 2021 20:21:21 +0100
In-reply-to: <20210506133758.1749233-7-philmd@redhat.com>
Message-ID: <87y2crmzwp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yYLGMLoKRW6c


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Move the NULL check on command schema buffer from the callee
> cmd_parse_params() to the single caller, process_string_cmd().
>
> This simplifies the process_string_cmd() logic.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
