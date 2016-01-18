Received: by 10.25.159.19 with SMTP id i19csp1745259lfe;
        Sun, 17 Jan 2016 22:49:25 -0800 (PST)
X-Received: by 10.140.155.87 with SMTP id b84mr29521501qhb.29.1453099765363;
        Sun, 17 Jan 2016 22:49:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c69si29557720qkb.11.2016.01.17.22.49.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 22:49:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL3cx-00046S-Ib
	for alex.bennee@linaro.org; Mon, 18 Jan 2016 01:49:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL3cu-000462-PW
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 01:49:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL3cr-0001Yi-Hw
	for qemu-arm@nongnu.org; Mon, 18 Jan 2016 01:49:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51933)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aL3cr-0001Yc-CH; Mon, 18 Jan 2016 01:49:17 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 814FB8EFE6;
	Mon, 18 Jan 2016 06:49:16 +0000 (UTC)
Received: from [10.72.5.6] (vpn1-5-6.pek2.redhat.com [10.72.5.6])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I6n3fd007897
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Jan 2016 01:49:10 -0500
To: P J P <ppandit@redhat.com>
References: <1452841240-30377-1-git-send-email-ppandit@redhat.com>
	<569C54B6.3010404@redhat.com>
	<alpine.LFD.2.20.1601181103130.30267@wniryva>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569C8ADF.8050607@redhat.com>
Date: Mon, 18 Jan 2016 14:49:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1601181103130.30267@wniryva>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Ling Liu <liuling-it@360.cn>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] net: cadence_gem: check packet size in
	gem_recieve
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
X-TUID: 09kNL3PxXJ68



On 01/18/2016 01:34 PM, P J P wrote:
> +-- On Mon, 18 Jan 2016, Jason Wang wrote --+
> | > +        if (size > sizeof(rxbuf) - sizeof(crc_val)) {
> | > +            size = sizeof(rxbuf) - sizeof(crc_val);
> | > +        }
> | > +        bytes_to_copy = size;
> | > +
> | 
> | We probably need more check, is there any guarantee that size <= 2048?
> | If not, need fix.
>
>   Sorry? The above check would fix that, no?

You're right. Apply to my -net (and removing the unnecessary whitespace
change).

Thanks

> --
>  - P J P
> 47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F

