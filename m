Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4107118wrt;
        Mon, 4 Feb 2019 15:12:28 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYG6rbxHF3+P8NtVOg5Gh1lDOXNqZm/HvHzjXYllOBgq5BlrDeZSnJqavgxqDzSJgZ4D22u
X-Received: by 2002:a25:7583:: with SMTP id q125mr1547994ybc.95.1549321948179;
        Mon, 04 Feb 2019 15:12:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549321948; cv=none;
        d=google.com; s=arc-20160816;
        b=VkbwQejmdRnixDWe+Gwk3b7kDsHmoXXdMwC2P0dyilCeLb5fYW6SHoCyGxWyAvvYJN
         FjWn6oEnK9JqHzRID5i+7Q3KC3KNcIdWLggKvLfGy8EbOtpWhZGWZBovGuoyQUnfaakE
         +gf84dtk+jUq6So/tmQVEQKmCxSjivrGGmZClwYY1UG4HW3fPKONN0O308keLPDYPoTY
         D0XkOiQmwYqUm2j4BwZfmiFEOhm4hfIaK6hYASVucotWnaNwE2ZMY4YMe5OY2XRTVkFk
         Xu8oHPRNT8Ey/AHySrEXYCU/weXQMEzGOuKfwX/V8aaUuju6RoGVI6aPuTWzxTKJksSb
         anbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=AfgdcZ7TNkjwHVN5bNo+bVfOnnp3DE4dHW2yQxijQ3I=;
        b=GxdfsO1SoZEanGee7bMQa2JqB1AllXr5RRM0sgcK3Hg4wPFd7Y5VhKElfMMl9+xbLd
         CVnTj/fM9b0VSc5SMVFrJa2FERNJzNOP66kckrgrwO2ndLi5uH+Is6SvZJiAFsjsy8Ku
         GF+BPfx+rk0Dk9v7XUQ5ZyCkttZhoHhKI3vq5HqHY/ENoCm4ERenHW7QOlwl32YMRAwe
         v6MfK0UUP1BepTpC5ynKNR3p02VFf9S7lYfTYMooXEift17SpLkvZQ+I0KL4q7zg13q1
         Wzg5kgqXx7VYR3dPxgNYfuQ9oYJtEZ1PTeUuG9KYGcI0soHpPBSbjMxtXze3ZywTZqEa
         47bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si942116ywj.135.2019.02.04.15.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 15:12:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:50813 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqnPf-0007Ns-Le
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 18:12:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnPB-0007Ne-2J
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:11:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gqnPA-0004IE-Bc
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:11:57 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52760)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gqnPA-0004Gw-4N
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 18:11:56 -0500
Received: by mail-wm1-f67.google.com with SMTP id m1so1688373wml.2
	for <qemu-devel@nongnu.org>; Mon, 04 Feb 2019 15:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AfgdcZ7TNkjwHVN5bNo+bVfOnnp3DE4dHW2yQxijQ3I=;
	b=HjtGY4j7e8i+ne3jiN0h/vxBUXM3Jj0st4CuV/5RqeZJTGG1HRhV0AKtoU7GeOX+Re
	sQqxfxZCGwEia4sMRYuJjSZEVQ3isLL0k8pJI++UlFwn9tmMICy+V7sLf5W9s2Gh5omS
	F+chzmVHS6uNgpbK9f8U81jO8NmtiNsCbwSgbZ0M32BhWgTwoJyCaHsOGF1SggWgvhNd
	kxBk0y+u3CisP3nY54dYK8pjlbjAQ5cMS07OBAOT8xONzzsqfG5ReVcw9xXXSctaENWK
	vRBDCPknO2ykdWZhbwueEMOhJU0V6FmAj8B+G6ujZ4PBc9F9K2sk0HCFq0sRvMImLTrX
	OxSA==
X-Gm-Message-State: AHQUAuZM0nJ5CkRuKL2mBD8NJyC+IC4kGZD9xJGSOiKY0RleA/l2+4lV
	gZPeqOrpNBkcKc3FObeH3PBEUQ==
X-Received: by 2002:a1c:ef11:: with SMTP id n17mr1211314wmh.112.1549321913572; 
	Mon, 04 Feb 2019 15:11:53 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10]) by smtp.gmail.com with ESMTPSA id
	p6sm17862713wrx.50.2019.02.04.15.11.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 15:11:52 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-17-philmd@redhat.com>
	<acf648c9-ce9a-4b9a-8e02-15645f615075@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5634aacb-5c84-e895-a8d7-65dfa92ef385@redhat.com>
Date: Tue, 5 Feb 2019 00:11:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <acf648c9-ce9a-4b9a-8e02-15645f615075@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 16/16] RFC hw/net/smc91c111: Convert init
 helper into an inline function
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Jan Kiszka <jan.kiszka@web.de>, Rob Herring <robh@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Jason Wang <jasowang@redhat.com>, Magnus Damm <magnus.damm@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tuy1qqT8QCNg

On 1/4/19 8:35 PM, Thomas Huth wrote:
> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> As init helper in "hw/char/pl011.h"
>> ---
>>  hw/net/smc91c111.c         | 17 -----------------
>>  include/hw/net/smc91c111.h | 25 ++++++++++++++++++++++++-
>>  2 files changed, 24 insertions(+), 18 deletions(-)
> 
> Why? If you move code around like this, you should mention the reason in
> the patch description.

Oops this one wasn't supposed to be sent, I planned to drop it before
sending but probably forgot because it was late friday :/
