Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp10524541wrv;
        Thu, 25 Jul 2019 04:32:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyapf1xZQiB9HP11A6FQ4450lX5qfcjfQUKXeK5DvtAlCC3wmR7XshLEA/1eW7io7f1i/Ow
X-Received: by 2002:ac8:4808:: with SMTP id g8mr34410135qtq.3.1564054351758;
        Thu, 25 Jul 2019 04:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564054351; cv=none;
        d=google.com; s=arc-20160816;
        b=F+0uQEhKheZ6RMrMHLNVhB5ag295Dcxu4oFcNtAhHoh4OVVsSh6qO6ZcPEPbj4BRZW
         6Zzms0HoRdzh/HShGcGW9U56UtarroL3xIfmhQ6dfWpNYMaO4YgGDDyhbhiCS2zp2mdH
         uw1D+z8v1mjmYXUfXP1JnfU8Qz3Nw3NPXU4O+UZHXkOPlA8UlTY/gdNheB/J2Pfr85Yq
         AuZWRGqZSITtBkx8GSBWQuHT1nN1nt5PvLX9cvAdJ8RFAbwN3ehbL4/UufMvcd+a8yUS
         gQBEtDmMKbxswQqy0vuzj3bVgVV32mAD//3aJ28uI2VE+U3AP91hkyxuna7X+uheQw1S
         GUiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4Pv32FVpU5zV0ZEDRiftCp/cKWy6ZBt/RMwUu782exw=;
        b=vgkzSv8b0URw6OBzsr979iGxFACjeAS7t76TrxwhwHYBV9kdJB6EqlOaVHIrdFqrJP
         h5Djwo21PHLTUpvG0DrgBToH7WVrPjrkco/U/sMQhir9nnyZoyriwKCZqbc3z3UoT9zX
         6NCDrbXoADVud4CdFGtfa4E74sVnIljlZd/V8IJPVroyVSJexx9nGgrohgJIDwj0JVRU
         FCQL9GaOalM8tbbifAK2bzef1xDeT3NOfaUFjI+IASS34SsWTTHkJsrOAhe7F8MuocMr
         XxN2dUfXnU4DB+2vYOyZjrFKu1M1cDBu2qACDniM7WAAXQ2JAEIbXofmQGdH5s1cX71d
         uXtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d53si32039509qte.364.2019.07.25.04.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 04:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqbz5-0004uE-3t
	for alex.bennee@linaro.org; Thu, 25 Jul 2019 07:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hqbyx-0004cz-C1
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:32:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hqbyv-0007is-Qr
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:32:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45401)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hqbyv-0007i8-Jq
 for qemu-arm@nongnu.org; Thu, 25 Jul 2019 07:32:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so50342862wre.12
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2019 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Pv32FVpU5zV0ZEDRiftCp/cKWy6ZBt/RMwUu782exw=;
 b=RwDDou/GxyoIQciDSmPJe3odmCCKuQT4eyRI+bUSHucj7vBZ+qd3mZ6FpQ8QXd6nOE
 MCg5NQdHvYOLYJdWdx1zqj88+F9rqJNNtHoEUVs6IyCyhGE2Xxj9eWniDZgy7aXcLxH2
 v9979kekNP0pOKPqFugdeGM+YV7SkSHOxD7vwe0FnmsQ2a2l7TILCfRlNSfRdUI4vTlM
 uNCEHLmTzQkHwkWRTPK5FWCN5KVDHA6CbBIUeDnxZsG9c9URugYEBtF2EHSI+9NoO2T2
 gSDF30xVIm/sWONV7TNfkjKalX63XMs3YzzSpu4keKWyMQ6KukcOsKOdIVl1PsJhm2JM
 YLJQ==
X-Gm-Message-State: APjAAAVQRyGaYpXdU8gfsWiCXY1AL7HCvDfFNR62scc/mc+Y/WCLvoo+
 ZLVajoLU4R3GzHAm55n0IbUsVw==
X-Received: by 2002:a05:6000:145:: with SMTP id
 r5mr14988733wrx.208.1564054340693; 
 Thu, 25 Jul 2019 04:32:20 -0700 (PDT)
Received: from [192.168.1.37] (190.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.190])
 by smtp.gmail.com with ESMTPSA id c4sm39050957wrt.86.2019.07.25.04.32.18
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 04:32:20 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <45d1ebe4b2ed4c039c9da20a738652df@tpw09926dag18e.domain1.systemhost.net>
 <1564048510876.64711@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <35669616-b61d-a76a-86d7-fbc3beb5050c@redhat.com>
Date: Thu, 25 Jul 2019 13:32:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1564048510876.64711@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 08/15] exec: Access
 MemoryRegion with MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 david@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5EwZPyW7KvG3

On 7/25/19 11:55 AM, tony.nguyen@bt.com wrote:
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  exec.c            |  6 ++++--
>  memory_ldst.inc.c | 18 +++++++++---------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 3e78de3..5013864 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -3334,7 +3334,8 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>              /* XXX: could force current_cpu to NULL to avoid
>                 potential bugs */
>              val = ldn_p(buf, l);
> -            result |= memory_region_dispatch_write(mr, addr1, val, l, attrs);
> +            result |= memory_region_dispatch_write(mr, addr1, val,
> +                                                   SIZE_MEMOP(l), attrs);
>          } else {
>              /* RAM case */
>              ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
> @@ -3395,7 +3396,8 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
>              /* I/O case */
>              release_lock |= prepare_mmio_access(mr);
>              l = memory_access_size(mr, l, addr1);
> -            result |= memory_region_dispatch_read(mr, addr1, &val, l, attrs);
> +            result |= memory_region_dispatch_read(mr, addr1, &val,
> +                                                  SIZE_MEMOP(l), attrs);
>              stn_p(buf, l, val);
>          } else {
>              /* RAM case */
> diff --git a/memory_ldst.inc.c b/memory_ldst.inc.c
> index acf865b..e073cf9 100644
> --- a/memory_ldst.inc.c
> +++ b/memory_ldst.inc.c
> @@ -38,7 +38,7 @@ static inline uint32_t glue(address_space_ldl_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 4, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(4), attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == DEVICE_LITTLE_ENDIAN) {
>              val = bswap32(val);
> @@ -114,7 +114,7 @@ static inline uint64_t glue(address_space_ldq_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 8, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(8), attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == DEVICE_LITTLE_ENDIAN) {
>              val = bswap64(val);
> @@ -188,7 +188,7 @@ uint32_t glue(address_space_ldub, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 1, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(1), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -224,7 +224,7 @@ static inline uint32_t glue(address_space_lduw_internal, SUFFIX)(ARG1_DECL,
>          release_lock |= prepare_mmio_access(mr);
> 
>          /* I/O case */
> -        r = memory_region_dispatch_read(mr, addr1, &val, 2, attrs);
> +        r = memory_region_dispatch_read(mr, addr1, &val, SIZE_MEMOP(2), attrs);
>  #if defined(TARGET_WORDS_BIGENDIAN)
>          if (endian == DEVICE_LITTLE_ENDIAN) {
>              val = bswap16(val);
> @@ -300,7 +300,7 @@ void glue(address_space_stl_notdirty, SUFFIX)(ARG1_DECL,
>      if (l < 4 || !memory_access_is_direct(mr, true)) {
>          release_lock |= prepare_mmio_access(mr);
> 
> -        r = memory_region_dispatch_write(mr, addr1, val, 4, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), attrs);
>      } else {
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
>          stl_p(ptr, val);
> @@ -346,7 +346,7 @@ static inline void glue(address_space_stl_internal, SUFFIX)(ARG1_DECL,
>              val = bswap32(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, 4, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(4), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -408,7 +408,7 @@ void glue(address_space_stb, SUFFIX)(ARG1_DECL,
>      mr = TRANSLATE(addr, &addr1, &l, true, attrs);
>      if (!memory_access_is_direct(mr, true)) {
>          release_lock |= prepare_mmio_access(mr);
> -        r = memory_region_dispatch_write(mr, addr1, val, 1, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(1), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -451,7 +451,7 @@ static inline void glue(address_space_stw_internal, SUFFIX)(ARG1_DECL,
>              val = bswap16(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, 2, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(2), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> @@ -524,7 +524,7 @@ static void glue(address_space_stq_internal, SUFFIX)(ARG1_DECL,
>              val = bswap64(val);
>          }
>  #endif
> -        r = memory_region_dispatch_write(mr, addr1, val, 8, attrs);
> +        r = memory_region_dispatch_write(mr, addr1, val, SIZE_MEMOP(8), attrs);
>      } else {
>          /* RAM case */
>          ptr = qemu_map_ram_ptr(mr->ram_block, addr1);
> --
> 1.8.3.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
