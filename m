Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp839754ejc;
        Thu, 23 Feb 2023 07:41:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/eSsnTXGZPMF8s24B0vCcJzs6VBSQpDM0em9jlfM5rOk7JUJpME0Be1YFkf4J6XWKvFXZ3
X-Received: by 2002:ac8:5a8b:0:b0:3ba:1360:ec0a with SMTP id c11-20020ac85a8b000000b003ba1360ec0amr20439553qtc.41.1677166896209;
        Thu, 23 Feb 2023 07:41:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677166896; cv=none;
        d=google.com; s=arc-20160816;
        b=TEm1hZGeH4FlqQIfaHppDiDMaqtmBMVzX+MkvjjGyIA/3mHb5VRp0ahYJyZgJk8IUv
         UAa80+4ilmXVGWL1JabhW3J9KdwL8fCdmzcYZiY7OGb1aZ5CgZqB1lCRcEn3kg5gN+TB
         pQTywvzw89qodtURQsxP6/Av/fbW8vqYnOPGmZ03xCj/nDYMUABJoqscZexG2blBP/5G
         VD88GUz/6363K/BUoaVoBtAVWC6ukx0HQ3ElA+LSytIJ2RAzsUyototQ/HRHWhKq33C+
         7xEDNxkutiL0cSodYQV2iGKGKX9WfIU0zFwQVZyF6mru15mjSgAJ/Xdz0aEqdybk9Spc
         VrVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yrSq04Aksca7zM44nXfT8SjDN7R7k7OwqkfjD9wknjI=;
        b=hiIXT0pQNeM/prKZ/SggIia42p66MgBGlXFxWHkkp2yXkQCLtTf+Qstn+wqAJU2Edy
         egWDtwt3CQHZHYXDbfQsc1HXcXtalPILD0bKJaarzspqZrIGTok+cdtbG6Pybzwf5o7c
         LW3Z1IyG6aSvNrsSwCaor3wI2kdp2edrhs5g7Z5+dVYn5C/XR8s64BaRqa6nu4slFI5S
         WLofoVwO8FsmESVl/uxQlNxlTanbARfyET0EOHeisdQDEUCfLauaK380mg3P2zpedlEu
         7lbwE6fXS3AjY6H9A/8N4/T4vjMHfz0xp4v6yBxgFjRj6+EXxlweOSFG9bclftIVISDs
         JF0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVQylmQl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f23-20020ac840d7000000b003ba2cb1d4a9si1089079qtm.494.2023.02.23.07.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:41:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hVQylmQl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDiQ-0002L7-CK; Thu, 23 Feb 2023 10:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDiO-0002Bz-JS
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:41:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDiM-0007JB-Ia
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:40:59 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u10so13424077pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yrSq04Aksca7zM44nXfT8SjDN7R7k7OwqkfjD9wknjI=;
 b=hVQylmQlPgL5Eld8R3sY9KDD20uhzQZl8zBQ+EtaBKSnHVARwAX+WGax0D2tDikIe5
 Fr9izkwafX+Lrq3R2VrqKn1Qj4TXFnnkJTAVYbZGufHwBuQTZH4hzFWEe7NNwB/57KDF
 RzHl/vT/n4FXFyD+xgq21RJZ9K4/9cFqjtO4y0iNl1wBMPcUpIjNACb8naTOT8kPT2bK
 DYhYUNIFHZY2+3SKLxmdoHvimlsNbrDNNX4DArawpPWIW41WAxSSOTD+xGKRdABP2P9F
 HOSDzrKwJpZ+qZK/02FzDH2AHyFPbaDa2Kkyxm6+tnWPza2D62+jO9FSCJSQ54xDXZfs
 bTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yrSq04Aksca7zM44nXfT8SjDN7R7k7OwqkfjD9wknjI=;
 b=R3R6LZQXsFTlZQRiLM+H+Gzdm2T1LHc/G1UxOnEKOAxOTyv6V+1XvpqcBHDyWoSNv6
 OxppatvGQjZop6vbPGr9t5i/hdYoapD8iMrjnJrKVHQwCB8XwLSA6LfobUAOVYpvyIhv
 Q7aCkuJvfvMF2FYj15MuaRixDQnnwXyX+NkHpQ66tilCVvgF46EbwI0TeJ2ijeZ8qd6U
 rFzABPwXCVOs8zrhE6TdnyZAK8R9Th2NXLDHrjX0Eb+FwBS54dRb/sqM3mow3fyy4rgw
 31410JfdZUBeZg+xFjZmDMmHOo33OlSuhBl4xOtxnnDFmKggYVaypuYZTKsx+1jT0Ho+
 cAcQ==
X-Gm-Message-State: AO0yUKVk4ziBKg2xR0FFSQGfPaF7INYhQWoW0eFDsV4p0Fkn5hOC1jJc
 +5ch3kb+jfelW6KKDpt6NMSr1VNSzQwQf/5y6BBYgQ==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1220080pjb.137.1677166856937; Thu, 23
 Feb 2023 07:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-7-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:40:45 +0000
Message-ID: <CAFEAcA_A2Cizy3SJMMUVxK50woDjZA1ohyVbMCzYyPB0jP+9dg@mail.gmail.com>
Subject: Re: [PATCH v1 06/19] target/arm: Sink gen_mte_check1 into
 load/store_exclusive
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bV/H1h2y+SR+

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No need to duplicate this check across multiple call sites.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
