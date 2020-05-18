Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3219361lfb;
        Mon, 18 May 2020 10:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNCBI9BCxash5frVB9bCTxyfJTWdcKZ2Rp19Ml4g3o8eqbyicvwFXeXjRycMDKre0Yl5Uu
X-Received: by 2002:a05:620a:14ac:: with SMTP id x12mr16159776qkj.262.1589821564581;
        Mon, 18 May 2020 10:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589821564; cv=none;
        d=google.com; s=arc-20160816;
        b=uR0LEx+ZQyQxZmU3BtNsGm5ABu09oMah1ljazoXQaeJUSXYpEc03+VSWR+5hkXrSdV
         e9Prj5mNKR6kFMF9NQGrB7Z7OwnLqdDHdbMMFc3hgctkytMwWmyWIjQV7j/ObyoR9uJJ
         ff32qwiCRR/bztdWjtygOEZGhJWfiiJ9An+Y1/ABaQwG1lfHzw2AHfcEldMufLF6ljxu
         Z7vB+oy8ayHN+b+Xj9YHDafJlde2bsF5UdLuEZ68oStuau0aMZBm6gxR10mdA2FCZod2
         MeCa3nczbW4B9jNulepS7/9KaWWjmQXApLec+n86UEi5bdZ/0ueyP327Axt+hk4DYZYa
         UlfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gaT2qzA0EcvTGr2l5yw/rsZT6fOlXWQUdgJOrhUF2I=;
        b=CYbI9U4+aJSt21i0E3+evIsDFQFiCaUWmyCmoPnA/YBMcqNz4jvdAg2ORuft0gUxL7
         kMXCTbXZFrI+duHxEg/8S5jKasV6Qp90wfnJgRBn3UbtAeRC0UONEQa5S1T111eVDM+1
         kNxBo0WBK+U1Padj5DVT1tCtsGPUISJrYV+wvQNEiXHkobkPS5sdQANMxKDQInLBz8pK
         djamHHOelKITpUTZWRs6YQvnywdTI0+hirsZlmzS/0Q+mhLGgO8ExXRlADLzM8RA40o8
         UvLpzUkUt3Cbf2yiZvcrAf35rSoZmtv/mTZrjXbhfK2Mo4OxW3vLcbrekyXyJJ+jbLUl
         kHHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KJhXbjBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z20si5879649qkg.373.2020.05.18.10.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 10:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KJhXbjBo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jajDH-0004Qp-VQ
	for alex.bennee@linaro.org; Mon, 18 May 2020 13:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jajCM-0003M6-1z; Mon, 18 May 2020 13:05:06 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jajCL-0004W4-0e; Mon, 18 May 2020 13:05:05 -0400
Received: by mail-io1-xd42.google.com with SMTP id o5so11361548iow.8;
 Mon, 18 May 2020 10:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9gaT2qzA0EcvTGr2l5yw/rsZT6fOlXWQUdgJOrhUF2I=;
 b=KJhXbjBorbaGGgmm7NzV/987bi5PCnxwO8OEnbuL2Rx8PeLU0LiEwpumLwxSuLNIXw
 apfMe+1Yc40v3kzHkJeCVWgdJ00MabCUceLD0wCikUHL6up3qfz4/8kli+dJBXpkZ2MU
 d1LUvT+5GIOPYaA9fgzOFPLB8PETj/BINbV7mjjXIxdRs157QiPgyAes00p7m7liEMZ+
 hsqmbfmXjcSr2xwwhzcIL82bzA1iCGYyf0Lj/v2McqQmhPr31E0c/K9IYXIit+FS4TSZ
 ahO7+J5yCHc8N34hh0xd09FHnXHZu8T5kOZGHobQ5PJ/NoEjR/kqUDK6j4aXaE6AuArj
 lUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9gaT2qzA0EcvTGr2l5yw/rsZT6fOlXWQUdgJOrhUF2I=;
 b=b4bG45HmdPUx4eTsll1fsi8O38zxRA5kQtPyUM+pfVRIt05wfyprLNK45CvGdB2Wbn
 ovT8cN4YozHQA6tSqlovCtWL1I2t5VFT1y18pam4D8wUdmZ+wfz/v6gSQqTgf99JAJum
 uuWPaAdELqX1bcZgpWqPHz21JnDf+fJ2KS+gzw9TUbbH0GQkWK1KwF03bG/yaGHBAAWF
 dXGhWOF2bshwgJhABwaeYUYQMQQypGUTYFgWIICd7NUQj9IFxCjG3rZktFBgS8gIRGIY
 utiWVmIHiczBpgaIjSwx+p7myz/nNX8uFW87G6ouSPCQiPZVyWKl0FSIYPeiRiHqs772
 Qs+w==
X-Gm-Message-State: AOAM532mTJLZEAOzFwCATeWxw4enG1z3uChw/Cy9FBdqSCDADo7cbgKT
 5L/TNbPVRu8znxvy7BCyxF6H4UjUokWLzh4fxd4=
X-Received: by 2002:a6b:bf83:: with SMTP id
 p125mr15402529iof.118.1589821503626; 
 Mon, 18 May 2020 10:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-3-armbru@redhat.com>
In-Reply-To: <20200518050408.4579-3-armbru@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:56:11 -0700
Message-ID: <CAKmqyKPdGc_akCv00NLnVyaRPTeikcGg_JP-7+LWVRA4CbGqcg@mail.gmail.com>
Subject: Re: [PATCH 02/24] display/xlnx_dp: Fix to realize "i2c-ddc" and
 "aux-to-i2c-bridge"
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 KONRAD Frederic <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WMdEfgfMbfj5

On Sun, May 17, 2020 at 10:14 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> xlnx_dp_init() creates these two devices, but they're never realized.
> Affects machine xlnx-zcu102.
>
> I wonder how this ever worked.  If the "device becomes real only on
> realize" thing actually works, then we've always been missing these
> two devices, yet nobody noticed.
>
> Fix by realizing them in xlnx_dp_realize().
>
> Fixes: 58ac482a66de09a7590f705e53fc6a3fb8a055e8
> Cc: KONRAD Frederic <fred.konrad@greensocs.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/display/xlnx_dp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
> index 3e5fb44e06..bdc229a51e 100644
> --- a/hw/display/xlnx_dp.c
> +++ b/hw/display/xlnx_dp.c
> @@ -1264,9 +1264,13 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
>      DisplaySurface *surface;
>      struct audsettings as;
>
> +    qdev_init_nofail(DEVICE(s->aux_bus->bridge));
> +
>      qdev_init_nofail(DEVICE(s->dpcd));
>      aux_map_slave(AUX_SLAVE(s->dpcd), 0x0000);
>
> +    qdev_init_nofail(DEVICE(s->edid));
> +
>      s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
>      surface = qemu_console_surface(s->console);
>      xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
> --
> 2.21.1
>
>
