Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp4253068njk;
        Tue, 3 Dec 2024 22:29:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU44bCcJjgAevgqH3rDhcV3sy5/MSp0FG3ZabeVaADoxgzbeZAa8uG3n0jBFE+SL28L7UXHkcH02K57bA==@linaro.org
X-Google-Smtp-Source: AGHT+IGfJequBsyRtscyT3k61YEzNVIUb6P3WHkpDFURjtUR98mj/qRUaJGCpsJVG7y0HjrjolVN
X-Received: by 2002:a05:620a:4009:b0:7b6:72bc:df75 with SMTP id af79cd13be357-7b6a61ca1c5mr626317285a.59.1733293782813;
        Tue, 03 Dec 2024 22:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733293782; cv=none;
        d=google.com; s=arc-20240605;
        b=FrCryYwD0BXs501wpo99csT0FPYXhhpyRW8XDEHQs+12893tCo0M95q40KVl2Ji3BX
         V7EzPi3Sx+55Y169ii90bjE1jqinhUXae6oCYlOhp8rS+Ba19SD76plekcdaRXBXvjKz
         8U2HirIEo8jN4PaxiuCTcnwgp8IdSKKZ4fchhoxtUwOCFvBudNmFt1XZm4RTJM2ygWq3
         p+DeoJd1RJrAxgBFA2wXQ5ux1UTfj6c2uoXTQvl7WiXI2VwWozIo7Auh17Y7gAewajZZ
         ctPoHf7VDz4BEsvv+Fy+jdPwoz0QPvBWR/yyDq1d9AsAL8bJ+PwWICmY2CgxdzylwV/x
         dUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=XZXuDneTyAqy8siHjeDb01Euw9X0+iiMm6RCLeCoQBc=;
        fh=ylm8r5qrwGD5Jsh2ZKrTSEqCE55cFgiWomRAmBtT0NA=;
        b=QZnKWNReYFSLln64ghoH+PAu6Wxlbnbcf9bysdkhh2+kP9FjBC/7D0rJo4KyDjveCC
         Quzx3hDwRi8U/ZiQi6PDmkZhNRk0oFnMTftS78MpPJTq9l7TAOHBUL8aUheezBPdsioA
         +PmE/mHqpHQD5lI/dJrqLamQdzf10e8dQO5aOGgIM7OYo3wRNIIWnb9gvOtCHC24Pdbm
         ScbNuwexpwDcuWvmC/EQjDbZNDn47b2dUbDolr+VTvUOGdvRnJJwuBsdBFVW1gCInopO
         SeSLEdiRGb33bELZ8rugIbGTy8xzLNsB0Cu0gM6nJEgb4vy8y8BfP1vD/qAGvFwas8S1
         R/bA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MoFcIgkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849d8625si1615286085a.538.2024.12.03.22.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 22:29:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MoFcIgkm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIisW-0005hx-GJ; Wed, 04 Dec 2024 01:28:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIisU-0005h8-Kb
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 01:28:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIisS-0002UX-Di
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 01:28:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733293726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XZXuDneTyAqy8siHjeDb01Euw9X0+iiMm6RCLeCoQBc=;
 b=MoFcIgkmZ1zsHEnuOJJ/NT4cL5rM8Mq3juBlRiJALHt/aLKRAx9Fy8ohTAhpQToB47XOWK
 pu4vG9nnHsriWG1LSC7o5mq1acdcea6QICcC8+oPAFYd2mXHPfgD/euzkJhOQ2OF+LNWzJ
 2DenJW33VGxmiMH0diIvWPfO6zL55Ho=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-tv9JQCPNPg2k12AL5mH5yA-1; Wed, 04 Dec 2024 01:28:45 -0500
X-MC-Unique: tv9JQCPNPg2k12AL5mH5yA-1
X-Mimecast-MFC-AGG-ID: tv9JQCPNPg2k12AL5mH5yA
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-aa525192412so469518566b.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 22:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733293724; x=1733898524;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XZXuDneTyAqy8siHjeDb01Euw9X0+iiMm6RCLeCoQBc=;
 b=e2PAEkL9p3o54cz2YZtP5F4aQsVetBjo95j/Uzto+eeVKp5xf+OwFeBMd0hARhypyC
 9/ZqmaY8uruF3/HxbiPrQEDVuDdk9+q2AZ/lFgwjyrv27XK4cj831ywN+uReEZCL58vw
 /MI80Na8xApLr2VI/TNPZPWYrQAB50un4gDTy0xKu2GipGbHAJgtv6b4fBbpZQB+WkFT
 IwjCDVmJc5hzOZX/lUfLlrQitIVLMCNQ+MKJx4E8yfhrBbw50tk1RDG0QvcS0uCVdarE
 xT8mhPvIyfs3H525b2YnbWYiSUQCnaJqRIjZuf8ouN3GenR8P1ouJiC2iMXYjSQYe1vh
 aN/w==
X-Gm-Message-State: AOJu0Yzvjws6cu1ftGUbYuN5oOp5bjFKEC+vKVMdTBorORS5KRP5Yb5e
 wNzqr+dbT1C3BLo0skI6d4/56dxEk2Y6OrVFAnajVEJGrhQBqGDWemdFhnjq9FU2L3aneU7A54P
 3RpcJH9QkblZO8hkPVQLNrkurM1dXJ8H7d71Lyitup9B4o/T2fg==
X-Gm-Gg: ASbGncsF7dtqCYG8KPpQdw1mE0TaFzB3SYvUg2AVrb0oMh2cp+/z4kaK5Ma80eCp2xP
 YiXSOaUpwmXOg+U5p3V2AhAERqP/aBAl98166SOh1RFKryw1p1ZVFaN4+0TbpvJpA60tkBBBEWA
 5SpjaMlmQACm4VB85bfvqfOaH5eOwTsqtuILCzbNUPEU0CziSrLIPTbf4pZKCFNyVc8jtwZuat7
 WNy3XmDX+Ky9wZD4qr7ktEYK0uMYgU+5OVq18MB/okU+ETcIubtEANfvjXYpoYYkvHAq75uXDd8
 DcT8sQ==
X-Received: by 2002:a17:906:292a:b0:aa5:c20:654 with SMTP id
 a640c23a62f3a-aa5f7f229e3mr404234666b.42.1733293723828; 
 Tue, 03 Dec 2024 22:28:43 -0800 (PST)
X-Received: by 2002:a17:906:292a:b0:aa5:c20:654 with SMTP id
 a640c23a62f3a-aa5f7f229e3mr404232866b.42.1733293723438; 
 Tue, 03 Dec 2024 22:28:43 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa59991f1b1sm692164166b.165.2024.12.03.22.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 22:28:43 -0800 (PST)
Message-ID: <3047c455-b67e-46d4-bf69-7477fcb752f7@redhat.com>
Date: Wed, 4 Dec 2024 07:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.0 2/2] hw: add compat machines for 10.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20241126103005.3794748-1-cohuck@redhat.com>
 <20241126103005.3794748-3-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241126103005.3794748-3-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ktMOv0nPICWsf_qCXySuZOHYb6E67Ko5A9a2f-uG5fw_1733293724
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: HhifWxpeSFxe

On 26/11/2024 11.30, Cornelia Huck wrote:
> Add 10.0 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 13 +++++++++++--
>   hw/i386/pc_q35.c           | 13 +++++++++++--
>   hw/m68k/virt.c             |  9 ++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   10 files changed, 76 insertions(+), 9 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

