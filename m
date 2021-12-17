Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp911795lfc;
        Fri, 17 Dec 2021 11:48:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBlWM15iqyoKEgDxjUXM1HVGyFHzgcrtu1NFjAAjlTJXZdO5duUTshyCBjWbiW/c2l1nlc
X-Received: by 2002:a05:6e02:1c85:: with SMTP id w5mr2515822ill.272.1639770527221;
        Fri, 17 Dec 2021 11:48:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639770527; cv=none;
        d=google.com; s=arc-20160816;
        b=kz6ZsQk/mWeYn9XgAfypPoJtAzgODnQolJTAGJTkjgtXBbBK80m7uFfNClniHSZWJo
         7OUBAIrHWkeLgsmjfzopamSvR22d+A+PRtTeAx+CIqsApYWViI+3Kp76qtoFbuxOyuCk
         Mz8u71oJXWrQzTCcvaJQP54/MUJk/AyyRTqo6sckl+vhNTwPv3f9/zE6qViLfqV3LlCO
         2VS7CVdtAxKQj+uYrWRp49AbGAWU43GL+7sBHMVc8DZyJAMckZGkOv41PX4gCjKZyQKH
         0qt1x501PxJK61Eq+aigV4NoM0H+pWg4cHv0bUGRCS7BDfSyQaJxOrJNso8JZ4puhkUi
         VKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Mmwb/TUhfYlfXF5IlJ4xgUdvNQj2n4xFphsFeGucveY=;
        b=SiqMXTs95bLrE9YPkcRMxGdx5wk0e7F5dn4LS2DgYLqH3cN6LueOiIG2uTvw1jikov
         HROXmBYCqQwogcYZ1XNf/VUl4X0QZy/WRjtRjuypBEi2bLNpSuDkgiN2bUefMnOUq1vN
         1gHSPZba8sVzgkm5Dg/O/iEqDXZpCSt4tfRpITYg/jW6APiIWlO7XB3AGXLXRPIgOKIE
         qTcVuqWvoSeXgtZUnklY23KehCdWmaDkEUG77I2SMJLJwVbZ5V6JXkl2J1zEaJGv/11b
         XRJ4VGPXyPQwnx8vz6eIwFIK7bCQ0+QabeXndxUFP1eNtjHCJgvn7JvEDzblHZSU61jq
         OvJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wK/uszhT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si8689025ilu.111.2021.12.17.11.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Dec 2021 11:48:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="wK/uszhT";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1myJDi-0000uw-Ll
	for alex.bennee@linaro.org; Fri, 17 Dec 2021 14:48:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myJBq-000051-47
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:46:50 -0500
Received: from [2607:f8b0:4864:20::429] (port=40714
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1myJBk-0000of-FN
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 14:46:48 -0500
Received: by mail-pf1-x429.google.com with SMTP id z6so3111490pfe.7
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 11:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mmwb/TUhfYlfXF5IlJ4xgUdvNQj2n4xFphsFeGucveY=;
 b=wK/uszhT9AWU32O3CJZ+FHcz5FxRh8HrXrZc4sWg44JvW5XHYLdNhuDZ9lsJ9v9B8r
 3Up6c+LK7TVf+Xb6rR8ZbNz5Te7c6DbaweEanA6WqjpyBisis36910RPxU5vrjipzZvq
 8GDixw+oahT2yjnApHwxATDBtcAoQHYH0fqWmalaCJER99rstbCewZ5aJ24PjhwSSJJA
 Xa+M0cITFFR9gEcrEbT/uAhK5+5aAzvCaRbM41ZbBcgJDxHxzsIIlHeMELbwdkblg24G
 mIcFEmUmTP2HKXFekD2JPUbySyO4QGLp4TIMc4Fj9izygt/8RFznBOcejh/PJCknDabS
 GD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mmwb/TUhfYlfXF5IlJ4xgUdvNQj2n4xFphsFeGucveY=;
 b=Rc+SsVWiDL5GSYfGEPGioXetGqoRrNCoYuK+r8qa41pm67yhluL1SZUd6mgTsEPOpx
 bCNeadsf27WkH6EvVZV+5/HkvoBx78hEHlBfNp7mjvs4ejsdg5WvSwminKt6CIDrKs93
 0r0nNptTdgqw+pJZ3+/u56+o/K9ZV/fZ9WKAvwv5JO49KGBZ6wARGIgwKtB6AU1LmUOj
 NqNc5REvV0z5al0JirfEVjNlHKwXcHKhonfUiiIRnlD+Gs87eemXpdghPuqcnJNs+qxa
 /3pxLpAr4pitQpMGHY5sMxTYsx2kFAta0wye5XVmFjp3bd3kAdxS1o3aAXCENpJU+6QK
 zboQ==
X-Gm-Message-State: AOAM533exheaTrsJBhkdeeu1EPfdeXZm40O+Iq6LMAsdsySb0CBQrChK
 jLXTUltjtdhmHEYidmvIEVHLSQ==
X-Received: by 2002:a63:1349:: with SMTP id 9mr4132615pgt.379.1639770402788;
 Fri, 17 Dec 2021 11:46:42 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id y31sm11408728pfa.92.2021.12.17.11.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 11:46:42 -0800 (PST)
Subject: Re: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211215182421.418374-1-philmd@redhat.com>
 <20211215182421.418374-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b360d5ef-0557-c0c1-344b-fae94b7085ae@linaro.org>
Date: Fri, 17 Dec 2021 11:46:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215182421.418374-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zcKPogOZE1nQ

On 12/15/21 10:24 AM, Philippe Mathieu-Daudé wrote:
> +static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
> +                                           hwaddr addr, hwaddr len)

There's no need to mark this inline. Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
