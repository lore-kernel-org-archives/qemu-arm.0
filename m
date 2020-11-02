Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3830045lfa;
        Mon, 2 Nov 2020 03:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGZQB8zYiK9f1CEaC6TVTqVvXyr2gB052HunnYhp5yk02WzaqScGRWcYUrXYgKxNi5mxh+
X-Received: by 2002:a25:32d5:: with SMTP id y204mr19715070yby.411.1604315396364;
        Mon, 02 Nov 2020 03:09:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604315396; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLun4TIScwzBNybc+sIDKcUV6d9ucvMbiMbrdj3esoczktBZYqmIsJyNV6hnRGC8eE
         iNGVL38c5Vl2gaVjMdrOrUQW00DICjZUre/tszxapjro1MderITFW+dvfzRQdUE0hUk5
         Ot37oWVCkMeIUzBi1shHVC8Yn983seTpzbfvUMBL7hTyZVRmcHD+07H3aIQzwZVdYaPh
         87XFD+Q6rXA6hARq5vTjBYHeS1TqHlf87h4ekaJM0f39+P6BhWH1dMRoGnnMutsoZnVS
         YTt+UReXKwcNbs7y82Q9ED5jh/bTM5Aoa+SnkNdWEwhKDTtrAvkSyYnYasZOHPy0KPmw
         OMDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cFun4X8BiIKg4AxLOSC+4P9kL/vjFc/7S5etlTSF3ic=;
        b=YgnW3kNFVDbV4RaIZboptu8TMeyn2eoUi7P59XcT2FMVOS8m0ma8DfOIPH+QYbZxTB
         WqJbRqWpTVpg4ZEh0C2aLV2rPZQvyABBTdBQomlRkczvqUr9Kdq0cmbcVMRWBJiS1VC0
         q7OcRnRQtVoqm23DQkU8vJeGMwDPcdriP2074m/aftgPI9u2lFmKzNbLT0QyOmVcRwJS
         zRzK+KXAjgxzwh5IhrQjaA6fexPSO0BQeaHQkIkTyvSbXW/jUeTWQoCERFd7DpSpk3E+
         Ya1WClL+kR76esrqS4cnWaw7O5l9IWQQCX5eDy5WNWhOxhB/tTP3uIEBGNSvggCcnwGV
         3kjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPUlttRA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si13431076ybq.319.2020.11.02.03.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2020 03:09:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPUlttRA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZXil-0006nD-Ky
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 06:09:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZXfR-0002o3-Rh
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:06:29 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:33426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kZXfP-00019z-77
 for qemu-arm@nongnu.org; Mon, 02 Nov 2020 06:06:29 -0500
Received: by mail-ed1-x542.google.com with SMTP id v4so13971005edi.0
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2020 03:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cFun4X8BiIKg4AxLOSC+4P9kL/vjFc/7S5etlTSF3ic=;
 b=aPUlttRA3aGzLnRAwe9FK0Vtscoycj4iFTBwXQDyqDo9un+/2Six7wsrMk3q1gUd9q
 EcJNO/mwsNOzXZScl7RlVoizVHV3GpN3yLKrTp+RkuUMjUSg0/1uSbjkfFLKiURziwLb
 BREzi0hadhH7p4aWsGxkmgJdqaSvk9D6SXOyM8kXs2HpxdEvlkUH4HWkstn0YOoYrgBo
 QmgaLoPicnYTjzfQhYWaenT03cOPY4hzvQnWUIapR9j0IpTCbFVW2QrEy5cl17ZrpTG8
 Q25r163C1DDaAE6GofuckemoYpHwJiq/isl5+8IKT4yaDQN3dlN5/YzbUPUUIJchzy3l
 pXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cFun4X8BiIKg4AxLOSC+4P9kL/vjFc/7S5etlTSF3ic=;
 b=hb1q49k1wXQfYYBGokb9E84ezR1jd7G648iwGHaYZDBbldnOzJQWhDbHWhH0sQHm4Z
 tRu/ln1uBina4fZXssrP9Gj0Y0o09wivuHJRIfpiD1sQ/3Mrk2ejleCn8flDsysEpWQh
 cFgIQjylTzjMX6hhwT/ajxC8s56wLvWY0izsRj8AiGVd3zr/+VTwMI2KqPJ4pxsPgq1f
 QKg48aweHLf6cvRM0rXoBgokA3loZnCsnQ+k19aYUZNyNkRnXFVUmwGQcrqrUABamC5+
 OMKjxS0yKR6/DDanMjRtT9vk0lCLWqPWhZ8yEQq8G7ZwKeFQpd6slo4KxdDOsvQQJmEh
 5/4w==
X-Gm-Message-State: AOAM531dxgFxed1Tdgy4Q7fRSMXGsV81nzrPQjGATIXq4z2552lHCnS+
 HjZIYXbDQ6Vvr3rVzdRQxn0fDkIllo/VjqAjwx0pqw==
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr5778441edt.100.1604315183737; 
 Mon, 02 Nov 2020 03:06:23 -0800 (PST)
MIME-Version: 1.0
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-1-remi.denis.courmont@huawei.com>
In-Reply-To: <20201102105802.39332-1-remi.denis.courmont@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2020 11:06:12 +0000
Message-ID: <CAFEAcA9xhfhGToCXk9H+M5=HQKC91o-ED6eWTy32nvjwpFeJOg@mail.gmail.com>
Subject: Re: [PATCH 01/14] target/arm: add arm_is_el2_enabled() helper
To: remi.denis.courmont@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y9sR++JVhYka

On Mon, 2 Nov 2020 at 10:58, <remi.denis.courmont@huawei.com> wrote:
>
> From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>
> This checks if EL2 is enabled (meaning EL2 registers take effects) in
> the current security context.
>
> Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/cpu.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c18a916766..aaf3671806 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2040,6 +2040,15 @@ static inline bool arm_is_secure(CPUARMState *env)
>      return arm_is_secure_below_el3(env);
>  }
>
> +/* Return true if the current security state has AArch64 EL2 or AArch32 =
Hyp */
> +static inline bool arm_is_el2_enabled(CPUARMState *env)
> +{
> +    if (arm_feature(env, ARM_FEATURE_EL2)) {
> +        return !arm_is_secure_below_el3(env);
> +    }
> +    return false;

You could usefully add a comment mentioning the EL2Enabled()
pseudocode and that we'll need to adjust this if we implement
Secure EL2 in future.

thanks
-- PMM
