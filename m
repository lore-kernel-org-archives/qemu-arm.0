Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp740810njb;
        Fri, 13 Dec 2024 13:10:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWiVE0tofHBdZxahiL9zZarGgTWgo8Y0WqC7kVircA4YyEWbzk8QGcJO9gGA0/I/oFk/ijfo/PsXkofXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHIaW7Bp3hpeQcFA3tooJWh6T8wW6KjYYiWzGFNRyQYD/3K1fbwrlc0Q5gOXTGkLBYzwy/H
X-Received: by 2002:a05:622a:48f:b0:467:8703:a740 with SMTP id d75a77b69052e-467a5755691mr75675191cf.18.1734124224437;
        Fri, 13 Dec 2024 13:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734124224; cv=none;
        d=google.com; s=arc-20240605;
        b=c56nhWdDpRKkatY20wdYfCG6KKzAwvb3qxVViHMB5t7WgjucXBh0NiVZpMZv643I/J
         +3khe/eJKHZG+lI5B6dnyGAQRsthVjtzaPMkoL6b4CIzf0bQApHBrpoeDR0DkZrzqU0F
         fscRKp5uA57BhceoHa5QM+PkeAiGPFPwXIADMPvykjiIjG0JvuFZCeDxhC27XdYNVG3x
         3+BMmaH185ngr0pIzUK4EvpMQIRH0ou0Wikr3cfYVjA9EiVJNspXrZLWq1oY1AvUJnNR
         /ioL4eH26jUgLLOSwSm7+l4i+x8ab9Iz3Jl7yqgphb7OHlxnDaZcQcIEG9jLcdLIgHas
         or1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:dkim-signature
         :dkim-signature:dkim-signature:dkim-signature;
        bh=DScp0Y/4KZmpWygtM9i4VnVVy1FbORUK4+o+DcbM36c=;
        fh=id6O6kcsi1hsadbnHAMAGe5cOFsgkAxTtgxDbBw8ihU=;
        b=BMDdq0iP0ARMgveJk9ic7VUrE4t6fFPekQaFckWKUbktr7RjUa7g6QAvYe3xcKrxQk
         JpPM82i4TlJfKT/cA66H3CWRTRLr7dOCOzi1NNMlx12xa0Ele1xPuJohWcOl1rWRGQBG
         AxSgeQCMBNpKgK49YqoldLe2UPhfkMeMebGwfNBpj/216f4J1TRpyv83kdFcgxwXWEDt
         B06MkUIT2kyy7oEGXkF3FOunegZz2TgJcmv1yhrfU0cYwdoleFlfNYCFDcKwomGN3HCF
         Xav10phtgxwu2VsZFGqMdEgD7bjnBA2BRitAQbrFR6mCEd9l5IBeyXWV7tqdLLrbprOS
         pKNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="x/W7uKkW";
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="x/W7uKkW";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2ef06a2si4224971cf.519.2024.12.13.13.10.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 13:10:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="x/W7uKkW";
       dkim=neutral (no key) header.i=@suse.de;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b="x/W7uKkW";
       dkim=neutral (no key) header.i=@suse.de;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=suse.de
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMCv6-00009S-32; Fri, 13 Dec 2024 16:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1tMCv4-00007Y-Ee; Fri, 13 Dec 2024 16:09:54 -0500
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1tMCv2-0005Bk-GF; Fri, 13 Dec 2024 16:09:53 -0500
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1224E1F394;
 Fri, 13 Dec 2024 21:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734124190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DScp0Y/4KZmpWygtM9i4VnVVy1FbORUK4+o+DcbM36c=;
 b=x/W7uKkWMuJbEWwahugbjbPcaOp7hOx/K59YcvjGZTQjTdwO/ibKJW4saoY9wmP3GYXiqk
 /sbgKyE2I6riAsgrjnsoJKrCY/gEdqzS6ypQJ0vtFMLVwUr1Trehd9HYZAWD0Yqiz/eYsz
 43U5/CLoR1aqYZs7xhMwoURJ8fV5dYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734124190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DScp0Y/4KZmpWygtM9i4VnVVy1FbORUK4+o+DcbM36c=;
 b=VxIdyqQ1e18Eftz2YhHDbhiMYeJnA3eerkm2Fn13LNaa1tFRi3f4erUINgr+xeVCdFsjws
 QHeN+RgZuR1csxBg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="x/W7uKkW";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VxIdyqQ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734124190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DScp0Y/4KZmpWygtM9i4VnVVy1FbORUK4+o+DcbM36c=;
 b=x/W7uKkWMuJbEWwahugbjbPcaOp7hOx/K59YcvjGZTQjTdwO/ibKJW4saoY9wmP3GYXiqk
 /sbgKyE2I6riAsgrjnsoJKrCY/gEdqzS6ypQJ0vtFMLVwUr1Trehd9HYZAWD0Yqiz/eYsz
 43U5/CLoR1aqYZs7xhMwoURJ8fV5dYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734124190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DScp0Y/4KZmpWygtM9i4VnVVy1FbORUK4+o+DcbM36c=;
 b=VxIdyqQ1e18Eftz2YhHDbhiMYeJnA3eerkm2Fn13LNaa1tFRi3f4erUINgr+xeVCdFsjws
 QHeN+RgZuR1csxBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B24413927;
 Fri, 13 Dec 2024 21:09:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w9AnFJ2iXGeCKgAAD6G6ig
 (envelope-from <farosas@suse.de>); Fri, 13 Dec 2024 21:09:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Nabih Estefan <nabihestefan@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, lvivier@redhat.com,
 pbonzini@redhat.com, roqueh@google.com, venture@google.com, Nabih Estefan
 <nabihestefan@google.com>
Subject: Re: [PATCH] tests/qtest/sse-timer-test: Add watchdog reset to
 sse-timer test
In-Reply-To: <20241213002602.4181289-1-nabihestefan@google.com>
References: <20241213002602.4181289-1-nabihestefan@google.com>
Date: Fri, 13 Dec 2024 18:09:47 -0300
Message-ID: <87cyhvxpb8.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 1224E1F394
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MISSING_XM_UA(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
Received-SPF: pass client-ip=2a07:de40:b251:101:10:150:64:2;
 envelope-from=farosas@suse.de; helo=smtp-out2.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-TUID: EZj38i1KPlf5

Nabih Estefan <nabihestefan@google.com> writes:

> Recent CDMSK Watchdog changes (eff9dc5660fad3a610171c56a5ec3fada245e519)
> updated the CDMSK APB Watchdog to not free run out of reset. That led to
> this test failing since it never triggers the watchdog to start running.
> No watchdog running means that the timer and counter in the test cannot
> start, leading to failures in the assert statements throughout the test.
> Adding a reset and enable of the watchdog to the reset function solves
> this problem by enabling the watchdog and thus letting the timer and
> counter run as expected
>
> Also renaming the reset_counter_and_timer function since it now also
> affects the watchdog.
>
> To reproduce the failure at HEAD:
> ./configure --target-list=arm-softmmu
> make -j check-report-qtest-arm.junit.xml
>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---
>  scripts/meson-buildoptions.sh.tmp |  0
>  tests/qtest/sse-timer-test.c      | 19 ++++++++++++++-----
>  2 files changed, 14 insertions(+), 5 deletions(-)
>  create mode 100644 scripts/meson-buildoptions.sh.tmp
>
> diff --git a/scripts/meson-buildoptions.sh.tmp b/scripts/meson-buildoptions.sh.tmp
> new file mode 100644
> index 0000000000..e69de29bb2

By the way, there's an extra file being created here that we don't want.

> diff --git a/tests/qtest/sse-timer-test.c b/tests/qtest/sse-timer-test.c
> index fd5635d4c9..d7a53ac23a 100644
> --- a/tests/qtest/sse-timer-test.c
> +++ b/tests/qtest/sse-timer-test.c
> @@ -29,6 +29,13 @@
>  /* Base of the System Counter control frame */
>  #define COUNTER_BASE 0x58100000
>  
> +/* Base of the MSSDK APB Watchdog Device */
> +#define WDOG_BASE 0x4802e000
> +
> +/* CMSDK Watchdog offsets */
> +#define WDOGLOAD 0
> +#define WDOGCONTROL 8
> +
>  /* SSE counter register offsets in the control frame */
>  #define CNTCR 0
>  #define CNTSR 0x4
> @@ -63,24 +70,26 @@ static void clock_step_ticks(uint64_t ticks)
>      clock_step(FOUR_TICKS * (ticks >> 2));
>  }
>  
> -static void reset_counter_and_timer(void)
> +static void reset_watchdog_counter_and_timer(void)
>  {
>      /*
> -     * Reset the system counter and the timer between tests. This
> +     * Reset the system watchdog, counter and the timer between tests. This
>       * isn't a full reset, but it's sufficient for what the tests check.
>       */
> +    writel(WDOG_BASE + WDOGCONTROL, 0);
>      writel(COUNTER_BASE + CNTCR, 0);
>      writel(TIMER_BASE + CNTP_CTL, 0);
>      writel(TIMER_BASE + CNTP_AIVAL_CTL, 0);
>      writel(COUNTER_BASE + CNTCV_LO, 0);
>      writel(COUNTER_BASE + CNTCV_HI, 0);
> +    writel(WDOG_BASE + WDOGCONTROL, 1);
>  }
>  
>  static void test_counter(void)
>  {
>      /* Basic counter functionality test */
>  
> -    reset_counter_and_timer();
> +    reset_watchdog_counter_and_timer();
>      /* The counter should start disabled: check that it doesn't move */
>      clock_step_ticks(100);
>      g_assert_cmpuint(readl(COUNTER_BASE + CNTCV_LO), ==, 0);
> @@ -103,7 +112,7 @@ static void test_timer(void)
>  {
>      /* Basic timer functionality test */
>  
> -    reset_counter_and_timer();
> +    reset_watchdog_counter_and_timer();
>      /*
>       * The timer is behind a Peripheral Protection Controller, and
>       * qtest accesses are always non-secure (no memory attributes),
> @@ -195,7 +204,7 @@ static void test_timer_scale_change(void)
>       * Test that the timer responds correctly to counter
>       * scaling changes while it has an active timer.
>       */
> -    reset_counter_and_timer();
> +    reset_watchdog_counter_and_timer();
>      /* Give ourselves access to the timer, and enable the counter and timer */
>      writel(PERIPHNSPPC0, 1);
>      writel(COUNTER_BASE + CNTCR, 1);
