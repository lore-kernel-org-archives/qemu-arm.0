Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp650419lfq;
        Sat, 9 Apr 2022 13:39:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnyvrCP6eIdKL+HK2BoLwZyAqpuAhtHUE3jYtEyGjtKP4oF3Pr8RdNrS2/BCAqyvb8IL5W
X-Received: by 2002:ac8:4457:0:b0:2ed:f4a:8d9 with SMTP id m23-20020ac84457000000b002ed0f4a08d9mr3774190qtn.396.1649536773243;
        Sat, 09 Apr 2022 13:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649536773; cv=none;
        d=google.com; s=arc-20160816;
        b=x/M0DawHG9S38pjOj09r+V3+hCjqeU5RdpgMlUwh8nZPsK7vRspCHAv8jE2r5gC66D
         7WhBXeXyWT+HZlIqHVxZRBIoNbFCu/2b4BJXIxER5IlDmtaFoTrzSrwYvMA0nmb+9cOw
         awKXjV0iGbL9qzWMvhCi8WHJi6XmZM6DMpByJFHYMkKhPU3d4gYvz0gWToxs+DVbHcTD
         VQjPy8ANiIzAatuaqyvNU6jUo38nyTmpwq5Z3yb7588a269eef1QgYWW2QF5xBu8JiHE
         9kWyhcoI9ruhJAa6273iazkn2Jmfgemrkf+18yjjMmjB2TFftqweLgmauaE3MQfv2g1t
         asuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ilOtw8qMiA2qqltwFUSSLccCkRnbZpgAMd/9e0E3DLY=;
        b=cfXw26+5j5aQ3kKOGr7A6JXnAY+TyI51AkfPC9KGt3rh5aiVtc2dX7eWtULel/tYHw
         nLJ1t8aPeQMMyu7YglAGQOKMYMuuH0K8SHCa2pLxO5pU4lUsI3iX+PY+6sU4us8amCdW
         4LRo92lF5yPYgWdqiJtHbMIVuH0BeOTfIItVyQ8WDCWGhP3t6ks/81W2PVJgZUTLXGRQ
         S8khQnuzN0rw3HQNGVnsocfyw/lwIKQeZDHAyNbHr0A1gcNjdaav3s9IN2Ikr7AZUV/z
         5rERzX6MnZu9AvaKLKjuHbjanLcIdttjU5cfM3/AUr2ahnw7tyNC/9+ntseQi42jJdrb
         mUfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6j5URpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8-20020ac87188000000b002e1fbf3c0edsi2323575qto.734.2022.04.09.13.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 13:39:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V6j5URpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndHro-0006IL-Ov
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 16:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHrc-0006H1-C2
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:39:20 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:47057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHra-0003hK-RV
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 16:39:20 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 h15-20020a17090a054f00b001cb7cd2b11dso657318pjf.5
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 13:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ilOtw8qMiA2qqltwFUSSLccCkRnbZpgAMd/9e0E3DLY=;
 b=V6j5URpM2I6jS/WpUHpb/9faghnG35X/QNtDWXjvsSMU5mySOTm+NRH5qP3liA63uR
 aT+//cmmJ8hfUlGJ7ZE4TBXqb3YtzbsOubxlEasUKWtevVsMDxNknAhzyIGG5yihh7wc
 GrD8oc5dc6ukNMTX8MKlK5h1OMvfVZmmyx9NmNWLNhQaZl0Bd7RVb6rJQ8d6qM2i5rZJ
 /AWDJGPS3YnXj8/wj11d4W3bnDEb31RdQ8rw6a6Y4qoyU/K/L4PIk/gg+3jOn+qG09tF
 Ve0LNH8Sy1s4kKJUEz9JDcVT53HgoulWCjrDVIuTDEKG6nr0lk8L0Z1OpWuQWtVXAH/2
 PdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ilOtw8qMiA2qqltwFUSSLccCkRnbZpgAMd/9e0E3DLY=;
 b=clbgIXUD7/78tiBHTyjNlzLgkTp77drkGQkxZ48gbJbbxtlCNyLCggGyA/rYSaW8D4
 c/6b+HTetiXefKCcsLlaY6KKhoRyYi9O2s+Oyv63cQxKObYR4BTtUJ+NlY6oPkY2muWP
 dtLml8bJZgg0l5S2lWqR14CdmRufV0N3Gufew8SbadCq4Ap4oKH/zr4YcWOhaoAPkqU2
 KMBvEptZlqr8WkGjdVU6+kuJGHvRzqFE9JmwXozrg4yE1LaKe3aSORZelZqkVspqN8iL
 KFj2B6t34ipm84PSjP0wlM5YMz8/T3Uf2bVRxK2SBMSuwZKnPHOEWOayfVgIDKQ8SyP1
 3RGw==
X-Gm-Message-State: AOAM531kjDylu3V1VCehUkXMeXb+c8WjTXpYeRe+amE5QwfT7R6p4Lrq
 jJgVijANI7zdTFih6VSpaH+rXQ==
X-Received: by 2002:a17:903:22c6:b0:154:4156:f397 with SMTP id
 y6-20020a17090322c600b001544156f397mr25393393plg.29.1649536757337; 
 Sat, 09 Apr 2022 13:39:17 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v126-20020a622f84000000b004fa666a1327sm19166950pfv.102.2022.04.09.13.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:39:16 -0700 (PDT)
Message-ID: <0ac61270-c360-9bf7-b272-3ba1434a5170@linaro.org>
Date: Sat, 9 Apr 2022 13:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 34/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_mov_vlpi()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BWg4A6WyXUt

On 4/8/22 07:15, Peter Maydell wrote:
> Implement the gicv3_redist_mov_vlpi() function (previously left as a
> stub).  This function handles the work of a VMOVI command: it marks
> the vLPI not-pending on the source and pending on the destination.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 20 ++++++++++++++++++--
>   1 file changed, 18 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
