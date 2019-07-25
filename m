Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10530876wrv;
        Thu, 25 Jul 2019 04:38:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz0/Uy1Tc+aLA6kd1RasOI7cF7EVSErPz2ffQOwKWbppdud/TKFZkOxOTjD7fGVAEI04qxP
X-Received: by 2002:a17:906:9453:: with SMTP id z19mr62092901ejx.287.1564054728981;
        Thu, 25 Jul 2019 04:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564054728; cv=none;
        d=google.com; s=arc-20160816;
        b=HuFmNgOWaRTy/K4wrcV4YR/hNdnn3tlWPgVsnexoN6rDI45XPZHD7YZLSsf8ksQhii
         4j/a0Lm3QxWrf+u72JwBU+xBH80aR8HoOk52jANJYp79bOCEGGq+a9CmSpc1JgTbkfBK
         xwhdjHyDNpDGQmOBF9j6Ua/VjE2UdwmWSy0ifnq7/0eEON6ZmGUFa3ObCtP5BFYhDGWG
         YfJe+6mBYduQMM/jY4dM24RbgDARxKs8ytRNa4sZ45+RgQG4eeVDuJeB6uZP4z00My6r
         hXZTVDqdqXG232PxvwzYK4isIS4ROhOWr3PO7Pkcz3caEHsELZQaETIQvCEwqrzRqxxs
         dQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=vmaq7xj5aFDq5kkR9Wh85IkW/nR3gZ0zq9+Xe5JGZRM=;
        b=cbds76Mzv+egWlyAlfg5yCKzjISxWptVcTadfRb0R8g9URMeplyzFEKtdjfUWBxq5F
         PgtOsY8v57yBn35s2dH24T14s2SMNPlKdr1VZ2TCaC4OOoy7wMjEaRnL7phAxeQlhxdM
         fjr2bXpC4pJfciWov5Is12oWL49G+lbpD+DUHLBnyUhiPj69DlChSVm4wlxfEi9k+IZ/
         EYwZzNUSKfJ1mop/zR187DeBdEc/WhA1fZgtJGK5ssHrGgAWRxwAAhrG4NB0/3pJvlas
         6zW3o0ATlr6mmP92x+5dHjqqz+/RPskYSFMilSm2uYusjpV9kQxl2WDKpWkqiYYJa8jV
         Cu6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si11202616edd.17.2019.07.25.04.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqc59-0000ji-Rf
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51904)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqc4m-0007x7-7r
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:38:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqc4k-0004Hv-FX
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:38:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41027)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqc4i-0004D8-BY
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 07:38:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so47189518wrm.8
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 04:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmaq7xj5aFDq5kkR9Wh85IkW/nR3gZ0zq9+Xe5JGZRM=;
 b=iL2P6XJNiqqQuqDBMyKssiArnSkxD6rEes/Lt/waZ5FEOu2c5hUb8ojvvtS1YxC4pM
 0k0ylCReM9DuHNCW4I3hARZ2YtIlczScr4Aq3fMrSBSW3/N2j1zykFzTE3fOqaWyHuU5
 OXCjV4LwARQo1Rdj0K4XVJcFyETtiMuggE4NHFvhoUqe37tcFr1k16XHt0Is7I1tAWbS
 LiIYSxneIHbXd4Gn2WMjWje/meyUEclvAfYb7qKdumdkVgJxQfJGSuSMzD8MAIxMwFNQ
 b6n+R+i6f/ufSlWEGdVBmHkWrsndVEAyKIKG5gqmPbdm/IB8aGMzCs0gmyamHI9x+4m+
 WKMA==
X-Gm-Message-State: APjAAAVn6q/ZixtPHknxgkmrhz3ZCIc1sn1BNi+ft8dFSXEp/Vf9G4le
 u8hCL1r3amR243FFvdLrXTGzqw==
X-Received: by 2002:adf:e446:: with SMTP id t6mr95530933wrm.115.1564054697306; 
 Thu, 25 Jul 2019 04:38:17 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id d10sm59151725wro.18.2019.07.25.04.38.15
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:38:16 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048532722.5565@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <c35579f0-2a7d-a2e6-ff18-65c5013e1684@redhat.com>
Date: Thu, 25 Jul 2019 13:38:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048532722.5565@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PATCH v4 09/15] cputlb: Access MemoryRegion with
 MemOp
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, edgar.iglesias@gmail.com, alex.williamson@redhat.com,
 arikalo@wavecomp.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 rth@twiddle.net, atar4qemu@gmail.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, stefanha@redhat.com,
 shorne@gmail.com, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lWj78Dv6Irfe

On 7/25/19 11:55 AM, tony.nguyen@bt.com wrote:
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  accel/tcg/cputlb.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 523be4c..a4a0bf7 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -906,8 +906,8 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_read(mr, mr_offset,
> -                                    &val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_read(mr, mr_offset, &val, SIZE_MEMOP(size),
> +                                    iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
> @@ -947,8 +947,8 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
>          qemu_mutex_lock_iothread();
>          locked = true;
>      }
> -    r = memory_region_dispatch_write(mr, mr_offset,
> -                                     val, size, iotlbentry->attrs);
> +    r = memory_region_dispatch_write(mr, mr_offset, val, SIZE_MEMOP(size),
> +                                    iotlbentry->attrs);
>      if (r != MEMTX_OK) {
>          hwaddr physaddr = mr_offset +
>              section->offset_within_address_space -
> --
> 1.8.3.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
