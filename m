Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2416850lfy;
        Mon, 24 Aug 2020 02:45:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNzvUKLu2cWx33vF9gXTV+5g2BepTiAZfQ3rCI84yIPGWapNMQ7wPfcgKJure3FMjwgNE/
X-Received: by 2002:a25:8491:: with SMTP id v17mr6663697ybk.227.1598262344557;
        Mon, 24 Aug 2020 02:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598262344; cv=none;
        d=google.com; s=arc-20160816;
        b=fh0X8T73mtTWYP+qD6zB0RqIzJtrAMf/ZA+oawIPu+7Am85c1ULky1stV4W50+8B8D
         BI73HZkIoM3uA/7R0ej3KMYFzbHyL8kNLsCkwJ3/0xLplkm9vvz234uvCLVEWyKe1nmp
         COS6gmAC08mgPB/Oi5VjCB+Abr0GOm5rlnga3GkHOdIvqoQVcxEj5Al/qzaZNGwjoMh6
         hNSAQOeACVgQDT0jo1K6sIfDTpEDCks9xZMUo4JuIFULei3vyu+8N28wgrizww/DDVHN
         OYFdJ8I1VmA1yOtA+RUTfk+eeF9kDZHoYB+eJO9uBvPnQso4ITt53s767YhOnVFqOuru
         b2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:references
         :mime-version:subject:message-id:to:from:date:dkim-signature;
        bh=HoZhI0kIZxAvkPDgQ94jYzlF/jeYps9/DDuI3w9Qsbg=;
        b=gS/V9KcCodMS8bC89YIBrZq89nZnKFy6yzBfVbnx1TK17W8Dj+FG70mczQmLNVmeTq
         tESnkLKZ/MJ4rehhQrdgT/QvfttKZHGWzmEhgKQ6ezdjNrxVchAcx2Kl2uNtNfHzRIRT
         4XPLHdA+nOxVTWw1UM1VT7LhwnBc181RY2aYSEAVJzaZM9Lgbvn+ndiWImxPxwAJ//+G
         c0w34PQSXIWvlg+9iaAWfg6/g7U4wc7DgN/IeIYX4rrneUEkKgEjtqOp3Ozz+HuExTVb
         vlZFAY96vLu5ccoeOHqmTntDe4fiwSaRvHrrqMneI55CfvztT0rWExxOs/Bi70BVZPhk
         Q8Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=aAK9kvhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11si10787544ybp.143.2020.08.24.02.45.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 02:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yahoo.com header.s=s2048 header.b=aAK9kvhf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=yahoo.com
Received: from localhost ([::1]:55634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kA92t-00046Z-VZ
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 05:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1kA92m-000466-Ul
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 05:45:36 -0400
Received: from sonic315-22.consmr.mail.ne1.yahoo.com ([66.163.190.148]:41122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cociuba_mircea@yahoo.com>)
 id 1kA92k-0004Uu-7y
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 05:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1598262329; bh=HoZhI0kIZxAvkPDgQ94jYzlF/jeYps9/DDuI3w9Qsbg=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=aAK9kvhf6sFAwXTfVzhz1sQe7GVP0Sxe8sLyY5T9a/2kG+1BTvs1hMzAiJH5mTJPTgOu4eqhLG+Jc8JibPJGWhP9dE/CVn9iCHNgd3BnXMtVsqpi9HX0hLKNTsC6+/9YkAtGiBgbt/cqCJJXPQy3O0jtuDFGXF2RrIu9EhpcNI3aJMGgOJMdtyv/SeMtUJEoz01FhUJO18folQEgudnzrCF+c43u2c4UZAwVicdeVbvAOqP/IOA9ijtWxLqCYoEX9cMZjMzFTGwxhwIR85aG5sDQL7hmfXPBqVn3Sh2l7idMtLOt8j+SpbWGSnY4QeNtaFPGDazeMH49q5L+6ug+6w==
X-YMail-OSG: of83wyoVM1li.xn3LFc_yGFRgqvtuXAktT8DjxMDj1RxA3BswkOmic.ireHYzDT
 UIqS_LSoaQocsyD4wubz8HQVVqRLl8EEprpngsULRLgIyhjvcJLk.g6r0aL.vnTgu.kKmX32kxgQ
 3WlY6_HXILqFbV19lh7hwa55q3cYlex3CByp9vE1_6fD8A8Ugg6pcV3zFMsGWa5SY_m9PxaaxRDX
 clo_xOtKI6LQifw8z_RQlY3UDgXUBVfi7WmykbVrEkM5zBHu7p4zZXqN5hrbZ7mDqfE0bpoXguYm
 JiOTbxkbTHkal0KwOzCDYiOuoiRAtyauZtf9VwfA.JMcwwx_d7PR6R1TdTmfUdW8Vhyb1p97rbtA
 JFrhlH9Y8EvuHrW4V0xclTwAuJdwbBnx6T5hyFYBC3HR01vJFqP4K__h9kTIGzZY3ghTJZwPt.5G
 qo_xqJiIvbjzwQaoqRbysngYZldVhfOKTKtVQFjOWPW.q.pPNefXi5ZW.6n6PcXV9K6pBcdu6DKq
 YFEFVOzBuNhQaLmBExFdP34IhAuWoeQBaoIwtNRIOAJbYSqxOcFOUjKntM.2awVkFWc7ftQzKFeM
 _hlU73Km3oBAE7VuOxg.NtAay314RcCVkXk0P2fXs2qBEqZFl0nW7P4Ii.1GRPrAjaOrvq1eTgPw
 ait1GwtybvXoizgNWPQG2LTzp.LMpQ2BNhvhjroSGUBYDiULCB8EP_IEiMoTl3yQSAmBz.4E_vdq
 lNpsb6p2v5apnWZHgvzs4YuII6bWA6_8XW1jA7twN4f2zIKdNLeB0iIlWYv0wkqYK79Lkz8BAo45
 0FUrqOg2MixKZe89tNT_ZuSlZx8yR7r9bwFIEMsUVjsqZgGIMa2F5GLGMDFJRJfn5TsyceTdKdR_
 igjMvNJYSAs0PSit9kxpQVLW_.KCUTylYQJ0A0UOSRJ3IKMdX74FTvJap.SeEGAgD6Qv2besxPKr
 .JMG8ruS3rpUCPp1ULZFFv.RYYQuYnILNjqsSLqyBDuNRQe7xhmt5e69T.9cikzOuz.rHpuVc744
 LFdCONkDxf3zzQy1dfp9irqafr0b0j6hH8zhVwGGr.OEhUbASFngWZ0hx.2tUg_v71rg9OLKAJEB
 PC7qX6cJ4NDw58rEcn8oV_ahiFAq3r3ZHOF0qSWkXrVjXJvyM3FJsv6155qIMP6K4fZqh.xcBA6I
 s5Sww5XGqxVIZXk1MfMBxvQQB7DhJkxyZAQdS90hvO0DvmUWsp_HTm00BYnHXEApPCe_wpiqf1r2
 uWmIzWISQakpGr57.VrdbbFqwTNzD1Bgirly_AFf9CqR9dw61bpWJ6mkId3WaQ5WZ0drV4xk1ENz
 4pMTzPWkk17FjDwAcfdSkXKQc5CcJ66wNgPexI7O8CkCbhVJcJCqpT0sW4Oqfqrm9wD3nhTkXhTQ
 tyb1QLwUSPTklCT0QP_Vi5AhU5y4Bm_q_Z341ONoWDFKsuXPlRjQ4Ke8e6qIWMAnvirox
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Mon, 24 Aug 2020 09:45:29 +0000
Date: Mon, 24 Aug 2020 09:45:27 +0000 (UTC)
From: Mircea Cociuba <cociuba_mircea@yahoo.com>
To: Qemu-arm <qemu-arm@nongnu.org>
Message-ID: <554074341.6540650.1598262327794@mail.yahoo.com>
Subject: [QEMU]send key event from monitor
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_6540649_188856408.1598262327793"
References: <554074341.6540650.1598262327794.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16455 YMailNorrin Mozilla/5.0 (Windows NT 10.0; Win64;
 x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135
 Safari/537.36
Received-SPF: pass client-ip=66.163.190.148;
 envelope-from=cociuba_mircea@yahoo.com;
 helo=sonic315-22.consmr.mail.ne1.yahoo.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 05:45:29
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eWrjXcwxaQeQ

------=_Part_6540649_188856408.1598262327793
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello guys again,
Basicaly I have a running arm cortex m4 with FPU enabled, all good an' well=
.I wrote a small echo server, whatever I type I get back, simple, right?it =
works in the same console(I type 's', I get 's' back). Using the UART of th=
e device.
When connecting the monitor( I just added this:=C2=A0-monitor telnet:127.0.=
0.1:55555,server,nowait)using telnet, I use the sendkey command(It says in =
the monitor it emulates sending keyboard events)The problem, when I send th=
e command, the echo server does not get it(not present in the UART register=
)I checked it with gdb, the command never reaches the running bare-metal pr=
ogram.
Must I append something else to get the thing to work?
Br,=C2=A0Mircea Cociuba"To be or not to be, that is not a question, it's FF=
".
------=_Part_6540649_188856408.1598262327793
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpf1f22274yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div dir=3D"ltr" data-setdir=3D"false">Hello guys again,</div><div dir=
=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"fa=
lse">Basicaly I have a running arm cortex m4 with FPU enabled, all good an'=
 well.</div><div dir=3D"ltr" data-setdir=3D"false">I wrote a small echo ser=
ver, whatever I type I get back, simple, right?</div><div dir=3D"ltr" data-=
setdir=3D"false">it works in the same console(I type 's', I get 's' back). =
Using the UART of the device.</div><div dir=3D"ltr" data-setdir=3D"false"><=
br></div><div dir=3D"ltr" data-setdir=3D"false">When connecting the monitor=
( I just added this:&nbsp;<b>-monitor telnet:127.0.0.1:55555,server,nowait<=
/b>)</div><div dir=3D"ltr" data-setdir=3D"false">using telnet, I use the <b=
>sendkey </b>command(It says in the monitor it emulates sending keyboard ev=
ents)</div><div dir=3D"ltr" data-setdir=3D"false">The problem, when I send =
the command, the echo server does not get it(not present in the UART regist=
er)</div><div dir=3D"ltr" data-setdir=3D"false">I checked it with gdb, the =
command never reaches the running bare-metal program.</div><div dir=3D"ltr"=
 data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">Mus=
t I append something else to get the thing to work?</div><div dir=3D"ltr" d=
ata-setdir=3D"false"><span><br></span></div><div dir=3D"ltr" data-setdir=3D=
"false">Br,&nbsp;</div><div class=3D"ydpf1f22274signature"><div class=3D"yd=
pf1f22274yiv5090244957signature" id=3D"ydpf1f22274yiv5090244957yui_3_16_0_y=
m19_1_1484384922228_11432" style=3D"font-family:HelveticaNeue,;font-size:14=
px;"><i id=3D"ydpf1f22274yiv5090244957yui_3_16_0_ym19_1_1484384922228_11431=
"><font class=3D"ydpf1f22274yiv5090244957Apple-style-span" face=3D"'times n=
ew roman', 'new york', times, serif" id=3D"ydpf1f22274yiv5090244957yui_3_16=
_0_ym19_1_1484384922228_11430">Mircea Cociuba</font></i></div><div class=3D=
"ydpf1f22274yiv5090244957signature" id=3D"ydpf1f22274yiv5090244957yui_3_16_=
0_ym19_1_1484384922228_11432" style=3D"font-family:HelveticaNeue,;font-size=
:14px;"><i id=3D"ydpf1f22274yiv5090244957yui_3_16_0_ym19_1_1484384922228_11=
474"><font class=3D"ydpf1f22274yiv5090244957Apple-style-span" face=3D"'time=
s new roman', 'new york', times, serif" id=3D"ydpf1f22274yiv5090244957yui_3=
_16_0_ym19_1_1484384922228_11473">"To be or not to be, that is not a questi=
on, it's FF".</font></i></div></div></div></body></html>
------=_Part_6540649_188856408.1598262327793--
