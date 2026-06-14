Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4FFCD98C5
	for <qemu-arm@archiver.kernel.org>; Sun, 14 Jun 2026 15:57:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wYnCr-0004gm-83; Sun, 14 Jun 2026 11:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wYnCp-0004gN-Gq
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 11:57:03 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wYnCn-0007mk-O4
 for qemu-arm@nongnu.org; Sun, 14 Jun 2026 11:57:03 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-6604176b575so2017095d50.1
 for <qemu-arm@nongnu.org>; Sun, 14 Jun 2026 08:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781452620; cv=none;
 d=google.com; s=arc-20240605;
 b=Ap/Q+IeQT2R81w25qggHjlEoB/gB3S9jOfDkUhk1jkWcX9bz0F167LBJky6/pCzk47
 CuDiPX6ahtxdQLV+kmtLhLZARuNpvodAziMMoruucavMdMRi89htWILdWQ2P1fK9j8A4
 Td9O7G3vgb+dofTqVnp0J3oZdWRcX7h+E+SntPTusDMRAmogdWCOZ8J+PaxmDZmazmYt
 rQMkgTHCVaMNXsNAC5U7jEkoFLl/G9B3KiGMlNmIHwByrdZ07qMJgbgIbhxJV0WLJmvB
 1SQxbF2VSik+xcNJZHWZm/aOXeqJwezs2AbR7biM9YzvmpB37l4zVQ011czs3HSfN7sp
 9uXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UoEvRsUq0TzhUYRP5kdgXbAjyXcr4+aUqhWl54TZ6RQ=;
 fh=0Mes3Ni4WXj48sF/vmWPtbf2ffCzpItYGAyaYkdQM24=;
 b=EP17pblEQWC2E0EG/C1MJ0NfrRaquJuh5Lv9GRGSEUfEFLzVTVUX9ssJZ3majlQW5I
 NsBukoHXLxj7l8w2Dzi0EqfW04oc89YeIX+C5l6idjy8EFDCtGbbiLCcatAo1V6rGGtm
 VvYiFueKqGYy3jIXvYGUai0hF4JDAuhcKOelJ7Vj2tOiovy1XPtto8yAASQKt+XOadlh
 cZt7wHF1/BnkhqiRttIqbN9op39p5osDxJg7KLrWTWEM5cf2/xVOpZEo36bRqxx/BkAd
 pO2toRz/RusnZIBaMvk5WrJ0v0MOz29hE7HpYxZ5PmB2qgsjv+d0nHfvh+PyZgHDYSdy
 pp2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781452620; x=1782057420; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UoEvRsUq0TzhUYRP5kdgXbAjyXcr4+aUqhWl54TZ6RQ=;
 b=gLZoZPmOuZu1w5ETvfJniAwzzbEvUS8MFoKBw5uw8DNDQEAbI4aSpIOpCaDE4oZPfK
 2xQMsdqO78eK/9qoZ+2i6ojtXzQ3YImOwBLYILCud/gvj92g+zqItwrcoa3r1S3CJyif
 84hY3vEdZX9xBSWrc53ytYDmxI8X30r68ksbV8GWPReNtvhj1DBxU9m+ovdR3npdgmVA
 +O8oMnjft7XEf+2h8PTtc0pRduu2a0atERN9oNms/8JVBBVZ8im90Ahsw1fep+O3WvH4
 QjKKaV7rlldIozadFoul4Nq7CEab8js4OdoUrZMEBMzbkoM6E4vMV5w8SSEOrqrW3s+6
 L0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452620; x=1782057420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UoEvRsUq0TzhUYRP5kdgXbAjyXcr4+aUqhWl54TZ6RQ=;
 b=eh4YBISCDwkmfsdzGSMKWUTa48aaA4S5Lw2Ho/nFjQN+2gsNPWpGfprPC5GOhTWvp1
 xwK6NlNcH5WpdUDww6C2Kp2mHzlMKwzUNQIqXMBT+d6Xhjq0Fs1ciR5BhW1HoSqea3jT
 Us/xl4ITL5KlZllehecOUOxP47eUV0aZnXHXdx9veUvjw7nKNU7tFuVSvumBwKmwdryf
 eE1JIragyz9wQMKWV00nATokKNbUNXCggxTCPrR80OMrihGEWIwh0yscUB5cdhuBiiqi
 HCH3dYrsR2fS4+kyTQ9EoFNUgSD5H3WWVoS8oLcYpZ3H2qmRpRq807tu1Zi5hA0O6gDJ
 J8eg==
X-Gm-Message-State: AOJu0Ywr2lfb8L904uXBxNtmMzxeXq/p9xM44luB2CJ+fqBZis+QQoJW
 6c26UkElLD4g1/u6CGQ49otOAe+W+Zhw6SEPny11ohv6Fpu2J2Pb3n+wAiGmZt3FebxhS2SUJD9
 zPz9oj2SxqUi8x8ofy/DHuHH7Sqlmxk2LADQEZ0eCTQ==
X-Gm-Gg: Acq92OFwuBOKBRad2pg1Si7a5yGpoeyqtRCuagWxY7YQgI5Sh+iaiRcswDMxNMjhAOh
 kn1t+YIM4tkbKSmgeUvCuoiWacMv+DaHAszq4GcEwvA7SowSzE8dryLsFTveaWjDRyCpiU7tIUD
 5bKAfnxuZ1FBGYCbkaEh5ph4uCorkZsn5E14rBhyPJ3atSHCJNnWK5ruKl+w9Zpf4vtUZPgQ38h
 +gavZI4M9dYhR50ahAavUeO/clFXA/YjHuLv4mHVo0P1nyUnafVZ49MvVa6pkDRRfqDwBKrWe0k
 iBLtOyguT/XF1lwfObp7uMoVSwRaJJBo0jub173s+fJKOO4TRalB5HpivqyFOwLKVnc=
X-Received: by 2002:a05:690e:b4b:b0:662:8a91:f034 with SMTP id
 956f58d0204a3-6628a91f075mr4771706d50.38.1781452620165; Sun, 14 Jun 2026
 08:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260605035012.2876664-1-kylefoxaustin.github@gmail.com>
 <CAFEAcA_JpBaHDucOfvc9NYkQhQBu0Py9hULTNcXajUo9gW6VGw@mail.gmail.com>
 <CANqqvPcJOA7vKYiq6gU9ai3DYCN0yiwW6S-o2xh2JGQNZtLZnA@mail.gmail.com>
In-Reply-To: <CANqqvPcJOA7vKYiq6gU9ai3DYCN0yiwW6S-o2xh2JGQNZtLZnA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 14 Jun 2026 16:56:48 +0100
X-Gm-Features: AVVi8Cftgr-sUXPsCueUs0EhT2I8c2SDBKH_xXwqpOJSoHI-4kDKk3lTMZbFifw
Message-ID: <CAFEAcA-1w9Z4PJnBmh+7MgFa2n+-dyuPKYDYCqM-r_hQphnRmQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: honour CCR.BFHFNMIGN for probed data BusFaults
To: kylefoxaustin <kylefoxaustin.github@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 13 Jun 2026 at 06:17, kylefoxaustin
<kylefoxaustin.github@gmail.com> wrote:
>
> Hi Peter!
> Thanks, great catch.  You're right that the SG stack-word load is an
> AccType_NORMAL access and should honour BFHFNMIGN.
>
> I'm working on v2 to incorporate.  Basically v2 adds the check in v7m_read_sg_stack_word():
> on the BusFault path it records BFSR/BFAR as before but, when BFHFNMIGN is set at negative
> execution priority, it completes the access returning UNKNOWN data and
> returns true, instead of pending ARMV7M_EXCP_BUS. I left the vector-table,
> stacking and unstacking EXCP_BUS sites untouched, per your note that those
> are AccType_VECTABLE/STACK/UNSTACK and are not required to honour it.
>
> One question on the register bank: I kept ccr[M_REG_NS] in the new check to
> match the expression in the transaction_failed hook from v1, but the nearby
> STKOFHFNMIGN code in this file uses ccr[is_secure]. Happy to switch both
> sites to [secure] if you think that's more correct here.

The CCR register has some bits which are banked (so have S and NS copies)
but some bits which are not banked (so S and NS see the same thing).
The way we implement that is that for the non-banked bits we store
them in one of the two entries in the v7m.ccr[] array, and code that
uses the bit has to check that one. BFHFNMIGN is one of the non-banked
bits, and we keep it in the NS array entry, and check ccr[M_REG_NS].
STKOFHFNMIGN is banked, so we check ccr[is_secure] to get the banked
bit corresponding to the right securite state.

thanks
-- PMM

