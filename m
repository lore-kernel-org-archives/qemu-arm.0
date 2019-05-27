Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp6736859pjq;
        Mon, 27 May 2019 06:43:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzzOW0fKPfJqPyBXbu1Qk5Wu31P0Qu9Mfo3n53NRaH7Hjft9sE/Yh9iqAP1J0FH6XqIRO3
X-Received: by 2002:aca:45c3:: with SMTP id s186mr356111oia.89.1558964588035;
        Mon, 27 May 2019 06:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558964588; cv=none;
        d=google.com; s=arc-20160816;
        b=LAHkoo3gc/lVE4JNPRR4I/a9/4WOiOjWA+KJjS0AIEUUzVSRq2723PHFKt3jDbipJ8
         ht4ZBB5NeCWsulRRAaY9SYexU8rIVcCVZr/dXKwvYHt//JmFWbh668dwcygC1f0Yax5G
         gcl2EbMdhruvuMB69oBo+2+y2oaBZR7LiMWYXHQBXVYSsL2rIuEgbTMkbxEUwWkhRQAw
         Z5NtmKFU+98MgJu5ckHT66q6mEcS5hfWNADp9Xgnf86jZlhhmRcpSttq0pMPdxIHjA4B
         GRnWA5H57M4WP3KZBjH83NOsblElVOlCr42OMxrSgfawbKHJ1BHhGT47hPVSnEKT/H/R
         hkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt
         :openpgp:from:references:cc:to:subject;
        bh=/1WH77a6gZH62ha+4ItQcL/bK0OuYIY80Uf7SbdUc1s=;
        b=Uvbx0XAknPoEimTkB42cr/2NAHum2RZshhEBV2MZVDE9H2AhJTLSzXeh54ssMHDMbq
         gKFEgmZswWwmmSQ4ECrqZt3segjEjbYYIFcMEMV8QhZWM1UrkScnxn5Vg6aPIDnrcoDP
         pQ3vpNlWYdMt3txHc8AHLYvojgfpeYqPhTgHn8JwHTu6jn/KUUTVqGQcUwVRC9mdwEHo
         6PVzrdk76hz1BbhvctKTlShPhUJ/zTpuU4gY3C8A7siOE/X0K8K2YxRnpQW3h1+Neztv
         veFDdWiB7976cutXeUW5SvysLsot2IIPuAHJ83DwJScSdXnnCTGJBoBirf+ILWFlsc8M
         JQkA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mreitz@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mreitz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mreitz@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 33si6129104otd.139.2019.05.27.06.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 May 2019 06:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of mreitz@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mreitz@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mreitz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68A4D81DF5;
	Mon, 27 May 2019 13:43:07 +0000 (UTC)
Received: from dresden.str.redhat.com (unknown [10.40.205.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91F060BE5;
	Mon, 27 May 2019 13:43:05 +0000 (UTC)
Subject: Re: [PATCH v2 27/28] tests/qemu-iotests: re-format output to for make
 check-block
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-28-alex.bennee@linaro.org>
From: Max Reitz <mreitz@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mreitz@redhat.com; prefer-encrypt=mutual; keydata=
 mQENBFXOJlcBCADEyyhOTsoa/2ujoTRAJj4MKA21dkxxELVj3cuILpLTmtachWj7QW+TVG8U
 /PsMCFbpwsQR7oEy8eHHZwuGQsNpEtNC2G/L8Yka0BIBzv7dEgrPzIu+W3anZXQW4702+uES
 U29G8TP/NGfXRRHGlbBIH9KNUnOSUD2vRtpOLXkWsV5CN6vQFYgQfFvmp5ZpPeUe6xNplu8V
 mcTw8OSEDW/ZnxJc8TekCKZSpdzYoxfzjm7xGmZqB18VFwgJZlIibt1HE0EB4w5GsD7x5ekh
 awIe3RwoZgZDLQMdOitJ1tUc8aqaxvgA4tz6J6st8D8pS//m1gAoYJWGwwIVj1DjTYLtABEB
 AAG0HU1heCBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+iQFTBBMBCAA9AhsDBQkSzAMABQsJ
 CAcCBhUICQoLAgQWAgMBAh4BAheABQJVzie5FRhoa3A6Ly9rZXlzLmdudXBnLm5ldAAKCRD0
 B9sAYdXPQDcIB/9uNkbYEex1rHKz3mr12uxYMwLOOFY9fstP5aoVJQ1nWQVB6m2cfKGdcRe1
 2/nFaHSNAzT0NnKz2MjhZVmcrpyd2Gp2QyISCfb1FbT82GMtXFj1wiHmPb3CixYmWGQUUh+I
 AvUqsevLA+WihgBUyaJq/vuDVM1/K9Un+w+Tz5vpeMidlIsTYhcsMhn0L9wlCjoucljvbDy/
 8C9L2DUdgi3XTa0ORKeflUhdL4gucWoAMrKX2nmPjBMKLgU7WLBc8AtV+84b9OWFML6NEyo4
 4cP7cM/07VlJK53pqNg5cHtnWwjHcbpGkQvx6RUx6F1My3y52vM24rNUA3+ligVEgPYBuQEN
 BFXOJlcBCADAmcVUNTWT6yLWQHvxZ0o47KCP8OcLqD+67T0RCe6d0LP8GsWtrJdeDIQk+T+F
 xO7DolQPS6iQ6Ak2/lJaPX8L0BkEAiMuLCKFU6Bn3lFOkrQeKp3u05wCSV1iKnhg0UPji9V2
 W5eNfy8F4ZQHpeGUGy+liGXlxqkeRVhLyevUqfU0WgNqAJpfhHSGpBgihUupmyUg7lfUPeRM
 DzAN1pIqoFuxnN+BRHdAecpsLcbR8sQddXmDg9BpSKozO/JyBmaS1RlquI8HERQoe6EynJhd
 64aICHDfj61rp+/0jTIcevxIIAzW70IadoS/y3DVIkuhncgDBvGbF3aBtjrJVP+5ABEBAAGJ
 ASUEGAEIAA8FAlXOJlcCGwwFCRLMAwAACgkQ9AfbAGHVz0CbFwf9F/PXxQR9i4N0iipISYjU
 sxVdjJOM2TMut+ZZcQ6NSMvhZ0ogQxJ+iEQ5OjnIputKvPVd5U7WRh+4lF1lB/NQGrGZQ1ic
 alkj6ocscQyFwfib+xIe9w8TG1CVGkII7+TbS5pXHRxZH1niaRpoi/hYtgzkuOPp35jJyqT/
 /ELbqQTDAWcqtJhzxKLE/ugcOMK520dJDeb6x2xVES+S5LXby0D4juZlvUj+1fwZu+7Io5+B
 bkhSVPb/QdOVTpnz7zWNyNw+OONo1aBUKkhq2UIByYXgORPFnbfMY7QWHcjpBVw9MgC4tGeF
 R4bv+1nAMMxKmb5VvQCExr0eFhJUAHAhVg==
Message-ID: <18f8fad1-5dac-eb5b-f531-da3b2124ec35@redhat.com>
Date: Mon, 27 May 2019 15:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523102532.10486-28-alex.bennee@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FsMxNijuSXvHMIJ1syRPjsvNpKwaVNbHy"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 27 May 2019 13:43:07 +0000 (UTC)
X-TUID: O/tO9fOP/aoV

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FsMxNijuSXvHMIJ1syRPjsvNpKwaVNbHy
Content-Type: multipart/mixed; boundary="5TY4c1xkqZjSpXCNejpspyvoywIg8gPgJ";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Message-ID: <18f8fad1-5dac-eb5b-f531-da3b2124ec35@redhat.com>
Subject: Re: [PATCH v2 27/28] tests/qemu-iotests: re-format output to for make
 check-block
References: <20190523102532.10486-1-alex.bennee@linaro.org>
 <20190523102532.10486-28-alex.bennee@linaro.org>
In-Reply-To: <20190523102532.10486-28-alex.bennee@linaro.org>

--5TY4c1xkqZjSpXCNejpspyvoywIg8gPgJ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 23.05.19 12:25, Alex Benn=C3=A9e wrote:
> This attempts to clean-up the output to better match the output of the
> rest of the QEMU check system when called with -makecheck. This include=
s:
>=20
>   - formatting as "  TEST    iotest-FMT: nnn"
>   - only dumping config on failure (when -makecheck enabled)
>=20
> The non-make check output has been cleaned up as well:
>=20
>   - line re-displayed (\r) at the end
>   - fancy colours for pass/fail/skip
>   - timestamps always printed (option removed)
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
> Tested-by: Thomas Huth <thuth@redhat.com>
>=20
> ---
> v3
>   - revert echo to printf
>   - add _report_test_start
> v4
>   - -pretty -> -makecheck
>   - keep all output together for makecheck
> v5
>   - merged in kwolf's pretty printing
>   - timestamps always printed in non-makecheck mode
> ---
>  tests/qemu-iotests/check | 179 +++++++++++++++++++++++++--------------=

>  1 file changed, 116 insertions(+), 63 deletions(-)

Unless I missed something, this breaks ./check:

$ ./check -T -qcow2
000 - unknown test, ignored
QEMU          -- "build/x86_64-softmmu/qemu-system-x86_64" -nodefaults
-machine accel=3Dqtest
QEMU_IMG      -- "build/qemu-img"
QEMU_IO       -- "build/qemu-io"  --cache writeback -f qcow2
QEMU_NBD      -- "build/qemu-nbd"
IMGFMT        -- qcow2 (compat=3D1.1)
IMGPROTO      -- file
PLATFORM      -- Linux/x86_64 dresden 5.0.14-300.fc30.x86_64
TEST_DIR      -- build/tests/qemu-iotests/scratch
SOCKET_SCM_HELPER -- build/tests/qemu-iotests/socket_scm_helper

Passed all 0 tests


Max


--5TY4c1xkqZjSpXCNejpspyvoywIg8gPgJ--

--FsMxNijuSXvHMIJ1syRPjsvNpKwaVNbHy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzr6WgACgkQ9AfbAGHV
z0DMkAf/bHal/2ocCNulJC0evjWLf7VPleqTg3TaFpGYlwH8cJ1AIUvKqQ8a8aP8
FTFDHF/qbL8TFJ8BM6BOJGkkUnvyjFAWRBZMV+3bwNv0PT04JCyDkQIyeFLZ7lKa
lZPIYu4B1dT7pfR67Y/5R7dPRxYq6Nsb8um+K3PCfR9CkhwQtSKX/N3TCCvOog0p
cID3EEeFmFK3pvMd7Hc5zUun5pehcnSCsmBXfsEILu8WV7v38/BiXCv+gyRHlN89
2SBI1xcwcCBzzZxUu2xc3fPZPADPZ3SQtyfZj5NPwenMtafZW5BLs9TaRN3OsGix
06IlcXZ+cnpLsi3noh5nNY1qbZwAVw==
=5xQa
-----END PGP SIGNATURE-----

--FsMxNijuSXvHMIJ1syRPjsvNpKwaVNbHy--
