Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp922900wru;
        Wed, 8 Aug 2018 10:00:59 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwus7CAZ2xe0YnBb9U+GqKpCewWBeid7KNPmvVPhvZj1AVl72TK9zAyRWL26VL0arOIQhC5
X-Received: by 2002:ae9:f449:: with SMTP id z9-v6mr3368982qkl.410.1533747659387;
        Wed, 08 Aug 2018 10:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533747659; cv=none;
        d=google.com; s=arc-20160816;
        b=nQK3AOeWFdiX6LOhNIQu5bG7829CPB0UyK1z6uzil0BpPfBTaYCyKph/ms8EvEuCTP
         g4xN/TFGB1NmSsf8jBoyuhnBr4sgy1P22nsnKLwutyux6vpdD6/Jd2lojQGdRwXEF6+4
         /LKr+o2ys6kOBSRMAqZ/rLBPmVWlFx3eu8lKtYAzSoGDwKZJC/Sk6+bVsB30um0Mk1z2
         thU3jVUGJA/+7E/LODBt8kQn6jwOe3OA/ks5hQ7i1I6lct7HheLH2ucm08DrMY6BrCOm
         BHtDhX29hG2Ee9jFYcy7vAGJH85WWuu77e7RxHwSo0gidYOqx4lI+0UnDHUqr5AyiEcz
         Cbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=WM/QL3nIMDc+/V/v5s+Wd8I+e4XX9fp/YqZSEhBqk6Y=;
        b=Py5BNl3uOS3yupdjzCw+VDNnoO2z46AJn1IKjPyVe4O5OrwhTyMPHQvY70iM7AdTi5
         GEZvG83aGBUnO6U6Mlj0MO3fjpeSqbLe63eo1EQaDTvy/J1SQny674IvDuctH/8FkJZy
         nmUwzJaCScAJL1VfzD21eK0M50/Z2mYiPDRqKMMGjhtge4jlsN2be6W1iUjX2m1MmLtK
         TNWc/Wol/gUP6YF1m3kuxwJuAwiALzWscl/iaGLlF5JUNApGV1ZemYPEygQ6bqbG+30K
         F8d14V/P2oxiArnGC8EOEKTudr2NTcf8NTlRK1j3ckk/6mLZeU9gEQuXnmy0Wi6ifXpB
         iUCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XGKQD6g8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65-v6si1785382qkd.318.2018.08.08.10.00.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Aug 2018 10:00:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XGKQD6g8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnRpS-0008Vp-V3
	for alex.bennee@linaro.org; Wed, 08 Aug 2018 13:00:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sayandeep.iitkgp@gmail.com>) id 1fnRfk-00042C-8q
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 12:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sayandeep.iitkgp@gmail.com>) id 1fnRfj-0002FD-81
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 12:50:56 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:36312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sayandeep.iitkgp@gmail.com>)
	id 1fnRfj-0002Er-10
	for qemu-arm@nongnu.org; Wed, 08 Aug 2018 12:50:55 -0400
Received: by mail-oi0-x235.google.com with SMTP id n21-v6so4920133oig.3
	for <qemu-arm@nongnu.org>; Wed, 08 Aug 2018 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=WM/QL3nIMDc+/V/v5s+Wd8I+e4XX9fp/YqZSEhBqk6Y=;
	b=XGKQD6g8HYagun8OiVljcgv5Zlnfk7bWLMLTpmQGktpBJLPuwGpFycBEw5RnW0nuta
	fPU/CJmyit6lGag2cjc0blc8LBmyOVvHv/jZVYtNxr+xhEqeXGbhFthSE1Q/8xMn7i64
	8viUQdPQnObw+w15Xmg98neWoe3VEZsb9fOjsHkwJgcuPSCMAkRutaJu1FYn2cWOAzL7
	fnzuZ/w6bk++Zli1DtMNB4J6P4ExpDWJGT6cqbyLjC4sTgXLRFrPotiMd93ZI5o9gPLY
	ZmlpfWCqeCIaTRsS6TmTv1NQ6WjEeON3QGMrte9lsJTDLH6awl2EeRySZof7zuyJ9szl
	jjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=WM/QL3nIMDc+/V/v5s+Wd8I+e4XX9fp/YqZSEhBqk6Y=;
	b=PP1fNvmlrC8jjUg2JcK6uxNIZIjz23bh+VTnUXVfc1Vqi1su9S/Qm7wdm/sjeWuVzu
	6p48ZUlc4ZEu2rdo4Xj7DmOp7xw9i7Hj5g1Q8tDXYgZFb+KiJh+F/G5t6HDp1lyv5A5a
	V7Fi1WrIIQ8d33XBY5pTfiTOVkmjI+IZlJzLk0r7MIYZ2vh77fWy2haycAevXXntF4/n
	4rOMKdmpgy+xSWM6v37UiNrVnO6jLG5Oh4dBGYPigZZBu/zM0EVZlZRD7yL/VyBujtjJ
	6vMsXM+K2Oy3bd/IvVqKkVRCo0DfKC/BjTETU8MS3FJRclji+kdR1HkiUprHy/0mnp3o
	00pg==
X-Gm-Message-State: AOUpUlG/n1RfisNOUkrYOTtz1eUUDDAaDVHQyvn2DRTcwmL3VvWRPByM
	YLUebN5mGhpmfAvp6tnEAsVOf0RBFo4HSJ7kapS7VdA3
X-Received: by 2002:aca:4d56:: with SMTP id
	a83-v6mr3458401oib.205.1533747053555; 
	Wed, 08 Aug 2018 09:50:53 -0700 (PDT)
MIME-Version: 1.0
From: Sayandeep Saha <sayandeep.iitkgp@gmail.com>
Date: Wed, 8 Aug 2018 22:20:40 +0530
Message-ID: <CALxeBVBJxfD_UNE=9JZ0qn_VXF1fYU=m0WyFQqwJhCbqN7-k5Q@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004d76890572ef50bc"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
X-Mailman-Approved-At: Wed, 08 Aug 2018 12:57:08 -0400
Subject: [Qemu-arm] Regarding some issues with gdb
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
X-TUID: 7AEBfM9C+vqY

--0000000000004d76890572ef50bc
Content-Type: text/plain; charset="UTF-8"

Hi,

I am Sayandeep Saha, a PhD scholar form Indian Institute of Technology,
Kharagpur.  I am working on a project where I need to use gdb in the
following ways to tweak a program at runtime:

1. Modify register values.

2. Modify an instruction (say replacing the opcode with another opcode or
nop).

3. Modify constants in instructions (e.g. ldr  r0, [pc, #12] can be changed
to
ldr  r0, [pc, #8]; or the branch target can be changed)

I successfully made all these changes on my X86-64 Intel machine. However,
for ARM I tried with QEMU. The test case was a simple C program for
calculating factorials using loops. I ran the following commands:

Compilation:
arm-linux-gnueabi-gcc -g -static -Xlinker -N -mthumb -masm-syntax-unified
factorial.c -o factorial

Run:
qemu-arm -g 1234 -L /usr/arm-linux-gnueabihf/ ./factorial

Next, I invoked gdb-multiarch from another shell to debug the program.


However, when I try to change some instruction using "set" command of GDB,
it says "The memory location cannot be accessed".
Surprisingly, I can print the already existing contents of those memory
locations using gdb's print command. Also, I could modify register values
successfully.

I am really confused and wander whether it is possible to change memory
contents within QEMU, or not. If it is possible, what is the step by step
procedure for that.



Sayandeep Saha

PhD Student,
Indian Institute of Technology,
Kharagpur, India-721302

--0000000000004d76890572ef50bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am Sayandeep Saha, a P=
hD scholar form Indian Institute of Technology, Kharagpur.=C2=A0 I am worki=
ng on a project where I need to use gdb in the following ways to tweak a pr=
ogram at runtime:</div><div><br></div><div>1. Modify register values.</div>=
<div><br></div><div>2. Modify an instruction (say replacing the opcode with=
 another opcode or nop).</div><div><br></div><div>3. Modify constants in in=
structions (e.g. ldr=C2=A0 r0, [pc, #12] can be changed to=C2=A0 <br></div>=
<div>ldr=C2=A0 r0, [pc, #8]; or the branch target can be changed)<br></div>=
<div><br></div><div>I successfully made all these changes on my X86-64 Inte=
l machine. However, for ARM I tried with QEMU. The test case was a simple C=
 program for calculating factorials using loops. I ran the following comman=
ds:</div><div><br></div><div>Compilation:</div><div>arm-linux-gnueabi-gcc -=
g -static -Xlinker -N -mthumb -masm-syntax-unified factorial.c -o factorial=
<br></div><div><br></div><div>Run:</div><div>qemu-arm -g 1234 -L /usr/arm-l=
inux-gnueabihf/ ./factorial</div><div><br></div><div>Next, I invoked gdb-mu=
ltiarch from another shell to debug the program.</div><div><br></div><div><=
br></div><div>However, when I try to change some instruction using &quot;se=
t&quot; command of GDB, it says &quot;The memory location cannot be accesse=
d&quot;. <br></div><div>Surprisingly, I can print the already existing cont=
ents of those memory locations using gdb&#39;s print command. Also, I could=
 modify register values successfully. <br></div><div><br></div><div> I am r=
eally confused and wander whether it is possible to change memory contents =
within QEMU, or not. If it is possible, what is the step by step procedure =
for that.</div><div><br></div><div>=C2=A0 <br></div><div><br></div><div><di=
v><div dir=3D"ltr" class=3D"m_-5980851701842654246gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div><div>Sayandeep Saha<br><br></div>P=
hD Student,<br></div>Indian Institute of Technology,<br></div>Kharagpur, In=
dia-721302<br></div></div></div></div></div></div></div>

--0000000000004d76890572ef50bc--
