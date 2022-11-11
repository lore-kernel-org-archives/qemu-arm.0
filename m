Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp925682ejx;
        Fri, 11 Nov 2022 06:43:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7saPjP3wXo/MbpVAsc/94+dblu6gEVYb6usfzGPrcqZ4pe7hiKHFhGEXhhAhZZVQn1UMUd
X-Received: by 2002:a37:80c6:0:b0:6fa:6cb2:f7b3 with SMTP id b189-20020a3780c6000000b006fa6cb2f7b3mr1287692qkd.418.1668177834505;
        Fri, 11 Nov 2022 06:43:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668177834; cv=none;
        d=google.com; s=arc-20160816;
        b=Ls6JXQfjSYGJOi3spgZcPjYHyiCOCWTA/v0MfvXfHsbmTEZM098I1Dcje/UuT7tkV9
         kBDDqDVFfQVgUcG+/67jXyZVfBih7sMNbCcpiaAkRu9no+XpG3c9K6zW9eK4Mr7oNQdC
         w/7ciiw0T2enqNM4XGRnOIHHLx3cq99tp7ZC9pnvsiKSCpj+D+phwMQyjWyoqH1UHM2t
         HGIzvj4gIZfql6Mcz1n8ySp614cthHlNtrs7srx7DJuQETW0SF9VWLA4WAKUwr/Igxav
         pOrRnNtiEwJmZbySXmNs0zpCy9ePh1s/Nz6DmyZ2AN/QNJa1C6shBqsbx6ZohkyFMDlF
         dltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=fL8tDnu81dSmhiIYDx4dm8lCdT03KsOtiGrd06z7xRs=;
        b=RAc8kdEPdJXiDaftwVLcgo5K47h5TVjSEpSgVHebUNPFWP6tzO8ke36GsJmB0OGHHT
         a5mOvYO9cytEpjId2uXkUEr4/phLvseYS5om4CpzMvxjNzvloUDFQk3o6+0Toq0E0TdQ
         4aV7pqL0s1UTiWsKV7Se34n/VKxQJJbCGAFlakke3ZoWqRO4MW4djI8m/JE/Oy+3QlM1
         kNLX9iXdc9f2CQxRj4IPw4t1VE/mSQ2PY1t/rE3zWoFXDpvagQYD6ogzCaMqBqM2lMAf
         CJI0s7aRT2Y2A5Vz1lleIgTODFZHA/xpu9lTxBmC1+KGrLTK3zfleGgWxvOSg6rl5yhR
         mvlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iH+0hwl8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a130-20020ae9e888000000b006f9f6aff5c3si1005750qkg.473.2022.11.11.06.43.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Nov 2022 06:43:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=iH+0hwl8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1otVG3-0001ni-5i; Fri, 11 Nov 2022 09:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkn20679@gmail.com>)
 id 1otQn5-0002In-GQ
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 04:57:39 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mkn20679@gmail.com>)
 id 1otQn3-0004Jz-Pn
 for qemu-arm@nongnu.org; Fri, 11 Nov 2022 04:57:39 -0500
Received: by mail-yb1-xb30.google.com with SMTP id g127so5362942ybg.8
 for <qemu-arm@nongnu.org>; Fri, 11 Nov 2022 01:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fL8tDnu81dSmhiIYDx4dm8lCdT03KsOtiGrd06z7xRs=;
 b=iH+0hwl8cf6d7hXZQE7ucLBDesQuoFS9EjKE1i6MBvdIs6vwVk0d2fyCP8xbyaC8dV
 Q/wKF2OHyTwtF5Vt/Us0RiUOzgM2R6Z8Wxo+PoDf7iUVutaTerPTKj4ybANEQlNs4DAq
 UjQavC94BbZA7N45d8LynjxPIm4DZniiwi6GIKnfLkUEtZZE4R3nInjLDrOOSZ1uGvs+
 ZKdzXQOUAUjeHt6oCzSKChqMid1gkhZM6fO72kgqA5ZH2A6isgCwdZjMAhFk4HK8+sFe
 KdIGpYx59Bvu0uLD0QRKgfF8KPPUnOsH684fePMX2p6tzgQcS/s2LnDzJuS+P9kKNnvK
 Jukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fL8tDnu81dSmhiIYDx4dm8lCdT03KsOtiGrd06z7xRs=;
 b=TqFZGNBBFb/JEMGu2a8VbepJ0/iRsuqyEmt4DrHNam34cJ+NcqbI5J/GcAvQ/NPE0a
 rW/VY+YsVUlAdFX0UmaYWAi9wM8WJa030DjdCxOU15XFSn3QtoJ2rvKSIgQtjgGoi67L
 b/uWLC0SxsNSbOwnBq9O8uJqaTiuwZ+DxQt0vSKPscKmz4KN1Iq9fU4VmHkp1uZv/fYc
 vRbTwXyKaqsnFE6kBJTP4r/7FzY5radHPFpdgWIOjLKOctJ9td2Oi2LOaH2o6/HyFaNR
 2H+YktMaZFdnSNBsYS/Ve7lSPmbk9b/lNfZTKuU3iMISThTrjHoa2WE5CjSLhrQt6RfD
 TBNg==
X-Gm-Message-State: ANoB5pmCeazc4d6+cQ5SN+CzjyXIyDyMGlwWw7GwM2akNEQSVS1SYEoT
 CyDdTkFSdviKRA28X0Z6GGROWGqiIttMNS5CfiQJO49u9eI=
X-Received: by 2002:a25:da85:0:b0:6dd:15b7:7a35 with SMTP id
 n127-20020a25da85000000b006dd15b77a35mr1105547ybf.180.1668160654397; Fri, 11
 Nov 2022 01:57:34 -0800 (PST)
MIME-Version: 1.0
From: Murali Krishna <mkn20679@gmail.com>
Date: Fri, 11 Nov 2022 15:31:38 +0530
Message-ID: <CAOYqR5ar9HkUc8YtDUu9jm5sb-gGziMxVg64xAxZJ8VP0N-L+g@mail.gmail.com>
Subject: How to check smx6-image-smarc-samx6i-20220928082148.rootfs on qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003bd90005ed2eeb90"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=mkn20679@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_IMAGE_ONLY_24=1.618,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_REMOTE_IMAGE=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 11 Nov 2022 09:43:42 -0500
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
X-TUID: wI21JSsV5+gK

--0000000000003bd90005ed2eeb90
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Greetings of the day,

I'm murali.
I have checked the Raspberry Pi image file (it is a disk image) on qemu.it's
working fine.
I have a complete rootfs image file of *Kontron Smarc-Samx6i*(Target
Hardware) with me.i need to test this image file on qemu.
I will share the link regarding the hardware board i.e.,my Target
Machine *Kontron Smarc-Samx6i.*
The following link will provide complete information about my target machine
https://www.kontron.com/en/products/smarc-samx6i/p89810.

I will also attach a file related to rootfs information.
Will you please suggest to me how to make it a successful run on qemu.

Thanks and Regards
Murali

 smx6-image-smarc-samx6i-20220928082148.rootfs.t...
<https://drive.google.com/file/d/1dNNAclwWgY3NII4h6qWwt-G8kfiKwcNQ/view?usp=drive_web>

--0000000000003bd90005ed2eeb90
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Greetings of the da=
y,</div><div><br></div><div>I&#39;m murali.</div><div>I have checked the Ra=
spberry Pi image file (it is a disk image) on <a href=3D"http://qemu.it">qe=
mu.it</a>&#39;s working fine.<br></div><div>I have a complete rootfs image =
file of <b>Kontron Smarc-Samx6i</b>(Target Hardware) with me.i need to test=
 this image file on qemu.</div><div>I will share the link regarding the har=
dware board i.e.,my Target <br><div>Machine <b>Kontron Smarc-Samx6i.</b></d=
iv><div><div>The following link will provide complete information about my =
target machine</div><div><a href=3D"https://www.kontron.com/en/products/sma=
rc-samx6i/p89810" target=3D"_blank">https://www.kontron.com/en/products/sma=
rc-samx6i/p89810</a>. <br></div><div><br></div><div>I will also attach a fi=
le related to rootfs information. <br></div><div>Will you please suggest to=
 me how to make it a successful run on qemu.</div><div><br></div><div>Thank=
s and Regards</div><div>Murali</div></div></div><div><br></div><div><div cl=
ass=3D"gmail_chip gmail_drive_chip" style=3D"width:396px;height:18px;max-he=
ight:18px;background-color:rgb(245,245,245);padding:5px;color:rgb(34,34,34)=
;font-family:arial;font-style:normal;font-weight:bold;font-size:13px;border=
:1px solid rgb(221,221,221);line-height:1"><a href=3D"https://drive.google.=
com/file/d/1dNNAclwWgY3NII4h6qWwt-G8kfiKwcNQ/view?usp=3Ddrive_web" target=
=3D"_blank" style=3D"display:inline-block;max-width:366px;overflow:hidden;t=
ext-overflow:ellipsis;white-space:nowrap;text-decoration:none;padding:1px 0=
;border:none" aria-label=3D"smx6-image-smarc-samx6i-20220928082148.rootfs.t=
..."><img style=3D"vertical-align: bottom; border: none;" src=3D"https://ss=
l.gstatic.com/docs/doclist/images/icon_10_generic_list.png">=C2=A0<span dir=
=3D"ltr" style=3D"color:rgb(17,85,204);text-decoration:none;vertical-align:=
bottom">smx6-image-smarc-samx6i-20220928082148.rootfs.t...</span></a><img s=
rc=3D"//ssl.gstatic.com/ui/v1/icons/common/x_8px.png" style=3D"opacity: 0.5=
5; cursor: pointer; float: right; position: relative; top: -1px; display: n=
one;"></div></div></div>

--0000000000003bd90005ed2eeb90--
