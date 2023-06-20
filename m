Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp375392ejt;
        Tue, 20 Jun 2023 09:42:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7br87tSHdz3Lr2xalQqOODhqngm8tiAYcI79rbYiTWxI1AdSLjmOmHg909YW1vLIDHHcSB
X-Received: by 2002:ac8:4e82:0:b0:3fe:c80e:b314 with SMTP id 2-20020ac84e82000000b003fec80eb314mr7757899qtp.39.1687279322535;
        Tue, 20 Jun 2023 09:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687279322; cv=none;
        d=google.com; s=arc-20160816;
        b=CeVeS05nrtCz1d9FlNdHowWcOucNUevUsPAUVLmsjsYZg+S1V17aZlpdm4jUZsq/P5
         pjOGBEG1gckoaRxSoI0XuiuDEnNDFqBbZbrFnwBwIbWO+MHl0ZWRCzQjiblJbiBVXZ+S
         XdphD7FD4EmSCMrOBQG2RHuaNPYZ9y9szsD4F3gGWRxYM0W3Cg0o28UeWugdTykuGQcI
         Yjv/F/OU5DIcaf0k10PKAeuk0O0Z7Bwknf8afYSV+mbkXp0j7lYlVZ7LqLSyoNBMBsck
         jlGeA/FaJNnTZmffg+vhxjw/aRoiQX2EqULEn0NyCl1J/3l+cW6A/w2Eq4HBKgVw+qaH
         Bf1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gLInNtPN0vC6dKWb43kvEsfo/g0LGqljKuSCRcS4h6k=;
        b=YnTQNXbN9wCdFlVDxA/KMkDuj7tBYeZ3UqfqxM3HC71e+1ttlRrbPL8I0HEqjbemfl
         wjOKofBC3zfMGfeEFhhqcPiVYgFBDj9WTNCx6M8bQ4o1jDgSQQuAp3KSKKIJJhYDJHeW
         IMQWj23htAaPZlX9kPmhMfAGYuojayX7QAqi/UGclNxtE2wEQYVGI1kjzKiya7RGpvi+
         H+BcA7btrMIXydIm5Jh18xkFJQDkJ0L/H8cwnJutbuMjoniAyosxh8KrNHjSbtWbI9zY
         bP0haRp3nbK/689DyzSpHK7CxPlYfWWJIjTOLDnkZLfcY0PlXrfPQOFewSyXg9JSIbCe
         qNfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9iAB0c4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11-20020a05622a064b00b003e13a43920esi923485qtb.143.2023.06.20.09.42.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 09:42:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h9iAB0c4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBeQA-0003if-3u; Tue, 20 Jun 2023 12:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBeQ6-0003i3-PU
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 12:41:31 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBeQ5-0002Le-3d
 for qemu-devel@nongnu.org; Tue, 20 Jun 2023 12:41:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5186a157b85so6813303a12.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jun 2023 09:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687279288; x=1689871288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gLInNtPN0vC6dKWb43kvEsfo/g0LGqljKuSCRcS4h6k=;
 b=h9iAB0c4WSq6kYSah46GKggocaU+lmUQWaWDfmD11uymTeYeLnmM/IDxndxLO2TRWd
 FKB+DvS4DxACxrv3xXjfqhoHBgzbsFO8a7ElHPflZ9+FLrbh5+qnySUKsn1C5fHwEC1G
 EfhNkWAyNtv0zayBS3nbCXLyb+bq2CwyLmofhBn1G/HIZ+XWBOPrIkyqT4keVIRmjxb2
 erq6ilNrPHKd+8u/epEZtHrF5K3vz/Pu3Ssccp1WcNkFvafkVEHnMg89oV0JIlsuBWee
 XXmIeGjHXj5XhqM8pibIZZKJO6QwYpeiJFfafsa+DkKR33K9RQ2PM+kfY9Ia0L2Ai13h
 0xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687279288; x=1689871288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gLInNtPN0vC6dKWb43kvEsfo/g0LGqljKuSCRcS4h6k=;
 b=UkpjYIecSgk1ZtL7pfe/IHl+VTNgQVI4WCd93IkmJvNcpR6yYSN+4dGELTaHS9J33G
 gS59iJ2yDae/ZXv4cWEcDhhK66fH7obQhHg19cdpvaJvUEVb2uQWUfcWvFPxK/7NBze3
 V6j80dZjF/3Gk5Uc2y8FEtaqPOSEnJ9p7kfwcYi1KEA/jrVkn9YsIs6NFMfx6Lc/bIRq
 JienyMdBKLcce/SuDWsQ9PKqWrmg4urJRUWzLopWIIjElQoK9R5EKTccNWH0rOXWkx8F
 9reRf7RBoYd/7iTzUdRQhO0PWGv/FOzKyDOOIEZP2d662PX6yDreaewMU4Zy98g+QV5B
 HkWw==
X-Gm-Message-State: AC+VfDw3RFNp3B4HhdTDx35t3kaVSAZJ5gVKDkF8Iw3jWoGWtzdxjKwH
 CowW8g1Oc3t+6GH3fkxyT8k4AQp/Vo6p8vQOeyi2DQ==
X-Received: by 2002:aa7:c2c9:0:b0:51a:5ac3:4df3 with SMTP id
 m9-20020aa7c2c9000000b0051a5ac34df3mr4776713edp.5.1687279287774; Tue, 20 Jun
 2023 09:41:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230620124418.805717-1-richard.henderson@linaro.org>
 <CAFEAcA91RPvuC_GArpu=x3rEpv1-HsfdEOTGf50N7VY9ZwgtjA@mail.gmail.com>
 <66f83d87-6314-8173-cfb5-47917584a1ee@linaro.org>
In-Reply-To: <66f83d87-6314-8173-cfb5-47917584a1ee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Jun 2023 17:41:16 +0100
Message-ID: <CAFEAcA_ckBzGz2rqgntF7m6D8-T3oAk=z00ASc6iF_nSav+RZw@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] target/arm: Implement FEAT_RME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CMP698Gz2lAw

On Tue, 20 Jun 2023 at 17:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/20/23 17:57, Peter Maydell wrote:
> > On Tue, 20 Jun 2023 at 13:46, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Changes for v5:
> >>    * Enabled only by cpu property x-rme=on, not -cpu max.
> >>    * Rebase vs SecEL2 fixes, now in master.
> >>
> >> This doesn't have the magic RMM memory, which previous patch sets
> >> included for booting Huawei's forked TF-A.  Upstream TF-A does not
> >> have sufficient code to build either PLAT={qemu,qemu_sbsa} with
> >> the RMM enabled, so that can't be tested either at the moment.
> >>
> >> All I can say is that this doesn't appear to break anything else
> >> with x-rme=on.  Which is less than satisfying.
> >
> > Have you tried 'make check-tcg' ? I get:
> >
> > make: Leaving directory
> > '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
> > make: Entering directory
> > '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
> >    BUILD   arm-softmmu guest-tests
> >    RUN     arm-softmmu guest-tests
> >    TEST    test-armv6m-undef on arm
> >    BUILD   arm-linux-user guest-tests
> >    RUN     arm-linux-user guest-tests
> >    TEST    semihosting on arm
> >    SKIPPED semiconsole on arm because MANUAL ONLY
> >    TEST    convd on arm
> >    DIFF    float_convd.out with
> > /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_convd.ref
> >    TEST    convs on arm
> >    DIFF    float_convs.out with
> > /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_convs.ref
> >    TEST    madds on arm
> >    DIFF    float_madds.out with
> > /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/tcg/arm/float_madds.ref
> >    TEST    munmap-pthread on arm
> > **
> > ERROR:../../plugins/core.c:221:qemu_plugin_vcpu_init_hook: assertion
> > failed: (success)
> > make[1]: *** [Makefile:174: run-munmap-pthread] Error 124
> > make: *** [/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/tests/Makefile.include:56:
> > run-tcg-tests-arm-linux-user] Error 2
> > make: Leaving directory
> > '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang'
> >
> > But I haven't run 'check-tcg' recently, so maybe that's an
> > existing bug rather than something in this series.
>
> Not today -- I only tried system mode because, obviously.  :-)
> Let me double-check...

I get the same error on current head-of-git, so whatever it
is it's not this patchset's fault.

thanks
-- PMM
