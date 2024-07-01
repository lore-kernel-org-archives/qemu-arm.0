Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1343075njm;
        Mon, 1 Jul 2024 05:55:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuMdsAKfqtuj0uK673dZBt1+OAGoZs7EkwE9/H9ghht7ZfBy11fglwwvIxg3rmiTJAXX3D7UH9lVsabat0h6E1P1Jr4WAY
X-Google-Smtp-Source: AGHT+IGisbz1hjSWpl97HXH0YwRjBxUinEgya/XqqhY6tiznIeWchVG+no/YGqeQcaj6UYdPJXg1
X-Received: by 2002:a05:6830:1102:b0:701:ffd5:9186 with SMTP id 46e09a7af769-702076df1camr7616824a34.18.1719838544899;
        Mon, 01 Jul 2024 05:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719838544; cv=none;
        d=google.com; s=arc-20160816;
        b=EfPaGRk8qs59KmkwvHBr5Qp1wEC/U0KrAxdD/yfluYUWJuKC5nWt4UvxEOIieUXpAG
         /g6HNTIdCEYNDt9+jmVHXxmeiHH/fPCMNllJW48cPQrPD7hwdXhxJiQE8mDfSo0GFWmy
         oV7boreoA0c0QQ2iwfRz5lLvEuKweoUBj1GOmz0aH0r0VDfgT2pT5GTB1PvZH1dUtMxp
         ADRYyrhnCmolmeXJbNeEKUwNL2D53+pze6Hy+OX/CN954jEM5oq1cIweJH+vJuEbHwEz
         L/RotzSBVatqDu4gFWCq49X4viySglXKAjXWkAfrBE80lxZhjylx4i/U/+O9W3dBYqt1
         kSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xAZY3KwQVvcIInlMOR/b8oGpaTozUJdYUcKYuEK8xMw=;
        fh=koAGEAmBx2WaV0/1mygP4TFFchp8sh7m7LW0MjhVh/o=;
        b=vfK9P6DVDqwijt0e0vjFL0nZil5OHYKW2wTyuk28NXSar3HQw2lHqwljg3Rvg+P38x
         Kghm+SXbv2yjGgAl8inLuhKSozp+/BXZ9iG/gfQYDfIEcEjSp+E9xbmvw/g616XNFz+X
         fyYuFB/AujFzezH3x7jFvZqfTKrjaYtDOL7U7K6vK+mXnt/OxtERZ/xXLhyEPJgImBfs
         F3XJIoxgnAM2qb/wtJosDl8k5yKyzpvtcldZdEkvTL7SOIOU61SfWtt3v3JuhMANLJPw
         ZGk0W4+4aRrx3odwe7MDXs7xZNBBslfRd7xvp6YQO7BJZB6Bmp8bGtNndK8gOFAnkBjU
         1fiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eV/6nCsA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6934cb22si778051785a.736.2024.07.01.05.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 05:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eV/6nCsA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sOGZD-00087C-7d; Mon, 01 Jul 2024 08:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOGZA-0007vw-Gd
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 08:55:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOGZ5-0005e6-JQ
 for qemu-devel@nongnu.org; Mon, 01 Jul 2024 08:55:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4257a390a4eso12510915e9.0
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2024 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719838525; x=1720443325; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xAZY3KwQVvcIInlMOR/b8oGpaTozUJdYUcKYuEK8xMw=;
 b=eV/6nCsAhv6ocCmAPTzF8MSsvT+or+QywaKcseG7Y6fwH1+RGSo2AF8ApM2+heeXnA
 7e+Z32uiDTs08+hgcOf0valUuJWRiruvJB06+W8RTaRkJxokG27siijvKLsbMoJpqKyP
 XY/6cu3MuxH6dbEDOd2alU+lxVVSk+75WrUgiONAo3NX8ujyCMaQ3DJYSgxQgxmvadxa
 UiT3eCUlciCsa0M2DqLnedhtMvvpjGlQyVqLvmncZwynVh7qA7rDr8GKJ/4SC/kMtgW9
 4k4Unbvu95sX+i7/I1a17rbyjX1lEFvOh3ggX+yKnORsI7+6omqF3lwkaF6xqI5+zN31
 Y2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719838525; x=1720443325;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xAZY3KwQVvcIInlMOR/b8oGpaTozUJdYUcKYuEK8xMw=;
 b=JnSinxxsMHg0VcESNzF3bUKQP+gu3lhuqsdN35rlbMJYuJmJfX2Xbmh/h7D9GgPEZo
 HwfxVnjYxVLx65h1TZHH7Cd7eQRUboqy2SaOcLZLbzCapmFLuA09XvwBoHj93TlVaiZp
 s/pYlX2Lg7wP3xR3hjMsdoD9GcfBDhMow4TqFQY19UY3WEJ0uOqO6K5PkgR3KzlBbjtG
 2rpJpplZqk/8i+tQ4a4mme0/6VVcr3AJuDUtSsW7I+44cr1oiYZOw1Fb1R0+J7eaB0+w
 GPQD3Vvx4TsmAyA+WPWCvI9ssqgGsM5CNz6LscTEwoCW1CTpq9YusTSBxgN95S8URR5Y
 oqnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIIFOdYTxHJvvp0SYzYy1/+y2NWICS7qTdugSZdesDWflrTd1x95D7muFCJUGwtLnaQXChed2pdIanvmTZuZmqyAAWSjY=
X-Gm-Message-State: AOJu0Yx5smZPvwPZKXsKLKMiPd2KfQCeSscF3KdDdYFJvBZ6SMHap4Zk
 3CPUx2FsYP+JoAvu2LhJP3kMBfypGkszXuALnwVdV5PtrEKPlo4jGs3CLhRKcXE=
X-Received: by 2002:a05:600c:3b09:b0:424:a721:1d0f with SMTP id
 5b1f17b1804b1-4257a020eeemr36572665e9.29.1719838524673; 
 Mon, 01 Jul 2024 05:55:24 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4257dee5f2asm63843755e9.22.2024.07.01.05.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 05:55:24 -0700 (PDT)
Message-ID: <ddb08424-4211-4202-aa73-ef5fc7c11404@linaro.org>
Date: Mon, 1 Jul 2024 14:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/14] hw/arm: convert 'virt' machine definitions to
 use new macros
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org
References: <20240620165742.1711389-1-berrange@redhat.com>
 <20240620165742.1711389-3-berrange@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620165742.1711389-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qelKu+fT2y8l

On 20/6/24 18:57, Daniel P. Berrangé wrote:
> This changes the DEFINE_VIRT_MACHINE macro to use the common
> helpers for constructing versioned symbol names and strings,
> bringing greater consistency across targets.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   hw/arm/virt.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

