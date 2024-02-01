X-Forwarded-Encrypted: i=0; AJvYcCW7NpIoj1nuyTbHJHNrUV1q1+a+ZoQR0ItTb3f/oQYUUZVrgXtgpm3dkNBK5rXiaKfVm8BWuAMykidDaVGuytEQcsOmVz3tGkXSERqR4dwFZKUnUCzV73xTpbE83xBeiETdeImZKHNIH6ea+u4r6lVOZSFjWhHnzVp9uavqI3sa+2ZzA94ITDsauWVt6gD9CopbZ0pS6h8LhBE5Dwaz1HFO7jCKyf0EdxrfYQVVBBXTB8ee/iZHtx2qomM0/TuuO8QrspDq/Ztpwq+MqHo2qezd/bng15nSGVZqYvQYNb3PR4834i+tTqsm9P4SoH4PR10YH7An0ikm/TzFFu6yR0qqV5bmi3WZQfTygoiUa09D1v4g56ixhODzhl3OFwHuZOldnZKzaOQb1NYUBew36RPn5udbwnYJERL4+FHQ39t0eyJeIjq1CjBMeHkCOHWQd8lT+ECKM0BwVOgobJZ+MO5BC5F2R9WAhzYWzVw2aVjP7OypX/LJmZaiDMyl0ONRtF1pOw87XGLmtR1qnmwragJTwVAL9leH5V+n5Hj9DZIajRpdJBR/tuUbXmRLdQVbxG/BikYO6RFDZmQUfLuSVk1Bzein4A9LnBD/jncArDmdsKk94Q0RnTT996Gohnki8u6WvdJauVFrxqB2gYoTqXswVn9p6XJufLoBtCnCRA8vzHJdfUufve46X8awnnSXqr7pHZSQidZcSh0sL/FJMrw3tHKBC0HlP3kNx6GDIV8ZjTXbOgpQmMeEyB9SHxJG1eMMmtY/tRdiGEOa5LOMzkbFsPv9twF4L0Lh6y0P8bJE6LrdA21AWQ++jemdxkcjh21HGKKozF9yNEwCCJfFBdJuJWHaaNpUTR/3r+OelPo8N6aCRzO+nFCvPhFDUUv2YLtNzDrJsouhblvhfhnRNVg/Y7K3plK+Wey+gm7jyw0hfg3kAbOIR/O1MWv7BcpJeKz1iG
 bIYk94twoIFM6+aoGniZxwXfBzBiioRQSkd5j4D5FRUEeyW5f+BYSNn9Vi9A0R+u+gK0gf3uxfmLo4Z2yTaC1KSKjbsaIlxiCI+5DJCOceZnk14NZZKJVofGzfzzlNqczLaZOnw8uxrudRktM9ecWFOZvMZ6C6ZcgmvxCaqkQPYr9HzE9B7lXSZ++cy5whD3U0pdEQGuLpYZ9U17w4b22FnOeL/8OZLjS8br6ktHWkGqKhg6AKd+HxvzIpiZy2W/07Q20R/H2+tCBoNDKoNu4It9y5FrykveU=
Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u18-20020a5d4352000000b003392b1ebf5csm15989811wrr.59.2024.02.01.04.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 04:13:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EDD6A5F7AF;
	Thu,  1 Feb 2024 12:13:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
  Michael Rolnik <mrolnik@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
  kvm@vger.kernel.org,  Yoshinori Sato <ysato@users.sourceforge.jp>,
  Pierrick Bouvier <pierrick.bouvier@linaro.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,  Laurent
 Vivier <laurent@vivier.eu>,  Yanan Wang <wangyanan55@huawei.com>,
  qemu-ppc@nongnu.org,  Weiwei Li <liwei1518@gmail.com>,
  qemu-s390x@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
  Peter Maydell
 <peter.maydell@linaro.org>,  Alexandre Iooss <erdnaxe@crans.org>,  John
 Snow <jsnow@redhat.com>,  Mahmoud Mandour <ma.mandourr@gmail.com>,  Wainer
 dos Santos Moschetta <wainersm@redhat.com>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ilya Leoshkevich <iii@linux.ibm.com>,
  Alistair Francis <alistair.francis@wdc.com>,  David Woodhouse
 <dwmw2@infradead.org>,  Cleber Rosa <crosa@redhat.com>,  Beraldo Leal
 <bleal@redhat.com>,  Bin Meng <bin.meng@windriver.com>,  Nicholas Piggin
 <npiggin@gmail.com>,  Aurelien Jarno <aurelien@aurel32.net>,  Daniel
 Henrique Barboza <danielhb413@gmail.com>,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  Thomas Huth <thuth@redhat.com>,  David
 Hildenbrand <david@redhat.com>,  qemu-riscv@nongnu.org,
  qemu-arm@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  Song Gao
 <gaosong@loongson.cn>,  Eduardo Habkost <eduardo@habkost.net>,  Brian Cain
 <bcain@quicinc.com>,  Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 00/21] plugin updates (register access) for 9.0
 (pre-PR?)
In-Reply-To: <20240122145610.413836-1-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?=
	message of "Mon, 22 Jan 2024 14:55:49 +0000")
References: <20240122145610.413836-1-alex.bennee@linaro.org>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Thu, 01 Feb 2024 12:13:19 +0000
Message-ID: <871q9wmlgg.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tmTlr60hj0xd

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Akihiko requested the register support not be merged in its current
> state so it's time for another round of review. I've made a few tweaks
> to simplify the register and CPU tracking code in execlog and removed
> some stale API functions. However from my point of view its ready to
> merge.
>
> v3
> --
>   - split from testing bits (merged)
>   - removed unused api funcs
>   - keep CPUs in a GArray instead of doing by hand
>
> v2
> --
>
>  - Review feedback for register API
>  - readthedocs update
>  - add expectation docs for plugins
>
> The following still need review:
>
>   contrib/plugins: extend execlog to track register changes
>   gdbstub: expose api to find registers

Gentle ping. I'm ready to merge but more review was requested:


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
