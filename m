Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1088238wrh;
        Thu, 9 May 2019 11:12:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxFrE0Ibz4Fi9O7nBoBZ4b3ZeN1hzihRzm+x6Cl96/KdYUpbyNJvm5YRT+g577Pg2bKVcl
X-Received: by 2002:ae9:ef0e:: with SMTP id d14mr4528999qkg.232.1557425575592;
        Thu, 09 May 2019 11:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557425575; cv=none;
        d=google.com; s=arc-20160816;
        b=W37rInuUMVoUHfA5w8IcDu1HhwuPfxyL/QdoDErWqVej86eV6x5PQbc6H3PcO8HpEX
         KXeK1UvMZ7CX5f000oMT9tkku6CbnyAL5lDYN2+wN+BN69ZmLOwGJFEY9tmoIi8Qh5if
         7s5V8pCkdUc7VoCtiWz5Mh+WhYbITYjBPy2vRt2U/wMjIwSvOvb/F5/GQtu4AQL+t4XE
         RQaLR3lm1ZQsWBgLRZV06QT7uemj3LBwEzD6PiOLf9Kjl1g3flqTLnp9I6ZI2f0qJgnB
         ndP1IR81wY5dIW5Ap9I5q4SZO172O7BjGCb0rL6n5V9YG30OrgLZ4iFJRO/kmjggrLj+
         cN7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:mime-version:user-agent:date:message-id:autocrypt
         :openpgp:from:references:cc:to:subject;
        bh=HnbCbbBfC0OXvuB1ISEa4S75WJNDAMdI5kLyqnjklVs=;
        b=dcSJJ1Kra+zV+hWCVKxj3LXXqWYLlRRNPCeRfEdoUn1Gpk6xya+kfgNdjdXuaTM3nP
         EFF73pqDjKlJaws1BfHG+Gdhl47oSv9qelG252T9h1xOcpQdGsjaUFjZfGe7YyPZrInb
         8GvgPuy49LYirliK36Mvvx87ImhSqNfU+NPureKH5FnAoH9LSYT00gQyjURNOa0c4Kt6
         89wKPyNRn0V9dLBch83sRH4u9i3rRSVKRky5mpoQ4IQHq2+rZ4TCXZFCElhCI8rw8nIq
         BNbUJqwuW7dipcIQyaRYPx65/PbYz2Efuf0mavtlFv/wurEnPW1k+ZnnoWyTIs3vXeR4
         pWaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mreitz@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mreitz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mreitz@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a85si582176qkb.236.2019.05.09.11.12.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 11:12:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of mreitz@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mreitz@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=mreitz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AECC47DCCA;
	Thu,  9 May 2019 18:12:54 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-204-168.brq.redhat.com [10.40.204.168])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B59B5E7D0;
	Thu,  9 May 2019 18:12:53 +0000 (UTC)
Subject: Re: [PATCH v1 22/23] tests/qemu-iotests: re-format output to for make
 check-block
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-23-alex.bennee@linaro.org>
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
Message-ID: <2dcd2689-ca10-b014-e7f0-1967f4901fe2@redhat.com>
Date: Thu, 9 May 2019 20:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-23-alex.bennee@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qhslNKrnqE11et8oXcGPnP9ZFs5DcZUcS"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 09 May 2019 18:12:54 +0000 (UTC)
X-TUID: Jz4e+aVPGDPM

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qhslNKrnqE11et8oXcGPnP9ZFs5DcZUcS
Content-Type: multipart/mixed; boundary="VoBbdMQtatnmovUePVdVZzzJZRTy2Afa1";
 protected-headers="v1"
From: Max Reitz <mreitz@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Message-ID: <2dcd2689-ca10-b014-e7f0-1967f4901fe2@redhat.com>
Subject: Re: [PATCH v1 22/23] tests/qemu-iotests: re-format output to for make
 check-block
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-23-alex.bennee@linaro.org>
In-Reply-To: <20190509165912.10512-23-alex.bennee@linaro.org>

--VoBbdMQtatnmovUePVdVZzzJZRTy2Afa1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 09.05.19 18:59, Alex Benn=C3=A9e wrote:
> This attempts to clean-up the output to better match the output of the
> rest of the QEMU check system. This includes:
>=20
>   - formatting as "  TEST    iotest: nnn"
>   - calculating time diff at the end
>   - only dumping config on failure
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20190503143904.31211-1-alex.bennee@linaro.org>
> ---
>  tests/qemu-iotests/check | 101 +++++++++++++++++++++++----------------=

>  1 file changed, 61 insertions(+), 40 deletions(-)

Hm, this makes every iotest print two lines:

$ ./check -T -qcow2
[...]
001 [20:06:27] -> [20:06:27]
001 0s (last 1s)
002 [20:06:27] -> [20:06:28]
002 1s (last 1s)
003 [20:06:28] -> [20:06:29]
003 1s (last 1s)
004 [20:06:29] -> [20:06:29]
004 0s (last 0s)
005 [20:06:29] -> [20:06:29]
005 0s (last 0s)
[..]

Which looks rather weird to me.

Max


--VoBbdMQtatnmovUePVdVZzzJZRTy2Afa1--

--qhslNKrnqE11et8oXcGPnP9ZFs5DcZUcS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEkb62CjDbPohX0Rgp9AfbAGHVz0AFAlzUbaMACgkQ9AfbAGHV
z0Dlgwf/a+FFnGI1x//NS5mPnn8+wPvCgU47GMLr12hxS/1fTjrQPeKufBU21L9C
ZXAi8u062wbk7LEK4zYa8jI3ETDHDrsHhUjwvLaffIZ+FZSxOcIvTCkP+Ky2vJyl
q0drVYTsOdQgJtdG6A3JLIAm0uy42JgWZbYXyZdaZYIyipIqmii8Ypz4mjPmtw5k
WvMDvuqBUlCJA7qRw/MfDYWI8rHXme3FZKPaICxg/CKRsA4qY5l4K8xolRZr2UzJ
QMRYkwf42Zcw8jumQKZ88Bs8oohfYGqoTkd/2o6hRMqRi4USooAW9Scfzc0MmyYs
cmlqEBnFMb9fMduY3LsBGCiPWmDoYw==
=RdXh
-----END PGP SIGNATURE-----

--qhslNKrnqE11et8oXcGPnP9ZFs5DcZUcS--
