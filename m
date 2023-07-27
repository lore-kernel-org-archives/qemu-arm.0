Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1049729ejb;
        Wed, 26 Jul 2023 22:53:46 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGcsOthRHPd6r+Uc3BhfhFGbEwGj+7/LLoOYZQUe1/4joIzapruhOTKxKWLdLUzaTh2+3h+
X-Received: by 2002:ac8:5843:0:b0:3fd:ecdc:1e0f with SMTP id h3-20020ac85843000000b003fdecdc1e0fmr4815504qth.17.1690437226026;
        Wed, 26 Jul 2023 22:53:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690437226; cv=none;
        d=google.com; s=arc-20160816;
        b=V4Ls19ih1XydLkrWoIyJ+6qz6J0+um6xKPDPz1Y1IppSAXkYx94wDaGDCcU6WEQAb5
         hOZ1FTy+hILbZKT4Yghf3u2SYoVhOYEQua/T0Ax3aWbS5CNkyvZ1LdtR0tXbApExztTi
         0SCFbSmowLi5W7J+q58CuJtMXpCucaLQspVM8AFQBqhvSPIRW4tbHWVq7He5w7OR99Sa
         D/LdrchuEdje9YJ0g2B9BBzTjT6K4LtCLftBOv2X/0hOoviz0tKYzeAyXnWxJivz+DMG
         5dfuje3K4lA1OQMlmBstQ6inYnN9BxQb15VkIwsy8nypX6W1BuvUuFzp9MxyWvyxHzWd
         m4kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=Of29X+3yheWd27Zm5Rh2zPCfTZyiYIiCSFccy4S/108=;
        fh=3mAJYZQhXDvlBNGaGFEUqy2PPsrVZf8Wh56w6B4PPoQ=;
        b=UNSowvYD68B+v2IpUSmNDRDX/ttVnyvPMswCza8Z5qyXboAWblD+1j/T2EM2o29SKo
         JhSNFdeXgRYBmxzOqarpjk+ekYh5FbuEp7grq5wwBsu8Krb02qVjF4sspAUQNoQlknGE
         a+SPlswdvxHf1dBWnAyyM2O5F3L07ZC8WtvYUgIxS3nI43WVHrPnfJn+2F1mGtf+6M+A
         E6I1g5OirlgUk/sUD02hAFNifmdih3er4tFXYFTj1Hc20AXLY9+WcS6CZXLsbJ2aLeKQ
         v/sVj0SHmthfyRa1GwmECCA4xuqnI4epuLqkMvczYFHlYkUe/Em1V2yOI+Xc0LHnWfhY
         0l6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZsmxdIIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020ac85bd1000000b00405514d07e1si328873qtb.764.2023.07.26.22.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 22:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZsmxdIIJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOtlF-0005BO-It; Thu, 27 Jul 2023 01:42:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qOtlA-0005AQ-Nc
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 01:42:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qOtl8-0000ZN-K7
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 01:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690436517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Of29X+3yheWd27Zm5Rh2zPCfTZyiYIiCSFccy4S/108=;
 b=ZsmxdIIJeSu+pW+8I9dbti8jgpDl86zhvOtI1Q590+UjKZH6DQb3XMxhUdpPF5oWPW42Xx
 Rf4rgVmhxcV4vPoW0Or5II6tmnBFZpnHFGZUjWSpzQF2J3Kd1saHIa2/CgHXyaMFfRfMjT
 vQUEJ3qVco83PMkE2qLKpK4b30aRB9c=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-ja-Ez-lnOQyTNUv_Xo7x1w-1; Thu, 27 Jul 2023 01:41:55 -0400
X-MC-Unique: ja-Ez-lnOQyTNUv_Xo7x1w-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-686c06b8011so373838b3a.2
 for <qemu-arm@nongnu.org>; Wed, 26 Jul 2023 22:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690436514; x=1691041314;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzJVzkgkEh7dOiAe7AF7Zwczg3HOXUOq/pU7NlgaikU=;
 b=TpbJMjjFAzVSgBGeM/BJJUuVFfD0n6gFe4nE2YFkT+ULd75jyxyFWRElbsUZOINH1V
 DCYU11+AI5519y8wL/z9G3kFuc+qL4nbdJ8PHLkirxlXy740lUxsX9xlw+6sIIsYeS5M
 ReXkEE1CKBUXCRpKBhpICyS25od7pfN8TT/h4o/4UpB+DSJZTqKxNK77zQC8B5Ekll3i
 TadE8bbcN1TeHnf93VOjOlBszZ6Y52zo9do6eOm6B1/U53g0M2Q0DT7/93hi1SoQVTda
 i4LTrZBeOm0jN06ecRcJRgEUuFK6ddnsuxlNC/qDcP6yvOrNrtir6SjOFdWD3M91F3zG
 ycXA==
X-Gm-Message-State: ABy/qLbEzRoqSC/gB+epGjO3hhMJs5yAdLs6Sei+ll4GPs0OUR8rBRZX
 wK54ZCq+hWJnrXAL5jPSQFZcUvXjdYaL2WrQ36jOLItazZdUs4/CfXId3CV8EEXQc78QWgdjWOL
 U+IiEILZ+exPl
X-Received: by 2002:a05:6a00:b4c:b0:668:9dca:13ac with SMTP id
 p12-20020a056a000b4c00b006689dca13acmr4727222pfo.7.1690436514736; 
 Wed, 26 Jul 2023 22:41:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4c:b0:668:9dca:13ac with SMTP id
 p12-20020a056a000b4c00b006689dca13acmr4727195pfo.7.1690436514411; 
 Wed, 26 Jul 2023 22:41:54 -0700 (PDT)
Received: from smtpclient.apple ([115.96.104.156])
 by smtp.gmail.com with ESMTPSA id
 c13-20020aa7880d000000b006579b062d5dsm570762pfo.21.2023.07.26.22.41.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jul 2023 22:41:53 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v2 3/6] python/console_socket: accept existing FD in
 initializer
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230725180337.2937292-4-jsnow@redhat.com>
Date: Thu, 27 Jul 2023 11:11:47 +0530
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Kevin Wolf <kwolf@redhat.com>,
 =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Message-Id: <E0A63AE3-6368-4FB0-9D8B-18722398604A@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-4-jsnow@redhat.com>
To: John Snow <jsnow@redhat.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LuS/MDh6+Si/



> On 25-Jul-2023, at 11:33 PM, John Snow <jsnow@redhat.com> wrote:
>=20
> Useful if we want to use ConsoleSocket() for a socket created by
> socketpair().
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> python/qemu/machine/console_socket.py | 29 +++++++++++++++++++--------
> 1 file changed, 21 insertions(+), 8 deletions(-)
>=20
> diff --git a/python/qemu/machine/console_socket.py b/python/qemu/machine/=
console_socket.py
> index 4e28ba9bb2..0a4e09ffc7 100644
> --- a/python/qemu/machine/console_socket.py
> +++ b/python/qemu/machine/console_socket.py
> @@ -24,19 +24,32 @@ class ConsoleSocket(socket.socket):
>     """
>     ConsoleSocket represents a socket attached to a char device.
>=20
> -    Optionally (if drain=3D=3DTrue), drains the socket and places the by=
tes
> -    into an in memory buffer for later processing.
> -
> -    Optionally a file path can be passed in and we will also
> -    dump the characters to this file for debugging purposes.
> +    :param address: An AF_UNIX path or address.
> +    :param sock_fd: Optionally, an existing socket file descriptor.
> +                    One of address or sock_fd must be specified.
> +    :param file: Optionally, a filename to log to.
> +    :param drain: Optionally, drains the socket and places the bytes
> +                  into an in memory buffer for later processing.
>     """
> -    def __init__(self, address: str, file: Optional[str] =3D None,
> +    def __init__(self,
> +                 address: Optional[str] =3D None,
> +                 sock_fd: Optional[int] =3D None,
> +                 file: Optional[str] =3D None,
>                  drain: bool =3D False):
> +        if address is None and sock_fd is None:
> +            raise ValueError("one of 'address' or 'sock_fd' must be spec=
ified")
> +        if address is not None and sock_fd is not None:
> +            raise ValueError("can't specify both 'address' and 'sock_fd'=
")
> +
>         self._recv_timeout_sec =3D 300.0
>         self._sleep_time =3D 0.5
>         self._buffer: Deque[int] =3D deque()
> -        socket.socket.__init__(self, socket.AF_UNIX, socket.SOCK_STREAM)
> -        self.connect(address)
> +        if address is not None:
> +            socket.socket.__init__(self, socket.AF_UNIX, socket.SOCK_STR=
EAM)
> +            self.connect(address)
> +        else:
> +            assert sock_fd is not None
> +            socket.socket.__init__(self, fileno=3Dsock_fd)
>         self._logfile =3D None
>         if file:
>             # pylint: disable=3Dconsider-using-with
> --=20
> 2.41.0
>=20

