Received: by 10.25.21.156 with SMTP id 28csp2923174lfv;
        Sun, 7 Aug 2016 22:54:01 -0700 (PDT)
X-Received: by 10.200.55.137 with SMTP id d9mr26187150qtc.46.1470635641649;
        Sun, 07 Aug 2016 22:54:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x47si19056845qtc.31.2016.08.07.22.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Aug 2016 22:54:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWdVh-00080H-0f
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 01:54:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rqk@stlport.com>) id 1bWZuS-0004Lk-SK
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 22:03:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rqk@stlport.com>) id 1bWZuO-0005av-LV
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 22:03:19 -0400
Received: from smtp93.iad3a.emailsrvr.com ([173.203.187.93]:52862)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rqk@stlport.com>) id 1bWZuO-0005am-H1
	for qemu-arm@nongnu.org; Sun, 07 Aug 2016 22:03:16 -0400
Received: from smtp4.relay.iad3a.emailsrvr.com (localhost [127.0.0.1])
	by smtp4.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id
	E54D0C022A
	for <qemu-arm@nongnu.org>; Sun,  7 Aug 2016 22:03:15 -0400 (EDT)
X-Auth-ID: rqk@stlport.com
Received: by smtp4.relay.iad3a.emailsrvr.com (Authenticated sender:
	rqk-AT-stlport.com) with ESMTPSA id 84F1FC02A2
	for <qemu-arm@nongnu.org>; Sun,  7 Aug 2016 22:03:15 -0400 (EDT)
X-Sender-Id: rqk@stlport.com
Received: from [192.168.1.81] (107-133-144-140.lightspeed.sntcca.sbcglobal.net
	[107.133.144.140]) (using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
	by 0.0.0.0:465 (trex/5.7.1); Sun, 07 Aug 2016 22:03:15 -0400
To: qemu-arm@nongnu.org
From: Roman Kostin <rqk@stlport.com>
Message-ID: <67aa7857-582e-c6da-b43b-2272a4455019@stlport.com>
Date: Sun, 7 Aug 2016 19:03:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------74B2243793AA145E3F985ED9"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 173.203.187.93
X-Mailman-Approved-At: Mon, 08 Aug 2016 01:53:57 -0400
Subject: [Qemu-arm] ARMV7M MPU experience
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
X-TUID: b8SMNgCcB/NL

This is a multi-part message in MIME format.
--------------74B2243793AA145E3F985ED9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I am looking for working MPU inplementation for Cortex-M MCUs.

Tried the tree I pulled off https://github.com/mdavidsaver/qemu.git and 
couldn't get it to work as expected. Can anyone share their experience 
with this code?

My code is put into ROM adress @ 0x00000000:

    vtable:
         .word    istack
         .word    reset
         .word    hndlr008
         ...
         .word    hndlr1dc

    hndlr008:
         ...

    reset:
             ldr     r0, =mpu
             ldr     r0, [r0]
             movs    r1, #2    // Rgn #2
             str     r1, [r0, #8]
             ldr     r1, =bar
             ldr     r1, [r1]
             str     r1, [r0, #0xc]
             ldr     r1, =rasr
             ldr     r1, [r1]
             str     r1, [r0, #0x10]
             movs    r1, #1    // Turn MPU on
    f1:     str     r1, [r0, #4]
             ldr     r1, =bar
             ldr     r1, [r1]
             ldr     r1, [r1]
             b       reset

    mpu:    .word   0xe000ed90
    bar:    .word   0x20000000
    rasr:   .word   0x13080029

I'm trying to set up region #2 starting from address 0x20000000 (SRAM). 
But as soon as MPU is turned on, the very next memory access @ label f1 
crashes qemu after a hang of ~60 sec. This is the output:

qemu: hardware error: ssys_read: Bad offset 0xffc

CPU #0:
R00=e000ed90 R01=00000001 R02=00000000 R03=00000000
R04=00000000 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=43fdfffc R14=fffffff1 R15=000001e8
PSR=00000173 ---- T svc32
FPSCR: 00000000
Aborted (core dumped)

Any insight?

Thank you!

--
Roman Kostin


--------------74B2243793AA145E3F985ED9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>I am looking for working MPU inplementation for Cortex-M MCUs.</p>
    <p>Tried the tree I pulled off
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/mdavi=
dsaver/qemu.git">https://github.com/mdavidsaver/qemu.git</a> and couldn't=
 get it to
      work as expected. Can anyone share their experience with this
      code?</p>
    <p>My code is put into ROM adress @ 0x00000000:<br>
    </p>
    <blockquote>
      <p><tt>vtable:</tt><tt><br>
        </tt><tt>=C2=A0=C2=A0=C2=A0 .word=C2=A0=C2=A0=C2=A0 istack</tt><t=
t><br>
        </tt><tt>=C2=A0=C2=A0=C2=A0 .word=C2=A0=C2=A0=C2=A0 reset</tt><tt=
><br>
        </tt><tt>=C2=A0=C2=A0=C2=A0 .word=C2=A0=C2=A0=C2=A0 hndlr008</tt>=
<tt><br>
        </tt><tt>=C2=A0=C2=A0=C2=A0 ...</tt><tt><br>
        </tt><tt>=C2=A0=C2=A0=C2=A0 .word=C2=A0=C2=A0=C2=A0 hndlr1dc</tt>=
</p>
      <tt>hndlr008:</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0 ...</tt><tt><br>
      </tt><tt><br>
      </tt><tt>reset:</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r0, =3Dmpu</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r0, [r0]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 movs=C2=A0=C2=A0=
=C2=A0 r1, #2=C2=A0=C2=A0=C2=A0 // Rgn #2</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r0, #8]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, =3Dbar</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r1]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r0, #0xc]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, =3Drasr</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r1]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 str=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r0, #0x10]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 movs=C2=A0=C2=A0=
=C2=A0 r1, #1</tt><tt>=C2=A0=C2=A0=C2=A0 // Turn MPU on<br>
      </tt><tt>f1:=C2=A0=C2=A0=C2=A0=C2=A0 str=C2=A0=C2=A0=C2=A0=C2=A0 r1=
, [r0, #4]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, =3Dbar</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r1]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ldr=C2=A0=C2=A0=
=C2=A0=C2=A0 r1, [r1]</tt><tt><br>
      </tt><tt>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 b=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 reset</tt><tt><br>
      </tt><tt><br>
      </tt><tt>mpu: =C2=A0=C2=A0 .word=C2=A0=C2=A0 0xe000ed90</tt><tt><br=
>
      </tt><tt>bar:=C2=A0=C2=A0=C2=A0 .word=C2=A0=C2=A0 0x20000000</tt><t=
t><br>
      </tt><tt>rasr:=C2=A0=C2=A0 .word=C2=A0=C2=A0 0x13080029</tt><tt><br=
>
      </tt></blockquote>
    <p>I'm trying to set up region #2 starting from address 0x20000000
      (SRAM). But as soon as MPU is turned on, the very next memory
      access @ label f1 crashes qemu after a hang of ~60 sec. This is
      the output:</p>
    <p><tt>qemu: hardware error: ssys_read: Bad offset 0xffc</tt><tt><br>
      </tt><tt><br>
      </tt><tt>CPU #0:</tt><tt><br>
      </tt><tt>R00=3De000ed90 R01=3D00000001 R02=3D00000000 R03=3D0000000=
0</tt><tt><br>
      </tt><tt>R04=3D00000000 R05=3D00000000 R06=3D00000000 R07=3D0000000=
0</tt><tt><br>
      </tt><tt>R08=3D00000000 R09=3D00000000 R10=3D00000000 R11=3D0000000=
0</tt><tt><br>
      </tt><tt>R12=3D00000000 R13=3D43fdfffc R14=3Dfffffff1 R15=3D000001e=
8</tt><tt><br>
      </tt><tt>PSR=3D00000173 ---- T svc32</tt><tt><br>
      </tt><tt>FPSCR: 00000000</tt><tt><br>
      </tt><tt>Aborted (core dumped)</tt><br>
    </p>
    <p>Any insight?<br>
      <br>
      Thank you!</p>
    <p>--<br>
      Roman Kostin<br>
    </p>
  </body>
</html>

--------------74B2243793AA145E3F985ED9--
