Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3054605njd;
        Wed, 23 Apr 2025 07:03:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjguLNTxbb8pmZ8W43YDAWYxiTEsVHwLL8YkqncCpt7C5X9U7+tNNRy+VKtfhDOgI5qkQv+HDeJzMz0g==@linaro.org
X-Google-Smtp-Source: AGHT+IFdE5dw7MMmH71oYmBA7FwTWODyRR+t1LZMlx67TAyN3rm12GO37jjdIRX9XPClKanao1p5
X-Received: by 2002:a05:6512:15a4:b0:545:381:70a with SMTP id 2adb3069b0e04-54d6e62afc6mr5771140e87.15.1745417028954;
        Wed, 23 Apr 2025 07:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745417028; cv=none;
        d=google.com; s=arc-20240605;
        b=cms5A2vwpGgfrq8UQ+REzbAOqbRNPRjsHHfMTOytivtS/R3Ot1RhJf1qYedIvG0uzF
         ASMZwgrihncXMTPMkEsrlDIiMXMYxavxpwzMAwhKsMSAbaMnOIwOIeaWzrxJVKIMXgdA
         HqI6qB+mqmCn/KtsnAzBMNPOd7v3TW/k3fvFzWkuSR/sUWoMmJP656Y9n2UPMSd9NYLi
         5siBfD60DGoQlb9dE+uT8SGKtBSl66sXbticEnxnETnvM9h2PHtkXemTUMcsQrVZAm33
         5lAp0m9IBRe0do9UCvaItBk92EK2cWd7TBq5/WMKNk7ThjXhddSDtoxQWNRbZ9sNdspJ
         X//Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dmde6222cFgAKhSQtACGe2YpbOe2HQ7ONpMZDtRR7n4=;
        fh=xRv3rIOfbUymUlQB6ngFSMd8yJ4toB8gKKa/6MBdCUM=;
        b=bSn1XH5H93VUIIIwWreOfRc/2TM14c2Ql3kirB/aae0+SoMmt3dEbtPZqxJ9IKiyKX
         b/zxa0hYrppRnsWKjM5Q1ub53yegWqQk0tRc69SK8jJcbT7Tot60vsrKSJFtNj4LC35K
         rPOeY6MdEQ/CB/sfY4MYNxz+xUw6JhFlBZCNwhsWB2xavWGSq7v3EE7wvKeaMzO3hxG+
         eOBhBo12zyNX0r261+YuZsC8ytkSGurr9zZFJKGuNs6XQUvQwF1ULe+nFfb5Sq5zrw67
         taNKgulS+7r2ozgbYQnRtAN0VG9X0bXuwH7mOZHpHIdf6UFdbJWDoPHrBTYzaY7RmB7x
         4QRA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L6p/awb3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2adb3069b0e04-54d6e523f90si4751706e87.55.2025.04.23.07.03.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 07:03:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="L6p/awb3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7agm-0008Or-MS; Wed, 23 Apr 2025 10:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u7agi-0008NW-I1
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 10:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u7age-00070n-Iw
 for qemu-arm@nongnu.org; Wed, 23 Apr 2025 10:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745416968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dmde6222cFgAKhSQtACGe2YpbOe2HQ7ONpMZDtRR7n4=;
 b=L6p/awb3tZHcCvTz7wk07MvPuZv5WnVIAiibEmhc0PYGYdW8IKMdFIIjudmxZR8i5rTVDf
 uqNeGcAOcuCbC/x7/klpHsC/hVUi28UljWNYxc3Efx+04JflhtdT7TCBovB6xolA7Dn+bk
 cl0rNDqAGnPA2Lo9i43ItZxWkzGqtLg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-LpGoV_ZbNoKZYxatkFCzwA-1; Wed, 23 Apr 2025 10:02:41 -0400
X-MC-Unique: LpGoV_ZbNoKZYxatkFCzwA-1
X-Mimecast-MFC-AGG-ID: LpGoV_ZbNoKZYxatkFCzwA_1745416959
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43ce8f82e66so37023955e9.3
 for <qemu-arm@nongnu.org>; Wed, 23 Apr 2025 07:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745416959; x=1746021759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dmde6222cFgAKhSQtACGe2YpbOe2HQ7ONpMZDtRR7n4=;
 b=CnMr4flTWMIVZ/eYnQCe+F49cHsNPUGth71QG4LtI4IsTvgT9JIrqsgFqI32+VAONx
 +ENYUbk+TNMnC619CWfMb5UdEauj3RCeN2dqnKKXkuabjugcXQhH9eBKIeJ/AlUcRAgv
 LgtzLG0FEeLc07GrFEanpzDZf6hH4cde3b4/7DLFxSZBU5CGD57XSqS2gTu36HV4Q0TY
 PO6TThxlEAhR4d8/WPHkljxHBfvyh77lKvDx7nlPUrTCB40FMvST+uwlexDV2+588QSd
 iEmt4fmkmaE0P3TuEd7OOCm+Ct+33NPUTf477WGocN9gDi7lu5cJWgH4kDpR9LCwrh82
 O3tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWevHeGNxlDISru9T9Jtk8bhV3zmMLGZDKD41U1fV42u61yvPlayKnwcfpSkfVFO6DhAjkmBxgOw==@nongnu.org
X-Gm-Message-State: AOJu0YyA6a46Jk5pxQgAR/80wTXuneXmfveHVtz5np6iOTU2eBxr7rZ5
 Nhp2p4f2cTrjmsc6Yp8WgSnIJZ680fQDycRlVbKIgGBmoAdI2rVJhD/FDZExIug/gcQYR00XtmM
 eurv4geptMhP7oRAl/UJMhYfwf5fFsUuFSa2lUji/EaUcm47tY7KwGqcxC8PuRG4zD1vZnYcB5p
 u/0LmH0ISFhYmQJtn7FDm99Xz4
X-Gm-Gg: ASbGncuq8IDHVmgaNBVoVQ6+6S01y70Cf562EJoSLcKjdlEC0DQhudWODcZ2yQwqvRu
 q2vr5kccgsO6drLw6+hTPXEreiMMsKKMK3eykC/rX6rmoTsltTvG7niU6uzY0wdHXgHxv3w==
X-Received: by 2002:a05:600c:4690:b0:43d:17f1:2640 with SMTP id
 5b1f17b1804b1-4406ac0ed7emr160624475e9.26.1745416957663; 
 Wed, 23 Apr 2025 07:02:37 -0700 (PDT)
X-Received: by 2002:a05:600c:4690:b0:43d:17f1:2640 with SMTP id
 5b1f17b1804b1-4406ac0ed7emr160622395e9.26.1745416955580; Wed, 23 Apr 2025
 07:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250423100949.2047161-1-ben.dooks@codethink.co.uk>
 <275dd8a6-c4f7-47de-ac45-64612e14b8a7@redhat.com>
 <ee7e6775-9dd7-48b4-a5f3-9189b1386deb@codethink.co.uk>
In-Reply-To: <ee7e6775-9dd7-48b4-a5f3-9189b1386deb@codethink.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 23 Apr 2025 16:02:23 +0200
X-Gm-Features: ATxdqUFLzn0NKCyrCjhBBVA_N-b7QxsqYrQIfTMZHLryyfVCAsIKfEB-Z7gK2VI
Message-ID: <CABgObfay=FyP=nQKGReCRZgVL4HaDF4Lb8Gan9OACtJ4bVDbog@mail.gmail.com>
Subject: Re: [RFC PATCH] tcg: allow tb_flags to be larger than 32bit
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "Maydell, Peter" <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 brian.cain@oss.qualcomm.com, Helge Deller <deller@gmx.de>,
 Zhao Liu <zhao1.liu@intel.com>, 
 Song Gao <gaosong@loongson.cn>, Laurent Vivier <laurent@vivier.eu>, 
 "Iglesias, Edgar" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Jarno, Aurelien" <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 "zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 qemu-s390x <qemu-s390x@nongnu.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q_81mWShAJOqMzKbmHlHhLsT5iW3b-q32ZsQCltaTdo_1745416959
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009f72940633728dbf"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.294,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kx1lYR4l0UmC

--0000000000009f72940633728dbf
Content-Type: text/plain; charset="UTF-8"

Il mer 23 apr 2025, 15:54 Ben Dooks <ben.dooks@codethink.co.uk> ha scritto:

> > Leaving aside your patch I think you can improve the density of the
> > tbflags a bit too:
> >
> > - PM_MASK_ENABLED, PM_BASE_ENABLED and AXL are unused, which gives you
> > back 4 bits.
>
> Hmm, the PM_MASK_ENABLED, PM_BASE_ENABLED are also used by VMA and VTA
>

Ah, indeed they were reused without removing the old ones. So those are
out...

> - VLMUL == 4 is invalid, and you can use that to get rid of VILL

> - SEW reserves 3 bits, but TCG only supports 8/16/32/64; that could be
> > one more bit if you can live with the limitation
>

... and any of these two is the easiest in the short term if you need to
recoup one bit.

Paolo

> This is already 6 bits, but for FS and VS it may be efficient enough to
> > have just one bit (dirty vs. everything else): for all cases other than
> > dirty, REQUIRE_FPU and require_rv* can call a helper to look at the
> > actual MSTATUS and generate the exception if the extension is disabled;
> > then the caller always proceeds with translation into TCG ops(*).  The
> > overhead for the DISABLED/INITIAL/CLEAN cases is minimal and it gives
> > back 2 more bits.
> >
> > Finally, in many cases it makes sense to do a full TB flush when CSRs
> > change.  However I am not sure if this could be done for RISC-V, maybe
> > for the CFI enabled bits?
>
> I'll have a look at those, but for now I'm going back to 9.1
>
>
> > Thanks,
> >
> > Paolo
> >
> > (*) that is:
> >
> > static bool require_rvv(DisasContext *s)
> > {
> >      REQUIRE_EXT(s, RVV);
> >      if (!s->mstatus_vs_dirty) {
> >          gen_helper_require_rvv(tcg_env);
> >      }
> >      return true;
> > }
> >
> > static bool require_rvf(DisasContext *s)
> > {
> >      switch (s->sew) {
> >      case MO_16:
> >          if (!s->cfg_ptr->ext_zvfh) {
> >              return false;
> >          }
> >          break;
> >      case MO_32:
> >          if (s->cfg_ptr->ext_zve32f) {
> >              return false;
> >          }
> >          break;
> >      case MO_64:
> >          if (s->cfg_ptr->ext_zve64d) {
> >              return false;
> >          }
> >          break;
> >      default:
> >          return false;
> >      }
> >
> >      if (!s->mstatus_fs_dirty) {
> >          gen_helper_require_rvf(tcg_env);
> >      }
> >      return true;
> > }
> >
> >
>
>
> --
> Ben Dooks                               http://www.codethink.co.uk/
> Senior Engineer                         Codethink - Providing Genius
>
> https://www.codethink.co.uk/privacy.html
>
>

--0000000000009f72940633728dbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 23 apr 2025, 15:54 Ben Do=
oks &lt;<a href=3D"mailto:ben.dooks@codethink.co.uk">ben.dooks@codethink.co=
.uk</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">&gt; Leaving aside your patch I think you can improve the density o=
f the <br>
&gt; tbflags a bit too:<br>
&gt; <br>
&gt; - PM_MASK_ENABLED, PM_BASE_ENABLED and AXL are unused, which gives you=
 <br>
&gt; back 4 bits.<br>
<br>
Hmm, the PM_MASK_ENABLED, PM_BASE_ENABLED are also used by VMA and VTA<br><=
/blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ah, i=
ndeed they were reused without removing the old ones. So those are out...</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
 gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - VLMUL =3D=3D 4 is invalid, and you can use that to get rid of VILL</=
blockquote></div></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_qu=
ote_container"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; - SEW reserves 3 bits, but TCG only supports 8/16/32/64; that could be=
 <br>
&gt; one more bit if you can live with the limitation<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">... and any of these t=
wo is the easiest in the short term if you need to recoup one bit.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; This is already 6 bits, but for FS and VS it may be efficient enough t=
o <br>
&gt; have just one bit (dirty vs. everything else): for all cases other tha=
n <br>
&gt; dirty, REQUIRE_FPU and require_rv* can call a helper to look at the <b=
r>
&gt; actual MSTATUS and generate the exception if the extension is disabled=
; <br>
&gt; then the caller always proceeds with translation into TCG ops(*).=C2=
=A0 The <br>
&gt; overhead for the DISABLED/INITIAL/CLEAN cases is minimal and it gives =
<br>
&gt; back 2 more bits.<br>
&gt; <br>
&gt; Finally, in many cases it makes sense to do a full TB flush when CSRs<=
br>
&gt; change.=C2=A0 However I am not sure if this could be done for RISC-V, =
maybe <br>
&gt; for the CFI enabled bits?<br>
<br>
I&#39;ll have a look at those, but for now I&#39;m going back to 9.1<br>
<br>
<br>
&gt; Thanks,<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; (*) that is:<br>
&gt; <br>
&gt; static bool require_rvv(DisasContext *s)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 REQUIRE_EXT(s, RVV);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 if (!s-&gt;mstatus_vs_dirty) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_helper_require_rv=
v(tcg_env);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 return true;<br>
&gt; }<br>
&gt; <br>
&gt; static bool require_rvf(DisasContext *s)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 switch (s-&gt;sew) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 case MO_16:<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!s-&gt;cfg_ptr-&g=
t;ext_zvfh) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return false;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 case MO_32:<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (s-&gt;cfg_ptr-&gt=
;ext_zve32f) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return false;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 case MO_64:<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (s-&gt;cfg_ptr-&gt=
;ext_zve64d) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return false;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 default:<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 if (!s-&gt;mstatus_fs_dirty) {<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gen_helper_require_rv=
f(tcg_env);<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 }<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 return true;<br>
&gt; }<br>
&gt; <br>
&gt; <br>
<br>
<br>
-- <br>
Ben Dooks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.codethin=
k.co.uk/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://www.codeth=
ink.co.uk/</a><br>
Senior Engineer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Codethink - Providing Genius<br>
<br>
<a href=3D"https://www.codethink.co.uk/privacy.html" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://www.codethink.co.uk/privacy.html</a><br>
<br>
</blockquote></div></div></div>

--0000000000009f72940633728dbf--

