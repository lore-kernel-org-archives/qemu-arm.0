Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp3093500ejb;
        Tue, 1 Aug 2023 12:23:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGZKlVF352yC7+u8P+5cwW5ONiyXY1d2WysOchNWMopPTJls2g28qjebuGDyAyrIzIhrQi0
X-Received: by 2002:a05:620a:258e:b0:767:82e8:eb88 with SMTP id x14-20020a05620a258e00b0076782e8eb88mr14792569qko.7.1690917788391;
        Tue, 01 Aug 2023 12:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690917788; cv=none;
        d=google.com; s=arc-20160816;
        b=ISZ8NIgEmnwCtzj5wZ4SRzqN77W1hjxOEXd4V5L4s4TPM3TDS6pCedEL3dhRp9YU3b
         0p55qClH3Lp0x5n+afCdoAcBdGZ11GkSt6Ab4Iv5qTMUiiuXxHzaMpyyFolw1Mt9Xcn6
         WzaKID04K4aVy1bmMSHijXWUP850XXYjnaLJ9biaak3OOAJ2d7lR8BLTrXcwC3B4jz3C
         UEfnL/6ZOvjy7aNijevWkpNizX0yzQeSbPjRPrSBETeWEGpMqfAZ96YZv2PbR9MOqSCC
         0fkyo78UOiySeRC2xkWgsCg85Iug/I4yKygS7rqICesS0GK5ug41EE1eDUU/xH+KGHrz
         WQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2atCtTRN/JMfdPzafk/J+52jDOXsvph9ibReUCUBaMw=;
        fh=i9LXiVq8J4CAuLQxBbfuxa8ZjFtDjhZS3IQYxdZgNus=;
        b=TlyrEAC1l4VPtrIN6f/zICxvsiUtoXvmUVUET5fFSWUIM1hSLPJyvcGdYEjSaBGe9J
         JSo+c1WL6/n4KaPIEo+pddy0Qq/mDRTD75uJ758OMqeUsc9+blTnI46lhHMwXzV00Vnr
         3onakS8AKFNzOjrOEsw670l1DokmETrgCKdL57AejHNSWDFQUuxtmI75er2sHOr84h3i
         fuikLXt4gsmwg54X65+vBGWRGTZaDXxa2M/5yZL6NeaWMji1wUTSj2dh1WldKta8nuvV
         PUZJdtLVb+PESXL2qi2XdBLvDeVM1YQ8KmpA3QpvERUKY/iZMsjc4pQZXBXIGaKMN6Oy
         quLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W9AT+lRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020a37b607000000b0076cb9d1d455si2222384qkf.355.2023.08.01.12.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Aug 2023 12:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W9AT+lRB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQuxL-0007s8-Pw; Tue, 01 Aug 2023 15:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qQuxJ-0007rq-UU
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 15:22:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qQuxI-0007aj-FW
 for qemu-arm@nongnu.org; Tue, 01 Aug 2023 15:22:53 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68706d67ed9so3754618b3a.2
 for <qemu-arm@nongnu.org>; Tue, 01 Aug 2023 12:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690917771; x=1691522571;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2atCtTRN/JMfdPzafk/J+52jDOXsvph9ibReUCUBaMw=;
 b=W9AT+lRB+4FO3iFlE1WmmORBAtqi17CS3rfu9JDsFiZ3eyOLZk6J//Xo5oE/iUKGLq
 ox46oqo2TsT/yQtij9z/MMWkrNfCF2Wq6gvFAZvo872zNQcOvT0jE9F64k0Kec0Fh1W5
 z27n9eOgsgqCJw6NOhWQJhdul3I0yAnwXmPkDr5ER9lIqo83nCvjLG0sE4kgNdy3/HVx
 LEeLYL87/rIzdSH12OGZAM8rFgB0mM8b3Tf65rzcnIhXl7TQJAG4u+mw9GNuaDgUcavl
 2KALhxdl18t7Uj7e02jRi/ytXiCG5QKhWCJxeFtagJQz9xPRXahFn+JGV/7r8JDFGEtC
 61Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690917771; x=1691522571;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2atCtTRN/JMfdPzafk/J+52jDOXsvph9ibReUCUBaMw=;
 b=jLIjojibYD95ojNdJyAJxet5jaWkloxm5qoL5Nv6KpcRLcrlvfKqJs+hZUKQK0PU8g
 viWR66+P8pYaB5YhDqyEjmePGRkyRkaw5T+YZJVfVP4qcJ48EoldLcQ0YqXz/ArdNe1a
 WgGC2ZFWGEPXkEYFbq0uZuuxJ3nkuk1mxRV8pW9/AaiYA+u5we8inabyJWR9yvik7Y1R
 8rhzmH4HJ2kOyuO6TUzDY8SaVUsyJwg+8QcO8emQ5Dfr3Faqe1udX9Wh5W77cEbkuxIq
 4yAzWIY6kuMHluvHH08Qz2R+96EXAleQeGoiSSQHTxE2UsX2SUl/zJVn+iH/aRHNbTq7
 lbpA==
X-Gm-Message-State: ABy/qLYeSOFehzH5dLsBmADBt7e5/5AfAqpGCa9iWaWtMCsDQ3XbkfAa
 zP7boYknQlRpaU6YhEjovnZ84A==
X-Received: by 2002:a05:6a00:1590:b0:687:4bd8:159a with SMTP id
 u16-20020a056a00159000b006874bd8159amr5067377pfk.19.1690917771014; 
 Tue, 01 Aug 2023 12:22:51 -0700 (PDT)
Received: from ?IPV6:2602:47:d490:6901:67b4:35b2:87e2:dccc?
 ([2602:47:d490:6901:67b4:35b2:87e2:dccc])
 by smtp.gmail.com with ESMTPSA id
 j63-20020a638b42000000b005637030d00csm10274761pge.30.2023.08.01.12.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 12:22:50 -0700 (PDT)
Message-ID: <b4f4695c-5257-4ff2-060e-0c6865eb2250@linaro.org>
Date: Tue, 1 Aug 2023 12:22:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] linux-user: Emulate /proc/cpuinfo on aarch64 and arm
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, qemu-arm@nongnu.org
References: <20230801191035.374120-1-deller@gmx.de>
 <20230801191035.374120-3-deller@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230801191035.374120-3-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
X-TUID: O77YP0h4xOTG

On 8/1/23 12:10, Helge Deller wrote:
> +        dprintf(fd, "CPU implementer\t: 0x%d\n", is64 ? 50 : 56);
> +        dprintf(fd, "CPU architecture: %d\n",    is64 ? 8 : 7);
> +        dprintf(fd, "CPU variant\t: 0x%d\n",     is64 ? 0 : 2);
> +        dprintf(fd, "CPU part\t: 0x%d\n",        is64 ? 0 : 584);
> +        dprintf(fd, "CPU revision\t: %d\n\n",    is64 ? 1 : 2);

These all come from cpu->midr.  See linux/arch/arm64/kernel/cpuinfo.c:232.


r~
