Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3339706lft;
        Mon, 4 Jul 2022 09:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vX3HMylWzOd7xd5j9291vIbWEMfR1DLb0hiuu0fdeS0bvW97Ej93xyC6hRAAxV2r2DerOs
X-Received: by 2002:a0c:f405:0:b0:470:2d2d:d8a with SMTP id h5-20020a0cf405000000b004702d2d0d8amr28448723qvl.99.1656951684212;
        Mon, 04 Jul 2022 09:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656951684; cv=none;
        d=google.com; s=arc-20160816;
        b=iMGGauDgu3yIGmQnhzgrB95yN1tEzzOL9h9WtHI+Bdj1HiC8iZ56iJDSKuf3VnAiSw
         nNYd+NUQCfnXlURxlT47H1H1/ckEMErkdZXBzbW2+njLYVQ1DKqtdadRsGCdFAEzNbDW
         5xTCT7Ruv7qV6z6cpJR09KBp6cffXioUZoKbIunNZZJNvcapjjRGT8UwmQ9UUMDGIiyp
         B5+TU1fptVGCgFcaTB3VDdtMSpkl/HpvQYQK634Y5Qzdf2I7LZsn8Hg00pUq+yyvcsje
         G+AGpaTIEw5cVZZPLAZHnf2tTqBnlWQBREi9hodV4C3DU+3IrsWVXCgSU35eAROcoF+Q
         8Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dNG6EvBYvsu+Vu3UGBZ3dhBxzLsoA2k3lqqk942lSJw=;
        b=I2B59GtEKxaVF6eCdsi+CYFikrGn3UEhVaOYy/QUPfTdfurbptvXQA8aDbg0TT8f3z
         1bTonKUBZVEedBj5jQg1gSFvEL6ORxQ9W4EpITNp0kPI/BkjyCld8W1PhZkrWfk7eSeP
         QizVFk63mPmGezLKqN4fJaC2cZIIg1D9nwqtEI+j6P+Qrsk0533sOlwVztT5ncVJCfUP
         4DdP+YzprzEWMwGe0Dc/Ca7CNzdp2KGfF2VqKMs4pwtYyhwF3Lp85D6Xj7W01TTny82v
         xfZsguEmHG07EsF7uzjCtU+qvEDm4/Rs9VaCWOg4yuMpYGxoWPe0pB5Mv8+iQyBVLA4C
         TJXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y0BEdD5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05620a271600b006af1ba50ab1si15149534qkp.511.2022.07.04.09.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 09:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Y0BEdD5b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8Op9-0002ne-NH
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 12:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Oos-0002Qb-0z
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 12:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1o8Oop-0003OM-7j
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 12:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656951662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dNG6EvBYvsu+Vu3UGBZ3dhBxzLsoA2k3lqqk942lSJw=;
 b=Y0BEdD5bcNOd35lj4gg+PV2QBqf4WEAKGIi9bruFvmVWXNixzXT2A2fnVuoKYYNgU/Ly+x
 I5hCHDe29NNrMWGCfLYvlJSo06xjOyzNLfdYIiz0cD5FLFqaCKSEyfdmSmjq3/x2GuypYN
 A3jfQjpYUeYqu8GZjnZJ82U7kXz1muw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-04_d3RJEM1GKgRG3oC0x8A-1; Mon, 04 Jul 2022 12:21:01 -0400
X-MC-Unique: 04_d3RJEM1GKgRG3oC0x8A-1
Received: by mail-io1-f71.google.com with SMTP id
 bw12-20020a056602398c00b00675895c2e24so5687118iob.19
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 09:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dNG6EvBYvsu+Vu3UGBZ3dhBxzLsoA2k3lqqk942lSJw=;
 b=jraDuHo+Z55ouKxSMmFWhQxAa2VH9uH6znqMVQ+w8qCJieVxLpq6zuH6I02G6FxtCW
 U4PBhr/YhdeA630KuqI3EHeNuqGZ/f1G32+HAQueCPy02uGylue4D2C/oPh+1k4rcYt8
 dt8H6hj0oCTD+9QTuZPYtR1t2qn0d625San89mLG0oOxMZHR2oseHYq9Y2ahxCTjMK7Z
 zY1P3vgHdmNIF96KVyDWEhN8Y3lhuVBFGS9QaCq4VWIzNqU3IvPaM8OqNVZ4ETZDamMW
 RSw6GNgUMmjOQu8S2krxczAqJvL5s+JtDLnjs8oGAVTJ0ZBsPcDUHJsi8OTFAmv1HG+g
 0ASQ==
X-Gm-Message-State: AJIora+qmQEaNEb/a2MJn01+XUPoWOoIIlVn8zN9sU3cJuw42Yu9V0tQ
 G1AbJ3CYnHklv6qK0xRTK+8IhvJZrha0PTT/CD8DWVvPO8TagPQ2fo1i0kBU0b6kzhJrmo19J40
 YF85b6koJgTrPviHC2SjqGOaBFBzH
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr17833806ild.16.1656951661112; 
 Mon, 04 Jul 2022 09:21:01 -0700 (PDT)
X-Received: by 2002:a92:cda5:0:b0:2d9:5bc5:6661 with SMTP id
 g5-20020a92cda5000000b002d95bc56661mr17833776ild.16.1656951660874; Mon, 04
 Jul 2022 09:21:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113524.197910-2-afaria@redhat.com>
 <89089143-3f55-02c4-c881-95d356108569@redhat.com>
In-Reply-To: <89089143-3f55-02c4-c881-95d356108569@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Mon, 4 Jul 2022 17:20:25 +0100
Message-ID: <CAELaAXydmSu5EvAnbvVUcHW9dv2EN8p-DvEuyufQzhrO_V4AMg@mail.gmail.com>
Subject: Re: [PATCH 01/18] block: Make blk_{pread,
 pwrite}() return 0 on success
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-ppc@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 John Snow <jsnow@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 qemu-riscv@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Stefan Weil <sw@weilnetz.de>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Denis V. Lunev" <den@openvz.org>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, 
 Greg Kurz <groug@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Bin Meng <bin.meng@windriver.com>, David Gibson <david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=afaria@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aM+szNz39iHx

On Mon, Jul 4, 2022 at 2:52 PM Hanna Reitz <hreitz@redhat.com> wrote:
> There are a couple of places where you decided to replace =E2=80=9C*len=
=E2=80=9D
> variables that used to store the return value by a plain =E2=80=9Cret=E2=
=80=9D. That
> seems good to me, given how these functions no longer return length
> values, but you haven=E2=80=99t done so consistently.  Below, I have note=
d
> places where this wasn=E2=80=99t done; I wonder why, but my R-b stands
> regardless of whether you change them too or not.

Thanks, this was just an oversight on my part. I'll fix it.

> > diff --git a/qemu-img.c b/qemu-img.c
> > index 4cf4d2423d..9d98ef63ac 100644
> > --- a/qemu-img.c
> > +++ b/qemu-img.c
> > @@ -5120,30 +5120,27 @@ static int img_dd(int argc, char **argv)
> >       in.buf =3D g_new(uint8_t, in.bsz);
> >
> >       for (out_pos =3D 0; in_pos < size; block_count++) {
> > -        int in_ret, out_ret;
> > +        int bytes, in_ret, out_ret;
> >
> > -        if (in_pos + in.bsz > size) {
> > -            in_ret =3D blk_pread(blk1, in_pos, in.buf, size - in_pos);
> > -        } else {
> > -            in_ret =3D blk_pread(blk1, in_pos, in.buf, in.bsz);
> > -        }
> > +        bytes =3D (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
> > +
> > +        in_ret =3D blk_pread(blk1, in_pos, in.buf, bytes);
> >           if (in_ret < 0) {
> >               error_report("error while reading from input image file: =
%s",
> >                            strerror(-in_ret));
> >               ret =3D -1;
> >               goto out;
> >           }
> > -        in_pos +=3D in_ret;
> > -
> > -        out_ret =3D blk_pwrite(blk2, out_pos, in.buf, in_ret, 0);
> > +        in_pos +=3D bytes;
> >
> > +        out_ret =3D blk_pwrite(blk2, out_pos, in.buf, bytes, 0);
> >           if (out_ret < 0) {
> >               error_report("error while writing to output image file: %=
s",
> >                            strerror(-out_ret));
> >               ret =3D -1;
> >               goto out;
> >           }
> > -        out_pos +=3D out_ret;
> > +        out_pos +=3D bytes;
> >       }
> >
> >   out:
>
> We could use this opportunity to drop in_ret and out_ret altogether (but
> we can also decide not to).

Dropping them sounds good to me.

Alberto

