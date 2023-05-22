Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1062878ejb;
        Mon, 22 May 2023 01:43:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Hw9OmPKivAooWeYfQlPk6rFU5U9Q7wzJ/92lCMAIWWJLsqa1dCyyTP0Lz/d37rMkX5Mz8
X-Received: by 2002:a05:622a:170c:b0:3f6:b1c7:c10b with SMTP id h12-20020a05622a170c00b003f6b1c7c10bmr2741440qtk.20.1684745005844;
        Mon, 22 May 2023 01:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684745005; cv=none;
        d=google.com; s=arc-20160816;
        b=SFOmaC/N628BgGStt49zUYTHIeXZHmowE4vmHcEqR09SptREiHkjpIcQZSTtsDxvqT
         VTuWnJ02cpqIzCLuHkv5+CmaK8CbVMu/Q8bQMyFQGSTGF+Aw/HME3JkYKjuKiWbfKMMJ
         TuLpHwznvfdsfvG7Lgnisd5nFACYQBF/ZRgivoe5j38TtrDTdWICsx/HWnAqnMQhJ3c3
         ueF3FuYkeoKB2Tg4qco8/+8QHO3XjoS2wyiOFZaRbB0WucQLfitMaiY2FT9JCvJ1Zhlr
         oSg69Kg8FondfzUKrsg51HFszKaYIOP3PrQFjiwjx6eWtWwRX55zvyeQAmdu30zRMUgs
         otMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :cc:to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=y7GJx2IGxEO28u6y8JGl1yjARhQ3bV/zpE/5r1Md8os=;
        b=iX4cqBhJ1usT1f8aot5f8bkPjdipBGsQo6GSYooJngqIpqoUtR/DItq1Zy9Q+U3Qzu
         +yXMtfZTiZY1J9xBD/6HAEX6yLWfuOaa4UymsXCywvymqIdUDuKjrQsn1FWzVzFXK2P3
         +LQrFiUPOZfhwS94z15p4Ck504LSwWhod1KsdXKcblJwnzj+BdprCD0Go4yeV6JfawmM
         xcx3T25YqDCEturzhQRIPSQPitpjDtdXNjr+JdoqDKewqHwsEyjBwZ9OSpDDz3RWC1/U
         4z5WcQQpPBLrs8Kg3fXEn0kgKfPx1UR+PpJrxdB8Heaw5Ak3QZaMOmz9YFJdPxGII+Ws
         PaBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPW+JuR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a048d00b003f4f44d9676si3267230qtx.615.2023.05.22.01.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 01:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPW+JuR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q118J-0004Md-Cd; Mon, 22 May 2023 04:43:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q118H-0004LM-Ug
 for qemu-arm@nongnu.org; Mon, 22 May 2023 04:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q118G-0007c2-8s
 for qemu-arm@nongnu.org; Mon, 22 May 2023 04:43:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684744987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7GJx2IGxEO28u6y8JGl1yjARhQ3bV/zpE/5r1Md8os=;
 b=WPW+JuR0E8JlzsdohcWrLfEMj7J0e1H2Yob8hWw+XXi86dlkFk6Y6rimdvjCnDM6+ZouAe
 zX8eB+Oeg8VSil2A1dRa0ccJRboLBpfmFyKg3jbo0XK38LkAlf1Uz/jcixT3RvbmDRaxTx
 97u9tpVAY2tu4l539ayuGcVUT4DZ7P0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-9BGOwFs_MWOf5pYHSXSGAQ-1; Mon, 22 May 2023 04:43:05 -0400
X-MC-Unique: 9BGOwFs_MWOf5pYHSXSGAQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30953bcb997so1062426f8f.2
 for <qemu-arm@nongnu.org>; Mon, 22 May 2023 01:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684744984; x=1687336984;
 h=content-transfer-encoding:in-reply-to:subject:organization:from
 :references:cc:to:content-language:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y7GJx2IGxEO28u6y8JGl1yjARhQ3bV/zpE/5r1Md8os=;
 b=IqhA0jITMScJ3Wg4yBYTpMg0loPi49rzkqFrq5VnofofGRojGyhAwN/YKem9+PdGeM
 t3j+S14CK4Npnckyl8diYYup79INc0HPvRsTWDmiEEdfx1TnUiriWckWnPv22kiSUNJ2
 z8Ek9D6IyrpE5+YlrhLcWmy+3JNj+x2+KXBUu2FhPtjBPKqGrffI6TpqrOHLVdYdER/v
 BRVO8QIah51AJn265pHHkVHmpH3v6K14SCRYwG6DiSpDwCDZx5NjD3ZYvTPy4pOU/+Cc
 fwONpJz44bQe+tfoleC47s80vHnD2R9VZ9BZpdKsLeeuttGslgnupvTcbQ20PfrxVJhX
 yqrA==
X-Gm-Message-State: AC+VfDx4AcVwMTz6sxlB5nOjHjd9YLYX62Bj+3ZfGWK3Ph/5izGmus+L
 x2Iy8vxGmn6q+mjvDb5uKq/lLq/X4D8FY2vhYJfL0UUVPnTeQZxex1v8pRdOo138i6k87wibAOj
 7MY3EEhjx9R3P
X-Received: by 2002:adf:de10:0:b0:306:2fab:1f81 with SMTP id
 b16-20020adfde10000000b003062fab1f81mr7831057wrm.21.1684744984659; 
 Mon, 22 May 2023 01:43:04 -0700 (PDT)
X-Received: by 2002:adf:de10:0:b0:306:2fab:1f81 with SMTP id
 b16-20020adfde10000000b003062fab1f81mr7831036wrm.21.1684744984280; 
 Mon, 22 May 2023 01:43:04 -0700 (PDT)
Received: from ?IPV6:2003:cb:c742:c800:d74f:aec6:f8ac:558?
 (p200300cbc742c800d74faec6f8ac0558.dip0.t-ipconnect.de.
 [2003:cb:c742:c800:d74f:aec6:f8ac:558])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a5d61c2000000b00309382eb047sm6940657wrv.112.2023.05.22.01.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:43:03 -0700 (PDT)
Message-ID: <c4f01a0f-17af-ddc0-3b8a-27a735a60371@redhat.com>
Date: Mon, 22 May 2023 10:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-18-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 17/27] target/s390x: Use cpu_{ld,st}*_mmu in do_csst
In-Reply-To: <20230520162634.3991009-18-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.098, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: V4Bw9h/m+9Bp

On 20.05.23 18:26, Richard Henderson wrote:
> Use cpu_ld16_mmu and cpu_st16_mmu to eliminate the special case,
> and change all of the *_data_ra functions to match.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-s390x@nongnu.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

[...]

>                   /* Note that we asserted !parallel above.  */
> @@ -1876,29 +1872,20 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
>       if (cc == 0) {
>           switch (sc) {
>           case 0:
> -            cpu_stb_data_ra(env, a2, svh >> 56, ra);
> +            cpu_stb_mmu(env, a2, svh >> 56, make_memop_idx(MO_8, mem_idx), ra);
>               break;
>           case 1:
> -            cpu_stw_data_ra(env, a2, svh >> 48, ra);
> +            cpu_stw_mmu(env, a2, svh >> 48,
> +                        make_memop_idx(MO_TE | MO_16, mem_idx), ra);

To make these two cases look less special, maybe just define oi1 and oi2 
as well at the top?

LGTM

-- 
Thanks,

David / dhildenb

