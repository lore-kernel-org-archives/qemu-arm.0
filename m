Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp741743lfc;
        Tue, 13 Jul 2021 09:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyY2GzPTeIGj42jvgKUQCYTasa4v0XUB/BJpTUkVP3njSy5dvaNH/N0iln3/P7dSFX/xYGe
X-Received: by 2002:adf:ce8d:: with SMTP id r13mr6903514wrn.304.1626193475221;
        Tue, 13 Jul 2021 09:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626193475; cv=none;
        d=google.com; s=arc-20160816;
        b=ITQTKW+D6B0JzUlvYqK5qO7ge7hJmutvvd4fJI1SubiEWfWmwAk8A/2gOz83n/P6ut
         YFK13A30q6f2w7n6HCyyAUmATQe3yUexseFmmb21/J/ABW5IenEnhPZyZYlDTYzhIt6x
         DS7AyGpAJdk4AxAUAXR+PtkPbXeSvLUuvjseJdm9QNY5MyG2f0LbeTgGnGp78xbA5Ma+
         WhJLZ2ra59jeomgzDwKhHd0NApcYSN4pzIStaOFuz/UcwHbyyzMEhE1vWSuYC051DuS7
         4jc7XP/4XMJ97lZe2lKfqoLMF3dAq1I15H8y+FzYMUGimxU3xur8V/uhpnYha6xEoLF1
         Wqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=y0vViRMjpqkTSyc4fjw/W29l2Wkps3fOgSDo0DAkqaE=;
        b=xOM8yfChJ35NMKm3Q2KLKH68qZ9nLM3OZ4cpc7esecmu2/lDzETrCyOdZ722AeTbtG
         FaCfrTyRkzREqEH0YFiSbAohceRWitt2Q24VloypOqlMZ5nQ1Sni33TbXaw9l2i9S7rK
         P8dKOPEw6BS5SKyU0X2+P7LIerXX4HAoIi3cerwt2oTFOlHcRBfUK78l+SYgZtue1mFQ
         e+19V9ewlsMtkT8Kltsw3ozciS1HVbwLPi8ugc90CTcxlLhXrSafKt2IfFcmQXTq3M/A
         Bl3Jb+iXrc7d7CoEqmTZWmW7zJLHlr5Y7lqTKoIW1jxiIqBOnK5zzwrgHQe44mLPOtR0
         ifgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sso9tEG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si23801219wrn.321.2021.07.13.09.24.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 09:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sso9tEG7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3LD0-0007AP-BH
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 12:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LCg-00075W-5H; Tue, 13 Jul 2021 12:24:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m3LCe-0001Rc-H6; Tue, 13 Jul 2021 12:24:13 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k4so24931471wrc.8;
 Tue, 13 Jul 2021 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y0vViRMjpqkTSyc4fjw/W29l2Wkps3fOgSDo0DAkqaE=;
 b=sso9tEG7N48MyijDvBMndpac6VMzwkJE8i9JqydrLDJSHQme24+5uDRH7n4SfAjbHl
 dil+jdYn9JzHDw7+ng8IGIcUavQnv9sAli2E/8viBxiOkIPqqiOddPQcYDKJz+Blszub
 O+PeHuwcO1/ppQ/quAty5Mz9Xy9nuW9Hm+Xw6G9wt0l8JpmRDFZJIRbyBCEMqwz93YiN
 6xhXBxXc1HKI0DU22m0MV4WtQtIcDdQ4Owk4fKP+uB7iv+O3usPDWjkS9EHNTlXIF3MZ
 Ar9pq/l9xkX9rvDCvg+k7Fhg7EzRwyh0MG6f96EOoCYvbm2/VDm3yu1a45aRxScLCAMp
 G4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y0vViRMjpqkTSyc4fjw/W29l2Wkps3fOgSDo0DAkqaE=;
 b=J7HSVrqjKf2paLMf8eL4dBkszLbWHVnWUXj9FRi8wCd1otNPzcQkzvwb4C+YBGo2At
 awG61HwqEiOEHfrvLo8u6i73nnXS5ACtO0aX2ULpS7EXlT+MkQIOQDp6HmtPAAXpJB6Y
 dzGi9ICSsNNg66lBPm2aMj76b91RG6mD1jmgThoqO67uMyZGPweRd9zmlH2MtyIwW7xV
 hhcVXWnE0T+w7SEFdFS/I57ancJu+jbZFtocIJEp72VWbSrXQvlJqwaWS2bO2O0L+K47
 frK/3T4Sm+Z26kTsdXvvsMDvumj2VWFdD4FDmTm8H4gP0Mf9dtNB4pWein1EA8yUkABa
 dkqw==
X-Gm-Message-State: AOAM5312w7bu7AuDCZp6nK/GN/rlL1JkASwRfEaGEmHG26yQXz/AkAGI
 LeGCckEBcwpIsYE2EC5UOhA=
X-Received: by 2002:adf:d0d0:: with SMTP id z16mr6981176wrh.29.1626193450336; 
 Tue, 13 Jul 2021 09:24:10 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id c10sm15762692wmb.40.2021.07.13.09.24.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jul 2021 09:24:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] docs: Add skeletal documentation of the emcraft-sf2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713142226.19155-1-peter.maydell@linaro.org>
 <20210713142226.19155-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89083c7c-be18-cbc4-c7ff-edd83b9fe37a@amsat.org>
Date: Tue, 13 Jul 2021 18:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142226.19155-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.368,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWLKRYhL1+W0

On 7/13/21 4:22 PM, Peter Maydell wrote:
> Add skeletal documentation of the emcraft-sf2 machine.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/emcraft-sf2.rst | 15 +++++++++++++++
>  docs/system/target-arm.rst      |  1 +
>  MAINTAINERS                     |  1 +
>  3 files changed, 17 insertions(+)
>  create mode 100644 docs/system/arm/emcraft-sf2.rst

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
