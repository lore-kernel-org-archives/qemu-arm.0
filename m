Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33442E81BD9
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 15:21:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpT48-000498-PU; Mon, 09 Feb 2026 10:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpT41-00048B-HL
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 10:20:38 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpT3z-0004aT-Hu
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 10:20:37 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-79456d5ebf9so30667327b3.2
 for <qemu-arm@nongnu.org>; Mon, 09 Feb 2026 07:20:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770650433; cv=none;
 d=google.com; s=arc-20240605;
 b=ZupA1ZJKXchw02qUXWrckl9KS5tBwEFt1cdbxMFNO+751dBDYjkGC90yIaAUI8FuYc
 BkPqBWZ2uTdBplSOFgsHAz4OJwCTOpGT8k1JtAg2PIBYATFCx0Qyf+xhmL43mb1gaNXI
 DbI1sghV66UYmW2xHTG0qqP7WVLgKezXxel0a3VdL2qfdwqkX0fUSYEVMgxSwJypfUlU
 FlTDR88fwTZWII+I+vPZJLvklREG6z7eRzvbVHTX4kHY0ccaUHI+tdFeBfveqyhaydDw
 Qd2udQvTIYU4dTiHrwm9YpJBOQ5pCBlCvSnqd0coHCoa+ddpvUuXca9HfJaOxvvCWFXh
 7lhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3LkCFWFmHlt6KdVjr47JjGdqHnMFJ13CfffcYPYIxi4=;
 fh=ZptGyu9tWhFFiUDsc3pO9GMTCFFBN8ecmXTRne+TCXM=;
 b=WkjAgcAaEBQB50r4R+tocgPWRtWTVPd4ayYNCiWiXwkOCrHpuMrF+mLisg1UpwquJl
 92h+gLuwcZ3DcB+LDXpydZe1eKYXqSGxwauTS16BelbXmyCf0j2/DncKkZ3pQ4b3EUV7
 XwhWE5ccNF3I9Jd3iBDMxWWZDoZQ4/GXO0QS61EtRn+QEOXJFpdSKz/K7rg/DEe5sSfF
 NdGA4jB0A6VOSIBRLkWn6cerE1/T2gh1Le5M/lyNffK77DItNWd9msUS3AYdiDzD+Sr0
 m/h2gs94l4Z7sFxlqv+KxMcdhs3JqNbtNt0veF10P7fkIIFnJsvezHcDS9QtLXcbgZxg
 oI5Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770650433; x=1771255233; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3LkCFWFmHlt6KdVjr47JjGdqHnMFJ13CfffcYPYIxi4=;
 b=TlpwnxgX5HFZ762fSFVeNkVCRle+8Bbz6/ncCBYWj/T7zS/Uwha0q8zBvd5se6iaiU
 QogHj3Xk1L2awSW1285fdDY8nwI8JHboBMe2LHp9jpgH4YfJA/AftJJOigd9iAr4CG3m
 7IwqViqLulsB7S5V7Z4l0oJ/3Ok2cgcsTm3YFAY4KuhNY1bOauDiCsmBfxbY7ARUpffJ
 PG7jBWnmTGpLmOi0y/XCwblvznGxdn0WVD5wZ5TpJM+s51GegZMjTm1Uc+JlHVRGOqHR
 lqi6/EX7PnMhP7KZZ3hYcI4WEiPAfigZg7U7I8amJD12Lhln65yWY7vFyNG6I2FUlHae
 2qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770650433; x=1771255233;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3LkCFWFmHlt6KdVjr47JjGdqHnMFJ13CfffcYPYIxi4=;
 b=qCeXrs6Brx9gC2QXuvfMFuVigMohaVBxXC9qyN9LLY44A5jtdFMKpG2tRPpzl7Rrb7
 RnAZkjUtpqMJYCcVYvecmYPBZ31knk9iMRQHzWNDCk4UAMoExoCCGh+9yByqkqmIoeqz
 M9CnvjH15oc7ND+uMqBkfbU2W73rN7LUTm1gR3j650v64wKo1+5AyOmX1f7imqVg/PEU
 n8cJp6jYKiAaXzg5ecKVtUjSXRBIl1HeAPXd4kpuJzNFFd6tnuQTpfmCBU6Tf8BBd7Uv
 1NigXJgc1MBn6vA2GGLPI99gTq8uIaDBv8TAc5EEIaF5WIa05VMTzf/okOTOT+fxCYzE
 Jccg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcKKpGKgi9sQ+qU7T1sLnSLvMW3KzOwe/9t8ZkRhlZBPj+ZUV3GnC9zxVEjYSXSLUP09eMnKDQOg==@nongnu.org
X-Gm-Message-State: AOJu0YzY9bZGevAr95CxtYgL6/EVWTpi9mkvKZ7Mhk0ZzBbw2CgsYLOE
 kMzxnfTPAZM52FqVwKXXv9550aSlBDFrS3VLxdnAQ/O/BUwJLcGCa/ppFNpdfUWMw397i9fvL9W
 0LpVuSY60pUcJYbd/vYfYW3AXk3iUsNepJG17xUsFEQ==
X-Gm-Gg: AZuq6aK6xwIgih6xG2jg7pFroYpLs4X4Xij9ml0VJFqdqhA/vyzh9bZQHRSAlsxUprW
 BwEG1c8dfRHQRdtlH7Lvn2CEhK09pP/MMchHWL7DBHyRmeYP+zlCMFlF7w5NMm4iYa3wMlstH2h
 Phq/wiLVOArEfhVPTS4fKVB4ZFz7yfORh0zLM6gHK5bHkpi7qbYFNxqIonGaiNl+0+ZKdWTsOff
 vlBy8DT+GrK7FuvG2x8P3vBTW7sTBOcqRZC4OBvyL5FP7b3TSf4eUY6bxb7xlQpRLgdG6K6ypyu
 MN2hZlxNmnD8dHrlnG/LexQletNzpSi3VCjQiOA4qCcVSLeF2ENqFQc=
X-Received: by 2002:a05:690c:f87:b0:796:3edd:7c2f with SMTP id
 00721157ae682-7963edd7da0mr38220827b3.13.1770650433263; Mon, 09 Feb 2026
 07:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <20260126165445.3033335-3-eric.auger@redhat.com>
 <87bjhyymx6.fsf@draig.linaro.org>
In-Reply-To: <87bjhyymx6.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Feb 2026 15:20:21 +0000
X-Gm-Features: AZwV_QiI-nohCUsxdl2IjZbycDubdZzkq2ewzyPIMEp9Ue3lsMW6mIvasdDobz0
Message-ID: <CAFEAcA-q8zCFkXuYs1vWcEMuSmha4kVsX3hoUermzh3DqYHy2Q@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] target/arm/machine: Improve traces on register
 mismatch during migration
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, cohuck@redhat.com, maz@kernel.org, 
 oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com, 
 ddutile@redhat.com, peterx@redhat.com, philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Mon, 9 Feb 2026 at 15:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Eric Auger <eric.auger@redhat.com> writes:

> > +    #define MAX_CPREG_VMSTATE_ANOMALIES 10
> > +    uint64_t cpreg_vmstate_missing_indexes[MAX_CPREG_VMSTATE_ANOMALIES=
];
> > +    int32_t cpreg_vmstate_missing_indexes_array_len;
> > +    uint64_t cpreg_vmstate_unexpected_indexes[MAX_CPREG_VMSTATE_ANOMAL=
IES];
> > +    int32_t cpreg_vmstate_unexpected_indexes_array_len;
> > +
>
> This seems a bit old school when we have GArray.

> > +    int arraylen =3D cpu->cpreg_vmstate_array_len + MAX_CPREG_VMSTATE_=
ANOMALIES;
> >
> > +    cpu->cpreg_vmstate_indexes =3D g_renew(uint64_t, cpu->cpreg_vmstat=
e_indexes,
> > +                                         arraylen);
> > +    cpu->cpreg_vmstate_values =3D g_renew(uint64_t, cpu->cpreg_vmstate=
_values,
> > +                                        arraylen);
> > +    cpu->cpreg_vmstate_array_len =3D arraylen;
>
> I wonder if these would be candidates for fixing up as well.

These ones are the types they are because they need to match
what VMSTATE_VARRAY_INT32() expects -- these are the data
that goes out on the migration stream.

-- PMM

