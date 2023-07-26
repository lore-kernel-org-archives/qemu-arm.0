Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp891994ejb;
        Wed, 26 Jul 2023 16:27:29 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH2ovQJeu3QKi5xESudm38n85/xEIihYMfyHqVF9gSDLOcnS4HIUewwidBKCEApJDD4fJ2M
X-Received: by 2002:a05:622a:11d2:b0:406:952d:f0e7 with SMTP id n18-20020a05622a11d200b00406952df0e7mr2659155qtk.60.1690414049264;
        Wed, 26 Jul 2023 16:27:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690414049; cv=none;
        d=google.com; s=arc-20160816;
        b=OpKGkzb1Juw0XHIy8t8d8zlQW00zvXG3QsJa+5/d9YVlVGeaCIXWPpuLlgNexjjGpP
         yUxlHXfMt19DJwWfr52xIsXxUldMr19lfPGLXPXQvCUVKGiB2uva7iP8cbwP2+Ge80Sv
         uGsjRvuquGmjSYTFEnxPgwgkVYuuvAnW4B+xB9gYaVdy/2NxlFgND/AZKrssAunPjWfp
         nATU/9cXYijCKsz8i5OzCrcEqxkBamvrVWdO3pUUsncyJiQlEn4V5q2p/KK8Wzsyvmj2
         G0NjdmxXuPXOjt7/oeEp7abplUp17mMfU/ROrWA5AVcVD9ONal34ck+kH0E/ewQUmr+w
         OIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=kIP3ARRQtkrTpnacZ+qv09XeTfOPcl2SLniK4t1QcX0=;
        fh=1aVn5a25rVKr0Rj0LasSZgOIvObbMro9VZPHwnqv/hc=;
        b=Q19MAg/FMmMco7PMgExWJXWv6W4ga27lPWiesRFlnVaH7+MIeVPPw7XEMG8I4UbH+W
         xtnNmP58qcytwlqr1SDetmjzgUEOa5gKY5Gb4ZCmSbJ9FlKOyAx1DsAcfypBwAV9cdx+
         iqF8cP1dtHAq4AvklHzkyTHJ+TDVjXLT32eOB32o262PJ8HtADrQGXkpsJQNdWhQ0jwd
         As+rhjdWZMcsPpdY6RnoqTQakuq6kYPjER/NkFxCL53bRgLLmfyUyKf6h7O0MQhkLcKP
         bQNmTKL3I4gw/bko9D+HvGniKBnoiFtdKbZB5hcpdxgYAlUQARa++vahr8FXjWuohODn
         5eaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkFWApxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j16-20020ac85c50000000b00403b5a14298si38099qtj.650.2023.07.26.16.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jul 2023 16:27:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KkFWApxK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOncO-0001Vd-NE; Wed, 26 Jul 2023 19:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qOncN-0001V4-3w
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 19:08:31 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qOncL-0007or-JX
 for qemu-arm@nongnu.org; Wed, 26 Jul 2023 19:08:30 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686ed1d2594so367552b3a.2
 for <qemu-arm@nongnu.org>; Wed, 26 Jul 2023 16:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690412908; x=1691017708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kIP3ARRQtkrTpnacZ+qv09XeTfOPcl2SLniK4t1QcX0=;
 b=KkFWApxKYSLKKm9gPNlFiqIBUFfsjFSJGfmPD294a2d2KRx8MHGXLE7pazXo4XSD7X
 gXN4yNGkhQcYo5BVR0BSiFJ6uIjU0OIMN9LiI4mKZDOrIevYi2rvgh3I73DmSgjtnog5
 VXP1xxsIREXHDTK5tjAQYB2GnMufikEcQhIPwAoWI9JtU+n4Vd33mkI0PjR0E4WON3Et
 A1BzItvD99sFJSyfe6m9B7SE6k3rg/r2GrzGAAp/Dz2cBTiK93SY3PuQd4sD0U3KbpZL
 KCk/HbEHQ4dpc5BpLmxn9eEtXPBnPGHl8+VqaAQgoTOClx/pFm4lwaWcMNurKoWcWWvz
 vkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690412908; x=1691017708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kIP3ARRQtkrTpnacZ+qv09XeTfOPcl2SLniK4t1QcX0=;
 b=WNB3wt0d88uSoTI6tiDWpCwby++n0ymgQckwohBe7TYxIoOwQHPN9JynMKjf42hCil
 ObEvyyD8U3mQIXvmZsPQnT/myEZmzDANH0EcyWmjWvldYM5hNMb8CGebj+u1o5mTg/yf
 QS8i+rlE2i8aIjX12V4R3SkVRdX32U6OR6iFVEIH4oW2Pn6ON/75mVLhUWlZalSRtr+K
 T3O3K6PS9GOg9Oo07gGZ5V4kZjSWIJIcroun+4ByHUdkcAZS9ywz/6HfEdoKU3/eNiIR
 srMbz6sVsrAz5PYAbt3fM1ENliNvoKTiPyEFRN5hJFuhQl+M3SMO49kMhgPZyiQh1qV1
 lYgA==
X-Gm-Message-State: ABy/qLYVuWyCCKduqaCGl73Leke7LdE+nMs6m8zxV1MP39kUS+3Gawo7
 7AYFan+kk/cb5s/dvne9Dh6Fzw==
X-Received: by 2002:a05:6a20:551:b0:135:9b84:cf43 with SMTP id
 17-20020a056a20055100b001359b84cf43mr2836655pzq.28.1690412908036; 
 Wed, 26 Jul 2023 16:08:28 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9456:37ab:20dc:17e1?
 ([2602:ae:1598:4c01:9456:37ab:20dc:17e1])
 by smtp.gmail.com with ESMTPSA id
 35-20020a630b23000000b00551df489590sm50381pgl.12.2023.07.26.16.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 16:08:27 -0700 (PDT)
Message-ID: <24e54bac-9149-20da-e4cf-5829a6dcb174@linaro.org>
Date: Wed, 26 Jul 2023 16:08:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/8] machine: Print supported CPU models instead of
 typenames
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, laurent@vivier.eu, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, imammedo@redhat.com, cohuck@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com
References: <20230726003205.1599788-1-gshan@redhat.com>
 <20230726003205.1599788-4-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230726003205.1599788-4-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vLOXUMjfp4In

On 7/25/23 17:32, Gavin Shan wrote:
> -static const char *q800_machine_valid_cpu_types[] = {
> +static const char * const q800_machine_valid_cpu_types[] = {
>       M68K_CPU_TYPE_NAME("m68040"),
>       NULL
>   };
>   
> +static const char * const q800_machine_valid_cpu_models[] = {
> +    "m68040",
> +    NULL
> +};

I really don't like this replication.

r~
