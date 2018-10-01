Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4040052wrt;
        Mon, 1 Oct 2018 09:35:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62OQR1YgWfWJ/LqK0q61FqxT2WGjfCX5xB7w6RcjdQsxbXW8be5/gvS5Ln6OW+7QrwLw5+o
X-Received: by 2002:ac8:24f6:: with SMTP id t51-v6mr4722314qtt.43.1538411751248;
        Mon, 01 Oct 2018 09:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538411751; cv=none;
        d=google.com; s=arc-20160816;
        b=lQsTGkZgEt4HKVD0TSadRBnmKOYFYGcD7lkOxf8LuF+A2GdQuJ5Q4L4NXRtEjQn7gd
         5uILc8/1ASsY4i34crqpOeGKaHG8oO1hcRAVLiSqLmWSTE56Pu9wzL+MUT298T7OSMCb
         vxAgC3zohX0CVXuee2hupQtpCRa935UrO/1zwY+dpG14dSbIVqwYfFzHqI5Fm2BleF0t
         2GJyJBQarYhR9Nivm0+RPvV+sBJ97b79/qyD+eXZpQEbhwxodD4gIPCnUfO5ANCfT88t
         QhJ2R8Y7X9cINzCZtIezGARdUyzg6csgLxs2COiz+A0MSGh72LEPomN4Te8+NMZe/iuc
         XXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=KHKsXau6fJ9Skb+MarTE7GvFOP0eM1XHC6qm6somkl8=;
        b=Z2gG3VLk/qdg3ryoMV5YckFTUXSf5FAw2mXIougOte1JSEy7lEZyJjkl3ypxsBbV9x
         10jOLpO9CvvXc18EAa0FuEHtO3TExWxYk+cjMoIt8b5/uO/Nt3X0cKZaK6j7oWMhWsdZ
         eHYOuDAHOTJBHpHxBj0sCP6SQglI4Z39g/I+S+lGG3jRH4ktKLAprU7cWnpPSxqqzT9k
         LAlYuv+0xy8mH+qxttORSIaG626UxR0blt1tkXvnUkZVhT5KpdbMcMLd2Nu3wCwPBX8o
         S+Uudx5kQulVq8X7fA93CCPz3LmHCP2nYWilCBCntRUnmrmuzdEmEILEthCXuZH7W6im
         jRFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i31-v6si3888839qtd.282.2018.10.01.09.35.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 09:35:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g71Ak-0000rU-Rj
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 12:35:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71AP-0000rD-Kb
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71AL-0008Uy-P0
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:35:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37917)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g71AL-0008UN-H0
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:35:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id a13-v6so3997549wrt.5
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 09:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KHKsXau6fJ9Skb+MarTE7GvFOP0eM1XHC6qm6somkl8=;
	b=pgK5/gaKXG7lVzQK715eW9pUcjDfM9TQU+onqTn3gh4lYbuG9jqssrbK+46RhkLIYf
	fPTPEmolxrbW4PWAycyxOpf+2dSuYF5l9Uh1ir1nBBxIOtgZRcUSNIwFgg3K4xrgAUOW
	z+4QyRIkylKSPD3Pd6Cvs07FlUiLeNCJuHZ2+RDQrtsbHWAhgFCULT/aFdTC4DKICTXA
	bIJt1FVcvJm4CFT3S4XoG0hckzbdoJ8+oJEeg2S05Dy8uduIxb1wbBoKb1jfwR17PR8C
	Z9y5rOUJYjlhHIpF9aR9+3SxgIAlcnfFguvM6x9NzoPOj8qe36uwsAp1gtQaP2LnN2Xt
	W5og==
X-Gm-Message-State: ABuFfogo6Zr41nBAoNs4SAGGr0bVOnoH4dPhDatypZI2eOwu+gvY8c/5
	rOtzGtxrk7qEhIgrUB1QxKpsYw==
X-Received: by 2002:adf:e607:: with SMTP id
	p7-v6mr7786130wrm.254.1538411723401; 
	Mon, 01 Oct 2018 09:35:23 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	y4-v6sm16594646wrd.25.2018.10.01.09.35.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 09:35:22 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-15-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <055b86a6-66ad-6486-d1ec-0ba4f7913c65@redhat.com>
Date: Mon, 1 Oct 2018 18:35:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-15-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH v2 14/15] gdbstub: add multiprocess
 extension support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4WzvFdztNyL5

On 01/10/2018 13:57, Luc Michel wrote:
> Add multiprocess extension support by enabling multiprocess mode when
> the peer requests it, and by replying that we actually support it in the
> qSupported reply packet.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 51cc11981e..89f6803533 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1692,15 +1692,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>              put_packet(s, "OK");
>              break;
>          }
>  #endif /* !CONFIG_USER_ONLY */
>          if (is_query_packet(p, "Supported", ':')) {
> +            if (strstr(p, "multiprocess+")) {
> +                s->multiprocess = true;
> +            }
>              snprintf(buf, sizeof(buf), "PacketSize=%x", MAX_PACKET_LENGTH);
>              cc = CPU_GET_CLASS(first_cpu);
>              if (cc->gdb_core_xml_file != NULL) {
>                  pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
>              }

Maybe move altogether:

               if (strstr(p, "multiprocess+")) {
                   s->multiprocess = true;
               }

> +            pstrcat(buf, sizeof(buf), ";multiprocess+");

Regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>              put_packet(s, buf);
>              break;
>          }
>          if (strncmp(p, "Xfer:features:read:", 19) == 0) {
>              const char *xml;
> 
