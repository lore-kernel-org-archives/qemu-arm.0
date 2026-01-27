Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09ADD2FED9
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 20:12:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkpQf-0002qf-Q1; Tue, 27 Jan 2026 15:12:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkpQc-0002o4-Hj
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 15:12:47 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkpQa-0002M0-MY
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 15:12:46 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-b885d8f4092so836118666b.2
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 12:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769544763; cv=none;
 d=google.com; s=arc-20240605;
 b=k2UwwphkQLi6/Ebs1Luhszx97EgEGfxDPrgEcDS3dq0TOkGChQNNVAV0eDc3XQahyH
 LGyHZIIbZyW82YMutWh6d0eIhUu48yr019iJVgzDYDcVjqL/EAhQkniFTowxHp3KUUwU
 pJuZ9KZYzIiJRECeRhEDVyAOpcsNP9L0Rr81nSZto5Z3BPFalaqBFJ2eqCBznnIU2cJI
 u1py54h06+oR0Iz0/+kOgZnVma6xUpekqcbhXEWrQMBMi6KlNaBYPcgHTfP60QSuswAS
 P2yIPnFTCG2upfUVzggYupIDRQpTGWRph5MV8V5UYhRA5sraQKI4ZlGi6gG5jeKenOes
 f3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=l9nsUQCCxtXPjWMaUQ/jE36jnFYIUiXbfc2AIR5QMbI=;
 fh=6yWQ+HM/xldvSvwbM5cIcqZjARXaajqNsahpkARlKzg=;
 b=ir04+EoecjTF0rpk7uEkDfNejloOojoagTRVD3EciaWmzqEp74tRR9NIxsVliiEN76
 5+s7caoRDjFv0pviyDIsfMTcfSivWbrEksEb8ERurVygZa3ZqzA5Yo1dtb4p1awsLhoF
 Ku+zZ6u9Ly+rrKEX8OcRKUVkxhiuTAI3s0hVPnpc79KPuAYf3x1aC19CnameYBxv8x7p
 x3tLoWKk1XmYsdXX8zUpQzR6MzxQJ1BCUh+rijfSoA2nmaqTD0RaDOIseSUPyOfgHddx
 MQd1Lj2EbWZa6BCMD+Vh0DGPApHECnGpG7hu4Hq+Ww9gYnthxp8GaU3HOk6vC3WoLLVw
 DpHA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769544763; x=1770149563; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9nsUQCCxtXPjWMaUQ/jE36jnFYIUiXbfc2AIR5QMbI=;
 b=CLqFMMxJL8oI9sHh4eBetwOhmFulXmmCpxf3H8/6fG540kjxb+16SOwKlmYCzNBUg/
 QmY4ZD9X6KbM1LZbExreigfaYf5Yp2tLsQ4zoU92U+toWO+2wAq9aQWZFAmLXHxa3Wh5
 qE8FszktUUDA644JFPK5GnLle8sS4bEBm3411Ky1SGuJl457SBzHZWqxat7YgcX8zpx9
 t91hkk18X/hXhjMh2d146+Optdau1d8oJqCQTjw9czAeL7jsXv3EUySfvsj8lPvIiopL
 Gz3JXVB//LgqP5HF9irlLKVSNjiEkpjLRDJd3RgtteRCEf9gL62cwI6cniR4Kki7eyzt
 z8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769544763; x=1770149563;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l9nsUQCCxtXPjWMaUQ/jE36jnFYIUiXbfc2AIR5QMbI=;
 b=O3CIY3khxpuBgKXPJTETnU4h+DPjWKjMxOVGHvubtN6OarAAXqjN1/3LVrPnZEqjE7
 NZksCO0B02lcPRTt+fNogTSbFmjJCFwojUKkV5RPx3RDRpkp6INM0UK40eOWcgSxGsB3
 6abQ0NFdsbBnWNHflhHoLe3sng91oHpv9dqUMfOpsAyFe2OZm6NUmnacgfrTTjs/H3mC
 dkUvggdsv9NDS0chuYPL48Kty7y5VBiNUz5g5Dm5QKMEoTEMTMZ5iBI59FSzyR98l7+E
 Rp83CB1UY7AwNLKrQLpBkdq8JDSbCg2Ov+wGBrS9hhZUmBwdAzk4VHU8ilqCd4by8XMz
 NUvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwMJaBHOhGul0W1wEnVXgTteCtYVL+ivkNJOzIp0bmg4y6thyLxOSUawnZFdZQiPoZLrR7foWNSA==@nongnu.org
X-Gm-Message-State: AOJu0Yz2Em+3Q3zrAvPZ9kQkJKZZfPHJmF9DbC0uPqiFqnkVU8ef3k/m
 RK5quuOQE9SDErWvGFZ+tLfYwxYTrW2x4Zae2e9rMSkSbXybsxDV7/QAeQ9tmB2dNL+WEqv3Tcj
 X0gaNltJED1MNPiJlMRbYndtdvOhNuU4=
X-Gm-Gg: AZuq6aK4tPyleBiCozgHy+3lu1XF9rY9TfHeWwqyNYGRbPs7w2tLiWkPXlXCl2klqrI
 uqV9uptmhe+YfsmIYxSbiDy/vjzFozuUODQXmtnKJtLmR6X2gNprWUxgXMgw+/DMWuyikzleT6r
 cfjrgBPPt3O1dAAoRtKrYbz0vB9OhM5gHARmKfwnNQh4NylO87cuIY3tp+265SFpU163gSpYnzc
 GUBIJiNf+kAjSM6JTP7//Mtw17Dpz7q3hf+06L5cZBazhUl0lKLVZQuOpAW5K0zEEqhK8ME
X-Received: by 2002:a17:907:7241:b0:b88:7568:26dc with SMTP id
 a640c23a62f3a-b8dab37cea1mr224738266b.43.1769544762658; Tue, 27 Jan 2026
 12:12:42 -0800 (PST)
MIME-Version: 1.0
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
 <20260126174313.1418150-19-ruslichenko.r@gmail.com>
 <aXh6EHwejpTVoYXY@intel.com>
In-Reply-To: <aXh6EHwejpTVoYXY@intel.com>
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
Date: Tue, 27 Jan 2026 21:12:31 +0100
X-Gm-Features: AZwV_Qjfe6_K5XUhLvsLSkcj398HeAEjicx-Qx1OM4PrBczfuAreCohiL8yXer4
Message-ID: <CAN-aV1H1a6moy103JDAJ-1RYVQDpjYL3Ug6oFY0q4ZtRoC--yg@mail.gmail.com>
Subject: Re: [PATCH 18/27] hw/core/machine: add '-hw-dtb' option for machine
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org, 
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com, 
 takahiro.nakata.wr@renesas.com, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, Ruslan_Ruslichenko@epam.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Jan 27, 2026 at 9:15=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
>
> >  static char *machine_get_dumpdtb(Object *obj, Error **errp)
> >  {
> >      MachineState *ms =3D MACHINE(obj);
> > @@ -1287,6 +1301,11 @@ static void machine_initfn(Object *obj)
> >      ms->ram_size =3D mc->default_ram_size;
> >      ms->maxram_size =3D mc->default_ram_size;
> >
> > +    object_property_add_str(obj, "hw-dtb",
> > +                            machine_get_hw_dtb, machine_set_hw_dtb);
>
> What about object_class_property_add_str()? It seems this property
> doesn't depend on any other state, so I think it could be at class
> level, just like "dtb" did.
>
Yes, it could be done by machine_class_init() indeed.

> > +    object_property_set_description(obj, "hw-dtb",
> > +                    "A device tree used to describe the hardware to QE=
MU.");
>
> maybe "A device tree binary used to describe the hardware to QEMU"?
>
> and none of the other machine property descriptions have 'periods'.
>
Thanks, I will update it in the v2 patch series.

> > +
> >      if (mc->nvdimm_supported) {
> >          ms->nvdimms_state =3D g_new0(NVDIMMState, 1);
> >          object_property_add_bool(obj, "nvdimm",

