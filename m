Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp204710ejd;
        Tue, 16 Apr 2024 00:34:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMUt5sFYe8CPsPhm0bvV5VlQtPiN/5wfvtCb8i61W+p9M2iGrR4mdqI6OGSSks4TtdV65gZYSvGyhQ02E7d5PUiRlRYIKQ
X-Google-Smtp-Source: AGHT+IHzu4HUQcYqq+60VgMRamKg0tuybP42IaRJD/YH1QuGCLQgt0D1gXj8fDHT/kFRd/qWT7xo
X-Received: by 2002:a05:6214:d82:b0:69b:30f6:d55f with SMTP id e2-20020a0562140d8200b0069b30f6d55fmr15327696qve.58.1713252887786;
        Tue, 16 Apr 2024 00:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713252887; cv=none;
        d=google.com; s=arc-20160816;
        b=GQQfqdKgttSwvxwYr0eEtAbopJIn+N4NisaPN14zgqoalsc5Gi5FeXXIQF790p+Tt9
         M2L3nrQnCZ1+HY2EFGBCc8e6kF4dtE3husUU/zxH5Xtk16qI1ESSUk3z0ZIo8/R3Eait
         aKsHjD9D/BQ9cw1DwOMoyfHFqj08DCteHg3a9cUSGqx9uHiTviTDwq4dK1crq4Jk6pso
         ZEcXYP6/N6A4Iac7XlFxi9cbCHx/3nThBolQx9DUtF1jhcAGsuwGDx+abx+57S1yvM7k
         RrbFWo322yWWB3j9LJ9aCkPT314c1q01o8LJdz28ovC7EtuDS1BhvBbqn5rY9FDUStcj
         LvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7LYAs7izQsVLWruu/9Fs3Ifo3+Ewv93g3NBlVCtDbEk=;
        fh=Kg0/Me3tpVJtH9/d0rYnDSoW4orhjxoGURIkdNPqa+k=;
        b=zGZ/gokkUynBq/UcyHYYpWp/wW7G3n5/1e/VBaavlyrdHgXjXlpl3Sh7P0fJ+y79yZ
         Y/kq1cNSCCVFKVeoR58vRAUGl3P0FjQb3Z8iIHKavlglkL/+IT/xzrDleTKYB7Aub7BG
         hKVE08MSm/QMG8sIv7rGEyZIB02rupObuiJu0WAVC/GoVgpDB7d06EM83L4d4IcjVw0C
         gnGisjdS2RAV7K9+1MgOKpkxLDAZyuWS73L5jXqqL3bQcMH294T7j9ON1DNm3oJsseFR
         by2Zi2OHfppAwOU+Qj8y8h8D+AjLb0JfuSF0WEwB6X/PQW2d4nGWafxdLTQgHgGQ0K/+
         3pQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNyFbTO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c14-20020a0cd60e000000b0069b40c7f96fsi11849549qvj.310.2024.04.16.00.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 00:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mNyFbTO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwdKk-0004pa-Qt; Tue, 16 Apr 2024 03:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwdKj-0004oi-2u
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 03:34:25 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwdKg-0006QV-So
 for qemu-arm@nongnu.org; Tue, 16 Apr 2024 03:34:24 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-570423c4f80so479008a12.0
 for <qemu-arm@nongnu.org>; Tue, 16 Apr 2024 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713252860; x=1713857660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7LYAs7izQsVLWruu/9Fs3Ifo3+Ewv93g3NBlVCtDbEk=;
 b=mNyFbTO9Kmhqj7miHWxXuM6YQavk7EJxdWug61jSwhFRZp1dynv4sWfd3PeyJV27fy
 JsMpXtNL12d8GlT9Th8kw1RYnrpVub2fBRVfA6mHZ5z8ENLXQ8RZn3jECDyuuWaTyc6Z
 Q+17tEentqWu9eSoXsyhNHM4zpXt+LojIhyS6u7YTFnxwjEtLimi4gZ2l7zzs+bg+ddA
 x7Lanc/8pZSOBfwqI7AJta0314r/m+sa2oROMFk27+uECyekbhy/73tcKK42C7vy/luJ
 L9lrlXqlisqkg+CESq1lwgHsvZzhPQ0SDxGP8c0UlPum0TBkk5b9lpl95vBAaNYhKQCR
 yOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713252860; x=1713857660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7LYAs7izQsVLWruu/9Fs3Ifo3+Ewv93g3NBlVCtDbEk=;
 b=crRat6a+5UCE56gw9YtP51I4GVX27zPoWAX1xDInwDDtJdYzbrEcXEmiItEV5bIKRg
 y+jbG2PqL7o2VMLjBMOMJzP/egzbCR040FXU0kNDE/eN4qifjDykA5paLIqgcmDlwly1
 5Lt1koPgwxL1+ichbohn95HXpOntA73x+asSHuiFFsIAD6IfQft3jJkvnf87q63hSsqG
 xkDXdXpoWpVTZ2k9+p6NQAU2GxNP7Qp8ZE12mmm83v9xO8El7v0j/FrAZojFkZYERVya
 Viqa+qKGx1RRd+oVLYGYO5AFbNMI36IZ0nYkZb3vjP8LF/LXbi3yWLjgqw2fOkrHovEl
 7pfA==
X-Gm-Message-State: AOJu0Yw8zIEMPN50Hybgy3ui5coGlFtxy2O/+N11iIZz3WJjbktslE55
 Vt+46p82/bVjFIaJl+uZ3mer000tcOuJUujdwBRI1M02svOIo7KGF5ld10dqXWU=
X-Received: by 2002:a50:9b1a:0:b0:56e:2464:7c41 with SMTP id
 o26-20020a509b1a000000b0056e24647c41mr9143342edi.19.1713252860520; 
 Tue, 16 Apr 2024 00:34:20 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.61])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056402000300b005702c757af2sm2059791edu.30.2024.04.16.00.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Apr 2024 00:34:20 -0700 (PDT)
Message-ID: <17e59f9a-444e-43d3-af02-d036f90a036a@linaro.org>
Date: Tue, 16 Apr 2024 09:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Improvements for switches in hw/cpu/Kconfig
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20240415065655.130099-1-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240415065655.130099-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: XqrEEFs+05rQ

On 15/4/24 08:56, Thomas Huth wrote:
> First patch fixes the problem that the file hw/cpu/Kconfig is
> currently ignored and the switches there are duplicated in hw/arm/.
> 
> The second patch introduces a proper config switch for the cpu-cluster
> device.
> 
> v2:
> - Don't make core.c depend on the CPU_CLUSTER switch
> - Added Philippe's Reviewed-bys
> 
> Thomas Huth (2):
>    hw: Fix problem with the A*MPCORE switches in the Kconfig files
>    hw: Add a Kconfig switch for the TYPE_CPU_CLUSTER device

Thanks, series queued.
