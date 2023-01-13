Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp622472ejc;
        Fri, 13 Jan 2023 11:21:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPc6dCAxy2Pz9bsHylIzX0vat5XYI0hYjXHXGLlED4Q/ZwlhsnDMdzMp4xfswC9dT+5DeQ
X-Received: by 2002:a05:6214:2b9e:b0:531:92f6:4bb3 with SMTP id kr30-20020a0562142b9e00b0053192f64bb3mr77101311qvb.50.1673637664420;
        Fri, 13 Jan 2023 11:21:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673637664; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBYxGz5Wmao9FWS8hlDRwE9VqgoCMdpYyCOLqBX9uCazRXN7QC4HMZL3+kTk9s+3dh
         +k0m2J0E9Bah198Cg9pg2VIXjtSJXkeRqEOeNApwnlCHDS23bh1wpmW5YsVRmMv5B6mg
         PEvsmYir5c69f8MuIH4EaAMMQr+NtpDFhnrThFz5O2K8BR6/LXRixw39lp3Z7KQyTlmi
         DuN7qk7JOEwTvKlcPqoBKFaXzbEFZ9GbgqorSFQuC9nzYXsTaZwKrMd2eXCvjKzwJDZe
         S77PDOML3fX8qjBqXhIcVj09Fkl3t/IZyn91N7yMe5iTdMfIMIbz8GNVXpOvSq+CalVA
         /3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kXa9R5xB7y2gNG/9s3BDnYDPFcXLhmiSz7dWIOzeb/w=;
        b=yHMc2BYi4UkX4R1SLGJ1XiD/F6Y2bga0OJtOQoW/BxRCtHS1vn18FHfCmlbIwcuhsI
         wRQ8EJIv8d4ZD+tJDOV9b8APTaBCboWZ4SqJg9aTWNDvaB6GSiDq77OdvlufqQtLrSqr
         /IBwZdcvbcLh9MtBT3cPq6Hygtitn4wJMS/xV20h1gGbbKWD2g/JDyZlcWSWfRHIlZBP
         V+/iW1QPvTK93OSnoDxkvHrV9KF9MSiEd0hwvJeOC7G44iyGTm52rMjCsjAsCNsz+u1K
         VGR7JdFZxsRnjQ9l7EAonP8nZov0+Itv8XH7GeZXHTK5+yoOacdZzIZZCVYeS+cOO3Yh
         5CSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhXHp+Wj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5-20020ad45b85000000b00531cb2c4c09si512372qvp.300.2023.01.13.11.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 11:21:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fhXHp+Wj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGPbM-0006an-VZ; Fri, 13 Jan 2023 14:20:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGPbK-0006ZH-ST
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 14:20:30 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGPbI-0006ZP-8W
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 14:20:30 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g23so8801458plq.12
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 11:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXa9R5xB7y2gNG/9s3BDnYDPFcXLhmiSz7dWIOzeb/w=;
 b=fhXHp+Wjg5X7om/gU4Lljdb7HPZn3iBMN5TvmdGo7HFTsQ50frYpmxl9iBZKtW93rN
 PLMF1lvn1QJOJ8E3UEuZRR/IWjOjB6yYUVzriGTh2duABX3MoCu4C33vF3vY+ndkVJiJ
 JaP024nTBTueEzUiWU2q6rQQfBV1sUGDWnur+6d8KlMaWwzi7DVrYJEf6Y0pqKATUBlH
 ZNIORuQmZbGELCujK/9Zkl5gVpFznUuN1IIh/1bN/kUPv7IIO6wn1P0utDe6wnkrIkkA
 N6H9NvK41K8cOZ4ZIxjkF/cdTy6od2cx46TLRZfMuq0yqRb6inT4hgpJ9YrMX/ynGHHn
 lxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXa9R5xB7y2gNG/9s3BDnYDPFcXLhmiSz7dWIOzeb/w=;
 b=QJK6BzebzwWAbQkyLYNdS8UxAt/pgR13fFXQB+XC849BdNdinfW5OQzdnw2i6GcuL0
 6cO6wKN+xnjGKkU4mchD+XzARwRelnb/XrmVRdNos6F+DmTfYFdiOSYXwZn7hsRDohgY
 x65+Euz4uInwL+461FFmKfBRrZug+WVy25V6zNSdFTNtPD61o1fUL+ZNbGgyxz6AvdJP
 SoqLFac70sxWNZv15kOO+T5jZtYF7VaplTT633iwC8Z411lj+nsms0dz/3IabBFdrUCs
 jA95R8fvW26I+SIo/0QY/KFw+tsjWulPhBJg2u4gA/2vEJPP3bAs4WnQRN5fIK8homdm
 YWRQ==
X-Gm-Message-State: AFqh2kqlN+i/ZVLYj3Kyd29pkNUstOW9cWlaeFYAqCVTIkpxwCFFd6iN
 yn7O1A6zwvsLPMtdgSnGDiaCLw==
X-Received: by 2002:a05:6a20:d819:b0:b2:3b40:32b1 with SMTP id
 iv25-20020a056a20d81900b000b23b4032b1mr92074700pzb.57.1673637624926; 
 Fri, 13 Jan 2023 11:20:24 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 e17-20020aa798d1000000b0058ba98f16a3sm3281267pfm.171.2023.01.13.11.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 11:20:24 -0800 (PST)
Message-ID: <21a11ed5-839b-d466-86bf-571fb473d56f@linaro.org>
Date: Fri, 13 Jan 2023 09:20:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/7] Trivial: Mark some more files as target-independant
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-trivial@nongnu.org
References: <20230112134928.1026006-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230112134928.1026006-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: VtiQSVddcj0C

On 1/12/23 05:49, Thomas Huth wrote:
> Philippe Mathieu-Daudé (4):
>    hw/display: Move omap_lcdc.c out of target-specific source set
>    hw/intc: Move some files out of the target-specific source set
>    hw/tpm: Move tpm_ppi.c out of target-specific source set
>    hw/arm: Move various units to softmmu_ss[]
> 
> Thomas Huth (3):
>    hw/cpu: Mark arm11 and realview mpcore as target-independent code
>    hw/intc: Mark more interrupt-controller files as target independent
>    hw/usb: Mark the XLNX_VERSAL-related files as target-independent

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
