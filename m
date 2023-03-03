Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1390675ejc;
        Fri, 3 Mar 2023 10:29:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+pKySdyhXmLQ8Q1nwF5WoYt5Zn5eHKgq5o2aWflBPgxaapUht7LNNPmJ+sRfjOEAz6gDJ4
X-Received: by 2002:ac8:7f16:0:b0:3bf:d0b1:433d with SMTP id f22-20020ac87f16000000b003bfd0b1433dmr5086433qtk.60.1677868169643;
        Fri, 03 Mar 2023 10:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677868169; cv=none;
        d=google.com; s=arc-20160816;
        b=Q4ejmR8K9XprFqCcGe4NmJM/5y07v7g2roDvwAG9dP29VIp1cTt5INjYtw35hyL1ve
         FMP7orWVjT9zTCmAAnpLSaprON95qMs06uIX+vplTGJymgY2/inq07UYCsSKehtgIiQn
         cc9XleNTzZpEr/IlqPILrphd1LCDpuhJEosrRQfvr1FXpfc8VxTnW5p0taaSGT4P3u/L
         +9Mkuy/D011PmCgwzFDO8Yplt6qoPj88+sLKlTo1AEDizJt8uRXnXuzcE0AmhyvXLbrw
         wvEsYawB9/lFZxEtG1vy/GH3zqdFiEC2MxUixlMfW+vYhAFsRwpHhW80nTuazUnysbQu
         Gxog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
        b=rDLeet1Tg+ubpLBNTCkZbKYfR8K49M84PnuP81Dm2hu08zi7rHAX/7cm7ukGAVeTEn
         2QWXhi4bzWIGXUEs1DQiXI9VCmlRqwxdxsyGQxPHAwI2tcLinu1AZc779qgZSgQuu+Ap
         YcKuTA9UT5CGnVNWIIQ5nTW+QHUyfCbIorLvup0s5I21ogvN6msOhTuE9mrlkBuw+ODR
         LkJyXNyB/bPI8rfqntIqqMjqn2uWYHQpvwbeuV+hQ/4yIupH8gNWgj155wGV478q1hYs
         PZlhyttJM/zrWj5545p+Zv9abNhCyN/waBrQuVormq3+EjTFL3yfetquTkmKmmrJoYQB
         hu7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUFDIfBF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020a37060d000000b007417ff5bcb6si1995910qkg.327.2023.03.03.10.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 10:29:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZUFDIfBF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYA9K-0003Pd-76; Fri, 03 Mar 2023 13:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA9E-0003JO-Dk
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:28:53 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA9B-0003RM-By
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:28:51 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c10so2123205pfv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
 b=ZUFDIfBFMlADJFwzSYthFG5z/3Gk95G8I+D3BffJrWkpWddOFosbOGUSp1NR2CVyjP
 YeEsLqNCPk0B42bmgI55+gsinA1JmlcJSS1pAw+27Dp/tNdt4H1IzeyCDkLLWRsyoEeg
 C2EUMsSO8hyUWw9vsH6uHKlPBHpiIUDgMC5e4bTlf8wgFUdMvv6EV1tao8GOt9+WfmYM
 fiVCw7uhv5gpU+g2FLpaWX45Tbiawm2u5AR/L3AuaiKb6vVGVjrnJmtquyCGDcSkqj9m
 JrowgIvW8ecYTQVW4OMvowrexPnK7o4MATm5Uq9n6Jjl38feePzoXO3nRQU7y8KaLVDH
 Tk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
 b=HXgpAw7sopQPnfVxuashLjV9qbBktrTWlsYy6gjoQFumq0cLjmExXRSwwFquizYcv3
 9euBDD1sLrwHEv96EGar+UGNT03MrB9penT0OHOjBFW7zjY/OWgr1zQVeTqCfjG0YRxp
 WtFJz/bNQngAEg1klfTACOj7DCiNYyAly9e8SVzE9nfmIOWMUCJhQs5kpcUM+9kfuqs6
 pO7ziW0sDScl2MF04xFqtL2DVoYC3jH5Y5g/eKXi/qDWkyKyakxmPhtMtjAPlxr8YgLy
 nEJT0nAdp8BrATXdj6Ds+2lokevDKQq3OWLaaGIc4H8xKCn4EHrpNTM/LhFNkQju2QQc
 ekFA==
X-Gm-Message-State: AO0yUKVsPqmQnUin5+k1AL7C32Gu1TClP9qAZ1pnHwddq1ut0CLm6tYK
 XXbk6ZMYKZbn8obGg6qokBxQMkXQ+sBHdvJfJ+2YGQb5UaGbSw==
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr823491pgf.9.1677868128146; 
 Fri, 03 Mar 2023 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-74-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-74-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:28:36 +0000
Message-ID: <CAFEAcA-xToEB=DtqdBGfR6qLV+9UN+n8vQSS9E4RXqo3xOKZNw@mail.gmail.com>
Subject: Re: [PATCH v2 73/76] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2AzJz0Gb4V9d

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
