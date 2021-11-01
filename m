Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2478434lfv;
        Mon, 1 Nov 2021 12:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDn1v98wPJMLjyjubhSThw1PZsUK5teHfHfILtJZWuUXqFAxNR/V9uyhQcoP953Li0O7NN
X-Received: by 2002:a4a:e218:: with SMTP id b24mr21161420oot.36.1635796468456;
        Mon, 01 Nov 2021 12:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635796468; cv=none;
        d=google.com; s=arc-20160816;
        b=Mk5bt9Lj9ezCT5GkO3//INFtEIK5oPK0n9DQ6kG0THxEWdRe44Wu41zrTGOKx7fClw
         D4DttCc2PpKWniIpG0gSs2aorfnO9d2K1iA2o13PxEF74NZqy1+ovyRVBPSNNNnLtGXs
         QEMbbjoHW11Ypg536SAO4ii/ecj7TI/4cBENRYhg6b8LDeEsHACP5TBU+T3falrnFsic
         mPcrXrU+22Aq6T6sqbpeE42DrEEUY5VOpb2zRXi3ALJZDWJpzKD994stiFYFeUIAVUj0
         owcstX/CA+UQt0Cz7dJb0v4BWvGOgAdDvSDtSeuXd9ra8nrUfHmsVoIsfZ8NT+Cg/9e5
         GAPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qjCfgUuM7riP3j0CjLK3Jx+RvDbRzI6kQxUKdEYPO3E=;
        b=V1WtycXszSZnuU2fjENILgo1dhHoZN/WOFR0ZfrsOOqpGGIBXBX41gxjCv6jo5qRhs
         6OpNhRNRh4nigeVI87n/TTCPff6o9/YBJUz77Ad8NfXzPDtErh7K1SL7D2xLiLNGaOM9
         U3WzyyHOX5Xv7F3XB4/jhAQqABxawDxxO/2tmxa8jNpwuNOxMx+XUazYVc3DeiASIjPP
         ZWHEyv2eDiEIQPqlu+yfm8wApsG2GoB/cpdNjThbcBNzx0yp86U7hpqc98Ljv1+HFwMJ
         vQFmXFXp2n6iHpXgXJqwPr3LIdxNA++RH+FM5XQFAC4yo1HZ3RC5HaLaLI3xThNZ0mFL
         Xqmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AQ4qGPuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19si2734746oto.223.2021.11.01.12.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 12:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AQ4qGPuj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhdNz-0001ip-Of
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 15:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcWu-0006vM-EE
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcWr-0002F5-Dw
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635793170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qjCfgUuM7riP3j0CjLK3Jx+RvDbRzI6kQxUKdEYPO3E=;
 b=AQ4qGPujBcK2MWEdLmmwP9ZquQP7V7wvAMsZHH3vx16nm1ZOUHK6ZrJfDwCvS4zomP0wDe
 5wev7rbIQ+QuGJXHFt6qHBgWbwUoReOWPg7OX1jPuW0GA0slFvQDc74j5pzm5b42ggLdKk
 K05N1HAjl2OW88FyBvJf5eDRnTX6lSs=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-1iWpsLlfMn-LyV32XEa0EA-1; Mon, 01 Nov 2021 14:59:28 -0400
X-MC-Unique: 1iWpsLlfMn-LyV32XEa0EA-1
Received: by mail-pg1-f198.google.com with SMTP id
 e6-20020a637446000000b002993ba24bbaso9774882pgn.12
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 11:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qjCfgUuM7riP3j0CjLK3Jx+RvDbRzI6kQxUKdEYPO3E=;
 b=YBrA9Dx1EyxUd08iDxor6rGmEe9h5Yz8vrWXbL7ya7QJ1lW4ixJS4qrNb7WIZ+aJmn
 ddKIw+AxCFCJ4XxH42kXbkDfxHsMaZGS+CdB/wB1BJWEB93NMsAt2NMj9scmAEPSLOE7
 AuRd0dolbAJu0MxVI5hNuC6pLYxmYBbh2atu/abHkhAgNJRpRhdJ1vX/Dzre7CnSEHbf
 aZQ5kRc3zw4LdO6/2tT+ehEOInNwJN++Jt5OnVnFNx9OoFFF/4ZWbwx5JM/rTEpjjQkb
 MqDxUV4i0ye4HpelbplyofRKtNHDhL3yeeVcBqxsiBpcpc67uOhKQMYOkc7c6pyUostZ
 96Ww==
X-Gm-Message-State: AOAM533bFVycuHsR0lYBduR+eRzvHRV2j74CR2tF5+gVENnOPRuc1Wb4
 O8Xs74S6BSUnJFG58eGKPOp/dFNtPQ0spK4iGwhywbNIMfZCwPJkpvUsUOpCDOOVjbQgrSsSx07
 hnWrHF+0jcxbqpDgxBp3M3GrAlUKg
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr31084385pfd.46.1635793167174; 
 Mon, 01 Nov 2021 11:59:27 -0700 (PDT)
X-Received: by 2002:aa7:8b56:0:b0:44c:10a:4ee9 with SMTP id
 i22-20020aa78b56000000b0044c010a4ee9mr31084349pfd.46.1635793166884; Mon, 01
 Nov 2021 11:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-4-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-4-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 15:59:00 -0300
Message-ID: <CAKJDGDZhVX96L2ncsMHVc=zLi0xfwmF6XmqnqAxsekv=7wR9pQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] tests/acceptance: Introduce QemuUserTest base class
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Warner Losh <imp@bsdimp.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WmYicX+BQnKb

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Similarly to the 'System' Test base class with methods for testing
> system emulation, the QemuUserTest class contains methods useful to
> test user-mode emulation.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 2b9b5dd27fe..2f59e171e49 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -20,6 +20,7 @@
>  from avocado.utils import cloudinit
>  from avocado.utils import datadrainer
>  from avocado.utils import network
> +from avocado.utils import process
>  from avocado.utils import ssh
>  from avocado.utils import vmimage
>  from avocado.utils.path import find_command
> @@ -300,6 +301,23 @@ def tearDown(self):
>          self._sd =3D None
>
>
> +class QemuUserTest(QemuBaseTest):
> +    """Facilitates user-mode emulation tests."""
> +
> +    def setUp(self):
> +        self._ldpath =3D []
> +        super(QemuUserTest, self).setUp('qemu-')

Consider using PEP3135,

super().setUp('qemu-')

> +
> +    def add_ldpath(self, ldpath):
> +        self._ldpath +=3D [os.path.abspath(ldpath)]

The use of the append method is more common here:

self._ldpath.append(os.path.abspath(ldpath))

> +
> +    def run(self, bin_path, args=3D[]):
> +        qemu_args =3D " ".join(["-L %s" % ldpath for ldpath in self._ldp=
ath])
> +        bin_args =3D " ".join(args)
> +        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
> +                                            bin_path, bin_args))
> +
> +
>  class LinuxSSHMixIn:
>      """Contains utility methods for interacting with a guest via SSH."""

Besides some Python related suggestions, the code looks good.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>
> --
> 2.31.1
>

