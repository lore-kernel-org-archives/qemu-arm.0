Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1312692njk;
        Fri, 29 Nov 2024 22:34:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXgsboh0h7iGawxV5BgxmS/ITYs9um/Pk/2vsclv7VaPXMSeQUwF7xX6Vtl+f9VY2s0a8FE/95ynuSsLw==@linaro.org
X-Google-Smtp-Source: AGHT+IGqg+4cNACkv2/S0Lvi5yoN06xpESKMWEzEUIyQT6beLKMabiN1sVgBcCi98FjQEcPXRB8Q
X-Received: by 2002:a05:6214:1248:b0:6d4:10b0:c249 with SMTP id 6a1803df08f44-6d864d3ec0cmr220653286d6.22.1732948443613;
        Fri, 29 Nov 2024 22:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732948443; cv=none;
        d=google.com; s=arc-20240605;
        b=TZ6fKU5iZUJvU/Q/idJUBrkeD9vmpYwbnsQ3hVwmuMiqY5a66S1ni9YySqwsIjfOD9
         uVtG/tK+HiwgpWdLrQo/FZNnZQTfb6g6UsJIn3KKR5ibRQ0O3blsdkhh06O7uxfA2q4d
         X1Faj4HQNAfwCdALfwkUvtkBjD6n+mm8JRWb8kPxJr88wPavKeZelR/jTTn1ZTb2CwDQ
         tIXVvPoYlFsKeF/1sg7ALjqSFwtN/AayfJlsj1DqMZZRWRJUikK7rbzLdvL0Jhc1DrQE
         Epw8rHTb3UpV2YkBt/YS+b4LvKpHgW7BNixnq9GWvosNp8vitfYK47Kew+t3Qr+sPH71
         J4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pM8dkH9Xm9NMSKkBjI7FXIWEGQ74p/jYqNbXEgV8iyA=;
        fh=dXVDXz3Bc+7aOu0rLqoOQTY34pgeQfiNG6tyP+kwb9U=;
        b=RK8HcTDmI0au75SsmUN4QRQZ9OFGLEkej+d3fF4eCKG1V+eNDxylkOamAnl/SeNqHq
         8zVSA3SU0UJOI2OOgUtrmiH2h1WM3ww9tHXz6pTTDAoTaz5xpSSoyYMtsh5V7BgrMnNm
         zRU2z79YcKIXlIniYMSA+U8kMpAjezeVFMMhuIzh3TVcYvSadZN3WOhbUAteiGXVbZUw
         hKp11idBJ2a1EtkyLqzoXsCQrFGuIg1rdDFCQUtAQb9ygkeXTppIRYPA+Je4aVrYXYoh
         BmBhaqowrUp3ufXjZFqzUhi1CvrdQ6Pz3k+Cpv+mytwUl8PifkxkSHX4oFGQqhfQ5eke
         aC8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=21EkloIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849fad8fsi609939285a.706.2024.11.29.22.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=21EkloIh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHH2w-0005uk-5D; Sat, 30 Nov 2024 01:33:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHH2u-0005u1-Je
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:33:36 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHH2s-0008Od-OA
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:33:36 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-21145812538so19998615ad.0
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732948413; x=1733553213;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pM8dkH9Xm9NMSKkBjI7FXIWEGQ74p/jYqNbXEgV8iyA=;
 b=21EkloIh1a9CV2bfPQs4hU0o8DLSAYjSAZr/LUeQCqpu/WQpGANO5UW4rOvjdDgf9V
 Ix1ii6PyCt2ViMeXW92rmm1+5cbUspKPaDJD1sZygGh2qCudqHM5WTsDRu0T2Ih5gJPg
 ovT3rMvwn75fzuiFjom/l/zRpDyBigs0078pIJBBHL3pN0Way0lgZ+LJwCpPo3C1qoGj
 fnbHXrOplAhVKpLHouBFvwsAJ9srCazspE9mQ4kb8AYZMK5fspK0lQdvdkduaePQ5Tf3
 0YE2d9trIT237ETk8e7YxmFeglr1GFOUVdn4wS11hEHxhJ2w6hVsuOj3alzkFm2DLtPN
 qPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732948413; x=1733553213;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pM8dkH9Xm9NMSKkBjI7FXIWEGQ74p/jYqNbXEgV8iyA=;
 b=IvQO4e+nsfJw3yRiUW3g1BA44UyUwqqKmOXoKCgin/3SXN+D2zOI9ZwZjeO9u15nnv
 I6jO0cmVYAmTAxkGTn1Vv70gqWaeIu1Oki1EnDqrKLJokpvnRqn7rl4nYSYK9RUki+pz
 LLxRLbeOKPVUja3co5N9y9D54RGe3IfNbTTKdwt2J8aCy73SYmTAsMuknKIp8/96S3pR
 JXxwX/CoLP36QpZXZukejrKoGNWwNb7AVzS11vFLQ3FzPGb7NcgKg9n4EXHFFUZi6oTo
 +F8wUGX5k83ka0ybgLoBEuJjPJL8d2hK2jlR5+TGdvx5eex8DXOphB7gvukDGnrBCMpL
 n6gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRj8USYmYt7JbfSW4+J0xFcPJnavIy8wc6zW5kcIHUqDWH3hzvw57MEWKqN9Y2XBSq6IwUtFrliw==@nongnu.org
X-Gm-Message-State: AOJu0YxL9zKpBX2pEFVH6YG9GvyEaHSlD+yeAFi7Zh+wsv4MYgymlnft
 D0YbG3S9AnVbpVIuFgHGm/KA7OOoA7+6ieHS4eesya1P+miTnhjokD4ZS5FqvG4=
X-Gm-Gg: ASbGncuxJH4tpmDPllbq8dBGXraNx8VnSAIvJvhoP97A9eeVxNoShwWj8yjhLWtC+3g
 f2/5oWhPn+8GW/BsYMArD+7fj8lJtyDoZ3qxgp0UY3H72u/YKaIMaKzHiCz9P8Za7KWimTwElAU
 UTElFl9RJyyn5qLTcmVPbiMAHO36Qvj1trkt6RcZrqtpbK6AhaAgVnjAKq26Yx2+v/RNUFfNB8O
 yrmyVHDS5tlcPHeAgiOjHV93HIsxBuIT7esVkrjwPvf8+Tg3Wyjwq5bPJoqFng=
X-Received: by 2002:a17:902:e811:b0:211:f81f:8949 with SMTP id
 d9443c01a7336-21500fdd6aemr194269255ad.0.1732948413121; 
 Fri, 29 Nov 2024 22:33:33 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2152f06a4f5sm34566795ad.86.2024.11.29.22.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:33:32 -0800 (PST)
Message-ID: <aa724c83-df51-48a4-a697-586b90ed3f0e@daynix.com>
Date: Sat, 30 Nov 2024 15:33:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 15/15] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-16-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-16-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: uq0Ne2leV5Ds

On 2024/11/30 0:25, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Apple defines a new "vmapple" machine type as part of its proprietary
> macOS Virtualization.Framework vmm. This machine type is similar to the
> virt one, but with subtle differences in base devices, a few special
> vmapple device additions and a vastly different boot chain.
> 
> This patch reimplements this machine type in QEMU. To use it, you
> have to have a readily installed version of macOS for VMApple,
> run on macOS with -accel hvf, pass the Virtualization.Framework
> boot rom (AVPBooter) in via -bios, pass the aux and root volume as pflash
> and pass aux and root volume as virtio drives. In addition, you also
> need to find the machine UUID and pass that as -M vmapple,uuid= parameter:
> 
> $ qemu-system-aarch64 -accel hvf -M vmapple,uuid=0x1234 -m 4G \
>      -bios /System/Library/Frameworks/Virtualization.framework/Versions/A/Resources/AVPBooter.vmapple2.bin
>      -drive file=aux,if=pflash,format=raw \
>      -drive file=root,if=pflash,format=raw \
>      -drive file=aux,if=none,id=aux,format=raw \
>      -device vmapple-virtio-aux,drive=aux \
>      -drive file=root,if=none,id=root,format=raw \
>      -device vmapple-virtio-root,drive=root
> 
> With all these in place, you should be able to see macOS booting
> successfully.
> 
> Known issues:
>   - Keyboard and mouse/tablet input is laggy. The reason for this is
>     either that macOS's XHCI driver is broken when the device/platform
>     does not support MSI/MSI-X, or there's some unfortunate interplay
>     with Qemu's XHCI implementation in this scenario.
>   - Currently only macOS 12 guests are supported. The boot process for
>     13+ will need further investigation and adjustment.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-authored-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Finally I confirmed macOS 12 boots on M2 MacBook Air. Thank you for 
keeping working on this series!

Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
