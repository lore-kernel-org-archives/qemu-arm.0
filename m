Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2536820njb;
        Mon, 3 Mar 2025 03:12:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEKc6R/GUEeVTd47W5sFmpY3Chv/UmKoClgaUpMQBtnuVnrDvKi+NuDBKpxh5Ds0/9i4Q8XqXQToRGOw==@linaro.org
X-Google-Smtp-Source: AGHT+IEW0nklwqDrRLLvOu8JeDGRTBvlTR/HKud8vD8sUbtZU4019UdHYBWAgyqT10pTOI8PCgkl
X-Received: by 2002:a05:6000:1868:b0:390:e904:63ee with SMTP id ffacd0b85a97d-390e9046879mr12707008f8f.17.1741000332120;
        Mon, 03 Mar 2025 03:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741000332; cv=none;
        d=google.com; s=arc-20240605;
        b=jcvyldzRN9VuO6wIzLcYYZBWAkP+flh36qwy0yt0ky/CLOpjK3PiWJ1N0UU+myxcYc
         NRGmSaWVkRgLDdJShmtyF6mVqjFRS0r3LLrI9CbE87L1XDylyHVIB/oxRskbpy2kBytj
         uIcesdcQHL/sKadeHpR8BTE546CDBwuPR8j7hOcwnHIFrXTQiEH3OvBzT8GY5Z1DYdbZ
         9LMZsQEz8spi6AeXSV5KN9cxo467u8yNaecFd6Gf0m531zmBneQYO1OyuXH5ekdO3psH
         nOfxKt9VHn5MY7gn+SdNCgoLU/u9YhXagcwbaXNd/hMTDj5eSXiGXkhHLdVqURNtfcgw
         vWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TXePp6d66/7K7zoMgGcEq1LiVC+8JxroBjUksCe1hiA=;
        fh=uVqRj+p72X3LmfQNpwTlF7/0vvJgVyAkVgf4fwhDDQ0=;
        b=IMF8Gow4kNMvSCf0ofRdNrIFJ9zTl798jdBtHoQESAcwOAIiLTELJnPWFpazxRg+M1
         yiprOwcuJ0/ifMnbxM9eMHLpvn+IRHvD7ZXsDx97BIwcpo/Ibl2anBpbeXnMw/oXzH0y
         zfnfX2WygXECcrDd1nyTi8EHVh3cVQxLu3hAMck1Sk2tTeIEv7G7srqmhptb6Yn2OOHj
         xYcRQKuUNmKCIlC4DwsgkDJ1OzCk1RiDGLQB5eZ58vgPS5q8jC/E2IP6RlOUrroQHUbV
         w7RBsQZNezxNKBgMP1LAutDTbuaN9NcMoSL2vFok0MF/6ZjAxf73IH+ggk9bjHJjAoOj
         CrRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cP94Z2RH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-390e483c4acsi6689314f8f.656.2025.03.03.03.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 03:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cP94Z2RH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp3iE-0003bS-D1; Mon, 03 Mar 2025 06:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp3iC-0003aK-DS
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 06:11:52 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tp3i9-00050N-OO
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 06:11:52 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4398e839cd4so32388095e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 03:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741000308; x=1741605108; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXePp6d66/7K7zoMgGcEq1LiVC+8JxroBjUksCe1hiA=;
 b=cP94Z2RHOq7d4N+wUjTC/ygnIezx8WzMca8hKNviXXtsuEblhL5Hb1BRMC+Be7jMAS
 qLQZHH1umSBtlw0VFOhNa5B/Hw5RTZHB9u8NGE7nDTt3xxqLrYEv07GLgmLnAusoiXv+
 LoJyds9PFL025LY1Ad3wbesd3ewjabkJ37Ykf1u8kiEuknA5DBTOgEC+GHERRpi5Hj4O
 KyWIfvanFp1PnxbLw2WEIB3UhBGVBdG+fZxZk8+Gd3bd7+Rzkiqlfds4dmEdh4zB7EFo
 l0SIoVQairvSKFd6vtUXxIGML3eIHawU9Ti0nUaToYe3JzttyHxUUDGTM13+D+5BlNJp
 KDeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741000308; x=1741605108;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TXePp6d66/7K7zoMgGcEq1LiVC+8JxroBjUksCe1hiA=;
 b=PkdvnfdqoQrSwTFx1M+CZMUorfR4G+CPnXMmOmogMrOQ5Uh594PpSKwF3ApbQMg7G1
 rnXw/blP0QJ+1ceSI3AUV0gz3bsUZQ6fHAdqFkRvT+UEbQjfg+tYA+RazQkFlzX3p4jH
 JDKwWbav3pXkiyS8NnmZ9iN2kifu3ycMAXnZURM+s5fa/3pByWq85g3u4br6CVNBiLZk
 Q3w2/6opqYbOM0Jydn0X1ENlXnFhk7XeKRKsLWNa7oTaxpMOSyZIQQEhj6Q68SRqUwBo
 XnY8zyEgIAbpIvZ1cp+T96udZpyre6HKtSuM6Jgaq7f7ZGP94Qyge2P7TbqZncgy7iDw
 tMag==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2d+J5L+nTPJI1BU6YD6/sY9PYJSAc35Fs4oLejgBtLI9LSCY28xGr5AE8aJqTns1cGhiIjQA7fQ==@nongnu.org
X-Gm-Message-State: AOJu0YyP/ZhDw90F7c48c6dJMg01qtJGHwRuSjJjyvqfmz4iFxkuJLKv
 fDwGVvmKNx6+JpTOqzgJsEpvWWBf3PPISYu5oLJ2ZjSJD9xv3+O2m4M3Ex0iHmQ=
X-Gm-Gg: ASbGncs3XRBs/oyhHlktMSJqqKxFUxx1mBY/i1YO5IhV6OrO5LlN5IcnmjmJ96CaI7U
 8amMk8jv6u1jxT7lNw700s38T1jv7x/cgKmgHlZpmO/oPCfS4s1fcylbTFhHywpNBBh5pK3zxM7
 YHLorgll/Fw04bhpNJB+KrooMKgfCucmVK1SdNy3TjtB00gET+tRVBGfUkFgbUiFkTMtHDWANtq
 IYBDFjn1S2Fl6ZKafRrJLWNe7M9KBpsmrTyjfRZFduNoPv6h4JXfrBA5jJcHmUsHKrSNnBsYpt5
 4hWREC1Zz7XT5WFfMV4l9Lb3Xm1ik9D0ydCvUlTTnrEeahAZXpCGP33ZmgVZFL+xcKVA0KiLWVD
 EdLi8OeCXhr78
X-Received: by 2002:a05:600c:548b:b0:439:9737:675b with SMTP id
 5b1f17b1804b1-43ba6256610mr102706775e9.7.1741000308067; 
 Mon, 03 Mar 2025 03:11:48 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bbf2ed24asm42494365e9.23.2025.03.03.03.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Mar 2025 03:11:47 -0800 (PST)
Message-ID: <6fca1ca3-5746-4ca4-b8f3-c96cfe93a9e9@linaro.org>
Date: Mon, 3 Mar 2025 12:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] xen: Build fixes and dust removal
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 Anthony PERARD <anthony@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>, Thomas Huth
 <thuth@redhat.com>, Jan Beulich <jbeulich@suse.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20250218162618.46167-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250218162618.46167-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5ZqljGw6Nb2h

On 18/2/25 17:26, Philippe Mathieu-Daudé wrote:

>    accel/Kconfig: Link XenPVH with GPEX PCIe bridge
>    hw/arm: Do not expose the virt machine on Xen-only binary
>    hw/arm/xen-pvh: Do not allow specifying any CPU type
>    hw/xen/xen-pvh: Reduce included headers
>    hw/xen/xen-hvm: Reduce included headers
>    hw/xen/xen-bus: Reduce included headers
>    hw/xen/xen-legacy-backend: Remove unused 'net/net.h' header
>    meson: Remove support for Xen on 32-bit ARM hosts

Queuing 1-2, 4-7 as I understand #8 needs rewording, thanks.
