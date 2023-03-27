Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2066840ejb;
        Mon, 27 Mar 2023 10:13:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YoGq1yZHfc4X8F+qJ7ePYfnI+XoVWX0O4GHc8L3oR6epM1j6sXhohTByflDC1sj1M2X7Ao
X-Received: by 2002:ac8:59cf:0:b0:3e4:d889:bc64 with SMTP id f15-20020ac859cf000000b003e4d889bc64mr17457747qtf.5.1679937212680;
        Mon, 27 Mar 2023 10:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679937212; cv=none;
        d=google.com; s=arc-20160816;
        b=hTE0IwuFidZVNXIlDxHzf4z+0OYMx4j1/1hIjTBIw69zkCcPXpMHLFXEeJKV8776vt
         mGVIfhcHMggm19+RPznDsi2n2fsbEEzooKOmSvTn9OTA0+eTwJQ1X4PeqOfcOrSnZjkh
         sJPR/D09D6tbejmJQnUEfCS/E7zT3BQ45QPBICxfSAyDl0j8w1np9yqWS8Dow/fz5nQm
         eQvJrvWmuBXVGELoC2rrhEo5y/f3N0bz1uJChAHkxMq0miOJwS3mUZaMcl4ydMh4TWwU
         bETe8XsZf9s7m1RTIVJfRJAtHIWpGUExIBh35YMulunfT7SrticrL+7RxUeFzsuU+rAv
         fy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=a6UhbdcSfRciNpaU00Qv3gaD9lQ1xfIXxaXQ7/wsO9U=;
        b=0XHC0qQYkhZk8r3G+chH4IU0lp6p5PQOW+Wj1F5eHNoDJfAox2wiN24x6rFUQ8DhwK
         04ytuYyQmcnPCLggQOoD7mGaSB3GCNi3J8ynvWjx+K0tAD5R8eiYm44LePaSjeR+71xO
         itUhD6BK//u1R9yFWZ7EYSrfoVyVqsKLipBVLxuUGCBlDEKR9808awWZ+471w0nynTRT
         hfPp5iGQQoepAQnvUbi2O/4oVaecTHDGrJVDBaGcKKA0ZVmZDytOnRZohpu9n9RgX/ug
         qHqtPjfyV8KdyEe1HovKBXMYjhtOl9zGZxK+2EMmylho/BLcdz3E+SYe/5k8j1XR9C96
         H6Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pa5lqMDI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v29-20020a05622a189d00b003d6cdb3f764si4756844qtc.373.2023.03.27.10.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Mar 2023 10:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=pa5lqMDI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqPA-0000RC-48; Mon, 27 Mar 2023 13:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pgqP6-0000QZ-Tx
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:13:08 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pgqP5-00079w-6s
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:13:08 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so7846210wmq.4
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679937185;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a6UhbdcSfRciNpaU00Qv3gaD9lQ1xfIXxaXQ7/wsO9U=;
 b=pa5lqMDISqsrV31n27P/gSW+D9yGBp0V4VFHi2csDW/vwFfeH3xU2PcSavQCicdZhW
 pf9Ef/KrtYLfbUg0QvxD80/uu600BC/HzWgyg4OMZSzJqZwitgdUpJe5JgXz5LB18KOM
 bhLKTv6TFWrWvlFtwRJ3MNdj86x2aI3atT+fGCNgOfHnC/vYS0cfmtHbOhmzhZ2iKiuS
 QHH1VILyH8wWlfsqW2zzqrvZmlxCUeG5BXNZhW0RawR/pcHsDwewDXmglB7Bmiohw0bE
 lwwpqQRraGvnoIEO7B8r6qFwiC2+jIqrrIztmooV+AEWmqEqmJMP/QsX+ZS/4JS7hA5g
 i81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679937185;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6UhbdcSfRciNpaU00Qv3gaD9lQ1xfIXxaXQ7/wsO9U=;
 b=MPkcIxWbnXf9q/uEuVGxSZOC7H38oNST01YKR2hkxTW9qJ/vtcxxSG+MutzFQtIO+n
 HqnPnTr6t314A8J/cMWoQkhmypfOlXMPhVhOrtlR0b0JE/0vxbnIjKqNWZ98CtzH2RGw
 iR13bMQgfm52uObWXMd3oUijgpuCIyysYCT5Uzka0+Rj8wEr4WculcWrzLobty0JsJ2P
 25XQcK+ejlqHuaa7R/av14+VLOvMir6mNsyudAm13BVb49iabzZLYt5irYX0iOT6krIB
 SoglQGOm19Cs6GxEAHwNBAP46IJljZfG3hm9swJZ8NgcQ6Ik29kt6zVIlKB/n1QUdJPC
 PhLA==
X-Gm-Message-State: AO0yUKXhL3FAxZ1mKs/EdY00m5MuL0tKGguVXPV8oR2iLp6PxivaMI1j
 L4aM63aqPq61cuxND/a+Nsg9g7H66TLA4GGddqR5CA==
X-Received: by 2002:a1c:4c01:0:b0:3ed:a25d:8ae0 with SMTP id
 z1-20020a1c4c01000000b003eda25d8ae0mr2686578wmf.5.1679937185491; Mon, 27 Mar
 2023 10:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-3-wuhaotsh@google.com>
 <ZB+KK/RuLEOB6+c5@minyard.net>
In-Reply-To: <ZB+KK/RuLEOB6+c5@minyard.net>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 27 Mar 2023 10:12:52 -0700
Message-ID: <CAGcCb13qXsaRcs6t29OdT4y6=JLpwugxVKntzFpuUTUQ2NYqWw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] docs/specs: IPMI device emulation: main processor
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, peter.maydell@linaro.org
Content-Type: multipart/alternative; boundary="00000000000030098c05f7e4db70"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=wuhaotsh@google.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C3Sjo11QC42c

--00000000000030098c05f7e4db70
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you. I'll include the change in the next patch set when I refactor
patch v4 (which might take a while.)

On Sat, Mar 25, 2023 at 4:56=E2=80=AFPM Corey Minyard <minyard@acm.org> wro=
te:

> On Fri, Mar 24, 2023 at 04:08:59PM -0700, Hao Wu wrote:
> > From: Havard Skinnemoen <hskinnemoen@google.com>
> >
> > This document is an attempt to briefly document the existing IPMI
> > emulation support on the main processor. It provides the necessary
> > background for the BMC-side IPMI emulation proposed by the next patch.
> >
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> > +* An external BMC simulator or emulator, connected over a chardev
> > +  (``ipmi-bmc-extern``). `ipmi_sim
> > +  <
> https://sourceforge.net/p/openipmi/code/ci//master/tree/lanserv/README.ip=
mi_sim
> >`_
>
> Nit, you have a double slash above.
>
> Other than that, this does a good job of explaining things.  I'm good
> with these docs.
>
> -corey
>

--00000000000030098c05f7e4db70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you. I&#39;ll include the change in the next patch s=
et when I refactor patch v4 (which might take a while.)</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 25, 2023=
 at 4:56=E2=80=AFPM Corey Minyard &lt;<a href=3D"mailto:minyard@acm.org">mi=
nyard@acm.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On Fri, Mar 24, 2023 at 04:08:59PM -0700, Hao Wu wrote:<br>
&gt; From: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com" =
target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; <br>
&gt; This document is an attempt to briefly document the existing IPMI<br>
&gt; emulation support on the main processor. It provides the necessary<br>
&gt; background for the BMC-side IPMI emulation proposed by the next patch.=
<br>
&gt; <br>
&gt; Signed-off-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@goo=
gle.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt; +* An external BMC simulator or emulator, connected over a chardev<br>
&gt; +=C2=A0 (``ipmi-bmc-extern``). `ipmi_sim<br>
&gt; +=C2=A0 &lt;<a href=3D"https://sourceforge.net/p/openipmi/code/ci//mas=
ter/tree/lanserv/README.ipmi_sim" rel=3D"noreferrer" target=3D"_blank">http=
s://sourceforge.net/p/openipmi/code/ci//master/tree/lanserv/README.ipmi_sim=
</a>&gt;`_<br>
<br>
Nit, you have a double slash above.<br>
<br>
Other than that, this does a good job of explaining things.=C2=A0 I&#39;m g=
ood<br>
with these docs.<br>
<br>
-corey<br>
</blockquote></div>

--00000000000030098c05f7e4db70--
