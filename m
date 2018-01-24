Received: by 10.28.71.27 with SMTP id u27csp588608wma;
        Wed, 24 Jan 2018 04:58:39 -0800 (PST)
X-Google-Smtp-Source: AH8x224AmJUytBEipa2UjOxxRKeR1LOflmIOZR+0r/XSTKB5W/YhTo6rRvX/joMwMCG7HUWq/bU2
X-Received: by 10.13.213.144 with SMTP id x138mr5050985ywd.157.1516798719033;
        Wed, 24 Jan 2018 04:58:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516798719; cv=none;
        d=google.com; s=arc-20160816;
        b=THlhRBXGh9tsYN7ExdIwV/5td+K4tKPihpyhwMZaAv2RHGfR39WZ0gIG8971QbaiKd
         2un0PW0ZKVnbQoeWGWFDMMEwraTWKSAuVw9ELrVyUzgBr4JNbfMPvBiX5LgzkRLgRQBC
         a0Hb+QSVcvrmrYPn/2RF5aTdS5oYMatDFLp8fez3EVUeO55dxEaSr/n4jAAVrUzPu2ie
         7lIE779d2Yulr7NnB16tO4pUndLZuT6IvSWfZYqsC4bqoZBSesF38FxO8Eujhta9jvOq
         Cao9KM2GObUfv9DiRNhdUxfL+QgLRxOg+JT6Pg9HL17bZubuS8OTz2k7MQgQ7h6BBbzE
         dj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=XuFRF/nlWHGardVcN7Dwg13Fw3FVk9FG5NsTpnsudwE=;
        b=MhCybctL7By4nrqe3ikEbDB+sXsK/Wp1sy9RsceH2mtSpG/Gu4pwXeKI/FghB9Fb1Q
         AezleB08YNomVIGgQw0lcR/nYbS6oOgGLz9RX8D0IWtzdXQhSQHgcnVL12Pa3cU0H61r
         SNTkL2MTNZ401ZAgGzlDlqQPAYALIV3SWoOwXDKgTtZdSYWMYFtarSF8fideb/5BbrJY
         xhKOpfkS8J2CfzuNCImGMVNabcTNKQbtBkHtDm2LrSRqhTAk9dN8DPGBoPSyrL6n15is
         ry/qIB2R8A6ClphgnTlo/KzsS6CtMXQkEUS6yhuMUj1fRXsjUzyZdWcG25altM30LOB2
         ZFjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si2824164ybe.241.2018.01.24.04.58.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Jan 2018 04:58:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eeKdS-0000nF-Fz
	for alex.bennee@linaro.org; Wed, 24 Jan 2018 07:58:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeKdG-0000mQ-9r
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 07:58:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eeKdC-0002b4-BB
	for qemu-arm@nongnu.org; Wed, 24 Jan 2018 07:58:26 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50160)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eeKdC-0002a4-1K; Wed, 24 Jan 2018 07:58:22 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0MSJlD-1eCfWV19Df-00TSiJ; Wed, 24 Jan 2018 13:58:16 +0100
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1516694904-64879-1-git-send-email-imammedo@redhat.com>
	<1516694904-64879-9-git-send-email-imammedo@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e8f6a860-6c20-bfbe-e8c6-c65763a72102@vivier.eu>
Date: Wed, 24 Jan 2018 13:58:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <1516694904-64879-9-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:tG0OL4n2SHeG1QzGfOf3e/G2laYii7itoNC0Zh2VP5XpfP4Hoct
	6GvWQjh6P0s0n5WdvnmVxkRHR/ay1j/lfYMvLotgmXceSE1WzmG37Vhq7eNtZvgbN+yRxFz
	hFqI0jVPKkVxJ8AmB1j/u/KGLJz1D6NEt6QL0nScSLZQ7MHUizAMV9CvoyE8kjW8G9Pn15M
	A7b5cDvtXD5UdEwmod5tg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:0fhTlR6rCpo=:+gewCG83BWNbTrlDCO9ZsD
	sLPcMkwGHquoibpQFwLzjBjX2Uud7pcQxkY7MSE/mnJpny6NJuw5KI3xaPg0GUnqqS4Gr0HYB
	CzdJ2/eloXUioIJWi2FEH0Wi3EH5Li4MQSl6F6inwSAX3w1CMVXjzs31y6J8QNbl1XmrZW5wZ
	7IN8urro1gGzpvVEO1jsjdxWy7pkb1p6mTyKGEjrlb6Pjy4PV3mPAvK57gey1eFqg7pyLz3Wa
	Lw0P/vl6ejdDSfFlN4hUhw7pteW5UJqkEqdyFfSLCEjqevWH/cJUtdEQO5rKeaduIqz3FsBWe
	l93RR1836GaVt3SNVPbYPLfrGDE3cqj/5YVrZy1jKyCKMqo0VhVxgzImqQ4m8x+wgLLVGMVWX
	Ap9yxUe5NMnb84CeiUpcPwr8c8E5fKUgHIZcp/o+gC0435l8owPUuwujm+l9a+SF2HA8TA/eX
	bVB2WxfLkF1O6cvW8o6AeTayZui27AFNGeEnaomq9P9az+XHPx+LwNLoNMTAj3NeCf5+N5Sgq
	VfwsxjcZepstPcbs+dPvd2FizYznMjK+K6ipHp+TFAoTc/YgjglR9cHZ/PSBDSjRV+EVnVYLY
	lxugQAvn46rhQKmOSdb8siv9Hn8hlzynjo6t/RB+x0MCZTnO0wqH5pGTv+gSoaBA7TSJs6+bL
	JCrv4/hVdh6qHRayeEnAik6QRYR+vEV/2RVDJ1bLNZr3KJfvXgz+aTAPxHBVdDmgDSL6xG+Gk
	q6xUzMKsiebF8A9Sf2Jm/YxuUzMnAcTvxEcUi+ZNpLyNl1XMKjBIXmWnwAA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 08/25] m68k: cpu: add
 CPU_RESOLVING_TYPE macro
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2BrjQXURE3VH

Le 23/01/2018 à 09:08, Igor Mammedov a écrit :
> it will be used for providing to cpu name resolving class for
> parsing cpu model for system and user emulation code.
> 
> Along with change add target to null-machine test, so
> that when switch to CPU_RESOLVING_TYPE happens,
> test would ensure that null-mchine usecase still works.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: Laurent Vivier <laurent@vivier.eu>
> ---
>  target/m68k/cpu.h         | 1 +
>  tests/machine-none-test.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 2985b03..8a4299a 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -405,6 +405,7 @@ void register_m68k_insns (CPUM68KState *env);
>  
>  #define M68K_CPU_TYPE_SUFFIX "-" TYPE_M68K_CPU
>  #define M68K_CPU_TYPE_NAME(model) model M68K_CPU_TYPE_SUFFIX
> +#define CPU_RESOLVING_TYPE TYPE_M68K_CPU
>  
>  #define cpu_signal_handler cpu_m68k_signal_handler
>  #define cpu_list m68k_cpu_list
> diff --git a/tests/machine-none-test.c b/tests/machine-none-test.c
> index 1159290..c9445b6 100644
> --- a/tests/machine-none-test.c
> +++ b/tests/machine-none-test.c
> @@ -31,6 +31,7 @@ static struct arch2cpu cpus_map[] = {
>      { "alpha", "ev67" },
>      { "cris", "crisv32" },
>      { "lm32", "lm32-full" },
> +    { "m68k", "m5206" },
>  };
>  
>  static const char *get_cpu_model_by_arch(const char *arch)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

