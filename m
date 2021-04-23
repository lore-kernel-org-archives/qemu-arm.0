Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1562869lfb;
        Fri, 23 Apr 2021 10:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkflfScCI6kwjDH+6NBqd/lF/OyE9oYGc9i8lfGdL8EduGg6buNOcOl2Dm60mKYuAa7ezq
X-Received: by 2002:a05:6e02:671:: with SMTP id l17mr3888430ilt.267.1619200174268;
        Fri, 23 Apr 2021 10:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619200174; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8dPDwpqa/+bnYLAtAkjQJDXqgUfdT2F7f+LZhFKW/5EE7Qx641lCt8Vtyi+9OzIrT
         JJfr8tdW7LQT5qlFpnOPKDZOwNpvyPV0aYj5RhtS+88FEloAFMuutGFwXm9C3F0rrzA/
         XL2yoNqXb7P55KaAxQMujtrgmDJBz6jeSF/qaDi3tzheA1f7Mg4rztBRSYYhbYHbQU3d
         RIaaibQfNPIYPOrhWamxNipiYEKt9KtsiRtcXatbLOhsiBBQxgldbrYsIufcN4D2csgx
         Wy3jDBWWK13tIHfAr+VJ4ikzJgNRgtUv2zT98Rlu4paS2C5ZXHORzEcdf/9UVQXrpdEK
         BXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vvJ3HCIrV21GInYL5XCzcMQccuE6GqW7StNTHuuAmpc=;
        b=iaqxfXLqZgqSid3dBy+Scp5Ok334603OD5YNMgcPljVfOpcmxydU6XYJUJfnRl8NlG
         BsAiKOb9p4GK+Mkceba5TbTmRz/DyhSq9zubc5EtLASgbYsKiwsBHRFPFugFL8Q1JWYP
         YC6ylYy/zD6r3k1EOP/nFzriiv+L7meNz/6VmSh4AGRbXEcwMIWLl9ECxKaLM6/PlY8Q
         NR+E/4ywujNjhuyw6r0tVlL60B/hOScuEB19msBbG8CJ6eQDBhlaQNOhZJviR9du1MZc
         E4v68Z5zeUK6oHgMsibiQH2K7caBctALTmQpIaLlaBDdNnTDbUtWpYVG5i56MBcnK3aO
         lyUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vQYy34UH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si7572870ilm.67.2021.04.23.10.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Apr 2021 10:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vQYy34UH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZzvp-0004kc-GP
	for alex.bennee@linaro.org; Fri, 23 Apr 2021 13:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzve-0004kV-FO
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:49:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZzvb-0002NL-1P
 for qemu-arm@nongnu.org; Fri, 23 Apr 2021 13:49:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id t22so25257612ply.1
 for <qemu-arm@nongnu.org>; Fri, 23 Apr 2021 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vvJ3HCIrV21GInYL5XCzcMQccuE6GqW7StNTHuuAmpc=;
 b=vQYy34UHElNd56KW5OoByE3cVG/j+ZueO5UvfO5hljzi1WlHB5Hy4089zHwkmuSlxT
 zTgAiAzGM8L2ftG6dkGYMMSwu3lcTStFvJrUdQcQWRiP7mZcmBJGDMZc1VnHziNPLmhN
 7XPjPynjdqLDweb3HG1kMlxiE3LMAwr57eACexHIwAbVkOabJ1pFCrDm0QfRkQZPofWZ
 1SNvtEQMUKKsskG8ZAqqLvYG8AKYdkE5jyZSEoUMquzuQNL1EmabuXmCTs6o1Gsr0rmO
 ktSr+JvwaR4zftyUPr7Fj1mpXSrkXTnp9c5d512/6CrP/7SjxKUmcu9vu2nwFLf+TdXt
 hcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vvJ3HCIrV21GInYL5XCzcMQccuE6GqW7StNTHuuAmpc=;
 b=NaPuWeeytBjLEjaf75eJk5GjgsE1qSVUZFN0ZKtmTb35mJcIKN60tqD/2cJim14Pb6
 Vv4yhpZnyKSav3oBxLzuGmE/jvk8CIjBjO/5aiuJCF8CK+aGteDEzF2sVpZ0fvxLARz9
 zYJ0UyabBWHQNMjQWvYznqWSVbkvRB2ZQxMpfRULisz0UJb71dP90o0ZbdSAaG99pWb7
 jKn8151VZR+rvofnueHXgzW1L0MgHXtFnjQJF/pWLrHwiebFCGRnDE5lZJO6DRPxObzh
 0ewoIjGb3Ikl3QLpbVtrG/xzGCx/Jpd9c1P/fRCy5WyU49tYng3I3pB97BsGht9dSe/+
 ePGw==
X-Gm-Message-State: AOAM531DHVht6mQjuF0foGqM/rp4UOA2VisDqJZr6iJK+TE2PpJmPAQo
 wFUZksZuSJSw+qSv5H7sRnLVEIxTjfzqrw==
X-Received: by 2002:a17:902:fe8c:b029:ec:a2ef:4e3f with SMTP id
 x12-20020a170902fe8cb02900eca2ef4e3fmr4776715plm.36.1619200157443; 
 Fri, 23 Apr 2021 10:49:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l21sm4897351pfc.114.2021.04.23.10.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 10:49:17 -0700 (PDT)
Subject: Re: [PATCH v5 2/4] target/arm: Make sure that commpage's tb->size != 0
To: Ilya Leoshkevich <iii@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>
References: <20210416154939.32404-1-iii@linux.ibm.com>
 <20210416154939.32404-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e8f40a9d-6404-e87b-856b-d15e460025ec@linaro.org>
Date: Fri, 23 Apr 2021 10:49:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416154939.32404-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E+eS3kvmH4e2

On 4/16/21 8:49 AM, Ilya Leoshkevich wrote:
> tb_gen_code() assumes that tb->size must never be zero, otherwise it
> may produce spurious exceptions. For ARM this may happen when creating
> a translation block for the commpage.
> 
> Fix by pretending that commpage translation blocks have at least one
> instruction.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   target/arm/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
