Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp21877njb;
        Wed, 7 May 2025 13:45:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+JfWXy/N49jX6p8ge4aNDdnmH26mzdO2QqlsxBBwLGNabf/b8XPzpVacUjmk85IIpvh+PxCH84PHTlw==@linaro.org
X-Google-Smtp-Source: AGHT+IHMx6+qkdKI+Lj/1PNYGFWN2bPso9LaFCh5cD5OKecSCd9k9E75UNZGDZZ7Akn6oT9664qP
X-Received: by 2002:a05:620a:471e:b0:7c9:4c25:9eb7 with SMTP id af79cd13be357-7caf738852dmr719049285a.23.1746650759056;
        Wed, 07 May 2025 13:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746650759; cv=none;
        d=google.com; s=arc-20240605;
        b=OSFE8arIpE5eA6pqaY4kQqN/LOlX4/dR5QPtCqeOeYj25r3YE1vqYArphJrGlXfk3a
         Kcg1VMxAa89TcKub7rUC/HpupQc43aDb/U1FDT3JB6dFyCdNarwd11C0OU4JX6krcyk8
         n1yuNqQeCXer6WcO69K+rJ7o4TpFzuO3VEiYYddOLoT4mXC0fcEAwSlauTGfF7da+Oh0
         P7FlqLyp2dlStsKY2nGE6lsyNA7a+6bPL/XUyHaTND3xHERaCQX1o9ZvgleBGX4x59ob
         TMgmuIz4vFbx96KCEu351OFCevnjMAwAHEKSe76m8oXtIJNz3p2j/jMEMgxf+WNHLKUl
         z5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dW8VxMVQtKK032gVZpGGhi7xw/ldWhEiLHhjvg55jgU=;
        fh=EiVaAA5GrBYt26xJcUz1Ct3fFZfmS9wDL23Fbis/FsM=;
        b=H4gj5U7SawM9rArkjK3RPKZz1sq17iBDUPELeXd3GUQq2qbrdec64WCqB+JUjUvpdv
         GgWdS3+AUxLKiaBICh2lzIh1aqj3gJKUhXyKnKntJUWoaZpNfPY9BXmJRbE9oKOacFCt
         jC/fwXcCTJLkwhn5vbZKfWo3FSp3Mt2bm/jn3wLQam8ALD2eP4IUMx9GCDZpZBlllrN8
         l5EroReQsZY/NmNB2Y/JC+FDdn198u6NmDHd3fJe+wpcftT9xzmHdcRLVThMZuERegJE
         PW/6y9pZaoJuw5ofuWuH0YJ1VR70Y/VzO4Z9jfQ2A5BmsRgR/mGFrIZN1EfvJk8cuE8S
         +Ffg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnpQlseM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf7599451si294402485a.223.2025.05.07.13.45.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 13:45:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnpQlseM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCleQ-0005q2-Bv; Wed, 07 May 2025 16:45:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCleO-0005pn-Ii
 for qemu-arm@nongnu.org; Wed, 07 May 2025 16:45:56 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uCleM-000343-N3
 for qemu-arm@nongnu.org; Wed, 07 May 2025 16:45:56 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7390d21bb1cso399347b3a.2
 for <qemu-arm@nongnu.org>; Wed, 07 May 2025 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746650753; x=1747255553; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dW8VxMVQtKK032gVZpGGhi7xw/ldWhEiLHhjvg55jgU=;
 b=dnpQlseMuuwSik63v6TzuHDV43bhTSk5p5r8zJsIYJWJZJavAmngq03WzT0v/Fve9m
 FtBupCDIN4sidykkoKSM1gcbYqFVt0rOp952vuVSzcxZ6MIsQ5jP51tW0l1VdmXj/inh
 nDsSItfcDsmCrjW7b5AGUbikkrml7kpjG7cJq7KN5ypBFn2O9w+G7PQ4xG0lm2/k5Nu1
 Q7Q6RTNxOEcjTPItuDjMxS1EpMzSA1o3xIEn3PgaRQrDRFspU0IUjVuRswQTWc92/BTS
 9Pmxzh7osrxB3ZLQpPvIQdiEYukcfflbH9uQTcxcDTYqeh+y/+ySfoiB7RXAdlKHm9W8
 iNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746650753; x=1747255553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dW8VxMVQtKK032gVZpGGhi7xw/ldWhEiLHhjvg55jgU=;
 b=obIXff/TOEBhg+vhJsCScYEZI4ngzevcLicwtBOow1mAfZSo4V6va/ZcHJZLw0RU4Y
 Htym+BnUdhFCxgUkUw6vIqwvXv2Lc9XdeJonTKKIbmOcA2b58oof92psVxgNMuKbEgtm
 WIu7BgrowX0I9dlNBz8KaU62s18tDxFgErn4L9Y85+qmZRdpmDLXPx1MNdqqnRphwjWP
 y49TrL5DR/p/HeeiHspreb3AXtgCHqCDAXheymbUVBiZpw35NIdhXl3aDRCwGTxrlhfm
 nxcmsyoNU7Weyv9b3DUQXW0CpFAfjTEtJ/v6C+JJVvdmprqZxek27xukIUVY6SExsn3j
 UMfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1fRDmE7xLGLCpbT6vSvleZKlyWTjQ20EaEf3V91Tfx9N980PX0zgo38L0Kf0SkgWP8FpVqM5oCA==@nongnu.org
X-Gm-Message-State: AOJu0YwDUbZHefQOAZxsBSj2Uc9zcjL3l2lmLtJphTp2ozjM89NgTWSm
 Aoi1/w1PPqDjPvu0/kkKv9yzYbT4P16IBgA9wjWn0Du4XG5Bzsmk1EClq29l/8c=
X-Gm-Gg: ASbGncsJxropBaVsWXPejxswawYXvj3CBJadK21OpiyEXNG9Pb5FO+dFY2hq0dVmRq6
 93dd0dXMBJueLRBsZ2iIfM/vmzi4vw4WhfagG+lvVBCKvRbx+4X0YWxPmwJB9YDut7Sg1HWzfp2
 9xCP8iAXTgcljSdTVklf/eZQjDHmbdWred0aLLnMSfF17WGWXYgqGpYtRBB2dvrWgS2GmxIjdYo
 AlVPglXeea9Smn6RobhzrI1Zng49DqDUgVPOqD2RKUEXBk7fiQ9+JN432ZV94Zxe0E7R2zRV8i9
 Nj94HHizfDda0x2I1eNwvXMH4Hau6JF7W6WcQrK9AJjin/aCJXHPIvprtO1h6+0lnYZqtOqE0D7
 K2rrROZRaM3aUbw==
X-Received: by 2002:a05:6a20:2d07:b0:1f5:8a1d:38fd with SMTP id
 adf61e73a8af0-2148b113301mr7344812637.2.1746650752900; 
 Wed, 07 May 2025 13:45:52 -0700 (PDT)
Received: from [192.168.69.243] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74058d7beb2sm11763443b3a.1.2025.05.07.13.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 13:45:52 -0700 (PDT)
Message-ID: <30351e05-b73a-4d97-aac6-246ef53607cf@linaro.org>
Date: Wed, 7 May 2025 22:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/hvf: Include missing 'hw/core/cpu.h' header
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal
 <m.ynddal@samsung.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20250507204401.45379-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250507204401.45379-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: h/7ryPIPGyCC

On 7/5/25 22:44, Philippe Mathieu-Daudé wrote:
> Since commit d5bd8d8267e ("hvf: only update sysreg from owning
> thread") hvf-all.c accesses the run_on_cpu_data type and calls
> run_on_cpu(), both defined in the "hw/core/cpu.h" header.
> Fortunately, it is indirectly included via:
> 
>    "system/hvf.h"
>      -> "target/arm/cpu.h"
>           -> "target/arm/cpu-qom.h"
>                -> "hw/core/cpu.h"
> 
> "system/hvf.h" however doesn't need "target/arm/cpu.h" and we
> want to remove it there. In order to do that we first need to
> include it in the hvf-all.c file.

include it in hvf-all.c, otherwise we get:

../accel/hvf/hvf-all.c:61:54: error: unknown type name 'run_on_cpu_data'
    61 | static void do_hvf_update_guest_debug(CPUState *cpu, 
run_on_cpu_data arg)
       |                                                      ^
../accel/hvf/hvf-all.c:68:5: error: call to undeclared function 
'run_on_cpu'; ISO C99 and later do not support implicit function 
declarations [-Wimplicit-function-declaration]
    68 |     run_on_cpu(cpu, do_hvf_update_guest_debug, RUN_ON_CPU_NULL);
       |     ^
../accel/hvf/hvf-all.c:68:48: error: use of undeclared identifier 
'RUN_ON_CPU_NULL'
    68 |     run_on_cpu(cpu, do_hvf_update_guest_debug, RUN_ON_CPU_NULL);
       |                                                ^
3 errors generated.


> 
> Cc: Mads Ynddal <m.ynddal@samsung.com>
> Reported-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/hvf-all.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> index 3fc65d6b231..8c387fda24d 100644
> --- a/accel/hvf/hvf-all.c
> +++ b/accel/hvf/hvf-all.c
> @@ -12,6 +12,7 @@
>   #include "qemu/error-report.h"
>   #include "system/hvf.h"
>   #include "system/hvf_int.h"
> +#include "hw/core/cpu.h"
>   
>   const char *hvf_return_string(hv_return_t ret)
>   {

