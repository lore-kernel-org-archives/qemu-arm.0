Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp359746ejq;
        Thu, 4 May 2023 07:49:32 -0700 (PDT)
X-Received: by 2002:a50:ed19:0:b0:50b:ca21:a85e with SMTP id j25-20020a50ed19000000b0050bca21a85emr1751589eds.35.1683211772786;
        Thu, 04 May 2023 07:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683211772; cv=none;
        d=google.com; s=arc-20160816;
        b=EDUP/iMr/kHZd6cjdnzd3l7m7yM15uhfd+uEstz3ALwYUzy4DiJkc68esiB8U9sCsY
         WVoYwSouV2lUnqC0eKl0PbKHVEpYD8WyTfMNw4qTRa7Txx4F0vCr4ikkvlgGlWQLxBl3
         x/rnxG7f9s9no580Kihn8BMJARl2z7CMNCGH6uaV0mjlMbZGGFpqE0PpuLbYha0ifmpO
         Zz2QR5JLTZKBRy9HCZxeAaH5asfBwTNaXwMz9q6hDGZIBkJcR4/0+Ngrkb19GCfJ0lfw
         pYyCvGlM+bCeO2jmXG3twHFs9P6VTPgPPNFp4/pxbKCvCWjW+jSl5eJSNNR+c4syBLkO
         m5tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GstM3uCHYYNhP7vLiPGJkNr4X7whCpAksFGwpTC8qGk=;
        b=0oiaIUO6CC5FsFWEkCVXVNNz3VqZncdiyACUydoKPRbdpz7uvHHrFfahK19bCHWzjr
         lc5pXZG/qQNp4tY9dHMqB1hcSxt7bCuoemtKZSvE3iiM+3v2q8wO7eN8uPJ+Aax5AEa/
         iKgNUs8z5UIvR32WLq6QQVMSDrjqnQWd5WvTsvlcLrlGEuDV4dpHeOVjGSQ3e8vi77vi
         SdWDdiERTF6JLIQHStEJtOMRGZUC2AWnqCnA+HCi1oBdLyWn3AM2SROxu22c5tQ6J6Fp
         ZM9lfojtICl687PYA1PDkbpBRF1rrCH/LcE3ZcHsQZ+RwM+EtDd0ATcSk5uoXkPGNbP9
         sLdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2l7e6kw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i18-20020a50d752000000b0050bc4e04fdasor2402914edj.0.2023.05.04.07.49.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 May 2023 07:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L2l7e6kw;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683211772; x=1685803772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GstM3uCHYYNhP7vLiPGJkNr4X7whCpAksFGwpTC8qGk=;
        b=L2l7e6kwZ1zye5vBA5JdgavpVPQ7GTz44lHYC6AEIk7v0AEJrm8IPT7kjZw8AqEuha
         Oeq743CGnnivzMnMGw/pjN3kQG3GSGepO2aLIduH91A3a4nQIMD2zYF3SySSykXhaKPm
         GWRMdCZmB4sNTmFIB069ufP85Q24wiNjo0fKaH1vMW6D7kniTS1r3OGUvSCKX9nmgDEN
         cv4NF+vI04OzZH+/t8FZBzrKuIfVfOO44Z+yT/ibj6SFd/xTtBHcibj0wC6xVJRQxev+
         tzGkG+cAqyEl9513J5JVBXHYIC1Stbzm9TKnaLRra4xU72y4ouH2AYbs/pRz01xh6tgq
         VQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683211772; x=1685803772;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GstM3uCHYYNhP7vLiPGJkNr4X7whCpAksFGwpTC8qGk=;
        b=SBnTVyto83moMDyuHdtDHTIBzx389BqFNEOnn9IxLhIDw3creV+2d1+MOfarlQStdX
         MCJz1mgf7+PPsjmRuQQbIBMRuW8e3HZ0A3cg0lWvynbqqp7FJLk5D1Q7qodGBi1GdlNT
         6sw8uChYDfK1xxpxvd6LlQXx5C6MMQ1CifbbJqo4FZ2vXTjFdxm5L7hDJ26M4WoNKxbj
         zQjVZ8nCJEA+DXHgg4hhyYHxH/LBdQ6dkGNHaGiga9+tuHQCpojk2g+/HbDXfZhiT9XX
         x/UG/znyjZtGAEHAgJBcUTwycUNLQe4H10SbDVJovgByjFMGvhpSCq4kCWHgzADiz5nd
         Q4lQ==
X-Gm-Message-State: AC+VfDxpD7ltuAETQQyRHizBLSB+TF3MtkiAiZIZyqY3t2M2FG4JqeUc
	4dn0YP3sMkVl2xMZtgc11kvbemN9goVUJSf9bS2yUL5RVCWi+ru7+50=
X-Google-Smtp-Source: ACHHUZ7BNquxS80Ct2PDV2DD4UP2fAat2wEb/hwwhGO/o0Jjj7xWdEBC6yBmBLMujI/zpMysprCXfKe6IscCnjLz56I=
X-Received: by 2002:aa7:cc11:0:b0:50b:dcf6:8e6d with SMTP id
 q17-20020aa7cc11000000b0050bdcf68e6dmr1429493edt.18.1683211772386; Thu, 04
 May 2023 07:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org> <20230503070656.1746170-2-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 May 2023 15:49:21 +0100
Message-ID: <CAFEAcA8k-4Obf9njjX9zcBTLhS3vdUNyeYYLSb3wTiy5nJyS7w@mail.gmail.com>
Subject: Re: [PATCH v4 01/57] include/exec/memop: Add bits describing atomicity
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: s6/r38Wl2kAO

On Wed, 3 May 2023 at 08:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These bits may be used to describe the precise atomicity
> requirements of the guest, which may then be used to
> constrain the methods by which it may be emulated by the host.
>
> For instance, the AArch64 LDP (32-bit) instruction changes
> semantics with ARMv8.4 LSE2, from
>
>   MO_64 | MO_ATMAX_4 | MO_ATOM_IFALIGN
>   (64-bits, single-copy atomic only on 4 byte units,
>    nonatomic if not aligned by 4),
>
> to
>
>   MO_64 | MO_ATMAX_SIZE | MO_ATOM_WITHIN16
>   (64-bits, single-copy atomic within a 16 byte block)
>
> The former may be implemented with two 4 byte loads, or
> a single 8 byte load if that happens to be efficient on
> the host.  The latter may not, and may also require a
> helper when misaligned.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/memop.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/include/exec/memop.h b/include/exec/memop.h
> index 25d027434a..04e4048f0b 100644
> --- a/include/exec/memop.h
> +++ b/include/exec/memop.h
> @@ -81,6 +81,42 @@ typedef enum MemOp {
>      MO_ALIGN_32 =3D 5 << MO_ASHIFT,
>      MO_ALIGN_64 =3D 6 << MO_ASHIFT,
>
> +    /*
> +     * MO_ATOM_* describes that atomicity requirements of the operation:

"the atomicity requirements"

> +     * MO_ATOM_IFALIGN: the operation must be single-copy atomic if and
> +     *    only if it is aligned; if unaligned there is no atomicity.

Is this really "and only if", ie "must *not* be single-copy-atomic if
non aligned"? Plain old "if" seems more likely...

> +     * MO_ATOM_NONE: the operation has no atomicity requirements.
> +     * MO_ATOM_SUBALIGN: the operation is single-copy atomic by parts
> +     *    by the alignment.  E.g. if the address is 0 mod 4, then each
> +     *    4-byte subobject is single-copy atomic.
> +     *    This is the atomicity of IBM Power and S390X processors.
> +     * MO_ATOM_WITHIN16: the operation is single-copy atomic, even if it
> +     *    is unaligned, so long as it does not cross a 16-byte boundary;
> +     *    if it crosses a 16-byte boundary there is no atomicity.
> +     *    This is the atomicity of Arm FEAT_LSE2.
> +     *
> +     * MO_ATMAX_* describes the maximum atomicity unit required:
> +     * MO_ATMAX_SIZE: the entire operation, i.e. MO_SIZE.
> +     * MO_ATMAX_[248]: units of N bytes.
> +     *
> +     * Note the default (i.e. 0) values are single-copy atomic to the
> +     * size of the operation, if aligned.  This retains the behaviour
> +     * from before these were introduced.
> +     */
> +    MO_ATOM_SHIFT    =3D 8,
> +    MO_ATOM_MASK     =3D 0x3 << MO_ATOM_SHIFT,
> +    MO_ATOM_IFALIGN  =3D 0 << MO_ATOM_SHIFT,
> +    MO_ATOM_NONE     =3D 1 << MO_ATOM_SHIFT,
> +    MO_ATOM_SUBALIGN =3D 2 << MO_ATOM_SHIFT,
> +    MO_ATOM_WITHIN16 =3D 3 << MO_ATOM_SHIFT,
> +
> +    MO_ATMAX_SHIFT =3D 10,
> +    MO_ATMAX_MASK  =3D 0x3 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_SIZE  =3D 0 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_2     =3D 1 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_4     =3D 2 << MO_ATMAX_SHIFT,
> +    MO_ATMAX_8     =3D 3 << MO_ATMAX_SHIFT,
> +

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
