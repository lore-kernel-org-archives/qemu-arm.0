Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id z15-20020a7bc7cf000000b003a5537bb2besm11561455wmk.25.2022.10.03.06.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 06:03:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 691F41FFB7;
	Mon,  3 Oct 2022 14:03:48 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-17-richard.henderson@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Taylor Simpson
 <tsimpson@quicinc.com>, Song Gao <gaosong@loongson.cn>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek
 Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 16/18] hw/core: Add CPUClass.get_pc
Date: Mon, 03 Oct 2022 14:03:43 +0100
In-reply-to: <20220930212622.108363-17-richard.henderson@linaro.org>
Message-ID: <8735c5njnv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: H6ejPHeaVkB9


Richard Henderson <richard.henderson@linaro.org> writes:

> Populate this new method for all targets.  Always match
> the result that would be given by cpu_get_tb_cpu_state,
> as we will want these values to correspond in the logs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
