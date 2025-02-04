Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp39080njb;
        Mon, 3 Feb 2025 23:00:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWa3GOg4dZiBHPVpmHoH23tzRmE+yXT7dI/nZ1dS1mLLMeBhTMHFFpNyji5GyznlA9J/JGqozXqggGF/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHYX8nW8deyX0UTIvlcmKmSSI8hvonpJb9vhj6e9BfL4NxcItoD5pOkFcRQbWAx1mV1k7mg
X-Received: by 2002:ac8:7dd0:0:b0:467:59f6:3e56 with SMTP id d75a77b69052e-46fd0b68df0mr331203531cf.36.1738652421018;
        Mon, 03 Feb 2025 23:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738652421; cv=none;
        d=google.com; s=arc-20240605;
        b=DBiTGhd6d3uqIrHAaujhO0a+zNFKXsY9N5Pa13pDU+tLSvI/hRRIxcO7IIVaUQtPP/
         gp8De/ZDRMA/qRTr1OA4PKbuSEEEh4R0v/4o1UVo9INpVcwx38R43UrsV6VgwsIFlylD
         VVf6PfLWFOeHUn87rd1e6JSGb8UGEw4f19a1AI48y8zmMpl2ca5BGGDrtUKYOu8WqeNY
         Yw1SZGNrXmfCz8NCWwuzRHP7z73Ntw7qtZNEbTvK1gJnxOL6w4pdZ07NFxyDMKoPLqV5
         kqjgJ8RPKjQCRQy/Ev44EECV4C38eByqdDr2GIrmd1hiNzZ+orZ/r2dfil0Q+GqsvSyo
         f7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=l7lwg8YP17MbRt/gRdMrBX5rcvwloCNp2hDJDqNV+Wc=;
        fh=Uv80Dds6bEL1acOXZBqlR9TzdvqTqotbBke4euY5BWM=;
        b=lIlaa1ZB79xLE48kooNv7me0AzTZr679psdRH0ZpeIVvIkBwWNULppiIiVIv1FoflM
         dSAC+irt7Shw/FAOW6iP/uTx6q2nnMzeT7da4qqdgSsugBIbHlyRimh9C4w9ORJsJTQG
         6TumwEv0ZFfkasEFzoSM5xBTDr0Hp5gR9OzA4CtP98L2jZVnOtNGojQVaR7/Bi4AJ2PQ
         mukeCUx1f+zSfxtJUY32VKo6kvrVfAxr8XcD60bpzxfGRpp5FQtBGzpOOPt9zWu4eMCM
         b7TL/tYEz9sGkXdFwmdSDc5ybnhhNnc+jrRDH9eHxu2zbSiWdc8YI2GgK/wblmDmMgfc
         8Q6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3OJfagU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bd8fcesi21855591cf.569.2025.02.03.23.00.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2025 23:00:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X3OJfagU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfCuW-0000y2-Ap; Tue, 04 Feb 2025 01:59:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfCuU-0000wv-86
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 01:59:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfCuQ-0008TL-L7
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 01:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738652385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=l7lwg8YP17MbRt/gRdMrBX5rcvwloCNp2hDJDqNV+Wc=;
 b=X3OJfagUCffm5OzyuBBIu/3+6fxofk9awFsU3QBjjSFIA5ALQIXvCGzR/mY88fmZLG9F30
 +8uEx9mvRC4U9WXlELVp1XhvJ4zFF6WoU/R0fMPRlnS5ve81P0ERaHOyOHazx9erPZuohV
 rum3TcUJGejiWiAzCIxumkbT5RckGO8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-133-6LVp8QFeNc2JFCLR8Olu8A-1; Tue, 04 Feb 2025 01:59:43 -0500
X-MC-Unique: 6LVp8QFeNc2JFCLR8Olu8A-1
X-Mimecast-MFC-AGG-ID: 6LVp8QFeNc2JFCLR8Olu8A
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38bf4913669so2449602f8f.2
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2025 22:59:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738652382; x=1739257182;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7lwg8YP17MbRt/gRdMrBX5rcvwloCNp2hDJDqNV+Wc=;
 b=GIjNPqwRJ8y+CKH/eRLklfaAB7r0XnmLda5RXVRPZFSXvICZEPwvxDYJg7upFORhD7
 eHXF7QE8+g+mTbTK1tTyi/cZCIrJ4cCDtlkVl2ThKg8p6jqL/fc3NCka/pmiVO7O/u/L
 kIdNCJeTkoOQd/fRbmWAP61WSdR9Hg5OeEun+YlzIGRBPk7LEeaBFn+JxWy0ryAutJ9C
 AMJ4fjb3carFKO6HiU4AjdK+qbH11uOMN3H/zVzL0RN1PQ8VQHpWysP9yS+pjXqasBe4
 191cZ5IR0DfaISzpvhqL7xi4z+cag3Y/9KP5yi6l7mLKJnXp7DbwpD9ASGaIMNscYGJm
 2nxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpCRISyj0XGALNQyf/MH1YPL57Bdw4Csi0xtTkUGRca/J4/Ia0tU6pcEDlY0f0u5cGAuFVIWj6lg==@nongnu.org
X-Gm-Message-State: AOJu0YzrGrufwCIzJbs5dOia3UM4AYwf/R40zCUWwBLq29rR8g/SFWPU
 o0CqRM4KwQgFIO9UKLz9mxroqiIgzzi2Y0G72BekfLZv7PX4pcgdyMGHE0IcbgxAt8u/y/S4E5i
 jvAJ5cOPjem3l3Eut80zaZAyVPWv2QQ+sZjuFqJM2YeD0F74Ewg==
X-Gm-Gg: ASbGncsnj5pQlaXVs8mgxaWYXfB9eCUYMt+17ygFXEhrUY4CCurRI0AfQxVxankFYDq
 akN8eB4wV1XsbX9kxYbkbLKpYo7cQKN5Zd8sCZPymcL2GDrocvTeqUJr7N2kvW7Ev58iKDeQQvy
 sbOOInQLkW0zz35dZaPNqamcpuwTitRKYcm+WIQxVTr3cIQ/n5TpIH6X7EHlfDz5DGNyqDInUod
 22JKjHNohFDkaivDX7uf0UXbmOaM/4CuzBGTRy+8Ht9JjD6aA2eg0JVJ+D7nb665TDzYaVyHXDc
 Irk4O3eX63RTPjJ7T/GRG8+wjcB5/NQ/ruO4
X-Received: by 2002:a05:6000:1446:b0:38c:5d95:305a with SMTP id
 ffacd0b85a97d-38c5d953273mr15325844f8f.26.1738652382184; 
 Mon, 03 Feb 2025 22:59:42 -0800 (PST)
X-Received: by 2002:a05:6000:1446:b0:38c:5d95:305a with SMTP id
 ffacd0b85a97d-38c5d953273mr15325791f8f.26.1738652381018; 
 Mon, 03 Feb 2025 22:59:41 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81941sm214581435e9.36.2025.02.03.22.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 22:59:40 -0800 (PST)
Message-ID: <c26294a7-22db-4255-8886-c7973471feae@redhat.com>
Date: Tue, 4 Feb 2025 07:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/3] hw/boards: Convert no_sdcard flag to
 OnOffAuto tri-state
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org
References: <20241125181420.24424-1-philmd@linaro.org>
 <20241125181420.24424-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241125181420.24424-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a1e6qRAM39t3otOEFxkD_LoqRMdJGU3HOAl4OYFI1RA_1738652382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AeI6ZI5CUjGB

On 25/11/2024 19.14, Philippe Mathieu-Daudé wrote:
> MachineClass::no_sdcard is initialized as false by default.
> To catch all uses, convert it to a tri-state, having the
> current default (false) becoming AUTO.
> 
> No logical change intended.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/boards.h        | 2 +-
>   hw/arm/xilinx_zynq.c       | 2 +-
>   hw/core/null-machine.c     | 2 +-
>   hw/s390x/s390-virtio-ccw.c | 2 +-
>   system/vl.c                | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

