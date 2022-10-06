Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp525704ocb;
        Thu, 6 Oct 2022 07:37:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM788zPZc/f1pg+Y5xYt6qqxrbPfawBroRQ7gaoPWR1f2Q4lPyB7sJR5x1scA3xl7lOluzGh
X-Received: by 2002:a0c:cb8d:0:b0:4b1:7a87:8ad5 with SMTP id p13-20020a0ccb8d000000b004b17a878ad5mr4296224qvk.35.1665067034981;
        Thu, 06 Oct 2022 07:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665067034; cv=none;
        d=google.com; s=arc-20160816;
        b=KYcEyrZ6lCk5zq0J6WUFNTSynrZE6OGimqwJdx8c1womJglX/UZ1DGNXTQQSafM6yH
         WphR/mn97MxhAQNOGWr3/ofSlKgbN6LR5ohy6K/48r2IcaqGZ/uaYtNjwIt+1/wZM386
         eaulIX4GTjzGZB9wLSbY+n+61o0z11Q215eYiK2fPSeiKB6m5SHy7dNoUAdyDOfSXYD5
         +SMvT7OEztW6Si5+w58LBG77o6lKDgjKY/Xc7uxMGxDnVFKWI0g6fyr+Tj/Ec1JJhMez
         vTImD3wUCS2+icWbWqcters8KY2XDWyWgh7DUkE4AyS747KWNAkIEd9j0EoCyBjNNKbv
         SqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eQU6bqWNs3L7lCQx7GERfMRZmgqYiLbhYE1tNAB2m6M=;
        b=wIOeS5cd9AUYBopcUTzLByV7TFH1+VbC5K7nPiYdtSap9sadQI91XqM9iVD9PtekJx
         ts/wYOPMGsLoCimiKh1Lj721Q0hT9Gc21kLptJWk4DKkM+P3MpQh7CyqbVAVE1Fix4b1
         e0cBw8ZTlzkZVIKwV5kSNs8LMdWE+/3PeaYfJFk7WzeUCBvaBbqG+MdvuBtKbxvOrSZb
         zRD6L5qDeBkgcK/NKG4qdUHLdKZqhBa/dOWrVX+KDNwpAUmQwrfTGid7ee6bx5EvVr8D
         1GfG551MwRZcbQrJ8Ol9lJjyquaL+IE8/VrWwl0JSZFkDfjISind23A88U1QioOHa5rn
         gVNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5bWWAap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020ac85ad3000000b0035ce5db541dsi3307254qtd.172.2022.10.06.07.37.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:37:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y5bWWAap;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogRzu-0004f6-H4
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRze-0004bA-CW
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:36:58 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRzc-0007Yd-RO
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:36:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 e11-20020a17090a77cb00b00205edbfd646so4527682pjs.1
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eQU6bqWNs3L7lCQx7GERfMRZmgqYiLbhYE1tNAB2m6M=;
 b=Y5bWWAapi1YPLGtNfVEb8dUHSeIIwDX2Gq0aXDgEWyzEiVjfGHb1c4/7tm29mDQZRp
 uBSPFcoGuoKYpqJlGY600/+ajdPib0bGvKTK+k6HmO1zTjeJbszeyw2s5APZhoALgMzy
 AZvKBctDgQeZOXFYStXiw0qN98gfbAp0RdnQ45gPAXY4+JECQqJGKQj94V01Iw36ZRGb
 fc0s/RjPhhJmT10/XP30V1CCB/Z5+9xfok6cyNCYprgLLOa6fnMaC4etojSOHoKAtojb
 zcFLhKo4HH2Y5quOndsuYpJNqCGUpQ4YP7XxAFNb2CV2OYjSrXjPN5EaUEnbXZCAOss6
 HGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQU6bqWNs3L7lCQx7GERfMRZmgqYiLbhYE1tNAB2m6M=;
 b=DAk/5+cqrkN8/8G9HtTNTb3SbbtIphMqL8xN7vHm6M03JRg3bYpWaripKl37F21LD2
 yMz/KuJlgtLHo+fdl7GVyIDO/JUenzMUKTF2tdhvreAzFz9wsoLiDXmU5kGZ0tH3mXC4
 hd8G58dJjsY1ml0xGMUuilgb6wEhrespSFj4C5MAztaL0ClIb2KWO2/ReEnl714rZoIV
 4Z9AVHeYSnwClWvHEuyzVf3tSeg31c9lMx26jlljNTlQOzxNmeEDMY4BkopaAMlNiZtq
 SXblyic3otSCBgeIJuKHn7zp2TN6dusabIIsvzD9hzR+JqWlPchVzEc8m7of1u7jrETu
 IG9Q==
X-Gm-Message-State: ACrzQf1B+Um5ohzceD68QmjKFFz8utIFp5g9QiXt9Yid2cvhEbeE1xxG
 tyNwaQi5ChuBPWX//d84tiMN+JWW6MLDSBBRUJ8zhg==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr222699pll.19.1665067015432; Thu, 06 Oct
 2022 07:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-21-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:36:43 +0100
Message-ID: <CAFEAcA_nr8FaB790u_YQHrBhtrRqHs5Z3uopNiVwSP1+LkxJvQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/42] target/arm: Use tlb_set_page_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPhzViWpdB3L

On Sat, 1 Oct 2022 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust GetPhysAddrResult to fill in CPUTLBEntryFull,
> so that it may be passed directly to tlb_set_page_full.
>
> The change is large, but mostly mechanical.  The major
> non-mechanical change is page_size -> lg_page_size.
> Most of the time this is obvious, and is related to
> TARGET_PAGE_BITS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
