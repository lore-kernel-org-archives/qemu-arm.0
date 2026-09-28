Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58071CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 19:19:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBGsb-0001uq-0q; Mon, 28 Sep 2026 15:19:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBGsU-0001r5-R4
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 15:19:07 -0400
Received: from mail-ed2-x17.google.com ([2a00:1450:4864:33::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBGsQ-0002EG-KP
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 15:19:04 -0400
Received: by mail-ed2-x17.google.com with SMTP id
 4fb4d7f45d1cf-6ab062a08f5so3344050a12.2
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 12:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790623141; cv=none;
 d=google.com; s=arc-20260327;
 b=M9PIAsh91+mLhxz6gn/+C+zaSRpKoTFN0Z052wMASKH67iGM0xXJW+dm4GUzpX2HPs
 BSBuebgzdKjLlFxSTJYaIi5nOiK2qWOvAfCWr7cXU+Scv28anc6U6ItwRorB4KZeV2qJ
 NCWPA8LcyexC+caBTEHlD8bUly1n/UnJpAc4wRh0TRAM0G9PK5rfBNNA5xmWd3eUEoxG
 lGaZlU4FpRwdWptsquFRY1kAhGlYnxP8r+BXEr5AdjPGmM+SEYH8SnhqRAMiizuWrqy6
 tvgeRJXuQDMNzTaUjM9eZj67Sz7KlCnngAvzHczhBfy2mymCgnYB+r/di7auRjQ67//i
 Vx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=sYv4OegR8GqzCvAtnvT8UGGBWoOzF0nsQRUN1o16Udw=;
 fh=1HldEXCNnPIXHBR61ha5FhtC+ZADDsOG6sPvrvoqW90=;
 b=og9coZIkO62ul2ZCqdG85mOPrws80zDE//UaRH05DVDnxQUIfdpgF1SJ0FY0It6/FL
 rz4oAzHmgelM1Cq2mBasWvJwl7Y5jgxpkFBBNX37OZkjdgdywKIJY9+QW0ZnBxtcpVoe
 BrDh3mbvVImKk+mtNddRUjDt5Kini/Q/GKPs2zJRkq5AeUU0eZmYc7NB+WHZeACM8bNV
 hDkzJYWN8MyjYZhqG0kdM9xT66xe8ajHZI2qONggOWrIjB/Q+1AQnltzlqm7AGx1JKPu
 24OlcZtuG64P3me5xvGzQ3TsyEi+caBfrF4fDyIFaMDcI82oSHAZ6GvMMub2zSSc9CKR
 VpEQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790623140; x=1791227940; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sYv4OegR8GqzCvAtnvT8UGGBWoOzF0nsQRUN1o16Udw=;
 b=P1cRaFmY5HMTqYif+2zEjtZUJ1s/EEjW2HaMOULzH8LHOMl0VcfXxtZisBwyDAaHsY
 bJnPBllV6+MxyhEMeNvEyXdX9BW/P8j8DFmc4yj0Eg8roF+4fuiuNQNkqbwxJUwRQvk8
 dqXH8ukdm6hBS4DOlxXa6bhd2usNUCIwWe2yswYwRcYAu3lvAlkOV/0fk5TKuwrywq2a
 Ec1GQruGKOZtT1XZlJeYCtFLxtmbPN35uTZJ7rzp02Qe5YmKbE/1HayDRf/LSRr77Wf7
 iGtx96CL6r9OntspM4OxkkJXkFu+ffPOHaBg2DBfV0jmoS+FLYDfTshTsFerWlpIqkvE
 Imkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790623141; x=1791227941;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=sYv4OegR8GqzCvAtnvT8UGGBWoOzF0nsQRUN1o16Udw=;
 b=ZA46OsBx/kQDBEBnHNHozHsbxu7x0s3G0uKn6yFcpuJdqaX1odErccbeZEw7bII91G
 SLVfdKaHGbTAeqJwxPZuhyhKM0f9iam/s4QUQ1HZsgwutjhNvkxpsdaq6181dP6baIFd
 xZD8sRicaPeIAa8f8tPB+1SwlxiXEjdM/ZVcAUloVHcCFwTyI5KO2CkUsswKAKItKeUG
 VYuw0Pwoferaf6Yr8NCAp2xv2Q6+YdizUkBECDKocyevLPZcdO4oHv1HpwakYMRlRbXL
 lrwLn6so8xQkRWfg9qiuXgmMhVmU0MR6wa2ddLf0Y67GLaUpPza4kL9o2ntm40/52PPO
 ZGYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBysldOip/Pi3yUxMFP9vqWJm1tRSQGSQwVjmlNsnb9ncNKvs52zetw70WmEzjnLWXnsCVpk7ymvCA==@nongnu.org
X-Gm-Message-State: AFq9FYIv8C4+lshNc43MbFMQRgeJhUsTwV5mLnpk6flXL81LHIwV7fy0
 FsgVmA/D2u5OpCwOeQA/91nvHvjxYbTuMriM+TIaMbbVZNUuKONlE6F7ph2jQcOg1eelTZHzZWr
 PxX2xtL4JC0QQ1sIVybz4doq4tfoOXcE=
X-Gm-Gg: AYBFou2O4Nm+mzCUdU+2srTEW46vQOuTijrkan+plhiLCTwPkxZECBXkPif/XEaUvMN
 P35xgs+S0ymZdUxPdRFGS7xA422CXZBSDnsEIhdSTYUM2C/ba/Gcl8DIc5LJp5fVYDH4t36m+go
 EAzHXf6J/cKARefW0BRA02nTdnHawzNco5NUt4lF9G/4vLECMgmfTqGuqVzyxj3lF9be91ewnV3
 ZLwhuLm3oVilmD/+3OwYUTxU1EE6bzs+vSseT9HcRRnGbjI8N5gQ6JRedoG5eRzfWVp5cdzXScM
 hd5cQnk8vysiuahn8YMTAYJSYDrtPgqLIcWGyAVo6HP0+0712dqzG3U=
X-Received: by 2002:a05:6402:5356:20b0:6ac:70ce:ba2 with SMTP id
 4fb4d7f45d1cf-6ac70ce0e36mr2537042a12.39.1790623140222; Mon, 28 Sep 2026
 12:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260926070057.1234-1-luoyonggang@gmail.com>
 <20260926070057.1234-47-luoyonggang@gmail.com>
 <aro93NuZBXYGbD33@redhat.com>
 <87e7c5ae-c78c-4a47-b9ba-9851ce5757d9@oss.qualcomm.com>
 <CAE2XoE8Fp8w4m0WBjEXF3LceFXUqKDcXhdSmhCThgkAM3wRVaQ@mail.gmail.com>
 <1f46d3a3-1275-4ae0-be07-717c643cf0ae@oss.qualcomm.com>
In-Reply-To: <1f46d3a3-1275-4ae0-be07-717c643cf0ae@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Tue, 29 Sep 2026 03:18:47 +0800
X-Gm-Features: AclHuK89rkx8dUCUIYddhlG0R2D4NPzT6encjJAYmGIfANm--plpg3p1dBox5j8
Message-ID: <CAE2XoE_0P5M_WNXcREVL+5h0JOVnGiiE+-bPve5dX-q1f_5uZA@mail.gmail.com>
Subject: Re: [PATCH v4 46/55] qapi: add query-targets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:33::17;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x17.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, Sep 29, 2026 at 3:11=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 28/9/26 20:34, Yonggang Luo wrote:
> > On Mon, Sep 28, 2026 at 6:39=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
> > philmd@oss.qualcomm.com> wrote:
> >>
> >> On 28/9/26 12:13, Daniel P. Berrang=C3=83=C2=A9 wrote:
> >>> On Sat, Sep 26, 2026 at 03:00:45PM +0800, Yonggang Luo wrote:
> >>>> query-targets lists each linked target, including none, with its
> >>>> arch, endianness, and the machines that target accepts.
> >>>>
> >>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> >>>> ---
> >>>>    hw/core/machine-qmp-cmds.c | 30 ++++++++++++++++++++++++++++++
> >>>>    qapi/machine.json          | 35 +++++++++++++++++++++++++++++++++=
++
> >>>>    2 files changed, 65 insertions(+)
> >>>
> >>>
> >>>> diff --git a/qapi/machine.json b/qapi/machine.json
> >>>> index 6aaa2af709a..d8cdea6203e 100644
> >>>> --- a/qapi/machine.json
> >>>> +++ b/qapi/machine.json
> >>>> @@ -307,6 +307,41 @@
> >>>>    ##
> >>>>    { 'command': 'query-target', 'returns': 'QemuTargetInfo' }
> >>>>
> >>>> +##
> >>>> +# @TargetMachines:
> >>>> +#
> >>>> +# One registered system target and the machines that can run on it.
> >>>> +#
> >>>> +# @arch: the target architecture
> >>>> +#
> >>>> +# @endianness: the target endianness
> >>>> +#
> >>>> +# @machines: machine type names, not aliases
> >>>> +#
> >>>> +# Since: 11.2
> >>>> +##
> >>>> +{ 'struct': 'TargetMachines',
> >>>> +  'data': { 'arch': 'SysEmuTarget',
> >>>> +            'endianness': 'EndianMode',
> >>>> +            'machines': ['str'] } }
> >>>
> >>> We already have  'QemuTargetInfo' struct which is used
> >>> with 'query-target', that should also be used with the
> >>> new 'query-targets' command.
> >>>
> >>> We need to add the 'endianness' field to QemuTargetInfo.
> >>
> >> Why do we want to expose endianness, and what endianness to
> >> expose? Endianness is a runtime bit state of CPUs. Sometime
> >> this bit is hardwired but that is an implementation detail.
> >>
> >> See commit 0e2c5647d92 and surrounding for MicroBlaze for
> >> example.
> >
> > Please take a look at
> > https://gitlab.com/lygstate-qemu/qemu/-/pipelines/2890507627
> >
> > I do not have clue to fixes it properly
>
> What are you asking here? I'm seeing failures on targets supporting
> dual endianness. I can not try to help you until I understand what
> your goal is (I asked it multiple times but you don't reply explaining).
>

MM, let me try to explain it.
The machine list of mips64 and mips64el is different as follows
mips64_machines/mips64el_machines,
and the two lists are generated from original qemu-system-mips64 and
qemu-system-mips64el respectively.
But TargetInfo::target_arch =3D glue(SYS_EMU_TARGET_, TARGET_ARCH), so
qemu-system-mips64 qemu-system-mips64el
are sharing the same SYS_EMU_TARGET_MIPS64 for the function
target_arch(), and it's returned for
query-target/query-targets. so we can not distinguish them.

And I want to deal with this issue, here is one of my try:
+#ifdef CONFIG_SOFTMMU
+    .target_arch =3D glue(SYS_EMU_TARGET_, TARGET_SYS_EMU),
+#else
     .target_arch =3D glue(SYS_EMU_TARGET_, TARGET_ARCH),
+#endif

Is this proper?

static const char * const mips64_machines[] =3D {
    "magnum",
    "malta",
    "none",
    "pica61",
};

static const char * const mips64el_machines[] =3D {
    "boston",
    "fuloong2e",
    "loongson3-virt",
    "magnum",
    "malta",
    "none",
    "pica61",
};


--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

