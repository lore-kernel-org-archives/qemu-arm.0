Received: by 2002:a05:7022:d82:b0:85:21:bd5b with SMTP id ec2csp903013dlb;
        Thu, 8 Aug 2024 05:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUA5juPaRcur72rY53umPxrvCkB9paRW+IorJXUXqUWYkhZ4nBsgDvv7BwpE4y9+TIhrd3vT2vq24Qb8ZTpgS9V/eogWuep
X-Google-Smtp-Source: AGHT+IF/8v7ptezxFZO5Q8Z+Ki5sg2Jr3iXFu1MBiPukQu4fuPvSflK23VP9vatx1fSasHWprCUY
X-Received: by 2002:a05:6214:5788:b0:6bb:ab4e:8bb9 with SMTP id 6a1803df08f44-6bd6bcae6c6mr19447846d6.5.1723118747396;
        Thu, 08 Aug 2024 05:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723118747; cv=none;
        d=google.com; s=arc-20160816;
        b=NHApyTtaqjDLTZnSD+ZJAvQ/70o3fwqfBHo7tH/6INYI3ipW/v0W9g+60606GB77oX
         3lI1Oue9W8KiHXYWD9s86a4MujB6Ph+Yo2Zf+CtaNiXiNMb0NVsqf2zefoYvlKqIyUSo
         rAlYIexe1GWUKMp0KYJGY1WC7l/eZXk23WZp3U9I75mqReGcFlZZ9jmQGKJLFdKjQmnT
         v9Q6qtgNybxhRvIlP/VuA2Z3KTI+o0VRax8xDzEqwl8AI0h5xnmZqCTDHhbGy4fv1t8a
         ZU+laZNnxoPMTmwNYiKRPNpsLa0V90iC70IAMz7JGDjhOGMCSr/QYkiEHNPHOEQ9s+uu
         voug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Ie9/zshnXJahaSjDJyr5B0VRG7Ex38kTtZj2BwALYOY=;
        fh=sWSTgJEKnwHO8yJ8x0GkHzxUFYYh5vGTJC4UNCA2qiU=;
        b=zQMZ9VYKhijNT/wzXJ7TtxS+e/h+FZNQ0XE23aOtmhagprT5EKvtN55i5j8wUePKyZ
         4siCt3ArWTXcwoMO7kz/FnUWcMGxtMfP63xlCBr3HNLR1o4qwQ3T1I/8tgQhuihMPEg2
         P8Fc1WgLINTu5L3kz74PWfz4ELIitNbBcXp1iaG5Y1LFgypZIAtvfoPegshp+Hbl+vhY
         y676IdyhhtnODC3TWCcJAAQm+3lfxMVrdzJNkZ0+WfC8zAkbFJnvbrGs+qZRDcDw/MJ8
         EPsuSugAV8eQBkF5OKm2tGdvI2iVhvSfII40JIqPxGdmAzJ1DLZAoXKQJZEdcgrs+hWJ
         S3gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+SDeZXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8ed34csi43114026d6.338.2024.08.08.05.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2024 05:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A+SDeZXr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sc1tW-0003xy-VI; Thu, 08 Aug 2024 08:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc1tT-0003we-Fw
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 08:05:23 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sc1tJ-0002kd-1I
 for qemu-arm@nongnu.org; Thu, 08 Aug 2024 08:05:17 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5a1f9bc80e3so335987a12.2
 for <qemu-arm@nongnu.org>; Thu, 08 Aug 2024 05:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723118709; x=1723723509; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ie9/zshnXJahaSjDJyr5B0VRG7Ex38kTtZj2BwALYOY=;
 b=A+SDeZXrrZIuT0ZoY/zIiiuyYmqkIjw91XmfvP8bGccIkByT+8GjLVXtHCOvYoyayL
 N8qTG6Ne58RTx8AxRuijSJQuWhsjkBHinLX1Et7H9chf/E8J4ggYgBnSgLuFa3cwhLRO
 lKbM153onnW1daZbFZT4QOkneIIau0etxWRVTJoPnmLVIf+r6fsHvwBtYu/t2KCCmm0/
 KiJx/moDwbrHVQZJJa0iE7bBrMMBv7sv5huqLdN+UswNKqvxY3f/iIfj5jroaVgY8jcb
 ruWqCytZR+8ZeJRfj/xEiGSmAYY3k4cYMoYu4GtfViogEpB8oZixVFMiKGvfH92xME/e
 gOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723118709; x=1723723509;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ie9/zshnXJahaSjDJyr5B0VRG7Ex38kTtZj2BwALYOY=;
 b=MQZAaoyCFnigNH0z3lrZhTyMUZsD2GnNzCPQpBB0td/tJHeHmIKxghJVTP/SM2cLsC
 2ZrdrKZDgDXCreSGOmDDfwd0Sa7KROMkxYXPIjhQEazVlk0nrAlHxvU/5QMlCPx4PMzW
 Fy+U7hejtI3BIuRQ2qccrVpwtcRiVhJwnYQ/pML88HeKMt+hrXECedgFXYeAePMQ0raX
 CReiFAlBqCr/d5oD6qwtop/RS+UKMwhK7yh6F0D161paCYxgTcTKUJNRQRwaLbktIcrH
 ohCe1mb9gwQwM426+b5flO1k355B/J6lFI1V3pURIp0NxO2T1l0zycp2n3KIME9EzBoV
 dozQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW0oJ4Md1rIPMh7IUpF9377cBVyYmXtKl66SIvIJv8glUYAkVvNIdGG4EqkI9QKWPkjaCvWqAfax+uO5BDt59Ni89x
X-Gm-Message-State: AOJu0YxS06eSNegh/1pfNOmGqxP/ohYqt8q6RsNZbtn51kGuzRBbF8hU
 PchaZkggyWrFhgO8y3h7L43Zv7uWwZruykxa1X8Wm2jg3fEbmlZBiB/8PVpOFKwY7C+IZW+4/Qc
 GlT2FaOLwhMZZ0GIhZSkG9Im5yISYHynQ4cB5stCHy03lgCs9
X-Received: by 2002:a05:6402:13d3:b0:5a1:f9bc:7f13 with SMTP id
 4fb4d7f45d1cf-5bbb235ae4dmr2037485a12.22.1723118709019; Thu, 08 Aug 2024
 05:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
 <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
 <CAFEAcA9emwsK07+itUzMxReOLG8gHaxNdDE8ymuwyuBfsoY2Pg@mail.gmail.com>
 <87bk23skhq.fsf@pond.sub.org>
 <CAFEAcA8J4i-81rOEHBpqbV=c4F26o6qd3Lg9dZV+BuNyZPGg7Q@mail.gmail.com>
 <87ed6z1j77.fsf@pond.sub.org>
 <CAFEAcA_=GYBGpbvfKMGsYrUKWgcTLrriBKd37jOVFV1YMfy8Mw@mail.gmail.com>
 <ZrSqsEedC3rmVbD9@redhat.com>
 <CAFEAcA-c7bYaWdOp0ShzUE83kKaYmqoH5DpW+EnU_sVzJgdu4A@mail.gmail.com>
 <ZrSwl0VBX4_1Tc71@redhat.com>
In-Reply-To: <ZrSwl0VBX4_1Tc71@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Aug 2024 13:04:58 +0100
Message-ID: <CAFEAcA9wG8okctQW7kEKX0xQWph6dgdt1v6vfe0eg2xKzmXYMw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: L9NrgSf+k3II

On Thu, 8 Aug 2024 at 12:54, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Thu, Aug 08, 2024 at 12:32:35PM +0100, Peter Maydell wrote:
> > On Thu, 8 Aug 2024 at 12:23, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > > On Thu, Aug 08, 2024 at 11:15:17AM +0100, Peter Maydell wrote:
> > > > It's not possible to use KVM with that machine type, so the
> > > > question is a bit moot. (This also indicates that the
> > > > interface is not very helpful -- it purports to tell the
> > > > management layer whether it can use an accelerated in-kernel
> > > > GIC, but because it doesn't specifiy the board type there's
> > > > no way to provide an accurate answer. It would be useful
> > > > to know exactly what libvirt/etc actually use this for...)
> > >
> > > Libvirt uses this exclusively with the arm 'virt' machine type.
> > >
> > > If the user didn't express any GIC preference, then if KVM is in use,
> > > we'll pick the highest GIC version QEMU reports as supported.
> >
> > You can get that without querying QEMU by asking for 'gic-version=3Dmax=
'
> > if you like.
>
> This isn't in the VM startup path. It is when we expand the user
> provided XML config into an ABI stable XML config by filling in
> the blanks left by the user. So we need to actually query the
> values available.
>
> > > If TCG
> > > is in use we'll always pick v2, even if QEMU reports v3 is emulatable
> > > due to the v3 impl lacking MSI controller which we need for PCI-e
> >
> > Our emulated GICv3 supports the ITS which has MSI support, so I'm not
> > sure what forcing GICv2 is getting you here. Looking at the linked
> > RHEL bugzilla bug, I suspect this is an out-of-date policy from before
> > we added the ITS emulation in 2021 (it's present by default
> > in virt-2.8 and later machine types). So that is something that
> > libvirt should update I think.
>
> It looks like it is virt-6.2 or later, and libvirt can probe it
> by looking for existence of the arm-gicv3-its QOM type IIUC.

Yes. (I was confused by the 'no_its' setting in virt-2.8, but
that is for "is there a KVM ITS", and no_tcg_its is separate
and as you say added with 6.2.)

-- PMM
