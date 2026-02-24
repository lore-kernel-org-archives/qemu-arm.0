Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE0CF3C9A1
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 15:54:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuukI-0004Tg-Bh; Tue, 24 Feb 2026 10:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuuk6-0004I2-66
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:54:36 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuuk3-0000LP-Km
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 10:54:33 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64c9fcc24b3so649040d50.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 07:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771948470; cv=none;
 d=google.com; s=arc-20240605;
 b=c2mefZJJCztgqsjlZpxmtEks/drXX7BHBXKLMrkpHBz01gwlM5y/g3/bPBCIYKbm/U
 +G2y1Iloo7RmL73Ss0JtG8oWq0Y4xiwO5tPFJOduSbEYBrJZRjF009GXpMiN5U1lPur3
 UA6OISCgMTTwvDnYOydGT9o82OnOmJ3qO6VoJ9hNfXDLWxe+kde4aqaFLRUdClyWZkmI
 HgX5QvIU52pRDf4BtPoc8PMqtTVbVSTz/iGKPwEWT/Bc4lQQa736YR38n9AdDtUwoUZP
 IbQOXUNQilVvKyxnvmyDJaAm4GVaOsQSdsePbRh8P4BQnWOwLfWbN3Kkux7HOAH0T8yO
 jFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0/vzXuzvT0P0734Wh6U9qWt+r3Wwam94C15lFCAmbGU=;
 fh=+jbfn8b7yr7vUTpYyM92G8uzkFEZLuf6UPGqzmV4TqE=;
 b=lD5D1/BWiMMLBJAKnkDs1QPQ2yWmNhKQV7J6BimfqszN+30LlhAVQh0xb3/fSdtYGV
 t/hXgTZIPOkIIIxSpQZqXmI2OKJOyNhBC3aSEwPw4EEb9fIZQcF9WZxENUtrA8fDITps
 fQuAe+qSR/qJMDyY5Ty8VkxdZdH27ENDVJS7tvl4ngYMvbBa0iyOp5WxICNUi+5oUHBm
 m0twe3/SoKRaNIRLmz5xKfB49o2xxdORqgRzy54Af/9HnT5rlkjon0cGjrbK8OKn0nVg
 5otSZjGCPj4r3uVin+gP9HGOj1k/SOl6pLz5FCLjbHc/2HYmrWCor7kfYkSfD1ted8AC
 tgAw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771948470; x=1772553270; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0/vzXuzvT0P0734Wh6U9qWt+r3Wwam94C15lFCAmbGU=;
 b=vO8S3Ofw4xL+Ek+sy7TjMrD6HrZlp0DFeDwXgjlzAxW+apHRnAvh/Hk3tr7g6RM88n
 Khb0imUFyECeeLC0kXGqK6PwOe9qe/y1NUgmCVbxTN0Ws+AnoPq9wmRnmvBWIIY5PUTJ
 xWfVgoHPgWU+pnK1O3odFYhTM2zs6EGxVXaqVCOfNe0G/R46iaOht2wrzmNmckiqrhAa
 dERenSekoPyz1k2mFPMktns8wyausuzxx+6ZzcV5i7vN6kvXouhF7iAVlyEqUWkCEzgB
 FpgFMfpN+C+RroB0BT6kJHFmKqjT9nTD+8GVRwG0Um7c3PaL/wqZTiwXd2V/qGhG+Sdc
 UjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771948470; x=1772553270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/vzXuzvT0P0734Wh6U9qWt+r3Wwam94C15lFCAmbGU=;
 b=Ip4DPgZyCURcq3X9cONTub69AHfeWUds/2E/rvwhcBuoR7yppLR5Rc3hBMu0Benyz3
 QGH8wfy33SzvJNmUkN6rNIwP845pjjWGFzgjzpzSe1SMWbuuC3zacwmEQmAGVIgpXpUB
 YkANKydQNc2PnbIw24ueAe+Rv2wT572piJiaFLtMk/mqndijZZEPYPtLKGgRiFamw7mz
 ZTj/94NC30ukkQ6Gf9sc678ZXBX09cOh5JYkFhRylhBsf1U8Mw/7Gd9OXlA6Md2oCYbv
 Oyyqiy9+hY/U8ikXBP4/3BNvSv2d7QrAs6RB3RnS76c50tKbEKK5f8sPkcM4+NylNzJ8
 E0zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK9E9o8zw+1k6xqBQfOBRZt/3T42UphkWotvVZHrthoXCELg/EGy3NMPqNcONSezxGVx2OmXtvrQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywwme7X5ic9jveCoAOyHn2EAdZDKN1R29ezgFDotJ62F9q3cvZb
 P9GpsYAdej5bkIcKAXVAtrHPJT7/VizxGPA6aT5UtZMD0iU9BdyYZDV8PNRsJSqhHZZc/UBhe1R
 qy7WctejxyhRrCk5meP6MRhsRJ9/bBSIda1rLec3rG2FbhIuU5tsoElA=
X-Gm-Gg: ATEYQzxROo7BmbRHRsKnUKjwnffpFXJ9e3trub4/Kw2RiS7nBVpYAj9hiF0OpUBAXZR
 wTPI7Z0EmyKtA2JFt9Y+TPEqffTvREXCxrjV0roNZA9Gh9BbHbyz1+1pcc6/EZRZX0cKTl1bL1u
 5QnWL5eLNDjQFRoMIqFFJIm4q8xawESkxu7RgY6lspTy0OgC/9Ncj1rdYiecEFSeIRpmihB+veT
 FldNn0luyoNwYTR5Hmu3yNdaACxI62RciBwFoe4vT7F7U4WmZB3A7iUWF09XE/s4eISDn0WMrH9
 7pUEKfmLOACZawUJrZzkTAJnann/u8wTY7bgYmzcAxS7VQNP9YrtDKTo1TOSZQysOUA=
X-Received: by 2002:a53:edc4:0:b0:649:d604:fb70 with SMTP id
 956f58d0204a3-64c78d3b33amr7877233d50.54.1771948470191; Tue, 24 Feb 2026
 07:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20260222082529.491384-1-tangtao1634@phytium.com.cn>
 <20260222082529.491384-2-tangtao1634@phytium.com.cn>
In-Reply-To: <20260222082529.491384-2-tangtao1634@phytium.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 15:54:18 +0000
X-Gm-Features: AaiRm52ma_DkBuwNOIeoqbre3EWuxZ0lhNKERGxFpzA11xUwQTAlI448KUrCUW8
Message-ID: <CAFEAcA-L2oQ2p3nQVDcqpZSjhtU123Sep+ou8xOH-0jFug9LNA@mail.gmail.com>
Subject: Re: [RFC 1/2] tests/qtest: Support for memory access with
 secure/space attr
To: Tao Tang <tangtao1634@phytium.com.cn>
Cc: Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Chao Liu <chao.liu.zevorn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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

On Sun, 22 Feb 2026 at 08:26, Tao Tang <tangtao1634@phytium.com.cn> wrote:
>
> Introduce `*_secure` and `*_space` commands to the qtest protocol and
> libqtest API. This allows testing devices that behave differently based
> on security state (e.g., ARM TrustZone/CCA or x86 SMM).
>
> - `*_secure` commands specify the SECURE parameter (0 or 1) and are
>   compatible with x86 and ARM.
> - `*_space` commands specify the ARM security space (0-3) and are
>   ARM-specific.
>
> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>



> + * Memory access with MemTxAttrs:
> + * """"""""""""""""""""""""""""""
> + *
> + * The following commands allow specifying memory transaction attributes,
> + * which is useful for testing devices that behave differently based on
> + * security state (e.g., ARM TrustZone/CCA or System Management Mode in x86).
> + *
> + * Two variants are available:
> + *
> + * 1. ``*_secure`` commands: Available on x86 and ARM.
> + * Only specifies the SECURE parameter (0 or 1).
> + * When SECURE=1, uses the secure AddressSpace. The asidx argument to
> + * cpu_get_address_space() can only be 1 on x86 (SMM mode, X86ASIdx_SMM) and
> + * ARM (Secure state, ARMASIdx_S); all other targets always use 0 for the asidx
> + * parameter. When issuing ``*_secure`` commands, we assert that the secure
> + * AddressSpace must exist.
> + *
> + * 2. ``*_space`` commands: ARM-specific.
> + * Only specifies the SPACE parameter (0-3).
> + * SECURE is auto-derived: secure=1 for Secure(0)/Root(2), secure=0 for
> + * NonSecure(1)/Realm(3), following ARM's arm_space_is_secure() semantics.
> + *
> + * Secure variants with .secure attribute (x86/ARM):
> + * ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> + *
> + * .. code-block:: none
> + *
> + *  > writeb_secure ADDR VALUE SECURE
> + *  < OK
> + *  > readb_secure ADDR SECURE
> + *  < OK VALUE
> + *  > read_secure ADDR SIZE SECURE
> + *  < OK DATA
> + *  > write_secure ADDR SIZE DATA SECURE
> + *  < OK
> + *  > memset_secure ADDR SIZE VALUE SECURE
> + *  < OK

Rather than creating two new separate families of commands
for this, we could instead have an extra optional parameter
to the existing read/write/etc commands, so for example:

  readb ADDR              # read, with MEMTXATTRS_UNSPECIFIED
  readb ADDR secure       # ditto, but set the attrs for secure
  readb ADDR space=realm  # ditto but for a security space

This patch has a lot of duplication of the existing code,
and I think that doing it this way round will help reduce that.


> +        if (attrs.secure) {
> +            as = cpu_get_address_space(first_cpu, 1);
> +            /* Secure AddressSpace must be available when issuing secure commands */
> +            g_assert(as);
> +        } else {
> +            as = first_cpu->as;
> +        }

You can't assume that the first address space is the secure one.
To get the right address space for a given MemTxAttrs you do
what cpu_memory_rw_debug() does:

        asidx = cpu_asidx_from_attrs(cpu, attrs);
        res = address_space_rw(cpu->cpu_ases[asidx].as, ....);


> +    } else if (strcmp(words[0], "writeb_space") == 0 ||
> +               strcmp(words[0], "writew_space") == 0 ||
> +               strcmp(words[0], "writel_space") == 0 ||
> +               strcmp(words[0], "writeq_space") == 0) {
> +        /* *_space commands: ARM-specific. */
> +        uint64_t addr, value, space;
> +        MemTxAttrs attrs;
> +        AddressSpace *as;
> +        int ret;
> +
> +        if (!target_arm() && !target_aarch64()) {
> +            qtest_send(chr, "ERR *_space commands are ARM-specific\n");
> +            return;

> +        attrs.space = space & 3;
> +        attrs.secure = (attrs.space == 0 || attrs.space == 2) ? 1 : 0;

I think that because include/hw/arm/arm-security.h is a completely
standalone header that is safe to include in compiled-once-for-all-targets
code, we can include it in this file. Then we can use
arm_space_is_secure(), and also the ARMSS_* constants for
the space names rather than hardcoded numbers.

thanks
-- PMM

