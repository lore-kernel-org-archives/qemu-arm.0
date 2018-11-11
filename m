Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2516986wrw;
        Sun, 11 Nov 2018 15:47:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5dqcQIiAaZxnpr9dQd+auEFqyuNGwSQV2ilxTlZdAdzpvMFkJNQaWUxXwn3+aHtWBGAAzNN
X-Received: by 2002:aed:2185:: with SMTP id l5mr17391694qtc.276.1541980026451;
        Sun, 11 Nov 2018 15:47:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541980026; cv=none;
        d=google.com; s=arc-20160816;
        b=05/4yIvq8gLitJvr+WuD9eFSjKSNk6wFlK4MbMv+miGd68of0BcHb6XpfsedIQZbOO
         qz5EXpU3XgphE1VpE0GEoW5jCocYuT647JjH63Gbn/gHqmfYrYJRlooNieqP2xH0FS+Q
         2sBMCjssZf0igGmJC+W8XvFNDESYZtzCOockk+2yBnhqqBLD2eGi2VTeT+swJK2jsYbb
         G2c6PNEF06e0bx5A9bbk7QRBR+oE5chsBB7RTvcpB3koVGnhKuFh8RuyX+bOfBojQuW3
         x5jQLBGKXbit7idveVyed/8m+gzabJshCXbLnRTJLCupJOZpM+T2/+KlgG5OUGyzWJTJ
         hI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=Zo89gc9XfOr4sSmgxGg53VVeQBsjJB6dS8rg5LeBICY=;
        b=q6FBaAvu3z++brk5NARJA6mGN5bfn3wnpX9AmQPPMMLn6Lp6Gxr38NfHtKzdGaQ1R5
         UwxOETo7sLO1pyMVW9x2kABBPBFZ3Hxu3KVFiDfuei/+PJQpIoUw696ro6Aei27lwAKK
         jJGMpBP63UqkIgXdIeKFLdyAIsJV7ontQUOk25De8sEpiI3YaXMYNk/xfpmAghApe3PJ
         G+tFA0t9byc6c2LlbDiVokX5ipUkQ9lyDTwJVpVOoV1Y8RcbB6nm84vR8khhG6GjhQT9
         0q7Fdqy8Th+SjnthI4UMkK+ThjaLmcxtgAtkgJsB1XkqoqoC/Bi+RG32VvrBnw66Fdv9
         kGxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o6si921166qtp.370.2018.11.11.15.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 15:47:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gLzRZ-0006Ft-Gc
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 18:47:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzRH-0006CE-9r
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 18:46:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzRG-0006FM-5D
	for qemu-arm@nongnu.org; Sun, 11 Nov 2018 18:46:47 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:40518)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gLzR8-0006Dp-4d; Sun, 11 Nov 2018 18:46:38 -0500
Received: by mail-yw1-f67.google.com with SMTP id l66-v6so3729104ywl.7;
	Sun, 11 Nov 2018 15:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Zo89gc9XfOr4sSmgxGg53VVeQBsjJB6dS8rg5LeBICY=;
	b=b9zzki9456Tm/v3yDCOVKz571/KkCzCB7KJ3ju04mGR83Qak8B21e9kWYItmZrCNL5
	wJjmb6Mr1Z6uPvC0ljFAmPaAApRmWGKPwvGN0Ts/0RdmSAU5sLz1uvuUbkYgt+W1GvqQ
	D5dBMo9QR6MMvPY+WvXMyHF1+ft08CcFOESOYFYxFIDu1Dhtx8jSE/a3tHPhiRJctktS
	noZ8bdXkKUaHo1MMId06vvTE4kmNQRykKD5phW0UkD01mPjrsVK1exD8wCjsyViWMRR9
	x9q8yKwyYXCEfKXvvo/UJpb7966pGw+BLQ5PFeD3Z15r8S4qTqcv35MQNmYYyTbkfyuP
	fvqA==
X-Gm-Message-State: AGRZ1gIjtMED1n9TcVthRnA2p4dgWWE4D41odYrC2FkJSNK/9ySm97XU
	kTvm3dEkoQcuDXfyzoLRGcnO8xnLT85CndkRWzM=
X-Received: by 2002:a81:f8f:: with SMTP id
	137-v6mr16373965ywp.184.1541979996107; 
	Sun, 11 Nov 2018 15:46:36 -0800 (PST)
MIME-Version: 1.0
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-6-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-6-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 12 Nov 2018 00:46:24 +0100
Message-ID: <CAAdtpL7Ppk1CNVFzXrjgoaQ13wXuK=7pQ_DDUrEVm8wsxmsDnQ@mail.gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 05/14] qdev: move
 qdev_prop_register_global_list() to tests
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, Amit Shah <amit@kernel.org>,
	"qemu-ppc@nongnu.org list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k24LFcKc6vSX

On Wed, Nov 7, 2018 at 1:40 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> The function is only used by a test, move it there.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> ---
>  include/hw/qdev-properties.h   |  1 -
>  hw/core/qdev-properties.c      |  9 ---------
>  tests/test-qdev-global-props.c | 18 ++++++++++++++----
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> index a95f4a73eb..3ab9cd2eb6 100644
> --- a/include/hw/qdev-properties.h
> +++ b/include/hw/qdev-properties.h
> @@ -249,7 +249,6 @@ void qdev_prop_set_enum(DeviceState *dev, const char =
*name, int value);
>  void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
>
>  void qdev_prop_register_global(GlobalProperty *prop);
> -void qdev_prop_register_global_list(GlobalProperty *props);
>  int qdev_prop_check_globals(void);
>  void qdev_prop_set_globals(DeviceState *dev);
>  void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *=
dev,
> diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> index ab61d502fd..bd84c4ea4c 100644
> --- a/hw/core/qdev-properties.c
> +++ b/hw/core/qdev-properties.c
> @@ -1180,15 +1180,6 @@ void qdev_prop_register_global(GlobalProperty *pro=
p)
>      global_props =3D g_list_append(global_props, prop);
>  }
>
> -void qdev_prop_register_global_list(GlobalProperty *props)
> -{
> -    int i;
> -
> -    for (i =3D 0; props[i].driver !=3D NULL; i++) {
> -        qdev_prop_register_global(props+i);
> -    }
> -}
> -
>  int qdev_prop_check_globals(void)
>  {
>      GList *l;
> diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
> index ccdf6c57c1..b1eb505442 100644
> --- a/tests/test-qdev-global-props.c
> +++ b/tests/test-qdev-global-props.c
> @@ -89,6 +89,16 @@ static void test_static_prop(void)
>      g_test_trap_assert_stdout("");
>  }
>
> +static void register_global_properties(GlobalProperty *props)
> +{
> +    int i;
> +
> +    for (i =3D 0; props[i].driver !=3D NULL; i++) {
> +        qdev_prop_register_global(props + i);
> +    }
> +}
> +
> +
>  /* Test setting of static property using global properties */
>  static void test_static_globalprop_subprocess(void)
>  {
> @@ -98,7 +108,7 @@ static void test_static_globalprop_subprocess(void)
>          {}
>      };
>
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
>
>      mt =3D STATIC_TYPE(object_new(TYPE_STATIC_PROPS));
>      qdev_init_nofail(DEVICE(mt));
> @@ -216,7 +226,7 @@ static void test_dynamic_globalprop_subprocess(void)
>      };
>      int global_error;
>
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
>
>      mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
>      qdev_init_nofail(DEVICE(mt));
> @@ -261,7 +271,7 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
>      };
>      int global_error;
>
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
>
>      mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
>      qdev_init_nofail(DEVICE(mt));
> @@ -299,7 +309,7 @@ static void test_subclass_global_props(void)
>          {}
>      };
>
> -    qdev_prop_register_global_list(props);
> +    register_global_properties(props);
>
>      mt =3D STATIC_TYPE(object_new(TYPE_SUBCLASS));
>      qdev_init_nofail(DEVICE(mt));
> --
> 2.19.1.708.g4ede3d42df
>
>
