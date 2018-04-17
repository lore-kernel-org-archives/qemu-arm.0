Received: by 10.28.4.212 with SMTP id 203csp2023wme;
        Tue, 17 Apr 2018 14:54:20 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/4nfTJDkAXUC5zuOaMpVZcANUCUl/x4u5E2DhdRVGqmNLaxpBC0OFnesOku4CjoDwloQFv
X-Received: by 10.200.30.130 with SMTP id c2mr1159203qtm.402.1524002060459;
        Tue, 17 Apr 2018 14:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524002060; cv=none;
        d=google.com; s=arc-20160816;
        b=JZnhyWscm2N3FhMCs4zaRXe0f60p3ApKmkEv5xic6IUfEC3RTLwIWpC/iT1GI0EdH/
         9KUhEyL4ceQXiWOKEZ75da61XmOan47nEcbeCRlxlMTCH0YJ3TJ68zAVugGX/8+WmgIh
         kyUyLmp2a6MegyRZtMem7v+mw5r8IXrcKLMP68PCO6chrX234W/Fof/0xomQtB+nVNOj
         WsL9dWJe9o4Rb3joOLuV/Frz3cjI+Uol13Gwisg3iQ/y2/JYqcETI3KCcrF3JzyY2iUt
         JHpfADf6wNqfN1UmRF1puASLOqIbMsxrXOanvlHr50M6CZlQScerbBVUDY7qhCvjY2xQ
         GoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=MtuLbcA5KqiiWQFSXqcF8xS7n/04kQrAoN52g1mB95I=;
        b=O20v3WKngY9GJ4TjxMB8so9WSDaC7MeRHcje8lf6X4EfYgjjeTCCyvDZwDIfOGfkWj
         Kg6MxAYaQzU0K2Tq66gzJ3yujb054SwjHDT/RdETQveYAD1ev0WBQyB4V94Ag+++fvBz
         fDp2k5NInuYp6uU0+SUpjxAFbuUWh6zzCuj950NjtZu8inUyDW4xAWyX42NrNOQOipWA
         i7FWCxYO/SqNj7NhESNYYHYTZh/CY+Tx3yIq8kQvQYOdciLfWq8zVU9/n0b9yP2Bwjpg
         vRhoGib7jbhsfV2IfsOEy5Drty8gUlbuxnNZbRfArKdyC5NykLk/+iuMHq64WnA3VW8H
         ZWZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTYA1v5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13si84133qtv.190.2018.04.17.14.54.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 14:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tTYA1v5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8YYN-0002Sc-UM
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 17:54:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f8YXA-0001jz-AV
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:53:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hwertz10@gmail.com>) id 1f8YX9-0001T4-2I
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 17:53:04 -0400
Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233]:37167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hwertz10@gmail.com>)
	id 1f8YX8-0001OZ-Ms; Tue, 17 Apr 2018 17:53:02 -0400
Received: by mail-wr0-x233.google.com with SMTP id f14so1881128wre.4;
	Tue, 17 Apr 2018 14:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=MtuLbcA5KqiiWQFSXqcF8xS7n/04kQrAoN52g1mB95I=;
	b=tTYA1v5r2uvn9/KEcTVEYlKLn2p4qn334+U++Mk2C/m85RlxCiWM1io7ynBHxTLKGV
	odhBJ0qUcvW+iperYoTgbagOYFbzkfPMSqTV0xGR10UM8J0ddIGrtT3gVEpr6/hRBJXd
	IZ1aXjWDAq+aH93XvWUG9gpT6PlizPiiUivjKuBHn0hdu9NIG5Psjj5+e6ID3aEG9Eun
	pXse9N05JEJUmXQ3q7SS7E9whPKPpkqv99x+lsbDxm+nO+J4p3UivINVWWNl1Gz/miSX
	xTII9SsTf8WNWU+gm+1RYUJGXHG5a2mC+krTlOO2qIAQPLh0r7I5Ctd1ekrhTfrbjzVW
	1ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=MtuLbcA5KqiiWQFSXqcF8xS7n/04kQrAoN52g1mB95I=;
	b=BHhwu2UaJHFwLy5QTxQkoLe0qICLRf5E/0NYJgcn2aiZv2rOzXXxTFQJRzu2ksRbUJ
	pbcQOLmHrjVVHZ5I3b75j+6k+6njWklUbTNXU/hqtcFvgssC9CJmqXx3efGBtJp/u+J2
	PfEpuDZb1TyP6+QAmqTNbZslFrfvjiD+IigbRslZBZ/wDMpTt0N2VnGlQjEzg7Cw9SvN
	Zdyum/bDSmS7bK5PmtpppmDj9DeXAl0XoLuU3oq4LxxGZ9StQKhTYx9Ccr3AFzogDv92
	XNElhDL8/mg1pQR6e18JYgJ9iV90AzrztExj3F52PXpmrn+4ega1Vm2X8/or8UislFGI
	P8cg==
X-Gm-Message-State: ALQs6tB5nYx4n59+qbefmmJpO5OiGv4dmt93/0FNOcP8c9mz2s8aaEhO
	DzylglvZqu0PgZ266GEqHY3DwlTdA2rJ0Nv4rjEnA/98
X-Received: by 10.223.141.247 with SMTP id o110mr2908929wrb.251.1524001981019; 
	Tue, 17 Apr 2018 14:53:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.129.104 with HTTP; Tue, 17 Apr 2018 14:53:00 -0700 (PDT)
From: Henry Wertz <hwertz10@gmail.com>
Date: Tue, 17 Apr 2018 16:53:00 -0500
Message-ID: <CAOuPqTF3nG157ShF-hW+poXbr25zODOz8pj+o9XdY=ZgU8qpFQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/mixed; boundary="f403045d60a8b77e91056a125c58"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::233
Subject: [Qemu-arm] getdents patch for 64-bit app on 32-bit host
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
X-TUID: C/DdyIg/1Mjt

--f403045d60a8b77e91056a125c58
Content-Type: multipart/alternative; boundary="f403045d60a8b77e8e056a125c56"

--f403045d60a8b77e8e056a125c56
Content-Type: text/plain; charset="UTF-8"

Please find submitted a patch for getdents (this system call stands for
"get directory entries", it is passed a file descriptor pointing to a
directory and returns a struct with info on the entries in that
directory.)  This patch is against qemu-2.10 series but continues to apply
cleanly on current as of April 15 2018.  If you are running a 32-bit binary
on 64-bit target current qemu will convert he getdents struct, but running
a 64-bit binary on 32-bit target it passes the struct straight through
causing incorrect behavior (file type is in the middle of the 64-bit struct
and at the end of the 32-bit one).

My use case for this has been running aapt (from Android SDK) and whatever
other misc x86-64 bins android studio runs when building on a 32-bit ARM (I
previously had run these x86-64 bins on  32-bit Intel).  After an android
build tools update, aapt began erroring out until I applied this patch.

Peter Maydell has raised a concern about possible buffer overflows in this
code (which was meant to handle 32-bit app on 64-bit system, not 64-bit on
32-bit).  I must admit I haven't gone through the dirent-copying code with
a fine-toothed comb... it appeared to work for my use case.  That said, the
code seems to be careful about using offsetof() rather than making any
assumptions.  In addition, the dirent-copying code appears to have an
assert that would crash qemu if it was going to write past the end of the
dirent buffer -- always nice to have plenty of sanity checks!

--Thanks!
Henry Wertz

Signed-off-by: Henry Wertz <hwertz10@gmail.com>

--f403045d60a8b77e8e056a125c56
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><span class=3D"m_1455938789112125782gmail-i=
m">Please find submitted a patch for getdents (this system call stands for =
&quot;get directory entries&quot;,</span><span class=3D"m_14559387891121257=
82gmail-im"> it is passed a file descriptor pointing to a directory and ret=
urns a struct with info on the entries in that directory.)=C2=A0 This patch=
 is against qemu-2.10 series but continues to apply cleanly on current as o=
f April 15 2018.=C2=A0 If you are running a 32-bit binary on 64-bit target =
current qemu will convert he getdents struct, but running a 64-bit binary o=
n 32-bit target it passes the struct straight through causing incorrect beh=
avior (file type is in the middle of the 64-bit struct and at the end of th=
e 32-bit one).<br><br></span></div><span class=3D"m_1455938789112125782gmai=
l-im">My use case for this has been running aapt (from Android SDK) and wha=
tever other misc x86-64 bins android studio runs when building on a 32-bit =
ARM (I previously had run these x86-64 bins on=C2=A0 32-bit Intel).=C2=A0 A=
fter an android build tools update, aapt began erroring out until I applied=
 this patch.<br><br></span></div><span class=3D"m_1455938789112125782gmail-=
im">Peter Maydell has raised a concern about possible buffer overflows in t=
his code (which was meant to handle 32-bit app on 64-bit system, not 64-bit=
 on 32-bit).=C2=A0 I must admit I haven&#39;t gone through the dirent-copyi=
ng code with a fine-toothed comb... it appeared to work for my use case.=C2=
=A0 That said, the code seems to be careful about using offsetof() rather t=
han making any assumptions.=C2=A0 In addition, the dirent-copying code appe=
ars to have an assert that would crash qemu if it was going to write past t=
he end of the dirent buffer -- always nice to have plenty of sanity checks!=
<br><br></span></div><div><span class=3D"m_1455938789112125782gmail-im">--T=
hanks!<br></span></div><div><span class=3D"m_1455938789112125782gmail-im">H=
enry Wertz<br></span></div><div><span class=3D"m_1455938789112125782gmail-i=
m"><br></span></div><div><span class=3D"m_1455938789112125782gmail-im">Sign=
ed-off-by: Henry Wertz &lt;<a href=3D"mailto:hwertz10@gmail.com" target=3D"=
_blank">hwertz10@gmail.com</a>&gt;<br><br></span></div><span class=3D"m_145=
5938789112125782gmail-im"></span></div>

--f403045d60a8b77e8e056a125c56--
--f403045d60a8b77e91056a125c58
Content-Type: text/x-patch; charset="US-ASCII"; name="qemu-getdents.patch"
Content-Disposition: attachment; filename="qemu-getdents.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jg47a9k20

KioqIGxpbnV4LXVzZXIvc3lzY2FsbC5jfgkyMDE3LTAzLTA0IDEwOjMxOjE0LjAwMDAwMDAwMCAt
MDYwMAotLS0gbGludXgtdXNlci9zeXNjYWxsLmMJMjAxNy0wMy0wNyAxNzowODoyNC42MTUzOTkx
MTYgLTA2MDAKKioqKioqKioqKioqKioqCioqKiA5OTEzLDk5MjEgKioqKgogICNlbmRpZgogICNp
ZmRlZiBUQVJHRVRfTlJfZ2V0ZGVudHMKICAgICAgY2FzZSBUQVJHRVRfTlJfZ2V0ZGVudHM6CiAg
I2lmZGVmIF9fTlJfZ2V0ZGVudHMKISAjaWYgVEFSR0VUX0FCSV9CSVRTID09IDMyICYmIEhPU1Rf
TE9OR19CSVRTID09IDY0CiAgICAgICAgICB7CiAgICAgICAgICAgICAgc3RydWN0IHRhcmdldF9k
aXJlbnQgKnRhcmdldF9kaXJwOwogICAgICAgICAgICAgIHN0cnVjdCBsaW51eF9kaXJlbnQgKmRp
cnA7CiAgICAgICAgICAgICAgYWJpX2xvbmcgY291bnQgPSBhcmczOwotLS0gOTkxMyw5OTIxIC0t
LS0KICAjZW5kaWYKICAjaWZkZWYgVEFSR0VUX05SX2dldGRlbnRzCiAgICAgIGNhc2UgVEFSR0VU
X05SX2dldGRlbnRzOgogICNpZmRlZiBfX05SX2dldGRlbnRzCiEgI2lmIFRBUkdFVF9BQklfQklU
UyAhPSBIT1NUX0xPTkdfQklUUwogICAgICAgICAgewogICAgICAgICAgICAgIHN0cnVjdCB0YXJn
ZXRfZGlyZW50ICp0YXJnZXRfZGlycDsKICAgICAgICAgICAgICBzdHJ1Y3QgbGludXhfZGlyZW50
ICpkaXJwOwogICAgICAgICAgICAgIGFiaV9sb25nIGNvdW50ID0gYXJnMzsK
--f403045d60a8b77e91056a125c58--
