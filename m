Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp656044lfy;
        Tue, 4 Aug 2020 08:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfoOKgbszOY1XEGom0mBdIy+/M9Paq/ImGNiKBPdmjTcil+tNDxVfivvwXsdykSpEf9w5Q
X-Received: by 2002:a25:680e:: with SMTP id d14mr34907159ybc.15.1596555997525;
        Tue, 04 Aug 2020 08:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596555997; cv=none;
        d=google.com; s=arc-20160816;
        b=VByQVzyIAI9WlWmM33NJBzNvgZg43+hiEKu70HZQPUHrosBv1ULDD+Lw/67K4qjsw1
         BGHb6kfqHQCYh98DyuULzK3sASNu0jFH3QIdrqAhYPMUcIG8oXcs9nNLNNRqMmtr2mMp
         ryh1PRA0BflgsYhyXCTHzIlWeC3YsflpjuvxLiKXOgwo4l3RHh3v2Ku1vfO6HtACCaOW
         N8bObMcnu7Tc44OTmdUvOiKEVN7Rkj/IZU7/kuY8SsnhXL+FvbkmTIPy5SuI0O94CyND
         obj33oMuFW7K7BfOghkdvq6YjC0iAUtscmjq15htlAB4MwiMj4gj8uLjb7dxtE2/Zx8H
         tKRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=b/Xca15rvh3n0v8MEiQabMTRXvyQ9jQTCuAzEkAyiX8=;
        b=rs2/zdlJwDuQNZeCd8gysNr7ZqA5ZfaDPE0UbLCqj32i440qiQ37oMNIrgFocY1HR/
         w5KUl45hNz97y1uwrdUcJpry8uPxd4MOnnGsYZjmdaT3WhKMPp+QMplxZTMyg3H9SGPF
         ataRnUM7JYOhnADCrbvxrlCqXFvq2KBjJw/Nk/k5VkIRVrmx//oT+DvwdIZwA8G+t0j1
         xScf8kM8YJ+j+NYWda3V8MdWlntX7JOSJBatx4jkd6mpoqpERdWpfJbXn5BL8SemhKrG
         03My3R9sWhKoYPPTvhQHjoUp/dFFMr7gqdFSRSlvLbxo29CPnVxF/3+/3DXp8EW2OCk8
         2NAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkU4s9Vj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o133si20462825yba.292.2020.08.04.08.46.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Aug 2020 08:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WkU4s9Vj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2z9A-000601-Sx
	for alex.bennee@linaro.org; Tue, 04 Aug 2020 11:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2z8y-0005zj-QR
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 11:46:24 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:52731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2z8u-0001Q0-Hw
 for qemu-arm@nongnu.org; Tue, 04 Aug 2020 11:46:24 -0400
Received: by mail-pj1-x1041.google.com with SMTP id kr4so2338956pjb.2
 for <qemu-arm@nongnu.org>; Tue, 04 Aug 2020 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=b/Xca15rvh3n0v8MEiQabMTRXvyQ9jQTCuAzEkAyiX8=;
 b=WkU4s9Vj8WvMb4rSSwR+IUnr2wcVowSXwsS5E0+T/WxzTmOIBy8GoM+qx2FyGWzM4+
 zNJwPh/W2ixzGmve8erMEAD9OKwC0NDDy5TjtJ6OPBmnBSZwpoJgfELahvagHJGtyrR2
 Hg/VctIAJHYei87wdYsJ/qqF2/ttK0XtAl6J6k+VxJyE6kNn433V7fe+Zjh3DTuN1LBU
 lBddsQc67mSaZDvaU3grDnTVpbAcUTdRsW+ZgG8gYr9FHwDShntae38PvmAfu2/Qeb6R
 RzdHEeQZHwA3MuV88nAOGhfhM3Lql3EFippKKI3O+WAmw0tx7loMwbFW7WuzDT1+SVk/
 Qugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b/Xca15rvh3n0v8MEiQabMTRXvyQ9jQTCuAzEkAyiX8=;
 b=tSkRjWZ+kF6ryxi3o8GjyILcb/lwFEMKg0Ed0W7a6aTe4tfX2Xdsqr015U3+rluN95
 wZ287e57AQ2UYJUITCTCY0VKEDx2pjYdLZg9jcwldnlRHGlSrz6Y4IgQ2/f7kxAM9nHl
 omxTja7ImsiXwhwLgTPDBFitL8+wcc6cnm6y821IHPySVJPg4gng7W+iz2GNG+KYOq/F
 ruujYE/TNdx0MzBGmVSQ67rquWn8uCbIo+441Lzgl70BizFGFtlt2XmlcF+VLk0HrSDD
 kS7gtqKSdpRL3ixjKB0YiOh0iIRwAMycl1PIXw4Mald/WuiTA1ORlpKod6sn7qa1VyZY
 ZpPQ==
X-Gm-Message-State: AOAM533tFpMlRemZgmmQdo4WAwxelA2mJzd5h6AVB+G2YEnTVmkkBvnh
 NhkgNCa8pQyAlctbI402wop4se/14Ws=
X-Received: by 2002:a17:90a:d583:: with SMTP id
 v3mr5045280pju.33.1596555978715; 
 Tue, 04 Aug 2020 08:46:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id u40sm3299456pjb.39.2020.08.04.08.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 08:46:17 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Fix decode of LDRA[AB] instructions
To: Peter Collingbourne <pcc@google.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200804002849.30268-1-pcc@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d966244-acaa-5f69-5148-414fb63871d8@linaro.org>
Date: Tue, 4 Aug 2020 08:46:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804002849.30268-1-pcc@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uzsmic3vo4fj

On 8/3/20 5:28 PM, Peter Collingbourne wrote:
> These instructions use zero as the discriminator, not SP.
> 
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
> v2:
> - fixed commit message

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
