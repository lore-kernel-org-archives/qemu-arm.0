Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6941DFF60FF
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 10:37:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7WSy-0002zf-L7; Tue, 31 Mar 2026 06:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7WSw-0002zB-PV
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 06:36:59 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w7WSt-0005ws-UO
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 06:36:58 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-6501d242e2fso3494903d50.3
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2026 03:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774953414; cv=none;
 d=google.com; s=arc-20240605;
 b=AZEQ+Lyt4eI7BVer3uOFLyc+RwJbR2RT1uxFdRaDGdJmKMuVUSeA6p/VVq6V2tLMBq
 D8wdfXXQVbKPYyWYJBP1eI4TWiTUHRxplgHNIph/SlMH0STIAe8kjJqbGIl21OpAT+CN
 eoynsvGjTMsr7ewwUrYlIg9ZcsbIWlbYD7FegG8pkmRcrM9s31mVz0ZQRCDW4icIO11B
 bzgOUOfeRWNA+1d68P78Fz+fpXwW8T59k3JpQSVp0pDEN1dry2n7hSf8nQB9qd3b9jFe
 Nw44NNhqIFTbClxelli7JgWb1yU2wtuWsjF1q1ifSxh97OWaylDtUBy/aAoJ3w1qMtmA
 fGCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=yru7KmdrOQ13HJ3Y5DYNlYlKEYc79tfskCkI1743rwg=;
 fh=LcHcM9GGWkmugoCqS6631aNArQDYcOMvYl5zRih6Ks8=;
 b=Y/KoWh5WNBRoaaLSYujoyB1zCZc/nfqTmzBUjCvJRA4ysd0uDblOS7fJ75ktVI5XqW
 cgBrgccmR736hmSPMxJTEE+Apc28evd6X8oYSqT/JraQykgi6uUHQFIhR1l5dJFdsSmL
 ncvoN58tenPCLVVVfc1cMQ7btpsJwHxlJqKtnSy2p1LMTrSjA6ely9ZxxZMwxcaiRH0L
 sgMQBlaa6IxAgq+6L1IxmWpFz4Fuli6VyJM3UtgC52dX6VcrwZXCNYkNi/IK3zpi6Eai
 ML3z5jaMBf+0w1TzwhuaON1beCe8UAeNJs7AJRnmp4jSjUaaTXwMiKqkOnEAE6YtubNN
 hspA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774953414; x=1775558214; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yru7KmdrOQ13HJ3Y5DYNlYlKEYc79tfskCkI1743rwg=;
 b=F0YMZrbxSfnP+JkxsgtWLRK4s7OqXE7c1PK9zaH9yXksMJd7MbiWBzF1HH/Sm9SjKr
 m3B0pgmE36az3SxanrJTu34fsxjFUTLAV7a1I5WTD5nAIOMhl5Q/i1m67FGSzo++t/Gl
 dIK8b9V362A1jOqxJUuTJDe6K3ZWTt3fRhG8wJUPQ5ZItt7nximNfL7Z1aui89+qzj0N
 b601Yi5W6xtOwpVb408xzVGyH2xl8YIHuUo2EuD+HR11IVbzWx2Mhm6UtRLbAT/Lewea
 7qJfqyK/esBv3LQVU7SooiN+1d6e3+GuD23pvU8oZ3EHDNMpSecsjxL3ghh687n0nnkW
 mpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774953414; x=1775558214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yru7KmdrOQ13HJ3Y5DYNlYlKEYc79tfskCkI1743rwg=;
 b=fA5oMSSGel++h2sov/O2iyhDCgV+hsgRJGG3SsoVPEf6WHDiTMHKB8wfdplJLM7ch+
 qFYffzwy1oh7DeMj2LU1KQKhnkE6owl2T2nsX0vN0cpJ9x5yonMMKWzoH4T5UYB1Jmkc
 SldQs7RwwwtivUpkfnYkNNz5ulBYdXI4HC39s8q0tWIRkkkpJA0QIirU37XNrYvQJOmY
 KaFT7l8LhPxGPp7CQjNlqAnihshkABMZFRyeO1xHN1om1CQJUAwNKSHFrM9CArmpe5Kv
 AMqeQdebZHAIYsx1720zj21WDQosD/IdGNxVvAqkdHG8zQx29VtaTMIGvxfA7d2aujLH
 Od2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPEwlaRvohS8yQFyL9hhiSsDBK7rTYjMKsGFTKndKHVhdwX5z3zftAWwljpe2y7NSGD2oOcnkE4Q==@nongnu.org
X-Gm-Message-State: AOJu0YyxRgQ9zbIafP4Zm+LXJ9E2wc3MSqjgmBsW6o7ewmiNfk/hkNMB
 VH+/L1B3HGT9WgoIHFk4jEz+21B3Cjwurlj1HC3n+pp8rO3tL61yTIkvJBTcg6iw1FgLqfRRtuo
 V62CTMiAdXrLQETSO74P2ESeSpGBoZ9kvjXxb//ltiQ==
X-Gm-Gg: ATEYQzyDCIUBgvAW3yq4PWJKwp72JeU2zVqnHl9s5tW0YIzwfz+DD7nC5JZQGLGLm0B
 8tLH5yraf38ual/jxr0bVow/PG0Jko86wY9Tj4/xnHw4EkIdQ7e4HDQltsbi/Cp5DAy5iJ/rudr
 AleHKE+RfzPe/RE3QA4PkF5TZC4+UStsj7eolMtFapnQatIPWb8K+afbd3A2142RdMWPV8zSNMw
 z5SR0JtTKABoL5fVzCHw6TrZ8fq3LEirZ7Q0raoOxo/E5q/ruMRlA3YShFKu+wViSBLHQH9B+6O
 JkiUv5dIqDtcFPqLkPmtIjMFeKF2SisnrSj11VB9jjyCXvwa9/kRVNlAm1puNZi6ggQ=
X-Received: by 2002:a05:690e:169e:b0:64e:e896:a86 with SMTP id
 956f58d0204a3-64ff723edbfmr15161764d50.36.1774953414493; Tue, 31 Mar 2026
 03:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260331040659.401397-1-tangtao1634@phytium.com.cn>
 <20260331040659.401397-4-tangtao1634@phytium.com.cn>
In-Reply-To: <20260331040659.401397-4-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Mar 2026 11:36:41 +0100
X-Gm-Features: AQROBzCzeP_9qd9pSjRuHsYGlRcY9oF-urqiLkE3HJVJjcFgugZNpJse8bfUBMg
Message-ID: <CAFEAcA_h+eK3TZSipQCKEFEEqZA1dFPFxYT-V2MK5h57wPDQwA@mail.gmail.com>
Subject: Re: [PATCH 3/4] tests/qtest: Add qtest-attrs-test for memory access
 attrs
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Tue, 31 Mar 2026 at 05:07, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> Add qtest-attrs-test to exercise qtest memory access commands with attrs
> on both aarch64 and x86.
>
> The test covers:
> - Arm virt,secure=on: scalar and bulk accesses across non-secure,
>   secure, and root spaces, plus negative coverage for realm and for
>   non-secure accesses into secure-only RAM
> - x86 q35: normal accesses
> - libqtest-single *_attrs shortcut wrappers
>
> For negative cases, use qtest_raw_cmd() to check that accesses which
> miss the intended AddressSpace fail with ERR responses emitted via
> qtest_send_memtx_error().
>
> On Arm, the test targets the virt machine's secure-only RAM window so
> that the requested attrs must select the correct address space.
>
> Also wire qtest-attrs-test into the aarch64 and i386/x86_64 qtest
> builds.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>


> +static void G_GNUC_PRINTF(3, 4) assert_qtest_response(QTestState *qts,
> +                                                      const char *expected,
> +                                                      const char *fmt, ...)
> +{
> +    va_list ap;
> +    g_autofree gchar *cmd = NULL;
> +    g_autofree gchar *line = NULL;
> +    g_auto(GStrv) response = NULL;
> +
> +    va_start(ap, fmt);
> +    cmd = g_strdup_vprintf(fmt, ap);
> +    va_end(ap);
> +
> +    response = qtest_raw_cmd(qts, "%s", cmd);
> +    line = g_strjoinv(" ", response);
> +    g_assert_cmpstr(line, ==, expected);
> +}
> +
> +static void G_GNUC_PRINTF(2, 3) assert_qtest_error_prefix(QTestState *qts,
> +                                                          const char *fmt, ...)
> +{
> +    va_list ap;
> +    g_autofree gchar *cmd = NULL;
> +    g_auto(GStrv) response = NULL;
> +
> +    va_start(ap, fmt);
> +    cmd = g_strdup_vprintf(fmt, ap);
> +    va_end(ap);
> +
> +    response = qtest_raw_cmd(qts, "%s", cmd);
> +    g_assert_cmpstr(response[0], ==, "ERR");
> +}

These seem more generally useful and not specific to this test.
If this is the API we want for "send a qtest command we expect
might fail and check what it told us the error was", then we
should define these in libqtest.

More generally, if a test case is having to use qtest_raw_cmd()
to directly send a qtest command and parse the response for
something, that suggests that we don't have the API for
the "non-raw" qtest functions right.

-- PMM

