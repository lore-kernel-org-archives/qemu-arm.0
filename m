Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2142017ejm;
        Sun, 23 Apr 2023 00:31:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350YWvgYzER0dYvO30JQGuwy+5tAWFIvm1NXD09PxoEFq5NVdYdiPLYhGjMk96xxy9eJMQoWq
X-Received: by 2002:a05:622a:1716:b0:3ef:5dab:a3f1 with SMTP id h22-20020a05622a171600b003ef5daba3f1mr11746718qtk.34.1682235095483;
        Sun, 23 Apr 2023 00:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682235095; cv=none;
        d=google.com; s=arc-20160816;
        b=tbuKP2M1cunEcmYr7Pw4PnY1GPAtb8VYVmnLPZ1JgNNz2ACjcdWHjx1eyWwFYCyChB
         DETUx2ON7726VGG7v64P7mdfrCVxw4j0P+0gAMbAAkIzPlrjmO4skBw1xMlv0POEJNnJ
         olxRtO1WgEHzN3/8N4wyJI1FyGYakl+qm3AEyt6O7DVSwgIHcR7P5GasY5yOa3+3ZOxc
         +dcyTDIPEHptUQ6jCNNyYjCclD4fsoxwIyzvnXVgihzWE8wEBXcv0RuteCMwnwQdzy0d
         etXDuNYWmLJ1q1iP4kvsmpP0c5DYspdUviJmSMsJTyGnCQ9P8T/2gEctkW73SUwE6qYj
         sZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
        b=OP6NkzIua5c2MYwtg+aFZkKRRO3+NqCdqnM1l8pNaFAxA5CMaF7VTtEoXKjt2HG1b9
         Of/xNBEYQnooRVf6o7CNWRUJkGbb3HzXOkrvt2daKZVRDD63YCpYKGDhdpGDto8p47YA
         LvhumC7KUVuDsEnuohoRJqcu1Uyz1foczYQC9AvLrE4bGpVMKOBh5vjlywRxYTBxP8QD
         63HPYC6BlNp2QFT4UN7nl7O9Xx7Md+CQpFCxFNJi8RMg0fjnUH7DRvKcXsdCh9fCJ3xb
         TBXn8JWXJdQz1xx5G2QzBcJU2iSD1SpmNufuBNIjimZ+4Mc6QH26eby5VYX05WC/vMnn
         LaOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2DfMTJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05622a038a00b003b81b32738dsi5595620qtx.393.2023.04.23.00.31.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 00:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l2DfMTJp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqUBY-0004OR-GD; Sun, 23 Apr 2023 03:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqUBX-0004Nl-51
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 03:30:59 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqUBU-0001rA-ME
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 03:30:58 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f178da21b5so21516475e9.3
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 00:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682235055; x=1684827055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
 b=l2DfMTJpr+oNZoik/8D6RORvbvrQw4ZFJvFpzuhX4SXM8huNXM5KcKiTOymGVFCIPi
 rg01xNMz4yfc0rRXE6Jhsa2epLnZhTZZQeVr/VijVZG7ZHX8O5Qh2DTC/C/i6zqCMU+5
 U22cGEi7087UhMvJJ+1biPser2E+OVJ9oKW9q365z/alzM2RENZLYzNGd3udqJfYGkbX
 ueaTi3ciQJzX2EitrIiWEFOS3Zvm2qq9b8x13i39eaNIgTFClcXiq4vnqQHTuwLxe8vg
 VF1djDqZ6Y1o1MtFjW6/vCDLfV3cFdF8766ldrdCdP1mtfNRJLWrO7EMO+QcEw0rryzS
 0bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682235055; x=1684827055;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N24O491mJEhNcIKEytZSGussY2E41uyw6/N9ehBdK4Q=;
 b=QQOLjSb96aP17gzQZKdxvVuT7VNueSwSc1w2qoiukCzBj8dM2aUI6Hq/rqvleqOunO
 l5/t/9hVU86ZHMZAIkedFno4ocvR8pMlJylskTZtYQj8fepUcGlCzaRY8+3/1pFyMk+8
 jiDpQT+D4WeJoS+jsuB4xibVlcRBRvNB3EOzqKHR2ad9bt+aelafEIYmMCkplAsggsp3
 47PMGWRFwcSbiGNT6gXxU+iw2pqeLLTEPo5a0Q5cj1ZYP0fHWU3s5D7WAvGuwGC7RBWJ
 q9eaw25zx+A2r8bjIOwwGMNBgRTiNOcR+w0KVXcGm8KKCGa0AGHyeTu6OBHqNtsOrV03
 9Xnw==
X-Gm-Message-State: AAQBX9c/NJ21rpzvLfrZ9dY4RtrZDJ1ZwzFMRYDhP9zkI46WZ+aGd0iI
 nmJy0HbNptLu4Raf6G38Iiwq7w==
X-Received: by 2002:adf:f209:0:b0:2f5:ace2:8737 with SMTP id
 p9-20020adff209000000b002f5ace28737mr7817660wro.32.1682235054927; 
 Sun, 23 Apr 2023 00:30:54 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b003021288a56dsm7198959wrs.115.2023.04.23.00.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 00:30:54 -0700 (PDT)
Message-ID: <db8c5197-74b4-497a-587f-994b100d4344@linaro.org>
Date: Sun, 23 Apr 2023 08:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 31/54] tcg: Move TCGLabelQemuLdst to tcg.c
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-32-richard.henderson@linaro.org>
 <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87d1ac98-17b9-7321-05d9-fbcb158f978b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.047,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: IKUMNO9KMvb6

On 4/21/23 23:29, Philippe Mathieu-Daudé wrote:
> On 11/4/23 03:04, Richard Henderson wrote:
>> This will shortly be used by sparc64 without also using
>> TCG_TARGET_NEED_LDST_LABELS.
> 
> Is that in this series?

No.  I've been cherry-picking patches here.


r~
