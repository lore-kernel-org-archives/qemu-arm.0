Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4864337lft;
        Wed, 6 Jul 2022 09:57:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+ZrguIQtdpN99KuBsPgldN9ACY0yN6tU34blBe7SabUapczy0C77ghaislcH1SHtonejn
X-Received: by 2002:a25:3458:0:b0:66e:9924:c3a1 with SMTP id b85-20020a253458000000b0066e9924c3a1mr3650831yba.490.1657126671805;
        Wed, 06 Jul 2022 09:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657126671; cv=none;
        d=google.com; s=arc-20160816;
        b=vEf4BZ08/Qh8ezv3o+8iDR45HE3Ho7yB+RB5pV3nLrxavK+mq+wPHUlrqqlphv16+y
         iV1/kR0PSR1NrCm5EtU7iMIIaK9+3n0IylkTDc/IPtEu0JrwqfsjaOlbVzAv80FxipXl
         FyFrHcxw7s6XfIlWaz8rCawLCJQ6WBYXVA+gYSOIY4J0LD/iibr+DtVImAqZ46ad39Pr
         /lEGD9uV3Oya8LScSyoojivuldd5Q1ocU4IyIUjUF7FTbKOEUTxmm35LEN1uYII1tipp
         OOB61PG4rt8pYE+ICHBwmAk9wqmhrvFbCUJTaPkIDXXvXcakKvuW2Q6ei6jHYhYbags9
         bOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oUJJqr3o/sr+IuGzSM510mn6vzJnc8PqUxx205JqadA=;
        b=uk9RiGfjWFxSkdHxF90jxyq68i3PZVyqZfiQSz0JH/hIIyx+kSBdStlXnqaXI5WAwk
         rtJqZuKPOg+IM72HxNHxi4If3tg2cLWjof7csiP/kLUxwnEvlp+zokJRXhRXz274G8np
         8qjOOj8GvuP5/hsc1dBpGNsEAeuTJ6MkLKIFq32xBesaBv3+Jc49M4oEjRpr9wNB8c6/
         G9hjQBU9E7RV1m59+CX3mkCJomkAPwRaTqv3tR4+Twh5KODoBD6yzvWSdqZ1sMRrHEAQ
         m5KnK65fbvkz78s+sWgxStqlYrZKipkMvvuDEidoPX1FhZ7Uq2z+OduW+O/HBSTJ6wzH
         2msQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O28VqMNk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3-20020a056902114300b0066ea7b7c777si1799361ybu.534.2022.07.06.09.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O28VqMNk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o98LW-0001rS-6A
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98Jo-00089G-FW
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:56:04 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98Ji-0004oV-C2
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 12:56:01 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id e69so21736759ybh.2
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUJJqr3o/sr+IuGzSM510mn6vzJnc8PqUxx205JqadA=;
 b=O28VqMNkrHoMdvFIXAuUvzDs+MEMnRxQxe9UNLVmIozFKYBbeBsbSuUMT3nq1uhg1f
 sYQbch4ISOQVB+/FuhfcloIiH6+Fl4SJlwVuNoD3Hnpt7D5FReJ7rmr9lj4OAkU6sRjx
 b1YgnW0ocMq9EYLQxMC0fCpBPLjP/VaX69lBLWbVHAKdxpDXYzsh6mVGNNtKlyvuIE0x
 WYYMuC6e0nL6BW+xD6SIbc65yCR7iOifN88iL+IwjznXUYpxG+Or2R7v4G7wDe8fra6M
 Js0WZ2do4YRutBKN1IRbFxqcpkpSojTvZtp281vo2mnpRLiH/tTQyNcr2/gWPsAnKa15
 EFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUJJqr3o/sr+IuGzSM510mn6vzJnc8PqUxx205JqadA=;
 b=rqf4xRST0k4j/qLbrRHqDaj6Mxm5tThSKk3q8az2BXowND9W2LWV8YgCviA6ztHEAZ
 YCeWxzpwqGl/N34llioLAPJvD7THQOfFY+vRM8C5vpkzuOZFZijhq65pz1kLr6MGOykb
 mPARn//Z2mtZwFwezE2NGiiD9hgUYg/TC6pShEuCfJGdJ4hpmPg7mNV7O8RnZ5KUHQkL
 XWNX7FYkcZtxusQRQOy7l3V9Jp38sKfH9lig/WfVpcN0HxlqxhyurNu6yaJtqwZYgE5g
 V7/wFSVoqqYdbMlP9a4KnaCoQ5wZU67wxnkg9g4lTUxVhdoAFDkyYtQ/BD+n63PdGftG
 RWiQ==
X-Gm-Message-State: AJIora+0doMQfcIVj/gpkCytgPvpH4WCxqy4Umv8XAHsljdvxiThsZog
 E7/dI9UFdhUHE2Sr0//3ZYiRNFdCfsGjn2jjFPGXaA==
X-Received: by 2002:a25:d7d6:0:b0:66e:47b3:35be with SMTP id
 o205-20020a25d7d6000000b0066e47b335bemr19408482ybg.140.1657126557563; Wed, 06
 Jul 2022 09:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-38-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-38-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:55:19 +0100
Message-ID: <CAFEAcA__pe0qs2TBD7wWvxHqLC6LeET6cr++eFdW_7nTg99=hQ@mail.gmail.com>
Subject: Re: [PATCH v5 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gs81Ps7f0wGe

On Wed, 6 Jul 2022 at 10:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In parse_user_sigframe, the kernel rejects duplicate sve records,
> or records that are smaller than the header.  We were silently
> allowing these cases to pass, dropping the record.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
