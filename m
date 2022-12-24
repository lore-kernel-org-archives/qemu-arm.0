Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1382845ejb;
        Sat, 24 Dec 2022 15:38:57 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtz4giPUi3WMSZoi1dC/1wMEYZ83WAuHizo2Ageeza17BCvNzxUoez7VSyHwLk9JgY1e66N
X-Received: by 2002:a05:622a:1e17:b0:3a8:21cb:11d2 with SMTP id br23-20020a05622a1e1700b003a821cb11d2mr17903847qtb.1.1671925137153;
        Sat, 24 Dec 2022 15:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671925137; cv=none;
        d=google.com; s=arc-20160816;
        b=HxAfJNvx4DP/f9CJYUJHo5RsXx7br2Ec3kB9Q3rO7cAvx2g6pNPC5S+PPDGyjtVrGD
         IXSg2JhTvndJ3cbJEESc+Gf12Fq7XptmkhL2kytgGKEZjQl4eH3lSc870VNnZslcm/28
         regJysBx1sewtL89YpNOxzplgnJsPgvkaIORjd5/mqvzyNUcSPHhRc2SQKEJdd66y2WT
         gKRq1pIt/eiJ8H/FCheOTGvSY2X7bF3bL+wmrOW5KWmEXLTyuBF2nXfygmXLxHxIsnnm
         vrLc9SupSEhjWiXL6tgSHFPq+lLRNcjcVN/7CNeJ1fmQ0coKvvf1Gto9KQU34pLes4c7
         DvGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2p/wIHMt5QkVq4c2GBCeHoBMkVJIOYm8sUddhj7sHUI=;
        b=S6g6ft52+9GJ+GAlhuc+vczWrwaTezFw6TNG6pj3TkndFRcZ4DCcqll1JZ3O26jzv1
         947Cv89MSPdm1wIzNiRNmKKqowss9li/N7MAKiZgp55aPn4T20TVexV63YqcgeYuFmah
         3wP9iwoBhkqnZYJz4EHNVWmutcmnNz21qOa2McnQUmFffbGeAbMoTZhpCXZOvP3BpQ+D
         vB837anM5/ed6fUQFUvANsOOTVZk3JrjyyAXDhUC/plW26cFjZuAnRRldGEQzLGM0b+Z
         A6SLOPUFjW2lYmJzJLYH45BI1+gQ20Apbq05T5LiafwTXbupRsUi/zfJDRtKelnQsgju
         YT2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akpNQo8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020ac8524c000000b003a6a7728c2fsi2468432qtn.753.2022.12.24.15.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Dec 2022 15:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akpNQo8F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p9E6K-0007or-Og; Sat, 24 Dec 2022 18:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E6J-0007oZ-HF
 for qemu-arm@nongnu.org; Sat, 24 Dec 2022 18:38:47 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E6H-0005M4-QJ
 for qemu-arm@nongnu.org; Sat, 24 Dec 2022 18:38:47 -0500
Received: by mail-pj1-x1034.google.com with SMTP id p4so7957157pjk.2
 for <qemu-arm@nongnu.org>; Sat, 24 Dec 2022 15:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2p/wIHMt5QkVq4c2GBCeHoBMkVJIOYm8sUddhj7sHUI=;
 b=akpNQo8FdNjzOrI+hcw2DCihnBbDfz07lwVnaM4WObap8ql17RBEktTOeTvBfXES5g
 YNWp7eBPkWM/hzRrM36z3X2PmxCUNw7+N5V+tZO564MXqui2PiP5gMNst01mgWYMRKMb
 65IjdCohoLTmEO/gvYFAfB/SuBlylp7zrndcBz0Fk6WzO7HRg4Gw5MGAp24bPOUEXJ9a
 R0vHJNUCigRmrV6xBvgPMSvngTMbjeN4Ti0TtQaIgrxXz04l7cTEGJsvzpI5J6i5uKQY
 x0ZtxIICZNMwCmmhHWkyRqsXvCwmsn0eJp/WuyigDg4g4wKyqxriE7CNDTM34DDIgm3D
 JAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2p/wIHMt5QkVq4c2GBCeHoBMkVJIOYm8sUddhj7sHUI=;
 b=5AAsVLOj0SBoaVg++jqN458aBVOLD+OYKGxP2NTyB7d+cXAG2zhza5vz++ovf+kpmP
 9cnodqZ9q6osBTE79QuSc61EhT/pchfIEEsv3Hyn9i1kKpJ19g1EqwF5qcuXQTLC9me8
 P2rMSBb66d9B2JMSBngVG+V2pvwV8i67uOIMoPZQKFbRy8F3hJCsMkHpVjo9SxYw784J
 5z9P2OYzeQDSaziLRfNME/Dm1A2KadUicH3ORRFEoffEQdxcPZHMXxSOxOgAEyYfmjmE
 1nugHqgLgrub23BH49VOsc2zUnwkXsX+b9K/+utWC6kcmtsecZEm81EDGJyzn5cc+cob
 Go4A==
X-Gm-Message-State: AFqh2koIvG1pRJTm9UvYKAW1Z17qsrrJmY8yGeXGysdYPKLAMZsuyQRw
 ePRuq/QSaLfR3ETk8cE9ULfcxQ==
X-Received: by 2002:a17:902:7b94:b0:191:3ebd:c3a5 with SMTP id
 w20-20020a1709027b9400b001913ebdc3a5mr14059728pll.17.1671925124132; 
 Sat, 24 Dec 2022 15:38:44 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a170902f68200b00177faf558b5sm4487183plg.250.2022.12.24.15.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 15:38:43 -0800 (PST)
Message-ID: <0849f5d5-5f6c-f9f4-da05-361bcf914ec9@linaro.org>
Date: Sat, 24 Dec 2022 15:38:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-TUID: HtQF75T9VtG+

On 12/23/22 01:01, Alexander Graf wrote:
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
> 
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
> 
> Alex
> 
> v1 -> v2:
> 
>    - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>    - Include TCG header for tcg_enabled()
> 
> v2 -> v3:
> 
>    - Fix comment
>    - Flip kvm-enabled logic for host around
> 
> Alexander Graf (2):
>    hw/arm/virt: Consolidate GIC finalize logic
>    hw/arm/virt: Make accels in GIC finalize logic explicit

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

