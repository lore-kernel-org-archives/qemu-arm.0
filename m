Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2471063lfv;
        Mon, 1 Nov 2021 12:47:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysKKEiGo4YTEVhzm9VPgnNdxe5+x457GOmpkOuY+seZPNj//X3lWWHlN22vGrpUsL4gpSi
X-Received: by 2002:a05:6808:23cb:: with SMTP id bq11mr925128oib.123.1635796022785;
        Mon, 01 Nov 2021 12:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635796022; cv=none;
        d=google.com; s=arc-20160816;
        b=KnwsLK5yIRppQv9dW680Qc0xL+0iOoCMEtDU4eZur4w5AwhJqg6zsmrsX+6KJOaT7c
         PO+yDF73JN4Jhk+LKE+nZ1A2Ny03Gmqy4CQDqrsWRUuCGGIrEucwM9XSeUBvUWaWaOOx
         7so1heUPFOzzraC5rKrO9HAkw1+XqL7ZS8x4uGOED/fqleYlLS0y3GCG7Q3f5OPz21QW
         l6Z230kJ6ydESVWpRR4cLtb4yqJVXVEKbjwRgrlnqjmSIoFyQvSggELYrFF3k+obvJfT
         wTFKda/uhn/9ZOh6rG+Haa9JGGpHAq7l+cAorehKwNGceFPlv9oNuEv6eD3VMYED7u4s
         gRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0tEi3aBNy//N4HYvlfbsqMsJ0BuAM3mn9Kp1CJ9GpnM=;
        b=xskuC0GP9EIrrZvtbeyD0NGkaUnhldt3fE4oKUT2pi8CbxbT8B2TgznU68F++f0ecS
         wRPRxPIFsvDtairkQDilKIpOETdc/POSjusS+St5PR+fbPG0w3UU2CsHM5tWAsqPlFmK
         J8nLE1UFmC+UK0v6W6gdm+KU3ejMwlpDal5UWrH+MGoIhUVtik6cuxPBAKb9tKZdFe3q
         itaAP1cZAadZX5oiuyJ9aQVmIrZr8/1JzAeTDVSTPq3LSYOH4UMfUDszn/03lsDuBB51
         fxfH0v0zRUAxhGrphAomFRmXcowvR70d5snCLFVyI39pX2cRPdIMNFFSRnDU8K9fU6CP
         50hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hlSt2Edp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb6si20278986oib.48.2021.11.01.12.47.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 12:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hlSt2Edp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhdGo-0000HK-3I
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 15:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcQd-00031o-So
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:53:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhcQb-0001HT-UR
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:53:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0tEi3aBNy//N4HYvlfbsqMsJ0BuAM3mn9Kp1CJ9GpnM=;
 b=hlSt2EdpjD4oM8bY22BXy2u4cEsgyA5q+X6RpRuET9qiS+I5CjZ+i5hW2cAxOUb30QWCbR
 5eKTho9hEKJIqRTGkVz0xgkys5jUIU0t3HLhpIo9el0eM7ivGpD5/ZwTaF+JQwa9l5jLNr
 l6AYhHEGLD7JpNhd7BGP84XFmrgTFIE=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-EMLHmFs9NkipjXe79uLRjA-1; Mon, 01 Nov 2021 14:53:04 -0400
X-MC-Unique: EMLHmFs9NkipjXe79uLRjA-1
Received: by mail-pj1-f69.google.com with SMTP id
 mv1-20020a17090b198100b001a67d5901d2so29875pjb.7
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 11:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0tEi3aBNy//N4HYvlfbsqMsJ0BuAM3mn9Kp1CJ9GpnM=;
 b=Yac9QErwb5ZkmN0h8kBw5c0aunfoIWqWjFeFogE+VlOMdpm6X7RFSqZ8bKCsOVyI0Y
 QTb27gKh3rLI6LYDO8Qxd9YqnPf8jNWlnmwt/hVeeriIj2En8q2WQtqYMNdpgd1qyp05
 oFLNGiho/bmDmqc6r0JXcMMKGWsomdosrjNLtwvuKiF11zWusWdHPUTgLEkKjYD9gaSu
 hZpHAkrd5FZOKeZhoN3LBd3pDRbNsGzZ4Gr7zBIZYKGIRx/JOdtckxwja8sGdGA3XVNL
 BMV8lRXWBuPRHSccQ1ohI6oe8PiXCCUaVT8pd+6yLOxuFOF82u2K/0Zev5YeTIDNYtjy
 JNlQ==
X-Gm-Message-State: AOAM533yNA5h9rR9CzqYTG5Nbo15fyQx/ly2zfaoLyQv6F7nXEd2kVLF
 Cs2ifxEKc72GO0tX0bGKeZJg5cA6/tS6Ht/4Z0zyp6neANbofve1/yhok7E3zo8oTo2iDr8Ernk
 3Q5gJnUG7Z4zlBYghkn46Rbxwmb5d
X-Received: by 2002:a62:8817:0:b0:481:7fe:c736 with SMTP id
 l23-20020a628817000000b0048107fec736mr9752164pfd.42.1635792783165; 
 Mon, 01 Nov 2021 11:53:03 -0700 (PDT)
X-Received: by 2002:a62:8817:0:b0:481:7fe:c736 with SMTP id
 l23-20020a628817000000b0048107fec736mr9752130pfd.42.1635792782878; Mon, 01
 Nov 2021 11:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-3-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-3-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 15:52:36 -0300
Message-ID: <CAKJDGDbmMCugZQNmnpsTJ=+w0JF9MZVEiuzs__FvnjaauNQP_g@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] tests/acceptance: Make pick_default_qemu_bin()
 more generic
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
X-TUID: PMglBa8Cfe6I

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Make pick_default_qemu_bin() generic to find qemu-system or
> qemu-user binaries.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 8fcbed74849..2b9b5dd27fe 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -52,7 +52,7 @@ def is_readable_executable_file(path):
>      return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
>
>
> -def pick_default_qemu_bin(arch=3DNone):
> +def pick_default_qemu_bin(bin_prefix=3D'qemu-system-', arch=3DNone):
>      """
>      Picks the path of a QEMU binary, starting either in the current work=
ing
>      directory or in the source tree root directory.
> @@ -71,7 +71,7 @@ def pick_default_qemu_bin(arch=3DNone):
>      # qemu binary path does not match arch for powerpc, handle it
>      if 'ppc64le' in arch:
>          arch =3D 'ppc64'
> -    qemu_bin_relative_path =3D "./qemu-system-%s" % arch
> +    qemu_bin_relative_path =3D os.path.join(".", bin_prefix + arch)
>      if is_readable_executable_file(qemu_bin_relative_path):
>          return qemu_bin_relative_path
>
> @@ -185,14 +185,14 @@ def _get_unique_tag_val(self, tag_name):
>              return vals.pop()
>          return None
>
> -    def setUp(self):
> +    def setUp(self, bin_prefix):
>          self.arch =3D self.params.get('arch',
>                                      default=3Dself._get_unique_tag_val('=
arch'))
>
>          self.cpu =3D self.params.get('cpu',
>                                     default=3Dself._get_unique_tag_val('c=
pu'))
>
> -        default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
> +        default_qemu_bin =3D pick_default_qemu_bin(bin_prefix, arch=3Dse=
lf.arch)
>          self.qemu_bin =3D self.params.get('qemu_bin',
>                                          default=3Ddefault_qemu_bin)
>          if self.qemu_bin is None:
> @@ -220,7 +220,7 @@ class Test(QemuBaseTest):
>      def setUp(self):
>          self._vms =3D {}
>
> -        super(Test, self).setUp()
> +        super(Test, self).setUp('qemu-system-')

If you need to change something else in this patch, consider using PEP3135:

super().setUp('qemu-system-')

Anyway,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

>
>          self.machine =3D self.params.get('machine',
>                                         default=3Dself._get_unique_tag_va=
l('machine'))
> --
> 2.31.1
>

