Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u10sm2418111wrg.55.2019.09.26.16.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 16:50:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4D73E1FF87;
	Fri, 27 Sep 2019 00:50:55 +0100 (BST)
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-5-drjones@redhat.com>
 <2beb840f-99cf-d928-0926-c284933c78d9@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v4 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
In-reply-to: <2beb840f-99cf-d928-0926-c284933c78d9@linaro.org>
Date: Fri, 27 Sep 2019 00:50:55 +0100
Message-ID: <877e5uaa74.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: c8Ryi2bkaVlf


Richard Henderson <richard.henderson@linaro.org> writes:

> On 9/24/19 4:31 AM, Andrew Jones wrote:
<snip>
>
>> +#if __SIZEOF_LONG__ =3D=3D 8
>> +#define BIT(n) (1UL << (n))
>> +#else
>> +#define BIT(n) (1ULL << (n))
>> +#endif
>
> There's no reason not to always use 1ULL is there?

Also we already have this helper in bitops.h so should just use that.

--
Alex Benn=C3=A9e
