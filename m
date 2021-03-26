Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1402396lfg;
        Fri, 26 Mar 2021 07:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFsHFu/wvCLTujBAz5WHuDclcJhdgUv4COR9M6LkdrOv+d6bxW2UGU846Id1nMD1ohLZaO
X-Received: by 2002:a6b:d318:: with SMTP id s24mr10683016iob.89.1616768360592;
        Fri, 26 Mar 2021 07:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616768360; cv=none;
        d=google.com; s=arc-20160816;
        b=d+Abt2AkgzZem4fj2f8UCIdsDqn9NHkYA5DVDRAYlKRanPDEieYy04RGGyO0yrs8gx
         i6mS1JEFoRplFHzf3DCa9R+dIHudHQOG9FRFYSPZSdvnwH5kmN8rPOlJ/k+hQclAb1Nu
         0xudOcDcx8Cvvp+q0U/m+UNHeJNCvGTgI2O5tqR6xRjAMJkYVZWWk4rBdozvnXQoallJ
         +g7lEOEP/+/TxmFO2RIJl50Y4suchp/BhrzwwBpVmu1VXbU3PYcOFIGQhDXX6QP3Ulri
         XO87okilylkCk8nPzVIhhC/rnwmunj5Fnd+nLWWtop7lJCsJ/dxxcZsfkM7fRdHcmFwR
         oM9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=BAsIdBXFaH7l4U0IrQfcuNEDeqVf9wqFZqfCa7NjODY=;
        b=rx98mX0ob04HPxKPQUkolgjXMymffUbKF1ST3RLbF0TSgBMtoCF5qB3RjBOE8kVzR2
         2I3VR9HDeiKT+JsqwOzGDsTUozMhGY8S7FgUABb8knBNBDry1vktGu607UX42HP4nzl8
         lZwVX4agwnO7oOmKAF+KFV/ZtGC5A2eZvBWQbP2ZxQQd23aqC+A65pEt3UwelR9lBlnN
         0t3lSTEplwL8dc97p2AhK3nAhk6gmTaWtphVEV1fCXKTWtr5sFlqiAgvWJFz887On6f4
         Oy7vOAPWOg8yXzc7ciYPTdJuU+LSWuMDybCIR+JrxUHWxa91ozPlv3wF7/0aaclXM/+r
         WZzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SEoj9CTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si163257ilg.16.2021.03.26.07.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 07:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SEoj9CTz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPnJ1-00069h-N8
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 10:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPnIt-00068e-J9
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 10:19:11 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:34415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPnIr-0006Ym-Uo
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 10:19:11 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so5364994otn.1
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BAsIdBXFaH7l4U0IrQfcuNEDeqVf9wqFZqfCa7NjODY=;
 b=SEoj9CTzjPR82OjRwhbh6mTm+rVEJsV7SlCutEDo7rXv9mmK8xnId4kHl47JI4BMi9
 Sdi6kTG9OQq9GrEyAy8KbY3bFKiNUXH5MpE0gprUpHqiLH8nj16amnQ0ljs36Hjk/1wO
 X3B93Z/EF7eYBu5SX+kWTXm9v7q3E9/ItdrJAg7B57+h87PQCfKoXfxxbvVwhqBdv1fA
 cJD6z8kwCgsSPX8YbNiFtzxQLXSXBL1wOi10Lz9qUUQq17OzgS8mcO1HylkK/moBKEIj
 0Ow3i66nAJM1yAr9uPSJ7OCYDvAYAmmMuL8gYED6rI+xenRx2lfpOkIAZSzOgQgRfBaK
 HEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BAsIdBXFaH7l4U0IrQfcuNEDeqVf9wqFZqfCa7NjODY=;
 b=RhFnV8UXYeaDqGLrtroIyWUJ5DXYzZUtb/abbklKgL+YVaehMeDVI01bx8B814S/Di
 4U9a4LhgjliMWsKuCJUM/OxlCHyYUxTmFWuEYgYIXUGr8NKbVlkZx+Oy4mHlBARVkuK0
 6ewMlQO0NMDxrSHwiiBjBexJWsUH65eKXX9+fxvQFzdNcYx4kkqEeHxnOnKbkESYVXUj
 Ai6MXj8HBESDSxG1Lk0ZY9Eevpow0lonyEgOduw5lTicJWQpsV22KBBfcvOnBSaiviit
 5E8SzrRvUU6iIu8maTbJjnG6dZN7x5E3zf7OgnLlqOZIVi9b26iRaQeIbyvzq+pLY9sN
 uR2g==
X-Gm-Message-State: AOAM532xJzKRAQWP2XvMATmZ6jFR7HogC/PvNyVcuM1I1P+lHM1lUGcp
 Jbp5PO+B3+9pC4WdS1ZvMU0j4g==
X-Received: by 2002:a05:6830:149:: with SMTP id
 j9mr12032886otp.66.1616768348726; 
 Fri, 26 Mar 2021 07:19:08 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id i3sm1918836oov.2.2021.03.26.07.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 07:19:08 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210311165947.27470-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0409d14a-85ac-aed6-1867-5ee95a3926ca@linaro.org>
Date: Fri, 26 Mar 2021 08:19:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210311165947.27470-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x333.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pJTCIiToeMxT

On 3/11/21 10:59 AM, Peter Maydell wrote:
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
> 
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
> 
> This means that we now supply 6 counters for Cortex-A53, A57, A72,
> A15 and A9 as well as '-cpu max'; Cortex-A7 and A8 stay at 4; and
> Cortex-R5 goes down to 3.
> 
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This is pretty much untested (I just checked Linux still boots;
> haven't tried it with KVM either). It's an alternative to
> just bumping PMCR_NUM_COUNTERS to 6.
> ---
>   target/arm/cpu.h     |  1 +
>   target/arm/cpu64.c   |  3 +++
>   target/arm/cpu_tcg.c |  5 +++++
>   target/arm/helper.c  | 29 +++++++++++++++++------------
>   target/arm/kvm64.c   |  2 ++
>   5 files changed, 28 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
