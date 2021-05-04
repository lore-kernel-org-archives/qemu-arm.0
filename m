Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4023126lfg;
        Tue, 4 May 2021 15:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSbqOHehmRHOh3z3ZM3nS0x6801W55ooPsTudmUHXAmVkGQZsIIeIatqgby7GW2Qbg9sqT
X-Received: by 2002:a05:6602:2e82:: with SMTP id m2mr17437861iow.190.1620167100758;
        Tue, 04 May 2021 15:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620167100; cv=none;
        d=google.com; s=arc-20160816;
        b=vJToVfsFHMRHh5EgKjL/6/DESYle96PPqInp1pG4MOboTc9/8UoLtWWCK2cRcV5M8b
         YPQvS7r6uqbRD+yFUqDQAaKCvYS7n9qldGWRO2duUoHK248ofEJLO4NBTEjaFtCVcmfo
         OT+yjLyIbExwQVtIG/TQTLJKq0O18q7pSLAEhT1aIV2840F/29dbe2H3/MIQqH0k9lUC
         CAPgup+nSlrhon4lzUUc3tHt2MdGMJAswrS7UJTs7KLxjXAT0VOJqW+YN7lPb6F0TKvu
         Y0b8ZJXIRMErSHvUmZtXbNBI7DRw61JGKBdFv1SxPtpCaMf4yThD4FNfK8u1x+0jRs2M
         JoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=8zEqvDLOQGUmEELDITcdacfTRB4e5sHxkcSSlGPcXtI=;
        b=pbSrSm5VMRNNC3E9LXnPo+8beaiQY5irfkgT6IVXlCSAB7RIeQNoUBzHXAUnZhCRm7
         DVK6ViQgbUocxu+P1vCIAA/Wa52j15i9bU1Ij3MK0p5t2hgNb4nbC67TmueqSMRJsRnz
         G3jTxQat9Q6SnrQ0BZd/r6/ZWi+Fz+g+zIv9w3lwRXlX/DcgjJV0ucbwRt/y7+Z4V4NC
         6yitkOKR2lasVfUGk9B1W0LZlOEknEuQ+Yw0VaPxEM193GRaM4PqJfzA56bvt1Gs3NVZ
         OflLz1pgDg2VpFwn62sJyoHoEH6ZAikf6t4MXWGe+8oFYVj7kmtLEkKGSQIuzeLJFoSf
         bLtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XkJQXJYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si17489007ile.154.2021.05.04.15.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 May 2021 15:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=XkJQXJYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1le3TQ-0005OZ-4W
	for alex.bennee@linaro.org; Tue, 04 May 2021 18:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ovidiu.s.nastai@gmail.com>)
 id 1le1wa-0001E9-Ho
 for qemu-arm@nongnu.org; Tue, 04 May 2021 16:47:00 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:36806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ovidiu.s.nastai@gmail.com>)
 id 1le1wX-0003P5-C4
 for qemu-arm@nongnu.org; Tue, 04 May 2021 16:47:00 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 n32-20020a9d1ea30000b02902a53d6ad4bdso9499879otn.3
 for <qemu-arm@nongnu.org>; Tue, 04 May 2021 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8zEqvDLOQGUmEELDITcdacfTRB4e5sHxkcSSlGPcXtI=;
 b=XkJQXJYVq/LxzD4+baOGciK7OP9RWg9HhdOREppCINGMR9lzpXASsSgpH8JUqmAUID
 CQBnHRN03rWIuMeRtQbLlHECJfz2loAVPghzIr+NDul8UUssZfGsfUdzQ1cxSNo8RtWh
 e6Lar7twMPyl9IEAWMfttWsPnRossFoJGBxl6jXNls8xu+0FsmzZuIRCdCkGuu6Ojgf0
 sZP2PMiHKjWh73NTvyPkFUrOrFlDjH5LPsf84D5+ZOH9s0r/aqsFNqRImrcc4Du/SsL4
 BJGQAhFw8AKGykNNKSLL60dkuOsvEEvyxPM6lgFz4RWV4E/rmcakdCnq6dEXr74CKFRA
 jOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8zEqvDLOQGUmEELDITcdacfTRB4e5sHxkcSSlGPcXtI=;
 b=sqK7bb2DEn6AttbNs6S/PEwV5KSwFvQJBNfzsj3nRtvtCrk7vhJOwpCEhyiqUsr7K8
 Iy1uKZAIuVljQ0gB4iSnY1K/GyiInhxgPfxje2pW3hAoWnoZMiEZ/AvdhgHld00AD5Gg
 A3ny3Q0JmuAgvaWU+eKCOijNHtzCpRM/JzksemvyJoLGhP1ZOlFxot+aI/iEhwzpjUar
 bDQ9WJqu/IuFkGp1l57Gyw57ZZUaIS1Pvw0SETKT7qlgSdO0feB/t5tbYM1knKGbMa1D
 97FKmvQBLhbju4l4uVQ0dWyWSLEpTdUyJIwPvANKydOmYqjvb2MkPj9haxHbYajClXtW
 jzRA==
X-Gm-Message-State: AOAM530GMtfupSwwYjoXu6qbE93WP8WLf1c7LWFKoTWavIyUt0BIDWiV
 BBPuGyb80XNdE9OLbbOpv72rjvgyPIckgbdf31q0F0+hbSODwg==
X-Received: by 2002:a9d:2f04:: with SMTP id h4mr21227523otb.364.1620161215252; 
 Tue, 04 May 2021 13:46:55 -0700 (PDT)
MIME-Version: 1.0
From: ovidiu nastai <ovidiu.s.nastai@gmail.com>
Date: Tue, 4 May 2021 16:46:21 -0400
Message-ID: <CAA5qdn1D5DMfqdQhG+p26F7cVx=Qy4GstRDqfCrJgbE62yi_Hw@mail.gmail.com>
Subject: AArch64 code running on QEMU ...
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b6cad205c1872dcc"
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=ovidiu.s.nastai@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 May 2021 18:24:53 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Mp3a12B4WvN

--000000000000b6cad205c1872dcc
Content-Type: text/plain; charset="UTF-8"

Hi,
Please help me with this, I am new to QEMU: I need to run some AArch64
code, to verify functional correctness, and code generation. The code
sources will be mainly high-level syntax (C/C++), then I'll disassemble and
inspect.
Question: can I run AArch64 sources on QEMU, that's it, on a x86-64 host
machine, or, I need an AArch64 host for QEMU, to start with.

I saw this "For example, the aarch64 CPU feature, which, when disabled,
enables the optional AArch32 CPU feature, is only supported when using the
KVM accelerator and when running on a host CPU type that supports the
feature. " at "
https://qemu-project.gitlab.io/qemu/system/arm/cpu-features.html", and need
to understand that, before deciding about the tools I will use.

Thanks,
ovi

--000000000000b6cad205c1872dcc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>Please help me with this, I am new to QEMU: I need=
 to run some AArch64 code, to verify functional correctness, and code gener=
ation. The code sources will be mainly high-level syntax (C/C++), then I&#3=
9;ll disassemble and inspect.</div><div>Question: can I run AArch64 sources=
 on QEMU, that&#39;s it, on a x86-64 host machine, or, I need an AArch64 ho=
st for QEMU, to start with.=C2=A0</div><div><br></div><div>I saw this &quot=
;<span style=3D"color:rgb(62,67,73);font-family:&quot;goudy old style&quot;=
,&quot;minion pro&quot;,&quot;bell mt&quot;,Georgia,&quot;Hiragino Mincho P=
ro&quot;,serif;font-size:17px">For example, the=C2=A0</span><cite style=3D"=
color:rgb(62,67,73);font-family:&quot;goudy old style&quot;,&quot;minion pr=
o&quot;,&quot;bell mt&quot;,Georgia,&quot;Hiragino Mincho Pro&quot;,serif;f=
ont-size:17px">aarch64</cite><span style=3D"color:rgb(62,67,73);font-family=
:&quot;goudy old style&quot;,&quot;minion pro&quot;,&quot;bell mt&quot;,Geo=
rgia,&quot;Hiragino Mincho Pro&quot;,serif;font-size:17px">=C2=A0CPU featur=
e, which, when disabled, enables the optional AArch32 CPU feature, is only =
supported when using the KVM accelerator and when running on a host CPU typ=
e that supports the feature.=C2=A0</span>&quot; at &quot;<a href=3D"https:/=
/qemu-project.gitlab.io/qemu/system/arm/cpu-features.html">https://qemu-pro=
ject.gitlab.io/qemu/system/arm/cpu-features.html</a>&quot;, and need to und=
erstand=C2=A0that, before deciding about the tools I will use.</div><div><b=
r></div><div>Thanks,</div><div>ovi</div><div><br></div></div>

--000000000000b6cad205c1872dcc--
