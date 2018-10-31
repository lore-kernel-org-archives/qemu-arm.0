Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp82874wro;
        Wed, 31 Oct 2018 16:51:21 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fXMzV65F8rYPxSWWnPuL+UP2JoH8fzfN4yJdR/thpb+PI6jQBXb2AP7u5MFSqRqIlFqo3D
X-Received: by 2002:a37:14a4:: with SMTP id 36mr4430254qku.126.1541029881604;
        Wed, 31 Oct 2018 16:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541029881; cv=none;
        d=google.com; s=arc-20160816;
        b=HcfwSjcQZDylfbP8pkL3m7r89HLm5Z2Cpw+s4hESq4UBnuaiPiEs3tklUozVjUlw5P
         kZWGzUnSy9atkIjHaHsA2SUTl8SNJegxyZCL5Qs4WBK06YYAXRWoVEpOFxELHrHFhvNk
         JANE9MdLREPB7fVb64bUfNhFuxHjHaZW06BI5iITHFNAr1h+NyVWqe5TWy9/4V/FCkWz
         lPbXvYYk7D+semM6FXX1QbghDR43bhHK4gajq8FC7IYX/WWj/+QR/q8GyycZ4jaoz4x1
         Ie1TL4G0ZnlAWbpvKKNvn3WLqJcfZQP8sumkpT/0bwnS21lVkU+eFHvP609Yl9trygZ/
         +afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=B8kUTknz17DXRxOUwFsEVsUwMuZHLDndUxJydqDAwjI=;
        b=MYivgBdURy8o13vnGiST1YXyNyCo+KSiH6aQZwH0aOorAMPhcpfPAK1Pk18qn4Cr7c
         Jj1xcsitMZkCXHM9ImnbUIJd3wL7Kbpubp6s4WbCNEhwupCwpVDCk1abiP7Fo1X39V1U
         62QNa3fUUtgnUqHS5rAIFcdbzy2mNzjElGcauqD/NsHmDjxy/h2AhE34krE4PAyGgJsM
         9Bj/j9BHR/TdhOKlKU8lAohNvXL0Ze6a28BsIWSe9e6qXmbYVia/njCQbWUlpttNdQgE
         uTFM2Ke4Lfeu1gouDBHBnc9LrtPvOjBFjhpBeF3GFlgy8dpZCHkL7NOj8hyrXHwtXF0/
         9sUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YmA/Zhu1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y19-v6si213570qki.259.2018.10.31.16.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Oct 2018 16:51:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="YmA/Zhu1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gI0Gf-00068f-5k
	for alex.bennee@linaro.org; Wed, 31 Oct 2018 19:51:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI0GT-00067M-Qk
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI0GQ-000884-Im
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:51:09 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:34006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gI0GQ-00087p-Ck; Wed, 31 Oct 2018 19:51:06 -0400
Received: by mail-pg1-x542.google.com with SMTP id k1-v6so6707216pgq.1;
	Wed, 31 Oct 2018 16:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=B8kUTknz17DXRxOUwFsEVsUwMuZHLDndUxJydqDAwjI=;
	b=YmA/Zhu1xvVpXWsCD490vDnFmgneegHESlMjIol6Bd3fbSslQJa6BLeQVJ/1Bt7ZSj
	HT/VjsnH7qtHvnIWQARxXBmzA9lAoRrScHejAR8uwDaPrrTgxvXuAtQR5non8T7qfg1m
	AJTfJGdx8Nuk9/rYmhVKrIAMLoTOfUQrM31aRy7sUP/Xm0JLr0zdibwh0fygXhfj35Ml
	SFfQxj2+KIO3eyqjVqkKGDXLzDMOF1aPjAFUXjYkE50Fuj2Ez9gvScUi0BYQIUdg8PUc
	DLeToDwE2G2nEOez4phRKYMMbUr12tXZYyGyYk7/PXIo2oogkhsSaPaBggy2Rb6fYgUB
	9Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=B8kUTknz17DXRxOUwFsEVsUwMuZHLDndUxJydqDAwjI=;
	b=Uguf7kEc2a8+6n0AYx7Ka5KIEF5YSlyOW7UBAyGgvP/0UeWHB9tPSRFpT1qNFmv0u/
	mC2LBqS1Z4S769MV4tgl964gY+QySSsqzsotmYCShA+Vwypg6QQebXXmcMXWFgtMQxpe
	4wJIwKutynsLAShtIL1ov9QMTvJyN+9ycgJ/TAnFXuumgHCR3Tl+xkw6IrmfxwgVHKcD
	GSisELHxW52jpW/812YzomxU8fMHewkKIm9GUOPeb+p7xfZFHh3QJlJvWohXpfIhdXXI
	bJchIANPxEe4ERWWS6yOjOc5RcLfnP51xTLTPCn3CJFnJBLKXoKQsbbwcPRiKLE22vHY
	M1qg==
X-Gm-Message-State: AGRZ1gIYiEaQaLPg8PKWUJ0ETd29r+11FfQ7n6W5ZDV4Tx2exu5oczOa
	DeJcHSd1JPE/HwujKfpdBUV0Iz80
X-Received: by 2002:a63:4c4e:: with SMTP id
	m14-v6mr5050466pgl.173.1541029865106; 
	Wed, 31 Oct 2018 16:51:05 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	c70-v6sm6730543pfe.93.2018.10.31.16.51.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 16:51:03 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181026081653.24602-1-luc.michel@greensocs.com>
	<20181026081653.24602-16-luc.michel@greensocs.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <7893bcd8-5ff8-b4f0-bbfb-0834604d2257@gmail.com>
Date: Wed, 31 Oct 2018 16:51:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181026081653.24602-16-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 15/16] gdbstub: add
 multiprocess extension support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9goC2ivKEyYo

On 10/26/18 1:16 AM, Luc Michel wrote:
> Add multiprocess extension support by enabling multiprocess mode when
> the peer requests it, and by replying that we actually support it in the
> qSupported reply packet.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 09480df2bf..a1b63de34b 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1718,10 +1718,16 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>               snprintf(buf, sizeof(buf), "PacketSize=%x", MAX_PACKET_LENGTH);
>               cc = CPU_GET_CLASS(first_cpu);
>               if (cc->gdb_core_xml_file != NULL) {
>                   pstrcat(buf, sizeof(buf), ";qXfer:features:read+");
>               }
> +
> +            if (strstr(p, "multiprocess+")) {
> +                s->multiprocess = true;
> +            }
> +            pstrcat(buf, sizeof(buf), ";multiprocess+");
> +
>               put_packet(s, buf);
>               break;
>           }
>           if (strncmp(p, "Xfer:features:read:", 19) == 0) {
>               const char *xml;
> 
