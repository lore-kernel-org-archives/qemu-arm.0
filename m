Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F1E606A31A
	for <qemu-arm@archiver.kernel.org>; Wed, 21 Oct 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AlKwyR84
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJXqM-00033X-AS; Wed, 21 Oct 2026 11:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJXpC-0002xe-Oh
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 11:01:58 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xJXpA-0005hK-9K
 for qemu-arm@nongnu.org; Wed, 21 Oct 2026 11:01:53 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso7039165e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Oct 2026 08:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792594910; x=1793199710; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=S21aZKPC9IvRuKoUaYmjeRfH5g0AHNVLWZbk7aNIbWQ=;
 b=AlKwyR84OQRsOAm6HFDfhOZqrEy9mqVAAnbRdHoUsASGVjaMpzZCeS0itOGsFvH/xp
 6JuaqU2BglCGPUi42yReBF+YiF1Zt6a1RlSEuK3fxC9nSmKT9/FupSYtK4pizpLexgJT
 MOES34squ+KkRbSotCOb9a3of8n812ufrIFfe2CgjKuOgnnEBMv/RxE9pKUW4xactkOz
 W+tXPJUcFVRlGWjPT9hupbXZDpcdyE3c5VhLlTCL8bc5MrqQFYMXQ9VCyQQYzBXnApam
 d/aD6J1YAAZX6uHkd2+17EHX8Xm0P118WOVVr1BoXFMDYCYXqICZ6dM83MCBJifiu/iE
 smtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792594910; x=1793199710;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=S21aZKPC9IvRuKoUaYmjeRfH5g0AHNVLWZbk7aNIbWQ=;
 b=Eww7ofiwbfECdgTjBedcqnZC3izYOUgQ30QPmfPXpdoxyITfTi0YxB2QMoL9GEVJeq
 OD/c85nci0chysW4/CIk32/V2ffI8rIN/JvqIiU1qzY+LT360/3Iu24mB5aWy+PEStKI
 7/9dg6rOrC1MmBCb9MNkDmdtRkW1QP6jihyaT6Gv4NNWnBqjmWqSxeJgFHT4djiIyquS
 HauNJByOTh5RdRekcjJnvDWohe5WxQ5sHtakClLNxKkEINZDD4aib4PRECUP8a9RKp18
 gmRw+E8yn53oiaNSrZ8ONd6bFyVHPgx9wclmTmWbj4PBCRiEG5xgcDq+aGynRClHTYlo
 1WNw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwXk8vPUDvpnpZtwXHKnEVtaCK1o8F3xbZ30J4CUBTUTP9jdPwinoR//vr04GTlDRpgKVeb42zhvw==@nongnu.org
X-Gm-Message-State: AFq9FYKMM/IRS69f9jveoBaQ1n6brRAWVHhR5cJ/q7cCwhT9OQDEMYeO
 kTHfQEnpdiqe6PRGvEOzmoTmcf5+3i8s4Xq/lHc7+pwqMCOTB/54FtaIYuEbklWAot0=
X-Gm-Gg: AYBFou17WWTueRCT2lNlxLP4zSUOC7ZLpQdJSA2UgNKwaZWAnAX5WAwVgehkAYYMDmX
 r525GYcN2PlOBnIXTE2aHKga9flXMhwNQgEttl01iGY7jRzk/5A93f3VdyDkVo+C0r48dbb/LYc
 70IJp5BN8cvNj4g+ihrG6C9SBh0KYroKevAfiaCki/ENOrg7/l6EIjdTJSUKJVQHU9eMbjIOWzw
 lDf2VP+e95VohdEAnFG5viA/duZ36QPjHfKw2lxIvc9V0DjOQa6DjHU2e159FqbFnzhNNaSrXAZ
 ImRdtQtc2VlxUj9oCI1MWNZGbimVYxaA6wPp0MTEKL0vPBGCb6+uHvSvpvzNOBu/LcbPL/3oK/Z
 O3z3iJi0DRi9dvGAVb7AlvncddRd0t6IjvH42+yNpnaNNgIOJIbVtOOd4G2d6QYToYf1Rsu7xfO
 +lytu/euUT0W1qPMBm02HUrJS6kS267U8fmNvQhHQod/lQWyLsmc5LiALCgkBSyLmyAONL8tOq4
 vP9C4VcZT/RpZnp/dLnqwhBsfTvgiEMkRb/uqVyNocnG04ccQA2c8E=
X-Received: by 2002:a05:600c:19ca:b0:4a1:7c56:d4e2 with SMTP id
 5b1f17b1804b1-4a1fdb0175emr47325905e9.16.1792594910050; 
 Wed, 21 Oct 2026 08:01:50 -0700 (PDT)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1f2ca3666sm173378425e9.1.2026.10.21.08.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 08:01:48 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 3836B5F7FA;
 Wed, 21 Oct 2026 16:01:48 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>,  Peter Maydell
 <peter.maydell@linaro.org>,  Jamin Lin <jamin_lin@aspeedtech.com>,  Kane
 Chen <kane_chen@aspeedtech.com>,  qemu-arm@nongnu.org,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: Re: qemu-system-arm dies on introspection of ast2700-a1 and ast2700-a2
In-Reply-To: <87qzhjmft8.fsf@pond.sub.org> (Markus Armbruster's message of
 "Wed, 21 Oct 2026 13:52:19 +0200")
References: <87qzhjmft8.fsf@pond.sub.org>
User-Agent: mu4e 1.14.4; emacs 30.1
Date: Wed, 21 Oct 2026 16:01:48 +0100
Message-ID: <87se1zyu5f.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Markus Armbruster <armbru@redhat.com> writes:

> Watch this:
>
>     $ qemu-system-arm -S -nodefaults -display none -M none -qmp stdio
>     {"QMP": {"version": {"qemu": {"micro": 50, "minor": 1, "major": 11}, =
"package": "v11.1.0-2545-g2d150b99ce"}, "capabilities": ["oob"]}}
>     {"execute": "qmp_capabilities", "arguments": {"enable": ["oob"]}}
>     {"return": {}}
>     {"execute": "qom-list-properties", "arguments": {"typename": "ast2700=
-a1"}}
>     qemu-system-arm: unknown type 'cortex-a35-arm-cpu'
>     [Exit 1 ]
>
> Same for ast2700-a2.
>
> I found the folllowing in their .instance_init() method
> aspeed_soc_ast2700_init():
>
>     for (i =3D 0; i < sc->num_cpus; i++) {
>         if (qtest_enabled() && !target_aarch64()) {
>             /*
>              * Introspection qtest just want to create this object
>              * without realizing it. ARM_CPU_TYPE_NAME("cortex-a35")
>              * is not available on 32-bit binary: skip it since we
>              * won't even realize it.
>              */
>             continue;
>         }
>         object_initialize_child(obj, "cpu[*]", &a->cpu[i],
>                                 aspeed_soc_cpu_type(sc->valid_cpu_types));
>     }
>
> This seems to paper over the bug so make the tests pass.  That's wrong.
>
> .instance_init() must not fail and must not exit(), regardless of
> context.
>
> object_initialize_child() exit()s when the type doesn't exist, because
> &error_fatal gets passed to in type_get_or_load_by_name() in
> object_initialize_child().
>
> The narrow fix is to make type "cortex-a35-arm-cpu" exist, or to make
> the two bad types "ast2700-a1" and "ast2700-a2" not exist.

Is the problem here that DEFINE_TYPES(aspeed_soc_ast27x0_types) doesn't
allow for conditional realisation of the SoCs? Oh but it does:

        .is_available   =3D target_aarch64,


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

