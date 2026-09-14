Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAF0C88E50
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 11:33:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x64wH-0007C3-Tp; Mon, 14 Sep 2026 07:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64w4-0007AX-94
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:33:20 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x64w0-00006s-7D
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:33:20 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab20f4bso1326122d50.0
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 04:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789385594; cv=none;
 d=google.com; s=arc-20260327;
 b=jHyO7ONUP18splBqqYQz51pOUXX/BzIaJzKA0uPJGXauo0oZotdIjY0kyiMY2wFRvY
 bfDScfIKfqvbJ61rt8oxHrd0Vr2NZnqrgL3PTKignKGPgBruJc+WJ9ae+a4Sqc4fY4yY
 r9QUrKDno6lz3S6++dKSsEy+gW5/fp7lFJlAZ/QqUNXabEdJSoVRFOJniEbIK8eHMWTv
 dE3pb/SKqKQeB3HFhqc3qm8tLDGpNsXS+aOxFHJ4wK/9BwoW4xAb5e5uw1ZsxNnJ2dJP
 vHGKUge1G0sMgAdIw2CrHG6q/RwPsEqlQ9K5rV6kB8RWis3S7sRxs8B4wNakuao1wmKW
 4UZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=46tUkjWcsGNE0/IRMnS9oYK/PTTMmBusYPYi2kH+L/w=;
 fh=Y0espqVN/Aa6B2atsiqJqxagzn8hSSHWWe8bwRrkLsY=;
 b=Q0pU9L4lO9yDvr/4oQ+2ZMMhjbY87I67miwk19AusTQdL028h6s7alrUZ8X3hvYQjH
 eAet4iXKSQB1jLUEQBEn1ChzYh6OhRRPm6HM77WQfml8X1t6cDMLNjyljgzd/hrzRdtv
 yIMfpT1d8Gkt46o9EMtihSAD4/WWw+8CQmkMUihY31LkKRXD2XSk4YpZue0gl5RkYBxH
 Y7ytShjDbneXNhL3gHOZU+U8R7mh7EgyZQ2eDQ6HRFUf7XwVTZbAwABMeJ8sC/dYdOjN
 AV4oomgrGvPeOCYHcL5IOTTf42cCmMh1TEHW2jDvlcBQn9Xw34VTzncwtIAJUTf1BYZ3
 Z0uQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789385594; x=1789990394; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=46tUkjWcsGNE0/IRMnS9oYK/PTTMmBusYPYi2kH+L/w=;
 b=Vvwbcanhf/SjcVECnsy3Ho+U+sw4zZWOX70lqMeQeU/DSlROBW9FxKTSLnt44zK1lj
 5yr5Ns10qQ6CL0KhWnQuUz+wR5qjOiVNUuoF5wdU+2+Yhn6RRZb8nieJV1OYH9lR+o3l
 K61nXD/msY9/kOfjwwzbS8J6KHgEaQIP0De1CfBRIm9jb8m6Dk/tLYeBKEn7AgtCBAtw
 UYmRlmiXPRmYL7BnxZ5Rmgos0N16SBHAu3mp0Fg+tWv+M1HbROjwnatdMmcKyGZcjouG
 5pLp8qUR5qO54RiqTxu0HvIuRYMYrArLcZHzNczCu7csEnuhfhQ5DKfbUbGzK4hTQEhR
 YNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789385594; x=1789990394;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=46tUkjWcsGNE0/IRMnS9oYK/PTTMmBusYPYi2kH+L/w=;
 b=djcthQzWMyVETFRNYj7+bjebqQUAGHzIZU/uhRIfd8CmWBmwtCGTiWMg3xnhjqHVb4
 V1uB10GfPN06pbErgpg2l6uchnHlJFT89FdlhZa9tBTsg4DIFcqfGaWopEpN+sZ8BYJH
 i6NKd+HOET+h4/CxsgCG8LfLWZKyZ4HfNvvqT8eQ7lGV/v+FRhvwfxEovh+VSargMLh4
 oO231dZ2ZAdeKPY+Wd9qfoq6bVOJU6sd0AtZ6TYf9ugnDbukL09LcuAklcCiAC10TF/d
 6dDnitUViltUVgpkZ4sNqXOIjVWVtoVXv7qp5mGGukUu/RYhYhp323IagFb3WblXbS45
 d3mQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzYKOmlLXBnYfoy5gWXve+oDwMI+gxokC6NTuBqBG3YA+iHGBSthcAsZ7ahZI8s/hpVQeYR8q+xhg==@nongnu.org
X-Gm-Message-State: AFuF++nmR8S6AE2Yv5FULHDP9BYqhT7lWoWAXnlVyN9tof2bznz7633o
 Rlvm1nsDTHQfeA25eQlz5SsF52g/1RoKnSbRafIvy7V4caE6Unv37okx6hxXVWKOontkUPVK+yP
 Z4Bbgmk6JAr89oMfCKhfngvpIur9+/RD2hTd3YmCb7Q==
X-Gm-Gg: AYBFou30oVeZJvJ9FxZD23fUwzJLlX/kJ3vXNsulom1zrWjFR0UE117Bnp1brmTozYO
 mnTVBQkOgvqVD7J+OBMiufSilwQCNpdzVxuD16gNJ2PhEgEOrkKgcAsvnBXe30N0V1q3Xh5IIog
 9xWnIaGCsw5bSlGipNqWetv9U0xoaOiBpkCB/Iv7jcjMZ/3JfnIowvOWsRcbxVA3DbU+CN4cJjl
 WfTAf62JQjxXDLL/xXlDrkTfxfqV8t2eXz6ArdDRbarbZw20iB3fu2oDCt5IZ5/Alw8QIrdL5Q7
 cwFUaze1nTvGKj7SZqlbFrRgQGjP7jRY7+qtwOVdIP4uow9v5EdyUQQDSkeVCxC5Ugy63xJ22jA
 V0XcGsMsx0cP4WSvI1IPe32CuVtsxmcFcTChoF2Fx
X-Received: by 2002:a05:690e:118e:b0:66e:5f04:f755 with SMTP id
 956f58d0204a3-6714dfdb4b6mr367008d50.22.1789385593677; Mon, 14 Sep 2026
 04:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
 <20260906-nohmp-next-v1-5-2b21e63974f3@redhat.com>
In-Reply-To: <20260906-nohmp-next-v1-5-2b21e63974f3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 12:33:01 +0100
X-Gm-Features: AcwNN1VVWrzTvrwaBlGfxk22-gnj45fSpuFI50FqYw3ztakj9uVsuJjmq3AI4Xs
Message-ID: <CAFEAcA_vhcyjv02=XoLbtJSQzz79mOuBNgerPRnGxyRw6+cAeA@mail.gmail.com>
Subject: Re: [PATCH 5/9] tests/launchupdate-test: correctly release qs
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Gerd Hoffman <kraxel@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Jared Rossi <jrossi@linux.ibm.com>, Zhuoying Cai <zycai@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 6 Sept 2026 at 09:54, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> QOSState must be released with qtest_shutdown().
>
> Fixes: 0b70c6ce7b31 ("Add functional and unit tests for the vm-launch-upd=
ate device")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  tests/qtest/launchupdate-test.c | 14 +++++---------
>  tests/qtest/libqos/libqos.h     |  2 ++
>  2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/tests/qtest/launchupdate-test.c b/tests/qtest/launchupdate-t=
est.c
> index ed007cdce29f..12a09079ae91 100644
> --- a/tests/qtest/launchupdate-test.c
> +++ b/tests/qtest/launchupdate-test.c
> @@ -51,7 +51,7 @@ static void test_vm_launch_update_capability(void)
>  static void test_vm_launch_update_disable(void)
>  {
>      QFWCFG *fw_cfg;
> -    QOSState *qs;
> +    g_autoptr(QOSState) qs =3D NULL;
>      VMLaunchUpdate launch_update;
>      uint64_t control;
>      size_t filesize;
> @@ -95,13 +95,12 @@ static void test_vm_launch_update_disable(void)
>      g_assert_cmpint(VM_LAUNCHUPDATE_CTL_DISABLE & control, =3D=3D, 1);
>
>      pc_fw_cfg_uninit(fw_cfg);
> -    qtest_shutdown(qs);
>  }
>

>  static void check_error(void)
>  {
>      QFWCFG *fw_cfg;
> -    QOSState *qs;
> +    g_autoptr(QOSState) qs =3D NULL;
>      VMLaunchUpdate launch_update;
>      uint16_t status;
>      size_t filesize;
> @@ -149,6 +148,7 @@ static void check_error(void)
>      status =3D le64_to_cpu(launch_update.status);
>      /* should fail with LOAD_FAIL since it was not IGVM format */
>      g_assert_cmpint(status, =3D=3D, VM_LAUNCHUPDATE_LOAD_FAIL);
> +

Stray extra blank line.

>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

