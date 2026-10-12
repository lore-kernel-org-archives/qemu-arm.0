Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782B8CA9ED0
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 10:32:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGDKr-00079B-JW; Mon, 12 Oct 2026 06:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGDKq-00078Y-0l
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 06:32:48 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGDKo-0005wm-E4
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 06:32:47 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-8ae9bc9a2fcso28955287b3.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 03:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801165; cv=none;
 d=google.com; s=arc-20260327;
 b=kaFPmYXc6P+u+YkLLzwWpqVnBvj+iYpoNjEzGljIfT0O8rxqPjyEIyuyDt61YwwRyQ
 pJNU23001b8njOiavyJlCli84b9r1K73ReCZp2/bshAsMCCoANC1Db4zm7jpaq7Y1DnB
 Fz6WWs5sVxQmwMz8L54ZTvV+xQgjgyaYkNx9D7+e49VD0iMabfYGNT7BhPL7dISXFVGY
 d4NWyPE/3mobk2oWfpHIhtsW6wOiEFE632hx6txKfDZANYb3A/79ovy+MEDpkLcttkZF
 RgAXhgSUL4qEXgx2x3aecd18Czc8c6Q4XPs36KsYiiAvHSOlMZKFcV+YFlrCALFYGyBH
 coiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YQI/rTmZyoxAzzXUf/eoWI3j/Wdpv6I65MmZpfEGH8g=;
 fh=JZDAJIA/2y5s9y13Dd9nhJKF+g6hgNgO/Z3UDk4IvqI=;
 b=VA3HYMhh9XsrEhv/7q6oxHCyTT8+NrBhmBMqJlkiAE4lbzFsyhghATpjxVJhioep/5
 HF/4ixlN4iNeodD271Ko3NoI/UEe3frWp2yO0mlRBgj7jS1/J0FR5uDtJhlCDxMv5oxp
 XCeLQ3t3Tng/501woVbW/3h+s6+rpoS9wy6kuV7ZiSOefBRaiNU29iVdTXKArU3qBWgo
 wXpCxn+Fnpuoz5tgoc3xFCGmnqsVcfG557tOl5EVJAEt1tYc97sL8c4p2vakWGClGiSk
 obRf1VICo4PcU6jHPfmN1EDV0IvQlLxRafpJgN/DF/8xljwz7poUls/EXSy0b5Pi9WMO
 aNPQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791801165; x=1792405965; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YQI/rTmZyoxAzzXUf/eoWI3j/Wdpv6I65MmZpfEGH8g=;
 b=P0JjeGifgKNmdkpgbVNGrKG9+4rgvW0mVxeG/2JGUbCGc4X0CsHodWiCBj3LKViXFq
 cD6tYeOyHK589eCXQWJ6Z+C39F2Sc34lJ/B9U9eywBkM+fPQ8pefBHt+GERZv1VGnJfr
 7eDaCoNcKHXRy7X2MZWLuGAKF4UxCyJ1tIOMeyh4Z9o+VChMNHbF5eUanGRPOZRti5zg
 ArmmUm9TRPDgCsoK1JHFxWXI5Jiq9+mJbBqJGcteLx3UVvP5J0WaZdknkoia/KC2nZLq
 iqnLga1sKIRyHNqBQ5nDz9+6VA+Fzy9/q67l+eqevj/SNNrJL17z/TVCbyzmfBFnPLv8
 /8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791801165; x=1792405965;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YQI/rTmZyoxAzzXUf/eoWI3j/Wdpv6I65MmZpfEGH8g=;
 b=staGzVP2Y7wZyH+q1dZNIoDAShy1raOMoASh6U0RGFXnFRmSJq4fSU62nN74IKQoC4
 5E8aAkO/sPuGVrw1JgV3tAYrxSMncGeZwS8F6nDHI4z+1+pRBMzORdJXobXA5rLnyvj9
 rCKhwdKdDGhulD450Flhu0ScgISTThsQuE+5mRdHnxDsIqG4nc7bojaQSKf0wxEuT/h+
 GnuSUkzJT0oPLA+4CgLw1D2Jb8aCXDWcg8aqfMQYw3Sv0KXqfXhMsJ+nawqf11jHajgU
 eVbWsf4SsIO3sBmWFOMCU/WrcJRqMa+WcF5IfVKJbyzJXkF7Ir81cf5+NFEOrGEpBsnV
 nd+A==
X-Gm-Message-State: AFq9FYLrdsM5AF811cGfEMb/DTZkQFNYNkaB+J6GGB5TgBCUrMbW6TAI
 iq2kD+d1HJUpUG2uNIlgPQKfvsCpKPz5VVSZFBg9Jaj+ey0uQ4epzn6p4EOaXKbXxH+Rmm/ZckJ
 QW8HrbTDv/dWXY35pbq87uZQyYxmaEyr4YEYx9IkJKQ==
X-Gm-Gg: AYBFou2ribotmuK3aAtfHZyKr05XEKzI4ImkkBoRin8haJdLnKlRe+nkI26LWOeCd3z
 RetkLTlD0QgL/f6dQfHzVUq8IzKhB52MGqnRvbX9NQvjWPHNr48HcL528hNhhtID9HL5P5Up4V5
 R/b/accSETWaXAIoh3rAHVXSSNXc+hCVT41T+jpDUtrdImqvN3Q6SA9o2Ja2kY26DF4EZh7SSba
 0UReSihoxwzyZStw7B+gT1H+JjjGDF6tCnMIXN9KBQO4027OK2RLlBxENuglckaVSU7gt824ngN
 1upW87l+1MzPCeYEmYylaybIt1aGjUPz83jlwckxr9IWVII9A3FPcvyPrb4As9LRhDdJD+KHkn5
 mTvXOrFKqIoc5clHejDBxPvodwwUT423Wwz2s3+c=
X-Received: by 2002:a05:690c:56c6:b0:8ac:c329:682d with SMTP id
 00721157ae682-8b07ed09205mr21470367b3.11.1791801164938; Mon, 12 Oct 2026
 03:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <20261009115728.1299384-1-fuad.tabba@linux.dev>
In-Reply-To: <20261009115728.1299384-1-fuad.tabba@linux.dev>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2026 11:32:33 +0100
X-Gm-Features: AclHuK8AFMvBxGnvEeYYBK6kDyub4SiDtm1qkQ6ht23RjHpdhp94I11GUJgw7qs
Message-ID: <CAFEAcA8D-8SAtpCq1WV1zmHcJhieHRdG5Z_o=oiOYN4Ly+vYWA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] target/arm: Fix the TTBR table base address in its
 52-bit layout
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Gustavo Romero <gromero@redhat.com>, 
 Itaru Kitayama <itaru.kitayama@linux.dev>, Will Deacon <will@kernel.org>, 
 Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 9 Oct 2026 at 12:57, Fuad Tabba <fuad.tabba@linux.dev> wrote:
>
> Hi folks,
>
> Changes since v2 [1]:
>   - Each fix is now followed by its own test, and the test description
>     moved from the commit message into the file header. (Gustavo)
>   - Clarified the stage 2 comment in the test. (Gustavo)
>   - Noted that RAM_BASE matches the address kernel.ld links the test
>     at. (Gustavo)
>   - Collected Reviewed-by from Gustavo on all patches. (thanks!)
>
> Two fixes to how get_phys_addr_lpae() forms the initial table base
> address when TTBR uses its 52-bit layout, each followed by a TCG test.
>
> The first stops TTBR[5:4] leaking into the base address of a table
> smaller than 64 bytes. KVM's page_fault_test hangs on it under TCG in
> its 16KB, 52-bit PA guest mode. Itaru reported the 16KB hang on kvmarm
> last year [2].
>
> The second uses the 52-bit layout whenever TCR.DS is set, as the
> architecture does, where QEMU used it only with a 52-bit OA. With a
> smaller OA a non-zero TTBR[5:2] is then an Address size fault.
>
> Based on QEMU master (f7ada39eda).
>
> Cheers,
> /fuad
>
> [1] https://lore.kernel.org/r/20261007080019.350315-1-fuad.tabba@linux.dev
> [2] https://lore.kernel.org/r/B4C0AC3E-6A4F-4A7B-B7BC-81207539115E@linux.dev
>
> Fuad Tabba (4):
>   target/arm: Clear TTBR[5:0] from a 52-bit table base address
>   tests/tcg/aarch64: Add a test for a two-entry 52-bit TTBR table
>   target/arm: Use the 52-bit TTBR base address layout when TCR.DS is set
>   tests/tcg/aarch64: Test the TTBR layout with TCR.DS and a 48-bit OA



Applied to target-arm.next, thanks.

-- PMM

