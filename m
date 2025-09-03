Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDC4CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 08:16:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utifD-0005DO-PZ; Wed, 03 Sep 2025 04:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1utifB-000508-Un
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 04:16:18 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1utif9-00023b-TR
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 04:16:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afebb6d4093so1050561266b.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 01:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756887373; x=1757492173; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvnGN5I+4Xd8ST1Iu+S1aQnbXtg0tn0QCV9HrVJQ4tE=;
 b=q+UtQnkEFe79375Dan6G+F2sQH+2e9XBKCZDS8YncEtgmmQKhJxF9b6iLHjY519vb9
 KZlzyGKxcgZTcB+HJ+lEEGqnmpcY7ijXfjXqJnawQLUguP1BGGqgYgKVfNoDPQSMPywj
 oLBTASa7rWKK020QtoZfeOLWTKz57xLW5nPkqkUfEac/uizN8KInLy1ifsZoUEPY8K+S
 SJ+S6r8wpF/yKLbpEaVXyK5oO4PlNf+jMaebeeCFFlIvhvgrELNlwNZnNd1n8YWm/Irs
 +i1QtEM5oGo1iMlIej7lnKXPMib8SowCpG9/vGTYQE/ZYbkv6SeZYOCD6lTC2Tb8Erb2
 f7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756887373; x=1757492173;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SvnGN5I+4Xd8ST1Iu+S1aQnbXtg0tn0QCV9HrVJQ4tE=;
 b=DG7+ixKcmZ+0zc0A9/c3eHpN/jh3VO6yRfeoBH2VXu7qM/0uaFp3n/pUoe1tLJNLRE
 nBbKk399v52BYe2dDFCz9Zs5mB0rSNSYjrTDjGvcLHtZkbhG7yvZ2uC5y1cX+QKexdp5
 gMH0BD9E5jYt85XNnkal71oiQL47Xw8fYHDPTmbogGKaX9pH4tg8oxm4WyVC0Kuga2e0
 c9vou0bljrga+vEFwEkxv9VOdDWQbEI02qp6YoTIGzLIxis/wsvhVMfpRi5qlZlfilKr
 Ku1SJkb1e0TLLrj8WsJ3O/FFf8iQ/vVaAHRgsFiI8n0Om4RgLdsUQYA6Ru0N3/mlYWdg
 EOdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqNpWVJxBHFd9m4k1kUg8h3HDgTit90Gu67/Qq7rWk90dvTS71Fv8dLqu2RN6wKY25/mQVvGoVEA==@nongnu.org
X-Gm-Message-State: AOJu0Yz6tHN4xuq5cVfz9bTjVddtCqJ8UnkCmVIrfbsSX0xdF3/PtkQn
 Ai4LcWZp9KuX+/Y3Y0bO1SsDGg8+rn3f8ApedK0nyb5WxVPS5VV4PLN201TSebFVHkQ=
X-Gm-Gg: ASbGncte72fLq9e4Ypa5E7qRl0JCTO0ayI7i3Y5mw9a4wwaamabOXPidVMNnaAsLjkH
 FplnweD807kJ7yxDpnn8pljgEwpjuvukhh1K0HEcGkc0FY9fbvD5vaIqZ4XCwdLVxPbl+k09+d6
 NCzO1FILCprulw2xBwujkKz0G7G944xjPN8rivYWUKWccLuWEj8h0TeucJVZBzrmYczQmKHJvd6
 ykr7i6UP/r90LnWACaJzm2k2gp4blZ3uegGCFPX3rj3MV4uxHorwCTRX6uSk46NK8EtO0dwpeAi
 c6/L38HhiXaCmMlgj0cIPfKZ7Sq6aYlPueMmUccXBFBSlAxlyxjoDa6yjszYYidVtwl3Mpr/KXO
 pEl24cQKdGkfdij5E1emBOo0t7AU8VzImCw==
X-Google-Smtp-Source: AGHT+IF6RWyF/9Ju1XoQ1Fqy61B1V1/yNaHxs+rEvjRb+GFeO7h4ChICfBiAr2YVKwMWb/F5AxlG4A==
X-Received: by 2002:a17:907:9444:b0:b04:53cc:4400 with SMTP id
 a640c23a62f3a-b0453cc4661mr558065666b.27.1756887369416; 
 Wed, 03 Sep 2025 01:16:09 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff079861a1sm1202805766b.22.2025.09.03.01.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 01:16:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CE6D25F815;
 Wed, 03 Sep 2025 09:16:07 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH 2/4] hw/arm: use g_autofree for fdt in arm_load_dtb
In-Reply-To: <CAFEAcA8WNFs5HGScaB1bs-u8bHT1MbS8BvWXefx-eSd7dCsz=Q@mail.gmail.com>
 (Peter Maydell's message of "Tue, 2 Sep 2025 10:36:00 +0100")
References: <20250901125304.1047624-1-alex.bennee@linaro.org>
 <20250901125304.1047624-3-alex.bennee@linaro.org>
 <CAFEAcA8WNFs5HGScaB1bs-u8bHT1MbS8BvWXefx-eSd7dCsz=Q@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Wed, 03 Sep 2025 09:16:07 +0100
Message-ID: <877bygymrc.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 1 Sept 2025 at 13:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> With the fdt being protected by g_autofree we can skip the goto fail
>> and bail out straight away. The only thing we must take care of is
>> stealing the pointer in the one case when we do need it to survive.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  hw/arm/boot.c | 29 ++++++++++++-----------------
>>  1 file changed, 12 insertions(+), 17 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 56fd13b9f7c..749f2d08341 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -519,7 +519,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_=
info *binfo,
>>                   hwaddr addr_limit, AddressSpace *as, MachineState *ms,
>>                   ARMCPU *cpu)
>>  {
>> -    void *fdt =3D NULL;
>> +    g_autofree void *fdt =3D NULL;
>>      int size, rc, n =3D 0;
>>      uint32_t acells, scells;
>>      unsigned int i;
>
>
>> @@ -673,14 +672,10 @@ int arm_load_dtb(hwaddr addr, const struct arm_boo=
t_info *binfo,
>>
>>      if (fdt !=3D ms->fdt) {
>>          g_free(ms->fdt);
>> -        ms->fdt =3D fdt;
>> +        ms->fdt =3D g_steal_pointer(&fdt);
>>      }
>>
>>      return size;
>> -> -fail:
>> -    g_free(fdt);
>> -    return -1;
>>  }
>
> Previously, if we get to the end of the function and fdt =3D=3D ms->fdt
> then we continue to use that DTB, and we don't free it.
> After this change, if fdt =3D=3D ms->fdt then we will skip the
> g_steal_pointer() and the g_autofree will free the memory,
> but leave ms->fdt still pointing to it.
>
> Since arm_load_dtb() is only called once it's a bit unclear
> to me whether this can happen -- I think you would need to have
> a board-specific arm_boot_info::get_dtb function which returned
> the MachineState::fdt pointer. But as this is supposed to
> just be a refactoring patch and the previous code clearly was
> written to account for the possibility of fdt =3D=3D ms->fdt,
> I think we should continue to handle that case.

Hmm I was thinking we could assert if ms->fdt is set because we clearly
shouldn't be loading one. For arm the only thing that sets ms->fdt is
create_fdt which also implies:

  vms->bootinfo.skip_dtb_autoload =3D true;

so on start-up we should either create or load - not both.

but then I am confused about why we do another arm_load_dtb in the
machine_done notifier.

Either way I can't see how fdt =3D g_malloc0(dt_size) could ever match
what might already be in ms->fdt.


>
> thanks
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

