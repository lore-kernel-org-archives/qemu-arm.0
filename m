Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72D4606A31E
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Oct 2026 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LCMY1WnQ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIsZc-00015Z-Mv; Mon, 19 Oct 2026 14:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samanyu.goel16@gmail.com>)
 id 1xIqIb-0005sS-4I
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:33:21 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <samanyu.goel16@gmail.com>)
 id 1xIqIY-00023t-U1
 for qemu-arm@nongnu.org; Mon, 19 Oct 2026 12:33:20 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-9178510f3bdso27667116d6.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2026 09:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792427598; cv=none;
 d=google.com; s=arc-20260327;
 b=CPIJ0c5AQHDR4mZjTx5wEKjylyoH4V4O6Dg6g574C8+82vlfDQjUvYRADUyHkLTobh
 JFUGtfKLUpkwvRLT93AcnavSO6pvjmpFTr7aHxAqXUdP3eCYxmyreg67wwwy7ssJCqO/
 KY5y5qM6g7gWh2RfIcUjbcxC8H/P+rDyMYKLzoEq34Oo4cWLQj2i6TCsgwvop9c+bmiV
 qtlQUUuN72aUEaJML9nD5LuGxd1TjTkz3Ucvn0IhrxQ3WDcQDMVUizpNmaakmN4Ph2ga
 XXdIFF6J421nsWXEFMnXtGbGDc6aYYlWoak5zbI9Jyh+yfbdbGnjb8CgdlWyLeKP9B7u
 EX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=e1ObWCujy2176rl2aE+DALksxcCGC6+kzgPcjPPn26U=;
 fh=zMTBA0ytDu2kU259mjMZHQqvv+48HcAhfAvaQO18Vlk=;
 b=QGk9FLCwJY/b0MNzdxM1C5Ku4Kp09aEQKoakN4azRWzree5aOe+vb6XEHuqT52V46o
 5sx/g6OHW84PxTqPV18hBwJ1ZCi1bFDvFcJKY86/mHlTvYWgw3o4J/jwASHp8VCDGC2v
 P3zlUY7JcbKUs3UYEbNixLAv2upsp+mhz8yBZBWRbwE0niunYENnEWaj9Dh3btJQkLk2
 rsa5RMhIs/Zp8WMlH7uRbwpCEsQjQZTGmDW73C1SkiHAfpRQjHVZvwil1B8ug1u+86Gy
 duNRYCh0K2OkJEUdYtPUfQ/YZd3bf7PHkWmbROTRw0yeo2HMjpa8sNmdy9ipjLbabGBK
 nEUg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792427598; x=1793032398; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=e1ObWCujy2176rl2aE+DALksxcCGC6+kzgPcjPPn26U=;
 b=LCMY1WnQvtx80Z2gAHruhCPGpSu7L8/A/FOihmX2qMiYVWI/80L7o9z8oiZsMMm/Wp
 fDgLPQbo1CFLgJzlSdq0KjxkbRwVSF656GKhvYSlTAVnRj+e3ieTb3Z9F9yUz2MKdyQV
 EYxjazR0qjb80x6ugCLw/7nzXxZ91mIN/DUxlaalgMCa+BtOmN2J/if0cy1NilSZDj5J
 XuzO5EWNXkPU/uyh9qfD9T21gl5Z6cBJ5TeuuZqNR3XuvJCAVQ+izRulCjktIOGsMSxp
 hITsPQ7fbtnobntjPLX/8iXh8VRL/ESoD27p/sv9EieVoQvdBl06TRcWnTHYLcxj8seq
 2vBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792427598; x=1793032398;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=e1ObWCujy2176rl2aE+DALksxcCGC6+kzgPcjPPn26U=;
 b=2mJE8GupI7CP69tIDGxLctnWKjXwXWkFa49rBb7qpJFzgkGJLPlPeT8hJjypDU54kQ
 jcZkqhQ6xQ485oapHY7/pqtAhXifwH/nWkxs+U8GS9JlxecJ5Sdi6Zvf2q8DFkPf4BLa
 VV3V0lGBthP3ks2li/m0cLJb9v7N1DZ30OBgsII5eagj7bybVhCYOZdkix7rZe7AQSUU
 Axi0x656H1V7Kdv0/ujcvDgxVn86bCqS6Hnj08m1wQ9uZ+VDG3Qn8ANxEgCA6Vej4Txt
 CeAWm1SVyqDW5z5FaoFoDalcCsvvbgzAZHMv+llW/NsvF93sCqjkglwEuoN4BOyKf8wM
 vaMw==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2J67tLcEXhvLVX99pvHZHZc1kc9x1rzWUuBau4U9Dyth5I3yJr62QPCvTE6Fdo7tsH+rhDVcQEA==@nongnu.org
X-Gm-Message-State: AFq9FYIKXN2SgZwkehNqpFGOM6+MdGQ4rGxpetGREqM8enozsUqXRojb
 eqa1NC+FVVsD9tDPjpf34nuRA3EqwWyH7H1xTxHBTLKd8DNVbFF06Cqz7kGFyHj4onINpfHFEKZ
 WQVNFFvf3vWG0S4ev6u3UnTzGkjGG2+w=
X-Gm-Gg: AYBFou25avoM8d1loalIT8rYQGDSFvwxCxhLQ9RmtL2zTfCODjGvJy1k6CNntJt80R2
 90Y9aaklShgyJd+fMCTSkLudkpJEq7dyHXaHmCo9/a5+He7L/alw+klTYDjFPbh3gJrdlGq/Guq
 8OP5PkH++QVEmm4KQ8h/zBlHZrgPGUZ7uP3LOOO3qNLrJnl/XOoKTHHydTCxR6QWit+RBYSUKvt
 8XcAcsQXlMTdjtyRfPiZfnqFd4a2zXd8AfkMDdEswzzxVtqpvsBrbrRWL6qr8EOJsvvQ8fiGqb/
 ugW/htOyFkrGCswl+aaTrxLG3uBdD+BMdBVPzvYp+rP+ZNhfb1pXxCvxaSwXSWarsagihKdjRHT
 aQsfipwxdnr/QQfAIREmuNSKFuBtctMjwTTAheJ4=
X-Received: by 2002:a05:620a:2590:b0:93e:4a94:6072 with SMTP id
 af79cd13be357-93f29da655fmr1485290385a.63.1792427597610; Mon, 19 Oct 2026
 09:33:17 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019155519.1302964-1-samanyu.goel16@gmail.com>
 <CAFEAcA_QYXpjXdC8oiTfn2Z3E99hW0j-mcDSqGLhKfKKex8VsA@mail.gmail.com>
 <CAL3-oQiGT2OSxq7casnW7JuwrCM5wa2L4SDpDe_As7+1hyEuww@mail.gmail.com>
 <CAFEAcA82xogQU1vW=NLSxvZHOcz4KvaL3NutgXLZ17eNAvt7nw@mail.gmail.com>
In-Reply-To: <CAFEAcA82xogQU1vW=NLSxvZHOcz4KvaL3NutgXLZ17eNAvt7nw@mail.gmail.com>
From: Samanyu Goel <samanyu.goel16@gmail.com>
Date: Mon, 19 Oct 2026 22:03:05 +0530
X-Gm-Features: AclHuK8wprGiVt1wAi1SWGtHFoFGNHgVg0yEx6-yH8RNc6xOFq0rBlKDpMwEo0w
Message-ID: <CAL3-oQjaq8CL8KrsPEt_S6bzOts+cxyyvKzrjPc_YE=y4L_p7Q@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/exynos4210_combiner: Fix out of bounds access
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003dc36f065e3412ae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=samanyu.goel16@gmail.com; helo=mail-qv1-xf2e.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_SBL=1.623 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Oct 2026 14:58:53 -0400
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
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--0000000000003dc36f065e3412ae
Content-Type: text/plain; charset="UTF-8"

No worries at all, Peter. Since this was my first contribution, tracing the
bug, writing the fix, and going through the mailing list workflow was a
fantastic learning experience for me. Thanks again for the feedback and for
sharing the series link, I'll definitely check it out.

Best,
Samanyu

On Mon, Oct 19, 2026, 22:00 Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 19 Oct 2026 at 17:25, Samanyu Goel <samanyu.goel16@gmail.com>
> wrote:
> >
> > Thanks Peter! Good catch on the read function, I totally missed that
> part of it while focusing just on the main issue.
> >
> > It makes complete sense to clean up both functions together in your fix.
> This was a great learning experience for me, so thank you for taking the
> time to review and share feedback.
>
> No worries, and sorry that we ended up duplicating effort.
> I've got a bit lazy about not assigning issues in gitlab to myself
> before starting work on them, I should be more careful about that.
>
> I've just posted my series, if you're interested:
> https://patchew.org/QEMU/20261019162217.3272337-1-peter.maydell@linaro.org/
>
> -- PMM
>

--0000000000003dc36f065e3412ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">No worries at all, Peter. Since this was my first contrib=
ution, tracing the bug, writing the fix, and going through the mailing list=
 workflow was a fantastic learning experience for me. Thanks again for the =
feedback and for sharing the series link, I&#39;ll definitely check it out.=
<div dir=3D"auto"><br><div dir=3D"auto">Best,</div><div dir=3D"auto">Samany=
u</div></div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 19, 2026, 22:00 Peter Maydel=
l &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, 19 Oct 2026 =
at 17:25, Samanyu Goel &lt;<a href=3D"mailto:samanyu.goel16@gmail.com" targ=
et=3D"_blank" rel=3D"noreferrer">samanyu.goel16@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; Thanks Peter! Good catch on the read function, I totally missed that p=
art of it while focusing just on the main issue.<br>
&gt;<br>
&gt; It makes complete sense to clean up both functions together in your fi=
x. This was a great learning experience for me, so thank you for taking the=
 time to review and share feedback.<br>
<br>
No worries, and sorry that we ended up duplicating effort.<br>
I&#39;ve got a bit lazy about not assigning issues in gitlab to myself<br>
before starting work on them, I should be more careful about that.<br>
<br>
I&#39;ve just posted my series, if you&#39;re interested:<br>
<a href=3D"https://patchew.org/QEMU/20261019162217.3272337-1-peter.maydell@=
linaro.org/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://patche=
w.org/QEMU/20261019162217.3272337-1-peter.maydell@linaro.org/</a><br>
<br>
-- PMM<br>
</blockquote></div>

--0000000000003dc36f065e3412ae--

