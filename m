Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3989979njn;
        Thu, 16 Jan 2025 11:40:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQ73QRoImYwG9pAgg85d/tYvWPoBR24Vn0x3hGqG/yhpfCzxBBgzrQZouNk5zZngVIqSDlSpEpRgTGNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE06XTQ4cStH5SslhafUSGZCZBHX3cGcnAieMc0nB+gKtEXMI1/Z3sbfX7CLJv/E/rAnWm4
X-Received: by 2002:a05:620a:430b:b0:7b6:d736:55c1 with SMTP id af79cd13be357-7be6325bba0mr8915685a.48.1737056421741;
        Thu, 16 Jan 2025 11:40:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737056421; cv=none;
        d=google.com; s=arc-20240605;
        b=Vh/nwmd0sTE0kR0uyu6ntu/Z48RWRxdulWe8xXpjMJ0uIKqC5iMO4wLiRLJzReURzD
         zb6ujqAlmoJZLr+7HRwObxMK/bmo8EV3YY+3zIfLLfrrSpvW5lDVcktEdyfvUExmS2kx
         2l2Fq+9NPxz2GF59Fah6kh6uW6yIYCY5pdr3CGTTx6FptwdHguzaNQqBVwE1siANyK9l
         wwQ/06uQeWI9xybwN5tkKD0t4Jdtfa80EPFnIfdGWDj0AT4oj5lvSDoSslQWj7PX0WYn
         vAQt05qKP07hETnM6HCgFcR3upo9djEJEPAgSduGaOmFuPFIoUet0CxyT+bu+4JizQrr
         TaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Xw1AjjH9VrdPmVJk6lRke7VDXMszjBlAoCoepQ6/hDc=;
        fh=NI9yb9nS+HkPzaCn3RPS6YlKBCmG/tspgI+5Gl86tBE=;
        b=KjNufO8Xt3U65dpXVxuIlowLfeVw+q/xHS0iHFXL81ZwOu8MmlkNch3pC+8HG1ExXA
         3FXScUyuZpGpJ14EtGng26qR7YiM9a7dFe+oZizFVo5FJwLeN3d5ps0MST8plR8FSxCy
         ukJC8HqUwIIW90lJOHE4HZOKBMk/NgOFp+/IZRiHCZNV2kbMBDURNru8bcfH3Ma1Qn1E
         QM29a2jeAqrmXvgibZ53H8+soB8o1Ko9jA7RJLH2kzPKv2PoN3jS64Q56P9eIgVWPj43
         k9MCGxwC91ybu3qJ0IHybE0wPu7QWiRg95K0/HTHHS3QGrw697mUPV4j28LuTjuWE/jY
         kyjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBCKICcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614bff27si72650685a.260.2025.01.16.11.40.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 11:40:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBCKICcI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYVix-0001UZ-5Q; Thu, 16 Jan 2025 14:40:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVij-0001TT-RE
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:40:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVih-00044w-CN
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737056398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Xw1AjjH9VrdPmVJk6lRke7VDXMszjBlAoCoepQ6/hDc=;
 b=KBCKICcI/ybX3GwcGd6ZbWTsp1ty8guY7s5dDiVoEYGtCp1/BSQVhPx1ZCdwXRb+J/BaqN
 6vjxqHUM/SxCcEOwaPNy425PW9hbUXRmG4ycOaoEkM3eHNGKk35KovTnd1GV+PIKBfvJJl
 rf44E+SuTqcpXqRIGX8pDD+rppwNYbc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-sSd8qOsZP3OQfIy4TbKJ1Q-1; Thu, 16 Jan 2025 14:39:57 -0500
X-MC-Unique: sSd8qOsZP3OQfIy4TbKJ1Q-1
X-Mimecast-MFC-AGG-ID: sSd8qOsZP3OQfIy4TbKJ1Q
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361a8fc3bdso6272175e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 11:39:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056396; x=1737661196;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xw1AjjH9VrdPmVJk6lRke7VDXMszjBlAoCoepQ6/hDc=;
 b=cWClvD64vMwVAP/FQDH2x0eAxkx3yt5MNScb3I1LfZofTMPGdwJ8sd/dSGjUYtAgp7
 HaEv1sALvzzOYElWNwQ6n+92pe8FW2LBgD0TRUazJ42tNbeNKRdF+h7pvvWY43Sfw7+E
 GVSB9AQkTrckJiOwtZVAdpENJXwmLprSamn/KIqcGdykE6BM5wSVRStNQTXvRtsREvDg
 Cvby/eHYSVWqqb8dtuye1KPFLOW2Wgho+9Fj+8KGWwj0J+GTKx05ohqDRZbnxsJORyoz
 PPAy37vgIhB5QpPUZ2ZoqJyDrBfNd21yhmb7E9XHUF15bK4uIEYcPTFeUUf2VhhSeJ0D
 492g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVENvdc3L6QxOpKVwVNLnDq006giBb9IIjkJwd22RYbHPmGiFDBFdP6pDfHfBTRLlWz3qr2+e5Lag==@nongnu.org
X-Gm-Message-State: AOJu0YwKKzs5cLU/op4OrNx/t4IDXtp7KNuZ/QW2t952qUavncd9UA4n
 GWdVUxBrHMDUJzNTKb5MiYRTlkk8XRi+0k7F2qE5cRSccjPOPJPCV+d5SBgnlHPbGvh/tWy6ZDh
 UKN+KnGlhyUdO+C/Ak1ZMwhTepGmEemkQoNvk5nJMJw16dHkFTg==
X-Gm-Gg: ASbGncvztQFgjkiOTW0Kxux1KsMrgB++J+lHvUJ9xw+lWmTIbexAGRujBRW+LBQwx51
 IeyDHBqw+Lix8Cuuy11HaEW16/t31ZUVzip0/5RZwdmYqms1e+gH0tPG0sy1IiANChh3mjGJ1T9
 c2jRgLfjqWJBw0PnD7PbUkRMtdEmYV3OnxTt7KF+fhvUc197gGnrLqjve5ofUPUeNa+WDFIUUAO
 Kw++GVCYNpDsDIYzzf/llZs/kVe3qzzTrVZrBVE/3MXar+8451TRlmRrvL/kQeV7LBg7LJQkwI/
 8zT3G2tN+/OD
X-Received: by 2002:a05:6000:709:b0:386:4277:6cf1 with SMTP id
 ffacd0b85a97d-38a8733a278mr35218182f8f.39.1737056395866; 
 Thu, 16 Jan 2025 11:39:55 -0800 (PST)
X-Received: by 2002:a05:6000:709:b0:386:4277:6cf1 with SMTP id
 ffacd0b85a97d-38a8733a278mr35218177f8f.39.1737056395566; 
 Thu, 16 Jan 2025 11:39:55 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3275556sm625179f8f.72.2025.01.16.11.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 11:39:55 -0800 (PST)
Message-ID: <1312a9ea-5855-4900-91b0-39bed2971333@redhat.com>
Date: Thu, 16 Jan 2025 20:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 06/13] hw/arm/virt: Remove deprecated virt-2.8
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-7-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250116145944.38028-7-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sYhvuIK44roto3uahlksh0GUDqzdcXwGIpFPycmUsbA_1737056396
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.093,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: qmR0ZexlPkDc

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

