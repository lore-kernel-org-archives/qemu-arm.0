Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp545721lfg;
        Fri, 30 Apr 2021 15:18:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6LQMAN3U8/XrsmEm52s6ZrAlUVOmRwerVqBk7btxjCaN17jEWXvArvOED5eJZWX18q5sl
X-Received: by 2002:a05:6102:512:: with SMTP id l18mr8967372vsa.33.1619821130158;
        Fri, 30 Apr 2021 15:18:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619821130; cv=none;
        d=google.com; s=arc-20160816;
        b=cQSracI18LDBDF6ILAM2QMKKG6d8Iixvx78X7Zz7O4Hkk6hGjPtWc7U3/vw4J61XJv
         S0di8iEu3EKL/0JLxvf3akdNuqlGKSB2kKIrbayoB5tLdfCb7QXubL801iJF0ZHad2Qx
         RZILahRDcLQt71vk+PCNgiYVZnsh2od1HQvMQ//mRczdWhM1i9qO8Dz7WpifED5UvSmq
         UOeajsaoyNNN59spD2Qxqy6brE95vwJngA2tajiw8s5DpLA5+xImPl3AgMp1RxOZsycE
         NaGit6iaVQB6RocWKa3udTNa6PRiF1lgxvt9iMbIqdSkUiBSw3S8XdrnsUMI97NI9Rur
         wrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=sgH7Xc+JhEbXlE/S/ZuEZ1wzZmQvnH2wnbQUqCsZd68=;
        b=NROogJkbYgOBFAhZ8uC4ubNugY+WMY59Q/Wlg5m/5jT9sQ2VALDDGRQ6doIr8RTTVX
         48r0d8eSKYsXZqHA8FqH1V4Fjp9E5wsU1n1cAgB3rSuYAGM38DPw8P7NNW8SqCS+0W2h
         YIfVkztX86zexsN/I9gYv4Qn0p3wPg0vZwoIVcli7jKHZ6hs+KSnU/jPDWbwiiZwA1u6
         SaH2r6zo0xhDQV2WQdA0Lj0+cr5V+0e7A397C2mT5YQV3aALX3SXNyl6xZVvE72VNnzg
         88cUkO2HEWrHGgnUOkEki43vSgtznvlqxltwbEG+UV9EEeW6PXvlgZkymXz1Nx5/xOoh
         mEdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MokzxTG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si1393901vsr.279.2021.04.30.15.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 15:18:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MokzxTG4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcbTF-0008Os-DK
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 18:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbT5-0008Of-Sg
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 18:18:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcbT3-0002d8-1K
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 18:18:39 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h10so84319399edt.13
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sgH7Xc+JhEbXlE/S/ZuEZ1wzZmQvnH2wnbQUqCsZd68=;
 b=MokzxTG4w+vw0S6v1qCm+dIvBXJw+gJG25P189Kmx8HrXl/B9nni1PW8RV0mTljnsI
 lD6ngoLAzc1Q4fIKdwEZoxFrr1b7pPSlMj3U6ramQiiZuDIMuZd/rWrind59x+apGrj9
 S8tltb5n02plq/9eyghNTubZyMQ3kZuHJidD0/KqYtXxTc85g98lEsXkFU5zZDjh3rvI
 HwiOC2W1LP8brW7iEtmWP7uT5G2WZocGmvCJ4HNg4gjX8YUaM+GwmLX1GHBFq/R/YgSn
 ikxYR1AB7rJu4SXvoG1NptcTpSX27u7DsL5K0ovQWg4qME5KQXTKJ7Tc1tdOB5zdYLck
 Km1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sgH7Xc+JhEbXlE/S/ZuEZ1wzZmQvnH2wnbQUqCsZd68=;
 b=aegwAVf3x1V7C5LHXpMgg5PGGy5LNlDvZrUY6YUao/E0WCGwd/n4N30l+OAuqqPpFl
 KQIx8cAcHgJuLnmfN/uHIOjzxxa0IZVN9QmnZqEsJ6keGltXqvarYHuipyo8VWTdSTYX
 Oi4R5PzO2h6+tBG0O9Lj+mD3CtCXTeYmygOm9qD9VqmRGVxZWcHMsNqP3EAxJB/rILfO
 ocXETYUQfUkLq4/FpRoXTau1pDdQcjFn+aCS/MSc5OhT80lKPyOpYUXMaCA7LA2Ijcs5
 Gztf3HG/olsoo8jup/S446k9DnYRl2ZSHroDv3cIy2xILzwdTzGsx3zZPe/inErYyYqP
 BkYQ==
X-Gm-Message-State: AOAM5318G7Qf26KdX6aKesfRkHgytYq/1kefE7FGC6tOObuJXL4sgOO2
 KL3YPP18IiORAHTDYE1aTzG7GeH30kjYozeh6pzpEA==
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr8599727edu.100.1619821115092; 
 Fri, 30 Apr 2021 15:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210430163309.4182922-1-clg@kaod.org>
In-Reply-To: <20210430163309.4182922-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 23:17:32 +0100
Message-ID: <CAFEAcA9qz1SLh5Ws7C-xUqvnCJWfFyjjwc8STj4mdUxmCw0spw@mail.gmail.com>
Subject: Re: [PULL 00/18] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h6awjutETEMi

On Fri, 30 Apr 2021 at 17:33, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 609d7596524ab204ccd71ef42c9eee4c7c338e=
a4:
>
>   Update version for v6.0.0 release (2021-04-29 18:05:29 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210430
>
> for you to fetch changes up to 1401dcd8aac9039797b995bfab078877a820c9c5:
>
>   aspeed: Add support for the quanta-q7l1-bmc board (2021-04-30 10:30:42 =
+0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * Fixes for the DMA space
> * New model for ASPEED's Hash and Crypto Engine (Joel and Klaus)
> * Acceptance tests (Joel)
> * A fix for the XDMA  model
> * Some extra features for the SMC controller.
> * Two new boards : rainier-bmc and quanta-q7l1-bmc (Patrick)
>

Fails to build, OSX:

../../hw/misc/aspeed_hace.c:128:49: error: incompatible pointer types
passing 'size_t *' (aka 'unsigned long *') to parameter of type
'hwaddr *' (aka 'unsigned long long *')
[-Werror,-Wincompatible-pointer-types]
                                                &iov[i].iov_len, false,
                                                ^~~~~~~~~~~~~~~
/Users/pm215/src/qemu-for-merges/include/exec/memory.h:2439:33: note:
passing argument to parameter 'plen' here
                        hwaddr *plen, bool is_write, MemTxAttrs attrs);
                                ^
1 error generated.

(OpenBSD reports the same, but there it is only a warning.)

Same thing is also a build failure on 32-bit hosts (where the types
are genuinely different sizes):

../../hw/misc/aspeed_hace.c: In function 'do_hash_operation':
../../hw/misc/aspeed_hace.c:128:49: error: passing argument 3 of
'address_space_map' from incompatible pointer type
[-Werror=3Dincompatible-pointer-types]
                                                 &iov[i].iov_len, false,
                                                 ^
In file included from /home/peter.maydell/qemu/include/hw/sysbus.h:7:0,
                 from /home/peter.maydell/qemu/include/hw/misc/aspeed_hace.=
h:12,
                 from ../../hw/misc/aspeed_hace.c:14:
/home/peter.maydell/qemu/include/exec/memory.h:2438:7: note: expected
'hwaddr * {aka long long unsigned int *}' but argument is of type
'size_t * {aka unsigned int *}'
 void *address_space_map(AddressSpace *as, hwaddr addr,
       ^~~~~~~~~~~~~~~~~

thanks
-- PMM
