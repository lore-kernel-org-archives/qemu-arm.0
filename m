Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3102344wru;
        Mon, 1 Jul 2019 15:03:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxW4ovknz20F58TEkQXs9rT5n2vWrmBdFPQJ9IobKe+X+WXEQ1oByOD/2gzz2xHUXlkkGTi
X-Received: by 2002:a17:906:7c8d:: with SMTP id w13mr25029142ejo.264.1562018597079;
        Mon, 01 Jul 2019 15:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562018597; cv=none;
        d=google.com; s=arc-20160816;
        b=dL27Sv5AJzS8pFAIA8j/ehX8qvz6Xy4HqdbEvd454Qn8pZmJGfyqkNbyxuYpJvFPAH
         qIjgmrahy1WZeR5uIiYtbWvWxYe6PKqEllFy8JaOass3lIPMsx40EKCuI/XqZQNo7z+a
         Sdj/IPD+/9ZLhCNpPePm/hZOSTb7CQHH/v5rZpcwQ+f+D17Ez97MSFjIPPvnLce1yXnB
         GVw7QphsDZks7ojf3nLHGq6+LG4mvzI4IFeuVH4YnCS2FKw7Z0atQd8yqbtStTSu1CZH
         80VOjOM/iYXjGCCts6Li03VnOtzRB5/iJcdOicTWgEASNro42mmmexwY7YtbEfl/JT/X
         4zuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=dKB2Umh3Pp34bt2n2bl4TPAAqwbQYVzTk1oPuHSAwrc=;
        b=QUWYVp+L4Fq/r+qxMO7JhRvXN8nNY21TW1iJaLQuUUvuCvtwmgGVLqDIXeQ95dHTB2
         +qhhohMrLpGwLHkGneaUBcOteDA8Obr4aQBBcBw6enDUcJh7ErRhMwjyoghYnxt89p3A
         PimyKnWpsi5zoCKXifYqC2lOVhqM3Y8qrsEaDYxqSidwULCA9car3StnU+esbJDBy9Pi
         OUV0x67c3Yz/4xcNjs5Rwc0hTXsqRL6oXWTPiIJvSgrCctmsEWBBfRTbew9i8wgaj/OB
         gJfMqgONTxMZDZg9fnuiKbGLaxSOaxvgm8uWUJkYCNVGoJUBHltPnaGXJF6JjAtkAYQ8
         20yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s23si6355844eju.114.2019.07.01.15.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 15:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hi4OJ-0005jJ-W6
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 18:03:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48533)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hi3LF-0007Aa-Cj
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 16:56:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hi3L3-0004bC-UX
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 16:55:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38080)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hi3L2-0004RH-QG
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 16:55:48 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so944569wmj.3
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 13:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKB2Umh3Pp34bt2n2bl4TPAAqwbQYVzTk1oPuHSAwrc=;
 b=cRbLw6TbuSxxj/3131L+tnz4tnWOELr88Er2iOmmy3LMxBSAweDgVvrSCudUMzdxXJ
 sBOWVidORKfvbFBmVxkQ2fozHUyLi51VnTNyYqcJaJzkE7co7lecdqsoJdmL1ivzZgwL
 R7Ntxzt69CAonnLs6RRb6Zac0ZtZbvJETiM+fiAAp8zC1k+SZYjyVPsSAj5KBEWCrXja
 bJ/RotcTGk+7p8d8hK4pDVOcM+cZ13xdaGnCFV6rxfqCpO+lgPDifApxuvzBLLtfw7Sn
 PLQRPPqLWrwu/l266QSQaN62eALbqCLbMMs4vqv4jszVHJ+Tf5x/CB6vJl+ctCze3bcz
 TpMw==
X-Gm-Message-State: APjAAAW/1Ez2HoKoELq8FnFkQevAYBWNGoT326yMb3KEvopXtwBCiLbb
 4G/Gd67HUcVIVo1aVd9AtgrYVZN/nMg=
X-Received: by 2002:a1c:b68a:: with SMTP id g132mr370179wmf.66.1562004792286; 
 Mon, 01 Jul 2019 11:13:12 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id v65sm402838wme.31.2019.07.01.11.13.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 11:13:11 -0700 (PDT)
To: qemu-devel@nongnu.org
References: <156200378933.9862.9905804796969886990@c4a48874b076>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <81770e41-70a3-4e57-d7d7-501321843dd4@redhat.com>
Date: Mon, 1 Jul 2019 20:13:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <156200378933.9862.9905804796969886990@c4a48874b076>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/6] hw/arm: Use
 ARM_CPU_TYPE_NAME() and object_initialize_child()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, andrew.smirnov@gmail.com, jasowang@redhat.com,
 alistair@alistair23.me, jcd@tribudubois.net, b.galvani@gmail.com,
 i.mitsyanko@gmail.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 antonynpavlov@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xcMgFpIQhME2

On 7/1/19 7:56 PM, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20190701123108.12493-1-philmd@redhat.com/
> 
> Hi,
> 
> This series failed build test on s390x host. Please find the details below.
> 
>   CC      hw/dma/i8257.o
>   CC      hw/dma/xilinx_axidma.o
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c: In function ‘xilinx_axidma_init’:
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:568:29: error: ‘TYPE_XILINX_AXI_ENET_DATA_STREAM’ undeclared (first use in this function); did you mean ‘TYPE_XILINX_AXI_DMA_DATA_STREAM’?
>   568 |                             TYPE_XILINX_AXI_ENET_DATA_STREAM, &error_abort,
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                             TYPE_XILINX_AXI_DMA_DATA_STREAM
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:568:29: note: each undeclared identifier is reported only once for each function it appears in
> /var/tmp/patchew-tester-tmp-6umc5eop/src/hw/dma/xilinx_axidma.c:572:29: error: ‘TYPE_XILINX_AXI_ENET_CONTROL_STREAM’ undeclared (first use in this function); did you mean ‘TYPE_XILINX_AXI_DMA_CONTROL_STREAM’?
>   572 |                             TYPE_XILINX_AXI_ENET_CONTROL_STREAM, &error_abort,
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                             TYPE_XILINX_AXI_DMA_CONTROL_STREAM

It would be nice if GCC directly fix the patch instead of embarrassing
the author for obvious copy/paste mistakes...
