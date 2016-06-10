Received: by 10.25.85.209 with SMTP id j200csp121666lfb;
        Fri, 10 Jun 2016 11:33:03 -0700 (PDT)
X-Received: by 10.140.169.10 with SMTP id p10mr3214918qhp.99.1465583583637;
        Fri, 10 Jun 2016 11:33:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si7002504qkh.110.2016.06.10.11.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 11:33:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43832 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBREt-0002KS-2r
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 14:33:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bBREl-0002J8-NQ
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 14:32:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1bBREh-0003QV-Gb
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 14:32:54 -0400
Received: from chuckie.co.uk ([82.165.15.123]:40249
	helo=s16892447.onlinehome-server.info)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bBREh-0003PM-9t; Fri, 10 Jun 2016 14:32:51 -0400
Received: from host217-42-121-223.range217-42.btcentralplus.com
	([217.42.121.223] helo=[192.168.1.65])
	by s16892447.onlinehome-server.info with esmtpsa
	(TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1bBREa-00061d-7f; Fri, 10 Jun 2016 19:32:45 +0100
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-8-git-send-email-imammedo@redhat.com>
	<20160608163011.GL18662@thinpad.lan.raisama.net>
	<20160610115121.GG17952@thinpad.lan.raisama.net>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <575B07A1.4040606@ilande.co.uk>
Date: Fri, 10 Jun 2016 19:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <20160610115121.GG17952@thinpad.lan.raisama.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 217.42.121.223
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Jan 2012 02:45:44 +0000)
X-SA-Exim-Scanned: Yes (on s16892447.onlinehome-server.info)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 82.165.15.123
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/10] target-sparc: cpu: use
 sparc_cpu_parse_features() directly
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mJiIBGJy728m

On 10/06/16 12:51, Eduardo Habkost wrote:

> On Wed, Jun 08, 2016 at 01:30:11PM -0300, Eduardo Habkost wrote:
>> On Mon, Jun 06, 2016 at 05:16:49PM +0200, Igor Mammedov wrote:
>>> make SPARC target use sparc_cpu_parse_features() directly
>>> so it won't get in the way of switching other propertified
>>> targets to handling features as global properties.
>>>
>>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>>
>> I would like to apply this to the x86 tree, to allow the
>> remaining patches to be applied. May I get an Acked-by from the
>> SPARC maintainers?
> 
> I hear no objections, I will queue it on x86-next.

Given that I've never used CPU options for SPARC, this is probably okay
as long the standard sun4m/sun4u guests fire up with the same command lines.

Apologies for the delay on reviewing, my QEMU development is relegated
to time outside of work and the recent breakage on PPC/SPARC has eaten
huge amounts of my available time over the past week :/


ATB,

Mark.

