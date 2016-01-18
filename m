Received: by 10.25.159.19 with SMTP id i19csp1678299lfe;
        Sun, 17 Jan 2016 18:58:16 -0800 (PST)
X-Received: by 10.55.221.66 with SMTP id n63mr27993819qki.64.1453085896713;
        Sun, 17 Jan 2016 18:58:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p133si12647906qhp.53.2016.01.17.18.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Jan 2016 18:58:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aL01I-000640-CX
	for alex.bennee@linaro.org; Sun, 17 Jan 2016 21:58:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL01G-00063m-6g
	for qemu-arm@nongnu.org; Sun, 17 Jan 2016 21:58:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1aL01D-0005i6-0a
	for qemu-arm@nongnu.org; Sun, 17 Jan 2016 21:58:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55467)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>)
	id 1aL01C-0005hz-S3; Sun, 17 Jan 2016 21:58:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 8C65496BD;
	Mon, 18 Jan 2016 02:58:09 +0000 (UTC)
Received: from [10.72.5.6] (vpn1-5-6.pek2.redhat.com [10.72.5.6])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0I2vxxl019996
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 17 Jan 2016 21:58:04 -0500
To: P J P <ppandit@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <1452841240-30377-1-git-send-email-ppandit@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <569C54B6.3010404@redhat.com>
Date: Mon, 18 Jan 2016 10:57:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452841240-30377-1-git-send-email-ppandit@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm <qemu-arm@nongnu.org>, Prasad J Pandit <pjp@fedoraproject.org>,
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
X-TUID: 8h9HxcA3yNyl



On 01/15/2016 03:00 PM, P J P wrote:
> From: Prasad J Pandit <pjp@fedoraproject.org>
>
> While receiving packets in 'gem_receive' routine, if Frame Check
> Sequence(FCS) is enabled, it copies the packet into a local
> buffer without checking its size. Add check to validate packet
> length against the buffer size to avoid buffer overflow.
>
> Reported-by: Ling Liu <liuling-it@360.cn>
> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> ---
>  hw/net/cadence_gem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 3639fc1..c3a273b 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -677,10 +677,14 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>      } else {
>          unsigned crc_val;
>  
> +        if (size > sizeof(rxbuf) - sizeof(crc_val)) {
> +            size = sizeof(rxbuf) - sizeof(crc_val);
> +        }
> +        bytes_to_copy = size;
> +
>          /* The application wants the FCS field, which QEMU does not provide.
>           * We must try and calculate one.
>           */
> -

Unnecessary whitespace change.

>          memcpy(rxbuf, buf, size);

We probably need more check, is there any guarantee that size <= 2048?
If not, need fix.

Thanks

>          memset(rxbuf + size, 0, sizeof(rxbuf) - size);
>          rxbuf_ptr = rxbuf;

