Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp649588ejt;
        Sun, 26 Nov 2023 15:53:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7JR/ra+32ij9oixqkwpzd2INPCfLccEtQUkYOMZOGhj5zmoQB2V+YMZapznKiKWbMMV5w
X-Received: by 2002:a05:6214:18c4:b0:67a:27da:148d with SMTP id cy4-20020a05621418c400b0067a27da148dmr4508563qvb.45.1701042814498;
        Sun, 26 Nov 2023 15:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701042814; cv=none;
        d=google.com; s=arc-20160816;
        b=ltD7VaGRXV/s90S3+ecAEBCjGAYHeV9Jh5CiIi08l1Ka8aBBZB2jeyhuujKp33rIXq
         rlTP+alfuxOuCfYnLuSl83Bbhm+HMqXspuCXmj8y77m1jh8MmYLgKP/XPyOd2WzBr+y+
         qW/YwuTLkCWcWYVGbQ0DGFQQrSt02Dll0xzAAuncXf/dxhf60zYXnS2+5HwOFlvBmB7b
         gw67DHhRWoWh4U4kKChjdeTDgTLeky2yiLAkLQl12k9CmeBqJbVQvvJ5wO2/5nQD8uMw
         tp114EleXTclwffe4KxRK+TE/S7EHT4/O7yaPzchkIJ/9MnNQWzYxH5qF4qroopYnL2Y
         /XSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cy/y763DftHJ+hWsvHB8+IyT+wDV3vJAmTxUoE6n1X8=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=sbU4gMooKBgS37TlosoDRBiv42/9365EHsMmi/Ergpm6qNRobwlvquGzw3/NvSV6UK
         R9BDUXyudRFI2n+50NJlb+Bnjrz3AmJoIJ8dWIopLtD2vKKHr0VjzptlNvDDavKcls57
         adqk7HjIK5Zfr5mdDPrZOE5A3RznNjYwWaRn1ng7aimTqqe3BKMctuudDrVJLGLPuGuM
         6Z+zwff58QeToTPW0G7snizFPOJBerqTdMGO3JGJSkizjWuYZHK9ZyI+2t6V8OMuqHBM
         Jp0GO2H82chagG1s0ZuLJa0tVu5U5Z2HqIJoRLyWCfnfFdU8to93RMh+klh0sksNce6a
         7phQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N2a4cdO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15-20020a0562141d2f00b0067a49f7a1besi404895qvd.544.2023.11.26.15.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Nov 2023 15:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N2a4cdO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7OwL-0001tQ-KW; Sun, 26 Nov 2023 18:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OwJ-0001tC-TK
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:53:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7OwE-0003xd-9D
 for qemu-arm@nongnu.org; Sun, 26 Nov 2023 18:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701042801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cy/y763DftHJ+hWsvHB8+IyT+wDV3vJAmTxUoE6n1X8=;
 b=N2a4cdO2xzDj0PorlPBrh/CxRO7qL2DgE15ADzqNU5EZASnO51kligEpPkLW1rlJgt0Mas
 9csKzmyex/BU76aUTQqoU6PL0X/ptDJlar9RlvFVw1W0XlWvMjpFhlq7EAaI95BxW1OUEv
 1gJyCHxYCjLfD4QfwT0zy2YR+rH0Z4Q=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-UE-7RF3BMl6247ZoR-y_MA-1; Sun, 26 Nov 2023 18:53:20 -0500
X-MC-Unique: UE-7RF3BMl6247ZoR-y_MA-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-6c4d0b51c7fso4728605b3a.2
 for <qemu-arm@nongnu.org>; Sun, 26 Nov 2023 15:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701042799; x=1701647599;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cy/y763DftHJ+hWsvHB8+IyT+wDV3vJAmTxUoE6n1X8=;
 b=UXfrd6yJoBsJM8I6Mg4O+W3qlXyN6jPg09/fJZfe/Vh6OKZjfjii45xV/RrPLEn8z5
 JL9BcyHAPbDYQuq5vfJIVcJwYzxIxHV2Bx2Qmxp8lvnm9Gn7fAHIV4Qe266ybTki5cz5
 tGwnA0qTbG7v/ZCq2H7bUS2aoXsAXGY48fDdhDi5aWtZi8fzdAGzBNcV9nBQVsRS1K6D
 1u+b5d6a8pRVQqoJ2Aj0fKy4mwRoT++rVu/8TslXS5rDmeychA6CRPZtUNvw4PiLrrWu
 l+YJQTsDQygGK2bqy9eIG5MpQjErWIHPRjDCYnvYDKuZAcs2pUltcNic/FK63GgH7IYU
 0/FA==
X-Gm-Message-State: AOJu0Ywls3nKhlmVAwC82SvN3cijUaS5dZ2MPNxTCUonLa5Kw9xNRs9H
 vqi644+N2Wgg8wPqy0SKvt31c2Si7KlMVrEX+dU+56sXgX/21t2jpv0iWm+0LJFC2yFeh8sVZkM
 dIjSTaoMB5Lf4
X-Received: by 2002:a05:6a20:160b:b0:18c:1af0:ad56 with SMTP id
 l11-20020a056a20160b00b0018c1af0ad56mr7708896pzj.8.1701042799116; 
 Sun, 26 Nov 2023 15:53:19 -0800 (PST)
X-Received: by 2002:a05:6a20:160b:b0:18c:1af0:ad56 with SMTP id
 l11-20020a056a20160b00b0018c1af0ad56mr7708885pzj.8.1701042798824; 
 Sun, 26 Nov 2023 15:53:18 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa7918a000000b0068c10187dc3sm6044141pfa.168.2023.11.26.15.53.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 15:53:18 -0800 (PST)
Message-ID: <bc9bfb15-3b4e-4a52-9114-4764f83f6cbf@redhat.com>
Date: Mon, 27 Nov 2023 10:53:15 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] target/arm/kvm: Move kvm_arm_handle_debug and
 unexport
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20231123044219.896776-1-richard.henderson@linaro.org>
 <20231123044219.896776-8-richard.henderson@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231123044219.896776-8-richard.henderson@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: yz3HMv/TDeEN

On 11/23/23 15:42, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/kvm_arm.h |  9 ------
>   target/arm/kvm.c     | 77 ++++++++++++++++++++++++++++++++++++++++++++
>   target/arm/kvm64.c   | 70 ----------------------------------------
>   3 files changed, 77 insertions(+), 79 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>

