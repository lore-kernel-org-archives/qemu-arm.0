Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2434754njn;
        Tue, 14 Jan 2025 06:11:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUQw6lg+F0aKrMoOTdKtErtGhSYVBip2O2SBOmSylyBALPopoR5l4+R5TM93+LeeDNkKTEN0F8SGK7jDg==@linaro.org
X-Google-Smtp-Source: AGHT+IEz4BgsemzIXvJZRQze36aKdiSzW+rLx90BdE3QfXILFAkz3J83suWWZNsWpnKUE3bZjKJT
X-Received: by 2002:ac8:7f4c:0:b0:467:1e96:6462 with SMTP id d75a77b69052e-46c9941cd7bmr187815971cf.0.1736863902965;
        Tue, 14 Jan 2025 06:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736863902; cv=none;
        d=google.com; s=arc-20240605;
        b=CyL7Eg3ThwksHJcZPaWzEt/TjZHNXBnF8CLUNiw9QQeWzAKO1LTqfEWEa6Hxtt5WBS
         Qp7kIjCSfuKUz5Lsq/2iNzerNPuJX3Rz9T7N1zENRpSqpWkimwcdCXA64z87u6x61Gy1
         4ofCjk6OAs/ZehNjaSZ5SBC8Gn2R4YmE5jLZqHZrG+/bE2h3A1X5oMSO/bvsiXf2diz9
         d/rKy2DQc65iPB2Z5QEce+dw0l3NernAhgc/GpfUKmPaaG9K4L200Kp8uaze2f4Rm7Ls
         IExd6AoDIUjQbAwp1t4YDxdmuLcvHpjpR9o8y27mw1VOM3ltB1Qyic22Svq5LThVXdK7
         Wm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:autocrypt:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4PrAckxjMX0X/2ESjCBt17CaHgHYf56af0Xw3wi3t9c=;
        fh=kBhaHZfBYkxoKTBewJbTb2xqNlQLpKDNBssdS4Kcn9w=;
        b=SfuY1KKscvAYbK82UF9vR3mygnb8BxOmOyl959dRdllHv8dKOK1ib8Q3hJncS5BuNJ
         oUR8EVnRZDT8dSvKUE1F4lTGYT9XVgom43k1NWlwZu/a+rEAiOpsj8lSX4T7gatIoepJ
         y+ikHA3kRbNt8c0Jj6i1DV1m7Yp6uWzYyzJ7pdb6EQUf54lYrh2zVVuh/AeBfRSjHpa7
         E16OR3+G+R3it3XN/4iNhIzKkp2co7E6Grvbkc7QvVomuwm/5gnq7s7xqLSbWRL4dA0Z
         sR118Yj69VA06dTNgqRT/WCNJzo6S1QL5oxm+ZTIgigcvUPsxndySSZjK2WYlKS9a6Bf
         irAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HY9g9a0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e73b6si112729781cf.302.2025.01.14.06.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 06:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HY9g9a0T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXhdR-0005OZ-F1; Tue, 14 Jan 2025 09:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tXhdQ-0005NY-Ih
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 09:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1tXhdP-0005HN-6d
 for qemu-arm@nongnu.org; Tue, 14 Jan 2025 09:11:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736863870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4PrAckxjMX0X/2ESjCBt17CaHgHYf56af0Xw3wi3t9c=;
 b=HY9g9a0T8eYxW5pK8j1BpJ6FSjXaEIFoN3ZcFB5FQFYhnhC1Is535rGFXui3Yf0Jag1vN9
 J0m5ydCsFed2JAndKQtO5XJ4emVkFSoEsQlfJZ9OOUDDEoWUJigQYIxjV0dX1/YZTKnDsA
 vc6Hy/W/TY+fnQ2zIiQVM82AZ856BhQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-iYEH1Hk_MmKKb25voQ9LXg-1; Tue, 14 Jan 2025 09:11:09 -0500
X-MC-Unique: iYEH1Hk_MmKKb25voQ9LXg-1
X-Mimecast-MFC-AGG-ID: iYEH1Hk_MmKKb25voQ9LXg
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so31042165e9.3
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2025 06:11:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736863868; x=1737468668;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4PrAckxjMX0X/2ESjCBt17CaHgHYf56af0Xw3wi3t9c=;
 b=dqKtoqDrgynzTh+wPcAx4PC8hB+uT4JhZU50bSeuIMB+HyKSKedjTOBF8AuoEn2dUT
 ZCi3rfea3eh2wEnGNkm9nePayOlYcjnyF4x/Yv1Nx1GkBika74K8AeD2sFNBaev5Wmjr
 i0jXXJzIGH5xxCC35bD8xYXFvMoT8P2vcQuzIr30zvHUA8GT/tWDw3yADvr0+oLXDcO5
 ohV4j49TzRW344duBPdadwkJSy7lzNyL9VzFGS0SDv9Hsj2Tlyht4yAAM89MnEkfGmic
 jWHxTXcaGFQy+ow9AgAKwvSBgHD2uDRsHRXqXuOjz3s/Jeoc2WYSYtCmv83eB54HP7/d
 I/1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPHYwlIlRqCW5VzpvoSvhdJQzTImBL3nnXbJJSc99r2T55aCinvGBybD6F8PzyVxI7ItrKSPaFKA==@nongnu.org
X-Gm-Message-State: AOJu0YwrbujI+2SPjr9rG9Rp2bY/Kr/tqYwCYEX30sIpFAlBLqHW3EGf
 c4S4Scd02suzOexGAzOP2mEUyF5UjmMgRmKr3VSJlnSdjzt4ZKJlchhoEcpJSVT8XeT6WyhV2mU
 aFIqv0tLzb0IYLhgBVHJaVuJckY6jYNMmAzELvz/c1WqV/kmjHw==
X-Gm-Gg: ASbGnctb9x3Hu2DZjnsZ7rO5b7UATr7aY9H9BCmmEw4B7Hsdno8FIbCtpa53DiSga1c
 ATCi4p0t7/5VKQkFe9KT52w6O3+hfg//oO3lViop2M60FJnj3lJ9gqwpbKKkogaOSrLIkd74Nw9
 +AvITEUJ1H++935DCRhJBT8ioBk2TV2dOF//gDPN1W6lrDtEl7K/r1178E9GDjE0h1uWezzvfSk
 dh6s26m+g94Y5vP5Ia62WgmFQj0tGyUKjHupmt6LREZX9ONd/3954T2+JCQ4kA0cpPCYAXTKO0l
 r2RfE1yiehgwLu8+etcC0R96Z8YjYQWnJ1sONrgGMvJ6nJ2uS/RNwxuWQ1YPdcY2oK1Nc40REG5
 zIKwc0dLg
X-Received: by 2002:a05:600c:3aca:b0:434:f335:855 with SMTP id
 5b1f17b1804b1-436e26eb428mr188949805e9.28.1736863868159; 
 Tue, 14 Jan 2025 06:11:08 -0800 (PST)
X-Received: by 2002:a05:600c:3aca:b0:434:f335:855 with SMTP id
 5b1f17b1804b1-436e26eb428mr188949595e9.28.1736863867844; 
 Tue, 14 Jan 2025 06:11:07 -0800 (PST)
Received: from ?IPV6:2003:cb:c738:3100:8133:26cf:7877:94aa?
 (p200300cbc7383100813326cf787794aa.dip0.t-ipconnect.de.
 [2003:cb:c738:3100:8133:26cf:7877:94aa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e6249csm174697565e9.38.2025.01.14.06.11.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 06:11:06 -0800 (PST)
Message-ID: <295cb360-b618-4a89-86e2-1630b872fa7f@redhat.com>
Date: Tue, 14 Jan 2025 15:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] hostmem: Handle remapping of RAM
To: =?UTF-8?Q?=E2=80=9CWilliam_Roche?= <william.roche@oracle.com>,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peterx@redhat.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 philmd@linaro.org, peter.maydell@linaro.org, mtosatti@redhat.com,
 imammedo@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, zhao1.liu@intel.com, joao.m.martins@oracle.com
References: <cf587c8b-3894-4589-bfea-be5db70e81f3@redhat.com>
 <20250110211405.2284121-1-william.roche@oracle.com>
 <20250110211405.2284121-7-william.roche@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250110211405.2284121-7-william.roche@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HE2tEww5f3YV8O-Wlf42t--b9MDLzCHL_VK20OEzbLg_1736863868
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
X-TUID: a2CYHNB7DsMY

On 10.01.25 22:14, “William Roche wrote:
> From: David Hildenbrand <david@redhat.com>
> 

You can make yourself the author and just make me a Co-developed-by here.

LGTM!

-- 
Cheers,

David / dhildenb

