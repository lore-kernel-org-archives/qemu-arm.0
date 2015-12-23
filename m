Received: by 10.182.158.201 with SMTP id ww9csp4297066obb;
        Wed, 23 Dec 2015 12:33:09 -0800 (PST)
X-Received: by 10.140.251.131 with SMTP id w125mr43730967qhc.1.1450902789417;
        Wed, 23 Dec 2015 12:33:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e127si41462872qkb.26.2015.12.23.12.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Dec 2015 12:33:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:57718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBq5s-0003o5-V3
	for alex.bennee@linaro.org; Wed, 23 Dec 2015 15:33:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aBq5r-0003ny-EO
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 15:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aBq5n-0004p4-El
	for qemu-arm@nongnu.org; Wed, 23 Dec 2015 15:33:07 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:33663)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aBq5n-0004oy-8r; Wed, 23 Dec 2015 15:33:03 -0500
Received: by mail-wm0-x234.google.com with SMTP id p187so157907599wmp.0;
	Wed, 23 Dec 2015 12:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=Uh/8fkG4xiVAFHsFAE2kj0N1pKo2xS8TXHzpS1KJ6aw=;
	b=XH+QshpycLiH1CLlIxaKfRzoKiRr9rTCJeUFMTGbbyaj7fhsbHTMQsMvcAg2g1KCys
	B5LD1Rg6a1H3PUOL1wnTvU57QVZENEuO0YXeVAZqd6eAxPeuEZ71K/7ShJUEtDZHyK4Q
	k8igQv+BUqFC7Jbp/5fxB5hU4ODT1TBdP+ZT48jRnydmbFjOHf2kFphk4qVmb63ZqvsM
	/iBxglEYyWdCXMGuwVvQgnK4LH9d6XhMLUu3aW+vmfHSEmWmFkiVfd0trdRPyP7gkl3k
	5qGs8TUMhPPRWQGCgetxaCZ/H3hbkQaQSurpNLohHhE7/LlKaHgDqkYCKJuaWO1+9PE7
	n4eA==
X-Received: by 10.194.216.100 with SMTP id op4mr21259588wjc.85.1450902782682; 
	Wed, 23 Dec 2015 12:33:02 -0800 (PST)
Received: from [192.168.10.150] (94-39-192-53.adsl-ull.clienti.tiscali.it.
	[94.39.192.53]) by smtp.googlemail.com with ESMTPSA id
	u62sm30707695wmg.4.2015.12.23.12.33.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Dec 2015 12:33:01 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=rGg5pG_XFL0c6C-i-Mkobzd+D-KgrUE1bdt1RBsD3bGg@mail.gmail.com>
	<BLUPR0301MB20345C0D49B62FE27C9BB9439EE40@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <567B04FA.2030903@redhat.com>
Date: Wed, 23 Dec 2015 21:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=owo1JtwWzDneGm9b+xe708eRDLXDQGgvVm1kkSLMo-hg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	=?UTF-8?Q?Gr=c3=a9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: gjd9xQR4kal3



On 22/12/2015 00:33, Peter Crosthwaite wrote:
>>> >>
>>> >> case 0x80..0x8c
>> >
>> > Woah! Is that standard C?
>> >
> Yes, its probably one of the more recent language standards though.
> QEMU does use to more modern features liberally.

It's actually "case 0x80 ... 0x8c:".

>> Notice that this file comes from Linux. I know it's not pretty, but
>> can we please keep it as-is, for comparison purposes? I'm not sure
>> there's much value in cleaning it up locally...
>
> It looks very autogenerated and seems pretty nasty on the repetition.
> 
> As implementers of the hardware, it is much rarer to need these
> repetitious defs than the software users on the other side. "Do
> something specific with CPU#3's Mbox#5" is going to appear in
> software, but hardware implementers generally don't have a choice to
> implement things specifically and it usually ends up being looped and
> the exploded defs are never used. If there are only a handful of
> genuinely single defs needed, can they be fished out?

I see your point and I'm definitely in favor of rewriting headers from
scratch when practical, but any cleanup made is a recipe for unwanted
changes and bugs, especially if the source is full of repetitions.

Paolo
