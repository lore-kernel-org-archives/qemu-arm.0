Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3568292ejb;
        Tue, 19 Sep 2023 05:36:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1dSZnxovvMgxrezbkZEUT4tTszwf3KI5WPUvVSZtQruJdZS1UIRHAk3Sott8z6YhzcCvP
X-Received: by 2002:a05:622a:1825:b0:406:804b:e0f5 with SMTP id t37-20020a05622a182500b00406804be0f5mr12504453qtc.55.1695127006850;
        Tue, 19 Sep 2023 05:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695127006; cv=none;
        d=google.com; s=arc-20160816;
        b=MgKt63j8YMPv0blVF0Xri/VtCa5X3r7SONYazeLwkFcXhYo8wlWytqDY1tit4Hjqxb
         8ifdBczMVh1gtoK08BuSVR72kbFPCqfBbxuUhOF5hZPLX7EfD2MVR7iT+Kpamn4H594H
         9OuParAwCLeb4smGxSIGWTbrzVGV4EU4j57UnNPQW7wBmEzptfP6HPdjvourbEqbEB+l
         4+OAEajWUxDr+xFX1gjPfcJCylZBSyO5jACrI8IqVhjOxr069nWF9j8r5uSxAhkpxcQw
         a02+PpjqXA3HCEEDLhAXDzObwMhyHvd/z1NpQ/pkFQ6gsybhZoZYTxxGxQ1biUVBUZXn
         A4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pb+pQ7PwPFI0QG+pBAXO1Xj93Zy9/1Tdve4LBccWQ7I=;
        fh=WgU4RIz1yY/4SZCKi9xa0Qpf4wNbIl3M9phtnl5j6GU=;
        b=02UOtzIF+L7pqrfJnNtkmSWq+dlNv6VrOUZo+FPSiNFsRs4GEVMSgYN0hih7IyPdJy
         mjNoshB/oXObs6+gWQXo0Mw1ZbodCoNQAnYx2wc5bzBqaFf/UxrA3E2b9LcEwoLRYZNm
         nkFgEoJMAdXgvhQCyhMVvYwzJl14oi4Bya8EeqcGVjliz1gBcK1mV5/V4NNL91jS6vxc
         qS8UoAACGCBqy9GyPvs55L7TdZNzP13DmNqhrNdd8VgfDJCPoeR0/onTULXg3FzrKOSK
         ATyXOjQpJ2JloSPZ5vvePSk6Rwof2uYrvEnH1taFT3KLHmvWXHp6HPKE29oy8AZHA2gT
         0k0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+FdbSps;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a199200b0041794456e59si6649317qtc.789.2023.09.19.05.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 05:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q+FdbSps;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qiZxW-0007yy-Lr; Tue, 19 Sep 2023 08:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiZxJ-0007nv-F7
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 08:35:56 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qiZx6-0000eV-4I
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 08:35:52 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2bceb02fd2bso89542091fa.1
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 05:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695126938; x=1695731738; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pb+pQ7PwPFI0QG+pBAXO1Xj93Zy9/1Tdve4LBccWQ7I=;
 b=Q+FdbSps7YhueAizPN92vkC4AlhwIYBFwLclmr3TzWdM/7ddk3YiSnpw+QDILuI+J3
 0AkfCMwwZcAHmDxfQa9PPEOrDmTUCeLhhhkLMje44nUQf2wojNqSqDsKw77mnEd+JVKS
 qdF1N/COZ5SL2JzVnyTp2XobPr3S1nqzJ22FYIxt8GY2mtE0n8DXhdnvaWLwXDp18jUO
 Gl4raSJ438YRJLWlE17VuUGTGkp9lF2QJcNmM9tnV3vqvXF0SLNOjef2LzeSGi1NanMx
 ce8wJ+eMk/qE0AFhc0/FNmf8vV/wlg5JWElsHjKLSpz9hcK0KYasFTHA4WmYwgh2gYQz
 Oshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695126938; x=1695731738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pb+pQ7PwPFI0QG+pBAXO1Xj93Zy9/1Tdve4LBccWQ7I=;
 b=Z4/Nrs+xSN2IxkE/5IRet1OJwNs74X/PKkPZDfAQ+3Cc+DCBE+oxn0zhoFrBztR/9m
 ZvmxK0ft4uJ5Dhx15egrx5nR7mQZwdWDDhh7fSFyErzMvSCL0O2JibiiGX/HWdyWe/pP
 tihFXAfpF4fZ0f+9cN1p3E7gtciz+kpEI/V+TDUa6sLg8FBgmjBkGklKepJel55GADY6
 9v+CrxsT4MMN5+iOJ/byZ62BI44tVCB1184F7QU/QlO8JCHDbCnU1peaS6mcGcH4u9wT
 GvD9XjBVQNm0aWj18nT01uGIcqJErhqinocEHRW+iPvUhFzmHqMeldTUD2BOn/jUr7QR
 vPdA==
X-Gm-Message-State: AOJu0Yx7U74nUMQ9qbhxrOfHDV3URThGvIEhjTrpGrbmrUibZyVLbWBu
 dsLzXj6Xx6hqxqv1bbFZ45ndqw==
X-Received: by 2002:a2e:88da:0:b0:2bd:10b4:c3e1 with SMTP id
 a26-20020a2e88da000000b002bd10b4c3e1mr10513999ljk.19.1695126937649; 
 Tue, 19 Sep 2023 05:35:37 -0700 (PDT)
Received: from [172.20.41.70] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212]) by smtp.gmail.com with ESMTPSA id
 f26-20020a170906495a00b0099d45ed589csm7675864ejt.125.2023.09.19.05.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 05:35:37 -0700 (PDT)
Message-ID: <06ed6fa4-1891-998c-f962-bf5a635c23fd@linaro.org>
Date: Tue, 19 Sep 2023 14:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 00/15] hw: Use QOM alias properties and few QOM/QDev
 cleanups
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>
References: <20230203145536.17585-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: mh5kGKn/Yge4

On 3/2/23 15:55, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Addressed Markus & Zoltan review comments
> - Introduce/use qdev_unrealize_and_unref()
> 
> These patches are extracted from a QOM/QDev refactor series,
> so they are preliminary cleanups noticed while working on it:
> 
> - Use correct type when calling qdev_prop_set_xxx()
> - Unify some qdev properties in MIPS models
> - Replace intermediate properties by link properties
> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
> - Use qdev_realize_and_unref() instead of open-coding it
> 
> Philippe Mathieu-Daudé (15):
>    hw/pci/pcie_sriov: Replace fprintf(error_pretty) ->
>      warn_reportf_err()
>    hw/qdev: Introduce qdev_unrealize_and_unref()
>    linux-user/syscall: Do not open-code qdev_unrealize_and_unref()
>    hw/pci/pcie_sriov: Do not open-code qdev_unrealize_and_unref()
>    hw/i386/sgx: Do not open-code qdev_realize_and_unref()
>    hw/ppc/sam460ex: Correctly set MAL properties
>    hw/arm/nrf51: Alias 'flash-size' QOM property in SoC object
>    hw/arm/fsl-imx: Alias 'phy-num' QOM property in SoC object
>    hw/usb/hcd-ohci: Include missing 'sysbus.h' header
>    hw/display/sm501: Embed OHCI QOM child in chipset
>    hw/display/sm501: Alias 'dma-offset' QOM property in chipset object
>    hw/display/sm501: Unify common QOM properties
>    hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
>    hw/mips: Declare all length properties as unsigned
>    hw/mips/itu: Pass SAAR using QOM link property

Ping for review?
