Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2972701ejy;
        Tue, 4 Jul 2023 08:11:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7cKboksaaXQ7r4ZofEsZETrs6vPZhJdiXzluFmZseiA9oMeqkM50Spz1cgAYzpNC+a8gvw
X-Received: by 2002:a05:620a:44c7:b0:765:6556:1113 with SMTP id y7-20020a05620a44c700b0076565561113mr18864975qkp.46.1688483482908;
        Tue, 04 Jul 2023 08:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688483482; cv=none;
        d=google.com; s=arc-20160816;
        b=F/Sx/0rI34qMON3xdjpn1oK9iU5viMi7/EmC4tc2qNGWfMWgiSd1D3jZEKEZdNUSSf
         OW2Ohha4O+O7LyY7kq5SAz/DdQzP1dI9EmDP7xzxR5fjP2y2ccEdVd2tLyhovtFqqVQM
         pXcbegyoV241osT9JbI4IZix0M3epqdUuzcCNIFcOEC/E+l4ZPI9xBjha/iCSbdiD2Vv
         zcQen3XCDMmr7GHl7j7WimIzZqX3jqNWucwkfXxJj+6DCIU6zsVPUCA5BWiJbghccLkh
         p1UmCFUrM6W49ube6debC9/Y2hekpKvMAF3VA0HcjdY28ig+BLkqMfjShis4nGe6trxa
         Cs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YxJNamGujTqekxZv8Xd3cZEGe2Qa01rUdrndG/LwTHg=;
        fh=vuiccIXlbkYqhEDRfaocDzmDDzNUKdwjCQW6J+xHLLk=;
        b=at5e09LKyUEBohNxo9S76sE3nlRKiKMbqGAkWyE06SSEX3U1ZUjSoBcFBI4Bcm0Lhj
         /hI4gQ1MzBcVqXmDfGAbvR8dHF+RwlZZJBxgQrAUvKRWOkhHu42U71DHU6dyvT09zl3i
         avi/vZsfwqPkWR3GroMxfM7T79rjF/1624w3G6lwLeYKYBaAVQqmhTUMpVCDQkgphQ8s
         O1TnttUVBJeb+Ff08hc4Dm76Cn8kDnLvkuXjHKaFmysFm/jFOugplNbWYY4RGMgxl6ed
         G1gPRmpFX7M41jC1vG0zLnU9SgttfZqDM/G1l8MYa1b6uT/C0mUi5AJui3LU4s1SmAAD
         y5zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8JYDqep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rj10-20020a05620a8fca00b00767003990fesi10426641qkn.70.2023.07.04.08.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jul 2023 08:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J8JYDqep;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qGhg9-0002FQ-5i; Tue, 04 Jul 2023 11:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhg7-0002F4-LT
 for qemu-devel@nongnu.org; Tue, 04 Jul 2023 11:10:55 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qGhg5-0007oL-Vd
 for qemu-devel@nongnu.org; Tue, 04 Jul 2023 11:10:55 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbca8935bfso43670955e9.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jul 2023 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483452; x=1691075452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YxJNamGujTqekxZv8Xd3cZEGe2Qa01rUdrndG/LwTHg=;
 b=J8JYDqepJdiWyP+0XzWYCbPsS+mgejtAfCZPo0mUpIJdJkCBah2rGTO7yVRO9oWnLN
 3IsVqJCuTOSuG39DRW+riEd6ZOlOX8ZchBgbnkf91eJMZ+6A5F45E2q8SeLO5fb4etz1
 PA8nj0RlxgA9HKAah8H1J1IV/o26RbXwUVW+PYtShhoTQBaeuOGSP+H6//xFLubVcsAE
 vlikXZKus43CGgSj4pS1YLttzrC5F9ngnsovk2C0T1/5yb255aqoHSIRXVtKUcTvgyM7
 squChmaCfH6jcsrTi3hz4vIJrMcxv+jFG3I6LloNwXLwQnl7xpjbeHq/zz4vVpfH4vj7
 eMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483452; x=1691075452;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YxJNamGujTqekxZv8Xd3cZEGe2Qa01rUdrndG/LwTHg=;
 b=NMfSG5Ls0N0K/4J9pBqGKqyk0xT7u6ySrroPFqTX2HngHgz72ERzkkBhSLYx/mT6B6
 zcUox1A5pFjEbxeogXMCfEB1gOYMa/52SYoGPntEFzkAJw3V5o+2yLR3SMA+9uu6v+Ag
 QlPZbMo0CG3NRTI/Hns0d1c3FUAtTd0d4CfMt8i6t8d4cgVYndul3O2GeFp9Wp5pnOKx
 vMUS9fgBCFo2nY9+gJ0ShDd0Pm3D9bkYnVxItnfUyJGSC/COlYf8j04gHCrptip604UR
 1HKcxN/Q8ChmB09S1Z1LvEF/a5wL9FSCqLVvL1T86RnmMYOsEQovwqqNIIJvs+jHqmD+
 zA2w==
X-Gm-Message-State: AC+VfDxJsQ/iDN+P/jt6yvgfA4O31f4zNyw0JARKUKG04/l1AoLwLiiX
 adlPXJgZoXE+jMeai8Jql8uMUCkyTNSFkxboRxg=
X-Received: by 2002:a05:600c:218f:b0:3fa:a6ce:54ad with SMTP id
 e15-20020a05600c218f00b003faa6ce54admr10894221wme.6.1688483451885; 
 Tue, 04 Jul 2023 08:10:51 -0700 (PDT)
Received: from [192.168.1.102] ([176.176.157.122])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adfe88d000000b0031438257aa9sm5192187wrm.36.2023.07.04.08.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jul 2023 08:10:51 -0700 (PDT)
Message-ID: <af213c9e-aadc-940f-2850-c4127617620a@linaro.org>
Date: Tue, 4 Jul 2023 17:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 00/19] hw/timer/arm_timer: QOM'ify ARM_TIMER and
 correct sysbus/irq in ICP_PIT
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sergey Kambalin <serg.oker@gmail.com>,
 =?UTF-8?Q?Thomas_Venri=c3=a8s?= <thomas.venries@gmail.com>
References: <20230704145012.49870-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230704145012.49870-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bX94nIXMHLia

On 4/7/23 16:49, Philippe Mathieu-Daudé wrote:
> This series converts the ARM_TIMER model to QOM.
> 
> Doing so we also correct an abuse of SysBus IRQ in
> the ICP PIT model.
> 
> Since v1:
> - Added pm215's R-b tags
> - Addressed Mark/Peter review comments
>    - Drop '*State' suffix from structure names
>    - Use OR-IRQ gate

(forgot to mention migration normally taken care of)

>    - Drop sp804_unrealize()
>    - Implement Resettable API
> - MMIO-map timer regions into parents
Also, from here it should be easier to add the
ARM AP804 used by BCM2835; see Thomas Venriès's
patch v2:
https://patchwork.kernel.org/project/qemu-devel/patch/1507728290-6062-1-git-send-email-thomas.venries@gmail.com/

