Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp544973lfj;
        Thu, 12 May 2022 09:51:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoQew/M0MKT2+T3VaPUckb7wQLOXmvSGR2J8FjB8Iq0frEAwNW59XLAY8nrqFbUZ4WgSGL
X-Received: by 2002:ac8:4e8d:0:b0:2f3:ceed:a9d1 with SMTP id 13-20020ac84e8d000000b002f3ceeda9d1mr719115qtp.200.1652374316669;
        Thu, 12 May 2022 09:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652374316; cv=none;
        d=google.com; s=arc-20160816;
        b=js2oNUHKkGFiUP6yE3BTpWqWImPaBvM4HxfGI/F+ss5wfOyLjEO2DAlBB6FVJQc/ui
         7ajZS40VYVFdR7olUWiS4z6oYz1egRxa6qsBBtUOrwkRXeLVPXmUGbtn0ldds7EkhDnX
         J+HKJhbiyVniGecAp0EqhUcwHOSUa6FFHegL+KSGs103obkkPa6BBHmIQfXdX8T6XmUR
         NUXc7Cr0E/gE7I8qOTFeLfqcoM31tlLKRLhEoWHC6l0uaCetdKE4sB3aSb/IunU4HSJn
         jf2THyFAjl2KGvQWgVjdhkiZhnepKK7yiSyHVJmrP6zI2h9O2DsucpT1awhhlb5FFJRh
         0UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=gY2t8Go7p/vgj66UPEsK+d7CYl6pkbufpPENCwlPnDs=;
        b=SNSDf4/Amzp2MO17M3+cUmG7Fh92pDU9wPpk0Ih8xt/X9VvxF/pzsECIEFrm2/qJs1
         8j98CxmW8VYUzWV8yX7Asrv5z1Is25+UO5QWyXJRPbQK/tPtYab7cqUlcwrWSuEeaiTa
         cg9ioQ1E0tWWGCIFtA93QPiMLYoPhKM7vbtb92HFtj+bjrMG++TpmAKCxTuZvvO+Q/xL
         DdNzFUBvP4MlIBD1u8JdHRbQF08N1uS0/6NsMaATA1jpjlWBwGLbX6Yj8EhXcuo2RUBz
         z+WoziP+VAAqn0MQZz9HOXzbnBfTrzh+vAe+WwfRS4r6vjWtTaspB3TNgD+hBsKti0Si
         kHkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oj7u/thR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85f8f000000b002f3d30616basi55976qta.243.2022.05.12.09.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 May 2022 09:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Oj7u/thR";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1npC2e-0003Kp-5o
	for alex.bennee@linaro.org; Thu, 12 May 2022 12:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npC0b-00022H-Ca
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:49:49 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:36457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npC0Z-00074q-55
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:49:48 -0400
Received: by mail-qt1-x82b.google.com with SMTP id v14so3748747qtc.3
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gY2t8Go7p/vgj66UPEsK+d7CYl6pkbufpPENCwlPnDs=;
 b=Oj7u/thRC9Extvl8RK6HxklyDVN8o/yTPdFn5qsDIPfOuLjKsJrlTPIp+rC4D7gWJ8
 EGtoaaGN4ZmsVhLiheFw4MGTPhkyJU51XvXXk8PwrtfLGB+0qn4c6yovzNhXb8uDjKvw
 fKJO57MbZHVJ2YH9quQWvbiWO5Yp6QYjfN1/MKR4+SLGatxrQYLoW58pkDuYCS7Qk81Z
 rU3gi8siUX+6vWnzlU1p0S9OOiChnR9opbghCJ/3wvfUWARr2+Nsz6Z/XJmFeYkCuuX9
 DpW6x99FVkixZbdW6co4OM580+5Otwb7X9wD/mD6DJ8WBCsuvELwa4yY306nlC5Hfpg7
 h4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gY2t8Go7p/vgj66UPEsK+d7CYl6pkbufpPENCwlPnDs=;
 b=qRtMTElwFMIvGtvQW4YIFJ4vHPZYWqb3Ge6fbCE1vSYUYDxE9AKNwOji8WixDxrQR0
 Z/KyN2cezj6ywzF/pfT/o2hBe8bSaiBLZXd4WnW9l2fHEB5//hbp/0lI2nVltoGnS0tL
 DF03PQU1ZHVRj2pEgVIeOJ7ARwfAxXbFQ+IP7h+QByiZh93GFSybwhv1BQvmBhdmMkY7
 BhHzICuObKsdf6OCCjsTgufJ0ktnQUcoLdPEmDfjL2ZqyIfrUmHrk0+uvgbw/cPuGPhY
 Twgd6vHEabDPy1VUqMYe5Jeye1sGpS4oSdtEVYJ+A6npFGXnvZhZjZ/CcYPe3wpyCFA9
 6Gbg==
X-Gm-Message-State: AOAM530U0sh8tz65WQdToEhB6cC6G74FbFRdNAvsDzxiX/V4s/yKbT+6
 9XwPjPhMgFVoz9Xl/gOtxFinEA==
X-Received: by 2002:ac8:7d87:0:b0:2f3:edba:a84a with SMTP id
 c7-20020ac87d87000000b002f3edbaa84amr719469qtd.186.1652374186038; 
 Thu, 12 May 2022 09:49:46 -0700 (PDT)
Received: from ?IPV6:2607:fb90:2827:e3d7:b6c9:cd59:fac5:b31a?
 ([2607:fb90:2827:e3d7:b6c9:cd59:fac5:b31a])
 by smtp.gmail.com with ESMTPSA id
 bl34-20020a05620a1aa200b0069fc13ce1f3sm3456652qkb.36.2022.05.12.09.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 09:49:45 -0700 (PDT)
Message-ID: <c8b1cb70-3196-284f-6636-0f81d958a6e6@linaro.org>
Date: Thu, 12 May 2022 09:49:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 1/6] hw/intc/arm_gicv3_cpuif: Handle CPUs that don't
 specify GICv3 parameters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220512151457.3899052-1-peter.maydell@linaro.org>
 <20220512151457.3899052-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220512151457.3899052-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rScXEv8XJqNK

On 5/12/22 08:14, Peter Maydell wrote:
> We allow a GICv3 to be connected to any CPU, but we don't do anything
> to handle the case where the CPU type doesn't in hardware have a
> GICv3 CPU interface and so the various GIC configuration fields
> (gic_num_lrs, vprebits, vpribits) are not specified.
> 
> The current behaviour is that we will add the EL1 CPU interface
> registers, but will not put in the EL2 CPU interface registers, even
> if the CPU has EL2, which will leave the GIC in a broken state and
> probably result in the guest crashing as it tries to set it up.  This
> only affects the virt board when using the cortex-a15 or cortex-a7
> CPU types (both 32-bit) with -machine gic-version=3 (or 'max')
> and -machine virtualization=on.
> 
> Instead of failing to set up the EL2 registers, if the CPU doesn't
> define the GIC configuration set it to a reasonable default, matching
> the standard configuration for most Arm CPUs.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> The other approach would be to make the GIC fail realize if the
> CPU type doesn't officially have a GICv3 interface, and make the
> virt board check for mismatches and handle 'gic-version' accordingly,
> but this seems like less effort. I don't think anybody's likely
> using this corner case anyway: the only reason I ran into it is
> that with my patches to add cpu->gic_prebits one of the tests
> in 'make check' now runs into it because it unintentionally and
> unnecessarily asks for gicv3 and cortex-a15.
> ---
>   hw/intc/arm_gicv3_cpuif.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
