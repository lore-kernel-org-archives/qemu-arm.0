Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C4AC61DD6
	for <qemu-arm@archiver.kernel.org>; Wed,  2 Sep 2026 10:13:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1hyV-0004u4-Eh; Wed, 02 Sep 2026 06:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1hyU-0004tW-47
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 06:13:46 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1x1hyR-0004WR-Fn
 for qemu-arm@nongnu.org; Wed, 02 Sep 2026 06:13:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-495437bb891so6955955e9.1
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2026 03:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788344021; x=1788948821; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YVTyk7o36cWXqKvE2J26PLdadcd3CNxEAtXF83c7IH4=;
 b=TaKtl0gErlI2G8XzQXmu0voKTSBF+DuaeZY4frbA2E3GB/tPCCGVwwI0U2AGPxzUcw
 5Vqe4ykhlLGjQvaP7wq1M72UAjMGbD5vNZIP7eEeAnWCrdoCg99bW/GLk0xygRtyC6f6
 sfKBRkMrZwj3Jd8CzMoOYck1Tkw/2eucep1KsTqgE0fU63EiWGmLqw/9ylodLgJThaa8
 MGQwAAOFmSgpAckPg+bMd2U4iBnsGpoFTjk5dLCBghn2fk1ff9GB6soQPELYbRC8ophE
 csfvuyBbEQQrLcZhRoqf3h8i7ycPwfAXh3syInVdNBADdKtg/dFIFltYLgiKw8hOxIDD
 uDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788344021; x=1788948821;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YVTyk7o36cWXqKvE2J26PLdadcd3CNxEAtXF83c7IH4=;
 b=tJSYB633g8ScNtzu/VpP6axrzkETkvsn9jBWTZfluRyRLZz9uCG/2BA4OfJiAfVw/u
 +vApgbTH9edDwiBUjJC2aJOFcCD74u8T3/XfmL+6t4fBE9rrfhnojL1OPN7th7lVHPAd
 jS/d0LsEkfqUTvQOTmy+TcOhZAcU7oigbI5XmfBmxf/IxYAvvZg0o1+4kD0RYyMmkMyW
 i4IiTeqRxttCE9WoClhWg1mzjWmWm5nhV5GVSENFanCa7qUTodIFbxgMcwZs2IdETWm3
 iQpPXcmlPWDdLXkDTh/ul8PTW77PwrlLcFr8QYPdVTeYK5cBZuE5aSXEnRAQ5rg+nX8j
 XLRg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDBm/7f7Uj+91fYXUCymvwxZZt9Vn6wwZdem3SzpFmA1ILkpBYAq1/11PdmjHAKyBfEl+HYc/HTA==@nongnu.org
X-Gm-Message-State: AFuF++mZRVuSoQDTOuGK8E6PQHetsq2dArnkDQRCrQsX4Wp1L/SXiHdg
 MX/oc6Ke8EuEPYlnQUeDZDxSGp9GysXMIV8auiYZG00dcASgp2okdhdoLMNEIpIHIbw=
X-Gm-Gg: AR+sD11rVXHWnkKtcsAYxYLpojbaQNNR+zvj7UM+MVMJH2gKpKrkJx0XOjYLb/lZDS3
 tKGic1MjJEhk7vrP48VSQPIYAz4L46tTnh+jw7nZyrhD95vGaAUo2bSrUP3o3Wi7ACZ5iTyd/pP
 XKuYXsRjhOuEPrEAgYPM0e1uKwddslpxhFlNAouBkz4uxFd/MKS72c9vfljdwyN65c201AHr+fp
 DLZ/XaHkaOMpS5vraxWuINuEio8oXo7Dj1jKVxWJTLMfbEutSclkk/tkfttXKRO02DNwuIHw3qg
 b6hMXPEgjMqqKLKqSkp9vyFOxzfplCyL4QA6pu8XPaBbRIv6p974qZAbZwdT1GgF2aUbvGRI0fi
 xxbUXlU5ZHP/3xwBbYMjLc3QbSq1ZuW/9kYSyrCRRzv6ZJpndTg3SIQ4bm2DM0OIHQMSKP9LMn1
 fsNa7rvgtVZnPsBRFp5veWPN+9ko1dfshZ+Whhkpij51Gxi2PDqTSsvBO4T3C5
X-Received: by 2002:a05:600c:8718:b0:49b:8f5e:51fb with SMTP id
 5b1f17b1804b1-49ce7c03f46mr31756095e9.3.1788344021350; 
 Wed, 02 Sep 2026 03:13:41 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cdce0b456sm158458845e9.2.2026.09.02.03.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 03:13:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 033145F85F;
 Wed, 02 Sep 2026 11:13:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: gilles grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Fabiano
 Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH RFC v2 06/30] hw/misc: add RP2040 SYSINFO and SYSCFG
In-Reply-To: <AC79D616-7FD9-46BA-9761-CC64E2E3E056@univ-lille.fr> (gilles
 grimaud's message of "Wed, 2 Sep 2026 01:29:43 +0200")
References: <20260829234308.33725-1-gilles.grimaud@univ-lille.fr>
 <20260829234308.33725-7-gilles.grimaud@univ-lille.fr>
 <87a4q0u7ys.fsf@draig.linaro.org>
 <AC79D616-7FD9-46BA-9761-CC64E2E3E056@univ-lille.fr>
User-Agent: mu4e 1.14.4-pre1; emacs 30.1
Date: Wed, 02 Sep 2026 11:13:38 +0100
Message-ID: <87h5k8rmel.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

gilles grimaud <gilles.grimaud@univ-lille.fr> writes:

> Hi Alex,
>
> Thanks for the review. I have looked at the impact of these comments, and
> for v3 I propose to:
>
> * split the current patch into two focused patches: one for SYSINFO and o=
ne
>   for SYSCFG;

Yes

> * remove the powered-off memory overlays. They were intended to make CPU
>   and DMA accesses fail after setting MEMPOWERDOWN, but this goes beyond =
the
>   documented register behavior;
> * retain the documented MEMPOWERDOWN register state, reset value, and wri=
te
>   mask, without claiming to model physical ROM or SRAM power gating;

So is this modelling individual cores power states? I'm still a bit
confused as to what in the model will be accessing them when the cores
are down.

> * route PROC0_NMI_MASK and PROC1_NMI_MASK independently to the correspond=
ing
>   core;
> * remove the MemoryRegionOps.with_attrs callbacks, since they are only
>   needed by the powered-off memory overlays;

My preference would be the other way. The with_attr callbacks allow for
richer memory modelling. Indeed if you really wanted to model powerdown
state you could keep the same accessor and return MEMTX_ACCESS in the
main implementation without needing an overlay.

> * remove the per-subsystem RP2040 Kconfig symbols and build the internal
>   devices under the single CONFIG_RP2040 symbol.
>
> I will add focused qtests to the separate SYSINFO and SYSCFG patches.
>
> Does this sound in the right direction?
>
> Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

