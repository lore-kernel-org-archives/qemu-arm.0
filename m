Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1132454njf;
        Mon, 2 Sep 2024 07:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV593mYQvFFcymsSOODlM2KnbAsZNVa/jj2vKagYVnkheBp4WqE2q+DA+j2BrCSemKn2QtP05Ii4va3NQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGbgYLPHBF3g62oyva2pPx0s88yMVUB1jt5Atc24E2JZVyH5Y/jgi/DNV4z6oh5ZPV97yX5
X-Received: by 2002:a05:620a:1a23:b0:79d:916d:ae5 with SMTP id af79cd13be357-7a81d642af0mr1145281485a.5.1725288809982;
        Mon, 02 Sep 2024 07:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725288809; cv=none;
        d=google.com; s=arc-20160816;
        b=DjaEOwg3e77ecGFwg/mFuqnLvnnavbSjovYbjXAYi+3ihbminLQ6Hy8BO3WTJDWktU
         tm0VloL6JRpnVCFXOkKRx4571+XRDJ854ZSKun1ODNoJI1WUd49GChweCQjvVHSZZYUb
         0TFTJ4HBR7nyxbBS6zjJqzYDYj+bCgAoMz+MF7ZA503YnZwP1IpBxMeOeWUMr/Kv+p5q
         zJ72DebSPELosdu6BX9OGUTGxTtPPOaMjnzsrERWC3dSQgUPTdK9YGithXgNZ0cxfmSo
         LIw+K1gDja2RwjVfFh+A9/lM0VAjYtmX68S4ZbY+lzwf/Jj5dARs3mtDxnC/HjOT8iw0
         TBPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=FnXsLEIwn+qI0IVt9TzgtoKfTRmDgsAoVOM8fY4cly4=;
        fh=HRB6auziM/q0cBkkydNCUcvN05PrTf//CIql+R8S9EI=;
        b=oYeiBE+HQ0tzCJH8mAXGYmBvF+mtbY8sEhLY0MoVpu4PE2Y8fEFIP6Pr0DNO9ElfTk
         29jb1IsLgPGxMHVMxpm2+sYl7cVDNvNI7nSgwQWXw+5I5HVd+A7fenHsGMTbjyiJjfsp
         uD7BEQ2OpE6kADiKB0E0W7A45GMYGmSzWRxrjVzxLHmfZJa+yQXIAf/nD2SPOu3asbZP
         CPbpqqLDBzqAls2Io6lixx9Ifi08OfLI9DbaxaaSIB+KUHsbLNZFX2RyK/nSg10qE9ox
         qWJvQFlgUQ29EQtMInYEWcwQeiH1gSmO6vljj3tyFLx/NUxwaZppqjHfG/SQUbNEyJER
         MGVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eWPyhVQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806c18b28si656705585a.9.2024.09.02.07.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 07:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eWPyhVQb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl8Qk-0004ev-RN; Mon, 02 Sep 2024 10:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl8Qg-0004dU-K3
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 10:53:18 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sl8Qe-0007qe-3a
 for qemu-arm@nongnu.org; Mon, 02 Sep 2024 10:53:17 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c26852af8fso577975a12.2
 for <qemu-arm@nongnu.org>; Mon, 02 Sep 2024 07:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725288794; x=1725893594; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FnXsLEIwn+qI0IVt9TzgtoKfTRmDgsAoVOM8fY4cly4=;
 b=eWPyhVQbEAFwtM1AMJ6JEavI7H8cOBpYGvj0SYxckJR9Cqm7wDOfcUDGMHqnboldEV
 79JzWvQZtXRQijXccMnA0SRMFAqL05VC4GbapDcT8+wo/p1GnnApwoXFq1UwJyVPt45Z
 +RcamFKq7c+KlFviw2QYRoVPnhJPfok1B0kuP+9TVXeJER7/f9AtCkiL32vPpUtpQ1BT
 Egspo4io+XDn9ZDqUoK1q/LYAtNS142apPIGaj3NNK3A0aDqnC2ShzVW1ZOwvjeZlRVH
 dqvDFgxCxlQTEz8frxcvP+e/xO50GbHVgZ7sIsBOCQNWn13Hf0/4sUBkOfCVoVScLVcK
 u/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725288794; x=1725893594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnXsLEIwn+qI0IVt9TzgtoKfTRmDgsAoVOM8fY4cly4=;
 b=QdT0hcg8RtmL5JKa+hRnigMzBH84rLD9ZnQedA3rzkRtnHtr2bQxkF9BAIUsaibbbh
 eS/HG4ZB6EDwZQIdSiqjAvx+M/cOGzRxHdyg6uYiMIUj5fM3GOHJPMNK9dnjbqWoGDDx
 PM27dOZtib9W9jkP3WrYt+GmpziJ8XFjh+v4stuzj2k0xMHBSkw+TIKZdaldloRYmb9s
 1AZJS/bKz6sWHyAxFX9VgIvUWPsYRNGnpKwphod1VrPIJY0AsxIg91lT9cFPPgeVSYQZ
 ebvN85SjhRH9OSv3A2ZIJpijvf16R/HY8lxwlEpA2SMlW7jZQUQx8GvUZj9O8moOR9O2
 9CZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+X1sVFkOjbiJ6APMoCkRqOxwSkcpGwGzxolWzjL6wIeycT6olbyzpETxwkGpfaEFRHkJ8pRmPEg==@nongnu.org
X-Gm-Message-State: AOJu0YxULKRfaHMRbbEWQh0qEo/JH83BbU7sqqoFraRMwjIEYOFqH/uN
 dhgo+0j0C/MfIF3tqiCtb6FqPT77janrM0AD4/rHiDCcrplSLCAF6XxJjnXG90kRQlVQQwDy5V6
 jm5MECDZRUdn9DzTy3Hhq0RMSMDhTdGK7SyDKyw==
X-Received: by 2002:a05:6402:518e:b0:5be:fc44:d159 with SMTP id
 4fb4d7f45d1cf-5c21ed52ba1mr11100472a12.22.1725288794104; Mon, 02 Sep 2024
 07:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <CAFEAcA81xDEubwm7ZYHZWtp_9nZh_gd9o=SZK3WOOm0-9Ja3rQ@mail.gmail.com>
 <CA+1FSiiuThJXkgXOnzuw7U26kXaNuHBrJkmh2EXbtOcH00rKhA@mail.gmail.com>
 <CAFEAcA-8tWc7i2OqQTWJvup0QztOK7XeuBzUohT9eNoEADFKuQ@mail.gmail.com>
 <CA+1FSii1WErcfeNqUQMYMYxtChLETXh8SJX7BNkLm=VThd4QSQ@mail.gmail.com>
In-Reply-To: <CA+1FSii1WErcfeNqUQMYMYxtChLETXh8SJX7BNkLm=VThd4QSQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Sep 2024 15:53:02 +0100
Message-ID: <CAFEAcA9iLM2ycyembkDyUn7NfQwPgu1yyuncP0vT39D2jb1jOA@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: qemu-discuss@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: hKj8rncqswJI

On Mon, 2 Sept 2024 at 15:44, Mario Marietto <marietto2008@gmail.com> wrote:
>
> The real problem here is that I'm asking in a lot of "places",but I get very few useful responses. It seems that there isn't a good knowledge about the relationships that there are between qemu and android.

Yes, I mentioned that in some other thread -- as far as I
know basically nobody is running AOSP on QEMU. So trying
to get it working is going to require some figuring out
of both parts and probably some work similar to "how do
you port AOSP to run on a new piece of hardware?".

-- PMM
