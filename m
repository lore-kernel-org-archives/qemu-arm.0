Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2176674njb;
        Mon, 16 Dec 2024 05:40:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrZyEAlm4GmOcHkXdAA6MFJ4FdLE1vzcl0rWDJn8mEgmZ4kxJ/aDnKD9VAOLqX7VgV6FUemXc/qSupwA==@linaro.org
X-Google-Smtp-Source: AGHT+IFXHAAzrfGdE7B9ZE8cW/CnfqkF7j+LsNhBzdmPyxkK+gRwSNe1sy3OqfcVIOJdCdl3oGeN
X-Received: by 2002:a05:622a:308:b0:467:6b64:2abb with SMTP id d75a77b69052e-467a57194c0mr240686781cf.5.1734356441950;
        Mon, 16 Dec 2024 05:40:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734356441; cv=none;
        d=google.com; s=arc-20240605;
        b=OvvnBIq3MauXDkB1IQ7it+RxbK0h+wM8twCcuEc0efWpV9LY6yaWCwPvxn8qv7Zr81
         3yRqyyLUQYIIl9NtTVfs/c6pTHmd1BXVCksptJbKoqkttKwlzndMlXt0RveJM5VyvMBE
         BqtW+cwFRdbOkhF0RePrWUaXHwUKydB+C4Va+1sqDuCWP0XjWSdzGywknnJOT8k41sRh
         Oe4/ZvKb6vbYtX43gmR6qwu7aESxNNoLFKKr7JFxtz0suGmp1z4g1VMFIH1SNqzawdXK
         EG8Ttsve49iKWAr02TuD6rQhhXLjZE5Gj7PPR4LGtMtIKnuDVJiFdgJkOm7jqZ1bXsj4
         tilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2vANnnaNjz2R71XowDCOG6EKd4B7F5XmlfphlyVhIWY=;
        fh=hCIaPaVosN10SHJ6l8J+PFUaUJHk0EDtKVoNBnzzwvg=;
        b=ARcQGIybY6X2kFxFLNcikulmjg7EN5Hjr4CDQbLjRiWmQT/H/2cG1FySt5YBGJScbE
         +BhibLZj0Ak1zkQ0EGEH74H2RuWkRYOwASgHb6FVlT8MDaf8QG4HsuAk/LPnqfVFjo/o
         LJIYbdi7z6STp9WJ2+UQCKBk0lJ8Ih4wfZyWNuo4vK6dVezlz1UCZWRCanw8hT95zFqb
         NVlluVlpr08130lpOetWKCHgzOKMoc9I5i8uumDhqQq4YJ5ftKnyM+hJQBrn4oXqq0oy
         YCvHTP5Slvzxbr0UTBVA8IfB4xslX+xbyqBG3y4lG34743zBbNSyLJXGaQnj0LVjd8kD
         eTDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BnQyWvA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2cbb6ffsi79496821cf.202.2024.12.16.05.40.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 05:40:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BnQyWvA4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNBKf-000667-OC; Mon, 16 Dec 2024 08:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNBKd-00065i-T6
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 08:40:20 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tNBKb-0003nT-LW
 for qemu-arm@nongnu.org; Mon, 16 Dec 2024 08:40:19 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-6f2896ecdafso13992477b3.1
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2024 05:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734356406; x=1734961206; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2vANnnaNjz2R71XowDCOG6EKd4B7F5XmlfphlyVhIWY=;
 b=BnQyWvA4sdI/M+M+YTUKEsDodLIY2iNOUT+FwJqLeKZkAIEYS8Nk+pYzJCIbZAMIb3
 Mts6FSVYdwmtTDS7DvqzbEFZ/xR8yvKJ+4fuH+op0d0o+j/em2zAHTYCw1ZFVopWCtn+
 61eB6EBWKMx0X5s/9FjlgoEV7S4485XINmAO7r/Rfui8EFp7bL5gP6JisXn5w6wUGOCu
 8hj6Q2H1IV4fsZ6tOVU4ryGai0ETJCF6TY6UuKBFkEWv2a/nWTn9cw6qcV4j70GK4wMe
 EdNLCfDDhyUKs+7q9xktU2poM5NRNNbypPh421X+BHLXRxYgNgLsQbxSTci5UUpSL0X2
 M+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734356406; x=1734961206;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2vANnnaNjz2R71XowDCOG6EKd4B7F5XmlfphlyVhIWY=;
 b=driMGq54ZxZMEGm4MhLvj0xJAz7d6vIysBbabRUD1dYI/FsU/4iPZVGZDfZjaIPg8e
 3cp71DfplWmqTL265weXcIphVQmGgcQLm3KkiitS9v2h3YNPYAKGsjAME/EmiNwGSRCD
 xoWBFIC1xIjJXIfLqrU7kqDcn08p8CVr2aakrjCmXqcVt5bYH57+jwA61L8VGQigHuTf
 hY0oD/3PGZkbw+Tfa4io86wKqfIaMaDu8otdugIUCeHLfaOeQVcWIDYLGFTJnWy2ebDS
 /AhIlHF/7kp8gEIYvsN6gOpfnHWA9QKazGDP5A7lu9guxXG3XLyydRwzGyadmMN6jFm8
 JDcg==
X-Gm-Message-State: AOJu0YyqMVvygjKJH6jhmubS1Yj7zO2rLsfGLuVXAo/wavaWnC7RTEki
 Z+SORv+94KPmjVF+3h0/7J0SfJVUhLXWyi7n+g/2tHPVXhc+fWvdGBfXgb6hd894xg3IAY0O9Ic
 fxmD3iMOLgBLXpVCNMPD73vZ73/7/fvovYYhlsw==
X-Gm-Gg: ASbGnctNK493ofiKnTwFP1UcC5lwAaMzSydsrLECGv7uph/wBjyrwYNFMoLQEw0YRHe
 gDNHW0B2fIlQ3bC2BSvul4fzdaQfBYpBHUIFTLu4=
X-Received: by 2002:a05:690c:d92:b0:6ef:4696:f1cc with SMTP id
 00721157ae682-6f279b38a51mr95580347b3.22.1734356406227; Mon, 16 Dec 2024
 05:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20241213224020.2982578-1-nabihestefan@google.com>
In-Reply-To: <20241213224020.2982578-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Dec 2024 13:39:54 +0000
Message-ID: <CAFEAcA_MR86C5+jV9=uQsZZ905w7+OgHozfQZKYXx+=Xdv_xqw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/qtest/sse-timer-test: Add watchdog reset to
 sse-timer test
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, farosas@suse.de, 
 lvivier@redhat.com, pbonzini@redhat.com, roqueh@google.com, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: wNhD1kxEP72W

On Fri, 13 Dec 2024 at 22:40, Nabih Estefan <nabihestefan@google.com> wrote:
>
> V2: Removed scripts/meson-buildoptions.sh.tmp Extra file that slipped
> through the cracks and shouldn't be in this patch
>
> Recent CDMSK Watchdog changes (eff9dc5660fad3a610171c56a5ec3fada245e519)
> updated the CDMSK APB Watchdog to not free run out of reset. That led to
> this test failing since it never triggers the watchdog to start running.
> No watchdog running means that the timer and counter in the test cannot
> start, leading to failures in the assert statements throughout the test.
> Adding a reset and enable of the watchdog to the reset function solves
> this problem by enabling the watchdog and thus letting the timer and
> counter run as expected

I don't understand this. The watchdog on this board is not
an input to the timer/counter, so whether the watchdog is
running or not should not affect whether the timer and
counter can run. Something else must be going wrong.

> Also renaming the reset_counter_and_timer function since it now also
> affects the watchdog.
>
> To reproduce the failure at HEAD:
> ./configure --target-list=arm-softmmu
> make -j check-report-qtest-arm.junit.xml

This does not fail for me, and nor does running just the
single test case in a loop. (Tested on ubuntu 22.04 with
gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0.)

thanks
-- PMM
