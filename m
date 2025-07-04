Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1117549dyc;
        Fri, 4 Jul 2025 03:40:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVovuytNwHY2+hZw6azVtp8LP59RZdTnE923kI9tAWKcrt8eW7c5hibsqkKVdzH99XrDKNaxhmwkN/F4g==@linaro.org
X-Google-Smtp-Source: AGHT+IF495YjkSR8iYV1Yqk+KZh2JHEvAaz9K/6O42PJVNDlKHwqbJs866wvXs42r1Xv8yVBIQ1n
X-Received: by 2002:a05:620a:1a93:b0:7d0:9ffd:422f with SMTP id af79cd13be357-7d5df15b74amr172325885a.54.1751625623755;
        Fri, 04 Jul 2025 03:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751625623; cv=none;
        d=google.com; s=arc-20240605;
        b=CsHscC5jddhzRBDN6HEqSr2R4AvoVrq/kG+d/9Al47ks+UxD/ZWZIRKf/+tO5/4zPg
         TnDNNNJN+45AbW5Mks6ztqZ/kV7AsciiSNPu42u2YKQ1qdjNBAZwmdlCmdDIq735B5ad
         d75NX597URRDmbG/Qlq7t2PCnqnvQIxd70OVBoTgrHOqHt+ByplwOrhDOQB+TjdeaWSz
         iutUtV4ciChGQfUkOnKeaIxoyyH4ySdhUoJhO2DTHNUKxbDKF5PguLBjA8cGfCaxSGKb
         oswgyKoX0NIdPsC0FUKgi/aAtNqkzVsXNWWWUUtTqYk9ca5AIt4dFuDVFhUB3X6YPmxZ
         lKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=wA9O8GpU1RffYD0QdjQuLE48gweREtqMni7yHIHOGP8=;
        fh=qwq+KcPrkGwoPk6iM1V9/W43qXpMeeNp1JB/a/kSMzU=;
        b=LhCSLM42LZWf2xQ1VoFi1RhVfAtG1EamvlWzDKBQ6xN5e1Pq8grJhvA4Vw5+e/mjWV
         D1WCItMA5kx4P0P9ouEbRw4Mq8596cqCafAUE6El9jT+ZolQwzN4im979uncmG3yfUBS
         RVF7veLRfPM8zzU0SkELbT2Q+p0mZnsThoT15gpKRvfdksABohpnuCg/1P4RrcJTyH8Q
         A091F97Wd7g2ksPEjU+r/GZh3p05R5y4xCDc5JhAGYgkzt1XowhjYlXrZS72Muah73PM
         8v8drstiLNtzWkaU3W7UsgQkpA8VhMm2m8VHZDwzPxptWiT75QeLSYBA7zHMBUEj9hvx
         uRNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=b9wvfymn;
       spf=pass (google.com: domain of mads@ynddal.dk designates 57.103.86.23 as permitted sender) smtp.mailfrom=mads@ynddal.dk
Return-Path: <mads@ynddal.dk>
Received: from outbound.qs.icloud.com (p-east3-cluster3-host2-snip4-10.eps.apple.com. [57.103.86.23])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994af217asi17683161cf.459.2025.07.04.03.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of mads@ynddal.dk designates 57.103.86.23 as permitted sender) client-ip=57.103.86.23;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ynddal.dk header.s=sig1 header.b=b9wvfymn;
       spf=pass (google.com: domain of mads@ynddal.dk designates 57.103.86.23 as permitted sender) smtp.mailfrom=mads@ynddal.dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
	bh=wA9O8GpU1RffYD0QdjQuLE48gweREtqMni7yHIHOGP8=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme;
	b=b9wvfymnaad619MUtxtjryFyOVz6pbK3QU2vuzujFXkT+1T9niTA0BqBS5Lm6CRGp
	 IhFv3dpy+4iA2eVcHPyCk1o8oAFtfdGFpI7f/0dhoOONztvryge4J88pjabQ0yma1G
	 zYowfSwGfpxcmAXEOEBQwf/aJQ3ykmqfqhPNWyMnQYV4GGm29cKEdAd8OEzIMnRw+h
	 6Wcgbl3nyom1gKes9uFSTXrcoBzAfTwI+qylPxrIqd9tCtZmseUlhRZMq5Jo/DZ4CY
	 yLp580O1wtgNYlrGwT5WE/uSIob2ZTHAU0ciGqB89AFc4W3Nw3CJ2J41eecfCeT58G
	 utJl/dDc6SCMg==
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by outbound.qs.icloud.com (Postfix) with ESMTPS id 671DE180014D;
	Fri,  4 Jul 2025 10:40:19 +0000 (UTC)
Received: from smtpclient.apple (qs-asmtp-me-k8s.p00.prod.me.com [17.57.155.37])
	by outbound.qs.icloud.com (Postfix) with ESMTPSA id A19101800127;
	Fri,  4 Jul 2025 10:40:17 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v4 33/65] accel/hvf: Replace @dirty field by generic
 CPUState::vcpu_dirty field
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20250702185332.43650-34-philmd@linaro.org>
Date: Fri, 4 Jul 2025 12:40:06 +0200
Cc: qemu-devel@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D6976823-5443-47C6-BB9F-A457D71FA0A0@ynddal.dk>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-34-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-Proofpoint-GUID: oJiluUS6wIuhdirv8vTfgQBS2awDhsx1
X-Proofpoint-ORIG-GUID: oJiluUS6wIuhdirv8vTfgQBS2awDhsx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4MiBTYWx0ZWRfX3RaVDKJDT/SD
 3FZvkheal41M812L1Whg0ZiyipLgcUsLKcYJb87N+e2UagaagQvOG9U+DHck2vu+NSFpkiB3V2G
 pR8kq2ro8RfhbiX2lownRu9VrAqCh4Nin+RH9Na2rx16RoRZY9pxO80BDw/SSJ+Ibasiw5lBHtp
 HPVsYUjLoD3FggTORC0uphrOHVo7QmgT8UShpC0GE64auUNgzBwsOlHxRd6a8F2z/M40WQFdjuD
 BYR8yznHfTtV8/Qd1VIIRNHnKAZu0ZQSLaWHk+XcV2I5UnH0pNMUkUhaxaFXPPvCRld5q01xk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 clxscore=1030 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=445 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.22.0-2506060001 definitions=main-2507040082
X-TUID: urp5SVtBveBj


> On 2 Jul 2025, at 20.52, Philippe Mathieu-Daud=C3=A9 =
<philmd@linaro.org> wrote:
>=20
> No need for accel-specific @dirty field when we have
> a generic one in CPUState.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> include/system/hvf_int.h  |  1 -
> accel/hvf/hvf-accel-ops.c | 10 +++++-----
> target/arm/hvf/hvf.c      |  4 ++--
> target/i386/hvf/hvf.c     |  4 ++--
> target/i386/hvf/x86hvf.c  |  2 +-
> 5 files changed, 10 insertions(+), 11 deletions(-)
>=20

Reviewed-by: Mads Ynddal <mads@ynddal.dk>
