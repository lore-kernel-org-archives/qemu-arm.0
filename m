Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp13812njc;
        Tue, 6 Aug 2024 20:47:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNEZ5cFZfxa+m3cmUt+KwfQ5r3xpPe4L+fsZAruN/Ni6IQkBlovAENbTLHVj7bO51M8giYgZdX+ve58GlK1c1HGvKJGNOf
X-Google-Smtp-Source: AGHT+IF36U15gPof8Bz+dV8Jh86t8CSf9CUZrvrKazuMPmfQIDGxEEYGO9BphfHZKqWYm1uqrjtd
X-Received: by 2002:a05:6214:498b:b0:6b0:77da:3ab6 with SMTP id 6a1803df08f44-6bb983474camr255480116d6.12.1723002427660;
        Tue, 06 Aug 2024 20:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723002427; cv=none;
        d=google.com; s=arc-20160816;
        b=pMLN/1ds0nnbYh0mnovc9NMZIMnac9QFUXTe2fuHvkppw1QBT2U0Nxhw4jSMWgbYkT
         j9de6mR2WZ7sqi3Yln+oC/5ImIk6arL8mzfzwVm+Y6bm1qXHWbV3EzBxxXUFjJKV6MEm
         W+uj5TEbuUUtUzIbzneKUY6SpuP9lGxC/R9ls/hBTHViV+XbnDCna9sC+YqCRefhA+go
         cXk5PY7eZbdtVM4+7EL6tK22MlSEhU3Pv8BEjj+SSW+8c53J5wfkR/ncWk5GQc/xqKo0
         OxYpn+dnlyNgqA3BmP9RyIdG1cRlFhuuwTCX//uYtmr7ctgOH1gJQex9bxEDeMcXXXsg
         iWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8DU9Z0oz7hUaX+wBucwe27ucxf+vT1gzmbJasnsJcjc=;
        fh=ccy/QR4F3omxxrDCSrkSZyfTB3RX3QAKDwqJ/8bOVFU=;
        b=JNM0DPo0gq4soNcXNuOaimy2spa1R8ErexpZK7cxjKkW7Gmd2nvS5X+sPIukRuZq+Z
         VnBFP2vC7gSfLniy2HcUhKDAPCJtMyI2ezCKVU8wYzeIsjSyQYe+OxAI/0VnkAZJo9oF
         YE4mX4qkldHCgHMjCm/JofEoDaEed07ghJW43TraZE0GfvjyLlMvpQtAisFTyjeoC4A9
         rasPKb/7Fmaf5gg23j8aOeJKdnUQjf9XWC2e+0ZtyM9kadcD7XWQU0tPKG3d1qm8q8Hq
         SOvlxwzAQK3+pdD1T9Zn3ki8XSEJjqqEUnm81XK8YkDdoJ2Oo6jlpaFylvkwmILd88E/
         FonA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4XqNtRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bbbb8d0b56si8867896d6.206.2024.08.06.20.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2024 20:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4XqNtRd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sbXdK-0006gk-0u; Tue, 06 Aug 2024 23:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbXdJ-0006fi-3w
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 23:46:41 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sbXdH-0003N2-JL
 for qemu-arm@nongnu.org; Tue, 06 Aug 2024 23:46:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-7a115c427f1so997846a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2024 20:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723002397; x=1723607197; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8DU9Z0oz7hUaX+wBucwe27ucxf+vT1gzmbJasnsJcjc=;
 b=A4XqNtRdsO8EimokQgssS1P3cdRLOCjzOO1WB17xtiwvPUuRhnIEMx5cbDXqymZZuz
 k9Feqi58PrP6Tqk88b5BcAqzCybzGKqo6s/xrI88D3kB1Pt81G0NAWgQxnDF7AdMs/o4
 BzR5JRl4VxQExEDv4Vp80Y7F6/Wi0+N7hL6EaxOSXu3kL+CT+2lSInLDdTxDN0VMTtWe
 Am9yO1avw4/Nto/Qdmk84CmFHS+a8hhEo5LcV7XruyHp7UdLYrRICJJkQWZDyi7pO+/Y
 lWNYwcZm8js+CT3ltzPCCNAOHb+B6UtIbMTbO7t1p69RLaiOxJ5HAN9QkhoujIFwmhPE
 gb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723002397; x=1723607197;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8DU9Z0oz7hUaX+wBucwe27ucxf+vT1gzmbJasnsJcjc=;
 b=fCtBRl4qATOehu4QDuFF/p75NhM15W3heklxnCvqg1y15oOzUPf0fNRHS0E++t2NcD
 Y3C4OL3Eew/PZ1VI9oE/pXgfOCl8v5Ni6ThuGZxYBwuYEqXzSyhbHLcT2tqJcZThVND2
 vVSuuaY7bFiXpYFEux/VqkqSoljd3SGztT1XXtWtfHfc58E9lO0BXOIbZFcXaPk56r2+
 Dzb/fBU3nNN6ws6Tnfebx0VYhh8n+4JDKZ8fIMxQAFgSk3ZeI5iOIq/SWHOWx/bpWv1M
 Mkj0JuD/4f80+IIK7tJ+HR/hrk4c61Z2KasN+lYxyUQ6kvkcn5fIcEIlYLr4pUNmLe9U
 zjDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL8Eu+NY0yMge180409Ah3bx3zR3FcqmMpNvK/MI/fjsfYbAUBoIaOSJ49/aS8Mq1uAt8VCIXMdpWfHjbw/A9dz8XZ
X-Gm-Message-State: AOJu0YyOtsL/QZwP5fhfxWEgIDXemc4g96N6qNaKf2BPVKVqDlwAlpTg
 NR8EdmG51J0yIl5LyU9K2ph+pcUfo98bYX0fmbpBlXI9ZFpa7DqC/DruTaGqKlg=
X-Received: by 2002:a05:6a20:12d2:b0:1c0:e1a5:9583 with SMTP id
 adf61e73a8af0-1c69955f54emr17210544637.17.1723002397013; 
 Tue, 06 Aug 2024 20:46:37 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:e01b:92e5:d779:1bc0?
 (2403-580a-f89b-0-e01b-92e5-d779-1bc0.ip6.aussiebb.net.
 [2403:580a:f89b:0:e01b:92e5:d779:1bc0])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1b3a9cc47sm298202a91.11.2024.08.06.20.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 20:46:36 -0700 (PDT)
Message-ID: <f82397e9-3be4-49be-b291-5598acdaf39b@linaro.org>
Date: Wed, 7 Aug 2024 13:46:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1? 1/2] target/arm: Move
 qmp_query_gic_capabilities() to hw/intc/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20240806141940.22095-1-philmd@linaro.org>
 <20240806141940.22095-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240806141940.22095-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
X-TUID: XPBurbhTntIB

On 8/7/24 00:19, Philippe Mathieu-Daudé wrote:
> qmp_query_gic_capabilities() is not specific to the ARM
> architecture but to the GIC device which is modelled in
> hw/intc/, so move the code there for clarity.

But the GIC is certainly arm architecture specific.
It's built into the CPU, and shares state.

The fact that it's modeled in hw/intc/ and not in target/arm/ has always been a needle in 
the side, though it seems there are no good options.

> @@ -39,6 +39,7 @@ if config_all_devices.has_key('CONFIG_APIC') or \
>   endif
>   
>   specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
> +specific_ss.add(when: 'CONFIG_ARM', if_true: files('arm_gic_qmp.c'))
>   specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))

Is it more or less confusing that you're not using CONFIG_ARM_GIC, for something that is 
GIC related?


r~
