Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp230942lfq;
        Fri, 11 Sep 2020 12:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySeTnNvg90ahu0rHW95iUJWt3vJYa6SX8b/sTXPMZUR+Vy3egkEq800YRO3L964HGwCh1v
X-Received: by 2002:a0c:fa07:: with SMTP id q7mr3517544qvn.41.1599852687990;
        Fri, 11 Sep 2020 12:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599852687; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvBRfFDyKyAcMQucD9QEUza7n7wkxfCGYs7BGHxGo317kUq9LjPy/YnziwHhEte8/T
         Se6Fe5fmAdHRylF/KaAQlZ85p1XLlwKZXJM073n/92cgzgg3ipkFPAamMjYAf5D7UNlJ
         K9ba+Xz9cYNUF6kLYaM01VVsnnVOPA86sxPki1Sa2haJYiS1hHZr+lDjqJ69a01kRJDb
         MObTYcnqNxRnrs0XMyzchPPu4Cjjo/qrBFp1FqITEqoAtFOUZz/hCSGxU/DYQqjM+C+M
         sFIbqoCz0yexOO1D35epycdH2Hri3bgYkrGwSvtdHXClOIEuB2a9lkRbDUcg2+jnAsqq
         tiRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=usATbnsxBfyROwMGhdRNBcqSCczeQ7SDXK+1UdsLuw0=;
        b=Bt8eok7zSNA5nHw+nqfErAKCrDwvuvcBZdq9ReHmVcInJS/TmhFj0vit/WMp4Lnc3p
         BXGIeM+0GWlGoouL180kjCSbiPJUjUEV1JV/ytafWfpWxhpqswuPrpjAs0TTbe4Hti4i
         1PBrCGxnbh5H+2YtDbVutnhNtEEO7Daquho2LQswi0AHPxEZyba1yst68mWtW/3Ua9Jj
         Vz60jwbM3rx1FypsrAdem+uO7SUJGel4eW4TO1WcKchiNN8cGNchbPZEcgXCxUZ4VBP+
         zUrWVcODO4YrTBiUgA+eIvYRhpqQYAxe1Pm+ePXyQ/jw2cR9lFbUFP8Fl0duDbsI1/SQ
         7+Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VP9tR9Vs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv4si1879389qvb.148.2020.09.11.12.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 12:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VP9tR9Vs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGolb-0000DP-C9
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 15:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGolP-0008Vi-16
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:31:15 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:52799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGolN-0000Nx-DO
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 15:31:14 -0400
Received: by mail-pj1-x1041.google.com with SMTP id o16so2191562pjr.2
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=usATbnsxBfyROwMGhdRNBcqSCczeQ7SDXK+1UdsLuw0=;
 b=VP9tR9Vsj4q8Gt1vEUsUOhXv/O0kOP7r5ciWbVHII1aJKr8nUnJ4hTqaB+nBxThsmb
 HHGEqjvZ9efz8DVJMMsmKsGReWqM8sYZ/9ovb6kVMia6ZWb999nZF4O9dMrnSlBJ34Zd
 9qHQa7klgmjA3Gyjlf2Kqg9zJC+LGIQoMqwPyTpLA6bdhS2gGJno95whSwNYbFIb5j8a
 KHA4KW3rGCEliw0EiEh4SgOViz2O7q6TkefO5zuaQMq1yAStxeuV9ME8CKfO02JejfLt
 /EPedbfcLYPZl642AECWqmOJx5phGLQaXgW9mrU9o/UTXLrI1a+QleqJc6K8DyJD5NLB
 EzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=usATbnsxBfyROwMGhdRNBcqSCczeQ7SDXK+1UdsLuw0=;
 b=ASqS64TulfR+/H1IPGrr646GkpJXNLMHNTs6aCO+HUv1SJJ9LQBdFgbHQ3c3zmOZnt
 FI0DqsWVMnBrA07j8qZGpBjeeGyXqVOq3/GchxmF4Iz7cc/zoh1l3nKCzKm43/qRRyPV
 eH3quTE2SivRPp/cm1l2arzNRIr6gY7hIkSLEyk05+xqFkXVsyfeaGBsUBX825KcpL1V
 ajL7qdvgMCNOUWXXGPOfLwIVrPSoDXMmA20+W9Up7vDwc4QpCXFCFJQXmhDwK6gzODxE
 iIe5Z8/EIiMNntmC5YtzIbPVP7bKceC/Y6hTA5BJDZtdJZF9N50TnxeMsmFPdmhet7vS
 emNA==
X-Gm-Message-State: AOAM532JF0HbOP/bwvaiXvhB7fee825OFJvpp/IW4eTkhNu9xNYqaD1q
 spjbL6aE1n6ju8R26nO0GqxDaN4nSUle/A==
X-Received: by 2002:a17:90a:1f43:: with SMTP id
 y3mr3524245pjy.28.1599852672150; 
 Fri, 11 Sep 2020 12:31:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id nl10sm2417049pjb.11.2020.09.11.12.31.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 12:31:11 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/arm: Add ID register values for Cortex-M0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200910173855.4068-1-peter.maydell@linaro.org>
 <20200910173855.4068-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b22fcb17-f38b-e699-0c33-a3055d2427b7@linaro.org>
Date: Fri, 11 Sep 2020 12:31:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910173855.4068-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
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
X-TUID: 76JDmza2qkuu

On 9/10/20 10:38 AM, Peter Maydell wrote:
> Give the Cortex-M0 ID register values corresponding to its
> implemented behaviour.  These will not be guest-visible but will be
> used to govern the behaviour of QEMU's emulation.  We use the same
> values that the Cortex-M3 does.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
