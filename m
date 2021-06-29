Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4915462lfg;
        Tue, 29 Jun 2021 05:59:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygwklX1+Ta/Ty4Z4jMNlTNKVONiEICRX+npKuE1rOG1E37iKn6zjpdFTbTqcdWuAaVVFEN
X-Received: by 2002:ab0:e05:: with SMTP id g5mr27067200uak.38.1624971591951;
        Tue, 29 Jun 2021 05:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624971591; cv=none;
        d=google.com; s=arc-20160816;
        b=vsOeEBLZRcpaBrJ8hRAo34rTf6Ud6eZn1Cde8ZNmjuRyYeVGRpzMtf3Yq0DSkPwo5m
         ahJy5zp+G1DRqEoIhHINQhx9ICCuMv9qptWP8Gtf/s0r3R+dz5iB74YD908qDPp2EjUd
         wn9a7k/xNcoeWe7o8WhsvJbsW+LvdmxxTMcJXDTPWMLvVcdXI50KcNRNkg5hP2e/t9g5
         AG0teC4mvclb7lZkFD3czI/S8nORkCikpAV99FmNpBMzvEYnSUUaGxcRlXgrewv+gIAW
         KgmlIPAlVoiehmKuJtUzcSOHOjStQ+AToqHFAYtlk7edDTizY9lGEmiWWZxSbdtrBycw
         35BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=+1meblHCn5HovDHR4BkkjDAljm1jqckgq23gCuU4iTs=;
        b=iKBUj2Bw5IE9OdZpgF0zTRL1VhuwDEkyVc7KoSmXCh1+p59eIeswZtD16imejlmWYC
         8daqACSdKowMz6YGRhI5SVB49MjP9mdGkqQBckDCLbmMYLGbuSIQOrq6D9BpJZEpLX2h
         +vK7WfPbhsdqKHGP13flUA7A6zBtKs2trvKRcAs7gux50WGtinG1dF0tNwCBgLEee7BQ
         +CLuv+C5qW3ExACiLA474FsAkkNcoBmmCZg0ZV0DgWUsIo5Y2DhUcUgALLp6t8oejSNb
         yHhJjKGuJMkl/zpCgK2XIHXamVSMc+IHTrwlnxTkJONH2Tys2miibGUfTrLUzL9Ez17o
         /OGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bnct0jGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si3990666vsf.21.2021.06.29.05.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 05:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bnct0jGP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyDLD-0007PX-6R
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 08:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uppadaravi2511@gmail.com>)
 id 1ly7Wr-00018e-Fk
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 02:47:29 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:33444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <uppadaravi2511@gmail.com>)
 id 1ly7Wp-0000nq-3R
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 02:47:29 -0400
Received: by mail-il1-x130.google.com with SMTP id z1so19958896ils.0
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 23:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+1meblHCn5HovDHR4BkkjDAljm1jqckgq23gCuU4iTs=;
 b=Bnct0jGPDmDkPCFCp1toCGDRae2EWPFQGnyX2AIm+dmEiGHOM21LNbxVgeBg/apNTW
 2C+HQlBnHnUO6J6jw64nA2Ie6UPVAx/zMLLsmNgKpgioyX5WoDWrN3XqOXo35YsDJwWP
 Yh3M25Whp2ZTaGNbyLux8ZAZnUA1YWYdslKcnrR1uJKXgRX7qqh/TbilKXE+WuOOaP7m
 BvoDnSnxvHP4qRu1W3IpXojA9eSkGRtnOnxdtpUFuS69GfPiJZqdxE4yE/Jw6GZtcU62
 CZsP2KgyNbSmpA08Tg8Qo9AMQjK9AGPkWFrvkODUfTxMcS5wGkcLn6YygacEOMxyv/vw
 I3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+1meblHCn5HovDHR4BkkjDAljm1jqckgq23gCuU4iTs=;
 b=cv8NxCk7xirgzpxUBTp/rsFPPP+2Q4bGwBJTPEJV9+5nXs82AenprUm/UiiI/E/IYt
 U+iJF+aCTbAai1ITOLJoYZrUYOsfJP2i3Ubxi2SAovcbPk2OB/0bxcUZzkOPYz/o98pV
 BWU/gleiYyaKYTQPq2jKeIU2ovIkyebHnQa1GURh4F1Ob+NuB2GYbPr8MEeb2b1dmsoF
 8aWk8AgjSCuNLDXwhw5EkQe3ZeVnkzQJRhvQkzHcVfVFD5u5aHJMyCDkd9TlTgBtx+Oo
 cdDcXWoRAJoPH9ODNBeD5ztrh7ELnQNU78JYZfdff6E860mjoLgqEhkQxgGSZrDemnl2
 NgMA==
X-Gm-Message-State: AOAM531+7BEhDncL3OXAZILVzsFQrGbDrVlPGR9u61KvdigjrXbUsUvW
 EfEphRjcL2rerTp6zVdGZxBvHlnbG/o/0nKnB9gGrBEVMuQSYA==
X-Received: by 2002:a05:6e02:1d16:: with SMTP id
 i22mr4093199ila.300.1624949242830; 
 Mon, 28 Jun 2021 23:47:22 -0700 (PDT)
MIME-Version: 1.0
From: U RAVI KUMAR <uppadaravi2511@gmail.com>
Date: Tue, 29 Jun 2021 12:17:12 +0530
Message-ID: <CACX=-dXGhsTKEws=+a1U+0OVupdWh4RFZa5UnwE1F8Be3qbA0A@mail.gmail.com>
Subject: Regarding USB-emulation
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000065a20705c5e1fa18"
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=uppadaravi2511@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 08:59:15 -0400
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
X-TUID: CPhlgUAKTQej

--00000000000065a20705c5e1fa18
Content-Type: text/plain; charset="UTF-8"

Hello,
Iam trying to emulate USB 3.0 on qemu-system-arm using
---------------------------------------------------------
-device qemu-xhci,id=xhci
-device usb-host, bus=xhci.0,hostdevice=/dev/bus/usb/004/003
---------------------------------------------------------
-device usb-host,vendorid=0x1234,productid=0x2345
---------------------------------------------------------
I have used the above above two commands using the command line.
But Iam not able to detect the USB inside the emulator.

source: https://qemu-project.gitlab.io/qemu/system/usb.htm
source: https://wiki.archlinux.org/title/QEMU#Pass-through_host_USB_device
Can anyone please suggest me the error, which i have committed. It would be
very much helpful.

With regards,
U RAVI KUMAR

--00000000000065a20705c5e1fa18
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>Iam trying to emulate USB 3.0 on qemu-system-ar=
m using=C2=A0</div><div>---------------------------------------------------=
------</div><div>-device qemu-xhci,id=3Dxhci</div><div>-device usb-host, bu=
s=3Dxhci.0,hostdevice=3D/dev/bus/usb/004/003</div><div>--------------------=
-------------------------------------</div><div>-device usb-host,vendorid=
=3D0x1234,productid=3D0x2345</div><div>------------------------------------=
---------------------</div><div>I have used the above above two commands us=
ing the command line.</div><div>But Iam not able to detect the USB inside t=
he emulator.</div><div><br></div><div>source: <a href=3D"https://qemu-proje=
ct.gitlab.io/qemu/system/usb.htm">https://qemu-project.gitlab.io/qemu/syste=
m/usb.htm</a></div><div>source: <a href=3D"https://wiki.archlinux.org/title=
/QEMU#Pass-through_host_USB_device">https://wiki.archlinux.org/title/QEMU#P=
ass-through_host_USB_device</a><br></div><div>Can anyone please suggest me =
the error, which i have committed. It would be very much helpful.</div><div=
><br></div><div>With regards,</div><div>U RAVI KUMAR</div></div>

--00000000000065a20705c5e1fa18--
