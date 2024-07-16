Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp178872njk;
        Tue, 16 Jul 2024 06:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0sMZ3Eq5d6Nldvg6oZ6y/l5pC9I5ERbBXC5o3IJJlBsMOp1zJfzyWwyjqWCDEVf8smtq8j5nCCACV9a4/hBY/Be8udUOM
X-Google-Smtp-Source: AGHT+IHmJIY5oKMI/P/hA52ieOk0iZrfNw40dBLMok9AfJShSoCbSNznLzE2OhcJuC7yPAn009J3
X-Received: by 2002:a05:622a:409:b0:447:ee02:220 with SMTP id d75a77b69052e-44f7ac36b2bmr33848211cf.30.1721136981858;
        Tue, 16 Jul 2024 06:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721136981; cv=none;
        d=google.com; s=arc-20160816;
        b=J3ZSBHPPMERdeqqLe1zOjA/pJ2wgTKDaAOvlTXA9OZwmZqYmhTEHMj7BxbNgHAALe8
         pwRzefPJAxwtWg10d0DaLQA3/vwMvwE6XZIh/ka/GQP//Oo+GCqbauufDKN2SU1VniSz
         kOZ3W616Go774iWfwBpcRk1TZKqhNBTzaX0XjPDZ+EHDQKIdmf6x5z3ZBKUMZIqgW8gf
         pbdcigaLUTyld0tz8/GMOEPeEi/9/t7KeHnJ5Nf2arST7IpIHBt42KFXYg0AzCMd0Yj+
         T+oLHnT+gvG5rMya728wkyeC8x89ne0kKURI9AjADnveL70i67cOhXBivI2XnZ8LTF/0
         8IwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0dAs6vX5R7gv6WXf30bGcHaQtI9bWGigmsRPGk5oOKU=;
        fh=yA1E6/8DFUB3os/pHNtDvCWuz82zXAr83rDQk+7sHvU=;
        b=KkCvTvlQpxxfE7YNC2HsE/cgTv7kHJBDi8Fk0OIjz5EmXEfufRmBvFQuLKt97mOVok
         AmA5ycm2yapRUl8Krptpxt7+8rI7pNxqx5i1Gd+nhyi4u6vwWTAV51741Q359vY01EgC
         oQ1WY2TOlq665UYHZXp4suvpFIN1PlI//7FOipmGL/5dWGHJbHERppzLdYKdIRo9M3rx
         xNagdlCUk1eAzvDvUZ0GMnqFNH06iP9QgWskehOClHkABLv/u8z3TCS/6mWhix+ivH8Y
         frgFLd6/6Gvse8+NSanFlYLaTa4HVbKdAZ6fwf0zt6oh26L+0TqhV+hxn+uWs2qgx8MU
         mVuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BrarXT15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b77f652si75354821cf.152.2024.07.16.06.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 06:36:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BrarXT15;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTiLm-0006a5-UM; Tue, 16 Jul 2024 09:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiLl-0006T0-O0
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 09:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiLj-0005XH-QT
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 09:36:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721136970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dAs6vX5R7gv6WXf30bGcHaQtI9bWGigmsRPGk5oOKU=;
 b=BrarXT15rzNx1TAkXeJUlfJgJfr9Z4UVO0fLI1Gnkp8V7gnCDt2JrlJ9jaa5E9/4tMtKVh
 R7uiOqRrHuN0vWVscqN4s/ej4IhyBCzHv/LF1tbpNZCr03xT2zO1uXp9vnljE+VfhY9ikJ
 6KiWUAqfwG4yV60d8HFL6G1T5BXKVyU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-L222ima8Oxi_6wj-hGCZtg-1; Tue, 16 Jul 2024 09:36:06 -0400
X-MC-Unique: L222ima8Oxi_6wj-hGCZtg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4266edc9c85so40245835e9.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 06:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721136966; x=1721741766;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0dAs6vX5R7gv6WXf30bGcHaQtI9bWGigmsRPGk5oOKU=;
 b=VT+RlPVWIrXMfKdySSQN2DSbxcjcl3wz2hnqaD6wLHm63hTw/tkh8b4Sj38ko1YNGV
 rEW2B/v/F46GmZXWzABT04IEFGm6Um9YiR66/pe39Lu7sMSDdMBjnIaULJEamc0FMewa
 3bI6bu9GRQtfEozD6xrBrN/VBji6xS2NvV7KjN1ISrXC8pEXZskm34urbkfn8DOlnz7k
 0GxW+cX4JBhkLsdNj/ugj5G/n8UfOYRXF5DjQlBYjYRz9tBEGQKnO3jH7UtDcgEcjygn
 CXfRx2IIUbSKbNNEbqHGt4Mz3gO7yMTnMTVQ0xwsBrKhvErJjqiuxwywr53YEzsFSqrF
 nDHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ0AqDyk5FsOHD38QoWwmYSU7PpE8YMD75wFfEfYJ+EUu03eorIX0IIQkMwXNP0TK3b/4NHSprCi0NeqWArVKZiV9p
X-Gm-Message-State: AOJu0YzpI02+xcmRcZEqFmUOra3i2dt1RUF53jzwpkxtvJpIJ0I0NC/G
 Jj0xPw/wWREVDAYiSwtThlL9T+p8V+h83XsOvASbZzpmVWlCnlz2FlPb20bAOzoO82J4G/hPR6e
 ZHlqO44c1iK+V+ko7rU4Z93yDZbD5355/6HUCeVjd6MiZnb47MA==
X-Received: by 2002:a05:600c:2218:b0:427:985b:178b with SMTP id
 5b1f17b1804b1-427ba690fc1mr14714775e9.16.1721136965798; 
 Tue, 16 Jul 2024 06:36:05 -0700 (PDT)
X-Received: by 2002:a05:600c:2218:b0:427:985b:178b with SMTP id
 5b1f17b1804b1-427ba690fc1mr14714525e9.16.1721136965410; 
 Tue, 16 Jul 2024 06:36:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:26c5:842:8baa:576b?
 ([2a01:e0a:9e2:9000:26c5:842:8baa:576b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dab3f13sm9156345f8f.4.2024.07.16.06.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 06:36:04 -0700 (PDT)
Message-ID: <3a0a7c2c-b46e-4b85-834c-232a8f9e4996@redhat.com>
Date: Tue, 16 Jul 2024 15:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] virtio-iommu: Free [host_]resv_ranges on
 unset_iommu_devices
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
References: <20240716094619.1713905-1-eric.auger@redhat.com>
 <20240716094619.1713905-4-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240716094619.1713905-4-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 9sKcK/1psaOX

On 7/16/24 11:45, Eric Auger wrote:
> We are currently missing the deallocation of the [host_]resv_regions
> in case of hot unplug. Also to make things more simple let's rule
> out the case where multiple HostIOMMUDevices would be aliased and
> attached to the same IOMMUDevice. This allows to remove the handling
> of conflicting Host reserved regions. Anyway this is not properly
> supported at guest kernel level. On hotunplug the reserved regions
> are reset to the ones set by virtio-iommu property.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

