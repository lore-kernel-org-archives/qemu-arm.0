Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp391995lfu;
        Tue, 26 Apr 2022 10:26:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvDF2rpoZHkYGGCOKBF4VjwNoJ3+j7hBkDXBIQiICxfSKyA8UVNjVDWW8WPHaOgpZRcLkj
X-Received: by 2002:a81:2443:0:b0:2eb:4ffe:fab2 with SMTP id k64-20020a812443000000b002eb4ffefab2mr22872627ywk.330.1650993970821;
        Tue, 26 Apr 2022 10:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650993970; cv=none;
        d=google.com; s=arc-20160816;
        b=eXL2SUd/EuH+fkG8YoeM69vrDNJT9iMygAGRAioS6mwL2c30vFGVR6ttNoq+HwZM/Q
         Iy95gjpuDp+D1U5r0nZF6z8QwJaGnqEPByMQQHqxlxkcmNlsb2f6TFwQiMLz0mpjn3Ci
         svADeOwzETA8t0rEYHmjbuW+Kr97jyyzkwteBtp9twyZxomad8FGQw2UnEIsRoO+FeBo
         g+xU3a2aIuhA6okRIh9VPXUfYLmOMWU7vNHlUZaV/x5phoAPCt2EHrikjXfAjfZQAS76
         OkMfpRG9ORrCk4nnSTRJngJxHYjdvttTWPpCVe4E2YJXqw1fxeeMocRjlIOgygKFsoM1
         yVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=wwU1wr2oHCh6p6VVLIP2A9n5ll+oka9Ftx8+kpe14GM=;
        b=RE0eOv2q1ZcTOJzDoI3jV3PEnAtIEmFyQ/1rNjXsu6lUwWdl6aNXyCrvJ8R7UEZ8sv
         St7/MQM2lH93yYFHlAHn4Fqz0VmVPCAWQSD70sJWTT8MUM3yytIaOkbdqHEMsmCSVVBz
         LtU0SvB0ZP1J3tglqAoPC89v7iAH9UhNFCXC08WnBiSA+Ty9hPbEJ3Yz6xr/mZHGni6m
         hhP3B1ZwclFhEK5Oe5iOtbmbcOwV9g8xud/8p/NCAemJPR91RiDZ07AtW5QlKBj2f7Xa
         7OidxToVXyB2yksGQcFECntOFfNbfHV4//3v5kJRpdBh3wgcmirnH3XAoOI3Qua2oMvf
         uBeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tUdL0ajs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a814907000000b002f4e746e152si10715864ywa.457.2022.04.26.10.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 10:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tUdL0ajs;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOx0-0002V6-7v
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 13:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njOlE-0000lk-UD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:14:01 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njOlD-00020h-5I
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 13:14:00 -0400
Received: by mail-pg1-x52a.google.com with SMTP id bg9so16573311pgb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wwU1wr2oHCh6p6VVLIP2A9n5ll+oka9Ftx8+kpe14GM=;
 b=tUdL0ajszVLUTIlV+q4P2r1/fidJJ2rAwPkzA1PpblospFlTvrRQ94a+Ntq1a0pMEt
 VJQlvjBR7KwjbnxMv/x67yYTz8g7IUUZHrzot+3Ow1cuI/uBO2tue4SZXbL1zuCEHMz2
 7Ls+HiqDlsv+DSY42l45H6p+ajkMKI6Bz2bT7HC63yR8003bs5NLeeSCcgcXT2DSTlNN
 +5xV5rDbif4lqYkHu1S6ObO7C2hvpu+ljw1xPp8qIlMBx8byX/UruCHa3aBdQm92rQre
 GvcK8VVG9rfqChSqtPrARxGOz04Jkljm2hyJjtmdThxeKvdUY0c4D8XIOiWwdH1/ypq5
 UQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wwU1wr2oHCh6p6VVLIP2A9n5ll+oka9Ftx8+kpe14GM=;
 b=rHax4X097SjeXvul9nhYK2QdMClLAD63aqrPffCjlIXeVwPj/OuzXUCfH6Xa2AIIQ+
 J0ewGwm6TBLNM1gqZZXj4zPk9j0h9yooKsEnNsapP0vMIqA+nHcnHsqjoNSk3nBnvnpZ
 xcZVaCHBbovRyUMiwnfY5CaqTUnXiNbl5oFZGYzj3X58AlTHIXAPdWNgF7LpIx079Jf2
 ZxB5KzFdE3/HxMV7SoiHG3jti7aNz+/cYsBAdCC14OgxG3dFL+ezL+bQP9ahJrM3Nc13
 HXu6s6xXXZbeZ1HJgzQqdb+4MPNcG46ZG29xAVKP2WZmjsuwvmLXe4YtzJnQD9CzRoSa
 Q11w==
X-Gm-Message-State: AOAM530q0XxvL6WaoKRfBBavBJh1Glw0mVUY9pBWxUC2iDXSEQl5p02X
 y5YIF1K/cV3Zc/GKAkhHEOkopg==
X-Received: by 2002:a63:7702:0:b0:3ab:4d62:b68b with SMTP id
 s2-20020a637702000000b003ab4d62b68bmr9278770pgc.452.1650993237064; 
 Tue, 26 Apr 2022 10:13:57 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 o19-20020a17090ac71300b001cd4989fecbsm3610941pjt.23.2022.04.26.10.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:13:56 -0700 (PDT)
Message-ID: <a2deeb44-8497-88b6-2783-50ac233d960f@linaro.org>
Date: Tue, 26 Apr 2022 10:13:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Disable cryptographic instructions when neon
 is disabled
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20220426124259.44087-1-damien.hedde@greensocs.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426124259.44087-1-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rEEzdINI8TNS

On 4/26/22 05:42, Damien Hedde wrote:
> @@ -1587,6 +1587,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           unset_feature(env, ARM_FEATURE_NEON);
>   
>           t = cpu->isar.id_aa64isar0;
> +        t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
> +        t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
> +        t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
>           t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
>           cpu->isar.id_aa64isar0 = t;

Missing SHA3, SM3, SM4.  Otherwise, good catch, thanks.

r~
