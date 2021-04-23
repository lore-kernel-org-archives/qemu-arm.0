Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp875442lfb;
        Thu, 22 Apr 2021 18:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyeX66uS6TZzkpQlQ/hcmECYMG+wJ8eXVddDEjwNiMoPaOZc25RakmT7EzuWRx1ComYTAhk
X-Received: by 2002:a67:6804:: with SMTP id d4mr1513227vsc.23.1619140128754;
        Thu, 22 Apr 2021 18:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619140128; cv=none;
        d=google.com; s=arc-20160816;
        b=fb4S194lx1IWkZ5iQJMM+lg1E6EgFRPymkjIv7t8ZpyoHrjEkcCHB9t41d/T+at5ee
         j6f6TGChjmvBZnC+F6SjgkSjl7IA8SWyRfCN52WK5KG6rHwEI+iLaSCkzuT8+IsvIp8G
         E9xOyMtAKlqGL0CF/aXC4w7NOd42AZkJuZBX/QNqKydzMNNoQo9MROj56cwGH3ShqDGd
         uyeDTrTEikMaeymvBCNtA6skdsS1HrUYxlDkZvSi2jYQopkTWBAqyS1ZSFy/iX8qAuPw
         8Q7HM4fYx/zrsdnLczuqZvIlDYyalsOhAiecNXfavB75B5BJE7QSXo7d1Lik2KRNWF68
         YZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MUA1k1tQg1EnwA+MIy/CWrOl/o5O27lSJomM1qJOaAs=;
        b=gFzZBnn0WybvKQRdzqaH5dPK70NHSeB2iEgtHjDfiFEA+ehAAtDQmhNawJzNJ3nho8
         DCl02GRtJslPlFaieno3RudTyWlrPdQzuQlSnM2UUKPAedqBgy2j55P2BDjphZRrj8E4
         Hy1tGLSCtmYxZirCOLDFmciISdMJsK2YFR/zd2bpYY1taiAwNHtM3USV47ZuylFgFnRO
         J7LrV5MPhVYpkbvqkakoIHyCQ64xXLWIyxx10qRsknzcxWj1iAkFclsL+8/AO3WpE33L
         xLaW7sMU5It8NFcqSJcC7ETCA2d9i9pHasYw74K13wEMcEbavjLeej822qWCVSNWjy0M
         eaNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pnT/8bjs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si2306193vsq.295.2021.04.22.18.08.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 18:08:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pnT/8bjs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZkJM-0005Av-3O
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 21:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkJB-00058M-R3
 for qemu-arm@nongnu.org; Thu, 22 Apr 2021 21:08:37 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:33691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZkJ9-0007r5-1N
 for qemu-arm@nongnu.org; Thu, 22 Apr 2021 21:08:37 -0400
Received: by mail-pl1-x62e.google.com with SMTP id n10so13282250plc.0
 for <qemu-arm@nongnu.org>; Thu, 22 Apr 2021 18:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MUA1k1tQg1EnwA+MIy/CWrOl/o5O27lSJomM1qJOaAs=;
 b=pnT/8bjsgEEWxFHCr+twW7LgZKTX/tnYgXMyGZQXPlkoJjszgQuw8iiG4f0WO/rLWc
 cqdCtwRTLIzn8tCtei10iObK9KlCP1xusdV/yWOGIz677PVV0SoH6kLJo/YQk/zFDVQR
 4355nYtorcncwkXXerHTBrQpY2XH7WkEjaT3zhomIaIHUbIDqxXdwTljBQnbyRHkJlxI
 Jc6WDBys67O1H001a6xLJa+VCcL8FHxn+QPLWEyAjZN613eOHq3hytpqSs5q/8lwqVCj
 VYGRMlT91oN+08vUAFktAVKBdSp9H8AiJqWtSbOsRkSbLprWc5iPNyGGDn6gFaHMtgBO
 kogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUA1k1tQg1EnwA+MIy/CWrOl/o5O27lSJomM1qJOaAs=;
 b=AMe/2zjPTLpggLG95cdPyB+mXm/1c8Atm7CB+l8+NNaiAUVUMFXdxRbhIp4yYxRFI5
 cZbu95aO9jLUbGlSKP9zOPf/o96A4dRNE0ztf07gMwQ9twuIBldgUCzCVMAmxkB5Zz+Y
 sA4f/IuDqDNdQipBk4M3fENIzfKidegO/82E94gSp5RPbOEOpvJttrOpz1F65sf5l29g
 HJ4UqZ7ASB14RBFu5HpBxpfUywsCDUEErtYDqZZWHXjt1Z0YbgjqZ8tKE2dF5x7TAcfa
 GxEkYWSKr1xRNZ6Pzaur5HkDE6UvfeV08ZDi8E+yUy2j6HkpE5CcghVH1Cog8bBiqzYH
 G3gA==
X-Gm-Message-State: AOAM533xCwh+uYZyqRVIQoEOnZcbquVsCzxxPCRQSd1yyZerdUlIrlS/
 QWheHSWGXIyyL7Kun8N0TQ0/IA==
X-Received: by 2002:a17:90a:5b0a:: with SMTP id
 o10mr2838923pji.82.1619140113294; 
 Thu, 22 Apr 2021 18:08:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id w7sm3095480pff.208.2021.04.22.18.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 18:08:32 -0700 (PDT)
Subject: Re: [PATCH v6 06/18] cpu: Assert DeviceClass::vmsd is NULL on user
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210422193902.2644064-1-f4bug@amsat.org>
 <20210422193902.2644064-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f53ad5da-3016-229f-9bb0-f6c8f06f4a36@linaro.org>
Date: Thu, 22 Apr 2021 18:08:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422193902.2644064-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SYcFABHrjDMU

On 4/22/21 12:38 PM, Philippe Mathieu-Daudé wrote:
> Migration is specific to system emulation.
> 
> Restrict current DeviceClass::vmsd to sysemu using #ifdef'ry,
> and assert in cpu_exec_realizefn() that dc->vmsd not set under
> user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   cpu.c                  | 1 +
>   target/sh4/cpu.c       | 5 +++--
>   target/unicore32/cpu.c | 4 ++++
>   target/xtensa/cpu.c    | 4 +++-
>   4 files changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
