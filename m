Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w1sm8825262wmi.24.2020.11.19.03.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:56:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1979E1FF7E;
	Thu, 19 Nov 2020 11:56:06 +0000 (GMT)
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-2-david.edmondson@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Edmondson <david.edmondson@oracle.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 1/5] hw/block: blk_check_size_and_read_all should
 report backend name
In-reply-to: <20201116104216.439650-2-david.edmondson@oracle.com>
Date: Thu, 19 Nov 2020 11:56:06 +0000
Message-ID: <87d009v9ux.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: /JbBRhEBP/e0


David Edmondson <david.edmondson@oracle.com> writes:

> If there are problems examining or reading data from the block
> backend, the error messages should include an appropriate identifier
> to assist in diagnoses.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

With Phillipe's suggested ''s:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
