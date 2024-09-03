Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1502911njf;
        Tue, 3 Sep 2024 09:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVWGVwA32kBSbGBm6RvP5LVYvRU3cz8MDUFlk20Tc+pIltVmLcu6UQ3wuhtmNu7MMQ/fYCNPKxkIAuleA==@linaro.org
X-Google-Smtp-Source: AGHT+IFxkz93A7c2UjRnvnQ+rAdqe7hYJpbNoDn2y7mD36BNoD5Fvw6/LF/F7XcI7WwCXO/b+xhM
X-Received: by 2002:a05:6122:3c8f:b0:4fc:eb15:b0f6 with SMTP id 71dfb90a1353d-500de193cdbmr3125936e0c.8.1725380143960;
        Tue, 03 Sep 2024 09:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725380143; cv=none;
        d=google.com; s=arc-20160816;
        b=E0wIUoWNYlbf3P5CEKRCrd8TqJPu0ThM645A2Hi0J02tSbbS8vVtcjwJtwYV/ZQD9L
         toe5rli1szctOn8NiggsqJg3psvGN5ImUS5H2CStYgYFQ3wKLmHPUV/Ue0kjBxvNmxmx
         VYz6feyixq6I4IGSsPvSVYz1xDvqJJ0L+fE8+y+9kqXReYBOF1Btc5xiZvosGgxN7vaN
         oVTA6cRnfqBj++pMvK7hTdcpyaaErHtH4TdbDjamRwNzWyD/ajOgXauzY9S1E4v1pLee
         MgZIE0INv2Ve8hn3XO5Mso4tNUwbbmAMEWDqlUFAyMbiaVqU3+5gJdV4TWIZr6nEKFqZ
         u4+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ykliaL/XK30BSEzZ2oj0js9SO5y8TWJz0kgfGbTOjRg=;
        fh=opgTvHQoky1RJeXC5tMRgWTwQIAayvL83mET9eMyDqg=;
        b=mvPQknXYa0nt2u2+dLA+LC9Oy9dXjCsH6u9r2cGCR/bYY9mkAdGILW/BmwBC+aqsNW
         8m6FUVT1dCMjOtMtJ4+iekLDgEDRNGM3CqXIleTUVvau1KNt25edp7NitY+mhuBE2JC5
         1E+Pa8NzsP4quDXdmQYifFSuplKjc9JJ8E2qIYxUEqzjqCv58fawzGPRJXV+jWN2rcMO
         ueL5oaXKYCxHheExvpEWMhn2orAqpD1QCJAWIbMt86uutACSwf/BuZnhcnTP0XL59GOo
         nSdfjGsJerzI61KzYeEHJHlTw3fMDkVKmcDO5CqvAFwAnnmgxLJu0JSvLhJg//2hozVQ
         PcHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zl0a0x7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5007123f206si3054209e0c.9.2024.09.03.09.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zl0a0x7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWAH-0006lR-BT; Tue, 03 Sep 2024 12:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slWA9-0005tl-R0; Tue, 03 Sep 2024 12:13:50 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slWA6-0003ff-28; Tue, 03 Sep 2024 12:13:48 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-714186ce2f2so4559606b3a.0; 
 Tue, 03 Sep 2024 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725380022; x=1725984822; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ykliaL/XK30BSEzZ2oj0js9SO5y8TWJz0kgfGbTOjRg=;
 b=Zl0a0x7TAg0zyRXUxadiOIOoQH7ZnRymPXIHO5CtMsvBXHZ1RQTeMAYMhEvHrU6/lv
 BzEEcJ+bcmLJW23XKausT27U+xumlb+YRNCqP3AMQvt3d4g9j/9PwNyaa0/wYGvNVBwg
 NZf/RxZx6qmU/s1IA1XHzgWhHQDaJ+z0MaP+B05GpVC5i5+L7UBsajXpkmh1cEAjWaZs
 //yfARfWuEvhM9B6qj1uis0AwLGvjxL8/gK5G2vsxca06kHLGlDvE4nCoZzzRHfBH378
 kZ9w5XPqRaJrVe2HGGdRIRP2OYWQAl2AFcfAfyD8jnd9rMlVZsy11P6FAzOS/Ku1wT0v
 yvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725380022; x=1725984822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ykliaL/XK30BSEzZ2oj0js9SO5y8TWJz0kgfGbTOjRg=;
 b=ARbBeYOmKIiCrasLibVQuoY1ePt/LHyvkenSYBtpMIXu2EjpxzNL+td9o9jhzvI5Us
 iyWMAgG0YHWMy9IuUwW4Gfa6qxPNo007EbNOBY6NxJKd0RcCtcQ6NtsIpAghhyiFjgcd
 CzcK191HOVoziu1rOxuKrzNEEOpriduEoIydZx+tCxO9O5kv3YcQ9X//7ePUrUjeCEy8
 d7sXKxDGi2Rc8nSkHqBBmo9FSQxKhcQiyWOuusrGIi5yRbUH/wshnaO1oZx8d3HrmBIh
 XGrV3GS2X/nS/xpXy6InUTIOpOykE9CQIitBTrNB8va1vbxz9SySQ7DvVHRihXG738DG
 tcDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh7xNwQfSfVXeXMHFS1fUBzGUR+putRD2eiALVsPEsZAaAuxdxJF8/1++1So3SMmEr4gPhOLlosw==@nongnu.org,
 AJvYcCVY3n8hT0vKbKvPV42a7gsGf+E6mUvzSwYh8CF9ORgLOBQ2W/Km9GRqbXNz6AFTjAj4IOagKm/TM5g+luKa@nongnu.org
X-Gm-Message-State: AOJu0YxIVHJRp8/5EtzCeWyus+u8HoePaSyzsUeYnxP3bHNcU1H02+P4
 IJST9AQVy9fl1UqwbL9rtW5AHg7PwlXakSfN8phLtzA1OEhCIzEkxEmwNvd8mfskDrQAdLzPNsp
 mhZkArYZmAVo2W6lgWPzE/WVtnXoEco4uaks=
X-Received: by 2002:a17:90b:1a8e:b0:2d8:8fe9:b00f with SMTP id
 98e67ed59e1d1-2da630e835emr2553551a91.13.1725380021572; Tue, 03 Sep 2024
 09:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <CAFEAcA-U5DpXysVoVQLAJzEKQ17TL82UiRXHH=q+chxwcubOJA@mail.gmail.com>
 <CA+1FSij0=6Zn_3HHq1njZgwjYDbopGe5ReUvjXkfHaD2_dCYzA@mail.gmail.com>
 <CAFEAcA_dprs9NhEZBd=BhMYwm4Aah7kRA_hhrbbh7Num4dH94A@mail.gmail.com>
In-Reply-To: <CAFEAcA_dprs9NhEZBd=BhMYwm4Aah7kRA_hhrbbh7Num4dH94A@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 18:13:05 +0200
Message-ID: <CA+1FSihVmn9PAQ=18-RfhJ5Gz3hMeVTLh4qqamf_FG94gCoFDg@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000049ddb20621395798"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=marietto2008@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
X-TUID: tlvswPdLbKEs

--00000000000049ddb20621395798
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was only an hypothesis :

https://pastebin.ubuntu.com/p/zjjgXf8xXM/

On Tue, Sep 3, 2024 at 5:56=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Tue, 3 Sept 2024 at 16:46, Mario Marietto <marietto2008@gmail.com>
> wrote:
> >
> > Nope,I don't need 9pfs. I'm trying to understand what parameter I had
> enabled when it worked. Is there a parameter to pass to enable the suppor=
t
> for "virtio-blk-pci" ? (as I said,I'm on the Jetson Nano now). Is
> virtio-blk-pci enabled by default ? If I should not enable anything relat=
ed
> to that,the last chance I have is to try qemu 5.1.0 instead of 5.0.
>
> virtio-blk-pci should be being built by default, and you seem
> to have multiple examples of commandlines and logs in this
> thread where it was working. So I'm confused about
> in what way you think it isn't working or isn't enabled.
> What error message are you getting?
>
> -- PMM
>


--=20
Mario.

--00000000000049ddb20621395798
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It was only an hypothesis :</div><div><br></div><div>=
<a href=3D"https://pastebin.ubuntu.com/p/zjjgXf8xXM/">https://pastebin.ubun=
tu.com/p/zjjgXf8xXM/</a></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2024 at 5:56=E2=80=AFPM Peter =
Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Tue, 3 Sept 2024 at 16:46, Mario Marietto &lt;<a href=3D"mailto:mar=
ietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Nope,I don&#39;t need 9pfs. I&#39;m trying to understand what paramete=
r I had enabled when it worked. Is there a parameter to pass to enable the =
support for &quot;virtio-blk-pci&quot; ? (as I said,I&#39;m on the Jetson N=
ano now). Is virtio-blk-pci enabled by default ? If I should not enable any=
thing related to that,the last chance I have is to try qemu 5.1.0 instead o=
f 5.0.<br>
<br>
virtio-blk-pci should be being built by default, and you seem<br>
to have multiple examples of commandlines and logs in this<br>
thread where it was working. So I&#39;m confused about<br>
in what way you think it isn&#39;t working or isn&#39;t enabled.<br>
What error message are you getting?<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--00000000000049ddb20621395798--
