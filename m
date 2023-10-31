Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp275728ejb;
        Tue, 31 Oct 2023 06:22:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtNIxpDDgIdAUStIFRkjqP1ABu5LRv9N6L2A+eV6EaAQNrzwb8GNMhkqIuB19cJmGi7jwY
X-Received: by 2002:a0c:edca:0:b0:66f:b7ff:1e12 with SMTP id i10-20020a0cedca000000b0066fb7ff1e12mr3198574qvr.20.1698758538961;
        Tue, 31 Oct 2023 06:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698758538; cv=none;
        d=google.com; s=arc-20160816;
        b=noezxsngCcDc8hiy028URn1PFX4K0nKkczrhWWBfLH8fc2yaij+ebFTBGKE9W6KZUQ
         4wIsy3EzgIVP3Qz1SjorIHounbgQq2d27XkPTFpg3PmVZ1x3DyR0sLowCxqkTHlCGl5x
         h2j4GwJtOR1x4lSu9oYM8Q1xMgcBugurR75gyBsBpeewBAxGRpLCJWYnZfw+8f88wp8A
         QI0lpopcJz3DB7EuTT5xmOYje24D9kM72DzjHsQNYQiSsheakgXyXeJ7ms5nGZKYhToA
         4aTP2fjjT0H9ji8X4+ySQhAYzrXzj93pB+nEqKBZoNsYKnUSKJMzTPPp6+y0wp/qmm3P
         tlLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=RQxVKBmXI/ZE3gBYcAjlgwU3wKhcXGIVfMtzLQSBWKY=;
        fh=AUDrH9uq55Oka41tsVDPknfDcfX1FSeV7PjdIuCtbHc=;
        b=mAHOA768NYxrkZ37Xs9cTn1BUbLJ/khzPQjg03dhIT4whUOSF9uZM5b69NLR9uIgFb
         XGVTii83ITPFt2RiptsbFm8+B+X5sO0R61RQxEs/fJlPARi3Cjfxo/51xDMbyt34zT8a
         scilGkfikk8MlnBmtajqbfE4sJ4UuWNG7ntAX2qU91xBJAN8DYlTPTOd8c7p3Tts54DX
         6ihgw7q/7IttR3eiMS03N7FBF71KxS86uVs4Rekv2t2fn0PfJhBZ5a0bC4w1fZ7W8VG8
         5JtJ0U5IABurp/iRuuVWo5JU8wCsXxLjeOV7g4QWG4HsLZuOSJok3PRa03jGu4fu9Udq
         DGZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f4JC79MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020ad44043000000b0066d07d8ecc3si1044695qvp.610.2023.10.31.06.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 06:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f4JC79MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxogx-0004Hx-G5; Tue, 31 Oct 2023 09:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxogw-0004Hh-I6
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:21:58 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxogu-0001dP-Tz
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 09:21:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso3348529a12.1
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698758515; x=1699363315; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQxVKBmXI/ZE3gBYcAjlgwU3wKhcXGIVfMtzLQSBWKY=;
 b=f4JC79MMjXP1DQJ9EJBMHVjj6Thmn535iGT9J467PoFhGPHCK1kmHt7w+/AvBVYWBg
 yW65Ze+4wl+/Riw62kaAgn12/MWfvU/JKuZyf/7fUsaW3GHqGdsP9r0hpYOjx6kfCTR9
 GCAsMNruA0rdK3pftb1JGScG0ymaLQqMcxaoMn1bWTpt/q4cxwP5Jh8Xpa58K1WhTUAp
 +dWa3wma+gN6MhgxEx3lPzbZVfV+poHn8Yh1LEphLSaAv7zYISi7ULjEhZV7iSwpqxg3
 EiSkY7iI9SFAF/s+AoC3kFLNYuqa16n6MOexR2GRCCMf5NH+TuFPVGyUy/8n76h3euoz
 FsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698758515; x=1699363315;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQxVKBmXI/ZE3gBYcAjlgwU3wKhcXGIVfMtzLQSBWKY=;
 b=agcI4GOHDub44mTrp3Z3yfWnY0yNA52AjP9l2L/I03RosRSnV/BPlMTdCX5rsRtcLX
 UufZJMFnA4p0YgAuNDTuGWoE2UlkrhkixIffCE2CoV3+XeMe47Ax+EdWfELjft01YQWP
 Xq89KDsHxFxfm6kT6EvCu6aq9sqvRIoRFG1yK1NLawpdqONCCsUinxrpxu1rB+zpS+wH
 JOylntwmm7saFbUtlLy1mGrBNtuZ6a+uvlrhzAgia7TT7UCIm2UNgC83cuyByZX+pDnD
 H400eFuHx/rXBWxDaZK+sVAZO/SR2r2QHUpiGTAv/TLpbxss3eOm4rtYcuBAIGkzM/Kf
 4DPQ==
X-Gm-Message-State: AOJu0Yy4WQCKsTWQu/0ZMpSwG3sKI6L3p9odWp29cIIg9IJfULrasSdw
 324DGS0mz6p/xdepcD1ry+Aizccbt1c83cKzYrINdA==
X-Received: by 2002:a50:9519:0:b0:53e:ad97:82d3 with SMTP id
 u25-20020a509519000000b0053ead9782d3mr2619991eda.13.1698758515213; Tue, 31
 Oct 2023 06:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-5-philmd@linaro.org>
 <ZUD+hMTWf9DidzDb@redhat.com>
In-Reply-To: <ZUD+hMTWf9DidzDb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2023 13:21:44 +0000
Message-ID: <CAFEAcA9471_b2AT9wpwxaoH0PkQ+6HFw_zFTHjgSvXQ9UD-akQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] hw/scsi/virtio-scsi: Use VIRTIO_SCSI_COMMON() macro
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-arm@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Jason Wang <jasowang@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Gerd Hoffmann <kraxel@redhat.com>, rjones@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FLUWTLtf8FP/

On Tue, 31 Oct 2023 at 13:18, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 17.10.2023 um 16:01 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
> > Access QOM parent with the proper QOM VIRTIO_SCSI_COMMON() macro.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > ---
> >  hw/scsi/virtio-scsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
> > index 45b95ea070..fa53f0902c 100644
> > --- a/hw/scsi/virtio-scsi.c
> > +++ b/hw/scsi/virtio-scsi.c
> > @@ -761,7 +761,7 @@ static void virtio_scsi_fail_cmd_req(VirtIOSCSIReq =
*req)
> >
> >  static int virtio_scsi_handle_cmd_req_prepare(VirtIOSCSI *s, VirtIOSCS=
IReq *req)
> >  {
> > -    VirtIOSCSICommon *vs =3D &s->parent_obj;
> > +    VirtIOSCSICommon *vs =3D VIRTIO_SCSI_COMMON(s);
> >      SCSIDevice *d;
> >      int rc;
>
> Why is a dynamic cast more "proper" than a static type-safe access, even
> more so in a hot I/O path?

I dunno, but it is absolutely the standard QOM style to use
the cast macro to do the downcast, rather than fishing about in
the struct for the parent_obj field. If QOM casts are getting
too expensive we should ideally fix them rather than adding
more and more code that takes some side route around them...

thanks
-- PMM
