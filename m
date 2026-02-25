Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63538FCEE92
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 11:51:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvDPu-0004Ks-Du; Wed, 25 Feb 2026 06:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvDPp-0004FX-EQ
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 06:50:54 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvDPn-0001bs-Uv
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 06:50:53 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-64ca09f2056so1294094d50.2
 for <qemu-arm@nongnu.org>; Wed, 25 Feb 2026 03:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772020248; cv=none;
 d=google.com; s=arc-20240605;
 b=KdLMbzjrlyAB7UVO1akxY/zFpOZeLBkorxTdqfbYkK51hmOeGSlB8dlRdRPkVZWu9X
 vA6ENZKE6Dz0RUYrH5vHtOfFfFH6poneZzZS3Oswu1a0jqEfZXlCJwv1p932thmAaI+6
 a15IDmrsahyEMQbVVBreeLD8xF7qTBHHvA6dYM5P8AmSzqD0qZ4WFkKqnghkC7Qjbl9Y
 HoVNq9OIofaut0ZnqUfxDeF+V/R5KhXqAmywWTnpVt6SD2bjBaWmZdEbrGtLA5LnoluN
 oi13AVZux7KkuQmabVRLgoBn+JFkKR7l8lH6mrIUSNQS/HGKN/oznev2mnSEyprQXz3b
 n9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8/XNbwJeKQIwo7t1QhyL97lwvQNgw7U+AJxYLlMiTZ4=;
 fh=+7uKU/fEDqXO2EIjQQqoBjQFbJ3p9/KmT37IFDTONbU=;
 b=ldU1pQ6RrRHOMEHYI7gS20le8yWRfSRkNxcSf1SZQ0ebg9AfDJAI5iv4NT96ixXxl4
 dAJfdUaeZCS+BB22NNinj61fbENkLj/1612mUVNjnpKjCQrw/izDbLDEde9v/mgCUUx0
 yIuZhOT0tcXIK6QhWkeFEx4JYOriZ6AJofdwLbZnOG4OVpKDyLd/90dLCMsA3NyoyXfh
 00cNqoQ6rDgM9u1coN2kulodaZ6D8EBDpwjGEfFjkZ9bQLbdcMHR7sZol19Dhe7ZOsEm
 7xluUWB66H++5n/mGUgrnttHNZOKvlCBg4PmdAs6qzK2k4JuowxxeBGtZmEnY52F426h
 uzOQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772020248; x=1772625048; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8/XNbwJeKQIwo7t1QhyL97lwvQNgw7U+AJxYLlMiTZ4=;
 b=d9KIQ2rUWorIuNAppVdokwj0cHPaWY3yKbTGYR7MJWQSWlSTpy+T7ygWEUbbqd8tI0
 Ice1L5+PH0r6XZj4G4Mm9voq+szwCzChkLTdnnq9vLzLJGipzxfFc1pGyGMeQUrXcVcf
 gZUTb0jGKI2uS+6+JSkeZniqZz8R+6aCjyzEGF8IwapyB6wcR0CD/Tki8s+PerwSpNVJ
 cC2mmca8DZ3EYl98hv2Gum9zTK0QzA1ca/rxv5ilGEBUv51dQODZ/Ks+VhD7DfIAHUIX
 AsPisDbj8pQM8ce1oescYgOSSmetW/wnNwqCEBGIF3Tw1iPgP3waihWc+TCT9v7i5fv/
 UTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772020248; x=1772625048;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8/XNbwJeKQIwo7t1QhyL97lwvQNgw7U+AJxYLlMiTZ4=;
 b=j6+D8jCxBy1WytPMY9lYTPfTL33cG+mwY+Kq+HQ3vYq5mwUdDTVhy25h2CGTTZflU/
 jmiQxgU4oFTSbsxeCcJMV5AgKZitm5qPYfmyXt6dWtR5i/SsJDiPgipVrINcm78dcA2b
 i6dUCQDQvGFn2QfWUbYNIJggGqsxQ2uEHwiapoi+QTht9CM8vSuxCE/RvmxnWrpF/2m/
 WqPex6hqbYceuP+iV3Ut5sf9JY9aoqN9T2uM0EfInbfv8Oofuzm0XsUekXEDBadnMfmd
 xbTh+aCk48Mr/ZIdonxlbl8mzNxzatJwaWCd1IgsGpZxLxyAYm6rbL3i5JaqtKh7KZ2+
 EB6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9H30P6CGYPqsDS6A8r/8IyZRtMoRu5nt96DD7Sdv3J3FGHTr9u7E+9XJEk7JVLJCpwkoszYSF1A==@nongnu.org
X-Gm-Message-State: AOJu0YwH5LnCYbKFpezOp+dRLdAbT8t53R+wk9zgd4//5f/zL0iqMi24
 4aJdIGsqrYTsdFX7RxpKGC7uXsHTTkwKr5NjN9YF0JPcBiG1rFl8+QvlsDxfk/sTpDUSmO3eydi
 mtJgarcrOB+9Mmp5BR2FuNljOa7XeTCz56u3jrfyIMQ==
X-Gm-Gg: ATEYQzwxaI42fs1PntNyKvPNk+pk+Pc9/jrZtq9ag8UGCOKIIVtWaI9IAgkDDIBBCsr
 f+RgrBHQn9qWKVkTTmtUvdd0KtDU6jM2OQj3BL+3MqZdJWe3UIHY4GJWsXm0zIUgwSTveCG21yW
 Nt48WLX9nl4ckmctxnGnjBLXm4jjkzmUZNMOLP50I6dN4E+9iZ89jdNAK0Sfiv3k1fWz+dsoXBl
 3x/JReVJrc5yWWqXaLG2djz/xTZZf3c6cq2ilBVzFPMhiMYkpDbWRjGbprnOE/IkvncTdt1KdOU
 b2XQKTqxclMIG8vB+l8+jrctL3JeBrOhACAtVl8ED0VnaiQ8Japb1KYs5nZFU+ylcAg=
X-Received: by 2002:a53:d014:0:b0:649:45c2:6d62 with SMTP id
 956f58d0204a3-64c787d512fmr11859925d50.5.1772020248437; Wed, 25 Feb 2026
 03:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20260224121014.279248-1-alex.bennee@linaro.org>
 <20260224121014.279248-6-alex.bennee@linaro.org>
 <CAFEAcA--YmCZ2+BBy1kM_VjeER4vbX8VMBbSA1aqUQ9-jWp5tQ@mail.gmail.com>
 <87pl5t130f.fsf@draig.linaro.org>
In-Reply-To: <87pl5t130f.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Feb 2026 11:50:37 +0000
X-Gm-Features: AaiRm53GhKc5smmSp8HXA-t5xPP_5ljN99Y8dDIIxoq5Itzm3qbAcj3pVShiRnA
Message-ID: <CAFEAcA9fg-yikxCoX5HWHh77Sk_5APXAgNrwZWPQMRQFLad6-Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] target/arm: extend WFX support for A-profile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Wed, 25 Feb 2026 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Also, this doesn't change any of the places that it needs to
> > change to implement the places that architecturally set the
> > event register (see R_XRZRK in the Arm ARM),
>
> I was having trouble finding that but searching for just XRZRK finds the
> subscript text:
>
>   The Event Register for a PE is set by any of the following:
>     - A Send Event instruction, SEV, executed by any PE in the system.
>     - A Send Event Local instruction, SEVL, executed by the PE
>     - An exception return.
>
> These seem easy enough
>
>     - The clearing of the global monitor for the PE
>
> Is this the LSTREX monitor?

Yes (see Arm ARM section B2.12.2). Note that as "global" implies,
this is cross-CPU, not just internal to this one.

>   - An event from a Generic Timer event stream, see Event streams.
>
> So this looks like sub-timer events that trigger events but aren't timer
> expiry events? I shall have a look to see if the kernel uses this.

It will both use it internally and also exposes it to userspace
(in the sense of providing a hwcap that says "we generate an
event stream so you can rely on WFE waking up after a while").
The kernel config symbol is ARM_ARCH_TIMER_EVTSTREAM.
For internal use, see for instance arch/arm64/lib/delay.c :
if the CPU has event streams but not WFIT/WFET then it will
use the event stream to implement the delay.

>   - An event sent by some IMPLEMENTATION DEFINED mechanism.
>
> I assume we don't need to care about IMPDEF cases for our current CPU mod=
els?

Yes, we don't need to worry about this part.

-- PMM

