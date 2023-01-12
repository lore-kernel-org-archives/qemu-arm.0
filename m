Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4752660ejc;
        Thu, 12 Jan 2023 04:47:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsv7+NqiyrQWwgkzFRz1V1g5PKI12pTjmaoIx2E96v3H/ngMBYUU/nKfNQVcXzNWp+KyrZX
X-Received: by 2002:ad4:5586:0:b0:531:85bf:362a with SMTP id f6-20020ad45586000000b0053185bf362amr8496310qvx.23.1673527670046;
        Thu, 12 Jan 2023 04:47:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673527670; cv=none;
        d=google.com; s=arc-20160816;
        b=bDP8Ui8SmlRTjch+omZIAm6Tr3gsGPekgM9/nuHxk81VkZZoxpBaVFFKOnZR4vzNrE
         cCeuyBLUMfJ8So/Mp5u7HsSs0W8QJDUDn2YOHw2aFs3QgkRtnXL/XWhPZ5jejv3uoqbe
         DswLxgKsKHGnF4+z8aPgTu8PcUy0kyZcbjBTIaTOJp/lfy+1e9aOl5jq1fKFowRzVH7A
         RAHEf9xcugdyF2AiTBmo2M+LwcRZNkKzLVEQOzop+F9gFXIxNZn2DYi3wmJYvBNB8SyA
         nnOWNWF48mLou+PlepODOg9ZkUiTgZmbt99brPuRG7awvcabjGnlfgE5nmtIDUZi9bG0
         66Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=S38fk2tJJtHcgQic+iBsuH12Ik//PCr9dbdVCIaHrfw=;
        b=vjlI6IMOvnaVh3rJtYIosuKofy/lrZoORE00iQWccqze7YjISH4sdLH5d2av1gcnvc
         iciA+o677tjDERT5W8I1CB1HPx71BRQ3UghxV539tHsfXBt03ws4cBmV8uJhM+YbcugC
         h6Un3Q8pSBRbva8fGpUWVNerOxH+qpcl36p7msaUuzs71rsLUbVVPqUXMf7jkjY7hEvU
         fcAK8FVDJSB9bpzlFlJL+0lXxpZLdThVC0HlXfegn6SuN4lod7SzO0I0lvQaV7G0h8Zi
         a799dFa53AZWhx238Pul9cYwb+ReDMaCN3M6zOoKBMthPBeI5SLQxnWR69wtW0R2w3iY
         GvAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0QMJ2pT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hu11-20020a056214234b00b004ff2c52268asi10031911qvb.62.2023.01.12.04.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Jan 2023 04:47:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M0QMJ2pT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pFwz1-0006tC-IK; Thu, 12 Jan 2023 07:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwyy-0006q7-Ug
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:47:01 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFwyw-00051T-Ef
 for qemu-arm@nongnu.org; Thu, 12 Jan 2023 07:47:00 -0500
Received: by mail-wr1-x431.google.com with SMTP id bk16so17942358wrb.11
 for <qemu-arm@nongnu.org>; Thu, 12 Jan 2023 04:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S38fk2tJJtHcgQic+iBsuH12Ik//PCr9dbdVCIaHrfw=;
 b=M0QMJ2pTlO9yoiHML5x8c8BTmkvTv+iG461EKSsmIY5nSJ1M4mTL8WnUIgnurVlhCU
 ZfSZT0IYjJuEYf/q3vM1FtSJCX3+E9OTqFpshmkqhcP88ZAitVxkWXmItYROj6xhhIn/
 QQ4nCtvqOQyXImAHkbycUXSrgPDZRZYlJhcz5WvqOcab4MYcT37nHklneVICQcDgiuBG
 5B4CyYP9CcljOqkESHIDAgTQev1+P61APdtnG7HXo+3t848azfR7biFVdUpJVuwHizZc
 rgdGE4ermmDMDb9LVPIBXcgEMdwBNEsvTG4HTpzeeRh09zhsIzZA/f8Oi1jMNaIu8Ngj
 oaAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S38fk2tJJtHcgQic+iBsuH12Ik//PCr9dbdVCIaHrfw=;
 b=NViE+giuqZ9b9AodcWmpNF1ppVyHT8j/kfpvbVhfxPZhK1vjelBzzPy2sHj/Ncj3R2
 caOynlScYCs9Zx0PDI9bjkXp3mVkmPVV8bnmb4Zvlb4LCLFBn7h8zI8uHmC3/lq9WLk3
 OPfjkLbEqiIZX3yOdE+ljRMxFshcYF0O9Bbli1Rmmy1ixMmHxxiouOdzGqCk6KAWWIHx
 aDgaCA29hcEzLsoTYaCYRVizlGDofkHaFO6f/zFFMzpSB+z0DPgXRhZAwaAE76QlbGXR
 H5OMgl/7Fmm3//UtzCQhwPF4nr27kBrrLbKU0Gs6RnaFSJcoR7zBkN8xC+N5JPU/0XDZ
 nZ9g==
X-Gm-Message-State: AFqh2kqRXioOxAhwS4e/AARmS1k0Y7V/CRUbtiBKj2mzEYx+TN4nyELW
 bGloNTAGAna3I4O6WTqnmOvE0g==
X-Received: by 2002:a05:6000:1c11:b0:2bd:bcc6:c450 with SMTP id
 ba17-20020a0560001c1100b002bdbcc6c450mr6849428wrb.17.1673527616729; 
 Thu, 12 Jan 2023 04:46:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t6-20020adfe446000000b002bb28209744sm16049244wrm.31.2023.01.12.04.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 04:46:56 -0800 (PST)
Message-ID: <581c8788-80f4-1740-3772-5947647091a3@linaro.org>
Date: Thu, 12 Jan 2023 13:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 15/33] hw/isa/piix3: Create power management controller
 in host device
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <20230109172347.1830-16-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-16-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: DHYZsstLWj5B

On 9/1/23 18:23, Bernhard Beschow wrote:
> The power management controller is an integral part of PIIX3 (function
> 3). So create it as part of the south bridge.
> 
> Note that the ACPI function is optional in QEMU. This is why it gets
> object_initialize_child()'ed in realize rather than in instance_init.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Message-Id: <20221022150508.26830-14-shentey@gmail.com>
> ---
>   include/hw/southbridge/piix.h |  6 ++++++
>   hw/i386/pc_piix.c             | 24 ++++++++++++++----------
>   hw/isa/piix3.c                | 14 ++++++++++++++
>   hw/isa/Kconfig                |  1 +
>   4 files changed, 35 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

