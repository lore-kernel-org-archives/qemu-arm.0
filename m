Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp831007ejy;
        Tue, 21 Nov 2023 15:28:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6pGmD69TyIKtOs8hNowrx578LtCBjTLD/gAjAuCFPmFxRt5wWLTg/csxrvtqml8GaC8SQ
X-Received: by 2002:a05:622a:164c:b0:417:d865:8295 with SMTP id y12-20020a05622a164c00b00417d8658295mr744803qtj.66.1700609323943;
        Tue, 21 Nov 2023 15:28:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700609323; cv=none;
        d=google.com; s=arc-20160816;
        b=DXqp/6Ratx7/DQeyl7jLPZSW3mqc9Q32QRcZDNGQ+9KPGwn7OxEc+Vb7B64btVTHlB
         9Sj8aZOp8DTJX4+uaJWfQxXE+RNvI0/AfyE09IixLdRnS9LaFGPebDNHSRh/3ZKBmjWC
         XCxnOkeqr+s8PmMLhXLMS/JhXzL+3FfrDg6InNaM5WxbkrIwSWfVtBRb6nWVlQ5S+lrk
         BT4TZBZZ9HscGTiebS8cFgkhf71CVLUQdfactQgVLnG3zgufIzIf9gP/3QdbOTvRPap3
         kfwvs9gPUOdgb+OmhFHqUbqTiJozELMvniyOF/M6gWTJAvGIaDNBiIdtRTumxJHFG68D
         45yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=oY0DQVF7MZjWjEq2OlZLq7FU1SY1X79y6xy2fdoZNSk=;
        fh=fYT3J/Id4saa98odmtMsnR8KRAnJjkQylTtAubItTgU=;
        b=csCuwKIPoSVIe+Jypzzg3mJQR410DNmXY1QDC5/vDOfTaSVuIy2wcpU85a0EroHDYw
         B/TVnkV2hC+5HwxVN9eeNPWb7adNFANVXEI/G8MbOVYHuGzSpCfv0LcI+YMeBnV5j9hc
         2eXPG6jByVZ0NmmssVvM5QoxYcIxeUNTenpz7j41wBewqacRc1WiMDypB0FA3tUgTxDE
         uR6u/jgIBcuX/WmVFuV+yLNkUHdRtqERWcXSDQOtNNdIrWs3bgqNmmIYTC1LPdNpr0L1
         E4uS/YBTl9M7rSejje/EdKD4IDm1j6B/TtuBHlSIHUX5Cj1nyl9L/HeOj3ptNVIE7Xoa
         EI7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D9r+Majc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv9-20020a05622a0a0900b004236d309e6csi2763956qtb.701.2023.11.21.15.28.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 15:28:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D9r+Majc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5aA5-0003kB-Vh; Tue, 21 Nov 2023 18:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r5aA4-0003iV-8H
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 18:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r5aA2-0007iD-LQ
 for qemu-arm@nongnu.org; Tue, 21 Nov 2023 18:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700609285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oY0DQVF7MZjWjEq2OlZLq7FU1SY1X79y6xy2fdoZNSk=;
 b=D9r+MajcJiXNuvvKOiPuegmxzYIDbQ6AU5wMj+O5X8Eh0DkBkiEJzWdOrLoQRxdeov/OeO
 hYT9Pc6KC9NONhErAh5dsvHvfJDRY7oCvW/RM/AfjglR5yI17Op3ZcB9kwg04eLGFdaZvr
 WkTZ5WSLgq5WDehopSAANEuCseCYD9A=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-dL_XmPVzOS6sWkiQIqVUVQ-1; Tue, 21 Nov 2023 18:28:04 -0500
X-MC-Unique: dL_XmPVzOS6sWkiQIqVUVQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-28079cae9fdso7163076a91.2
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 15:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700609283; x=1701214083;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oY0DQVF7MZjWjEq2OlZLq7FU1SY1X79y6xy2fdoZNSk=;
 b=f1VqthHtqZdb/lBkbM2QIZdWhHIH8TK5+SQpCqWZvRvb9pBJUfyQYZMKSiBbPAQHyI
 7FnZkCpZ3hj1SR4eF1Kqcp/tBWohXEElZzP2asnKU8PZC0K0HXQH7Jthd223B2Fdmtpf
 SyMdKg4KnyPXCnJobBj1YhPsMp9yvGWhIZgavX7QD1AmGI5RqYkKfX9klOBNXM6gJULF
 VAQ7IznnFSKSP1N3mCKIj8UVXU6T35iAGBhRayLXFghUl3duEXBbErUTjcwl8rFuCHza
 yiMe+8jjipMtF4GaEASFljrC5hBDVu6SCBOPblZcvZDe/dgYfawRj7Fc6a1Ld8fQRwx/
 85Ew==
X-Gm-Message-State: AOJu0YzknX4Gr/xg+ngLy4ELSfsT/MmTcImgbDwxjZaCYO/0VrQ2conf
 t8GdCHUs25iAOnewleJ7uOYzw82pWRmUB7pQmQ/aYcSUyz8fl9DhThjkjmn/6TcXJEoR1ajnHUi
 iQCr/2MJzIkmk
X-Received: by 2002:a17:90b:1e0e:b0:280:a5b8:daf1 with SMTP id
 pg14-20020a17090b1e0e00b00280a5b8daf1mr790809pjb.47.1700609283054; 
 Tue, 21 Nov 2023 15:28:03 -0800 (PST)
X-Received: by 2002:a17:90b:1e0e:b0:280:a5b8:daf1 with SMTP id
 pg14-20020a17090b1e0e00b00280a5b8daf1mr790778pjb.47.1700609282719; 
 Tue, 21 Nov 2023 15:28:02 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15?
 ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a17090a788700b00283a0c3df63sm67210pjk.54.2023.11.21.15.27.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Nov 2023 15:28:02 -0800 (PST)
Message-ID: <948cc368-241e-41f4-b3c9-683e220dcfc2@redhat.com>
Date: Wed, 22 Nov 2023 09:27:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0] hw: Add compat machines for 9.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20231120094259.1191804-1-cohuck@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120094259.1191804-1-cohuck@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: ujm7KwH5giia

On 11/20/23 19:42, Cornelia Huck wrote:
> Add 9.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 17 ++++++++++++++---
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 80 insertions(+), 9 deletions(-)
> 

For hw/arm/virt.c

Reviewed-by: Gavin Shan <gshan@redhat.com>

