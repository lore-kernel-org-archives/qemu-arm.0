Received: by 10.182.158.201 with SMTP id ww9csp596453obb;
        Thu, 26 Nov 2015 04:43:47 -0800 (PST)
X-Received: by 10.55.31.30 with SMTP id f30mr47072349qkf.5.1448541827861;
        Thu, 26 Nov 2015 04:43:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n93si26146590qgd.60.2015.11.26.04.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Nov 2015 04:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1vtr-00022N-Gi
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 07:43:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1vto-00020t-Cq
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 07:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a1vtl-0002YY-6C
	for qemu-arm@nongnu.org; Thu, 26 Nov 2015 07:43:44 -0500
Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235]:34458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a1vtk-0002Y0-VA; Thu, 26 Nov 2015 07:43:41 -0500
Received: by lffu14 with SMTP id u14so96706006lff.1;
	Thu, 26 Nov 2015 04:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=zTXD3TcvZFsSnszIOKBX+N9sq3mkLnznDDkyWp42/YE=;
	b=VnIZSSeW9OEl4W+GziiWCv/nB6PnelMotbPSdTaLQOdDwAKkNxx1igxEeq4g3rDd0w
	yOUip9G4D/PMyey3Q7Awy3KrDsRboFjsudUAA6JZ3d+WI4TNL9zL+C69wC3DsMyppglO
	GKy7uWe1aaoP8I2fCdtvFOxlmELbhbnR4OI3wQSVQ+TXJsnYsYHaAYMGvvBVlxpoeerZ
	lUdxILY1hywQkVStWym4eb0ZS6mxNdxmYfchsXqY5XbsN3YUMTbd67c1YfxQZYELXUsu
	9aaz9NWOf/E9CrFRx3YyUufILO1QPFVCL4NgRKkcm+RXBszXbjYNcfoOsxwwEmCrz1cx
	WeqA==
X-Received: by 10.112.164.66 with SMTP id yo2mr5101470lbb.84.1448541820225;
	Thu, 26 Nov 2015 04:43:40 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	g7sm2589486lbs.34.2015.11.26.04.43.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Nov 2015 04:43:38 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1448474560-22475-1-git-send-email-serge.fdrv@gmail.com>
	<CAFEAcA-D4ZYKqGEe9ySuBe+9nPQVah77VqwkTTDWiCOZDdR24g@mail.gmail.com>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5656FE79.6000308@gmail.com>
Date: Thu, 26 Nov 2015 15:43:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-D4ZYKqGEe9ySuBe+9nPQVah77VqwkTTDWiCOZDdR24g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c07::235
Cc: qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] target-arm: Fix and improve AA32 singlestep
 translation completion code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FW882B94eCA3

On 26.11.2015 15:33, Peter Maydell wrote:
> On 25 November 2015 at 18:02, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> The AArch32 translation completion code for singlestep enabled/active
>> case was a way more confusing and too repetitive then it needs to be.
>> Probably that was the cause for a bug to be introduced into it at some
>> point. The bug was that SWI/HVC/SMC exception would be generated in
>> condition-failed instruction code path whereas it shouldn't.
> So I did some testing, and I think this is a bug that's not actually
> really visible to Linux guests. For both QEMU's gdbstub and for gdb
> running within a system emulation, gdb for 32-bit ARM will prefer to
> do singlestep via setting breakpoints rather than trying to use the
> gdbstub's singlestep command. So while we should definitely fix it
> (and the code cleanup is nice) I think we don't need to do this for 2.5,
> and I'm going to put this on my review-for-2.6 list. Do you agree?

Sure, that's okay. I just wanted to finish this before I move on to
something else.

BTW, I used the following quick-and-dirty Perl script to do testing (it
was helpful to detect some bugs in my first attempts):

#!/usr/bin/perl

use strict;
use warnings;

use IO::Socket::INET;

our $addr = 'localhost:1234';

sub recv_pack {
    my $sock = shift;
    my $c = $sock->getc() || die();
    if ($c eq '+') {
        return $c;
    }
    if ($c eq '-') {
        die;
    }
    if ($c eq '$') {
        my $packet = $c;
        while (($c = $sock->getc()) ne '#') {
            defined($c) || die();
            $packet .= $c;
        }
        $sock->getc();
        $sock->getc();
        $sock->print('+') || die();
        return $packet;
    }
    return "";
}

sub wait_ack {
    my $sock = shift;
    my $pack = recv_pack($sock);
    while ($pack ne "+") {
        $pack = recv_pack($sock);
    }
}

sub send_pack {
    my $sock = shift;
    my $packet = shift;
    my $sum = unpack("%8C*", $packet);
    $packet = '$' . $packet . '#' . sprintf("%hhx", $sum);
    $sock->print($packet) || die();
    wait_ack($sock);
}

our $sock = IO::Socket::INET->new($addr) || die();

our $quit = 0;

$SIG{INT} = sub { $quit = 1; };

my $nr_packets = 0;

while (!$quit) {
    send_pack($sock, 's');
    recv_pack($sock);
    printf("\r%d packets sent", ++$nr_packets);
    STDOUT->flush();
}

print("\n");

send_pack($sock, 'c');

Best regards,
Sergey
