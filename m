Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 35sm38391691wro.71.2020.11.19.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:39:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E03431FF7E;
	Thu, 19 Nov 2020 11:39:18 +0000 (GMT)
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-4-david.edmondson@oracle.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Edmondson <david.edmondson@oracle.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>, John Snow
 <jsnow@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 3/5] hw/arm: Convert assertions about flash image
 size to error_report
In-reply-to: <20201116104216.439650-4-david.edmondson@oracle.com>
Date: Thu, 19 Nov 2020 11:39:18 +0000
Message-ID: <87ima1vamx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FF4tCqnd/qp5


David Edmondson <david.edmondson@oracle.com> writes:

> Rather than throwing an assertion, provide a more detailed report if a
> flash image is inappropriately sized or aligned.
>
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
