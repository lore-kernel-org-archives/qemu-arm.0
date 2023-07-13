Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2689725dle;
        Thu, 13 Jul 2023 05:44:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF/P+uXLBubGR+S2Lb2w7rA3lZHhnLqyLrUaan1YHIM4K6xG2UNeb2+rO56EUE0ipv9rrBt
X-Received: by 2002:a05:620a:17a4:b0:767:1d7e:ec40 with SMTP id ay36-20020a05620a17a400b007671d7eec40mr1904726qkb.1.1689252299400;
        Thu, 13 Jul 2023 05:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689252299; cv=none;
        d=google.com; s=arc-20160816;
        b=r12YCvrAO28zM3nZ+nvGFiaGpqzJwtKD77NRROS/va51z//oaOzSM+cd3QmZTSNyYY
         34pZLCAJGMy6JgwrezbxY08cWTxk2GYQLyujd+on7JgJCRIXszVHcfZ/aNLV2d9EnEJ7
         xO//nBHKQ/JoOCMxnpvW6BNKqbUMFu8I3/VG2FiFrCjYUCvNzv90vgIT0Qe1k1MyQ8pZ
         DJTJdkeGX8KCSozz/8ya7QXk6+C+E5hc/5O1Wb6uRghw8f7E2N+xl/hX0pvXYvFpg3FH
         hjy+ShLKW+UUqroQHwLHzl4n0m857m6FaUHqeYQ5naE3sIg2oud+4iSHuyGWxscL/1Aa
         mhZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=j88jH9gnh+BoCMNRYsnGWu2hi6OKAvAf3yG1Gh9uI1Q=;
        fh=pXCnTezliS0GTUdQP7cTorVSE+tpq9gaaVmOV04wtEo=;
        b=OEKedCsc4rn8U+fK1iShsANf3JEKL6W/BceOy+GBEDWJo4Mk2SDdG+v9iL0D6vZYO0
         TycUlIGaSYAT1vY2rc8gjfLsNTc8YFO9EGNOumooJ82YARUXTu4GNTjrWKid3xq/bU+M
         l9Kp2qUjZofec/jlKeuSAVqKK27hd56yGsvcHAoTe9PQ/kR5AQRhIC1e1ilYX5uKgeuS
         gY6W56Dg/oqfZSOOTk90frPt68kvUUizjv5vfKACm1ogfJ8HxRWvB9VhpVi4iyxrlWzh
         L140gY95wg963hnJ0QqANU2DvObrqRgvGJCPe1OHQz9QkxEt4VX4zMxyDrrpGQomn+jc
         JI4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXG7MhmP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b00765a36443f9si3034286qkp.394.2023.07.13.05.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 05:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXG7MhmP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJvg9-0005vL-6E; Thu, 13 Jul 2023 08:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qJvg6-0005tO-6e
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 08:44:14 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qJvg3-0008UI-IA
 for qemu-devel@nongnu.org; Thu, 13 Jul 2023 08:44:13 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso1182008e87.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jul 2023 05:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689252249; x=1691844249;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=j88jH9gnh+BoCMNRYsnGWu2hi6OKAvAf3yG1Gh9uI1Q=;
 b=PXG7MhmPk3mqv7qN6ZPuwoRPldNNYTmwLU+sZRZYlnvWCe/ygsbJq88sY1unhn5VQy
 d0LmTtZ4DSvlKObCZwtGetyseBYmsOdxiIzAxrt/A+czjkOuJSfXxwvu6cT5jv3bEIEd
 HjN1siwgycJxLyY7BYfBo8A/RTlQZfgNdaw05s8Kb/qFHu2vmUPBpfYtrIgC9RIUH2++
 HAwqmWBwduJe6fLwGVnwtqsnsMZO5mKZFE2SPzAA+mRJxm/1JFwokKcU4LU+iezISYhH
 Y8eOr9moQGJ0rpC0dfcX7QrE0Lkw7vbbXf9do+B+1z+S65i6CaKEwfXJKTTZMRkrvjBh
 jZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689252249; x=1691844249;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j88jH9gnh+BoCMNRYsnGWu2hi6OKAvAf3yG1Gh9uI1Q=;
 b=VVnVjBlVjh6/BoCwZEz/bSBeR7jW2fMSwE2ziGtR2JItzg2eBLe3XYwk0OWfvSIsi9
 rWrlDNfbYBKnujc2X1Zc0mJzUKjjIui7AGc0zS9/d04mHLnb8RlnOadSda9Ztv8JII7I
 eFyOQtPWM7qkcjXLbQvl0PY29iSIRR6X5rCgKj0kxBHi+ApEY2x7FNXPJ7oOaAEzLBi1
 1+d7yWxLsq6XIFWe2s8EYILo5EL15Nm75HFC1nRDfLLptbMmDo5UAML4M2QBxlpah2ZK
 2jPVf4KbH6ROby4dpDkiJrLaq0vIEwFwhO2/poftePXl8gIce14gzme8nUOFH5O/HPVf
 NLPQ==
X-Gm-Message-State: ABy/qLYY5Ju+IPc61yfMR09MbxW5UbFG+KcrayqKl+EbZ0jAP/Djz5Ws
 6n3TKilRbmqzyQzEYzDRlHrzIw==
X-Received: by 2002:ac2:58d1:0:b0:4fb:81f2:4228 with SMTP id
 u17-20020ac258d1000000b004fb81f24228mr997882lfo.31.1689252248986; 
 Thu, 13 Jul 2023 05:44:08 -0700 (PDT)
Received: from [192.168.200.206] (83.21.150.147.ipv4.supernova.orange.pl.
 [83.21.150.147]) by smtp.gmail.com with ESMTPSA id
 x11-20020ac259cb000000b004fba5c20ab1sm1104826lfn.167.2023.07.13.05.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 05:44:08 -0700 (PDT)
Message-ID: <2e1fbb6c-e7b4-df42-c64c-59de47f05981@linaro.org>
Date: Thu, 13 Jul 2023 14:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
Content-Language: pl-PL, en-GB, en-HK
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Dx4sLVqyPux3

W dniu 13.07.2023 o 14:34, Gavin Shan pisze:
> On 7/13/23 21:52, Marcin Juszkiewicz wrote:
>> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
>> 
>>> I see this isn't a change in this patch, but given that what the 
>>> user specifies is not "cortex-a8-arm-cpu" but "cortex-a8", why
>>> do we include the "-arm-cpu" suffix in the error messages? It's
>>> not valid syntax to say "-cpu cortex-a8-arm-cpu", so it's a bit 
>>> misleading...

>> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}"
>> string from names:

> Peter and Marcin, how about to split the CPU types to two fields, as 
> below? In this way, the complete CPU type will be used for validation
> and the 'internal' names will be used for the error messages.

Note that it should probably propagate to all architectures handled in 
QEMU, not only Arm ones. I do not know which machines have list of 
supported cpu types like arm/virt or arm/sbsa-ref ones.
>> I can change sbsa-ref to follow that change but let it be 
>> userfriendly.

> Yes, sbsa-ref needs an extra patch to use the generic invalidation.
> I can add one patch on the top for that in next revision if you
> agree, Marcin.

I am fine with it.
