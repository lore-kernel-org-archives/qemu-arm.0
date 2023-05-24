Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2487110ejb;
        Wed, 24 May 2023 04:48:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ItppPuEi40Q23IHrePAvesapwmgqNsjHm79moxiKNlBLt0zXLPscqACoAiPk+2BB4cWtK
X-Received: by 2002:a05:6214:20ef:b0:623:9126:8d7b with SMTP id 15-20020a05621420ef00b0062391268d7bmr28814329qvk.28.1684928892890;
        Wed, 24 May 2023 04:48:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684928892; cv=none;
        d=google.com; s=arc-20160816;
        b=yqsD+XA+hVcfrARmd96aw/2VL7gijJ+w/CGEy+DtAxm1WDUMAn3TobSW0OcRKvXt8i
         LA8WYk0mMMTuLi4hLqZGA7RJxVjAyDIDfzqtDccWxrLUeYxbV5yOVzrBwdSt2GScUJAi
         iqZlOYMYb98v5bcKAbsHFvd9WBmXfeu0NSDk4SH1a/tota//R3NVh/rluYWVg4YHJf6P
         VhMy9VAj+vD2DKvmdRNmUNTs/oQa3z0dAcK97erS5sgOddQ24gwJcdcGvkpZJsMFcFMJ
         E/wcTjGIvSa8+zM5C7toZ55LN5Kn2bwgDLMrM4D763TEvq7BStSWcn/n5X/bmE3j+NL7
         lfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ly3iq5djIcCqI4krF+Qo/9OZXtKT9eroYAcsgfU1o4Y=;
        b=om2pUJp3Mo2Iw+J/Y5qCpFYQvzEj/MEKDLyjS3dI4GSXXlAGPwEX3K1p6paGuANw28
         tsht2eKIjy+8YjLZsybX7caliPcsALyZ4Y49DrpxYzc7wNu0m/ITPS8ZorynxqSxWNAi
         5+7lVQiMymJPU/FABQGe0sUV2cj8YZ+iqpMEXChWNkxur5XnN80+go518z1Z5N2Paec/
         fhcvkeJrs6As9f2L36va4SSydJkCZpIV2B91Y/7QgltynhvgHHMwEGxVTPzqwv1p6il/
         Fl/K88ZDKt7DJ1C4dvmm/16kLSRbPsNIPQY5bkByyFr4tbvH1C7GrN4naYWVIuCERnHJ
         TYWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EM3trqPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a05622a02c100b003f5aa8ecaddsi6645287qtx.278.2023.05.24.04.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:48:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EM3trqPe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1myF-0007da-L4; Wed, 24 May 2023 07:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1mxy-0007aN-0N
 for qemu-arm@nongnu.org; Wed, 24 May 2023 07:47:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1q1mxr-0007Wr-4T
 for qemu-arm@nongnu.org; Wed, 24 May 2023 07:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684928853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ly3iq5djIcCqI4krF+Qo/9OZXtKT9eroYAcsgfU1o4Y=;
 b=EM3trqPe8nZ3rcmIzajBgKLVPEw/7vspF7tX/yCJ2nz+eLFvaV6QLQMOd3m6vhfy6YI5bK
 R2IsCoYaVcn+63QRE0g6w/L6OMj3M5iK3UvJn1i7lFdE5Mhvi6ewttbBdIuX5JtbRmH1F3
 VxZ09UGYMphBMvQx9Ao7mf1YViFnGYc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-uFYMheJVPnCR4mTqA3-gwA-1; Wed, 24 May 2023 07:47:30 -0400
X-MC-Unique: uFYMheJVPnCR4mTqA3-gwA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3062e5d0cd3so289353f8f.3
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 04:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684928849; x=1687520849;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ly3iq5djIcCqI4krF+Qo/9OZXtKT9eroYAcsgfU1o4Y=;
 b=HjUJcluDqmm7ymvaL3zCestMO964NPXd2qP3wHt5/YazwEgyevszR8LF163oFQQTc3
 K3c0p5DaagJZ5yrs96MSQ7JmJtlSMC1OYXZB1xwHeEsUcaLPG+pCQex6oQ4H92OzagMa
 Y3eUTZfWb8ptl8797VLVBY6qzdZpfREEt9qHfQ7bYELQpjCBX601mNxgWjU1G4Fw/HJU
 MG46oRtjpB9vt5588KGn84Uc3CtZ7pMr9+IP+ogtl7ILuXK6gvzqrc57MLbVpa5cOBZA
 KM8lccEiKSXzBX3zjA0x+cg5q/yv9+LQfmBKGZ/izrJu4zewgCuOUVMABLz+V2JhSCl6
 JhvA==
X-Gm-Message-State: AC+VfDza2bTHF1+wCUzaWssFSqNNp5DRALMeVeEs+o1CkzJz4xurTgKE
 NlsjVpfLwORAET9AouxcM04Ucz3mLb0EL1qfYF0dPfSukBChe6QGFiHDr3bktAgAypilqPlcsOx
 K87KbttL5Gk9S
X-Received: by 2002:a5d:54ca:0:b0:306:2979:8ab0 with SMTP id
 x10-20020a5d54ca000000b0030629798ab0mr12001652wrv.24.1684928849252; 
 Wed, 24 May 2023 04:47:29 -0700 (PDT)
X-Received: by 2002:a5d:54ca:0:b0:306:2979:8ab0 with SMTP id
 x10-20020a5d54ca000000b0030629798ab0mr12001640wrv.24.1684928848991; 
 Wed, 24 May 2023 04:47:28 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-64.web.vodafone.de.
 [109.43.176.64]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600001cb00b002f9e04459desm14192661wrx.109.2023.05.24.04.47.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 04:47:28 -0700 (PDT)
Message-ID: <ac22771e-4ccf-7c41-af25-b15c07e7c6a9@redhat.com>
Date: Wed, 24 May 2023 13:47:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/3] Add Bochs to list of vga_interfaces
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
 <20230524111413.833912-3-marcin.juszkiewicz@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230524111413.833912-3-marcin.juszkiewicz@linaro.org>
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
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: p6L9K/cSXjO/

On 24/05/2023 13.14, Marcin Juszkiewicz wrote:
> arm/sbsa-ref uses Bochs-display graphics card and without it being
> present in vga_interfaces "-vga none" argument handling cannot be added.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   hw/pci/pci.c            | 2 ++
>   include/sysemu/sysemu.h | 2 +-
>   softmmu/vl.c            | 6 ++++++
>   3 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

