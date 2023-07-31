Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2155165ejb;
        Mon, 31 Jul 2023 06:01:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG+7+An1tVyt2j9EezE8/8Pq5MUVmmaTsHomwIbtxcugIDa6z7xijrmEoZFhXBpCB2SoIYq
X-Received: by 2002:a17:903:22c1:b0:1b8:9552:ca with SMTP id y1-20020a17090322c100b001b8955200camr9578897plg.45.1690808476368;
        Mon, 31 Jul 2023 06:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690808476; cv=none;
        d=google.com; s=arc-20160816;
        b=QYHUyNR1qY//XFhCrEDl/cqX1eeTLE5Rj+L7Ry4cTW3NDGeQmRGd7N8UoVRblv8/Uf
         ztj0d08Wg7W8u9LK2WJ7lbdJqU/+lEpT8Ym9mbXkCCTp/EFH+2sVeQrYTgct7iHddrMb
         QX4fYaSulH9ukeT1MiheR4rERcOmuHnbG41byXGJhp/Xch6Ws1zbSq0V7knrq4ts5gkM
         Gu4a8ain+dYqxDpOukLoVI0kRMXcKhU8v338+bEWeg1hGrD5R4Szo9v5GKdsO39ibq7Y
         XX8I7iS9/47RF8GIq7+mxeIWgkNhZSFTGqA45YkURk4Fbvs9fINsXdl+JroIHKUXRwAb
         x9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=BHnF+sy+d3zFQbgHmPB9jYr/hDJRe+YhEB6Mqx1kcUQ=;
        fh=dw3lSPZff5XxabJq6f4ACgMtEd7HyMzouSYiQnyntmo=;
        b=V01yzj7gRERn+yYpK4dqaFCa18jey7kBlb/5juyDE4sq851OrvHfHz2ZxBpWEG1U15
         JdFnppgAYPLywfZtfzlgefph20MBr3M5JjbInV0HdKpFDi34G/yNP99cW++2WTXc97lc
         ccTMvSQk0REZZH2tGRHLtp96WD4e8eUvOpGDAU1sp68PcmLTw/oF9CxReQjtLGdA4cr7
         QIZxttmalRl6yzX7lxKOlAso2qpcbQY1R2ySuG/t3Dd6Sgpa4cp6iINhNYqNIOD+lJh1
         fMiHbkTO7olu3SSyBkyeQ1lOVHZLEDvnaa16+uXP/9m5mXZ+NYRYSxri8Uv3CaRkmPRH
         QVxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXDNeojM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10-20020a0ce44a000000b0062637fe2190si5615796qvm.167.2023.07.31.06.01.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 06:01:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXDNeojM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQSVz-00082l-Hi; Mon, 31 Jul 2023 09:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qQSVr-0007tN-SL
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 09:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qQSVq-00005D-1w
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 09:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690808437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BHnF+sy+d3zFQbgHmPB9jYr/hDJRe+YhEB6Mqx1kcUQ=;
 b=LXDNeojMTemNKUYw0a4OR73mBSr2jGXaGKL/4brMX65M0ZPMdPdYT2eBqLzD6N82Odt/As
 BZ8dzrgrbirddN5+I9Iy2XcZ9rxzdJwLwAVsELpBDYsh/eTm62l5ovZxTBM7rgzsM2AK1T
 sayYmXRVDFYE3EbEZ9+7J5Fk05Xyltg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-Iq2TX-XJOvyYuUKBibYI4Q-1; Mon, 31 Jul 2023 09:00:35 -0400
X-MC-Unique: Iq2TX-XJOvyYuUKBibYI4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe216798e9so5349345e9.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 06:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690808434; x=1691413234;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BHnF+sy+d3zFQbgHmPB9jYr/hDJRe+YhEB6Mqx1kcUQ=;
 b=OCT/HevY5T+VtYKW5JOjgHjfxAabdzRcAnnxKEhNOv69fx+Sw/ih/5O/gnwOZPzMen
 Qs5zTvBJqdOjIFfYH9NXmYNlUpc1dPRpQwPN4ap8iNGL09G0FeIjSbyPDI9zK7upEpr/
 uBOHyakG/3PzckVaY54dbt2I41ovmEhMy78t7WSoS4H1MDy5TkLqWnEFbAekpP/DXtKQ
 f3fnive3hZm/Wjn5MeGPSaLB8T1tc9CXp9UioAnlro/L1XTRpUqeRTwWaK7HH0yoJb5O
 SuQQG96hQgnAtVwe/K9pp/5822rIyU7RtspDiya5htZ0/VxWhgOHX4gDvSnS7cMgAGyQ
 EGNQ==
X-Gm-Message-State: ABy/qLZmjNbO+Ye+9+2/+/TOm0tOLSSX5Xcxcgbd3IdyKfOfLKbswVqf
 EibnneN/ICj9azPnpRZctiCKlD0HLUgcGQSOKehOKUCnqE+GYWFifbSoVwYHZWGQblRFJJyr2xh
 2igQ3ObNB1+8w
X-Received: by 2002:a1c:f202:0:b0:3fb:a0fc:1ba1 with SMTP id
 s2-20020a1cf202000000b003fba0fc1ba1mr8373850wmc.35.1690808433998; 
 Mon, 31 Jul 2023 06:00:33 -0700 (PDT)
X-Received: by 2002:a1c:f202:0:b0:3fb:a0fc:1ba1 with SMTP id
 s2-20020a1cf202000000b003fba0fc1ba1mr8373833wmc.35.1690808433548; 
 Mon, 31 Jul 2023 06:00:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c723:4c00:5c85:5575:c321:cea3?
 (p200300cbc7234c005c855575c321cea3.dip0.t-ipconnect.de.
 [2003:cb:c723:4c00:5c85:5575:c321:cea3])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c230900b003fbe561f6a3sm14139827wmo.37.2023.07.31.06.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 06:00:33 -0700 (PDT)
Message-ID: <008f4ae2-c5bb-3570-3ec9-4ace4b5c4788@redhat.com>
Date: Mon, 31 Jul 2023 15:00:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] kvm: Fix crash due to access uninitialized kvm_state
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 philmd@linaro.org, shan.gavin@gmail.com
References: <20230731125946.2038742-1-gshan@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230731125946.2038742-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iVGz5WqYuNEV

On 31.07.23 14:59, Gavin Shan wrote:
> Runs into core dump on arm64 and the backtrace extracted from the
> core dump is shown as below. It's caused by accessing uninitialized
> @kvm_state in kvm_flush_coalesced_mmio_buffer() due to commit 176d073029
> ("hw/arm/virt: Use machine_memory_devices_init()"), where the machine's
> memory region is added earlier than before.
> 
>      main
>      qemu_init
>      configure_accelerators
>      qemu_opts_foreach
>      do_configure_accelerator
>      accel_init_machine
>      kvm_init
>      virt_kvm_type
>      virt_set_memmap
>      machine_memory_devices_init
>      memory_region_add_subregion
>      memory_region_add_subregion_common
>      memory_region_update_container_subregions
>      memory_region_transaction_begin
>      qemu_flush_coalesced_mmio_buffer
>      kvm_flush_coalesced_mmio_buffer
> 
> Fix it by bailing early in kvm_flush_coalesced_mmio_buffer() on the
> uninitialized @kvm_state. With this applied, no crash is observed on
> arm64.
> 
> Fixes: 176d073029 ("hw/arm/virt: Use machine_memory_devices_init()")
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
> v2: Bail early in kvm_flush_coalesced_mmio_buffer() on the uninitialized
>      @kvm_state and improved changelog        (David/Peter)
> ---
>   accel/kvm/kvm-all.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 373d876c05..7b3da8dc3a 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2812,7 +2812,7 @@ void kvm_flush_coalesced_mmio_buffer(void)
>   {
>       KVMState *s = kvm_state;
>   
> -    if (s->coalesced_flush_in_progress) {
> +    if (!s || s->coalesced_flush_in_progress) {
>           return;
>       }
>   

Thanks Gavin!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

