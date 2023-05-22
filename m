Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1063326ejb;
        Mon, 22 May 2023 01:44:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GS0CakXqR0BXOHSPJHNA6pxjFCmwbRG65gbYVqEj674do3mMSyx4N/iEvbdAKFvxt2OEZ
X-Received: by 2002:a05:622a:64d:b0:3f2:eaa:6b0f with SMTP id a13-20020a05622a064d00b003f20eaa6b0fmr14607411qtb.68.1684745079085;
        Mon, 22 May 2023 01:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684745079; cv=none;
        d=google.com; s=arc-20160816;
        b=LFTSDNU+UjaR4DRD2QjmZOCpnew95I9vDLRLSe+bawjPDlYLCTkAVGBQ15DXZNesnO
         X9ibVzU0dQXlDs3e6nLgIUXptEd5FfZhlQ2TXI7aPYDctAkswTfuEAPOGdAL/rr7UrJD
         KYO9MRPqfbFlih0kCNjbATSqslI+dZvBDTMRj+xCc08c2/nSgSydA7APnh0MPGX086+x
         IT6jKtFZJWPrgSU5b3feH/UlEWVqYxOe/TBHsYtP5mO15bdIn/7+QzffBmASttS4J3rl
         Kc72c3ZF4TUP9HtlVaMbYsIBQ0Tpe9OK75zQ55PXI8IW5yycEmegkvmGvzxqnEu2LfFe
         OaLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=dACFPgowIGOgzMREQRQNw6HXkifzoHJOxKH/mLzp2L0=;
        b=bw0UGDeVAC1+z8C9zFMoj30xL+se6Sj3xiGoWrSNN6Odq8cQIn6v3zxglei/LwTKZ+
         E3hPXMx/BGAc7C0lXMAN99wa0VDT4T4Q3DWs8x8/YeCrCbqfHfN0JpyE8W1NoEWMtTp3
         qVSNaJaPtEu2kHxaczg6ZmfoCmywjlUN4CG+oguNXidOVVYvwVPD2hOte779S+xxDO9t
         9Lmc/8q7e942BI26aWAPlAtCbAbubi7Lk9aCOGFS5AFrhXjSB6q9bGFS4elxBYH0BmuC
         Sg6ajKTl3c+9KLtZvOjmUs3fC8WBC/1f/DnM770VOaJgJLmtA3n1m62eNbwhue5y9d7P
         /Juw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tterg6RQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z17-20020ac87f91000000b003f5ea6474f1si3363213qtj.436.2023.05.22.01.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 May 2023 01:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tterg6RQ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q119U-0005SX-Ir; Mon, 22 May 2023 04:44:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q119P-0005Mt-Cb
 for qemu-devel@nongnu.org; Mon, 22 May 2023 04:44:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q119N-0007xB-VX
 for qemu-devel@nongnu.org; Mon, 22 May 2023 04:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684745057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dACFPgowIGOgzMREQRQNw6HXkifzoHJOxKH/mLzp2L0=;
 b=Tterg6RQ8PonUfs1gsd8rKPHNR9a9kt75EWVsQ/NJ1TkI8wpWeGOTwTCsJxPzykgORTnHK
 8FfVsjpb2jeXFX/vs+CD3uCDa0FNouPpdL4Lqr/QjN1IfnUEJr6Ld6/jeWG4KJdYgWwcQP
 OLjjlYYPzBs6uhvupX4AaFqtAGTaV1M=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-iTtQju6COvaM6_-eeQidOQ-1; Mon, 22 May 2023 04:44:15 -0400
X-MC-Unique: iTtQju6COvaM6_-eeQidOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30a8f6d7bbdso257184f8f.0
 for <qemu-devel@nongnu.org>; Mon, 22 May 2023 01:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684745055; x=1687337055;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dACFPgowIGOgzMREQRQNw6HXkifzoHJOxKH/mLzp2L0=;
 b=SUX387UDeemDsYIf6kAZP5sEE/pv2x4rV0IYAy4vFpuawwYwN5AgXWl1z47ftGoRBu
 tI37clIU4U0DB0FNtGnbntMVBbLkCheP1fvKMaPKRMpasSc9MuDP9ieZwFXD22gfoC59
 w8B/uZEVFGMFHJ+hJr9RP6Kwiw5DhW/FxwEuN3SHfkeT7sd+bOJg/xCGQ+PyKaxSABtc
 PdsF5q/76QWEAEaXJj/p9TeM0CaCdeYoKWDKWcwKCGfUiNM0zo2WFk4sQjKG3MHnA3wG
 dWT8DGJb9bwdwbynYFXKKt+RvCz6EARF7PJyT/sxlXu8FaQKNIeJc3OhGWhyheA4x9ON
 YUQA==
X-Gm-Message-State: AC+VfDyQQeyliPhTNdIbroe5XDUhelfBVQUUKR6iBuF5fhxaOCpM9dc/
 xCsWJHwLII7QNTUrZu85JTnM5pcmkACH/l/00qImNlKds1xPPDQN0xeOCmewyknLXn08CqIB8R4
 19vcYTvfXilNyfvk=
X-Received: by 2002:adf:f80d:0:b0:306:4613:e0f0 with SMTP id
 s13-20020adff80d000000b003064613e0f0mr6172464wrp.68.1684745054838; 
 Mon, 22 May 2023 01:44:14 -0700 (PDT)
X-Received: by 2002:adf:f80d:0:b0:306:4613:e0f0 with SMTP id
 s13-20020adff80d000000b003064613e0f0mr6172450wrp.68.1684745054532; 
 Mon, 22 May 2023 01:44:14 -0700 (PDT)
Received: from ?IPV6:2003:cb:c742:c800:d74f:aec6:f8ac:558?
 (p200300cbc742c800d74faec6f8ac0558.dip0.t-ipconnect.de.
 [2003:cb:c742:c800:d74f:aec6:f8ac:558])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a7bcd95000000b003f4e8530696sm7507984wmj.46.2023.05.22.01.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:44:14 -0700 (PDT)
Message-ID: <60253dfc-bab5-885b-dc75-f92e6001be2d@redhat.com>
Date: Mon, 22 May 2023 10:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 18/27] target/s390x: Always use cpu_atomic_cmpxchgl_be_mmu
 in do_csst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-19-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230520162634.3991009-19-richard.henderson@linaro.org>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xNfWqwytZJ8y

On 20.05.23 18:26, Richard Henderson wrote:
> Eliminate the CONFIG_USER_ONLY specialization.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-s390x@nongnu.org
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Ilya Leoshkevich <iii@linux.ibm.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

