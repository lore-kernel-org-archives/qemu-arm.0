Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp711144lfc;
        Tue, 9 Jun 2020 10:38:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzj9+H3dRv4Grx6Y+QTfZY1exsSMljdYrWAtOi/oc3gMPNsHOYJSaO1mm1vuCRRmZOup/xe
X-Received: by 2002:a25:2186:: with SMTP id h128mr7608218ybh.503.1591724335700;
        Tue, 09 Jun 2020 10:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591724335; cv=none;
        d=google.com; s=arc-20160816;
        b=oybCbYCEUiP0T35rOORb4ClhztZz6l6XwFZXEnpmDC6yvEMDgLsyzjmUB3zO1itdgr
         iUaVgSfye+YXdvLSK581PpZW2IlFxD2qP19F1EFA18b/I5SxHmFpSpdXWp+Vsue/F29O
         msIrHOh40FPSSSkDgrWXycArALy0JN6k/rgYnR0baP7CbXAEGpmU7HSWrJIeJuWEajAP
         +P29qxtsVMBSW1GNOkKkUROSyKxY8SCNLo7L08OUfvRbZDwywzTovUXcyTleStVmeBaF
         je8ETBUI3SA23SCwLRpU0SQhtbW6LBv2jbzwCOgZ3YhfTS7W7hYjlLxRbKO0lSndUDAy
         F9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=i936mZVtVtxy9RPT3DWE+9QTa+HnOcLpjk01aJFQCKY=;
        b=mfZiveHcY4IaGL4e1aosAiHRmMFTZW2uPghQGO3EKAgPFKZvzs/R9U7b/9nrUSTT7e
         NbX9q+1gYfuqhP7LMkwYQgboowDv4GoofCG75R+dY1nz8krSpDLfAIqyBpfrhIoZ9VNM
         0PAYiy2VTKuhjxFyqM42N70tW1AekUhCXLb6ihRIODMv3r7I3ZMiP8J1H4yX/Y6UITu3
         szI42op8o9cblkXMw1qkjcFmN9m1UQm+NhIIexcDDpqvCX1YzoSGxVXxVCJyT/lMpIlz
         kACDo7czcvx2Mv5QclymlCjtv8bOuSe0i8KG9jEfY/hGMddBZoWftxwUPgEdyKL8oQM7
         7baA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkX1yFRN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si3328978yba.45.2020.06.09.10.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 10:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkX1yFRN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiiD8-0005mf-W9
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 13:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jii1Z-0006Up-2V
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 13:26:57 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jii1X-000344-QJ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 13:26:56 -0400
Received: by mail-pj1-x1042.google.com with SMTP id k2so1684891pjs.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 10:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i936mZVtVtxy9RPT3DWE+9QTa+HnOcLpjk01aJFQCKY=;
 b=fkX1yFRNOBzvw6jPmKDbp1PWHfJpRqHj/mxHyttJnyqhp2qwkTZmGSpyKHWqbwYMmw
 jZeENiYNi8S9/5MA+BAoRJfEOojvRTNdcTTC9LqpYsHlOuBKVI0QkH1g7urLBQf1l1Fz
 aHvR0TJcO49eXwSNdwKL53OD3hYzzoru1hERhYOX62TA02wACqqFCx5NSGUqtAFHCiwD
 CV7lmoSL1V5Id1KXp8+ESlEArBvC5d91/9pfX0cTdkW7vWebBUD5SEOS4YmdbarTG8f4
 kqeUM3HHyNPPHMZuLKAGbsiBaST36txdn+l37JqG7oqYKYG7JnCz9SBPTAtPy1faRSMl
 12Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i936mZVtVtxy9RPT3DWE+9QTa+HnOcLpjk01aJFQCKY=;
 b=gtidY5v0wiwdvXGmebuhzVxm/iW7c/PQN5IUb2GuyB/VXh0G8fWNPPZpTHpm4PyFm6
 5BSRlZNfKiT+nUhItzkv3G431Att6sQj8LV/4E3XIlA+fzxXI57tyO/ETs1hkMewa2jE
 MTR8GHDgDWDUF7JamM+wdhJujq7hRoN2S9jkwiIgWiDdn+6axCjnRYZCM9ZfDHQ6WRx6
 t6sukFI5s1NbalgDKhvRwl2em6iBfztzyKn6bMfypOFGxQcs557F9Q7GyJ24rSMjWrna
 viG0Zw0cJnopQz/aDEW18G993vya4fimBSXjVhdVo2v98/QUXDTvyKtPuLJrf4e2Vxk5
 0BfA==
X-Gm-Message-State: AOAM530v3O4407AHqFimr6MvLWg/rxNlkmuHTMN7x7VhBruGtoch/DM0
 1e7hmno6gBJFEzVdRMFnf35sHQ==
X-Received: by 2002:a17:902:6b49:: with SMTP id
 g9mr4233015plt.66.1591723614104; 
 Tue, 09 Jun 2020 10:26:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id np5sm3299311pjb.43.2020.06.09.10.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2020 10:26:53 -0700 (PDT)
Subject: Re: [PATCH 2/7] target/arm: Convert Neon 3-reg-diff prewidening ops
 to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3d1b2ba3-25c6-eca8-bd63-c70b7b6ae1cb@linaro.org>
Date: Tue, 9 Jun 2020 10:26:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: bX4K9bKJtyxn

On 6/9/20 9:02 AM, Peter Maydell wrote:
 +#define DO_PREWIDEN(INSN, S, EXT, OP, SRC1WIDE)                         \
> +    static bool trans_##INSN##_3d(DisasContext *s, arg_3diff *a)        \
> +    {                                                                   \
> +        NeonGenWidenFn *widenfn[] = {                                   \
> +            gen_helper_neon_widen_##S##8,                               \
> +            gen_helper_neon_widen_##S##16,                              \
> +            tcg_gen_##EXT##_i32_i64,                                    \
> +            NULL,                                                       \
> +        };                                                              \
> +        NeonGenTwo64OpFn *addfn[] = {                                   \

Missing const here.

Actually, patch 1 made me look back and we missed it, and static, in
trans_VSHLL_*_2sh.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
