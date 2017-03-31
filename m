Received: by 10.25.15.230 with SMTP id 99csp3279249lfp;
        Fri, 31 Mar 2017 16:24:37 -0700 (PDT)
X-Received: by 10.237.63.78 with SMTP id q14mr5875027qtf.266.1491002677144;
        Fri, 31 Mar 2017 16:24:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si5918058qtg.56.2017.03.31.16.24.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Mar 2017 16:24:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@smartechhomes.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cu5uG-0007JH-MG
	for alex.bennee@linaro.org; Fri, 31 Mar 2017 19:24:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jerry@smartechhomes.com>) id 1cu5uB-0007JB-9E
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 19:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jerry@smartechhomes.com>) id 1cu5u8-0006uL-34
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 19:24:31 -0400
Received: from smartechhomes.com ([66.246.75.169]:52962)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jerry@smartechhomes.com>)
	id 1cu5u7-0006o4-S7
	for qemu-arm@nongnu.org; Fri, 31 Mar 2017 19:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smartechhomes.com; s=20161214; 
	h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:From:To;
	bh=VzPhV4EcKaN2FPjjE4Jt/uuUvDeB42Q2BILWsUcLBP0=; 
	b=HrYiSzlUUha4RO1iTduzmPRszTqZZ/m7X5D2eXfnvfUaNB/Meu8QzXwZ7vE5OeNTCEuGTHVebknQuD3AYkZRbJJtj3cX5NSr7x//wHzEHHO/0qWfZlLlpjcmSy1cGY2dEMbE+jGMw+XsIvUnqgAIAhGYv8Me8OIQatG3scrv2RI=;
Received: from pool-173-73-25-174.washdc.fios.verizon.net ([173.73.25.174]
	helo=[206.223.85.7])
	by smartechhomes.com with esmtpa (Exim 4.80 #2 (Debian))
	id 1cu5tb-0000jF-5Y
	for <qemu-arm@nongnu.org>; Fri, 31 Mar 2017 19:24:19 -0400
To: qemu-arm@nongnu.org
From: Jerry Stuckle <jerry@smartechhomes.com>
Message-ID: <ecf0b1ef-9cd3-0fc6-0a94-3b5f8ea8740c@smartechhomes.com>
Date: Fri, 31 Mar 2017 19:23:41 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-ACL-Warn: Your server announces itself ([206.223.85.7]) with a bare IP
	address which is in breach of RFC2821
X-SA-Exim-Connect-IP: 173.73.25.174
X-SA-Exim-Mail-From: jerry@smartechhomes.com
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:57:07 +0000)
X-SA-Exim-Scanned: Yes (on smartechhomes.com)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.246.75.169
Subject: [Qemu-arm] List Problems
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
X-TUID: qhmLZ4DAE60U

Hi, all,

For the last couple of months I've been getting messages that I've been
removed from this list due to bounces.

I've traced this back to a change in our MTA configuration to enforce
DKIM signatures.  From what I can find (hard because I don't can only
see the MTA logs - not the bounce messages) the problem is that the
mailing list is misconfigured.  It indicates the from: address is the
original sender, but the mail is coming from the list.  If the original
sender's domain uses DKIM, my MTA (correctly) rejects the message.

I've tried writing the list administrator, but no luck.  Any
suggestions?  I can't add the list to a whitelist because the DKIM test
will reject it before the whitelist is tested.

Jerry
