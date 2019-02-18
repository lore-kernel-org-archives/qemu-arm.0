Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2086728wrx;
        Mon, 18 Feb 2019 01:32:21 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYZYoEDxYHWrhmbCkI/gIisyEZRxRYFIT6JMrQzTOg4P1mRy7ap5uVfliVwuE3LPKdVGwkv
X-Received: by 2002:a25:764a:: with SMTP id r71mr6688075ybc.113.1550482341822;
        Mon, 18 Feb 2019 01:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550482341; cv=none;
        d=google.com; s=arc-20160816;
        b=wp/E1Af951lSdk2SBfPY2FlpYVAafWoSYVuUrqS76laxTDicNi0X4UCbqP2VsexB+W
         gVB7/eUuD2H6A6wLSSQFM4d0P/29Zfo6g1TvagZtnJKCiBPpdr+QLaoGU4NmvomhstQN
         JtVPtR08L+76HYnMqWKWggvuneT72dU98hs2BvzB7XpuJBKtELwc9oenJcGn0nvgDnV9
         5jO0hoYu2iXQkj+nYW5JBCOlWYlvvlKB24Pi8bGHOufv4GdNxBhRYO1ty8XChvX6uPpv
         s4rBEkLWIP9Alo54FGdtv5WkdfkTwn0B6wKl42XvQ3cd6mzoRyE6c52OUiRqVXonN6zr
         hu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=wrYgKjS4wfePuHeyQl774oUlBTB8LeTA0vPO5hm9MNE=;
        b=QAsKtWjyjuS3exRxzfcNjsxHXTzD5Wav6o6y5P6nN0nuSDk3hcPCePT4XProOtQsi3
         xOTMor3zbkG4VzoxYhDR30xE+eZagHAW2kZNKsqBW53TJqqF4TVVdNusKKp63XoAMD8c
         8o5tjdTmF9YpChow7y0+j4F6rqoo1TmlDjFbhegZNsFbarXwAY+0oWaP8GgqDL3OfjVi
         iiEZJrYpaUdSHv+8fZsKNy1IemwY5yaQqhR5o4jJnLBO6fAgXiaq4xiHyTbAt3sebDF0
         BRkr2xJG7HqnDWV7DyEFpYTuZeJIpBqVzqVoy+Fz/uiYHuOoGCl3gkZ/ZG8ZXG/G5Ljj
         JHrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c127si7432678ybb.135.2019.02.18.01.32.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 01:32:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvfHh-0007yy-8k
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 04:32:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvfHN-0007ve-CT
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 04:32:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gvfHK-0007gp-OI
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 04:32:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51570)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gvfHK-0007Wc-8V; Mon, 18 Feb 2019 04:31:58 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 475BFC0EA416;
	Mon, 18 Feb 2019 09:31:44 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-41.ams2.redhat.com
	[10.36.112.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA60F411B;
	Mon, 18 Feb 2019 09:31:41 +0000 (UTC)
Date: Mon, 18 Feb 2019 10:31:38 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190218103138.21aa9c05@Igors-MacBook-Pro.local>
In-Reply-To: <b94c91de-5390-b04f-27d3-f183d010f730@redhat.com>
References: <20190214140714.15738-1-imammedo@redhat.com>
	<4d8518f7-5272-fc18-d5c7-20c4cafdf7e8@redhat.com>
	<20190215123317.6903b818@Igors-MacBook-Pro.local>
	<2d99aca8-5ed0-bea3-4a4f-7b2a8e89b049@redhat.com>
	<20190215164209.54a6f747@Igors-MacBook-Pro.local>
	<b94c91de-5390-b04f-27d3-f183d010f730@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 18 Feb 2019 09:31:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] memory: use
 memory_region_init_ram() instead of memory_region_allocate_system_memory()
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, jan.kiszka@web.de, atar4qemu@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HZSPhCG8wnyb

On Fri, 15 Feb 2019 19:18:50 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 15/02/19 16:42, Igor Mammedov wrote:
> >>
> >> What about -m, too?  Then you'd specify a memdev instead of the initial
> >> memory size.
> > that somewhat what I've planned,
> > make -m X translate into -object memory-backend-ram,id=magically-get-what-board-uses-now,size=X -machine memdev=thatid
> > 
> > one more reason for memdev vs device is that -numa now uses memdevs and so far it
> > doesn't look that non-numa initial RAM would get immediate benefits from using -device
> > on most boards (well, I couldn't come up with any modulo backend/frontend consistent usage)
> 
> What I meant is what about making the non-NUMA option -m memdev=thatid
> (and the automatic translation you mention too).  Yes, bikeshedding. :)
sure, I can add it,
it would be just an alias to machine.memdev


> 
> Paolo
> 

