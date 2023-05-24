Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2600349ejb;
        Wed, 24 May 2023 07:39:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ79Jwh96fEPJUIUaorJpR9ZLgJu6E1tAjQYRFjE5h1qha3KOaehQ0e7Dg/VnWvUp36u9Kyd
X-Received: by 2002:a37:ad06:0:b0:75b:23a0:dec6 with SMTP id f6-20020a37ad06000000b0075b23a0dec6mr7137595qkm.68.1684939147134;
        Wed, 24 May 2023 07:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684939147; cv=none;
        d=google.com; s=arc-20160816;
        b=URIDZyYQi0pbdsAD0KFIJyvhQvcMmFL/t0KVxfvBiVB6ISZlCvYnHHW5QQe/jYFJT2
         3mv8QC4rwwnWIxr+tpadHPM9H1u239LXSn0F6BSoMj8QqQOOxA2Y26rmw/UH50z7L7KD
         StIME4INZeS//QOjGo6ItI3hUZ8dvNhC3dYhV7aAHxleQKv2GLWUxPuSTmqFmCjBkNsC
         lacrmx7A+JwGZZ1VQyfv8bLejWzE7E4I3zdAYh3Hz1NrPx1otmTdQO2DmlIxMP34vmAl
         FbpjQyj4SNaAP5fCpUfpFAo01LtgKnnxGqLPQo5abJf0DcMbVR9jXsPyaFl+XadOx5mb
         /JGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EOkOFySqro5gSmR8qPZh0BYA3rYAuOHx36cBQHbVFn8=;
        b=z55CGXlUmGlRNRa4TxoEZwttxIpKE/9CDxgcpVa5bv8txnSxu+bGxBQmrQyU+LDKUa
         +Nn4L0tuD6oou60i5vZvZ9+495B99Qfu6Ganqa07m6FhvPxToYUNgIrIRmh+NYSTcrqj
         s/ALlYaOaRqcgKfpqKVmRXTHwqQhT/HKhNBsk9eEzb6Wjffqctm1bwP86lXIcWX+R/i0
         DbyoyWtfbbx2tofPMIxjGG+FIwl7cNcyGp2N8Yef50vI0awzJqkI0D2QSniFzzYl/jOX
         enduZjZDAJ8pMRJCGCfqbaE3cDDcHGc+1VbqfxdWt+LQGgu64qywpNuLHbNfPGsugXv4
         3s6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fWVwB/mZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12-20020a05620a128c00b007579ed46c05si6441322qki.266.2023.05.24.07.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 07:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fWVwB/mZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1pdi-00080R-T6; Wed, 24 May 2023 10:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pdd-0007rX-Ex
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:38:54 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q1pdb-000859-R8
 for qemu-arm@nongnu.org; Wed, 24 May 2023 10:38:53 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-534696e4e0aso299870a12.0
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684939130; x=1687531130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EOkOFySqro5gSmR8qPZh0BYA3rYAuOHx36cBQHbVFn8=;
 b=fWVwB/mZBcvI9AeVx2RFB4jv7Jg+f1aPVFTeQQ9BQqwxXfdC5cP3ana4jJYrCmRzQJ
 hD2mCNFZyTnsCi5rRYAwLIVR8tA42iiZYvzbvlRQ+HeSxmyPW2R7FI/L6r4G4us+072A
 yR8ynRi6jFsCHXVhSZ80EDzUI61J64C+YdPRUOO/aWY/6bXaES7zuPpZhN9Kv8LFUxCX
 fd9v7jyhqX20wfYQmJaGF9Ow2Fpeb7jzEW8drUMz+mJ9geQtfKRx5LOaVblqD1ymcfjJ
 qtOK4Gxfi23xru9D1RUjbZ4cYPmz4dPZW4Zhm2keQMvEkVDDiLFCcC3a9tcnMVNig0Fl
 1OCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684939130; x=1687531130;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EOkOFySqro5gSmR8qPZh0BYA3rYAuOHx36cBQHbVFn8=;
 b=Vm7bvlbqqU9sfWlBSQB6RKU6qbu+DULS8AkYapjxRF52UTpDBoFahgseJBAFKxNrvN
 B2NtdTjJhUEx7TJ19SqbW/jlq0WnT1Od3HWbQd75pTAjq9NMQ82lG2WSFJvcw4KbfB9u
 OPtoNV6yLOPje/hnDcpb355q0n0jIfhbLCkhuDEv9WGVbj9g3tusCpV7bUa4LfHlK3io
 pejmHrj2hgqqOnz3TJ+deFDq04iHBShSySn5yzX1UTRzRZB/ZMf5WjMs12RNNm62DKLF
 jYoHH6WPUAXCVpue5JM8G5oYF87zHL88xI65yT3b1MuM/RhBomeNomCNjcotRMCmHXoF
 Kidw==
X-Gm-Message-State: AC+VfDxLCB5RMvi6qT1VFBl7QX5oRV3BVfzKt/L/n5SkTISMXtNxSI0q
 NbBoI8yXu69rrOBBiPB4bSjM6A==
X-Received: by 2002:a17:903:18b:b0:1ad:d995:54a with SMTP id
 z11-20020a170903018b00b001add995054amr19610438plg.46.1684939130168; 
 Wed, 24 May 2023 07:38:50 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:6b03:9af2:33c1:3d6b?
 ([2602:ae:1598:4c01:6b03:9af2:33c1:3d6b])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a170902ed5200b001a967558656sm8817819plb.42.2023.05.24.07.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 07:38:49 -0700 (PDT)
Message-ID: <ea52f09a-7558-e9d2-cdef-a0a6c0a96216@linaro.org>
Date: Wed, 24 May 2023 07:38:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] hw/arm: Use MachineClass->default_nic in the sbsa-ref
 machine
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
References: <20230524082037.1620952-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230524082037.1620952-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /fJaqSoXPJ7z

On 5/24/23 01:20, Thomas Huth wrote:
> Mark the default NIC via the new MachineClass->default_nic setting
> so that the machine-defaults code in vl.c can decide whether the
> default NIC is usable or not (for example when compiling with the
> "--without-default-devices" configure switch).
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   hw/arm/sbsa-ref.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
