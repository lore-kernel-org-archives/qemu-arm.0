Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2456566ejb;
        Wed, 24 May 2023 03:49:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PCQaRfywhoyjwqYWBaUxLyyaJQlfF/e49KbuxPijjVCbuz9QasrfRjhs8W5a85ClgBj79
X-Received: by 2002:a05:622a:54d:b0:3f6:9ebc:9593 with SMTP id m13-20020a05622a054d00b003f69ebc9593mr17010934qtx.65.1684925350536;
        Wed, 24 May 2023 03:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684925350; cv=none;
        d=google.com; s=arc-20160816;
        b=PUKEv0/wR09PaZZu6QlUapDNbEsXzoZtPAWUY8CZlNCWDy5bjj3KGS6xrNbt3d9rd0
         yaS0VWMIjFhq/B5Ji5zHFxDnjE+HXZrTOqzFSggw5cVbJJu1jC7nCAGpQ/KRCdbHWxuw
         0Yes8mvLd+G52NkuDN39ejNOYWj2S25XEFjpncI0MAWEv1QZcj1wi0ILXWwWtoAIb0hd
         DpADf3aGqhJF74f9cd9PdW9BSk5Q+QvzmF4fOvs7+5/5S3WDNLmSQ88Gdjwos+PRcNAU
         EC7smy+eMgH8KDy/xUPc8psPkH7/Ejh2dJI9ESF8wAfaqZA5TBUFtZjnCnl61NEIKaxT
         vWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X15Mf24DkIGVaX1jnOTT/tlssYH8biTu4oGf/QpgFNA=;
        b=j1xz6DUbFpoQEOdVMSCwzFzef5TdOThzuGxZt+Z0sfs8uiGoFHvaYOuFzzs3LE8L72
         33qh7blJf+4IZTAt6gTYOnLTZUhaBFEbGgotd1R8aaTXKPnGDTH+blbQS96R4WEgjrIE
         M6Ut4qrslf7kg04bZfTQmiMoamA1cMNtDomAqyOXLZck1ZX1fGkzFsPG3/wC0UFpw39p
         9kq4YD4A78IEkixp6fC9lII0dpppsR4uu8rl4uxQo7T/J+WFF5VCqSesAxg6YNX7c5N1
         z3jFK0wc9zFd7L9k+RdXv2ucawbo2UOqLBwNRQ03WE9cuyNWskq4bV0fVeOAdadfYr/X
         jMYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBnjVR0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9-20020a05622a010900b003f22843a015si6305076qtw.752.2023.05.24.03.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SBnjVR0x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1m33-0004a9-B5; Wed, 24 May 2023 06:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1m31-0004Xs-BF
 for qemu-arm@nongnu.org; Wed, 24 May 2023 06:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1m2y-0005KL-Ua
 for qemu-arm@nongnu.org; Wed, 24 May 2023 06:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684925321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X15Mf24DkIGVaX1jnOTT/tlssYH8biTu4oGf/QpgFNA=;
 b=SBnjVR0x13CKzbzh26xWaQEz8Ai80LgfMGVQO6wPgS9Wb7j/UWAMF0xXIeexns+vUKxOKy
 qqLnMs/q4hSirjYG7IqEF5sGwJb8UpkYfE5R7bPZr8CBtmqW6jtVR/AkPhuJYkLraPBmOQ
 8QFqyfT2ZwJwgttyRz6JneGZB4hvBqM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-HZ59m3ZVOcSTtQAElo2oYQ-1; Wed, 24 May 2023 06:48:38 -0400
X-MC-Unique: HZ59m3ZVOcSTtQAElo2oYQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f50aa22cd2so5113295e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 03:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684925317; x=1687517317;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X15Mf24DkIGVaX1jnOTT/tlssYH8biTu4oGf/QpgFNA=;
 b=K1uZUHUI7WpahEYVkn527cvaPo1N21OLRYj9zNB0v0XYKjC9WChHLAHtedBvQ4vFN9
 rtsZmMMSEP6j1SYi36eApyjYv0bLtEkkJ2LJhb73qXxBNjejhgsG45u5ouhcu7QRpI4V
 1Yd99uqI5t6VG/SpSCNKVbpLc9sCS5PnQu/S0C8FvXoQow4HY3+aiEO3fU/RfLv6ADym
 9yUg9pvSb2IO5gfunqz2Wt6Nn2DRFPt8mOqRuLxZSJmxvSQfdV+fyqIlptLkehO6U8ss
 kLs8mZ7WaQSLacIaoGmPsevPUtjulH8AIXFJR8qJKtjd1Ma0MZRyzJ6WklShyPyrTO8x
 PFZQ==
X-Gm-Message-State: AC+VfDwdBlBsZJemydbT1ATrAB1Vfr5sBU/pJDPdrRDWgddRenzl1v9E
 usE+EyYVgVatXj9udocVTYdrWLaPWfwwd8tKjxYU19qiifV2S1mp4o3oFncoG018+tMcRd3lInO
 n/AiU2WY07h6o
X-Received: by 2002:a05:600c:ad2:b0:3f6:d2:d8c0 with SMTP id
 c18-20020a05600c0ad200b003f600d2d8c0mr9367738wmr.19.1684925317650; 
 Wed, 24 May 2023 03:48:37 -0700 (PDT)
X-Received: by 2002:a05:600c:ad2:b0:3f6:d2:d8c0 with SMTP id
 c18-20020a05600c0ad200b003f600d2d8c0mr9367722wmr.19.1684925317388; 
 Wed, 24 May 2023 03:48:37 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05600c4e1500b003f4283f5c1bsm7127605wmq.2.2023.05.24.03.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 03:48:36 -0700 (PDT)
Message-ID: <933facc7-d6e8-0b6d-d115-a0777bb82a4e@redhat.com>
Date: Wed, 24 May 2023 12:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/5] Add Bochs to list of vga_interfaces
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
 <20230524102729.810892-3-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524102729.810892-3-marcin.juszkiewicz@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: KEiTEEeVLaUk

On 24/05/2023 12.27, Marcin Juszkiewicz wrote:
> arm/sbsa-ref uses Bochs-display graphics card and without it being
> present in vga_interfaces "-vga none" argument handling cannot be added.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   include/sysemu/sysemu.h | 2 +-
>   softmmu/vl.c            | 6 ++++++
>   2 files changed, 7 insertions(+), 1 deletion(-)

Sorry for not noticing it earlier ... but while you're at it, please also 
add an entry for VGA_BOCHS to pci_vga_init(), so that other machines could 
benefit from this automatically, too.

  Thomas


