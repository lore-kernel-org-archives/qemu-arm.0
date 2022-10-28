Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1515659ejn;
        Fri, 28 Oct 2022 12:46:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OS8DynTvO9TsjRvqtaobS3RAb0BlVRDNS4inPC8ItQZCbcQwy+9aWVuueTKR9vwxPvSgs
X-Received: by 2002:a05:622a:187:b0:39c:f998:8963 with SMTP id s7-20020a05622a018700b0039cf9988963mr945853qtw.603.1666986413041;
        Fri, 28 Oct 2022 12:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666986413; cv=none;
        d=google.com; s=arc-20160816;
        b=NOALeWqxneKYTrmUvGhLyqy8T/JzcrvZ1Odd6yiFJTDlS/nXJBjMyzvGEeRbH4NTi+
         qsB+CUC8GVHz6GnTqF3cHLM5Gjjr3AShl4U2ZFx6zUG80X8fhlO7D34CSxSw8tNJ2yv0
         sElSDGs8YzXJOctn/ZRZpExFql9SPWVPGPRF1Lnb5yesqeaix+p8Qa1DbkJih4mtoW7t
         GduclUikdCqJJBgCg7emJ6FeTjhdXFRFYIi9NN8uvDep0U9fMRAq1pPloO+laxqKsiQr
         ZYww0YspjZ6q5zgQp1UAeP7cXBGkmGuF9TToio7XQ86L3rPLoJcR/eVj4J6BmRZYhVcw
         GcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Zib0GJPPCYGTBQXSJ2rOQOknJzzuaYVualwHxGmDGu4=;
        b=MFn+ViHbyNf51WfGwuQebsnrTzjxAhVpgR+mTBGtH8rhj++1PXLz6gNdFY4g7TlHzI
         /QqsZNzDHn6uFXb0mlt9GvbGLwIw/daHo63BinRBbeR8DAhSnDUK09KADotIZyJVKaeY
         27Nz15mGCz5cm3FejKPN2pj0FCeR6LZcCz9IJ0O2ZFDdtxTEfULedPJrhYvYzPZd7f+s
         cIsmSfMDgNYrTqYTtl8rASjo2Ro1D29yTrERAmipVj3ZlygX5+CVBk5CbpCULqGi6n0H
         NHjcAHZfVfTWSRMIcm6otCQISegccihnywQu1wacfGCXWPoF2E+VCE5haDSnqqnLkupT
         afug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKBGf6l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020a05622a165400b00342f6523c39si3080226qtj.369.2022.10.28.12.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uKBGf6l1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooVJc-0006x8-89; Fri, 28 Oct 2022 15:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVJY-0006tW-3B
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:46:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVJS-0007ew-K1
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:46:47 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 v4-20020a17090a088400b00212cb0ed97eso5412308pjc.5
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zib0GJPPCYGTBQXSJ2rOQOknJzzuaYVualwHxGmDGu4=;
 b=uKBGf6l1LJZNvpBqhbgNbxQHdp9B2/UAkrhLUtYA6FwOLetKvmLzpSEb3tZewBAZsd
 2TTKRAMNX1fHVdOBWPocQbVj9OC/xaIR81TTSghT6voGNE6t02VByuWHThwl8e5z4Qzw
 3eRjS+DlAIAvHi0TS1UG9aAT7guJZxwyivFctcbWBB2tW8K/mDckxrWHnvgTyhr7sTZv
 3yUD7FSCiS+NMOo9IeOkqqLzhfc+zGiIgVO6VSMxL3l1zUxZyqC9WCzKFQZl4iro0vlB
 Dnvykn1pd5nwfX8zXnGJaPrPvVklwLopf9B0InyNysgtTG/Hq5dpnMK5PhirkKQ36A0v
 1F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zib0GJPPCYGTBQXSJ2rOQOknJzzuaYVualwHxGmDGu4=;
 b=MqbcKmLFDSwVapSv1h7QOyL+OqzOCcLt9UFrxTKaHQrfp5f+w5Df0hq0+Sr+ZfWtCb
 Sz8tWE/CMJ5XtbBATOXbrgT0QpG+/UtiO2HnPDqJjolQpeBGYnxOTLHeCr5+7vtfRQdv
 HMNcoNHbmhXbcNkOB+lpaA/09FlkcIdB6zP1DJL1nPGmkmg5IIdpljcnDz4/m3VvNjvK
 Toqek8ttOXzozAZ45JUR88StuFpKkQ857rEgo+mPnFEuI85RPCosmLxyhApci1gQvFd0
 fd/I+nG+TYXxBYBilexoytEEdJYZlFDpylY2FuZuQh31EJPcZ7V7U37sobaZN4FIquqT
 w1Wg==
X-Gm-Message-State: ACrzQf28yI9YVL9DROPpfyOXPlznDkVU26K8giDfsCwHpj/Pc7e5l+sd
 ceNdcvi4VF4Lo9wpExc+wFExDw==
X-Received: by 2002:a17:902:b117:b0:186:a1fd:c3df with SMTP id
 q23-20020a170902b11700b00186a1fdc3dfmr608249plr.23.1666986400945; 
 Fri, 28 Oct 2022 12:46:40 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 p3-20020a170902780300b001783f964fe3sm814434pll.113.2022.10.28.12.46.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:46:40 -0700 (PDT)
Message-ID: <ec4c9fdd-8e42-07b8-7f25-a01affdac35d@linaro.org>
Date: Sat, 29 Oct 2022 06:46:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 6/7] target/arm: Implement HCR_EL2.TID4 traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ntegODl82Ht+

On 10/29/22 00:40, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TID4 trap allows trapping of the cache ID
> registers CCSIDR_EL1, CCSIDR2_EL1, CLIDR_EL1 and CSSELR_EL1 (and
> their AArch32 equivalents).  This is a subset of the registers
> trapped by HCR_EL2.TID2, which includes all of these and also the
> CTR_EL0 register.
> 
> Our implementation already uses a separate access function for
> CTR_EL0 (ctr_el0_access()), so all of the registers currently using
> access_aa64_tid2() should also be checking TID4.  Make that function
> check both TID2 and TID4, and rename it appropriately.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
