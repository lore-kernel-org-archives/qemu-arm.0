Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0954AC88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:31:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x631a-0007KR-Mi; Mon, 14 Sep 2026 05:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x631O-00076D-Ep
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:30:43 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x631I-0008SG-Fk
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:30:40 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab2029eso1541080d50.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789378235; cv=none;
 d=google.com; s=arc-20260327;
 b=c6e5gcGrFqztjDUKep1cXCw+HAjkr54VIB0uzVMo3ap1kc9GJr+Ydiz2LNr8ZMlSzj
 ODjXaoJ+GGi8bDu+Bs6yMmodP7oI/TF5UjgSiDNjfGfzBsMQN8YOzKI6STfHouyIMFoW
 ioDmQw21go3VtBv+fGwJTwEJJnB66f1OXAWlxrSBDEX5qDXEXEqUqLALrimWCFQqgMI3
 6gyuSwrv9U1xWyvqGkiY4049hbLRsayHr+ypHwJBwEHquLQkwp2LJwhiW4TmocEYvVwq
 Wg17cCs/dem4GYdXWvgSWhHxenit/p7iWq3LxveXnX/icbbAOr3bAFhwlD69Z/ehtqlk
 2vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ew9no8+Y7PRBFP2f9K+xoVfYPxAG+Y+oNU3+6I6EBOA=;
 fh=eyDy/xcLLXrJIChThQZ00R+sfQtrlxA28vM2FCFIUIc=;
 b=FV2sBMhLBJFsy9b7pyk4zBzBdT4qbrSSPtygXOr7GwMovj6+6S0qOQwDME3JEzMllp
 AJqbr/UeQeAZed+PZEwIkpsa1AcMFxlzH1iP5ZoOQbjvgGf+BxTsqbiuesilctp6nhzT
 rrctcR675QO5QeUcU4pCBQCHyfJ5JkvhhMCpJ9KKSE5zdG+hSrG9vYMarxrai9TboBy3
 cke9JByRVGEPMjI7Mgqu9YuoUC8b/SI3uWKSQIr43uswpTcHh3OnD9vBwBuBv6pmimoa
 p7+A5LMHNYMU0RdwDPlU/gXUO9SEZ5IQQrtcMVNfXMwHuEryVJJB7SCfqIWh4K8f2hud
 k/0g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789378235; x=1789983035; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ew9no8+Y7PRBFP2f9K+xoVfYPxAG+Y+oNU3+6I6EBOA=;
 b=WMeYV9KVAYy8hX9lrTnS2tGCoq8Gkzievynjz/PyvNaX9oGEW1MutIX+TQvi0uJQAT
 NJT/mOJcnNGUaK32F32EIz7v0uucWtybofJc1Ry9qywELZOW8Z5VoUUPD7Cat5ur0+WX
 Rlup2ZWwGemHK1ShrA6ey+5Uxt18f43Nvum8TwqzLlozUGIX7jbIqMv6TKTB+nph47LW
 w77gQHCETMitr7hffVlc5eF7LxHgEC5vADJb0hMMsMrpiSz/x+1ip8yRkLANminFCS9e
 j7swmhizGzP61H3ulG8d9L50KcyBmIBNJGQtskJxOuWAbkmFR3kYfW/u17wYHxWHsq+r
 BBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789378235; x=1789983035;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ew9no8+Y7PRBFP2f9K+xoVfYPxAG+Y+oNU3+6I6EBOA=;
 b=Z3T6HRIngg5ZsvYjIhQxVV+QY72YX0U2Mt3y/JB+WuBfVYN2Cm+eY9occ1Ku8DuQVA
 phMRCkwRjD04ziOyT8tgogDk9LCVg5458X4bIQ2rIj2+JhoJ6JkPQgFYtoDtHpyjtVoh
 WIzNxY4QLc3ToW6VNbR44Di01tpixOhkLkE65+ffZ9UYD806GscQqdCc2SuIiyYxMkKG
 iroT9L1/E2JwYS6fNs61Fa2c91t84dIAwdP+oVQF7bMhtFXAKt1FlOwwh7db7ZpHfcGA
 /zKuf8zgO5Qv5v+BcJQ2eZp0qHDiD/KRiaxiH9x2DaeewiulPCiv6zmK6T27yvn7YtR8
 HWfQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy2Zc3CQVbO+0doEHO5dUN8pPf0OgSNNRalmqv5l/SZE2iRXSzxRkDXRr1ukeHIihPwikAjRjo/QQ==@nongnu.org
X-Gm-Message-State: AFuF++nxoZfmOywMAKjPvhEMaSp6gqmtYtTyBtdRZhFjZm5S/X5Ajhkm
 l1orQNC9FpGP2aoESCqMLJWr6XPWwr/TPnVbru400Qj/q2H4ueekrKEMR3IdXmxzQ8unzFQkB5I
 isxZ/USefVfuWktU/0d4b39UqXvnN5OMxpTHCeThFrA==
X-Gm-Gg: AYBFou0gi97pN9q3bpe3fFzg2sL6bMjqdjdiN2dBnctO0izUbVKDYSquc5O9cd2brdG
 qR8vHbjQQ0AzUVvEe/e3L50wx5h1hRA8hHBaoRyhHHG6H3oBg1noZQYT6ZTPiX4Qfy2GLbXahcC
 Nb2fWJYT9iYwn3oA3jsu0pDKIXOEKN6r/hew+RaJdKEEXhg9o64x4FZgn+wZmVbCbAOxVhL64tn
 ytgak1tE2WRpwKg8ypHH32e/vU73e1LnV0en4Sv/YYsTPGPtyGWeQ3KSSRwi47MHYim+boDmNKz
 O/JUcIOCXS4Ibfz35Gw4xo1PZOzrBP4ZS2qQ4yZPAWn6/PZT2F6wcqaLwou0AMbHiOqd0R6UmKo
 i3Mt79quotsnoV2zIoLfb6La/XN6lp1UtfQJd4zU=
X-Received: by 2002:a05:690e:ec7:b0:66f:c1bc:880c with SMTP id
 956f58d0204a3-6714e1c88admr182974d50.101.1789378234982; Mon, 14 Sep 2026
 02:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260910175001.76278-1-thuth@redhat.com>
In-Reply-To: <20260910175001.76278-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 10:30:22 +0100
X-Gm-Features: AcwNN1VlWzPMcYhngrbB8b6xtasH5I6EofU4KQjbsMaO3dyz_T-W4ZytMkEFy0k
Message-ID: <CAFEAcA-dkLYr5GmqScLcuk+iErdKCMYrPJmEPXo7=+uV+Oe6GQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/bcm2835_powermgt: Free timer during finalize to
 avoid memory leak
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Thu, 10 Sept 2026 at 18:50, Thomas Huth <thuth@redhat.com> wrote:
>
> When running e.g. the device-introspect-test with valgrind, there are
> reports that the code in bcm2835_powermgt.c leaks memory like this:
>
>   48 bytes in 1 blocks are definitely lost in loss record 2,090 of 4,315
>      at 0x6B4B62B: calloc (vg_replace_malloc.c:1616)
>      by 0x7AFF6E1: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.8800.3)
>      by 0x42B1E48: timer_new_full (timer.h:520)
>      by 0x42B1E48: timer_new (timer.h:543)
>      by 0x42B1E48: timer_new_ns (timer.h:563)
>      by 0x42B1E48: bcm2835_powermgt_init (bcm2835_powermgt.c:151)
>      by 0x48632E3: object_init_with_type (object.c:426)
>      by 0x48632E3: object_initialize_with_type (object.c:508)
>      by 0x48636BE: object_new_with_type (object.c:706)
>      by 0x4962FF1: qmp_device_list_properties (qom-qmp-cmds.c:206)
>      by 0x44ACB90: qdev_device_help (qdev-monitor.c:315)
>      by 0x44AE14E: hmp_device_add (qdev-monitor.c:1018)
>
> Free the timer during finalize() to avoid this problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

