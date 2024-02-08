Received: by 2002:a17:906:c945:b0:a38:6d10:c5dd with SMTP id fw5csp140778ejb;
        Thu, 8 Feb 2024 06:30:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXz477YLY6kNOhis4BRT9ydLfMiBMQsSDvlZQj54hUnrOz2aLsOUTbuKgIIFzd+LDOW+1z/wD2z4dQkdM8FXLPCl5uzqWFh
X-Google-Smtp-Source: AGHT+IHVbMotS3/odBkrCAGFUv14264K+1DAaqeTEZeZHDhjA+1ErfWsgCqK3ahXAMwCXl+R839j
X-Received: by 2002:ac8:5c01:0:b0:42c:2990:c42 with SMTP id i1-20020ac85c01000000b0042c29900c42mr11132419qti.65.1707402600135;
        Thu, 08 Feb 2024 06:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707402600; cv=none;
        d=google.com; s=arc-20160816;
        b=UggxvnLriv99hm0CBc1d7rAeFE9zqSBJwsdMWagENhgmbWDrdh2VAe+qjLcaiwzMss
         qysCqDhCQ04z70WR5ubIn47GYlapco1H7FYJxo/RAimU8GcFBJizxLL+m9/fCkUmcEUn
         X3aeOjI6adSSMdwmzB6bnQxhO79cMEkKAgJTY40b/FLvNv2TZW3HpGwutMT3/jPQ+Ud7
         VFcEQ7NRNLGcXDreI0VlRC6dMiHATfYkHQVOI+SLGCB/EzQy9xXESxLHCTYscQQSTH9T
         bmn3yCsyxUsJ+JBhWsOqICuYYxooxBnCh+vsBs+cRbko67vkkE4s7EmY275sHDaHKH0m
         BreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=uswSyOm1D4WQ+dn1PI8wLnB3SL0ieGuRJZq33vNjcvQ=;
        fh=SeiJb+2EF9pX3Qt+eIyEkAkG0S7kdEooXoTPpuTd1pY=;
        b=HbmiTagT3iwueJNOZ5uzT3iQkLF8mQUl5GurGefbrsWfYkI8IUpZTmWnvwV3xDyYyi
         hG7ZBwAY1Mq0Gb7P6kGWR3ZjAoFD4VK9x6/+V2bZVV9tRJKtIc/oA0WsyZ7qEbE6479H
         N4tmjTo43ySrYWDp3I93zDlzPp+MlvGfBf6iklVrlXAE6Scifb6FzvQDHVWY6arjo+99
         GL+49qnVYbIYRMgwdT1/VVmjq2Jlq57W6GyVLS62fOpiNrAMJLL+lMFgheH7UOsaazKS
         0AV+QdTnRqynxl9i36mKR6NJW1ApANVqNinM2RP3FZuje/AJXm0qsXOAVUjZPpvuTTmz
         bpsw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIAgp4c5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCWG1UI4ZFj5lG0c7L61u0uM4Anvu9OaL93yHJWdf6D/SD0HYzfxsYDYlHhYH5E6VRISsyUHWib3d4GRMLBleAhD+Qns1GT6
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85949000000b0042c25feb7d8si85495qtz.684.2024.02.08.06.29.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Feb 2024 06:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fIAgp4c5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rY5P1-0003UG-SQ; Thu, 08 Feb 2024 09:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY5Ov-0003QK-Sv
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 09:29:17 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY5Oo-0006vN-HH
 for qemu-arm@nongnu.org; Thu, 08 Feb 2024 09:29:15 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-560c696ccffso1756502a12.1
 for <qemu-arm@nongnu.org>; Thu, 08 Feb 2024 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707402547; x=1708007347; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uswSyOm1D4WQ+dn1PI8wLnB3SL0ieGuRJZq33vNjcvQ=;
 b=fIAgp4c5gxEs9YAkIHNgaLL5AdosKEhVDDpG508+Ns7MhPPLC/z4JJKzFLiGfNtYWo
 t4QGzlsFFgaGe+a8CJRZObGAZweatSKiTxCg+cbfta7EufK8cjalxsFkeGaboJ3DyBJF
 wsfiuQ0Ur6Qhdl5rUzuTZ/S15Bwyg8+6gIfByf5D4X9lcCh57spM1Gtl+6vqspGVbDHH
 qLxKEkpBPNWgdrqirZJAbyHG7OObiPJOc2yEcUW/4/E9wFa+m5HM64mxPby4qajcksh2
 EwG/kSEx0gM8n8Ux/A6oRdjokyjfUpQ/BQ/Da7LoLeC+pP3WYo8IyvSRrcTOa8jtzdnb
 fO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707402547; x=1708007347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uswSyOm1D4WQ+dn1PI8wLnB3SL0ieGuRJZq33vNjcvQ=;
 b=l02KlTgtWwcuJsrZek2uwFFgqSO19qm513tbYty6fpTtLxxe0nGqkW4GN3+jXBTAvB
 QmZcvifsHV5BEBghWQKekcqiH/KKGasoe62MyiN/q0RBASDrKuoFxpkb82t0VVLNgMJ8
 VBe82wdgo5nsvvA+PnIYMtPV+YGnG2CiX+4sCszso/muYmjBxBNfdr+047oRr8TUjeCn
 ZwdFzXlbIBQD8R5/SmsTaR6+HsqgeGf9BxKymvAZhURs4AOhk9B2ITKN3ZqKrikRiMFB
 QoYKGrHBQFW0Y1wJbmh29AuncMdYIUHAW5FcWiSbp6u4UoqyITGIEjnFFlA1FzprFKD+
 FT+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWi8KLyx+qSJUvUYnXVmUkuM/A6CRURg4wWO/awWteZZf1Y6Ifj5jHibMxdTibA2TjdUL5FzsxzdlFlYp3dOZR+97QO
X-Gm-Message-State: AOJu0YwTtqxVK08QKrY4S7zKH3E7XE+sVD7NIzNn/ypOW+q+LFHnDibL
 0sxmKAlyQXzXsaVoYae8iU6TfIdTPFAwH3Sbd20nU2LBG5hRx4gCmTBw/wIA//yZAPz+xoP+PgC
 z1nB7DvSU9vBpQ3CWUtCta/0Vd3g8qhfgiRjH0w==
X-Received: by 2002:a05:6402:180a:b0:560:24d8:d2d1 with SMTP id
 g10-20020a056402180a00b0056024d8d2d1mr2773675edy.11.1707402547443; Thu, 08
 Feb 2024 06:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20240208101657.15962-1-kwolf@redhat.com>
 <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
 <ZcTjlNeibKUnIDcL@redhat.com>
In-Reply-To: <ZcTjlNeibKUnIDcL@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 14:28:56 +0000
Message-ID: <CAFEAcA_qnVdTh96KsxPRguy--SLD1-xD=Uxp6MzE6dK6e98Cew@mail.gmail.com>
Subject: Re: [PATCH] iothread: Simplify expression in qemu_in_iothread()
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: UxHrY54aRQgx

On Thu, 8 Feb 2024 at 14:22, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 08.02.2024 um 11:48 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
> > BTW using the same pattern:
> >
> > -- >8 --
> > diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.=
c
> > index ec98456e5d..d074762a25 100644
> > --- a/hw/nvram/xlnx-zynqmp-efuse.c
> > +++ b/hw/nvram/xlnx-zynqmp-efuse.c
> > @@ -582,7 +582,7 @@ static uint64_t
> > zynqmp_efuse_cache_load_prew(RegisterInfo *reg,
> >
> >  static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t =
val)
> >  {
> > -    return val =3D=3D 0xDF0D ? 0 : 1;
> > +    return val !=3D 0xDF0D;
> >  }
>
> Maybe. I would have to know that device to tell if this is really meant
> as boolean. Or maybe it should be written 0x0 and 0x1 to signify that
> it's a register value or something.

This is a RegisterAccessinfo pre_write hook. The docs say:
 * @pre_write: Pre write callback. Passed the value that's to be written,
 * immediately before the actual write. The returned value is what is writt=
en,
 * giving the handler a chance to modify the written value.

So it is indeed returning a register value, not a boolean flag
masquerading as a uint64_t.

> > diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> > index 301e61d0dd..bdd73bd181 100644
> > --- a/tests/tcg/aarch64/sysregs.c
> > +++ b/tests/tcg/aarch64/sysregs.c
> > @@ -183,5 +183,5 @@ int main(void)
> >          return 1;
> >      }
> >
> > -    return should_fail_count =3D=3D 6 ? 0 : 1;
> > +    return should_fail_count !=3D 6;
> >  }
>
> This one isn't unclear to me, though. This is EXIT_SUCCESS and
> EXIT_FAILURE, just open-coded. I think making your change would make it
> only more confusing.

I agree on this one.

-- PMM
