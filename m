Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp349822ejb;
        Wed, 26 Jul 2023 00:11:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGxy693+8yd+mYMd/KsDjbnPVmNRlbGwrCHpQqHd0vgk/djiMhoCtKeJ8Kz2T5sTlXKc8oc
X-Received: by 2002:a05:620a:24cc:b0:767:5581:838f with SMTP id m12-20020a05620a24cc00b007675581838fmr1588074qkn.35.1690355468361;
        Wed, 26 Jul 2023 00:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690355468; cv=none;
        d=google.com; s=arc-20160816;
        b=Hk5NQsqQTcVUREwg0sA1aJzFzvR+gt484n5xkBY7yofLHbtto7siDE1BelpgkTh0s5
         bpnNELgsBtwQNl06734ex2kQNUe77nVCow5LkoIpaFsXjTy+mo/hQ+xnVGL/KNbxuBDe
         L8IE/DxZ75nlf3iQccVN5GTGCR2oTf4gwItXm5BpZmlNwsAOerafh5opPvQDRzlY9RxN
         LfBoEknX7yLl3KsB3ZKXg8xnl7CK4OmqTw6460g6UPYI8Davmsh3//OG4cnsA6YKTSMD
         x+tiEvg9ZpQC5jTjXrj/aXEdvM+S92Rn0FEIe4W8ICxGdX5uscOhFwDBf3XKpnIFAtNg
         Qk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=lX1l6szb8/+CiwsIlg0i0JoieBPi8LCbM9oxwYH8Pms=;
        fh=3mAJYZQhXDvlBNGaGFEUqy2PPsrVZf8Wh56w6B4PPoQ=;
        b=tM8zEHuLKQV/b8jpLUzBApxie7qDj8xChTHdUtcSgUAKDpLbAu77Hd3RWr2jOD1Wme
         n++BahKSnPQMnlN0loXy50KCGAcEQXsvovvD757xXi/5jNG97pFrD57i29Ykx9Y7gX1n
         IUdb18wIHTD2oQBN1h717eBeAbf13O9jx8YzZ6TyAIx8dWINiHTNjTnC5oajz4s9QWkv
         ChBtC+XjkBVM7Z8C+J5iCpZnq2M1jUDqw3hWdqLxkHaelI8vl5LCoYCjbriMkX+SJBi2
         fjCwLI+pOn4NGG/7bDQ1M9jAHK1D5B7D3fmyJ3O5rgjmzcK0Rpj/lJ1melq+bLd+qKNW
         UjLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HesVRIlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020a05620a28cf00b007683e92072dsi7782547qkp.179.2023.07.26.00.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 00:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HesVRIlS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOYfi-0006lZ-Vc; Wed, 26 Jul 2023 03:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qOYfg-0006kU-VN
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 03:10:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1qOYfe-00049u-8X
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 03:10:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690355451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lX1l6szb8/+CiwsIlg0i0JoieBPi8LCbM9oxwYH8Pms=;
 b=HesVRIlShrFv/acUC54/NcRNBOQvW3lpkIS8wtPzTfFC5QQje6mN9A3Wq0it05Bs5LvcJQ
 g1AfilP7XfFb7RX1+/wgViYprvE14gTRFEKEyj/uuCOKLcSRyRPUIVPPY16M3U+3cd+4u4
 0wfqGalwJTGw8QJS6eNP6lyQ2iPY22Q=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-lJ7cdQ8ZOueNG0odiQKTug-1; Wed, 26 Jul 2023 03:10:49 -0400
X-MC-Unique: lJ7cdQ8ZOueNG0odiQKTug-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-563db371f05so584514a12.3
 for <qemu-arm@nongnu.org>; Wed, 26 Jul 2023 00:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355449; x=1690960249;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qRlABuytTMmZriWos7umoUGrtsGpCHoMMAEvcZWDQxE=;
 b=Zz2M+N2c3RynDKvGfv2Svb9sgfq8skLBB2juRj5oNwbfKCEUDaEwvLBvmyL3cRj1Ms
 5npqs1jQqyQkhlqlkqSw5PPPWb3Lf3fce/bBgCFRsiShWF5CG1dvuQ0UpKlKcBBJifpU
 JQ2UaHARpqOSbjoLoQCEhafI4oV721B1my0V137yKWlzdW5rcbUEc8JmlECfkN6It4ov
 iOViq8OgTjv9ExDZlBHe3a5Ne39uKOI7cwmHDPr2LqA9TghgjBLAn/Il0uP7jBpRxxaD
 xTOexiFvKt/xWX7fkfjAiYpg0lFRtNyD/2yu97j5zIQaOHmmMLirhGR5+VT3kembWmC1
 vTww==
X-Gm-Message-State: ABy/qLakyva6KzuSLVBAan0jWA0F6SqoqKT5F7yp1xareuStiVYTVSA7
 OUPN/eYUH4Pbxs4gG0bwszrihWnzaTg3V6sxrzB5hcE5EC39tdceuW201cQBtaO5Rntz619s9Ud
 setzcaDnE8np3
X-Received: by 2002:a05:6a20:3c90:b0:138:1980:1dd3 with SMTP id
 b16-20020a056a203c9000b0013819801dd3mr1093416pzj.14.1690355448853; 
 Wed, 26 Jul 2023 00:10:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:3c90:b0:138:1980:1dd3 with SMTP id
 b16-20020a056a203c9000b0013819801dd3mr1093391pzj.14.1690355448560; 
 Wed, 26 Jul 2023 00:10:48 -0700 (PDT)
Received: from smtpclient.apple ([115.96.152.59])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a170902a61600b001b2069072ccsm12307634plq.18.2023.07.26.00.10.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jul 2023 00:10:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH v2 1/6] python/machine: move socket setup out of
 _base_args property
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20230725180337.2937292-2-jsnow@redhat.com>
Date: Wed, 26 Jul 2023 12:40:40 +0530
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
Message-Id: <F7950301-E4B8-422F-A1A5-4A34CFD2D170@redhat.com>
References: <20230725180337.2937292-1-jsnow@redhat.com>
 <20230725180337.2937292-2-jsnow@redhat.com>
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
X-TUID: fnUYVbi2L7u7



> On 25-Jul-2023, at 11:33 PM, John Snow <jsnow@redhat.com> wrote:
>=20
> This property isn't meant to do much else besides return a list of
> strings, so move this setup back out into _pre_launch().
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> python/qemu/machine/machine.py | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine=
.py
> index c16a0b6fed..8be0f684fe 100644
> --- a/python/qemu/machine/machine.py
> +++ b/python/qemu/machine/machine.py
> @@ -300,9 +300,7 @@ def _base_args(self) -> List[str]:
>=20
>         if self._qmp_set:
>             if self._sock_pair:
> -                fd =3D self._sock_pair[0].fileno()
> -                os.set_inheritable(fd, True)
> -                moncdev =3D f"socket,id=3Dmon,fd=3D{fd}"
> +                moncdev =3D f"socket,id=3Dmon,fd=3D{self._sock_pair[0].f=
ileno()}"
>             elif isinstance(self._monitor_address, tuple):
>                 moncdev =3D "socket,id=3Dmon,host=3D{},port=3D{}".format(
>                     *self._monitor_address
> @@ -339,6 +337,7 @@ def _pre_launch(self) -> None:
>         if self._qmp_set:
>             if self._monitor_address is None:
>                 self._sock_pair =3D socket.socketpair()
> +                os.set_inheritable(self._sock_pair[0].fileno(), True)
>                 sock =3D self._sock_pair[1]
>             if isinstance(self._monitor_address, str):
>                 self._remove_files.append(self._monitor_address)
> --=20
> 2.41.0
>=20

