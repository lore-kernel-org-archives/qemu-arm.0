Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m24-20020a7bca58000000b00401b242e2e6sm419619wml.47.2023.08.24.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 05:37:31 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 57AC81FFBB;
	Thu, 24 Aug 2023 13:37:31 +0100 (BST)
References: <20230817053017.24207-1-akihiko.odaki@daynix.com>
User-agent: mu4e 1.11.14; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, Richard
 Henderson <richard.henderson@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau
 <marcandre.lureau@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Michael
 Rolnik <mrolnik@gmail.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Brian Cain <bcain@quicinc.com>, Song Gao
 <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent
 Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>, Jiaxun
 Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek
 Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>, Daniel Henrique
 Barboza <danielhb413@gmail.com>, =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>, David
 Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, Nicholas
 Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, David Hildenbrand <david@redhat.com>, Ilya
 Leoshkevich <iii@linux.ibm.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Max Filippov
 <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, Anton
 Kochkov <anton.kochkov@proton.me>
Subject: Re: [PATCH v5 00/26] plugins: Allow to read registers
Date: Thu, 24 Aug 2023 13:36:43 +0100
In-reply-to: <20230817053017.24207-1-akihiko.odaki@daynix.com>
Message-ID: <87wmxkfwfo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 63S0VVhSO9uB


Akihiko Odaki <akihiko.odaki@daynix.com> writes:

> I and other people in the University of Tokyo, where I research processor
> design, found TCG plugins are very useful for processor design
> exploration.

This series didn't seem to complete getting to the mailing list. Can you
re-post or send the next iteration?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
