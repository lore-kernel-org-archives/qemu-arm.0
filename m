Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353FE606A31A
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Oct 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MoRrB+sC
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xLKJI-0006NC-SJ; Mon, 26 Oct 2026 09:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLKJG-0006Lq-Ec
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 09:00:18 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xLKJE-0002vn-HI
 for qemu-arm@nongnu.org; Mon, 26 Oct 2026 09:00:17 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8ab43af5e97so28541047b3.1
 for <qemu-arm@nongnu.org>; Mon, 26 Oct 2026 06:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793019613; cv=none;
 d=google.com; s=arc-20260327;
 b=a8dpX3k+KPT7+VjwwHdT+fkTnP1BKWcd18ycW6skMGnjAE5k/5givRXXsar2JPKTbL
 IYNrYEmBDycD1SDEuq7wr58ZZ34qeprVnyUbg7FfkEC+xOs9eyG7AS9cjB5shmQ0IPQu
 s13oxoUd2Q1DMN9pJcRvEhpvDSJxJML9sEJcF+mFEnGF/ClbC4xf43rIumvtdY+q80Ux
 0r8o3fYbpBSz6bpQYXvxlVFU8dT5UzFoxjToA/1+Svw91+jTnW7ID8r3kKIw0GQ0ZV41
 bJVNPvtuoREg5xuP6KvgH/9+FOsl6flp/ylpkzW7YRv4ktwespWdse9XBI5vuBOGrAzL
 /Y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ihqk4gb/zPAdcLj/1nSQMj+bUbq42VGtZ2AIX+Jrako=;
 fh=v5kWuymo7QGJlnKPqU2S8FEM+XudMPdRuBOUIsedl4E=;
 b=M2uhdMlJ4oLTHDgCgGrMDfGv09lb1T9xKefHEzP5s+UJDiuYp0wGJ7nwKFfLe/RLDx
 Oih2ZYUuXyWVpUrgTXcwxNly81qC6yAUNwSWcgEGdXOKS7/hLHcLkIcMK4DqU5iNpZHC
 ZdEVsNAL3Bi/fUyUuCj5TWr0B4WU6GV+qOKs4/efGqs22/WekjaKwxAmzSEoePui1pIP
 3AxFDq7mzAO/m9z/v6aFn6EoTavoL8pt/S9hji9i756eM9xBT49q6s1DCHBDfUrEuizY
 rtNL9sOuFvwHVXiBd+QLnUJxzcM5JlATUYifYWd1rdJHe/lifsAYU7u6w7VnMXHvIzjM
 t5XQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793019613; x=1793624413; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=ihqk4gb/zPAdcLj/1nSQMj+bUbq42VGtZ2AIX+Jrako=;
 b=MoRrB+sCAIv7o9HkJIkNQJrQz5hyVq0zzSdAKEVzlUByMkl2K8Igra03pu9BUXo9B7
 BQo61kwP/Oue/hYBHFvN+U+BM0PDYZKemL7gwKojJFCw/qreXt9S1muCUVV0eVknLgVJ
 Qkw9mrZQ2p/luWAyyUuPjpxPThV8bTDs3RegxCvaufJOKKADz+L/LqFv3IdwM2xQ618u
 TGigXyh9q/aHyXIGYmjHGodu4YEKW7t821vCFrskIKJ2n/G28RccKdc05fy94vgb2asO
 BRQmhQ5I1pSwTpDDGDl7HEOle6Y/XrmEV30NZ6siWsfa2l0KT6ZLUTICjjN/A2lbuYdf
 +TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793019613; x=1793624413;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=ihqk4gb/zPAdcLj/1nSQMj+bUbq42VGtZ2AIX+Jrako=;
 b=buD6ljEafBnzc6N6B0pD0GMnUBgxiA2cQWSr3v64I/9q2eXZhOs+ZORs7qyIUrO0oL
 YhvU/o1ng3Jf+SKd4DeY7RaD2HebpvhAuDsu/J0O98vCzYztewt0UqYj80Ch807NHoZc
 UdGqi0cToZFHkyr500ALbKtIp+qbStzpijqC+x1ZjK68o9+4zDtuqsO6qKy7zijVleWP
 VGkggjTEE2NJngo0ZRVYEtsV7FW95xX45/N96hzC/oGznmsf9VdLLufLE87PLwThGa1T
 Q9q9EdCGvHeZx5/CWCs59tOcLDLESDak6KZzKfXf9ywcD2jR7H5UQXjWitt9Zxa+TZkn
 JxrA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxxfCCKJaGdpuOGV5Gs9WbO6+R+Mbe8cvn7r/J5DMufYJuWU+h6RGPrqVSjPVo1lWlcGz0GLOkPBQ==@nongnu.org
X-Gm-Message-State: AFq9FYIMgz3FTSAo3ZVFkZs5E3JrUQf5zjupk1iiIHCS82B2vhNfkg5D
 Dv4zy/k4AQAAdPJk6gsUndCOw7cT5dMK7tk/pZavUeIgZloBh6zBPM4NzWHBiZPlelHs+1/oMYI
 AdnNuGkFMh0oeBhu379jgtbXYvwHqnBZ+14wCDTbdLQ==
X-Gm-Gg: AYBFou1o01FJnO/4m0tB5PwdTunL+9NL32fKeeKHQIobCvSwb/yDV+5VpyWsp6iASi5
 2CefITKWYkIP7MLTU2x6pHg2y4Nf+pjT0dBlKj2K3x0Rmma8/PeE5AP5Zfd+/f9EBUJMH+Jg9se
 S3gymTr5GyvV5loUui7eXiH3NG6pw3FcCtHvk1SNeaB7ZmObv0/u1asBVobdFFgkXO7sswBXOHW
 WSd1iqoDhn4iey22CEzlxZNCkoqzZhP8q+gDL1xR4ClQ2edxHIjCpGyChqgEE2792zNbzxZ4TON
 1wS+3kddBxOCNWLlxMpSJ7f2m2zQlRC0swAEY/GtxntJwIA2Ll2dpc8Hte+q8O7Ez2UX7v5f5eU
 8c38fJIZRENWj7IB9AfCeo58zzcinDLAaIzl0qVhKPaQxEKCUkQaXqZwILwWazoBzy2U2JNDbQw
 G3gdhYqk+X7t7qY4lIhTfG
X-Received: by 2002:a05:690c:f95:b0:8b0:cf3d:7b10 with SMTP id
 00721157ae682-8b16731a990mr42279717b3.28.1793019612986; Mon, 26 Oct 2026
 06:00:12 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <DB8PR04MB7177C8ED1A20409414A573EF87622@DB8PR04MB7177.eurprd04.prod.outlook.com>
 <CAFEAcA-dpfXTLk9KNJ0OsOEaCYppcZLLgcnOCqhUXmOVE2jfaw@mail.gmail.com>
 <DB8PR04MB7177409A95BDC85AC5446A6687612@DB8PR04MB7177.eurprd04.prod.outlook.com>
 <CAFEAcA_BNjFC4vEJ2h62NytzYQXKE0o4MvB2jpN74S05kHRLMg@mail.gmail.com>
 <DB8PR04MB717745592F89F86226B7E73787612@DB8PR04MB7177.eurprd04.prod.outlook.com>
In-Reply-To: <DB8PR04MB717745592F89F86226B7E73787612@DB8PR04MB7177.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Oct 2026 13:00:01 +0000
X-Gm-Features: AclHuK8j9g65b9owMZgmgPDYCSsnbD20pc0CVEqCxO9FIsvmfVzCKHg4vIIP9ko
Message-ID: <CAFEAcA_z5n9obipm=jOieJD0VoSJOTN1MVpRdtHgEDDfq5SfUg@mail.gmail.com>
Subject: Re: [EXT] Re: [RFC] target/arm: Correct MPIDR.MT handling for i.MX95
 Cortex-A55 Aff1 topology
To: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Cc: QEMU <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 26 Oct 2026 at 12:29, Gaurav Sharma <gaurav.sharma_7@nxp.com> wrote:

> > > This is OP-TEE's generic implementation rather than i.MX-specific
> > > code. The implementation is appropriate for the conventional layouts
> > > it
> > > supports:
> > >
> > >   MT=0: Aff0=core, Aff1=cluster
> > >   MT=1: Aff0=thread, Aff1=core, Aff2=cluster
> > >
> > > Therefore, I think the problem is not limited specifically to i.MX95. Another
> > platform could encounter the same issue if QEMU presents a core ID in Aff1
> > with Aff0 fixed at zero while leaving MT clear, and the guest uses the generic
> > OP-TEE core-position implementation.
> >
> > But shouldn't QEMU's Aff0/Aff1 be the MT=0 arrangement? That's how
> > arm_build_mp_affinity() sets them up, for instance.
> >
> > Is your SoC model specifically overriding the default values to something else
> > via the mp-affinity QOM property?
>
> Yes, the i.MX95 model explicitly overrides QEMU's default CPU
> affinities through the mp-affinity QOM property:
>
>   object_property_set_uint(cpuobj, "mp-affinity",
>                            (uint64_t)cpu_index << 8, ...);
>
> This gives CPU0 through CPU5 affinity values 0x000, 0x100, ...,
> 0x500, with the core ID in Aff1 and Aff0 fixed at zero. This matches
> the affinity values in the DTSI. The TF-A
> platform code also derives the A55 core ID directly from Aff1.

Right. I was hoping it might be possible to avoid having to get the MT
bit right by making the affinity values you set on each core match the
MT=0 pattern (as I think we do on other SoC models), but it probably
makes more sense to get QEMU to also handle the MT=1 setup, given
that bit of A55-specific code looking at Aff1.

thanks
-- PMM

