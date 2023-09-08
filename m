Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp383064ejb;
        Fri, 8 Sep 2023 05:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/a450BKejLwzsPcszciFP87u4rjnd71PdwCzl1O5nHMS3KyXAiSJITA5z5bloKTDaKfch
X-Received: by 2002:a05:622a:389:b0:412:2571:a5a0 with SMTP id j9-20020a05622a038900b004122571a5a0mr2494785qtx.7.1694176008808;
        Fri, 08 Sep 2023 05:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694176008; cv=none;
        d=google.com; s=arc-20160816;
        b=ShB/n7P4pnZvUq+n38lZnQrnZ+7/4l0J29M//Ik+RN6gsrgTHtuoZF7bJQtubpnFHj
         Bgi5pfQnA6j5s4f1zCIgaZN8BS20m8nt9/b5LdhDxPIsDzJ4+R2XZhrnZO7pOUf50Fui
         J8z67p+AvYCPstNGtqN5Gngn0y7pItPf9/sNGveY69ONU+bMMIFEbo7qBKLuNJLl80mp
         VGvP9BuHvqQC2v/9LqIUIOpQjqPwl7oRTNPl1GYFMcTK6VnfnATCxylShcj001Yr+pzu
         sQGQWQWg5EqoSSMwpxUJuVTghUeJDVu8yiBBr74rkcyDFNROOgoj4qmZczI1UP/gsGor
         +bzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qt7D41T+GidVoWAvkM46nCy/YKce8RGy4siKWz5OqK4=;
        fh=vNx51ehlBBoiYC5MePwnJFsv3cOwyetW8fuWwDC6XrU=;
        b=Z3VTdpQNv8N/sfKqBa98OUWTENV8fEGeBsxjMmOWsRek0c9+K1Ur0BNe97xUp3+K4T
         1E6q55ArKgGYDCGF0JC+1UVoyAn+NKF/dt8MGVyKlWlwrFD6bpnpTtzBovt1NtsZLGkT
         LeMtXvRk820OCrlQqZf/C5CPwttoyS0mCXfYbX7x6sTn2bLJZnaAw38asE3S6+mOnzfs
         ziK9YYeL+223/KDwlJ8ilNEPEVi7DzLF5q8kK0DkGpXWZRQDpwlTgxLYIEKCX7eyqs+j
         t7rnQlJ3/3tExi2s74wiyCsEpl9P1hyNyQWPO6x/bhmfQ5/WcPhbRvptuDgSYizTJJYf
         62xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuY7Lu1T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5-20020a05622a104500b0041231bf00f5si1146276qte.503.2023.09.08.05.26.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 05:26:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GuY7Lu1T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeaZR-0004cJ-IP; Fri, 08 Sep 2023 08:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaZH-0004Le-UW
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:26:37 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qeaZF-0007sh-GP
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 08:26:35 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so2643111a12.1
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694175991; x=1694780791; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qt7D41T+GidVoWAvkM46nCy/YKce8RGy4siKWz5OqK4=;
 b=GuY7Lu1T6PM6e88iGi4P/eJVi4LT+BzLOXGbccTkChkHuUSjMK58CRDy1mxJpTcho6
 pEwqJhLrNGIrx1i/quJufInwGCsuGf9lZol4vJ96xUNpC4HKIfd6mEfVj9F8T7HNQ4CM
 QZd6oYgtoC1vuutaFf36MhZnLTB3nBnUGOFEdgMuI2abQx7pB+vuGkwVdq2Q5ypHYDGW
 hLF60XXp+z79w6uwm5bhuYwoNllGjaepY4WrmlPbkW+YCkeaNtAy7jhjboM1fSuzXRy7
 bCT7Ok9RFj6tGamqLyAKv/6AFmQAPW2W+7Y3hrJsYX/o6j5HBGVEozQinGzgD8NUlBE7
 H7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694175991; x=1694780791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qt7D41T+GidVoWAvkM46nCy/YKce8RGy4siKWz5OqK4=;
 b=jl9tr5CDdAASEXHhRTY+G2xjFXXlzBXJebbDtlJfLa8psobdm6Jwf94lpqJIbKpSsm
 thAPNovq9CalWLuSKUKEg2uXSbM4Ns20OIo6Rv5hQzICH4thaTXIgpwT6lOhQCaVqKDY
 yvHw5Qvtf+vxYhicmvYXQlQLB1ukhMPIs8fTKg1nCz4IJkCUkG+RVDsNlgndzemTpwuC
 EiBzNCxWqPtTaAn68eRT9aM/0Abm83b9+XmUXk8sh5ZTpN+WD3fVDDf2/+QJYqK7ha2N
 rsZnfSny7Y/0NzgRGI6yA3jnPgS2R/PogK8McY9yftfmcvs2WMkPiRmvoyzo3bw4oVSC
 wGyQ==
X-Gm-Message-State: AOJu0YxhhBdxBSxnEoodv+v8YI+M9BIMDEDOSLISl1JMogrXDgOlgRNT
 xRsCSkdyLN74GMPtpnLjF2RvYgpkbvaqdDXd68vezA==
X-Received: by 2002:a05:6402:759:b0:52e:24fd:50f4 with SMTP id
 p25-20020a056402075900b0052e24fd50f4mr1645115edy.18.1694175991071; Fri, 08
 Sep 2023 05:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-4-philmd@linaro.org>
In-Reply-To: <20230904161235.84651-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 13:26:19 +0100
Message-ID: <CAFEAcA_=g-kb29_8x41qLf7T=YueCuLLuKT=jgOJm1jfQpuRXw@mail.gmail.com>
Subject: Re: [PATCH v2 03/22] target/arm/hvf: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, 
 qemu-arm@nongnu.org, Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 35UB4lQrhrTo

On Mon, 4 Sept 2023 at 17:12, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Per Peter Maydell analysis [*]:
>
>   The hvf_vcpu_exec() function is not documented, but in practice
>   its caller expects it to return either EXCP_DEBUG (for "this was
>   a guest debug exception you need to deal with") or something else
>   (presumably the intention being 0 for OK).
>
>   The hvf_sysreg_read() and hvf_sysreg_write() functions are also not
>   documented, but they return 0 on success, or 1 for a completely
>   unrecognized sysreg where we've raised the UNDEF exception (but
>   not if we raised an UNDEF exception for an unrecognized GIC sysreg --
>   I think this is a bug). We use this return value to decide whether
>   we need to advance the PC past the insn or not. It's not the same
>   as the return value we want to return from hvf_vcpu_exec().
>
>   Retain the variable as locally scoped but give it a name that
>   doesn't clash with the other function-scoped variable.
>
> This fixes:
>
>   target/arm/hvf/hvf.c:1936:13: error: declaration shadows a local variab=
le [-Werror,-Wshadow]
>         int ret =3D 0;
>             ^
>   target/arm/hvf/hvf.c:1807:9: note: previous declaration is here
>     int ret;
>         ^
> [*] https://lore.kernel.org/qemu-devel/CAFEAcA_e+fU6JKtS+W63wr9cCJ6btu_hT=
_ydZWOwC0kBkDYYYQ@mail.gmail.com/
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
