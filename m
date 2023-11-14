Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1869683ejc;
        Mon, 13 Nov 2023 23:43:05 -0800 (PST)
X-Received: by 2002:a17:907:6d1f:b0:9a9:fa4a:5a4e with SMTP id sa31-20020a1709076d1f00b009a9fa4a5a4emr1839825ejc.13.1699947785187;
        Mon, 13 Nov 2023 23:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699947785; cv=none;
        d=google.com; s=arc-20160816;
        b=QjSzP0Oex/jjnlkO3Xk21gAy3JkVfuVh+N1hs7XZqo+WNVa3DCwGTFTJROR561ma4B
         WAmXzWxBQR970rGbncHfkttFK6F1NjR2tAOoDQmhmq2rkwLGE67jMK8N1u38nOe79UCg
         UWMsAW355FfI74nJsSQUgHZLRwZ7n2hZ51h7dZ8IZcSZErkp7jG0u5ynn06rn5JuDP/v
         1RjlP/DNLkdkQDnbhaLZnZ4n/VQXWXiDJtoJQ56oHDPOJM/Va10lc8hk+VS15jZKp2U+
         QwsD71+eVi0nf5zc86+0lDEMy8ZYDra/boUhFIcu64bsA5enBzdHJHz0/YSvm1nz3cxu
         3Xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iGJSh7ARTE57eUspw2fZ/Y9FEN8W9w9Q7cghnGFYjQE=;
        fh=7t585Q9cv9zcgdFjSKiIIS8hv9vjAc7p3EA0qsrETIM=;
        b=sZY2iSkgDg1OKD6AZt0sV+3LV0h+wJCS1jdCQm/gxVGuMQG3PEqVJVIE9+Fj+3J6hr
         JvKWq+nVBh97r3bKE3k5Km1c3eKSxePs5Hp6NQdoIpiOrCl/RHq9wHJiV4K7heAWn5PK
         tokccO6av1Yw03M/YkYKSnH+pufLfD9ZaikHclKVQZBMUMFoO3Cz6jTOW8RQW91vNBw8
         0r6P94mlhAyroi8zYAwyzmVdEJ3fPTHGbSVweAGI/QOZiOuf0nt3JSNEoieDe3ksyfJP
         ZksRnkDbYanp/uNS0qrIOdCsLjYrl1u9MRiBJPx8FermlgQ9Ge3dd2uixj+t1AjWiRRj
         S8JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cuo3i9X5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id et9-20020a056402378900b005479f26ccf0sor90995edb.5.2023.11.13.23.43.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 23:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cuo3i9X5;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699947785; x=1700552585; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGJSh7ARTE57eUspw2fZ/Y9FEN8W9w9Q7cghnGFYjQE=;
        b=Cuo3i9X5niar6SNb+fTqskYBv5u9hCUC0/h/jtdPlv/CnUIPCU6uZGMKX9g1kyBEJP
         MYa9+Dc1XxcJ8P1+wfvHq9kn15UAsNaiChRRMvnce/6rd7cnjRT+nX8eygpozUz7J2Hd
         rw0oWv/GwWyfSSiwn9xlE6gtx7noMdSdIicIYdsKg9cepae9tVIyxd9yMkNh1ccc64Wx
         GEPNCAQZdT5n7LDxVPO8AtlZGfj3rfuNeCCk5SP9n70x9xv4W2dtYqscjxHBL4Cd9DwG
         MVZuCLnbnemgJ3m8oQBNOcaatTOBUKVVEHUIkYBuSIkjQainEPBCxRnytO5gX3CO+mIj
         Z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699947785; x=1700552585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJSh7ARTE57eUspw2fZ/Y9FEN8W9w9Q7cghnGFYjQE=;
        b=pgTPT7ku/E+vVuWnPJGjwkZKAijhuJ5Zk4OYtjNXHYq0wZl2TQDIHi+PCV0mwoib0J
         x2d/XNRTGcRYRAtVGuo3I71XW0kjy/fX/avj+8nLq7OY47KWXdEALyKRAZfjvstP45LZ
         2t7MlRtEoJEUahYPGtLyUJgrBccAywyiL389pSspxQosQ3MEkReu56iD8ZfNoLRRCbH2
         WVfMMX9tkIi7FyAaQj7HG0EtAKxixKKpvA/N3MBxow6ecC40T1mEkx/bWjB9epMenPV4
         SW2SzCzog8BrQxAVtssoAUqiCKGes6MZzC8ssekKYbEJVXgiBEuJ8toNlHNr/HLiMPNQ
         yJ/w==
X-Gm-Message-State: AOJu0YziBU+ubs2AN7oZNM3QV99hjjrauju2yvJAeucJSiLP1alqtdWl
	ySbWVLmNE5NtnndrssuzzavuamED
X-Google-Smtp-Source: AGHT+IGc3/NG8UqFInjKsnJ47x00sT9L6VqttZpc9DaeBplNVfbIFLh/QxmAKcqUI5QOxgCuVcfEEA==
X-Received: by 2002:aa7:da07:0:b0:542:ff1b:6c7a with SMTP id r7-20020aa7da07000000b00542ff1b6c7amr1704591eds.9.1699947784705;
        Mon, 13 Nov 2023 23:43:04 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr. [176.184.25.155])
        by smtp.gmail.com with ESMTPSA id er22-20020a056402449600b0054130b1bc77sm4739041edb.51.2023.11.13.23.43.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 23:43:04 -0800 (PST)
Message-ID: <987f44c2-0fff-471f-b69a-fac0da5794df@linaro.org>
Date: Tue, 14 Nov 2023 08:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 08/10] system/physmem: Only include 'hw/xen/xen.h'
 when Xen is available
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-9-philmd@linaro.org>
 <1681041d88a9f9062170eb6599947e24424bf37f.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1681041d88a9f9062170eb6599947e24424bf37f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AYTCae0xuLWL

On 13/11/23 21:03, David Woodhouse wrote:
> On Mon, 2023-11-13 at 16:21 +0100, Philippe Mathieu-Daudé wrote:
>> "hw/xen/xen.h" contains declarations for Xen hardware. There is
>> no point including it when Xen is not available.
> 
> ... if even when Xen *is* available, AFAICT. Can you just remove the
> inclusion of hw/xen/xen.h entirely? I think that still builds, at least
> for x86.

Yep, also on aarch64, thanks!

>>   When Xen is not
>> available, we have enough with declarations of "sysemu/xen.h".
> 
> ... and system/xen-mapcache.h
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
