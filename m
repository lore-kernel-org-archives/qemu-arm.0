Received: by 10.25.0.144 with SMTP id 138csp301307lfa;
        Fri, 21 Apr 2017 06:56:54 -0700 (PDT)
X-Received: by 10.55.105.6 with SMTP id e6mr12618808qkc.252.1492783014482;
        Fri, 21 Apr 2017 06:56:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si9588932qtc.208.2017.04.21.06.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Apr 2017 06:56:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1Z3N-0004oN-RX
	for alex.bennee@linaro.org; Fri, 21 Apr 2017 09:56:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jdumaresq@cimeq.qc.ca>) id 1d1YeX-0006Un-S2
	for qemu-arm@nongnu.org; Fri, 21 Apr 2017 09:31:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jdumaresq@cimeq.qc.ca>) id 1d1YeU-0004zw-Lp
	for qemu-arm@nongnu.org; Fri, 21 Apr 2017 09:31:13 -0400
Received: from sogo.cimeq.qc.ca ([205.237.245.50]:41590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jdumaresq@cimeq.qc.ca>)
	id 1d1YeU-0004uI-G0
	for qemu-arm@nongnu.org; Fri, 21 Apr 2017 09:31:10 -0400
Received: from [10.0.3.1] (unknown [10.0.3.1])
	by sogo.cimeq.qc.ca (Postfix) with ESMTPSA id 581A32E0108
	for <qemu-arm@nongnu.org>; Fri, 21 Apr 2017 09:30:55 -0400 (EDT)
To: qemu-arm@nongnu.org
From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Message-ID: <2c661969-7598-be7a-16d8-b121da250a30@cimeq.qc.ca>
Date: Fri, 21 Apr 2017 09:30:55 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.0.1
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------A1FE9E36712FC622E9D4E12B"
Content-Language: fr
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 205.237.245.50
X-Mailman-Approved-At: Fri, 21 Apr 2017 09:56:44 -0400
Subject: [Qemu-arm] semihosting file hosted access
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
X-TUID: Iv0jShh6sHtL

This is a multi-part message in MIME format.
--------------A1FE9E36712FC622E9D4E12B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I try the semihosting for cortex-m profile and it's working pretty well. 
Now I wwant to use the fileIO semihosting the be able to host all the 
files on my host and access it by my running application. So far, I can 
open a file with fopen, and write/red into it.

The question is about the drive emulation. On my real board I have a SPI 
flash, and I use a fat system (Chan fatFS drive 0: )). On my board I 
also have an SD card (used by Chan fatFS (drive 1: )). I try to figure 
how I could emulate those drive to have my files hosted on my host. I 
would like to have each drive in separate folder like: c:\drive0, 
c:\drive1.

When I open a file in my application 0:myFile.txt I would like to have 
it on my host in c:\drive0\myFile.txt. Same thing for drive 1:

Is it something doable ? Can I configure QEMU to have such arrangement ? 
If possible I don't want to modify my application for drive access.

Regards

Jonathan


--------------A1FE9E36712FC622E9D4E12B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font size="-1"><font face="Courier New, Courier, monospace">Hi,</font></font></p>
    <p><font size="-1"><font face="Courier New, Courier, monospace">I
          try the semihosting for cortex-m profile and it's working
          pretty well. Now I wwant to use the fileIO semihosting the be
          able to host all the files on my host and access it by my
          running application. So far, I can open a file with fopen, and
          write/red into it. <br>
        </font></font></p>
    <p><font size="-1"><font face="Courier New, Courier, monospace">The
          question is about the drive emulation. On my real board I have
          a SPI flash, and I use a fat system (Chan fatFS drive 0: )).
          On my board I also have an SD card (used by Chan fatFS (drive
          1: )). I try to figure how I could emulate those drive to have
          my files hosted on my host. I would like to have each drive in
          separate folder like: c:\drive0, c:\drive1. <br>
        </font></font></p>
    <p><font size="-1"><font face="Courier New, Courier, monospace">When
          I open a file in my application 0:myFile.txt I would like to
          have it on my host in c:\drive0\myFile.txt. Same thing for
          drive 1:<br>
        </font></font></p>
    <p><font size="-1"><font face="Courier New, Courier, monospace">Is
          it something doable ? Can I configure QEMU to have such
          arrangement ? If possible I don't want to modify my
          application for drive access. <br>
        </font></font></p>
    <p><font size="-1"><font face="Courier New, Courier, monospace">Regards</font></font></p>
    <p><font size="-1"><font face="Courier New, Courier, monospace">Jonathan<br>
        </font></font></p>
  </body>
</html>

--------------A1FE9E36712FC622E9D4E12B--
