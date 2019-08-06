Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5102997wrv;
        Tue, 6 Aug 2019 03:57:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyx4oIEOWzH6yJXc+ANjEMDN38eceu9nM4Kx0/DqzwauNgnW88+c0XCnBp1U6HjVqsBNzig
X-Received: by 2002:a50:fd0c:: with SMTP id i12mr3214242eds.55.1565089073860;
        Tue, 06 Aug 2019 03:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565089073; cv=none;
        d=google.com; s=arc-20160816;
        b=UoVuzdFQ3J/KsozKhV4qVOidS8ySs/92EVSLJ4ZBmw08FXLq/1OxwN0Rs29Gr9rBuG
         815YUsVvtKIlQmtsXOPcXGVc3W+j53x7W3ES6AptISyrfQgDScnQ4DQOwr1YYdYtiE4q
         8TYdq77/gL6f0dc0vzUdM56yCPh3SIP2iIkVTTJBbau+xc82EfQDwjSfOtY1MIplJXrZ
         KsltREj7JJ+1K25HIkDkstJWioW6iEvWkLTD7SflkgqcJa4wyAroIoEKwVwqW03X5JI+
         0Qod9/s3HOO5BuvBN2tg+LHFOeze0VcHjQUnIIv72yjltBchBrdHK9eafrnJKapbwz7a
         Vw7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=Bm++tRfJLR6gx6xLf4+qVNoCTr6y24Gn+Rxn9bUAAMg=;
        b=wVDSZ4c5N7TH+6HZN1c3c5Fhcj9dgZ5/az1Pf2iApv2JuuCX9i5zOhFA7NhmFc5fH3
         62d6sD72q0VV2zc9cxYamocRq+1aALu/EYFTM1ZiGDl4AtuUu6EtB66wr+ciGwAjUltU
         7OLspewxhbbT1/Gk52KTh+f8VMNMhbQWjsiKDmM/T8gKIZ/gM9M081AtgF+dBRqr0oPv
         KtKpHWwBsUT3qCsXSYwDMUCmK5fBf8QLcAl3YYYosyv/04w5jzPZr+V/vQJHyz2KpS48
         SnDTxL9ZgI6Q8t33c3SS9FS/pKSCjPulKwrMJzujSgR6zRItnzCfK+SDexJHQr1bnGPQ
         uBoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si27662686eja.24.2019.08.06.03.57.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 03:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1huxA8-0000QR-Vw
	for alex.bennee@linaro.org; Tue, 06 Aug 2019 06:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1huxA2-0000PV-FE
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 06:57:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1huxA1-0006JT-I7
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 06:57:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42190)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1huxA1-0006J2-CH
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 06:57:45 -0400
Received: by mail-wr1-f68.google.com with SMTP id x1so37537754wrr.9
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 03:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bm++tRfJLR6gx6xLf4+qVNoCTr6y24Gn+Rxn9bUAAMg=;
 b=IhMtZYnO1gdHHw0yChPFqYvksLYP1gkgwyWrzecWvJATH9pPR3PFME/7AimMcmjc46
 PSAxcXBTfr8ZsKfqJ5652doK+XJPXCT+SSpT3d6dI3ciJSQOitqsNKLH+hxr9mTJrxze
 9oLZNKCoYGbYp8W34UP4k8v85bK7gqRZ5roiwZ4IATGdD+nm8VFSYyJHHct5pog9yLTH
 V/AV16KJl1vyrIwJUSrfF2tnlZzwI1l7kBppIjJE7qIVbaRmOSkcl3Yvr3D5lJxIcoLf
 eGoqVqjGpL0eSitlxgGHrZ6iRm/diMGY5x/peIriyFZ5PuHUC7ZeJj5PnHKeurtik+Fz
 wreQ==
X-Gm-Message-State: APjAAAWrysK1A7VxnqqaQi4oV5+ukIv9VajEsIUtxLZT3H0mhFE4VxmK
 W6L6Dkq9sVdUJN3/+Tm7tOmdkA==
X-Received: by 2002:adf:afe7:: with SMTP id y39mr4040045wrd.350.1565089062785; 
 Tue, 06 Aug 2019 03:57:42 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
 [79.13.201.122])
 by smtp.gmail.com with ESMTPSA id l9sm68223969wmh.36.2019.08.06.03.57.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 03:57:42 -0700 (PDT)
Date: Tue, 6 Aug 2019 12:57:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Message-ID: <20190806105739.ypoa545l4vigsscg@steredhat>
References: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw: net: cadence_gem: Fix build
 errors in DB_PRINT()
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 83rn5Pa5aIG1

On Mon, Aug 05, 2019 at 08:52:54AM -0700, Bin Meng wrote:
> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
> compilation errors in DB_PRINT(). Fix them.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>  hw/net/cadence_gem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d412085..7516e8f 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>              return -1;
>          }
>  
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %d bytes to " TARGET_FMT_plx "\n",
> +                 MIN(bytes_to_copy, rxbufsize),
> +                 rx_desc_get_buffer(s, s->rx_desc[q]));
>  
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
> @@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
>                  DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> +                         "0x%lx\n", (unsigned)packet_desc_addr,

What about using 'z' modifier? I mean "0x%zx" to print sizeof(..).

Thanks,
Stefano
