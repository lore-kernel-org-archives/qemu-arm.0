Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp3992989njn;
        Thu, 16 Jan 2025 11:46:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUnZStDq0I6/OAP/RoC6EjIvNkqJd+NdJIgfN4VM3pW6od3E7Xwu8wf5dRZW8FiTv+KUUHXXdQcEqL3iA==@linaro.org
X-Google-Smtp-Source: AGHT+IFI4Rx2VZCKrA7Q1Za+zz1OTvriJooahI02sainphiF6D87guXaCQhSfj3QknVJ4dVRIkQQ
X-Received: by 2002:a05:6214:5b81:b0:6d8:8874:2126 with SMTP id 6a1803df08f44-6e1b21793a0mr1379996d6.11.1737056810186;
        Thu, 16 Jan 2025 11:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737056810; cv=none;
        d=google.com; s=arc-20240605;
        b=lFuWWZHFD1+tM5KRLvQXeKucHQsMePXdq/g/qgNJiSpoX+mLQqY/rrwDGqUkrObixc
         0Be6kmr5Bf6XavDU9RwMdH4kTb4zEqZ4MNkGxfoJiJVov7gwEh26zZauU7hJ2WgnGOOS
         9Z4HoOKwCn1scUImsPENixWv6kBzC+RO5MEsA/M+XYlBmVR5PrvlKqI/Gv1G/B1kQcur
         oORdGY2aPYqj23m/tKLLKGNuoD6nh0gtKGTVxMey7QDYAlGwysymleJ3Yn7W7dnanNcl
         Karks4QdmSP1x02RRDPOnsdXF/Dfcle3UI8mrsmpf2ASCdvN88rRd45v6LR7hLBId9ey
         W3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=BSN58nTM7k8NbIsefdBLNqOj/I4J+YbnYP85r1qFaMs=;
        fh=RGMCrQdthpWvrkhFNRNmUNzFrd6dyt40aF1xPQNQSzM=;
        b=YqlIwMKWrA5TU70N+2qKVpETEPTWo2XgBLjfZQpmgDeivZLLeq46HpnTiSZA68ANUR
         mXeEdM2WMJF65dOhHPlpmerd8CrCnytX0vBS5aUWbyhWZQE6ck/kzpcCAYBjJq1DSD8L
         u/Ey/bL/bTE3CqnxSrB528E58AAoBGJihTZ8IIUVFxqRefAFp6FF4KTwHhqYp/uBJRD5
         ni1TvmfI3ZzIiqkb46xl3UCYBOjd302quJC4vTBjvZfJjCvxaMGHOsIGktVNl6KWHrAf
         F0f9MpSiNN5FsFxZIlgtmQL6k74LaxXD7KaP5pwAJXVHsma6Ny4sUgS6xXpoyDhlz+kV
         NNxw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GU+xMNEK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be6146d14esi82630185a.58.2025.01.16.11.46.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2025 11:46:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GU+xMNEK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tYVpB-0004RB-Gi; Thu, 16 Jan 2025 14:46:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVoW-0004JU-O7
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:46:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tYVoV-00050o-6J
 for qemu-arm@nongnu.org; Thu, 16 Jan 2025 14:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737056758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=BSN58nTM7k8NbIsefdBLNqOj/I4J+YbnYP85r1qFaMs=;
 b=GU+xMNEKnnSdEHohx3lD+o/waw3nwhtzzqgDbvgLY84aB24BpbIWttIf4FZ4R9m7dpW0Wd
 NmzTJRpaoxw2bKkrW2l1qzNe0YLmNSfxLSC4y7wp2vfpF0pBYq02ZalnuBx6CiXbcvRIIB
 mZNV6PD1n4ggKrYV4QNjgyoUmNZnCgQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-ItAwAaaqMDunaoIKCNf2cw-1; Thu, 16 Jan 2025 14:45:52 -0500
X-MC-Unique: ItAwAaaqMDunaoIKCNf2cw-1
X-Mimecast-MFC-AGG-ID: ItAwAaaqMDunaoIKCNf2cw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-386321c8f4bso784173f8f.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2025 11:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737056751; x=1737661551;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BSN58nTM7k8NbIsefdBLNqOj/I4J+YbnYP85r1qFaMs=;
 b=V74x0lDkPIztdycwYbuCcaM/nXjbLCVyB1qAZRxd6WUAQLZofKjcOTz69q2p6sFagR
 JAHGxpPSi8leiGoCLumJlU9/v5sWz5dkW6Z0m5VPXlqqP6HP8o/W/v14XGs3ABH0MJos
 +4MD3ge1n5D5Q9frVkkw9+z6iZxrrDChPcznbXJubEzvLw+Uc3ivURUj0KAn6G8WtcH6
 t+Sq+iOvdCHVShCW2pyLCiVqaGSOeUzab3N3bnwwdXg9HMZioE2P7m9Vlfuegs3s21LN
 AzTLNUSw1rLi0nyCnFFoQVDLmCI+bQhvomHA52pJLBel4crBWj3Wu+wLwST58WcqwjRW
 c5zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZJ5Eesh2UQNxke0gl7o/VrkhJLnsXHZhbt2/RnkJMuvmUZfBmZkgW+yt2YTuTY9Pe4QQOQuPzBw==@nongnu.org
X-Gm-Message-State: AOJu0YwjnS33nXeV4SlpiDwUFJJa3Y//thD8qvr6+UeQcBJbjSVj0NP2
 EcqO6zEiSF+WbHT/bLUdL/q7tMrSrCdV/hNC9yfGs8kikMq+PbKWtnP4yyXzCxzo0uD7sw6St8p
 pWB9mrrKrfXJabNq8OqrJAj5llz5nQjGzXUFSmanxybYSBFql8A==
X-Gm-Gg: ASbGncseU4/pRxYDOh1yeRCmqGwmkWd/Xu8S+PypzQW7kA77AMOnrDkWCYzy1KtAYFg
 qO1SMW8O+/afnii5qC2yPu/fJEHFSbcJ48e1Rsd9qMkm2/HUuVRnjEuoiixF1Jln+z6ecCSfa7i
 BBBXIuY7SDW5R4yLl+2a+W1RDYjg1jdEeCagSIsoOSPWTR8oP3kzxxm4e5eJygpikjyv46+QF3d
 VidXGDkV3nI7Ds3VbEiwQl9ye/bZywpMwNkKLOfjaJOeIa/H2fWx+uBmziQ+faWbDT8wMj5Y6DA
 PsXbVBXhqSto
X-Received: by 2002:adf:c08c:0:b0:38a:88ac:f115 with SMTP id
 ffacd0b85a97d-38a88acf14fmr23737817f8f.34.1737056750989; 
 Thu, 16 Jan 2025 11:45:50 -0800 (PST)
X-Received: by 2002:adf:c08c:0:b0:38a:88ac:f115 with SMTP id
 ffacd0b85a97d-38a88acf14fmr23737804f8f.34.1737056750666; 
 Thu, 16 Jan 2025 11:45:50 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-119.web.vodafone.de.
 [109.42.51.119]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43890462195sm8677475e9.30.2025.01.16.11.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jan 2025 11:45:50 -0800 (PST)
Message-ID: <84066ff4-a76a-4104-b7fc-5f2e37658f05@redhat.com>
Date: Thu, 16 Jan 2025 20:45:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v2 12/13] hw/arm/virt: Remove deprecated
 virt-2.12 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250116145944.38028-1-philmd@linaro.org>
 <20250116145944.38028-13-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250116145944.38028-13-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aWMpvc6CDL16zMF78WeyLpsw6w53qEmrVT5uUnCfMxI_1737056751
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
X-TUID: 822zvDWoRoT9

On 16/01/2025 15.59, Philippe Mathieu-Daudé wrote:
> This machine has been supported for a period of more than 6 years.
> According to our versioned machine support policy (see commit
> ce80c4fa6ff "docs: document special exception for machine type
> deprecation & removal") it can now be removed.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c | 11 -----------
>   1 file changed, 11 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

