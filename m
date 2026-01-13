Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3452D2F338
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Jan 2026 15:31:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfgMC-0007uh-FG; Tue, 13 Jan 2026 10:30:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfgM6-0007sF-VO
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 10:30:51 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vfgM2-0007o6-Ck
 for qemu-arm@nongnu.org; Tue, 13 Jan 2026 10:30:49 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-6420c0cf4abso6896866d50.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jan 2026 07:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768318243; x=1768923043; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eW6PvoSICJHJNz4coqHX84UgMdzKOsoSZg7aH86/zjU=;
 b=Me4lfOE9mT31M69EyAye5BhqhhzTlguI8tRhffUuNSCVrQBAzQWjj9MyUesHSxtdId
 1SrbuwedSbExZKANp/PYyc9vn+vtIXa3krTjYGLkPY2OaC75KrkwblWnB3RTTzM7KfzE
 Yu2I/c/LnSutnkeCoo3SQWigD9fiL2R4txeMqs8/99sOP5+DDCSBEC5OnxgVYlwIPvjg
 Mie875CiFHH8v40oyFUkqtjLDbIA8uUVTTyQBwseJSDVIXzRC0OW+/8Rm1RQWrkyG5+r
 ReDdJpZyz/pOgCtVJH7rKAUyI9Jah47767NpiKHIQ5vczmQYeh/86stFli069nwjIeFB
 xrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318243; x=1768923043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eW6PvoSICJHJNz4coqHX84UgMdzKOsoSZg7aH86/zjU=;
 b=AB/PZwKnFGKT4jTVKnVWMkpp5JC82bILfz70aajPSbCm+1y9HW9FzYaOvxy0dMDGIf
 6MHbyoi+qo0BAJwOmPwK2Ek0YqJKS7CYWlTa6AidVt6UW3MoHdqfCXtZ2u/xhR7ga8mw
 WuISc/5YABkvC7kYmhzCGtP9WMTKiZPQUz+AgRhA/hnVD3JoEC8PdnEpZNxk8IKQWm0k
 XsNhugysIKuvDRgw38JtOlyKtIeSQg5w2Si5+B9kY09lUGAxuebNYByv5fDTei1MikNh
 1ga0JvX3sdrQGyV2rFyMreckmJXnOW12KFGvYiSAyj1NVAn3wplYgZ2ryjraQkHyVx1e
 Ddew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUHTYe5ARyFZjamCCBPCGXrpZ52S0Qnd3o5Zl+PgAR5qGp1hMnx/KxXFujqZGUaDpFENGMpYJWZA==@nongnu.org
X-Gm-Message-State: AOJu0YxzC1UdlhONQPXb5x/gGbYtdvXUrIW/D6kCEmBao2hdYeoZETuV
 OYAiwlCEufDI8JuY9svtWgIR606CczOV/8luzYuDMdH4NOf8jn+LcigfNLCxIYeXAQgYnsXFRBj
 2fmLcLyVczMKrit6/Oqti6HIuH7WAPlhzENfo4RMkiw==
X-Gm-Gg: AY/fxX4RjVzs/ZJx/Cj2+7GRe/De8xr4ycNbOI4IolJWV94VOvk8XL01OO5YX4E+XPc
 +QJquDNj6fWkZ+s7v3KJmrOJG+mM1N6YB//B8R7QdBxyt6xwxklpmSLrQjDqL5YQIC+R3gvMH9g
 yM6jTmmX73DpuLQMFvkQMzO2DmEtCMDD0JxPJWeIvK/5DK7r4hPXDSxbR6IDp4o9qYlhred8kTW
 f279XKm2Pmv3f5SzyWlghd6x9xJdbZTuJghnf16DcljmEyqKqwY5WGGgAnhAFeVkmyJnklP2ZsU
 rpe9WlL9p0GkYp+kL1w2wLWj3+7Lp0hU/A==
X-Google-Smtp-Source: AGHT+IG3dSkgNOoJ/BdcaaS2plBFMB9YKt90Oon9KshYmD8OLYGFbljxMkyW0O3TnZ5ptvcfFe6NmH659ZKSuNRnYAo=
X-Received: by 2002:a05:690e:138e:b0:646:7064:368 with SMTP id
 956f58d0204a3-64716c19af0mr18225539d50.53.1768318242784; Tue, 13 Jan 2026
 07:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20260108210453.2280733-1-pierrick.bouvier@linaro.org>
 <08c42104-d7c5-4df8-b25f-7138ddc94a94@redhat.com>
 <82940e3b-f9a7-4172-8ae7-680bc1a5785b@linaro.org>
In-Reply-To: <82940e3b-f9a7-4172-8ae7-680bc1a5785b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Jan 2026 15:30:30 +0000
X-Gm-Features: AZwV_QjDKnwoYKAyN9SdqyefnGdycyruckyE5ntR0WojJLVlHxhbMv0Do6VBdnI
Message-ID: <CAFEAcA8ZiViYfkvBJ6P5rqGmChTw3VyN5iaEqxhfNb59ba2RdA@mail.gmail.com>
Subject: Re: [PATCH v5] hw/arm/smmu: add memory regions as property for an
 SMMU instance
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 tangtao1634@phytium.com.cn, richard.henderson@linaro.org, 
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Mon, 12 Jan 2026 at 16:21, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 1/12/26 1:58 AM, Eric Auger wrote:
> >
> >
> > On 1/8/26 10:04 PM, Pierrick Bouvier wrote:
> >> This will be used to access non-secure and secure memory. Secure suppo=
rt
> >> and Granule Protection Check (for RME) for SMMU need to access secure
> >> memory.
> >>
> >> As well, it allows to remove usage of global address_space_memory,
> >> allowing different SMMU instances to have a specific view of memory.
> >>
> >> User creatable SMMU are handled as well for virt machine,
> >> by setting the memory properties when device is plugged in.
> >>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > Reviewed-by: Eric Auger <eric.auger@redhat.com>
> >
> > Thanks
> >
> > Eric
>
> Would you be ok to pull this patch, or would you prefer someone else to
> do it?

Since it's been reviewed, I'll take it into target-arm.next.

thanks
-- PMM

