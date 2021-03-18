Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp595557lfg;
        Thu, 18 Mar 2021 11:08:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLQ2JPTlV4rTnKtAnyAykzXLf8xF/HcGER5MacJl7qX8RO9OwC2thN1iy4D3MwFfpnNHiW
X-Received: by 2002:a6b:650f:: with SMTP id z15mr10992020iob.128.1616090919687;
        Thu, 18 Mar 2021 11:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616090919; cv=none;
        d=google.com; s=arc-20160816;
        b=KDOEDCf/ownwlYSu5u4zUHwUof7ZAZJIMmJiQSj2XFeq0TSbWtTt1lGlcE0mclv5pE
         b1U3GJXtazJ1fHrc7WrqvYmpheG7DAjTsXXzcG7IaJN2ZN6OV00vyO6CzKCsiloE9OKh
         kwsoWxQq/zxJCRqZ6voq6BV0nahNgXDVd6zRwWOHD7Xe2aQOAz60wwOvWnmrpXICYwci
         32NDwAnn1NgLQ2Ldkoq8i423ubIlIS8eO90k3GBGYUpV89zk6sn67nTMHhdlkhO9yxsA
         umkTrVgwh9M9dw9N1YdimzEmqS3neBZiEnPBOfj48AzgP1pI2MmQmWAPMcqTnuLOi58C
         O3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=f9yZWllhXgYeYx/lgwEn/dHPz2GZSIIWoUuIwOoQLhs=;
        b=YrxnRyVlQcs9XbkQ/L5DAv98ASVyLC7YOdEhowwgy6JpaTsWON/vmSKh82V9SvxutI
         gr6FD6HN/IKleItGLP19LV/VGLZjKBnG5U5ZwXEgJnPlTSNHxdI64S0RTbHpE7mS6ApU
         ERpMju66GsdrGk0Hob3ohUUIWu3/YtmSUy9FI6YL9LfNOgLsrLk3FnCxZEG+h/AdwzyJ
         hzdPMrglCwGmGRR6ix8cCK9SU33AkNUMoXS9R1hf0fx/gpebdEay7wwzgv/e/1AgvBKz
         5547QkvxylMYbu3upVVI1gp3BO9n0hnkACRK304+HezfjhLdarNq/Xjilse+SSc6bzoz
         tMbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L9RrXC/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si1914209ils.70.2021.03.18.11.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 11:08:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L9RrXC/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMx4X-0004mX-68
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 14:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlW-0006cg-8K
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 13:48:58 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008Cu-B6
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 13:48:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id z2so6463296wrl.5
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9yZWllhXgYeYx/lgwEn/dHPz2GZSIIWoUuIwOoQLhs=;
 b=L9RrXC/U21eqhd/8VDml60tk21rqQ28LMpxrX6e5vMwUtKAuna2K5bnDrnXvTnCU7G
 1gvVic03gPniF/9ODatnmx5FXM1cgpMm0g67chovlGU2pwmQfb442VyY2nW9PVG3IntV
 qcX/GWBlvLNI1fBEWhCmfeI493gvzkU5SKcyZLYslwTXOxV+NB8Y8FW3+ZLG+Mof1bzP
 YrPqQ05c4+m8PuvmaosTncUx0Fk4d7Wlh0rNmFriVX7oBrFPuLF6E8qarqv612ssvZFI
 NMJejFqCWPm15FEPX4LcotOTTYwIzXcVtgerx/UuviZBE8QAP/BTJlN3tE9RGFYbw+qb
 bhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9yZWllhXgYeYx/lgwEn/dHPz2GZSIIWoUuIwOoQLhs=;
 b=axs+JwJ1gLkr3NsoVHygVs1Exg44+NG8LXCrsqr/zUeXFRCVVTr0GK9kGjTEgllP67
 DBN3383EetqxvdhMz0kh4SuWs6MGh6rMwfNIp8zBhzAxUkKo6oPCJyLSD4icM7jIU2OU
 C9jsfDJ1PL+4oGrJ0I2EwUWiwMvvtjLmqZJ9ZkIH7fJ05c68hDai64gef5Ciw6LXuBdR
 7q6uEeHurxKgbvq3ziV+Kxzqg+Jcc8pFOAnLQGZwFQUNHUINOja6dwjjHlJqbovD+pFN
 Vtpas2qDfOmnI9vHhZjrx/YSbU2UVJlIMHChF99qhPRQ1zODN3g6H4K03lbLeH8QIW5g
 /4DA==
X-Gm-Message-State: AOAM531JlTvQsm2zJwaGZyqYuCI/cvZykytaP9zMw2FFjR6YptqPpZQA
 tf0v135uQG8rqw2Gqr4bARoZn2B7IEKiACBY
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr405803wrr.287.1616089706834; 
 Thu, 18 Mar 2021 10:48:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 0/5] arm: Make M-profile VTOR loads on reset handle
 memory aliasin
Date: Thu, 18 Mar 2021 17:48:18 +0000
Message-Id: <20210318174823.18066-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uV4/DjRwcfGV

For Arm M-profile CPUs, on reset the CPU must load its initial PC and
SP from a vector table in guest memory.  Because we can't guarantee
reset ordering, we have to handle the possibility that the ROM blob
loader's reset function has not yet run when the CPU resets, in which
case the data in an ELF file specified by the user won't be in guest
memory to be read yet.

We work around the reset ordering problem by checking whether the ROM
blob loader has any data for the address where the vector table is,
using rom_ptr().  Unfortunately this does not handle the possibility
of memory aliasing.  For many M-profile boards, memory can be accessed
via multiple possible physical addresses; if the board has the vector
table at address X but the user's ELF file loads data via a different
address Y which is an alias to the same underlying guest RAM then
rom_ptr() will not find it.

This series handles the possibility of aliasing by iterating through
the whole FlatView of the CPU's address space checking for other
mappings of the MemoryRegion corresponding to the location of the
vector table.  If we find any aliases we use rom_ptr() to see if the
ROM blob loader has any data there.

Changes from v1:
 * do a little bit more cleanup on flatview_for_each_range():
   - switch return type to bool
   - document it
 * put the "rom_ptr() but handle aliases" functionality into
   a generally-available function rom_ptr_for_as()

We discussed the idea of just making rom_ptr() itself handle the
aliasing, but that would require looking at all the callsites to
identify a good address space to use; it's also a bit more invasive to
other platforms than I would like at this point in the release
cycle. So I opted for "provide a new function" as a safer and simpler
compromise. In many cases callers of rom_ptr() probably should be
changed to use rom_ptr_for_as() at some point, though.

I realised that although if we can get reset ordering sorted out
we can remove this use of rom_ptr()/rom_ptr_from_as() from the
Arm CPU reset function, we will still have the same "need to read
the blob data directly" problem for board init functions which
are the bulk of the callers of rom_ptr(). I suppose in theory
we could rewrite those to postpone their accessing of the data
until reset, but that sounds like it could get complicated. Anyway,
that means that rom_ptr_for_as() might have a fairly long life.

thanks
-- PMM

Peter Maydell (5):
  memory: Make flatview_cb return bool, not int
  memory: Document flatview_for_each_range()
  memory: Add offset_in_region to flatview_cb arguments
  hw/core/loader: Add new function rom_ptr_for_as()
  target/arm: Make M-profile VTOR loads on reset handle memory aliasing

 include/exec/memory.h           | 32 ++++++++++++--
 include/hw/loader.h             | 31 ++++++++++++++
 hw/core/loader.c                | 75 +++++++++++++++++++++++++++++++++
 softmmu/memory.c                |  4 +-
 target/arm/cpu.c                |  2 +-
 tests/qtest/fuzz/generic_fuzz.c | 11 +++--
 6 files changed, 145 insertions(+), 10 deletions(-)

-- 
2.20.1

