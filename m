Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1078349wrq;
        Fri, 15 Jun 2018 10:00:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLFhnjkNkhuuXdJTIpimoDh95k8fzUspvL51rWk0qHoogN4RnrHejT77UX9ZJqiLQHYp3Ls
X-Received: by 2002:aed:3bf6:: with SMTP id s51-v6mr2305365qte.186.1529082009937;
        Fri, 15 Jun 2018 10:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529082009; cv=none;
        d=google.com; s=arc-20160816;
        b=VD+gr/hqjz8kEZ7dE7JIo+B5gHodYGWOyHr1o4aPXlikdwhWwRr6cIzRE3Ou8NJx0p
         xji34+SdCv7ULVlAqPDtuuhAnAwjb2FYfgd1Glhl2cJkus+ptBFSK5vn47YkRhyX8tSc
         M3C/p2bKAEKRux9EWCwoKZnWlpkLcstjp4xeK2sAbpVpFDhW1mFiBg/gG5vYrN/iBxHy
         rg6NqhYOa/kA55CaPAlGKqe82ttnClSlwWISJTMCIq/7MIuUTjXoDoo1fHr9exLHZHyt
         tq+qrOiudQ5/zcqpvRpOuq46xd7mkCSpt/awdUvCDUNwxsVqPVe8L4MrFHdjpGn10cdM
         ePYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=Uit9MUTxIgpzJ/CGxYXlN5A8lTZxYMWRcVKSgdfuMvQ=;
        b=yMZv1eOXOqHE+glMX96rvtiaWeOBjp8E9uNjrVTPyv49xKqk2GIEHTObefY7bpay1J
         jrxbwE4gLVk4PPlK+uNNdd4v9oycekYcluPhL9WI0MmyC47cJ3azfOVS8uHN6dDC+MNf
         bhgfdhv45kRSsJushRhjXM0qSwLxCk75qaXHId0wNH7UHZURSEGEQxohA9zI9Y0DN0tW
         1B/TwKGJeH8GefZ4aern7O/O9KaEExm29+TrR82qbtM5UC/rsYb5H/zsR1/wYF0zoiUz
         xylORrB2srOQ4GQeIJTgh8XgB+q+yoBCgx6kRNjT8T9Bke6d6Z/mnFvYrNpToWt92eWq
         qgAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67-v6si23582qkd.147.2018.06.15.10.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 10:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTs53-0006YJ-ET
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 13:00:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTrsI-0004ha-LQ
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:47:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fTrsH-0005CP-WB
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:46:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46096 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fTrsD-00059n-LI; Fri, 15 Jun 2018 12:46:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DECA402312B;
	Fri, 15 Jun 2018 16:46:53 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-39.rdu2.redhat.com
	[10.10.120.39])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EEC910FD2A7;
	Fri, 15 Jun 2018 16:46:45 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20180613122948.18149-1-kraxel@redhat.com>
	<20180613122948.18149-3-kraxel@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <9af3a798-2a20-24bb-8f07-b803a6c262a8@redhat.com>
Date: Fri, 15 Jun 2018 18:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180613122948.18149-3-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 16:46:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 15 Jun 2018 16:46:53 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [PATCH v5 2/4] hw/display: add standalone ramfb
 device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nvFzu+sGXKqG

On 06/13/18 14:29, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/hw/display/ramfb.h    |  3 +++
>  hw/arm/sysbus-fdt.c           |  7 +++++
>  hw/arm/virt.c                 |  2 ++
>  hw/display/ramfb-standalone.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc_piix.c             |  2 ++
>  hw/i386/pc_q35.c              |  2 ++
>  hw/display/Makefile.objs      |  1 +
>  7 files changed, 79 insertions(+)
>  create mode 100644 hw/display/ramfb-standalone.c

Tested-by: Laszlo Ersek <lersek@redhat.com>

