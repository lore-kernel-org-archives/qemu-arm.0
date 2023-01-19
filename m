Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp346781ejc;
        Thu, 19 Jan 2023 05:58:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu2KUWthGydAJBYfGj0aWQRbsul9Sc2ZBmhWcGERKGOb9TON8f1hzvMoKTsp5WVz4/mbs8E
X-Received: by 2002:ac8:491a:0:b0:3ab:b012:f173 with SMTP id e26-20020ac8491a000000b003abb012f173mr13587282qtq.28.1674136731136;
        Thu, 19 Jan 2023 05:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674136731; cv=none;
        d=google.com; s=arc-20160816;
        b=lPn5gx+7I0ZHpTxUx6Cyg6DzVD4GHDzzTXvBwOHyoZrd2HL/XCFSMrVNGru7SMXREi
         ZgaABC5ghLHj9wT44TUKivL5adJzJ33XhkQT689eoMlGsf53iEWuYFJmEvu7tYlZfe1D
         dGmYpC+ycgWUXs9JVpFgpTGlCsAh9EAz+nC5rRmvF7yVUZz3ud3vRY/fDZ/N9f8ddWBu
         Eh7m3//BzuQlCtDhyEx1qDLvSaPAGYgm+P+7kttVjUSUbdWfe4O/hG8KvVCWDeU5vGWO
         o3IUypWxAobs6zxL4Lg4agYc7VlFMiNiMg1e6JOMfwhnm23cgdRjAQxTOC+yj3UqYpt1
         1g5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jVZ0E82j5PQjtmnIEv8oH4BUxm898ML+K/0A1gHCZKA=;
        b=Bfak77JkB2WWw64o8xx5wSbToq9BncSJ4PZO8yJuALPREGgdnH6FwV9lNjpIJCKwGj
         4MR330Aj/w14MGRkdqzviLxwlwZOihhmwB8TrzBh0aZdOSL5RVvXiD1u4LT5D9xqiaBb
         CSeuNOWdE1/AtWQmK7lCthf83bILrK5OI4Eg9Y5xlvOQgzhcPdBQRHyJYyC+53Ul7sCC
         1/55VRMGvMXCbmniJfFY39OOq0DqLGMEptDgWltSxi9fgkwsUJ7/VTIImTqTJmxUV+Va
         7lY9xdKyV1ihivuGo55TfJ8wfCbh6gMBpdvB4pn0D3YV8vocFoCdmKQM1IYxr5CLZ9tK
         Xxsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kxwx3YVz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05620a430d00b006ff0d5b01a0si24247617qko.44.2023.01.19.05.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 05:58:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Kxwx3YVz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIVRK-00070R-BJ; Thu, 19 Jan 2023 08:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVR8-0006p2-Cn
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 08:58:40 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIVR6-0006SW-Ed
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 08:58:37 -0500
Received: by mail-pg1-x530.google.com with SMTP id d10so1545905pgm.13
 for <qemu-arm@nongnu.org>; Thu, 19 Jan 2023 05:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jVZ0E82j5PQjtmnIEv8oH4BUxm898ML+K/0A1gHCZKA=;
 b=Kxwx3YVz6wtwigLrCY4A1aRHBNjXKW7hztIktv8zIW58bRKCFP/MycXGl6SolYl50i
 fP6NsIctYpaGvdAi+UNHudaTcPnuDwc2pNbfrkcmal2IUCJf97BNbrh2AsCutQDqkjeA
 V2zdhO8B+Us0hztsf3TqLyTG5XEiiTcEJXqKCf4mAd9FxI1A29dQazbP/0MZvzFT/nFb
 RILqGI6NyHpDj2LGbBXl9/Muv+nrYAEjXyDGhaCW74pqcjIpgNETeZpNjCZQTqchc8qG
 WsxgAxfH0/yb1H53A/XD6dsq2GUQ580+76m1rolLG9P4vCWq8HBp+dA5cGMhcN4w+XSO
 Rmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jVZ0E82j5PQjtmnIEv8oH4BUxm898ML+K/0A1gHCZKA=;
 b=0x7LxxX5g2sGum5LzCmIk91KNOxHR9pKv1oLtMRcrqKYXDd+pFhw0S7Fp01RE0bBbq
 1Tpqave5ST4hXk4YWczsLaIsQlWK8nD+0uRevvDKteg3m2q6PYgYUH3s3L0k9t6z/wXn
 LciRKM6Oq//CwmAClF6yQ3kVdMWieLYY6G2eammf3J5h2sRfCSUMp7enIwRdqGjxPvaV
 qf32ILNsAEh9PI4Bg9/q3JRCIjYZrsB1OigeXTBE0/Y6X9c9M1ItkPqRe270mJ/f0HAg
 UrSddi+LbA6zfsJfGrjlsOS89MF7pkjI5exViE5xB0BKAaf/mDKKJUsqm99UXj4AFfj4
 7XyA==
X-Gm-Message-State: AFqh2koH4kqJkJsWgccfO1RPRzu8XhMNxjNLDdo0Afqvcc2CYOCLsjsg
 2jvtToYTxIlRdZ8zTOH+Oo7QklCK5ufAOwN1lv1/xw==
X-Received: by 2002:a05:6a00:2b1:b0:582:a212:d922 with SMTP id
 q17-20020a056a0002b100b00582a212d922mr962045pfs.3.1674136714509; Thu, 19 Jan
 2023 05:58:34 -0800 (PST)
MIME-Version: 1.0
References: <167398464577.10345.18365355650640365165-3@git.sr.ht>
 <be662a38-c0fd-daf4-88e6-4adcde57fd57@linaro.org>
 <1a029d9c-92a8-2866-d1ec-7fdab4356fb6@meta.com>
In-Reply-To: <1a029d9c-92a8-2866-d1ec-7fdab4356fb6@meta.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:58:23 +0000
Message-ID: <CAFEAcA_G8a82YZyEvmQJcEr1odkQLu_D2bNkaX+1m2EV8TYEkw@mail.gmail.com>
Subject: Re: [PATCH qemu v2 3/3] target/arm/gdbstub: Support reading M
 security extension registers from GDB
To: David Reiss <dreiss@meta.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SGUy9lLVcZb/

On Tue, 17 Jan 2023 at 22:48, David Reiss <dreiss@meta.com> wrote:
>
> On 1/17/23 1:42 PM, Richard Henderson wrote:
> > Is there a reason why these are separate from m_systemreg?
>
> GDB puts these in a separate file, and J-Link puts them in a separate feature block.
> In general, I think it's nice to separate stuff related to the secure extension
> so folks not working with it can ignore it more easily.

The reason is "there is an unwritten standard for where the
registers are supposed to go" -- if we don't follow it then
although gdb will display the registers to the user fine it
won't recognize them for purposes of doing operations like
bactracing across secure-calls. I have nudged a local gdb dev
to suggest that the gdb remote docs be improved to write down
what gdb requires in the way of XML feature and register names.

thanks
-- PMM
