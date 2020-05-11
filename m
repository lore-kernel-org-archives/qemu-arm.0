Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp45332lfb;
        Mon, 11 May 2020 03:00:48 -0700 (PDT)
X-Google-Smtp-Source: APiQypKuVW0zyIzk3VJZizQJHi0BkQi5JE9ier159OpLko+wwTpNpGoTdyK9jaXWvonbNPlfaCUA
X-Received: by 2002:a05:620a:1483:: with SMTP id w3mr14540826qkj.325.1589191248413;
        Mon, 11 May 2020 03:00:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589191248; cv=none;
        d=google.com; s=arc-20160816;
        b=tYIUFpGKirovc2BcUENmF1foAgn5tzR4LDN1dNvZoZw/9erjFXoNL6BRbnPG+rghcV
         P7EW/k9CwU2dYJpYt2aQMMWMNh4ljV8ysTxumdYkVhvR8IRrMzgJAvF7GBsxjuGDQfhr
         P3jABYSNV651o87pQwuWAYa+vhV/h3m0rDfhFP3ecnpUNo5sehkFWxETiTCIhmQYRdwm
         xRn3Ivao4NRZt5ZDNlfiNyof21Y/eGtrUoCc5uOpRI3rWMJYmmCd1mKzbF9bCn04zlOL
         1XRS6PFhT/q5VTRwaMxlfbDDh5ZevvABRcuBVIm37IHfF74d66Y3x03XOmHeoC1WIeLH
         cxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lvlRkImLD1pM0alB1uagHUGC/3kVagGNl9hh9GL2TwI=;
        b=DF58gwW15tBK1FX9EwzqonYSl1TGXXutu0B/ZZbv6RNuhz5ZF+Xsh+95MGsVm0qzo1
         9kuHfLmAvxFqyw3MB9/9PIbZkPm4Vk9MlIJukkrVakHvegtTdg8nhzQ3tnVBIFjq6Qwr
         Koexw3H/bvAdRW+eXuU0FzkSapYXoII8s/3Cq8wsiRsQq5GxuZ+1LYapjhqEfEAhH9ea
         KfvstuzGhmp6I03sQI69PMp1xfhO2xoyoJc+FgZF8zv2/qLlE/OCQdHvoPemSvtu2S9t
         DcvDBKhy2wPz0BjK7ijVcK3QyRbAc+MZSSGRj/eJ0wwhxvcZBKmAaltyIngEajKhITRE
         x7MQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mv5IZ0Cz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si3054170qke.197.2020.05.11.03.00.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:00:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mv5IZ0Cz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY5Et-0000mZ-PD
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5E5-0008SS-Fi
 for qemu-arm@nongnu.org; Mon, 11 May 2020 05:59:57 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5E4-0005yu-DC
 for qemu-arm@nongnu.org; Mon, 11 May 2020 05:59:57 -0400
Received: by mail-ot1-x343.google.com with SMTP id g14so7027405otg.10
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvlRkImLD1pM0alB1uagHUGC/3kVagGNl9hh9GL2TwI=;
 b=Mv5IZ0CzkPmaxlQKc4AXRymp5dGGg1Fm9Zt7O0qy337nID//LWpz7QqjZwoVIpfx/s
 zyMJSMEqLXOhbjOvQhWfghKErNkZgZiiaARlMsBcPujAakAOuxNDb4LdgwxnF6Ha+cjp
 75S2UEc0khvIBYwj7lfeLpzY3YyKV/s6MvQTVRZCrzyke3sZxSkI0hJfCb9C4Wy2lTxL
 4J6vg2BSH+VxHeYjhAYuX09Ykjkhl4pjQoSLvVojrf2tM1esOfoRBhnnRoQhZ57Cng1Y
 8fWPPbqviYSjHfN3s0mv2KtDgQ4SNO35VqgcD7gn8swO5nzs6PCbbvXH6bOmllOwTJ8C
 xu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvlRkImLD1pM0alB1uagHUGC/3kVagGNl9hh9GL2TwI=;
 b=bGwoiXMwASW5nEJ3N559+4f2rjQvZXhLh2FrXkKKv9oFyFCC8aiGTjX0oHONMd0PcF
 dQTpBalE3phVjCjkyN9zPN2FejhZqwy2FOby2afDcomsmGa7TTRpJvktPDkYWsTQqSjx
 ZpoUJAkX6Ug8RkmfwNGaCwMd69e2rodxXfsmjWYaCRelJefdg2U0r9z34Abi2RjJXd14
 Ta8S3rQpqMI8rlsaPgILCJRDeVK0Q4T/lxKda6F/mh0G4F7xrUzdyGsTRe4GHJXyw8js
 y4Z1rJgrnJa7M2zyt8g5wamE0GwAykhuPYwm85ziKV2XtdXu+E3sEpnJFvtrz2jrNZYD
 bwKA==
X-Gm-Message-State: AGi0PubLPDIgK+arQ5BDuwlCbbAcrXUYIjWYiR+RgLbg1ds3bVQ0udUT
 RBGNjZ/tEbc6lc53clTl5pkmTXyLqvXxs2vVu+A+2g==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr11792173otj.91.1589191195077; 
 Mon, 11 May 2020 02:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141729.31930-1-edgar.iglesias@gmail.com>
In-Reply-To: <20200505141729.31930-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 10:59:44 +0100
Message-ID: <CAFEAcA8N-H0yWjNv6gosYw=tpWeMRSwPhxGmAA8sgn7f48dT9g@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] target/arm: Remove access_el3_aa32ns_aa64any()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z8SMxMIj2EwN

On Tue, 5 May 2020 at 15:17, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Hi,
>
> Laurent reported hitting the assert in access_el3_aa32ns()
> when accessing 32-bit versions of some of the virtualization
> regs when EL3 is 64-bit.
>
> I think we got this wrong back then and it seems to me like
> we should merge access_el3_aa32ns and access_el3_aa32ns_aa64_any()
> and always call the merged function to handle both aa32-only cases
> and mixed aa32/aa64.



Applied to target-arm.next, thanks.

-- PMM
