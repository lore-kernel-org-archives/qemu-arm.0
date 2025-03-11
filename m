Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2022056njc;
        Tue, 11 Mar 2025 10:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBrRRlFllskir+sapwZLysxecdJ5CRFIwjD1f58NvzFzTVz2cbWCF3R8XNSvOzj4ciuhWpWb+ln05+NA==@linaro.org
X-Google-Smtp-Source: AGHT+IEv1zOzhmLtmxvwxvUrBJbXDO/l40lEWhCDYC9BScALfEtRStJWoNotWHHonZzk+YK+ZOZ3
X-Received: by 2002:a05:622a:528a:b0:476:60a1:313c with SMTP id d75a77b69052e-47660a132c4mr194797071cf.32.1741714862770;
        Tue, 11 Mar 2025 10:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741714862; cv=none;
        d=google.com; s=arc-20240605;
        b=LDQxpsb4FTJkD426q6fc7qZVaMz4aBx2Hzh0qadXDRXjIlPhi4I/oaZaYitFlGUMt2
         1Fvd9up3ho+GTwjeoaud/o1khcUz8hFVLJ+UFK556oO7G7bQ+lvRt1Tr0rp2RXPn4iXQ
         +c1FY174PHce4cY3fMHXmLdG1GKU9wJ7+KpZj1QuRVPA/x9bZL1YquIxPnUAqrU3bZ4U
         1YS3iHNoqe3tUhh0todyJi+ppRN9qcbnersmEh1TBX+ZLrUwy/l5EVS4IdylbMIEGD6p
         zCCx5TA9n4cp63ulpnhuQwxPeIf5VbwxqLuMZBQ1zsfUQqhCT73+JzsPl9VB+riEb8PS
         rN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IulK9oSX1fmlHAF2PB0d2Tk0XU1yXWYTsZ0D9dWgkCk=;
        fh=OHkAi497cZEtSh4R0blS5jauXUNGizvJ1O6krXp6Tqg=;
        b=aIuws+pu3yq1PyOX/d7HdcoFjS06Q5f2dugEr+gn0ehYmDVVEH3puIRWJ0wzYWFYSB
         D883H8JB14W2gC7aUG5yCqSGxu+a1w9r2LBCOmQI2nGpq6LbvaYiFM1Zl4xuTPBFZ7rx
         sDEu0HUG337xXwVlLbMSwyFuUO7QaFUc4LAQbL+KULUWcHcfP1KjwMjT/EUVV0jwCLGy
         VXsXmpWRGOC+kzmipqnTl8qZ9Dm4OfgA6HkcfxaT9SZ7fsPqvHkKOleysmXQ3D7n4TPA
         BR7/I5BsehKGNKNYFQfmB1FlTXv1xnV4pAMp25TsxsVAeWAr69N71kHEURy2K1Ti4jNi
         2OAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjJwho1d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47690c0f695si36629831cf.342.2025.03.11.10.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 10:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjJwho1d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts3aZ-0002eY-ET; Tue, 11 Mar 2025 13:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3aN-0002X7-0V
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:40:12 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3aE-0007Kq-BH
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:40:05 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-2feb96064e4so11227683a91.1
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 10:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741714790; x=1742319590; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IulK9oSX1fmlHAF2PB0d2Tk0XU1yXWYTsZ0D9dWgkCk=;
 b=NjJwho1d6a3BYVkG8uZk+gXwBLnhQdS9gs2p4RgU9rRyUAiUenricYmLSeSa76wSiM
 YIoN8psOhmQYs4tal2FElm/1k6Q9IwYb4tAcaAUTVeBygOyC7Qgc0ssyH5D7iS0aSsR3
 EKLUKzPhajKPI9bo4CXVTG7DEb9ysD8FTSnqLWVMp9In+rFECXZVi2ueDP2b251eKv51
 qD7VAWAw6EOYTjwCvnWoCWvkDzY5CCLwZBCmSKe3N632Jw8sM9Vpw6C4xyqMkfZi2R7Q
 J/e8ICycDrCwhyjykWh6cXsbSsp6GEozXZyGsJIYif5emr9SyVBdKe2yEZ7Lena6eeac
 Rw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741714790; x=1742319590;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IulK9oSX1fmlHAF2PB0d2Tk0XU1yXWYTsZ0D9dWgkCk=;
 b=Aah23Ay4ZhI1c+e0xE3GzjIrA1PgFWpH1QHjc/CyyPlooIyO2PGXIW2kkk6tPwgsQ9
 ehYf/X2Y3I8MlbO7GQgczFht4s0v2WMx7H18gEP2y8ESImIji02SeotgAeKzSqWG0LsV
 KY8o7DybgHixD9TPLYaQe8nouXzippG0KLzZE/ZtX2Q4sTdDmVjuC5gsy4IRZi/VZPg1
 Ik3xdeHMEfHUax0GYIZd8zJ1LfWFSfJcDh5QFHvWMJi+waV99uhYnpf3Cd++h+9S3JlH
 V4HBte6NqvyFDDT3knCHv0naJFOJA/FtufGwor3lvIogTPr4ySrEVxmAJFl7omLAMvXi
 1Pjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOB9qi6Fd3+l4hLqDzza1rdv9Ze6QfKJeyq42/pGzfTH9t56adSoqdXbKHbZzTFD0gsGgcUdXlwg==@nongnu.org
X-Gm-Message-State: AOJu0Yw5mZZlq4TGnBD+tnJCrqak6Pab+DF7bYU6WktdeiaimI+L10AR
 H7529C99vKGw/tNs3dMAhX9rEsS+FTbDhUn1ZqAKu2fJS4TReBSlYswpX6dVV5mQ5LhNDUJDvBc
 x
X-Gm-Gg: ASbGncvpZBUdrkHhy3Xh86LigDkcy29V9w78zHLDXsFSFlyhh81+eQoZ99ihqiyVxRI
 I+xixbyBkcgixOKOqKmK8FT+lHBvt/Qi7DjEyWfi14BQC4LmpWShXHyLBPezruatfyG9aHsBuTo
 nUygYCFnRpHkHAQAxma/8nfLeOGQD8FpS2nO44YRgWv9NFViki0Lvx5Ot81uJEVA7LYFdDtZl0N
 Noi8sls3XDp8Xs1Bd2f0uPX0MdKyHBHM0D0n/QYko/ZRjdNx4TiONBcDSfDMIkP/oaUcaMfnhqG
 5cE8U9Q/I3jIpKb6L5hZuiIiDEYTXgHoyTPh/AEJTeUcgabbLVvHJm9DmSR6JHjdQD1ezJvDdwS
 oAxALqMFG
X-Received: by 2002:a05:6a21:68a:b0:1f5:8eec:e50a with SMTP id
 adf61e73a8af0-1f58eecec3amr6186663637.31.1741714790580; 
 Tue, 11 Mar 2025 10:39:50 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736dd702c4fsm4166211b3a.18.2025.03.11.10.39.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:39:50 -0700 (PDT)
Message-ID: <3b8c9531-b770-4ab2-8c33-8d3bfce03eb6@linaro.org>
Date: Tue, 11 Mar 2025 10:39:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] arm/cpu: Add sysreg definitions in cpu-sysregs.h
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-2-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-2-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: DFUzCzsKekHq

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> This new header contains macros that define aarch64 registers.
> In a subsequent patch, this will be replaced by a more exhaustive
> version that will be generated from linux arch/arm64/tools/sysreg
> file. Those macros are sufficient to migrate the storage of those
> ID regs from named fields in isar struct to an array cell.
> 
> [CH: reworked to use different structures]
> [CH: moved accessors from the patches first using them to here,
>       dropped interaction with writable registers, which will happen
>       later]
> [CH: use DEF magic suggested by rth]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/cpu-sysregs.h     | 37 +++++++++++++++++++++++++++
>   target/arm/cpu-sysregs.h.inc | 35 ++++++++++++++++++++++++++
>   target/arm/cpu.h             | 49 ++++++++++++++++++++++++++++++++++++
>   target/arm/cpu64.c           | 22 ++++++++++++++++
>   4 files changed, 143 insertions(+)
>   create mode 100644 target/arm/cpu-sysregs.h
>   create mode 100644 target/arm/cpu-sysregs.h.inc
> 
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> new file mode 100644
> index 000000000000..b95320b5b595
> --- /dev/null
> +++ b/target/arm/cpu-sysregs.h
> @@ -0,0 +1,37 @@
> +#ifndef ARM_CPU_SYSREGS_H

All new files should have a SPDX-License-Identifier tag.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
