Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45EC606A333
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Nov 2026 13:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oA+AX4Wn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xTJ3K-0006N4-TM; Tue, 17 Nov 2026 08:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kmehltretter@gmail.com>)
 id 1xTC5z-0001Qo-DE
 for qemu-arm@nongnu.org; Tue, 17 Nov 2026 00:51:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kmehltretter@gmail.com>)
 id 1xTC5x-0007C5-KT
 for qemu-arm@nongnu.org; Tue, 17 Nov 2026 00:51:07 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a140e7405dso43547565e9.3
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2026 21:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794894664; x=1795499464; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xE0hZtAygoMZWedu8RkV57BFv0QFgxcv6Jo0h3lc6+Q=;
 b=oA+AX4Wnk/7fW9vjXxc0ijlhKrpchrKiOCyOKH/8WqjP+ZRGtvmqZJm46ACCIlvsho
 3w1YqCZ8xuYWTXcryhVX1WkGd85nmXhwl0BphmMdKZaT+mWNxMD4pzKwjVJcHrNN6YJK
 SCB36go8nnXZXjUjeVP5uQjiqbgDQXGAtqttwH8UVDo+KxWO66CFq3HWX8ir7lUoKY08
 fGW/LF6oEy3+HfT8G8Sy8pVtsSnzem6o4Wu+l1z4rL1UG7V29k7NPxWxUgL9gMEYC9k7
 QpLMSKBGG29bKt4KcH0rQUHT7hQH3RFJQi7CKx5Tv9sIpOjc0IRqjKtQMksmdMUYF27l
 1Azw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794894664; x=1795499464;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=xE0hZtAygoMZWedu8RkV57BFv0QFgxcv6Jo0h3lc6+Q=;
 b=ZkFxRxbEJIQR041hSW+QYzp/qVhCIIwajAG2zKk7mUOzfxSl4DpxZ/szBGuUUNTKEY
 B1XeTil8kQV4Qk5g4lSGzK2AozGly0+cpFdFp7j4zkMjmRv8w/kc+ReYDHF88JEfH8UD
 nxCjmeBVJftWUsZV+efSeTLpb8fdPwbG9Cq3mER/+ECa8FjZ+sZVe5rOgnkT2ntqFWju
 JTDf9/seiqKp9N+q0YIQFn8Hk1MI8MKgqqKZLmeskVP6oYhvuZw22DRkueRsdSod4VyT
 Tm8uQoE75Zj2Un/H9OChGmbgSAozJRkED69SNmO6fzlB6uGTZHpl13NUs0Jf/9FKRTdq
 wP5w==
X-Forwarded-Encrypted: i=1;
 AL+hErFRUjCMekIeg2QdxmsWVxeGhxozQ2UKUaYaqYYpSX06F/i6ZterxN5S2a9Omrwg78N9N3ybdwp/zg==@nongnu.org
X-Gm-Message-State: APuU4Z8T/Ya4fIaar6174pGZFJTG3CwGTelA2CuQIOfeEcAXBz1S6hxW
 fdGuHSSzLgX1s5MiPG5iROzKLUvEL5fvWjdvu+xmHzPoNL4Ccrp6/7ST
X-Gm-Gg: AYBFou3+tAfqZYJEmeajtBg4zrU4Ljm01iNrs3urrcR9DolkG3b2H988cj68ia2QRiA
 2/4I6AfR0KvAoyrkssLzfjuuN1CFOOi3rLiaMugPl6UYqb0ADgQ1AYJk3rEQFHNwQ/fSYo/OIN5
 ARMAywvxqo3JXOfjC8eeSeAsIaQdf4dgQZhOmbUkBLNNqKOuHjya8CRD1ruNjYcVhncE6W+ZxTY
 SVtBpouBOHjvsLyiGue4Pq2yMdRqMZ4O7gYqyBqt+dzctAH14t0Ug4LgjCnzMwqHpv7hvQMBbf8
 pN0GJ1v9oyKYy8EhAks26l8yLKi6qItVk0M1xYHN5NjB5cK96wveMEb5TR5TBOJvjpHS6m3vKfv
 QdVoP6ZG/OG/nWbGG86Xcvby9IMTXBcf7ioA5P5je1Q7N2H392BfVn8mqNMhVa7XLG7v5mA+j+4
 4ME7UTAfUQKTR1m2vn+IkF66M0hYj4+IOormSmL5k88xZT7C0DAdkR0OIp6dK/FUgovEv+NrJ01
 kJUPaGh5Bdz5HIXiVre71I+wMxTqOkEqUnVURDm4tH1VLmh/0QNZ2vf+Ifzcn7HfEfN+jG7brmC
 W3gmEuzvVqlrai/K2QnKw2bWpF96UPqrSUdMOiaKJnDNdUxnwTOjV7uhIs1ph+yFbHm1Q3KIovs
 UZO80SwbTKeaRXQMDSd/WTxffyXIp27KJoM4exVxt8+xXvmzr1n/HmWvXzAri7UD6OratkOS6tg
 L78E8WclOQwoKQDjU8kg1cLZzf80TzuMycWG4vgi+lnrYdmA==
X-Received: by 2002:a05:600c:670b:b0:4bb:7987:fbbc with SMTP id
 5b1f17b1804b1-4bb7987fdc3mr10916125e9.1.1794894663910; 
 Mon, 16 Nov 2026 21:51:03 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain
 (dynamic-2a02-3100-b014-0b01-69e0-6cd4-9e72-ec17.310.pool.telefonica.de.
 [2a02:3100:b014:b01:69e0:6cd4:9e72:ec17])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb783853b5sm41816735e9.2.2026.11.16.21.51.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 16 Nov 2026 21:51:03 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: Re: [PATCH for-11.2] hw/watchdog/wdt_imx2: Fix migration when
 pretimeout-support not enabled
Date: Tue, 17 Nov 2026 06:50:38 +0100
Message-Id: <20261117055038.88311-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116114641.1799526-1-peter.maydell@linaro.org>
References: <20261116114641.1799526-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=kmehltretter@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 17 Nov 2026 08:16:50 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 at 11:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> The wdt_imx2 device has optional support for pretimeouts, which are
> present on most i.MX SoCs but not on i.MX31.  If the QOM property
> 'pretimeout-support' is not set to true then we don't create the
> ptimer associated with that feature.  However, the migration vmstate
> unconditionally lists that ptimer, with the result that trying to
> save the vmstate of an i.MX31-based machine like "kzm" will hit an
> assertion.
>
> Move the migration of 'itimer' into its own subsection which we only
> send when pretimeout support is enabled.
>
> Fixes: daca13d495a11 ("hw/watchdog: Implement full i.MX watchdog support")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4876
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

With this patch on master (97c88c61d45d), saving and loading a paused kzm
machine exits 0 instead of aborting in vmstate_save_vmsd_v().

Tested on Debian 13 x86_64.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl

