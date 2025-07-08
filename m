Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B773AC83F0F
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFHJ-0002SX-9U; Tue, 08 Jul 2025 16:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZE8D-0001G0-92
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:37:36 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uZE8B-000558-L2
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:37:33 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4a5851764e1so105970601cf.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752003450; x=1752608250; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JimOaRh7w1crCNK8S0djdsSqbjYIJJWl3DwQcYXioSA=;
 b=E9tfjWR54aBwsQJD+KFlVIiLgvflaCInX48FdIIdfuE21oe+tPLxEB88iqnaQruj03
 cx7D5xjTGoe7l17VVl1GfrZGAoepMDGox5Udc/mXu4YFTSX2GNRdUF6glS/kZIoMANy2
 3qjPYWQV9hMjH31jOuUT0Ydt/jFVa/L8LcnvBpg/cs9Pnv1GbhngJTn7tpB37YtxRRbC
 DBWyveAHRkquKE1enyubcIEteZwK62NU4Qs8lNzald3qApcUmYFty4XrzW/ODNxCIKfH
 IiTkTmziN/CGdO9HgChde++EXxyMrF/Vi+oJOj/brl02km9CtXU5cez3yJ5pTZGeEtFa
 +wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752003450; x=1752608250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JimOaRh7w1crCNK8S0djdsSqbjYIJJWl3DwQcYXioSA=;
 b=BnJ207TCiArnDXAHzv7q3E/39fKw05pTYqC1Ss8n2OGn2BNkB+E959Mm+pKC2f9Oc8
 u1Ql6ZMACZ4p1mlNrU2F+SWteVarAQaTs/BVAedsQYprR0GM/4kkyeLHm1R+L54nM7FC
 dDLMhQ4aoePmf2S8UKxTrq9hAL/YJIQRXowsdBATCeraS5VeLpwVaOSF5elhn9zJJYt7
 M7XIMkPbiHnQfpOmX+DBEyeg/l0WoujYQ+L9xEG3i5N0fIE2eO+MuLCCIYffDNPhTDJS
 GP46Gg1l7yoiA9jZQqbS+d28dDcSfRxtW6uv65SYB0Oiz5IBNPU4SLUmG72iPkxDCGyO
 Syfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwN1i/lRoh+Og8gRbnsGfT0fjXoRspxREKV+5K19AK4XxLUZrb2u6aBlqw0FxkXHqRl6Uvr1OWSQ==@nongnu.org
X-Gm-Message-State: AOJu0YykccpfUtgmiMzxbdT1ibbWH6Py53gKLYa2/e7Mh6qu4EuZcaK8
 XM01R5h3IDUi6b9anSFlZwnaqn1/sUR8jz92EqILz69j9MTRB2DS3t9bsvP3sBIB4Xim0G2l8bS
 T/x4rGdA=
X-Gm-Gg: ASbGncuNIEze6wIosMdvutagME7hHBm02d5i+UNaVdYuOIuZ7OSDH+TMk3UyPo7mOFx
 yIxBS0Le6FvMBdvW7mGkddh8bKve0Z48MuHaidYuzzatu/j8f9jkf5opq+V7jrVUoaT4uPRcd+u
 eLScsziZNrdmm9Xq6Fz9DhI1Vp6BKPXV0ssno1E9vrl2yIPD0Kc7zctA7LDC1aUD4IeAjyHi4lJ
 8jHpy/rCjvopkEnCGFQdU/8G8j32IzUutkybobRgte6H7nuONXDjhQRw24LGCU3f7VevSI8KIy9
 QA1i1ukrCp2kmnS/OQ5sNOZWLwP8qSqTBzQzB+9sR1aeaw6aG/+WWKMg0HuM3gXEMRgYotC7Jz0
 7+C+7a6rhH70J+6LztVLLSyWyKoEOLomH9scpAll1zmexn59esUo=
X-Google-Smtp-Source: AGHT+IHEJP3chP/POsRiyKFxdUz6AF25XSh6D5xzjfmBJquIIary/g2P1/FFAYG+bT4Oi0RyduYPdg==
X-Received: by 2002:a05:6808:80b1:b0:40a:72b7:d545 with SMTP id
 5614622812f47-41110f0c3ebmr3580385b6e.38.1751996410484; 
 Tue, 08 Jul 2025 10:40:10 -0700 (PDT)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40d02a43d64sm1742229b6e.15.2025.07.08.10.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 10:40:10 -0700 (PDT)
Message-ID: <d52695e3-0d52-48ff-8402-c9b9fd892cc7@linaro.org>
Date: Tue, 8 Jul 2025 11:39:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.1 v7 5/8] qemu: Convert target_words_bigendian() to
 TargetInfo API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20250708171949.62500-1-philmd@linaro.org>
 <20250708171949.62500-6-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250708171949.62500-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/8/25 11:19, Philippe Mathieu-Daudé wrote:
> -/**
> - * target_big_endian:
> - * Returns true if the (default) endianness of the target is big endian,
> - * false otherwise. Common code should normally never need to know about the
> - * endianness of the target, so please do *not* use this function unless you
> - * know very well what you are doing!
> - */
...
> +/**
> + * target_big_endian:
> + *
> + * Returns: %true if the (default) endianness of the target is big endian,
> + *          %false otherwise.
> + */
> +bool target_big_endian(void);

Perhaps retain the warning about not using this unless necessary.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

