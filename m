Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp980113ejb;
        Tue, 13 Jun 2023 22:15:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4O1Svvio+L6HWw+dvgGOv9FNnqHklKYCk1P8z3tTjyRMt3KMWoplKfZFL31BudCH+lKGEh
X-Received: by 2002:ad4:5cc5:0:b0:62d:f8e7:3044 with SMTP id iu5-20020ad45cc5000000b0062df8e73044mr3800307qvb.1.1686719739501;
        Tue, 13 Jun 2023 22:15:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686719739; cv=none;
        d=google.com; s=arc-20160816;
        b=cUweVAYanEPQSjoDpkOSw5ZfFP+X6aFI3JCWrLVx4g60ThC9Zt3EZCfSYHzMamiQ7F
         Y6dGB3F6DTKP2nk4AYwa5grtsWSfJAh0njpxUspW5heJaZ+I09kfAbibI5eDd9aRcdSI
         f9uH2H4tMeHkAtPbJg2z9wMpqeQSet7KoYGDZ/HQ3RoAw9UgaQcZuVBO1MYCRQQvA23M
         s8XhQloolZvlaey4C9X7gTT41qP0pFA1gFUmVDPyFDFhQJf51xm5himIZ+8c2roIT+R9
         i04YT2oK/IfBreF7rYvl2ptoWrLnPA2Ft8tonUXR0fpY23xYAjyhddM2GtnIQ+PyVud2
         H6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MoyoJuP23Bw8Ze7mOXHxgQzuOcLqIfN5RWRdROWIjy4=;
        b=Hi2lpoDvyG3tQ6HVm5ObtVnviyAtbzpIWTyIK816ZGH51DiPrmxrZ8HL4J1LimcYEr
         Ty72RvnZu7C9+7q4jRgoXwVwCiuxDsgaqQrhf2qsx1T/U1yHM9SCzetAu4LrDqSHygS3
         9vqNnAgPVI/5HTD2ab6B8lxR7TOwkbxJ4zbZBM7u1ChQcIfdtmCkij60szMYpVX77e4H
         EHkmQ06zNMxHMRfG6ThPIo5AneCXAMvB8pkTgk4l7QoYlnOBei6F4+iC1A2Y8qdlFaEm
         Sg3izJo1STqlseoLA81nfag5efDTRr74Z+4taW0tOEUOuhQHJlRQvNX175i1O3luIQW2
         MFnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIwc0YRI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx4-20020a05620a51c400b0075c974ce523si5266893qkb.577.2023.06.13.22.15.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:15:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YIwc0YRI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Iqe-000445-Bd; Wed, 14 Jun 2023 01:15:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Iqa-0003zq-DD
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:15:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IqX-0000fM-Ft
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:15:08 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-307d20548adso4456630f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 22:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686719703; x=1689311703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MoyoJuP23Bw8Ze7mOXHxgQzuOcLqIfN5RWRdROWIjy4=;
 b=YIwc0YRI/azSD4oj7159JmDW0QkUrMOTXtds+kcn0SmPTiftV6Q6jTyrhGEZr0s6rQ
 AL5zlnz1WVLLBBtjtI58mqmzviM2t+s7wB0A7bolaFCEiJcrZ52F3IIiT3PW4j9OutXz
 W0NM6ghGR+boYpkycQllifWRaTsP8KGnE5nHCNwYcK4n1UMaqsyX2Ey2D/6KzABOULXm
 UPl+MHwBjNgb91PioJBdet4U510xFw76AIlvKaeTWizBndl+JEZw95BN4xZsQS2p0pwh
 4E2f10fMath50bNx+iCTaFpCN8ajNjVaY3GoNLrKJd8TyzxWMwcxee7rc0Uuvj9iCaDK
 v/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686719703; x=1689311703;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MoyoJuP23Bw8Ze7mOXHxgQzuOcLqIfN5RWRdROWIjy4=;
 b=FhNe/BLrwk9tWmjMt4mXK3w/obohTL9EfbS67SA2WMAdTSWrsgoEQ5c5TYaBHthWxF
 wKmULlK4SGo0BulP8yRT45r1csDbkIQry7lgKpRaxqBy+MtbfFN6KMkWz1klLiHzh+8R
 AJ7TNp1wLy8UkKveMN9Li9L4pv23nVqnlmCKZj0oiKrnQ8D8Uq4QU4AGvbk+rzMTVsZO
 tMHbjCJwIBTmJbLaI/WciVGsXPiEIbKmM6Y3RwA7ILJf1YA+1Z4R6TaowRhI+SUvyrYf
 jP/+PSt1LVxJKH6tEtQacITffXgrCn7yJwTPYt0pftCZz1ycECZuIxzZ42K8MWkwQz2X
 A0Mg==
X-Gm-Message-State: AC+VfDzVBuBiapPrCn3SnRfj82v5Dp0Weq0zLiK9j+pLpf3SH+fX6p+L
 /ZwsVUIaqSjQkObtPCvo55Bang==
X-Received: by 2002:a5d:67c4:0:b0:30e:590f:78d1 with SMTP id
 n4-20020a5d67c4000000b0030e590f78d1mr8259415wrw.63.1686719703405; 
 Tue, 13 Jun 2023 22:15:03 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 v17-20020adfedd1000000b0030630de6fbdsm16968233wro.13.2023.06.13.22.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:15:03 -0700 (PDT)
Message-ID: <f4bfc853-b926-6ae3-698e-9a4fbb75c76e@linaro.org>
Date: Wed, 14 Jun 2023 07:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/9] target/i386: Simplify i386_tr_init_disas_context()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230613133347.82210-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: dHAAjPFXRBis

On 6/13/23 15:33, Philippe Mathieu-Daudé wrote:
> Since cpu_mmu_index() is well-defined for user-only,
> we can remove the surrounding #ifdef'ry entirely.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/tcg/translate.c | 3 ---
>   1 file changed, 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
