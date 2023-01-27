Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1476418ejc;
        Fri, 27 Jan 2023 14:17:02 -0800 (PST)
X-Received: by 2002:a62:ab02:0:b0:58d:982a:f1ed with SMTP id p2-20020a62ab02000000b0058d982af1edmr36445783pff.27.1674857821795;
        Fri, 27 Jan 2023 14:17:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674857821; cv=none;
        d=google.com; s=arc-20160816;
        b=dSqFF8oP1gmi9nDfLQPN+8gRY+rLqDLaeogCLfYPDko8kRZOsNaermZoEMp55/XVEc
         Z0xwdbaQhydoyL0uY6zeysZAlWv0k1iyk82PMrl4Ou5uJ255SdvdpWzO2M1ghIxUj2r6
         lhIligwaUMAeKEml/DvTCq+e4vvXpkqXQlJx38bA63DSB1gCtqVMVc0MBo030gwQW+Wc
         SLntY0rbzYtSaxsGEhnGQD3PMl7Yn2vFFONFBX4Wb3VwpTOa44umWRGUgQv8YTTJQCoy
         qwdec/1PLPQjzPBEyxY86UOqzMPrgKzMoD2UwqUASFuF+Rar1+DmQA3jYqFbYhx2/wsa
         a/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=40sBIB1RZqR/70Vok5LVj5wJxs2g2fLbQ/igRW/TGzo=;
        b=EeNwpS29B0N7nAEC1ZhumH+3ig1989jpoaWRz2uFn63NNGE1Oyx18yZCgoC0b6yq/O
         FZ0+POp2x0Nvijo/AWHY0F8tQjqS+Kbh1daMhZKF7OcrqDBQ6W8rm6V/TqFTETlXWMTG
         36k/N0RVXtM5ZpC0TY+jVILEQhST15FG9wdr0wfGXYiCy0NCNzR8NaokVTVab/ne/G9a
         j0HjqtBRwyjzYL+xcsuEGSL+ZMD88uFShuEbgBA0etLaR9kQzHB/WFLf9ydsxC/VHNtG
         FbxvzOCzGCj5jG2u/PEW5/Yz/DNooRv9Fj01exepC1ZtCLVVHHeUYmjv7D+cc5DqXFiq
         bZyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxNvCGul;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b126-20020a62cf84000000b0057645c8e127sor2333957pfg.84.2023.01.27.14.17.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 14:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mxNvCGul;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40sBIB1RZqR/70Vok5LVj5wJxs2g2fLbQ/igRW/TGzo=;
        b=mxNvCGul6qheMswRnT3+jGCAmtg9CljfQFnYACZJ5FjxeJx2d18iVVOSF/mvA7/0cP
         O0JY2Fuuwud4FyM+wr/UXP0KufatOJ1qn0I7zzceCUVXW/lh0f6yprYA9UBzCJSS+XYW
         pWgeP2MYngy6wJxGZ6RfiHedKYTBEclfmx5wVkgzn6jBxb00WKiSdeDuR2wLVdyH3NU8
         kwIxMyxUJLZWdr6hrCQmYWwN6bxTiMWCcukA+ORMlJUtlEUNkZaLNaNMYpraLuI4YuGz
         AmEJnHSXIou4IhNEnVxpSbT3DjgNbZys/DGKBQa4EaQaeoAz6rHdRY38UXJ4M34Q79UA
         uT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=40sBIB1RZqR/70Vok5LVj5wJxs2g2fLbQ/igRW/TGzo=;
        b=Xb6694xAMaN7+RWyF8wrN+w63za1kgvAR+zkiincGNfx29QnH6kQ4xzoOxmiYD3plr
         OtVfod4YcpwF7QmV4gzBb3smHLGV+RDlA5xaSpCMRSBdJesM4GT5ZI9ZY/AtM3EIcZph
         eCRbh4xyORA00jU4i4GSknPv1IRYbB5stBERpHLgiRPcv1bmlL8jZA4vo+RytjcUDt9H
         ZGZZYFujZfBsuCxar81EniMM548HefyFhifB5aNKl3pRP3IKhR8S4jxsP63sdPIYmut5
         EUL7oDo2hmPWq71XtHEwM5jfD2PQaAtJ9STHGxueWtvlO54d26CCQASHxIVsmEsgQMLI
         JkeQ==
X-Gm-Message-State: AO0yUKUtWVTFdPooC4cJvfKsl/0n/ACCYknyyIrZFu4ftrM8lHf2VgOR
	9evlfmYAc9sb8o5mpPxNPDXaSb+BtLjacd2joxU=
X-Google-Smtp-Source: AK7set9hlSAp9hQwJhaz1ucd4MLoTL/MSK0+lFrETZw9IoY1vXxidpHfqoRhEyuTm+1pmPUNfWlGlA==
X-Received: by 2002:a05:6a00:8cd:b0:591:3d20:3827 with SMTP id s13-20020a056a0008cd00b005913d203827mr10002978pfu.21.1674857821283;
        Fri, 27 Jan 2023 14:17:01 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id 26-20020aa7915a000000b0058d99337381sm3149997pfi.172.2023.01.27.14.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 14:17:00 -0800 (PST)
Message-ID: <991a4365-9301-62ff-f357-0b95e8bf4252@linaro.org>
Date: Fri, 27 Jan 2023 12:16:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 05/16] target/arm/kvm: Split
 kvm_arch_get/put_registers
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-6-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-6-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: X8+fYVVq0qqu

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> The confidential guest support in KVM limits the number of registers
> that we can read and write. Split the get/put_registers function to
> prepare for it.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   target/arm/kvm64.c | 30 ++++++++++++++++++++++++++++--
>   1 file changed, 28 insertions(+), 2 deletions(-)

Given the additional checks within write_list_to_cpustate and write_cpustate_to_list, I 
question whether this is the correct split.


r~
