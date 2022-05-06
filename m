Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1986946lfj;
        Fri, 6 May 2022 11:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9spTnWa2LT1TZWFOoMaJX99sIFGUtNkZ5bYmfJqirIGiec+XGLmTUO3bqpC/AGLqRMdX7
X-Received: by 2002:ac8:5a13:0:b0:2f3:b8e5:293a with SMTP id n19-20020ac85a13000000b002f3b8e5293amr3942981qta.317.1651861432091;
        Fri, 06 May 2022 11:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861432; cv=none;
        d=google.com; s=arc-20160816;
        b=P/hWHMKeWbjTqxIeym7KkHH+RJPu0jS376bjdQMitV5SQRediQQ2I/Z3pLIF+mK9Sw
         MT9uvbBoz0dNX0UuFy+fuAJs9P1/m18t/9APbedMy0ot50Y+1Our1tSIl2PDgAIyE3sK
         k/khlBvZ7fQJuzQg+w0JrskHsSjlbkSuyyrYSToF830jbix+M3iHihE4i/ddlzYu/0iz
         9iHQC21eVJO7eTocFSFEIKLyyIe7atD+/EikfBaB1/SHbTuE32l3fFlKs2aIHDlFIz3p
         617NS3WFNYjgLvWcZhhNaX2J6Sqs1C/Wdibc4ePyLF/73/hbMTRQ034tCFrVXJDBd4B3
         xizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IkxR5VrvJUxfpcOruyMZK9+VjFO8QUBsQA+4dr7q4Io=;
        b=jGdUbTlWpMAfExkQg2g7R466EaJpx3aDAIfjI6hOhvl9tC0bmyqnd+vNMOOqidT+T6
         Wl8ELtmXrfEK8X2wwVPpQcY1RDTUV93OfibA+yQceTMRJdoTT32ZhcYZ+rjaHUVmD6/P
         AfVnHDI2tanmhygxwkkG9DhPpUr/kq1TBtBC2z+4gbyGkVm+6fj8bdgyqWRnjl0f2lMj
         Av4/935J0PkyAL4vS4ycnQfuUBQWhWR7wPSV4mcFWAKWjOFfdpcVjGUswF4YAMnCWtve
         z87RzWSlRJ0URv2VFN5ECm6cfLRfiVVYGCP0BYNg8SwOPtYG2q3Eede+q3QmGxEOPsyH
         R6kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwEj75vE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14-20020ac85c0e000000b002f3b9606924si3022310qti.540.2022.05.06.11.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OwEj75vE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2cJ-0002j0-KN
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Sz-000151-37
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:14:13 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:35310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Sx-0005yw-CO
 for qemu-devel@nongnu.org; Fri, 06 May 2022 14:14:12 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso8021711fac.2
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IkxR5VrvJUxfpcOruyMZK9+VjFO8QUBsQA+4dr7q4Io=;
 b=OwEj75vEPLiDB4MdvoMLC/IIuhHo89likg3vecHtnAlZyJL9MjATrnwNs7V18fFq7v
 vN/82F3mu6H9RGuYSTS+J3bO5ay7feNmyoTb+4DQuNvBZ9VXQPFoEt7E95HsQuNWkf0U
 Gkb+i8dJIoExUmVr09+QIX+1P38PfdagJOtomW183m/k53/JohwcLB/muAMVxkBdfc/x
 X3d7EroLUhNKQ8OyMt1EzYdJWLT+I8ySZWRrch3xnz0jv/KkyBL0+aAUh+VFZyt8TBT8
 ebiV22mFCBNsZZp7sSOP/yD8babDl6z7TWhOBry5qQ+yGGcvpwX0LwHzlGLorPnzKIEw
 4YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IkxR5VrvJUxfpcOruyMZK9+VjFO8QUBsQA+4dr7q4Io=;
 b=Zr8ceDi8i78xHqzr2AJYrmMQY9Y8Uq8qsVcXR67650S7Lf+0PUG9rE1zIwt0Qp4jst
 vI1Xuaw67l/lsDkF9KiL3Jqtgs1eHbZPF5uWJdVABu/KWjadHSPMveBzYOw61aa9ZJgf
 4SQp3bUZt4mTTwoCQxBmyAb1os+kynBChAvI5xllBgBM4Knq5tiiNPLAJGV8tdndsdZd
 NKuJZrA9s7JVJz17in3FEJ2EfIFn3v/gQULDYzPfGbZgHAkc2KQ27VNvZcM3lS0+QMlF
 EZU9hNXGoewM5+Kx+Qsq62fIs19Ti8+BB2kkSM/buHDqIuJ9LANXmBn3Qowsb+m8lgnd
 MEOA==
X-Gm-Message-State: AOAM530SUy2kAv0TMCD13PPswq5E0zqBLlkTNZeKd//CWmeFX9WbP7Ia
 Ikz8stNckwl7cNHhGy7X0KukNA==
X-Received: by 2002:a05:6870:3282:b0:ed:a4b1:39c6 with SMTP id
 q2-20020a056870328200b000eda4b139c6mr1894841oac.2.1651860850073; 
 Fri, 06 May 2022 11:14:10 -0700 (PDT)
Received: from ?IPV6:2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2?
 ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 z39-20020a056870d6a700b000eb639a5652sm740461oap.37.2022.05.06.11.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 11:14:09 -0700 (PDT)
Message-ID: <4f679852-3cef-3ad1-7f47-987dd0f6739a@linaro.org>
Date: Fri, 6 May 2022 13:14:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/4] target/arm: Postpone interpretation of stage 2
 descriptor attribute bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220505183950.2781801-1-peter.maydell@linaro.org>
 <20220505183950.2781801-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220505183950.2781801-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
X-TUID: SeXn206f6Cxi

On 5/5/22 13:39, Peter Maydell wrote:
> In the original Arm v8 two-stage translation, both stage 1 and stage
> 2 specify memory attributes (memory type, cacheability,
> shareability); these are then combined to produce the overall memory
> attributes for the whole stage 1+2 access.  In QEMU we implement this
> by having get_phys_addr() fill in an ARMCacheAttrs struct, and we
> convert both the stage 1 and stage 2 attribute bit formats to the
> same encoding (an 8-bit attribute value matching the MAIR_EL1 fields,
> plus a 2-bit shareability value).
> 
> The new FEAT_S2FWB feature allows the guest to enable a different
> interpretation of the attribute bits in the stage 2 descriptors.
> These bits can now be used to control details of how the stage 1 and
> 2 attributes should be combined (for instance they can say "always
> use the stage 1 attributes" or "ignore the stage 1 attributes and
> always be Device memory").  This means we need to pass the raw bit
> information for stage 2 down to the function which combines the stage
> 1 and stage 2 information.
> 
> Add a field to ARMCacheAttrs that indicates whether the attrs field
> should be interpreted as MAIR format, or as the raw stage 2 attribute
> bits from the descriptor, and store the appropriate values when
> filling in cacheattrs.
> 
> We only need to interpret the attrs field in a few places:
>   * in do_ats_write(), where we know to expect a MAIR value
>     (there is no ATS instruction to do a stage-2-only walk)
>   * in S1_ptw_translate(), where we want to know whether the
>     combined S1 + S2 attributes indicate Device memory that
>     should provoke a fault
>   * in combine_cacheattrs(), which does the S1 + S2 combining
> Update those places accordingly.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/internals.h |  7 ++++++-
>   target/arm/helper.c    | 42 ++++++++++++++++++++++++++++++++++++------
>   2 files changed, 42 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
