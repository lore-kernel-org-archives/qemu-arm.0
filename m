Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3126189njc;
        Wed, 26 Mar 2025 00:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxXx4H7aV442kbjAGOVhp79clSQv6yAuogNGTKdZJ5MOUNCgVnB2IByQdKU5Bh5X2ZNSTfP9c+92XSAg==@linaro.org
X-Google-Smtp-Source: AGHT+IHYkAOv2v+czp7mKKV59s66xdA44+m8vMLtt0eG3T7nKc7GQmj6UBZQIF0DMMvvtDwSjUVU
X-Received: by 2002:a05:622a:4c0d:b0:476:8ee8:d89f with SMTP id d75a77b69052e-4771dd608a1mr266422421cf.7.1742972953363;
        Wed, 26 Mar 2025 00:09:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742972953; cv=none;
        d=google.com; s=arc-20240605;
        b=Jxhn9wOrd5tPAHYBH28k/ZN/FqbEWpyreQlbsvJZWPE0Maam8VlLk/6Y2EWtj7XDSy
         uuDImx680jK9vxDGMhewjYI5Kz+gZjbm+NsrbpA/f3g8qgsD7EZYqKOqMDP/BLPeoPWp
         LjMC8tYLKFn/sBX7xvWhMqd9DaIIdvonc3D3MTtK2dXsS0rzwz0dX8wSe7qXUCmRzHVK
         cmAl0+2N/W5wxb4PKflzn7tVTE1FkWxZbWqBo9nmG+vdETaXvnaCscbnHAVUAZLD3P08
         Lty3xDU7yaNXqzVZLRUJFkxrsBzaVaZ4NSklJgoUw+HUuO87aONB77kvw2Bn8HqiI7DI
         W6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=E/8vCO0brBuHLw3qMhVw1FTmspYWxgm2noUVc30Aimc=;
        fh=sJuCdVJQDPkH2QLjEMkVU5KEVcwQxNsX2LY5y9N7DIA=;
        b=h3T8r/j5+0DYBFsAr0+zPElfM35BDI+RNuhkvbU3hSPI2QO/qy+EsSCYT6xsO8ECoY
         BkeBHaKMcViRj3IVlM7ZpQ0tAMTMAgPdteh2PSdPcqON8CQu/rSjVxPfAVDb4zdb9RO0
         4SNSn4bscWvYazfd6R1Ls+ZXffME9Q2vd+3SOCMDHJzRgziSKGiDiZF4PkGu5tGjboEu
         dV95LmcotXiEG8EiZ/C/PjYc/uNPYkBnYBG0VgxS0MUOg9+EFLaBwbBnBRX5ZBKAbPCQ
         kaa/qHMa3Fbx8EB7YtMuMYpEQ1/B/3Gi0NW68ub3V1TxI7g/pleSPHRAaGompQDOyZWV
         5vPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YTP+XlXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d52d004si117092391cf.367.2025.03.26.00.09.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 00:09:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YTP+XlXo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txKsv-0004Iv-Tt; Wed, 26 Mar 2025 03:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKsu-0004IO-U0
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1txKst-0000Ai-EO
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 03:09:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742972946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=E/8vCO0brBuHLw3qMhVw1FTmspYWxgm2noUVc30Aimc=;
 b=YTP+XlXotHMvmhgQCV4xl9ENf7Ld+QMKKQYNVC0QLd5u4DsQrJuFshkfkLNJFwGxSm3o/6
 5HjM8lUCf821VSbbg7PghkK4zwKFroSaSl3YKlZYqCxOJnFfRD3TZsuAH41B+/RNamn4+1
 kakdtPrgzM5ymZ7oJDfVHkAUR0y06AM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-hNjKgyE1MXSxYAEN11itPw-1; Wed, 26 Mar 2025 03:09:04 -0400
X-MC-Unique: hNjKgyE1MXSxYAEN11itPw-1
X-Mimecast-MFC-AGG-ID: hNjKgyE1MXSxYAEN11itPw_1742972943
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ac21697a8ebso575398466b.1
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 00:09:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742972943; x=1743577743;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/8vCO0brBuHLw3qMhVw1FTmspYWxgm2noUVc30Aimc=;
 b=DSTgFmX715S6Ss7TXb3SGEXHXRryR5KWpMwNCLgnfHBH+vupu/+CRTwA4KPi5ISolk
 +uLKPV9/Gu5+CnXhiF7lZi3k+7Lg6wOUob05Czv4nC9QQDE7f6+LLPYImkLofPKxFudW
 PeLiqvPoLJnFkCaZOWY8AnxoSot09mcKhzhW8lWaijYD3cJPxGtJbRikWptJJIXccVMk
 PyZG/4Xeaa1+8alag7+4XVhlpedzR/lVhHqf5hy8d4NAMDtN892labj2wpVdofxf/0kP
 4E0sdA+lMSkW6Kg+/NJ+oFG5tM+6DprjcovODcX2pMqXC2dsGQoFpSTEdAvDRa7NZ6Ww
 J8Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl8LTJ2orUMUVbvqNYL8sYvgr6xkiuPq6C9qGmQkmVfSI+oZVLsp7XjFni262edNZKxjuUJYG4mg==@nongnu.org
X-Gm-Message-State: AOJu0YxQABd4wSWwjy7Z13lCMolQDxThvQzD9SZaMmBsNW//t/76HN1Z
 HtfV/dDc8UIayH6I45jmiG67P6ms/7B7nnGBlcYHCr1CvM2TVuviHbXZPcZWlRdgv/AD/aSTWjr
 3J50/cik+3TNh7LwxkJh0AYs614yRYrTbKloWbROTb8q2l7z2mQ==
X-Gm-Gg: ASbGncuEN6H9Jl6tsWBfF4fcDDeNVWPFv926i08OAIotDncL6PVZPrgOP4a+LNz+mSK
 0Etb+RRjoME06mHkeW3HC7vxmGutmVxGoQSPFAFl+/Y9XmFhyeZOuMFHFrgzMD+YksHdGwrMxd6
 /XwAZudMueNt+QZf6zrutjGCWToL2zWElehVkL6yv9T1bL8t0S41zJB8FNVel2HEKlpDalalINz
 pfKhKrir68Pxiluexvjp1oqydv1d4+SR7rKAFeyZPIytpWlbQQXyMzVTH2xsf7qc5f4pYdSW0rX
 CFKPKSfHUMT94cqxFcr0HJfJPEdkJzGvZQ86JMTOwb4F8Q8=
X-Received: by 2002:a17:907:3fa9:b0:abf:c20d:501a with SMTP id
 a640c23a62f3a-ac3f20ef3c4mr2232361666b.16.1742972942783; 
 Wed, 26 Mar 2025 00:09:02 -0700 (PDT)
X-Received: by 2002:a17:907:3fa9:b0:abf:c20d:501a with SMTP id
 a640c23a62f3a-ac3f20ef3c4mr2232357166b.16.1742972942342; 
 Wed, 26 Mar 2025 00:09:02 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-43-49-206.web.vodafone.de.
 [109.43.49.206]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3efd47e9dsm963628366b.167.2025.03.26.00.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 00:09:01 -0700 (PDT)
Message-ID: <39320e6d-e523-418e-8475-6dedee8e115a@redhat.com>
Date: Wed, 26 Mar 2025 08:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 08/12] hw/misc/pll: Do not expose as
 user-creatable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Samuel Tardieu <sam@rfc1149.net>, qemu-block@nongnu.org,
 Patrick Leis <venture@google.com>, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, Hanna Reitz <hreitz@redhat.com>,
 Hao Wu <wuhaotsh@google.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250325224310.8785-1-philmd@linaro.org>
 <20250325224310.8785-9-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250325224310.8785-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aRG8TOAHasa2pHM8lcu7jbQKBnzFeA-WYt8EyUCGdHY_1742972943
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: G3kIY8Uxcx+d

On 25/03/2025 23.43, Philippe Mathieu-Daudé wrote:
> All these devices are part of SoC components and can not
> be created manually.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/misc/bcm2835_cprman.c | 8 ++++++++
>   hw/misc/npcm_clk.c       | 6 ++++++
>   hw/misc/stm32l4x5_rcc.c  | 4 ++++
>   3 files changed, 18 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

