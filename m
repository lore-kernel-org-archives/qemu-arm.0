Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp9988002wrx;
        Mon, 25 Feb 2019 06:22:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZNjJ5tv3oegoxF/5oSFGPf4/oAF7cuTC4xGqz87WnsxFt+Q/B3/4T54PRHVNvLw4BLn+3m
X-Received: by 2002:a81:48cf:: with SMTP id v198mr14060467ywa.61.1551104529432;
        Mon, 25 Feb 2019 06:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551104529; cv=none;
        d=google.com; s=arc-20160816;
        b=LGWMI5TFH1/PMf0AiUY84EnrI3FIAdOU7EfOltk3rhcunLyzIlvuMIJuIHwzz4EWHr
         u25o6j8vbxTsNrhIR6bOH1qHIKsEaPsgpvVJw1OIzMGZIxp1dmZagYSDwW0LEZdv7cF0
         bJNvRU0SfduCdjL63RQFb/t42ep3WFVYbXxlCdqwxtaaQSEsfW/9Ma4pHyJHHL8XuXDj
         CaCjY5Onw5BI+sg6tQF/ASsOFXhBwkOSBPKQM3wgKYBzovtl1+hUvx79tMKalvUDjAYw
         5iljlplIyq/x85VoaAJ5QAJgfu13E+iswsGWXa1H8kA4iiyZMSaN26i1oZpS3f3WgWeE
         iTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature;
        bh=uzvBVlJgI3QtURyw6DOawuKxsuKTj9E5ep8VXNspclQ=;
        b=N7qymlvhjklgldnC8Nai4vaR86om2my5B46UMNU67elNIMCqjtaToVaFrrd547+2yC
         TkUpJJgyOLaVYQYDA0xSF/ir5fW7BYe3Thz7TT+e+2C+Jg5GC6BF2iPLR6yhHsZVIWh3
         cEr8m8c+PhQ9NYXoY3dJO3FRBOPzoYh86Sj1xeZCKwkTVJs3nMvtaXCOFww9OID+x639
         KG9Cja00ifN/VC0tMDGob+HmwAVp/17nJEpUHmq74RTW6p0a44WnC53UCgZfWDD5FXny
         M/SuThGH2KulRtS/TIlCcfhjPO8UlUQlpNGD/BWfHXPUtsMDv6bTzFPXyZAvFt7MoGS1
         466A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@hexatier-com.20150623.gappssmtp.com header.s=20150623 header.b=M9KPe3Fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h127si5207349ywb.216.2019.02.25.06.22.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Feb 2019 06:22:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hexatier-com.20150623.gappssmtp.com header.s=20150623 header.b=M9KPe3Fr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:38182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyH8y-0005uS-TS
	for alex.bennee@linaro.org; Mon, 25 Feb 2019 09:22:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benny.baraz@greensql.com>) id 1gyGOe-0002dY-3y
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 08:34:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benny.baraz@greensql.com>) id 1gyGOd-0007ST-Av
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 08:34:16 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <benny.baraz@greensql.com>)
	id 1gyGOc-0007R9-T1
	for qemu-arm@nongnu.org; Mon, 25 Feb 2019 08:34:15 -0500
Received: by mail-qt1-x82a.google.com with SMTP id w4so10445736qtc.1
	for <qemu-arm@nongnu.org>; Mon, 25 Feb 2019 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=hexatier-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=uzvBVlJgI3QtURyw6DOawuKxsuKTj9E5ep8VXNspclQ=;
	b=M9KPe3Frt9DTQ86rKhtBzkJ5k7WfeIQsjgWgiKH8HKIpQKjNLQW/hm5t4lO2At3wIx
	yoIs10L6L1dGrVS2wTEz/afUCDF2RwEdwBh9LD7qo70ouvUyRoCuEnbPsfflAbluBXRD
	EE/H34ROsqP4pI2Y3dIPo2rne0UyRDuhvdqJJgqfATSijQxW2vp7Qe89tg3LTkIoCEig
	rGglJDkFowR1SW51JYvpLK5abb3jkjtXgvhvmbN3+7eXxB6nZoYJ/1pKJ0CcxIOBwIyT
	OkLGOzdOfE4a6NOFc3twnzmjVD5WLSnbCbZIb5O9Gu8qdMGTlBFOJm8OGYXr7CDcSzd1
	VUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=uzvBVlJgI3QtURyw6DOawuKxsuKTj9E5ep8VXNspclQ=;
	b=o2a5hjZ6A7z4ZF+9bF9djgPqp3hAOcuQeZ9YFoCCbcDQN7x/sUs0ykwnjhD0150umS
	+VVFA88SnQogpsq3BjOUg4s0EBhS/6szG2wSy5D9zd8o8hzn3Bt7zKrKhkm5fufR3nXv
	PXkUNPs23Th0hvhgbONUOKPxifxm9tvwlr4ZjbjE4gjbI3xsBTu7TQGWwebx/j8FgiCA
	CSxj59iAXNNeNP9aZaR2bf6uTtDrH64lRikOMTqI93ljzdNFGqrh3VIQH5eK9lDQxaL1
	ECWSkYyrh1E5FCbo1DHuiwrM5uftrBwSGNpGshpkioP+T/IfaJgtV7aRrhsVPfLC78KD
	OlDw==
X-Gm-Message-State: AHQUAuaE2tR2EXk0xJufjprhLVh0xJGCOaMGttN86XPXLnpemnJOo5qy
	LhuqNyOHVku/O2JxYzwZCM8KpbD8GHXjGRQb+OFVsww1KRyd5w==
X-Received: by 2002:ac8:2e70:: with SMTP id s45mr13549968qta.376.1551101653682;
	Mon, 25 Feb 2019 05:34:13 -0800 (PST)
MIME-Version: 1.0
From: Benny Baraz <benny.baraz@hexatier.com>
Date: Mon, 25 Feb 2019 15:34:03 +0200
Message-ID: <CADdcL-_-VpubFVB74kac+HW1HopiKhSKfWsLypNafka1BV=hrg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000142d3e0582b7ffaa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::82a
X-Mailman-Approved-At: Mon, 25 Feb 2019 09:17:42 -0500
Subject: [Qemu-arm] ARMv8 (aarch64) emulator with vnc
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: npjHdIT36DWi

--000000000000142d3e0582b7ffaa
Content-Type: text/plain; charset="UTF-8"

Hi,

I try to run ARMv8 (aarch64) emulator.

I have created an image centos7-arm.img with
qemu-img create -f qcow2 centos7-arm.img 40G

I run the qemu-system-aarch64 on Fedora on Xen.

qemu-system-aarch64 -boot d -cdrom
/root/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda
centos7-arm.img -machine virt -nographic -device e1000,netdev=net0 -netdev
user,id=net0,hostfwd=tcp::5555-:22

From another window I run
ssh localhost -p 5555 -v
Connection established but still there is no answer (black screen) until
Connection reset by peer

Do you have any idea how I can solve it?

--000000000000142d3e0582b7ffaa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail-gE g=
mail-iv gmail-gt" style=3D"padding:20px 0px 0px;font-size:12.8px"><span sty=
le=3D"font-size:small">Hi,</span><table cellpadding=3D"0" class=3D"gmail-cf=
 gmail-gJ" style=3D"border-collapse:collapse;margin-top:0px;width:auto;font=
-family:Roboto,RobotoDraft,Helvetica,Arial,sans-serif;font-size:0.875rem;le=
tter-spacing:0.2px;display:block"></table></div><div class=3D"gmail-"><div =
id=3D"gmail-:1lg" class=3D"gmail-ii gmail-gt" style=3D"font-size:12.8px;dir=
ection:ltr;margin:8px 0px 0px;padding:0px"><div id=3D"gmail-:1lf" class=3D"=
gmail-a3s gmail-aXjCH" style=3D"overflow:hidden;font-variant-numeric:normal=
;font-variant-east-asian:normal;font-stretch:normal;font-size:small;line-he=
ight:1.5"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr">I tr=
y to run ARMv8 (aarch64) emulator.<br><div><br></div><div><div>I have creat=
ed an image centos7-arm.img with=C2=A0</div><div><span style=3D"color:rgb(5=
1,51,51);font-family:Arial,sans-serif;font-size:14px;background-color:rgb(2=
45,245,245)">qemu-img create -f qcow2 centos7-arm.img 40G</span>=C2=A0</div=
><div><br></div></div><div><div>I run the=C2=A0qemu-system-aarch64 on Fedor=
a on Xen.</div><div><br></div><div>qemu-system-aarch64 -boot d -cdrom /root=
/Download/QEMU/CentOS-7-aarch64-Minimal-1810.iso -m 8000 -hda centos7-arm.i=
mg -machine virt -nographic -device e1000,netdev=3Dnet0 -netdev user,id=3Dn=
et0,hostfwd=3Dtcp::5555-:22=C2=A0<br></div><div><br></div><div>From another=
 window I run=C2=A0</div><div>ssh localhost -p 5555 -v=C2=A0<br></div><div>=
Connection established but still there is no answer (black screen) until Co=
nnection reset by peer</div><div><br></div><div>Do you have any idea how I =
can solve it?</div><div class=3D"gmail-yj6qo"></div><br class=3D"gmail-Appl=
e-interchange-newline"></div></div></div></div></div></div></div><div dir=
=3D"ltr"><br><div><br></div></div></div></div>

--000000000000142d3e0582b7ffaa--
