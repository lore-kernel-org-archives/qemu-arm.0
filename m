Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2433680njn;
        Tue, 14 Jan 2025 06:10:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxZKVeZAE6krJUXXZsYhwy2LmgiAkGMroMKoBNQX1DvrVnxOfQLfdywVF0E+Tx57M+sZqbU/CcGVIJLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGpE6RDrWVI63G48cWdfy5PaDnI6NK1jTD+uMr1QLwcJqjhzSz08cHJV5wnl1+KvYMU0Pnm
X-Received: by 2002:a05:620a:404f:b0:7b6:eba3:2dfb with SMTP id af79cd13be357-7bcf365deccmr2133230285a.16.1736863813197;
        Tue, 14 Jan 2025 06:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736863813; cv=none;
        d=google.com; s=arc-20240605;
        b=BkhdSWCgBQE7mKaEny/gHGJGV+fQ7qL78KmcTO9BtSsOlu87c7pS1FuVQizeGZ9ANc
         so35ibEGKmDGhmW8J5w9chEPMFeOJ4Lh43QNwdodjGF/mfdWMAQG2mVWYX2MWKgBNUdc
         TezlJJJhiKZ+or4mztRXWUWY6kiMqqC2jcgKHvDBaHGLDSfQJ+ckFxtM8UXtu8GMbKGS
         HuFsoP2GCiClHpCcOMsTeHKdb4HHDlcNGJV/VanW3q+6BpZn2iH5KtuMP+i2bT/nDve7
         y6e+1G7gRrSVVtvzJrDHzKe4FrZXzMOWWwqyxdWiDWyKIkvuv+3AdordHayEd7eDEen7
         oZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YtFP9pQtyoWXgcTFBJgS77jtXl6lTbOzCPS/O8U2TSM=;
        fh=C5WKnacJJwn/nYBJoVkCuw/X7ja/Tzj2qkGoPGc3Pu4=;
        b=Bd5UrIgNpQoiC0WXXwzMS1b0raCEO1hMo67LWM2lg90MYc2XBOFNFeTUR/AFVM5Bt4
         yap49i83rOLMpdbC8pH9NZcr4K2UoT/aeSdlaWJEXbNEs3nZM5vbDziC5M7+oe+pjvsb
         vsQjrnRpC+pp2lLOJxpwudcewLFE+O17OK8loFo0zT0siEwhmKGb510l1gS3gB2ZVYxu
         dcv8t6070mHTjsl8V9uNZh2FUstB4iCwj9kR1MnKPkxTAe6UUGjGsIYHDBjIJVyJMTL+
         GdivHFWvHJj0L8LVaJOa5qPEOI0/CM65hR+CxIFy21lcnp7m+NPaYS/4GaKX4Gke09XF
         juyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FvJ/BzLh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce322a056si1455969885a.34.2025.01.14.06.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 06:10:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="FvJ/BzLh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXhcK-00043P-W5; Tue, 14 Jan 2025 09:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tXhc9-0003xo-4G
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 09:09:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tXhc5-0004od-Ri
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 09:09:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736863788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YtFP9pQtyoWXgcTFBJgS77jtXl6lTbOzCPS/O8U2TSM=;
 b=FvJ/BzLht4czbNua0X0j2epT3lzpFiiaccuIIEz6C90+ONiAwnL0OBJB8jvTwMOYsC95EX
 uhpOhKvhfY9Ewa8GCuyE9SQbx6laclWfpvu8B+DeKnK62WdjlwTw5Hjx5bXBlT64InzSPT
 EB34AyxRAycZQo97A+tVWqYIvKRp5p8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-3EACkzgaOt-wvz60eJTp2A-1; Tue, 14 Jan 2025 09:09:45 -0500
X-MC-Unique: 3EACkzgaOt-wvz60eJTp2A-1
X-Mimecast-MFC-AGG-ID: 3EACkzgaOt-wvz60eJTp2A
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43625ceae52so30377315e9.0
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2025 06:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736863784; x=1737468584;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YtFP9pQtyoWXgcTFBJgS77jtXl6lTbOzCPS/O8U2TSM=;
 b=iiLV+pSbqoQfQG0HEfnXivM0bRRdSZcV4bx4zGMpquOvD8wg785F8w/8LVHFDsVlME
 cu+07fiJnMJpwkkuSJb6+oeXYJApRE3akFO17FvFPv6D65ijQnJ3DaIGM//P1LSn5txv
 aDkcdEbtGarSr0yAFUOscKAtI/r3tTe1Bu+Ht9fa/zZ1IAGhC92XDEbicj6i0dZBBlgp
 pzPCiu4CyX7Z9YldPPvgOLc98vMz0NpbMyCssEBazeqWLV01+w0QXKRD9YlcG4XLwdTM
 XQ4528kzvx041d4qBbFXEq07f4HTOKSG9uVSMnX8Qf8MEGsS0H1oGl1t4iTzktIFKKvJ
 Ec2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwuyxXYigAS4iCsDB5p/TMRSRBeomtb+E7RfW8q3MU734Fd4dGqXwWxN3lLJMJPccZo9YgdPR2Og==@nongnu.org
X-Gm-Message-State: AOJu0Yw8S/nRw8WpSUSat3yWWPQr5CuFjU0g0uLd6OTOEvTgU2ciKFVw
 2StX9GbEmQy9lzN6hEmEOKobMM4x5H3H5qCSE4CHL8rt8+XPYH0oySTfW3tDlZzoT6qxgC7/qkQ
 G2qC6W+1IWubGnlQ9jsJJs784VwkTTALCWRdb6RyA9I3MLEP+pw==
X-Gm-Gg: ASbGnctkb84nFiXeebY2JcD1y6iGfyH0wsGinFbKgEKJyLRMd42uLQndWF+uhZhp5DX
 Qa6/QOBV2s+W+2ASG5U2no1BumnHBsN5jkOu/4XWTQ2QnDwJ6HlYAZNTG0Lg1pVAzqEE06U0WsF
 /LDF99DhaJgW84X67uIrnrocf5SyfOdB1jilIwYxgdvdSeMcH0g+3ZxbKDDAhMCw3NVPkXBOSGW
 hpghoCGUrkEoYj4FhbColMouTsVmSdHqdmK/aywqgLyISqM3wslclf1oe5nUBxw+qaW66qWhq7x
 RxXKOWHqzBRYU+1ARMLXPlS0vBbbgTBzOoAvOXwaJyM1T1PPoFM8oQ4PKnRUoRjlv3NPPRSKHHL
 TlJB7uIKx
X-Received: by 2002:a05:600c:1d01:b0:434:fec5:4ef5 with SMTP id
 5b1f17b1804b1-436e26b6f51mr256244165e9.14.1736863783737; 
 Tue, 14 Jan 2025 06:09:43 -0800 (PST)
X-Received: by 2002:a05:600c:1d01:b0:434:fec5:4ef5 with SMTP id
 5b1f17b1804b1-436e26b6f51mr256243805e9.14.1736863783347; 
 Tue, 14 Jan 2025 06:09:43 -0800 (PST)
Received: from ?IPV6:2003:cb:c738:3100:8133:26cf:7877:94aa?
 (p200300cbc7383100813326cf787794aa.dip0.t-ipconnect.de.
 [2003:cb:c738:3100:8133:26cf:7877:94aa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8802sm175247615e9.10.2025.01.14.06.09.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:09:42 -0800 (PST)
Message-ID: <39b26b64-deaa-4c52-8656-b334e992c28c@redhat.com>
Date: Tue, 14 Jan 2025 15:09:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] accel/kvm: Report the loss of a large memory page
To: =?UTF-8?Q?=E2=80=9CWilliam_Roche?= <william.roche@oracle.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <cf587c8b-3894-4589-bfea-be5db70e81f3@redhat.com>
 <20250110211405.2284121-1-william.roche@oracle.com>
 <20250110211405.2284121-4-william.roche@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250110211405.2284121-4-william.roche@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IG2P-OAsf9dsvFdPCTN7YJWg1xh4-bZvVpFbBsWx5pM_1736863784
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.063,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.794,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: OPanjVmOlfcD

On 10.01.25 22:14, “William Roche wrote:
> From: William Roche <william.roche@oracle.com>
> 
> In case of a large page impacted by a memory error, enhance
> the existing Qemu error message which indicates that the error
> is injected in the VM, adding "on lost large page SIZE@ADDR".
> 
> Include also a similar message to the ARM platform.
> 
> In the case of a large page impacted, we now report:
> ...Memory Error at QEMU addr X and GUEST addr Y on lost large page SIZE@ADDR of type...
> 
> Signed-off-by: William Roche <william.roche@oracle.com>
> ---
>   accel/kvm/kvm-all.c   |  4 ----
>   target/arm/kvm.c      | 13 +++++++++++++
>   target/i386/kvm/kvm.c | 18 ++++++++++++++----
>   3 files changed, 27 insertions(+), 8 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 4f2abd5774..f89568bfa3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -1296,10 +1296,6 @@ static void kvm_unpoison_all(void *param)
>   void kvm_hwpoison_page_add(ram_addr_t ram_addr)
>   {
>       HWPoisonPage *page;
> -    size_t page_size = qemu_ram_pagesize_from_addr(ram_addr);
> -
> -    if (page_size > TARGET_PAGE_SIZE)
> -        ram_addr = QEMU_ALIGN_DOWN(ram_addr, page_size);
>   
>       QLIST_FOREACH(page, &hwpoison_page_list, list) {
>           if (page->ram_addr == ram_addr) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index a9444a2c7a..323ce0045d 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2366,6 +2366,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>   {
>       ram_addr_t ram_addr;
>       hwaddr paddr;
> +    size_t page_size;
> +    char lp_msg[54];
>   
>       assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>   
> @@ -2373,6 +2375,14 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>           ram_addr = qemu_ram_addr_from_host(addr);
>           if (ram_addr != RAM_ADDR_INVALID &&
>               kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> +            page_size = qemu_ram_pagesize_from_addr(ram_addr);
> +            if (page_size > TARGET_PAGE_SIZE) {
> +                ram_addr = ROUND_DOWN(ram_addr, page_size);
> +                snprintf(lp_msg, sizeof(lp_msg), " on lost large page "
> +                    RAM_ADDR_FMT "@" RAM_ADDR_FMT "", page_size, ram_addr);
> +            } else {
> +                lp_msg[0] = '\0';
> +            }
>               kvm_hwpoison_page_add(ram_addr);
>               /*
>                * If this is a BUS_MCEERR_AR, we know we have been called
> @@ -2389,6 +2399,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>                   kvm_cpu_synchronize_state(c);
>                   if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
>                       kvm_inject_arm_sea(c);
> +                    error_report("Guest Memory Error at QEMU addr %p and "
> +                        "GUEST addr 0x%" HWADDR_PRIx "%s of type %s injected",
> +                        addr, paddr, lp_msg, "BUS_MCEERR_AR");
>                   } else {
>                       error_report("failed to record the error");
>                       abort();
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index 2f66e63b88..7715cab7cf 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -741,6 +741,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>       CPUX86State *env = &cpu->env;
>       ram_addr_t ram_addr;
>       hwaddr paddr;
> +    size_t page_size;
> +    char lp_msg[54];
>   
>       /* If we get an action required MCE, it has been injected by KVM
>        * while the VM was running.  An action optional MCE instead should
> @@ -753,6 +755,14 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>           ram_addr = qemu_ram_addr_from_host(addr);
>           if (ram_addr != RAM_ADDR_INVALID &&
>               kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> +            page_size = qemu_ram_pagesize_from_addr(ram_addr);
> +            if (page_size > TARGET_PAGE_SIZE) {
> +                ram_addr = ROUND_DOWN(ram_addr, page_size);

As raised, aligning ram_addr_t addresses to page_size is wrong.

Maybe we really want to print block->idstr, offset, size like I proposed 
at the other place, here as well?

-- 
Cheers,

David / dhildenb

