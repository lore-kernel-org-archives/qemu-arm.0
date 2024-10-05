Received: by 2002:a05:7022:6382:b0:8b:e46e:3391 with SMTP id q2csp740496dlq;
        Fri, 4 Oct 2024 23:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP9L4v5Fyg2eHY3S5IoO3ECs8iYhj+VCoZy1auC14+zeIDMLgf7p/PBAsDVDjG1bfQzoGIYdRC5TzqNA==@linaro.org
X-Google-Smtp-Source: AGHT+IHuENiZcUy1vTJkwDzu+8Azli+NHo5MbSuf9b3HRaVrBIH4S235l74qxG3uocLLoziSjC7v
X-Received: by 2002:a05:622a:1310:b0:457:f8b1:a03a with SMTP id d75a77b69052e-45d9ba5ec1fmr63572451cf.24.1728108847335;
        Fri, 04 Oct 2024 23:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728108847; cv=none;
        d=google.com; s=arc-20240605;
        b=fGEghv21RSz0ISpBqrJs0qMr9/BPvvyM9yda5I6/EtRCXV1CcbmvR9lroToEfH91WL
         hyIH0+aA5o49Ts+G9sl6fm1gEbnkCsKWSh9VBhjtoh1uziZ82esWqMonEHPj+qoZIje9
         yjilNdNHlN3WKkwqI4V2qalO2+/GbfhUnb/uehW1FW/aLJkEsudkPyMIYubtPgRp6Mwt
         ImzIR6MtPjxSbxbzyiY34RCXYRSPLhok2qVCmcw5e+lKbHCKu/A5O6TrADYzadqhH9Ul
         yosAXYlskOF/UTlwNOwZhLKex7DZZlnU7g+FAIMIA5Igkq7axbUKaZWXsq3YyOd+O0i9
         0slw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ml/Y5ZbDQDb5nr8Y5unr89/ApO1UKPdv9ntCYuNI/hg=;
        fh=kioEmIEya5Yfo8zdGGNtWQOpGiSNBgNJHGTPX/RPP5A=;
        b=FTIFNPYlhPHvBLNd/S7wo5N3LCxtMEH5PrFbiX3NAzHq4ynULstx62bPfGw2avi10M
         HJ6GIYCUsYCJpuF6vPBemW0OiJveEBdffhli5l4lqB2vEHXEVo6I1kU5Ge1j/16E1mni
         gdzxyYj81XuGrbCqa9uJdr41c+5x6aS3tczLWQ7tZzD1MUCGSECDyUET958iAxuL39yM
         Eh9WMCbj441fdOWM3Gl0Eqf9wLUgM6owlJks03SoklYQYeckehfzcXYBjnpla7XUks8S
         bCiwuvfEWePO7MoAffBrEGWWqJngQRtN9ysMlfTKVbFV9KB/kVtgrMUlYXWWpZkUwBjS
         88WA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=bWyy95NY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da76431f6si13426921cf.521.2024.10.04.23.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 23:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=bWyy95NY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swy3F-00011g-Px; Sat, 05 Oct 2024 02:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy3D-0000ze-SC
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 02:13:59 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swy3C-00018A-Eg
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 02:13:59 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2e075ceebdaso2117319a91.2
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 23:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728108837; x=1728713637;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ml/Y5ZbDQDb5nr8Y5unr89/ApO1UKPdv9ntCYuNI/hg=;
 b=bWyy95NYHJNI49E1ENdW0iohqYTdpv1Eim1Zl29KDjPnh1YdKzfGRY4YuEB1c7pPuS
 CSA6O9wPu4tIuE8EsVZTHi25Jp4WnynFHGnlKgBwHByV8zGa/NiK/Q8GmM5hFftBNAtN
 huU/IheRt+gmVBVgIoOaWDJgqqFq3n4yjmY+eWTuOrN8ybXSYYNPj+oWQxP1+Rd5DlhY
 rvSzNJvW/30cCDWHl2Aw9WzfEqBv8RmcPRN1C9UNEEWQd/y/U1LBfIme4xOjpsagfCY3
 nWmvqR7YNw8dLSX1vd4FszSfw5h0ZobzE+4v1oM07r8R8Fdur8mVst/RCqvnrCV2hGL2
 KDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728108837; x=1728713637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ml/Y5ZbDQDb5nr8Y5unr89/ApO1UKPdv9ntCYuNI/hg=;
 b=gHtTe818dJDpWt+J22pDbuh0Vc55pshIo/3Jf0MCck1TPaIIzVALaG66d0NX6KpC0h
 PT+c89n7tYp4VZUpy4jfciuEiiiTD0THCmkm5vmGaKoJWJmtBfgR6tRweB6YY94iqWhS
 it5YKDd3mBQYXMQIkrByMJ1VkMsuJxhwGKqJatLxJHvQ8OTII983o0HRaJxYn68/l55T
 gR1PoXh8aiuJygnhzm498c7qPMDvNaZoJqwad6lMSkJHzKTxIyIJsaoFSwaSNkBycUKC
 XJvTwHucFHE9Ghm3D3Q5Hk/cI9EQmWeyS+LNunuQniksaLzsdvrJvTE23R2Pj2TgdxzR
 c0Bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEkGiZ7Cnnz3nfhNOB+aXNu2nKD2iyqdEOcJD3MxjiObu9yBbHZvHWy8NKBEfx8aRpa5hswpmNEg==@nongnu.org
X-Gm-Message-State: AOJu0YzLPAYGo2ZforkKG5eAwG+O+a9RFUziWCLMjs4Qu7HNgpA6UGPw
 iws+47dqtmIwJmBZiyqnuFxxBdYSNDiXh4SwI3WbIgohEXLYXMHcgrWqGeQG45s=
X-Received: by 2002:a17:90b:4a45:b0:2e0:921a:3383 with SMTP id
 98e67ed59e1d1-2e1e620f326mr6090398a91.1.1728108836957; 
 Fri, 04 Oct 2024 23:13:56 -0700 (PDT)
Received: from [157.82.202.230] ([157.82.202.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c138d0b2fsm7461475ad.112.2024.10.04.23.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 23:13:56 -0700 (PDT)
Message-ID: <5db6c12a-0a39-4869-9ba5-8b9a37080c62@daynix.com>
Date: Sat, 5 Oct 2024 15:13:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] hw/misc/pvpanic: Add MMIO interface
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-8-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-8-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: QmGlUPWWWcue

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
> platform device that we can use in embedded arm environments.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
