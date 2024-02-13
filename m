Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp63232eje;
        Tue, 13 Feb 2024 03:24:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUy4rDqdf6g4JPwIr23tPuz8nCntJ7s0qcZaskxHbz9NIz85r3/nWNs7q4yYUF0A/YmupJOs9dusZ03W/RTDP62xcP2LtiR
X-Google-Smtp-Source: AGHT+IHK5GWqSM1wJan0DWL+OfzaRHd+1nxGf5utsnMHNVOixrlsqIX+S1Tu5HgAUsS+JMbMlvgx
X-Received: by 2002:a05:600c:3b8a:b0:410:e9bf:e687 with SMTP id n10-20020a05600c3b8a00b00410e9bfe687mr2835290wms.13.1707823494827;
        Tue, 13 Feb 2024 03:24:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707823494; cv=none;
        d=google.com; s=arc-20160816;
        b=IZafdTtUb6EPVyhr9zBjxnve7mnnF7z95H0nTZVLvpsppRB035vchhsFPZS4b8OXBH
         fJLQHwcvgmhbkoSCPql6CWeYtyq3yKgJmSLEicbWEAvuqWVntAUuikerfPb5WvY2Sa1/
         nYM3IWiniOQCwmPX5WNosTEoXR3OC0ESQxnN8DTNAqmAZ1+HwfBe2CbEAccL1Vte6NYB
         dY42gEbIyQiB1TeLaUZKVzoxumGkCHbX0CBaTc5BU72BF75Tjiu5jIzJ/qUc9L9VIZOJ
         ihtM52gu5M7Lt59tz2HhxRZjdMXSPPDADQ1Qt8p3dfE8umcaW6263Qyu2tkWXGJwqXQj
         0LZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LXrGvMu2PuYM9s7Uff+Yi8b8znW3yXmttoiKCwwY/ic=;
        fh=TqXSUYGhJgPPyuFWhDkCVb1cCFfZ9xrN93/sAe9iPs4=;
        b=TnGahNaWKKbB4rA0BwTCTD6+l6yX1fh5+suJUY+pMsxsMmz42yuB8oOgG3yjWxQjp1
         OCYerNqU7P5IRLC0vVXOHU21NU49ywEiwOYS5o9MUe/eHyd4FUPmS/buZduCqUf3QuVo
         IN31ZYikF14ke2sGWW6jlvzPqUKqhYCgvahDj6He2CuLCihNLQ4HwHH0q21fIvAPytQG
         bAGIgLQK0eN3XZqmrgWJAosR+ixIyfFqj8DMtDrpVKaWVMFXzRPYwKCNR3GWPqx4uVpv
         KjnntHJVyoM4ZVlI6Ts0RlU6MnuSHYtMcrdKhhnMhzTK3eozBbZvl6+EuUGPaMszqdDq
         F0fA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+mxNxvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCUWYHsf9feJeK4fmJyJv4GdJy906nP2G523Ulmh0c8vWjpwlsZJp7jhtTa7WPqcG7tiOrYBhWEVS89HFw4DEOy0SVD/+0bH
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3-20020a05600c378300b0041163af6501si1551434wmr.98.2024.02.13.03.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 03:24:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F+mxNxvo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZqtx-0005Tg-0g; Tue, 13 Feb 2024 06:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZqtw-0005TY-44
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:24:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZqtr-00028d-Nb
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707823471;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXrGvMu2PuYM9s7Uff+Yi8b8znW3yXmttoiKCwwY/ic=;
 b=F+mxNxvojPk5tyVH5YJnT/i4+12vqO1jlKhLNb+CUeBIR1vOIhV+q0YYim5PZG7YIrebCt
 FrApQW/lvxCRi+tZG+Ifb7/hw+73th0z/qWMrCe6T3wZWGEve1vSRuHQxR160nyN6+u64m
 pnSraG6sj0qKBxW/dN3+7+XJSGrW734=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-aMypG0hbOPu5aYFB6Gm2Og-1; Tue, 13 Feb 2024 06:24:28 -0500
X-MC-Unique: aMypG0hbOPu5aYFB6Gm2Og-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7859f5ae972so568114685a.3
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 03:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707823467; x=1708428267;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LXrGvMu2PuYM9s7Uff+Yi8b8znW3yXmttoiKCwwY/ic=;
 b=DDb1pRs5eOF5C7sH+5jfVsZk1achnNzM69rZ9dnG9RAj3N5iMZvf/pE/QDay6/RYKz
 gfcPQnmP4UyGZDjupK8W8rzRAmVTGkE13rKuwyNzeNDH/w7FX8ZOt0PNxfcIC3sM4nR6
 W1NMgzhiPHlgX1OztbbfCyvtqN6rPQDOKuLwsfaZFVPGkjba8nTOLOHLtkQrQBs8epxC
 r99ifsWUae4G4dGt0M3VDrgYhlK4Nxfp3Ty1z+c1ENR5GLy32Qr8CQYMxobeEht9lY8a
 xzYTwOKn7er5fTcyK7lIt9jisVPoHdaSZmc3TnoZrIV58twljiyN8V5itQ8V78wcNyUT
 75tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNxDm6MX5t5l+vQ5Oph1+Lp+QjdmnVsC0kRZlIWrqQRSmgjik26n4gx6fQegrjo00mVGVnwaktmpkcTVYzjtD/UQtv
X-Gm-Message-State: AOJu0YyFtrW7lmvj7ZFEriHil36nQtZ+2IIkj7f5lcf2j6eg2SB8ojVS
 FTJmFJBQ7cLHC7wy63Zx51CJgOwJBPI6BXff6fXBXQXkFUUaccTNF+D8TWLbOA/F/jVnCZET2qH
 iTWbqJZdFB7Uty3XGd+gdaXE9hD4pLwhV3gZ4iYOuxqkTH3j8bw==
X-Received: by 2002:a05:620a:110c:b0:785:7403:8860 with SMTP id
 o12-20020a05620a110c00b0078574038860mr9246965qkk.50.1707823467511; 
 Tue, 13 Feb 2024 03:24:27 -0800 (PST)
X-Received: by 2002:a05:620a:110c:b0:785:7403:8860 with SMTP id
 o12-20020a05620a110c00b0078574038860mr9246950qkk.50.1707823467311; 
 Tue, 13 Feb 2024 03:24:27 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW3c4sBUcYIw78AH9A0Kf1hUhYGlSaxMdtH2gfKt7bKsrZCZObeqzPJKyQBUU3Vr2A76WTCcWebcB7mKMFxFxrMzI7IIgd2J1SkBlqkz1jKdR3GUdVnMiKX3ZMFUKltsWReUocVgLy2MECs8H9kCjl3EEy/U4Nq6j/K0Sj9dvJxRFPT4IZFwKl8r2kT1PDpny9Z/FHAgf+zjrJq6Y+ZQ0lDm3/N3ralAxbE2PRvGXZhhjuHErmGUYB6hIk5NqULuq9Od1Y+5k72Okk2nmi/
Received: from ?IPV6:2a01:e0a:59e:9d80:4685:ff:fe66:ea36?
 ([2a01:e0a:59e:9d80:4685:ff:fe66:ea36])
 by smtp.gmail.com with ESMTPSA id
 g19-20020ae9e113000000b0078715e107afsm928345qkm.73.2024.02.13.03.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:24:26 -0800 (PST)
Message-ID: <417ea71e-fb45-4e1d-b8e5-9d54d93dba3b@redhat.com>
Date: Tue, 13 Feb 2024 12:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com, clg@redhat.com,
 peter.maydell@linaro.org, Peter Xu <peterx@redhat.com>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
 <20240213060731-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240213060731-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1v/bMXbIuH8A

Hi Michael,
On 2/13/24 12:09, Michael S. Tsirkin wrote:
> On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
>> Do you have an other concern?
> I also worry a bit about migrating between hosts with different
> page sizes. Not with kvm I am guessing but with tcg it does work I think?
I have never tried but is it a valid use case? Adding Peter in CC.
> Is this just for vfio and vdpa? Can we limit this to these setups
> maybe?
I am afraid we know the actual use case too later. If the VFIO device is
hotplugged we have started working with 4kB granule.

The other way is to introduce a min_granule option as done for aw-bits.
But it is heavier.

Thanks

Eric
>

