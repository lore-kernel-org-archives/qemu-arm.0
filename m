Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2437286lfv;
        Mon, 1 Nov 2021 12:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7HD7/WoRydm9enUWQmAcPq9TE8oDpTQeIrLN+9JYigLqvhkYcWw6cuMUTmmdRKzx36hSI
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr817668oib.40.1635794030155;
        Mon, 01 Nov 2021 12:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635794030; cv=none;
        d=google.com; s=arc-20160816;
        b=O2ciVCNDHtVFFOlQ+0OS7JVbEaYkq28uDBhwU+a6qVt9zwHFpliC2gegMnXs8yIFF+
         xyhDIgryWSeQ5OVY7bUF/UD4t0wVmlAZe0Jz7LX/9EQOhPR0vVf1VMCwhviHgMwfLPBf
         B/MP/U37a9McqPULll+/sZIIpdhMYWRUuR3Kt0w5329bPtswt+JGb+ji58AHYz7tfTV9
         eMCMC80ks0kH0W6ouwWo7uQbOlgMZOltwuW74/o0pZtOYL6GsnfM2QWagkX66xGv24Gg
         NhNbwLBviEP2O9r5vWVXeog5R/cJwF5ntSrVxOnzlM46/wfmFcQ+jrrveOKGep5PMmsZ
         3pcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ksSclwanCZfaR0gMdqRD5SAuV2HJqaeQ0LJ3h7gB0lQ=;
        b=FiDBkUuyh6CedZ04HTEL5ha8wvMhejL8bc6MusD+WKAcHU4Qww9C8SFpHcUVhRDdUL
         Zw1i5x631BxexhQuAWulbb0zzAMoLgvsojyfx0ujJ6OeP+Pwo49yhA6YqvcnFQNsTP78
         tJpphB02p0+pgHebsVlIQzbtFAgROp6E/C8tY3Z4gU7I+cW3ji06SWT8oa6xTZU7HqQ2
         MR6Tw+fpKzPtf4FhG9wNjCZk4w0WPhyxewuG1fas1HNJA6SRiUTUHhSw4w1LykVsYswx
         l8PeBFfE2N296HWolHMLXpOOcg4Opk3OtDA48udNXWuGaSpDyOFcoVLlxKDGhIgJIr7x
         NjfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pf7wsh8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq22si3522409oib.185.2021.11.01.12.13.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 12:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pf7wsh8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhckf-0002BN-Bv
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 15:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbd3-0008MU-Cq
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbcv-0001Ts-9f
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635789704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ksSclwanCZfaR0gMdqRD5SAuV2HJqaeQ0LJ3h7gB0lQ=;
 b=Pf7wsh8K9eusHCXbP0sGrb9VLkmluEGqEvUr3De1QWxLmK3dc3ywiMoNlLV+14I5vIvVMX
 PtMNtrZ9xQ4X54oz4ulqdw4iFCz4l44DlvDkT5ZJFhsllj1X+73eqv73/qzVzoIcg5RN1o
 J8PGnTVbcNXTYU76M+Uni5+FFyPs/Xo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-hmEsY9msMUOXEv_9cu2Iqw-1; Mon, 01 Nov 2021 14:01:42 -0400
X-MC-Unique: hmEsY9msMUOXEv_9cu2Iqw-1
Received: by mail-pl1-f197.google.com with SMTP id
 x5-20020a1709028ec500b0013a347b89e4so6305766plo.3
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 11:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ksSclwanCZfaR0gMdqRD5SAuV2HJqaeQ0LJ3h7gB0lQ=;
 b=BBvqXKNCjqVc46ayq1S6XP7VtzMyQSxv0Wv9MeiJ2KICQI4nJOzb4ifvoc2LbOSt3/
 Tncu0QRPnn3xE0zdudif0LjSDStlMRslxNNe/N91u3+IXsKVUr6NrMe0RrbcduHcsCD0
 JClpPJdVllViikUpFyVYCgNP7GN4OtHuExrDAQVmqZ0/bU/VmTcN14d48p5jG+/8zgxk
 aKqwB6AJMPnm9dy+eUY7uzUeppPEaipemvGrU6k61Nzfsct8totBOmrZ1E2IJ/wmQ/4X
 m1LTvaa1DAfMP1XPznS9OZnnbeheofx32UEScROE5kzbowRWZ/QXB0w41q+81MsqDj0S
 A35g==
X-Gm-Message-State: AOAM532HqyGoQuCezA4lKW4S8zpj/RT71BuE40fABp8wCBGyiLcL4Mh8
 t2gS5ZGjaHyHa8SB1aHMpl7NsHARW8d2HzTiSBQ/wkEDWq0nlhmr6I1EUuqv3oW8fUgtazIE/LF
 gemR2G9GHxMicXCPkMojUcrNzZpP1
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr478609pju.123.1635789701500; 
 Mon, 01 Nov 2021 11:01:41 -0700 (PDT)
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr478556pju.123.1635789701154; 
 Mon, 01 Nov 2021 11:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-2-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-2-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 15:01:15 -0300
Message-ID: <CAKJDGDZ0S1f26T3J6ajJ++5cGBNCQveisVvqf2WhXCy8EPsnCA@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] tests/acceptance: Extract QemuBaseTest from Test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: t4Y/bDfFkRzV

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> The Avocado Test::fetch_asset() is handy to download artifacts
> before running tests. The current class is named Test but only
> tests system emulation. As we want to test user emulation,
> refactor the common code as QemuBaseTest.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 72 +++++++++++++----------
>  1 file changed, 41 insertions(+), 31 deletions(-)
>
> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance=
/avocado_qemu/__init__.py
> index 2c4fef3e149..8fcbed74849 100644
> --- a/tests/acceptance/avocado_qemu/__init__.py
> +++ b/tests/acceptance/avocado_qemu/__init__.py
> @@ -175,7 +175,7 @@ def exec_command_and_wait_for_pattern(test, command,
>      """
>      _console_interaction(test, success_message, failure_message, command=
 + '\r')
>
> -class Test(avocado.Test):
> +class QemuBaseTest(avocado.Test):
>      def _get_unique_tag_val(self, tag_name):
>          """
>          Gets a tag value, if unique for a key
> @@ -185,6 +185,46 @@ def _get_unique_tag_val(self, tag_name):
>              return vals.pop()
>          return None
>
> +    def setUp(self):
> +        self.arch =3D self.params.get('arch',
> +                                    default=3Dself._get_unique_tag_val('=
arch'))
> +
> +        self.cpu =3D self.params.get('cpu',
> +                                   default=3Dself._get_unique_tag_val('c=
pu'))
> +
> +        default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
> +        self.qemu_bin =3D self.params.get('qemu_bin',
> +                                        default=3Ddefault_qemu_bin)
> +        if self.qemu_bin is None:
> +            self.cancel("No QEMU binary defined or found in the build tr=
ee")
> +
> +    def fetch_asset(self, name,
> +                    asset_hash=3DNone, algorithm=3DNone,
> +                    locations=3DNone, expire=3DNone,
> +                    find_only=3DFalse, cancel_on_missing=3DTrue):
> +        return super(QemuBaseTest, self).fetch_asset(name,

It is preferable to use the PEP3135
(https://www.python.org/dev/peps/pep-3135/) when calling `super` as
linter are complaining about it:

return super().fetch_asset(name,

And after reading through the patch I noticed it was a method move,
so, feel free to take the suggestion or ignore it for now.

> +                        asset_hash=3Dasset_hash,
> +                        algorithm=3Dalgorithm,
> +                        locations=3Dlocations,
> +                        expire=3Dexpire,
> +                        find_only=3Dfind_only,
> +                        cancel_on_missing=3Dcancel_on_missing)
> +
> +
> +class Test(QemuBaseTest):
> +    """Facilitates system emulation tests.
> +
> +    TODO: Rename this class as `QemuSystemTest`.
> +    """
> +
> +    def setUp(self):
> +        self._vms =3D {}
> +
> +        super(Test, self).setUp()

Same from previous comment:

super().setUp()

> +
> +        self.machine =3D self.params.get('machine',
> +                                       default=3Dself._get_unique_tag_va=
l('machine'))
> +
>      def require_accelerator(self, accelerator):
>          """
>          Requires an accelerator to be available for the test to continue
> @@ -207,24 +247,6 @@ def require_accelerator(self, accelerator):
>              self.cancel("%s accelerator does not seem to be "
>                          "available" % accelerator)
>
> -    def setUp(self):
> -        self._vms =3D {}
> -
> -        self.arch =3D self.params.get('arch',
> -                                    default=3Dself._get_unique_tag_val('=
arch'))
> -
> -        self.cpu =3D self.params.get('cpu',
> -                                   default=3Dself._get_unique_tag_val('c=
pu'))
> -
> -        self.machine =3D self.params.get('machine',
> -                                       default=3Dself._get_unique_tag_va=
l('machine'))
> -
> -        default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
> -        self.qemu_bin =3D self.params.get('qemu_bin',
> -                                        default=3Ddefault_qemu_bin)
> -        if self.qemu_bin is None:
> -            self.cancel("No QEMU binary defined or found in the build tr=
ee")
> -
>      def _new_vm(self, name, *args):
>          self._sd =3D tempfile.TemporaryDirectory(prefix=3D"avo_qemu_sock=
_")
>          vm =3D QEMUMachine(self.qemu_bin, base_temp_dir=3Dself.workdir,
> @@ -277,18 +299,6 @@ def tearDown(self):
>              vm.shutdown()
>          self._sd =3D None
>
> -    def fetch_asset(self, name,
> -                    asset_hash=3DNone, algorithm=3DNone,
> -                    locations=3DNone, expire=3DNone,
> -                    find_only=3DFalse, cancel_on_missing=3DTrue):
> -        return super(Test, self).fetch_asset(name,
> -                        asset_hash=3Dasset_hash,
> -                        algorithm=3Dalgorithm,
> -                        locations=3Dlocations,
> -                        expire=3Dexpire,
> -                        find_only=3Dfind_only,
> -                        cancel_on_missing=3Dcancel_on_missing)
> -
>
>  class LinuxSSHMixIn:
>      """Contains utility methods for interacting with a guest via SSH."""
> --
> 2.31.1
>

Except for one (or two, if you consider the first) small comment,
looks good to me, so

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

