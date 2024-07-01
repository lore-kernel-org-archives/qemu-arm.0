Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1426064njm;
        Mon, 1 Jul 2024 08:13:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVM1KE45JIqcsWGA5k2ZopLLDLuZOxFhYeSP4DaKbFU8NHoETyC2QeYkYkngix2FmoRdiuQc7R6qpp40lgwX0mRtM21H3Wx
X-Google-Smtp-Source: AGHT+IEk5SI1CmpuwiIm6z16WeiYBg7tksaFWPSijwlC7AbGMpnGByp3G6j3DKEdLEQ1i0n0fsYz
X-Received: by 2002:adf:fa51:0:b0:363:7816:7567 with SMTP id ffacd0b85a97d-367756a9da3mr4793191f8f.26.1719846807415;
        Mon, 01 Jul 2024 08:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719846807; cv=none;
        d=google.com; s=arc-20160816;
        b=LB3D8mz2BWgGqqJN6jfEGls3pOdIuoGnOKmMaa5ncy4X8paVHfjQYI52vwxNHuTDgm
         cgIGxuxGmN71QfPX2gSw3TnAPJtAvQNLiwgcwP5ziR68Afz08NX4E3Alp8pYnUgCwbEo
         gs/37OQRqvbR15DltInaOehKBdC9wzLSnhlJvibCuO0eOZJdHQ9vKdXd1fDtQpcssZx8
         g0J247hKbNsF7bHgebqXQgMu9hno7ROuW1mlyXEKuBwv1+qF4fLFvL5Rmxtb9mKmsb8+
         W0Dl9CvYq4/dpaOMzJ00jnhzVsggosafGsr3uCwNMV7LoQJu2rJuyCzekMPbqtPGItVD
         QzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N9FEHlPTNxswtINWYqFC+mMBpTrdhlMygvNvTt8YoNg=;
        fh=iVHYZVeyfwdeY1Vna13RB42F7ctYtXnuTXKsvm6rSrY=;
        b=Hs4RQ5WQWTbl3MsoQmO5SMVH2Xktm9mGXCys75PwLSuRtJlP0QkGqWTSiw0q7S3XxF
         GjIKQ8V3bIumXagPdiOngFNfS/6eiOXm2bgLMSt1XolQ+D1v89EM6MowAvG9ltEI5a9K
         JTOS/e2BB9xrGFQHPXlFKXCqXglYFAnO6BOvDLvV4K0jyZuW6upTlm12M7RK/5oY/bfj
         4SKpgQuSdsp2r1jwpKQUzQQsMjuXX7+PmEOV1sjPf2UYgEaYvq6c4T5TPylMXrdY9z2Q
         QJ1dsQq+jnFCia3EBeSeEfQvpsfCREoS/iNQrggj0+secB63MnurWtFlXf2PQddUXDxj
         wPzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KFjq/X2+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3675a10df17si4533854f8f.1046.2024.07.01.08.13.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 08:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KFjq/X2+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOIiU-0005ag-KZ; Mon, 01 Jul 2024 11:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOIiT-0005aV-U0
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 11:13:17 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sOIiS-0006G9-1v
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 11:13:17 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so12344615e9.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719846794; x=1720451594; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N9FEHlPTNxswtINWYqFC+mMBpTrdhlMygvNvTt8YoNg=;
 b=KFjq/X2+QeQnghncEUfLnAnDlCESXHBCf327mhskz+m2HQCTAYg88osWnQm0p6BRO5
 BoLatwNzmxu8vrWXuMhiq+tN80RBTwf07NjBpPgBCg6rvezDxKCYOY6uE5/JGVeQ8KPk
 AlPnSvXnOlKqWEHhKrTK/VkOmUj5fTs8IFghliAF4V9J60Xhxs2hQmO6T2g5s4FDr29n
 DvrTmmu7U/pr2phoZbNb0g3Rd/J05pgCXAAtGnS1ZNvLnoEXrOEOY/vb7dqg0KtVz+6o
 52pdPf7l82NpMtHNy5gvZs8omtUxfuJ0QsN9ZEOlkIynTlayL7dZrnFz66o7nQzxYPzl
 7Z+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719846794; x=1720451594;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N9FEHlPTNxswtINWYqFC+mMBpTrdhlMygvNvTt8YoNg=;
 b=QcKjUS5x56nRnV+Gz7yDsKObTO733Mq6Gt0lZctvwK2tkUf19TigaDUxtReycFWqzd
 O/iPXabB5DiiKPaR6ier8n7kbXLnqVjEezpkmVP8qIW4r2ZkoCS6mtvYfv5U3bKXTa8U
 OWqeTR7wk2ck06Yt/nRy+//fAr9J5psfR2QumL2Ah5bZ87ZlcaaNDm4SU/FAgSfQTy2Z
 Y8Dx2H7JNNsZwfl6X5eEO+/C26pxUJT1y1xwfTgdbnf3Dx2YI/OKTgrZCl5latHbryhx
 oHPkMiBfIB+V000I30GCJkEkJy0UgZ/5gX+hVollsR01wS30HvYc7+71JDOi/foLQ0aj
 1cfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxgckpPKxHn0HORK8tg2+hgyNSl+0CmTERmYF9ZtuFZ3Sc/ZocOVGZWnSgB27W4Yis65YkdKY0j4Km+znNSEZWadDj
X-Gm-Message-State: AOJu0YwJvQGRTyr0WmTXT3iE1tzr5hXoonESXnfMYk2fTl38iGSbqdU1
 toI3yVgRouyL3J60DxJI8JnfHf7EHR6bJ8oHhv/oUFwGKov7Ui4k6zC4FQfdiio=
X-Received: by 2002:a05:600c:47c7:b0:425:5f73:e2e1 with SMTP id
 5b1f17b1804b1-4257a00c088mr51672315e9.22.1719846794419; 
 Mon, 01 Jul 2024 08:13:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.177.159])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af37828sm161811305e9.9.2024.07.01.08.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 08:13:13 -0700 (PDT)
Message-ID: <609600ee-f77a-46b7-9692-f47eba3087fd@linaro.org>
Date: Mon, 1 Jul 2024 17:13:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/14] include/hw: add macros for deprecation & removal
 of versioned machines
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
 <20240620165742.1711389-9-berrange@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620165742.1711389-9-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: aRltZMpQwe1R

On 20/6/24 18:57, Daniel P. Berrangé wrote:
> Versioned machines live for a long time to provide back compat for
> incoming migration and restore of saved images. To guide users away from
> usage of old machines, however, we want to deprecate any older than 3
> years (equiv of 9 releases), and delete any older than 6 years (equiva
> of 18 releases).
> 
> To get a standardized deprecation message and avoid having to remember
> to manually add it after three years, this introduces two macros to be
> used by targets when defining versioned machines.
> 
> * MACHINE_VER_DEPRECATION(major, minor)
> 
>    Automates the task of setting the 'deprecation_reason' field on the
>    machine, if-and-only-if the major/minor version is older than 3 years.
> 
> * MACHINE_VER_DELETION(major, minor)
> 
>    Simulates the deletion of by skipping registration of the QOM type
>    for a versioned machine, if-and-only-if the major/minor version is
>    older than 6 years.
> 
> By using these two macros there is no longer any manual work required
> per-release to deprecate old machines. By preventing the use of machines
> that have reached their deletion date, it is also not necessary to
> manually delete machines per-release. Deletion can be batched up once a
> year or whenever makes most sense.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   include/hw/boards.h | 96 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 96 insertions(+)

Nice again.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

