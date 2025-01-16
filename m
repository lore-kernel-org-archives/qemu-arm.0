Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3988925njn;
        Thu, 16 Jan 2025 11:38:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1v5QZbNuzMK4nWGPmbexC+1Vp4zv6OCjTEDfKRnm5nHLqxsb8DSbr+mouNuCMC9paTsNprmNm0nPMZA==@linaro.org
X-Google-Smtp-Source: AGHT+IHjwkJiMxEPJoBwHNKvF9vbrrBm/7R04HdwcmNOUW+QbSAAYVTEZrT8Z3hXnLTL1oSWTbMG
X-Received: by 2002:ad4:4ea8:0:b0:6d8:b3a7:75ab with SMTP id 6a1803df08f44-6e1b21f10admr851666d6.44.1737056287169;
        Thu, 16 Jan 2025 11:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737056287; cv=none;
        d=google.com; s=arc-20240605;
        b=kqdEZZSwe6unh2VwhsGM/RR5dkym6lM2y3unxhqvY2btwCWNMdtfpo7F4VYsFMap4t
         PaF2jHvdlMxgYgmve6DwnFXCyYlFPqRtbG5SWZXg/8K+9ktaShxMEtnqZKTJX83CY+eO
         e4qi81H9jMU/WpZAlJ3sQMhodbzEyerHZIZaij+XkA3XYeX3WiKO+3ypxTFot4UhSmhZ
         FHvzpVSjEtSuIo4dzh7JrtZnAfFgZJnn2HtebGQCc8aXMxCsY1dbSlqIZPSTOGU+RDuM
         haqZBXrnErrnnyhG2dejDMiwV0UD8BRpJoJ4Sof4hexMALr5ZyeL8vgSlcuICQrR3ZaO
         lMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Xw1AjjH9VrdPmVJk6lRke7VDXMszjBlAoCoepQ6/hDc=;
        fh=qZl+U4Pi+G/mkmP/kUKujNxiJPZABGJGMc7E7m7fofk=;
        b=MUzV0XTtOKncQrD8vqP8K+j24oQTF/EZHp6xF916Eg4R9+zvaMo6s/Y7jFnUf0E9qF
         tDsgdMyZlRBdQHbOcqxQbbZ3c2Jenog0QIPwQ5KhiQeFNXL6ebD6+1qyeTFdjQmwLuF3
         RVsz47ibea2LRGqajnqlDiTKPsLrE2qE3geUYqA0qEW0fZxyXiInU3YPZ0h1KrinOYLu
         chLPRBEYY0dsFz/S2swq39rgBmDzOef7TSILo+IPYdBPLq2KJAB/ZqQWEscoufi/Vvx1
         zkb2ZA2GC1ASuNIL1RysrpYanPM/ag+qgGJhdpWVX8TZSl5VT9PHcbLxK2+lJrwLeZqP
         eziA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f97SuzCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afc1bb0dsi7133076d6.142.2025.01.16.11.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 11:38:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f97SuzCA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYVgl-0007mG-Da; Thu, 16 Jan 2025 14:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVgj-0007lg-Rb
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:37:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVgi-0003ny-Gl
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737056275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Xw1AjjH9VrdPmVJk6lRke7VDXMszjBlAoCoepQ6/hDc=;
 b=f97SuzCAc8LFjD6YLsfc5cTn1RAZZERXRPs62btcuDNBgUvTDnYqrO57eT1vvRHD/9elZy
 iJEecz8XvN7TLdaPVClMnYsZo12OkSNRaSlbMiRkkX9KWxJWgLpY/w6pDi3Y1MHlINQCAK
 xr0MEC4SSCpA18uf1OyfGiuiDbUf6vQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-LTZQxqegPsWS4sWAPYY45Q-1; Thu, 16 Jan 2025 14:37:54 -0500
X-MC-Unique: LTZQxqegPsWS4sWAPYY45Q-1
X-Mimecast-MFC-AGG-ID: LTZQxqegPsWS4sWAPYY45Q
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43628594d34so6570115e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 11:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056273; x=1737661073;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xw1AjjH9VrdPmVJk6lRke7VDXMszjBlAoCoepQ6/hDc=;
 b=hvgMRNH/F1D/ZN+ns0/5awXckUD9gDuV9RDlfP87ZdfwtUp3QP02FOtZpqZK2shhTa
 X9tMAWTWVoyZSbEJGNRRRS1OiEAJP95xwWYRjutbPmfHuNpGEDd24mLSat/MkSRSasSd
 NOUHaH9HlXuA6XAl530zIJVXUaGUcivIHxUNsHqaBQIejKoxD/v2vm6tjZZfRo5W31Xp
 bolcBPTVqvn/4zZ9ZMw6QVFcfzqc7g3k8psB9x5g8HtQCbqDbbuKvNwGOI+cmFM1pcpg
 vp5PI1zq+rAfM/H8TdESPbR6/RKmQpegyPaLrhwjM+K1ubZ5mk1JAI0h4+8AFOPJWCNn
 HW3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTaSgHPRFi8WZj+WXPJij9WzGVlDYI8WrcULHhusZB5ZVuVD82JTWanL5ffx3PIIiEe2atR6fx1w==@nongnu.org
X-Gm-Message-State: AOJu0Yz14YNld+0Bwp1hTj/SZUbZr4TCZA39zj6ih7zMRCgOwHxa18Pm
 MaA2pm7qeuxMDbuvgqaAxgtfZerk1dC0yyzJcNOBIwSA2RHGTtpIImnn2ESqTRLAGnDf37vrNF4
 +gGOPOwyqLKzIxmy2BdLWaMkwFf9fLz6pXLLsqNgDmLh26CXzXQ==
X-Gm-Gg: ASbGncuv/l2Hnekd4nzLYU11e1UdRDrMHGhF2JrPwRQEgT7saelNfcefJANOvIBySzm
 CJxmO+zSdQsx7KhkWxPjwQIP7wNyC3L4YoVzKk8d6kSgGIl++CLz6QPBHIAmvhRONFZtHREthuT
 cRsSD9Yf8nZCENXy3BeAM/+tkghkG9av3nd2lMYzKaHoP6CwUhmP706nWqzOTi9jAay4vsEYec7
 cfP+lx30kIxCIWtfan0xKqCPfheg/d95ralrld0UxupYTZIG/NZzw/QhI2US4AWcaG9H2J7Ul41
 Shcb5FlDNZXU
X-Received: by 2002:a05:600c:314b:b0:436:5fc9:30ba with SMTP id
 5b1f17b1804b1-436e26ebb6fmr208653725e9.29.1737056272760; 
 Thu, 16 Jan 2025 11:37:52 -0800 (PST)
X-Received: by 2002:a05:600c:314b:b0:436:5fc9:30ba with SMTP id
 5b1f17b1804b1-436e26ebb6fmr208653525e9.29.1737056272412; 
 Thu, 16 Jan 2025 11:37:52 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753bee8sm69951455e9.34.2025.01.16.11.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 11:37:51 -0800 (PST)
Message-ID: <2c28e187-6180-48a8-94dd-b03b40fef69c@redhat.com>
Date: Thu, 16 Jan 2025 20:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 04/13] hw/arm/virt: Remove deprecated virt-2.7
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250116145944.38028-5-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aK-uSTYeUYBg1STmgBEKQEw7fmtJJRNqt5DCtTrtk_o_1737056273
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.797,
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
X-TUID: YWHHyjRyN8xj

On 16/01/2025 15.59, Philippe Mathieu-Daudé wrote:
> This machine has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") it can now be removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c | 13 -------------
>   1 file changed, 13 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

