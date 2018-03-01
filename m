Received: by 10.28.91.67 with SMTP id p64csp1972665wmb;
        Thu, 1 Mar 2018 07:37:44 -0800 (PST)
X-Google-Smtp-Source: AG47ELsz2xXpWv6gelfhv1bJH2FRJhLLnKuKPLVtFhyjjY52TwtEwLyeThp/v2paEXgzA+i5Yiz0
X-Received: by 2002:a25:b90f:: with SMTP id x15-v6mr1427383ybj.51.1519918664663;
        Thu, 01 Mar 2018 07:37:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519918664; cv=none;
        d=google.com; s=arc-20160816;
        b=hpMtSeOdZwkd9ryNgFpxrtSHoOngGPGtKZMNWC3quJblhHcyl/iq5OL9XdglWRRORt
         dxF48zNPN1ydfOmcwNhBkKY6UcIFvT9NiCY4i3vqEUdqErdCt339mpIZi/yH5fNjcLJb
         Su+hWvLErmbYXCWDIYcpnha+6GadD5116M1vY8/0IELuHp51rtXwR3hwD3EHCFS8+cmk
         190/Mm8MSGxKlBCdtz2HqPZ5YGpFojwOikRPfPEunCTIGPygvtvHkybotLEVCADHiVZw
         f9vp9+IBX0/uKK3+G5JzuRWam/LUaRs9GvOKO86kdCl7nuvVyXiRhi2T+uEyE4uPfXVt
         MNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=hKGX8ZreocLQaab/pPPz+/wK7XQ9bW/PhiPJ8BFXUQ0=;
        b=CPPkYzS2HbhLcolilb/E+Ntd0W5rum2PNaFZkNGuvb7Bax80NHWQtmEOCKZm09Rz5J
         slZ29HDegISUAQE+ee/kSkMP9XlJ4lLewKdV5Kfg6107sgpo2k+JOWQF3JS1bNv/Loex
         QYuzSjoo/2jaSeqBDHDd+jq8WZzifEhoDiMztqRyrG4xcM6DLAPOIO4byEdgATlHag0i
         YsU1Ysp2C7wFn8vD/fowkXavYajoJXqo6Rhm72n1s9+AuP2/nUKON+llmehFC3FAzULY
         wSnLBA81SdA63ipgq3YvLLlayFE4opk3Ziy//heMw4YknlcrEnbX1BxOOxTtBDPZRFcv
         yMOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwxX3U/d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si703371ywf.328.2018.03.01.07.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 07:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=IwxX3U/d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erQHA-0002iq-3W
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 10:37:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQGv-0002db-TN
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 10:37:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erQGu-0008LM-Oo
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 10:37:29 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34447)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erQGu-0008L3-IW
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 10:37:28 -0500
Received: by mail-oi0-x242.google.com with SMTP id c83so4785626oib.1
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 07:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hKGX8ZreocLQaab/pPPz+/wK7XQ9bW/PhiPJ8BFXUQ0=;
	b=IwxX3U/dlmBA2EXykEtzHTTbbqf7HL1tNifPvqMI5TmRU+/PMKGC8W0gm492VkNhCd
	9NSYfNuCmCVrQyfye23phn9t97GAoTLp0L1+LyNyRL/Dx6pfPHV1LEQfKLS1BUZ75Zl0
	Fiu8Tkr0PmEgNPvHjfsU0X40z9FQlUw8zVWck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hKGX8ZreocLQaab/pPPz+/wK7XQ9bW/PhiPJ8BFXUQ0=;
	b=gf0B+J2gzmc39TN3ja6dVzcEEMhOK2f1UQMqICTP/yazrMEBnUlEpilsXjiIo386vx
	L+RJ3k80VSJlnZqwsBkLH+b2IY9WPwqAk9R2oqvoofExVVqhIuNSSMt+dMhIYs2Uldc3
	x2ZwnGsMb6KisUHVXeqd/L8oOQPs4ITNshw8YSqbYUJHGYhz9gtKztXhCuQY6wSr4cVF
	IzBsvJM+WRrpElthaRZKjqVORGnCoBfTNDnvh4hDOJ+9+N19Z9RpoF/Avcdg+FkHW++K
	Syloy3ZYjSDFF8t8yOzdy+ouLatl2XYXaAuXJ8arKzTAfgpOGE+poYluMUCQU+MbDV4h
	Buxg==
X-Gm-Message-State: AElRT7HmBYCWnZHfZEkLe9LSgCy8w69NA4xPB43F5Pa1b9GAaSfWbCIi
	TZR7DYWveIXNdhizNL3c2/r07m1OXG/gqovglri9QbDM
X-Received: by 10.202.97.87 with SMTP id v84mr1538248oib.12.1519918647732;
	Thu, 01 Mar 2018 07:37:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 07:37:07 -0800 (PST)
In-Reply-To: <CAFEAcA-FOV6JSaZrhD+FZ-T46n_e--suEDbha5EXAEPyW5YAEw@mail.gmail.com>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-13-richard.henderson@linaro.org>
	<CAFEAcA-pUMgUnR0cWd9j7n0EyTeXkMTzhPQU_fqhyaXy1hMfxw@mail.gmail.com>
	<CAFEAcA-FOV6JSaZrhD+FZ-T46n_e--suEDbha5EXAEPyW5YAEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 15:37:07 +0000
Message-ID: <CAFEAcA-Po-HvC9Td64hydu3-ro-ji=DKgtdTmYWreZkoFzuDRw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 12/16] target/arm: Decode
 aa64 armv8.3 fcmla
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 37E8pz0AFBPD

On 1 March 2018 at 15:28, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 March 2018 at 13:33, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 28 February 2018 at 19:31, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>> These don't match up with the element1 ... element4 in the
>> Arm ARM pseudocode. It's e2 and e4 that are always the same,
>> not e1 and e3. Ditto in the other functions.
>
> Specifically I think:
>  this code    pseudocode
>    e1          element2
>    e2          element1
>    e3          element4
>    e4          element2
>
> So if we renumber these to match the pseudocode
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Since this is the only issue in this patchset I propose to squash
in this:

diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index d81eb7730d..ec705cfca5 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -297,13 +297,13 @@ void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
     neg_imag <<= 15;

     for (i = 0; i < opr_sz / 2; i += 2) {
-        float16 e1 = n[H2(i + flip)];
-        float16 e2 = m[H2(i + flip)] ^ neg_real;
-        float16 e3 = e1;
-        float16 e4 = m[H2(i + 1 - flip)] ^ neg_imag;
+        float16 e2 = n[H2(i + flip)];
+        float16 e1 = m[H2(i + flip)] ^ neg_real;
+        float16 e4 = e2;
+        float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;

-        d[H2(i)] = float16_muladd(e1, e2, d[H2(i)], 0, fpst);
-        d[H2(i + 1)] = float16_muladd(e3, e4, d[H2(i + 1)], 0, fpst);
+        d[H2(i)] = float16_muladd(e2, e1, d[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e4, e3, d[H2(i + 1)], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -320,21 +320,21 @@ void HELPER(gvec_fcmlah_idx)(void *vd, void *vn, void *vm,
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     uint32_t neg_real = flip ^ neg_imag;
     uintptr_t i;
-    float16 e2 = m[H2(flip)];
-    float16 e4 = m[H2(1 - flip)];
+    float16 e1 = m[H2(flip)];
+    float16 e3 = m[H2(1 - flip)];

     /* Shift boolean to the sign bit so we can xor to negate.  */
     neg_real <<= 15;
     neg_imag <<= 15;
-    e2 ^= neg_real;
-    e4 ^= neg_imag;
+    e1 ^= neg_real;
+    e3 ^= neg_imag;

     for (i = 0; i < opr_sz / 2; i += 2) {
-        float16 e1 = n[H2(i + flip)];
-        float16 e3 = e1;
+        float16 e2 = n[H2(i + flip)];
+        float16 e4 = e2;

-        d[H2(i)] = float16_muladd(e1, e2, d[H2(i)], 0, fpst);
-        d[H2(i + 1)] = float16_muladd(e3, e4, d[H2(i + 1)], 0, fpst);
+        d[H2(i)] = float16_muladd(e2, e1, d[H2(i)], 0, fpst);
+        d[H2(i + 1)] = float16_muladd(e4, e3, d[H2(i + 1)], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -357,13 +357,13 @@ void HELPER(gvec_fcmlas)(void *vd, void *vn, void *vm,
     neg_imag <<= 31;

     for (i = 0; i < opr_sz / 4; i += 2) {
-        float32 e1 = n[H4(i + flip)];
-        float32 e2 = m[H4(i + flip)] ^ neg_real;
-        float32 e3 = e1;
-        float32 e4 = m[H4(i + 1 - flip)] ^ neg_imag;
+        float32 e2 = n[H4(i + flip)];
+        float32 e1 = m[H4(i + flip)] ^ neg_real;
+        float32 e4 = e2;
+        float32 e3 = m[H4(i + 1 - flip)] ^ neg_imag;

-        d[H4(i)] = float32_muladd(e1, e2, d[H4(i)], 0, fpst);
-        d[H4(i + 1)] = float32_muladd(e3, e4, d[H4(i + 1)], 0, fpst);
+        d[H4(i)] = float32_muladd(e2, e1, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e4, e3, d[H4(i + 1)], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -380,21 +380,21 @@ void HELPER(gvec_fcmlas_idx)(void *vd, void *vn, void *vm,
     uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
     uint32_t neg_real = flip ^ neg_imag;
     uintptr_t i;
-    float32 e2 = m[H4(flip)];
-    float32 e4 = m[H4(1 - flip)];
+    float32 e1 = m[H4(flip)];
+    float32 e3 = m[H4(1 - flip)];

     /* Shift boolean to the sign bit so we can xor to negate.  */
     neg_real <<= 31;
     neg_imag <<= 31;
-    e2 ^= neg_real;
-    e4 ^= neg_imag;
+    e1 ^= neg_real;
+    e3 ^= neg_imag;

     for (i = 0; i < opr_sz / 4; i += 2) {
-        float32 e1 = n[H4(i + flip)];
-        float32 e3 = e1;
+        float32 e2 = n[H4(i + flip)];
+        float32 e4 = e2;

-        d[H4(i)] = float32_muladd(e1, e2, d[H4(i)], 0, fpst);
-        d[H4(i + 1)] = float32_muladd(e3, e4, d[H4(i + 1)], 0, fpst);
+        d[H4(i)] = float32_muladd(e2, e1, d[H4(i)], 0, fpst);
+        d[H4(i + 1)] = float32_muladd(e4, e3, d[H4(i + 1)], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
@@ -417,13 +417,13 @@ void HELPER(gvec_fcmlad)(void *vd, void *vn, void *vm,
     neg_imag <<= 63;

     for (i = 0; i < opr_sz / 8; i += 2) {
-        float64 e1 = n[i + flip];
-        float64 e2 = m[i + flip] ^ neg_real;
-        float64 e3 = e1;
-        float64 e4 = m[i + 1 - flip] ^ neg_imag;
+        float64 e2 = n[i + flip];
+        float64 e1 = m[i + flip] ^ neg_real;
+        float64 e4 = e2;
+        float64 e3 = m[i + 1 - flip] ^ neg_imag;

-        d[i] = float64_muladd(e1, e2, d[i], 0, fpst);
-        d[i + 1] = float64_muladd(e3, e4, d[i + 1], 0, fpst);
+        d[i] = float64_muladd(e2, e1, d[i], 0, fpst);
+        d[i + 1] = float64_muladd(e4, e3, d[i + 1], 0, fpst);
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }

which is a basically mechanical rename, and put it into target-arm.next.

thanks
-- PMM
