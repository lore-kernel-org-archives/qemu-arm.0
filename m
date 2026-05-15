Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F3FCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtN0-0007IR-3I; Fri, 15 May 2026 10:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtMy-00077i-N2
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:18:28 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtMw-0006Pz-4U
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:18:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-45562c41ec7so4772718f8f.1
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854704; cv=none;
 d=google.com; s=arc-20240605;
 b=OkXUembxuOYXTHZ/LrBc9Y+4BDjHIEO5GnERFlHxbMnIept85hKA2s3UuUh83WueO8
 Oc5q8JJhLfes0XWZy7GXOJzdLaWpzTWpuTcyzVlUQR+BQl3NWk1RZQZnLFpJqOmqwcGS
 xqIOkGGx1iHn4CQ1X836pqFK8WdxFqyCssGpnmPpIfzO5K5U0rpBpAw7vIXqyYEFF56t
 NZbVMV3Vlb5ZpykzVJDCqi9qOb85n3MxlWWLWvhGMu1iERNj9+DMJy6TM72AFw9aayOb
 2HwQWfaRqUBCmDS3n4xjw+nWl6+AS5P5ewrt9drcKgOXeHrvFVdvEgSL43S9J9d0N7al
 z2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=EvQU+QSER8GC8iOu9SVuyi0uv46LoKdT8nCm6IzRewU=;
 fh=MPuQ/++gr8Thyt5skz4EQhjqP6dChRoLA6a0ehzDCgE=;
 b=PPPz1Hx6AhvYdnFrY4uMXoEhPOTD9iVgGS3LJsKaCVZBu225bUshtyNaNEyMn6FCuy
 C72bbYpUtNfpwS1MrfcTDToHSJq8BRaGE/9xqsI1FPL9cN5TMSfdSV2K9WxEz24T4ALf
 CogEqrMtE7dBF/jNSVUvXJ9E0QkBvdWBdbC7zb1dp9+MSUekqpv7q55ssmqwXhccqxLB
 rEN03S4UvxWMM0ZNEVFOkARcLa5iInCg87GNMIw9Yi9sJLpl25rp2Q3kCvRQ64VTMvd1
 JpNI6wwKFCfxfiGy/KvIEJQE/wwc8TSEVSfXr+qysSEsppFLTAkYHypiOSu7ABpjyqsf
 kF3Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854704; x=1779459504; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvQU+QSER8GC8iOu9SVuyi0uv46LoKdT8nCm6IzRewU=;
 b=yxcQB6J6WZFcNVctWSU93vcxXNh8826ec0+t6aRhWj4/bzcBrTelWm+9EaFJPVzg/Y
 AVmIAwit3je3oVoSkFtxNmYqMkcy6YueN2OgV9XYbsBg5OQTousXewpi805bFBlNaUld
 +UPHYWi6nCAm3unTQ+rCuRv2KcuGvoULiHp4YiMZjwKGygwefps0KrT5zC6aWf3wioFC
 PIIYRreRQ46I081qH9a7FCMn/qaWact4nI1BgiBwD+gcRc/++/Odv+qNM89CnpJxqSzD
 BdtgXC9wF4pbOVmqd/gjX+dPUP1TlR83o4Zz6Cb97r8RmllybkhEvpoPxGFKJIZzUgeD
 i4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854704; x=1779459504;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EvQU+QSER8GC8iOu9SVuyi0uv46LoKdT8nCm6IzRewU=;
 b=SmgxtnHQr+hfWl6d/AbZ7PsBHvywB4hvb3A5OQs0H/9Od2zIHjzd+5bu0kSWdWukD2
 bYdHTwub3NAMrn3kGH/h7ttoR3BIeQq9QpeBpiSG0lTXS87d73RyfLn2yCEN3RqlL5Bw
 gVCsY4vulCmFnQlInoBjJRHD6nw+aGIJhXj6/Id8Wz0c2JKyUqi/vUagclldFl39Gdur
 MMKFSWj2mLVYOmVbkeJvIAAWNDDxebpeH8Q6jQ31BxpfucvNbEzerzzqeT0x2fv2EXZV
 ccH516d4+EpMRDmx4+4xjFeWwK7RpSHTxiN8hOGL0nbp9MazCLGMgFPW4HdsjUsw5CMp
 aYBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HOB6KtFroOP6UdbZYFatKD3zAq0oxVi75FePE8AFP8NywmRttFFCKsiC4YH37tMOflkXVSTsFqg==@nongnu.org
X-Gm-Message-State: AOJu0YzZEuUSGTbnVagX/jGm4aEeusHHel7KrdcCteiUK8B6vxsAhVlO
 ywxuunfTUV1zxD9EOz59h/8WlH/vxescJ388Dk55gncRPqF0dfvl5RMNzuLswtFrRsn1A5fiUsO
 QrLD6Ctnc3AZqw3sdw3kv+rI/3bqYiFz6CxutK7PX4A==
X-Gm-Gg: Acq92OH6EhJKu5WcnmUnJmhf1pEA74QsNXZ8+37R8dzXDZnEew4mVVri8viMfQwOBDB
 1oDkDXWeaRcMmsNISsK9k8+e90zRleW/Xe1y88u9dJ9mYToI1WgFbnb0Fcqxz01KKjLe4JAPw6n
 9j2YpdkD51hDfVdqb20ZzJp9s0XodZTsHYADLPaEbTuAa2NTD+4qJp2mTDXczLpcobzmy+em5Vi
 3b0uFfTJEOCqDntRIzhWbrgM+MA6r9iCir27RfloP6HtW+6JoGOHMiXR/uigvpcFCuNYaASz92j
 exrwHd36se+GFYb59zsOj1hmTihAFkG93jo5A/0nD1ZEy5mgbQ==
X-Received: by 2002:a05:6000:2503:b0:452:65d:e108 with SMTP id
 ffacd0b85a97d-45e5c5a5e99mr5733070f8f.3.1778854703809; Fri, 15 May 2026
 07:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-9-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-9-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:17:57 +0300
X-Gm-Features: AVHnY4J_7fOx1zYgOcibyWf5n8XYaq_f6lbZ3u-c40fIQVdUSFWLmuvuYaO_TZU
Message-ID: <CAAjaMXbZm-4WHehg5EfUKJhiLN6-01DJcSUd3=QxdTf3p+6S7w@mail.gmail.com>
Subject: Re: [PATCH v6 08/20] target/arm: Build gdbstub64.o as common object
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x434.google.com
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

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> While gdbstub64.o is already built once, build it as
> common object, reducing target-specific set in arm_ss[].
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/meson.build | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index e56fc943bdf..5376be2e3bc 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -11,7 +11,6 @@ arm_user_ss.add(files('gdbstub.c'))
>
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
>    'cpu64.c',
> -  'gdbstub64.c'
>  ))
>
>  arm_common_ss.add(files(
> @@ -24,6 +23,9 @@ arm_common_user_system_ss.add(files(
>    'helper.c',
>    'vfp_fpscr.c',
>  ))
> +arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
> +  'gdbstub64.c'
> +))
>
>  arm_common_system_ss.add(files(
>    'arm-qmp-cmds.c',
> --
> 2.53.0
>

