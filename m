Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7245801njc;
        Tue, 12 Nov 2024 03:08:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6exT7XHB67IQ5jHeJLOgbq8lscEj+3xFSiwz/CL/siMiGbaKRAhiqQlD9z7AGSrgaYvZJeziSpdP83w==@linaro.org
X-Google-Smtp-Source: AGHT+IHJyW+FxE1Yy1oZyom2glWxk1E3CbO/or+uLhVwRJzrKjk9EqMjt59w9eFqw2IfDEXhl8GX
X-Received: by 2002:a05:622a:608:b0:458:4d55:fdf7 with SMTP id d75a77b69052e-463093f1bdemr229308631cf.40.1731409686333;
        Tue, 12 Nov 2024 03:08:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731409686; cv=none;
        d=google.com; s=arc-20240605;
        b=dvRijyr0RCNGoeprf/P7ahLwYkq/3g5yGD+MkC1+YOi6175+ZK5H9zmcmw/6aXOMkQ
         wO396viWqHU7iZZlCOzVVyLiQJFJ/Ju5sdr8i3um4WtrlClUXO+3darn9PWIAirD7QIc
         54EJVHitm7Ny3zyE/JwkysJmzXGrA0OyGji5crUGKzAQq8NeLviWWLkIR5D1Ly0BQ7SU
         WmfIh0Q2eoHkeO7Je/axbKX1hoVoPZOIyDy/EUFL6LZDYNu6Syc8KbfVCsTcARQjYFRP
         7SPXoRLZrNRTYqgi6oTWQxsCMgdj9vwLWN3CRJvVABTeIP8L9hpc+nPwdaCJtZc3mmi9
         X4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0lSL/7bgI4rvJwqOY4vLSEDOl6p9CLwapYsj+TEEFXo=;
        fh=I19u5vwp9zlowKN85Ky84/dDAgvrYrP6+rWZYMba1rs=;
        b=WTIz2dmffo95jxpFFoIboDrR0cw2lQmws4phmRV0ecb4V/MQeVLxdGsBEoQQkCyDyE
         vkL+Ttv057AR5YvwffX5+Jjn7/z4Gx3BjEnLh5JxNsbpSGiTIMFQ1yZPpmjHACHiiPTF
         6yPs/8fOXF2fAi0Qvlut3Y28ELzmujhgxCO32EHUPdQTIFKKLc8sjactMEnlhSWZ+K0K
         Ytaq50c9wiE/Q8QbpVAxZR1UobJjAp77qcbefNhhopKNdS2LfMXyXw1OLr/Jblnm7y2E
         84XfEquSqb2zbN22g3r5L6qhFqQ4rhDuKKE/sjABvjg8ejxuoMSLRWozmNjdV7kmZyjs
         fT0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UcChRJ3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff45b6cdsi137773441cf.153.2024.11.12.03.08.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 03:08:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UcChRJ3N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAokR-0005me-Ey; Tue, 12 Nov 2024 06:07:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tAokP-0005mK-NB
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 06:07:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tAokO-00065y-3i
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 06:07:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731409667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0lSL/7bgI4rvJwqOY4vLSEDOl6p9CLwapYsj+TEEFXo=;
 b=UcChRJ3NPylJC+c7KhdhLEOQKMKcy5t93ToqPObhAN7+GhupZjUevbfU5v2QOTsh9UvGMs
 7msQw14AUjqCYg/Uwno5EtB4l4PUJeR1ZjtfjwpaPCLFBe3qxRLuwCwvn9aqBHjnh97N5R
 SUpX/bYLNnFfr+2JlVvju5Z1VmHGZbc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-VZLxA9aWO1OyaoV6iZOweA-1; Tue, 12 Nov 2024 06:07:43 -0500
X-MC-Unique: VZLxA9aWO1OyaoV6iZOweA-1
X-Mimecast-MFC-AGG-ID: VZLxA9aWO1OyaoV6iZOweA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37d52ccc50eso2974629f8f.3
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 03:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731409662; x=1732014462;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0lSL/7bgI4rvJwqOY4vLSEDOl6p9CLwapYsj+TEEFXo=;
 b=BUabUqF3pDrqlRGJLpz6iat6qwxiWATBrPpiHCpdrVgJAavUrQqExMLqB3SH1U2s1S
 YvAoFav1dnaQWiAt6lkL4JNOy7Qz2tU7Yh+2TOX0q2vxB5SAJ63O7NSBFSNkk7rbEu5i
 TCG0qrk6U1lvjP7hkJADRhB36VtPW42V5jVVQJcwgLU69bhCrRxinSfgASoL1je6FMji
 zv5vU/zy64CmwB6qMf8IjOlUoKwoKYP3t9wZXCZ45urwZm/w2uwNzIqsXWrjlsyvhrrK
 mCYutW5MiI6vhWGCAKLOd7Qtcyhz0WZ6c/rEpPsDBBdrxUFNDneIVM89obLI9oQ8gmB3
 yeng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlZKumxAvat36lhsiSaB9GJ9PoELqeOkDvhAgWAGId7/zlPR8g4/ZDQvzs8Xso0hkRi/1cq6rvbw==@nongnu.org
X-Gm-Message-State: AOJu0Ywg6cLp0ZWI3KHeno35EU2y+A5JmxnCBOh7F/mb+Fek7r6XX2nu
 64P9epnvpzgI0RP0waRai7uiogjiZdwAxtFJ4fEFUFdXDdANjnciETNDydc4phybKYQtQeeDti1
 XapElyLrRD3lYKNwKcmMJZZvP3IkwXF0TpehtlSuRMzMpiqMZ8w==
X-Received: by 2002:a05:6000:2a5:b0:37d:529f:ac1e with SMTP id
 ffacd0b85a97d-381f188c7abmr14885482f8f.53.1731409662441; 
 Tue, 12 Nov 2024 03:07:42 -0800 (PST)
X-Received: by 2002:a05:6000:2a5:b0:37d:529f:ac1e with SMTP id
 ffacd0b85a97d-381f188c7abmr14885446f8f.53.1731409662046; 
 Tue, 12 Nov 2024 03:07:42 -0800 (PST)
Received: from ?IPV6:2003:cb:c739:8e00:7a46:1b8c:8b13:d3d?
 (p200300cbc7398e007a461b8c8b130d3d.dip0.t-ipconnect.de.
 [2003:cb:c739:8e00:7a46:1b8c:8b13:d3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed97c976sm14963402f8f.28.2024.11.12.03.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Nov 2024 03:07:41 -0800 (PST)
Message-ID: <b0e80857-b9cb-4e93-81bd-93e8dc4b1d51@redhat.com>
Date: Tue, 12 Nov 2024 12:07:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] system/physmem: poisoned memory discard on reboot
To: =?UTF-8?Q?=E2=80=9CWilliam_Roche?= <william.roche@oracle.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <e2ac7ad0-aa26-4af2-8bb3-825cba4ffca0@redhat.com>
 <20241107102126.2183152-1-william.roche@oracle.com>
 <20241107102126.2183152-3-william.roche@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241107102126.2183152-3-william.roche@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vs7A83pGu4AVAuIqcXFtdMO4LYDmCFo8KdMuAG6ExBc_1731409662
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4RDdi9Syub3H

On 07.11.24 11:21, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> We take into account the recorded page sizes to repair the
> memory locations, calling ram_block_discard_range() to punch a hole
> in the backend file when necessary and regenerate a usable memory.
> Fall back to unmap/remap the memory location(s) if the kernel doesn't
> support the madvise calls used by ram_block_discard_range().
> 
> Hugetlbfs poison case is also taken into account as a hole punch
> with fallocate will reload a new page when first touched.
> 
> Signed-off-by: William Roche <william.roche@oracle.com>
> ---
>   system/physmem.c | 50 +++++++++++++++++++++++++++++-------------------
>   1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/system/physmem.c b/system/physmem.c
> index 750604d47d..dfea120cc5 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -2197,27 +2197,37 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
>               } else if (xen_enabled()) {
>                   abort();
>               } else {
> -                flags = MAP_FIXED;
> -                flags |= block->flags & RAM_SHARED ?
> -                         MAP_SHARED : MAP_PRIVATE;
> -                flags |= block->flags & RAM_NORESERVE ? MAP_NORESERVE : 0;
> -                prot = PROT_READ;
> -                prot |= block->flags & RAM_READONLY ? 0 : PROT_WRITE;
> -                if (block->fd >= 0) {
> -                    area = mmap(vaddr, length, prot, flags, block->fd,
> -                                offset + block->fd_offset);
> -                } else {
> -                    flags |= MAP_ANONYMOUS;
> -                    area = mmap(vaddr, length, prot, flags, -1, 0);
> -                }
> -                if (area != vaddr) {
> -                    error_report("Could not remap addr: "
> -                                 RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
> -                                 length, addr);
> -                    exit(1);
> +                if (ram_block_discard_range(block, offset + block->fd_offset,
> +                                            length) != 0) {
> +                    if (length > TARGET_PAGE_SIZE) {
> +                        /* punch hole is mandatory on hugetlbfs */
> +                        error_report("large page recovery failure addr: "
> +                                     RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
> +                                     length, addr);
> +                        exit(1);
> +                    }

For shared memory we really need it.

Private file-backed is weird ... because we don't know if the shared or 
the private page is problematic ... :(

Maybe we should just do:

if (block->fd >= 0) {
	/* mmap(MAP_FIXED) cannot reliably zap our problematic page. */
	error_report(...);
	exit(-1);
}

Or alternatively

if (block->fd >= 0 && qemu_ram_is_shared(block)) {
	/* mmap() cannot possibly zap our problematic page. */
	error_report(...);
	exit(-1);
} else if (block->fd >= 0) {
	/*
	 * MAP_PRIVATE file-backed ... mmap() can only zap the private
	 * page, not the shared one ... we don't know which one is
	 * problematic.
	 */
	warn_report(...);
}


> +                    flags = MAP_FIXED;
> +                    flags |= block->flags & RAM_SHARED ?
> +                             MAP_SHARED : MAP_PRIVATE;
> +                    flags |= block->flags & RAM_NORESERVE ? MAP_NORESERVE : 0;
> +                    prot = PROT_READ;
> +                    prot |= block->flags & RAM_READONLY ? 0 : PROT_WRITE;
> +                    if (block->fd >= 0) {
> +                        area = mmap(vaddr, length, prot, flags, block->fd,
> +                                    offset + block->fd_offset);
> +                    } else {
> +                        flags |= MAP_ANONYMOUS;
> +                        area = mmap(vaddr, length, prot, flags, -1, 0);
> +                    }
> +                    if (area != vaddr) {
> +                        error_report("Could not remap addr: "
> +                                     RAM_ADDR_FMT "@" RAM_ADDR_FMT "",
> +                                     length, addr);
> +                        exit(1);
> +                    }
> +                    memory_try_enable_merging(vaddr, length);
> +                    qemu_ram_setup_dump(vaddr, length);

Can we factor the mmap hack out into a separate helper function to clean 
this up a bit?


-- 
Cheers,

David / dhildenb

