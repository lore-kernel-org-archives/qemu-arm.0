Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp768855lfv;
        Thu, 4 Nov 2021 04:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIHxC2caHN3FRBgAEaUgVE/fDOrMxPTUK6GSad2894aR/O2cgc/e4+Tu3pUy7mGzgBDR1I
X-Received: by 2002:a05:6820:556:: with SMTP id n22mr3124364ooj.65.1636024435238;
        Thu, 04 Nov 2021 04:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636024435; cv=none;
        d=google.com; s=arc-20160816;
        b=DxQneTmePwDKCjUZJ+001szqFYkDIK2na1REuz2NXUiRuYjChF/gG39RVNy8Da8S4Z
         X7EG0tiuF4ljNyW7MGQ065U0Io3TQwVJ1WKligQeAruK9lDBGtQPZkp5XRE1OMQ2oyer
         nSnDpDZLIGInqVBkpN6/R53RmWc1ZaXX1xYQkOjgBVt6DdAMFZ7Z9KX+d/LmzV6t5902
         5Kkb6ge2SamKqoL4xFracJZ1FtItwFqjRS8ijniojvHAARRcFizWfjM20QFfv3Dh2GwX
         8J2fZtp6llXUkwsjaWxegCo5WWbofth/irmQBTOKkdpkiD2kbQQuH8CX+nuO4db6ZJMe
         IylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Vwonmle2nZhFpkaoLiPD3pWkHX/BW9Nnb1izCtQJD9s=;
        b=GNm1emZgG2Kwq3ksLOmpZJJourt6XHT+a+6OQLMhOQ6UwZGqQKSvCInBHfA/2Rl0cb
         1+W9IItnQ7I67rl/HLmG3y68xnfFPMH+iyX8+EXMI83F7KGMsuVfDblolRyS4AgbEQ5x
         +i0/BXXWkyt+kKyaYSFJv5n4rHSXR20g2HaBDEhKckQ9eCtW56zgjBbbwSZGqvCRp73V
         wOnjX55RNcY8VJvCUcIy3yBe5kBijOfDU8px+1dizmNqI9pr1LFQ0tgrii/MA5F+uukX
         5huQ7k6WyWfjHJGw8FA9QmfgfEaJBG1b+Q2jUSc9td+cdjuKs8ALTkPRtc7oKcmdNOQN
         qs2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4puwFdi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si6134528ota.246.2021.11.04.04.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Nov 2021 04:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F4puwFdi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1miags-00052l-Ha
	for alex.bennee@linaro.org; Thu, 04 Nov 2021 07:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miaeg-00035M-6d
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:11:38 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miaee-0004er-9S
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:11:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso6908380wmd.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vwonmle2nZhFpkaoLiPD3pWkHX/BW9Nnb1izCtQJD9s=;
 b=F4puwFdiUMFgOj2LA+QfjUJP3V0iz2rkoKb4R4iM90VpX7GLZ02yqsu31HX/awkzqZ
 +JERjw4l4ZU4ygdmj95a35Nu88BhNCg9iCwrXpDD6OWvJNex5+tCIrX4fCmqOHMtRD0e
 TF0ItyYynuvd14IRKTwsm+ssnF5IGV/egGzwV+DpBUK1/jls9DiFtDWqyo9psuCcjBDs
 LSdOO4pvJAJdR9F9pa4FGuefCMhEg1eomHxTjHZ9lG3qM7rkYQ/CF2QG+YpKeq/LXgU7
 At1xzwETCGDwkj7qGd8B0e9rZMx8CaXmfcFIcuqh3Vd2ORjgI+e+M133AAtlzykCJd8a
 J2uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vwonmle2nZhFpkaoLiPD3pWkHX/BW9Nnb1izCtQJD9s=;
 b=wxYV3cXMlDw6vaWuE+f2DYHi9OeklrZvk45E5+4PnwCAIV+66VyXg9peumBkwuBBDo
 hdlhe2aYc3UmniM2dAklLYAcdEo8rAz6srpDNT/7CR0KyvcA9mfpOigOnKqk9ehgn811
 zERUAfut85Ai6VlxMt0+iH89OKq9M3QSBy3MjvcLqS6uoRLUPrYxq/0xp6cwXp2Y/Qfl
 5iWcco+OiJMqd1q5aPLJoHWiUDW8sPXYss8ViUse6OUSh8+YC6g8AlTptvcwAZc4n5l0
 Tnbd/RT8X1nzLEd/2QRYjHBtkM0+EL7+Bh1cJBGi/hDOhbm8A//7Ps4uxUNV12eh+tkm
 RZMw==
X-Gm-Message-State: AOAM530jY3ODXv7A80rd1np1JycIGBSBZQv0hWTL4AL+mBrAM5EhB1Ts
 k3iJESjwalmaDl1BBt1rT/j9xrL//MuxZYBnKAD9Zg==
X-Received: by 2002:a05:600c:1993:: with SMTP id
 t19mr3717976wmq.21.1636024294330; 
 Thu, 04 Nov 2021 04:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
In-Reply-To: <07e63acb-b756-2586-2ba2-b54b837f7fc8@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 11:11:23 +0000
Message-ID: <CAFEAcA89YQ_vN-JpCeB+L==F5g1hM=CNMBzjaf5c3EHF19NVyQ@mail.gmail.com>
Subject: Re: Qemu and ARM secure state.
To: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hxkrKW2byTMQ

On Wed, 3 Nov 2021 at 13:27, Jean-Christophe DUBOIS <jcd@tribudubois.net> w=
rote:
> I have a little application that is designed to work on the i.MX6UL proce=
ssor.
>
> I developed it and tested it on the mcimx6ul-evk platform emulated by Qem=
u.
>
> This application used to work "flawlessly" on Qemu 5.0.50 and is working =
on Qemu 6.0.0 (available as a pre-built package on the latest Ubuntu).
>
> But when I try to run the exact same command line on a Qemu version I com=
pile myself from main/latest of github (Qemu 6.1.50), my application fails =
to start.
>
> So a little background:
>
> My application expects to start in "secure" state and supervisor mode (wh=
ich is the default state of i.MX6UL when booting barebone [without u-boot])=
.
>
> From this state the application tries to get to "non secure" / hypervisor=
 mode which imply going to the "secure" / monitor state before being able t=
o drop to "non secure" / hypervisor. To do so is runs a "smc 0" operand (fr=
om "secure" / supervisor).
>
> This "smc" instruction is processed "as expected" by Qemu 5.0.50 and Qemu=
 6.0.0 (getting to "secure" / monitor mode) but on Qemu 6.1.50 (latest from=
 github) it is as if the smc operand was a no-op. It doesn't trigger any ex=
ception and the processor just get to the next instruction after the "smc" =
instruction. So I am a bit puzzled.
>
> Is there something that changed in Qemu (since Qemu 6.0.0) when it comes =
to the "secure" world/state?
> Is there some additional command line parameters to use (I search in the =
documentation but without luck) to get secure world behavior ?
> Is it necessary to "adapt" the emulated platform (i.MX6UL/mcimx6ul-evk) i=
n some way (it looks like the "virt" machine with "secure=3Don" does work f=
or arm platform)?

Could you try doing a bisect to find the QEMU commit that caused
your guest to stop working ?

thanks
-- PMM
