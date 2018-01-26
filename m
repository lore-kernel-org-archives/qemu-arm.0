Received: by 10.28.71.27 with SMTP id u27csp774342wma;
        Fri, 26 Jan 2018 06:36:09 -0800 (PST)
X-Google-Smtp-Source: AH8x224SeAE8UuGF757ki9QtRNHnO21elvCJxYi/kM+O90tJ8Uv9yQsDGml47fVPiTnA40tmGis8
X-Received: by 10.13.225.17 with SMTP id k17mr11358219ywe.61.1516977369010;
        Fri, 26 Jan 2018 06:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516977369; cv=none;
        d=google.com; s=arc-20160816;
        b=hoZHBsEAjPk3r3SUNFimNfCuFsA+/hoFXcDZsGPe13zu3MZAoFxXYOQNnpaab4nfFf
         8FA5V5khPh23fOq/03OhRFxn9G4exfnzzkFKcT6FV3P9bvsbylmSRHiDAhqtooaRrUpN
         ApN2Ax+vZPmfTPNrdoOzZ42gIg5j/53TWMeLBvu0+Lx9UqLnhtkL1K5xuSUmu5R+XDz/
         NAInokgxSF4xp8wRm6PkfURVj0SOV57ra7dSFD7Mm441X9TpXzY+PrKKuQulu2HOSpdA
         XvnsAZsumsP9l7D4lrU0TjAsSS/jXuef+bvyFYNeoOi42v3F8wxtHDq4bGStfYBCz57x
         EuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sjC8ZSxhWmYLsDVp8f+V8Zhg97bqXY+L7caPx7kU34Y=;
        b=vdSGiXvOF24cKYfl6utAK7d1KPiSCwjSyXVcOLkYX6+TA+IPrRVeBoLkUeG1fIFqHt
         Ue/nHkzx/LtzW93g39k8X1RdrqnZ5RmSBrLiqc3oOUfegGx5ABgEWnWbaqptmKehal8+
         zeRj5zjYkuhsMepmjWusNUfApOo8NPdlYB6pb76S4+If5mg6Ghhlyxjq0eCeVegnmn7c
         V7D+KFAs8ZsZfGhGAwY5AkZJpqKsD4vqVDB1mx43oiZcKnDzvZTuJuURio4npVPchKSG
         BKmktVgPXC5foBlCsOWMUQWeZQpSUAXwQ5v7+xHiDsrlPFFrEsFtDq6OqbGdBO3UOr+z
         c7lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6rkU56w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si921819ywh.533.2018.01.26.06.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 06:36:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6rkU56w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef56u-0003q3-FZ
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 09:36:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef56e-0003lR-0S
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef56c-000569-W6
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:35:52 -0500
Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e]:41628)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef56c-00055k-Rk
	for qemu-arm@nongnu.org; Fri, 26 Jan 2018 09:35:50 -0500
Received: by mail-ot0-x22e.google.com with SMTP id 44so558503otk.8
	for <qemu-arm@nongnu.org>; Fri, 26 Jan 2018 06:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sjC8ZSxhWmYLsDVp8f+V8Zhg97bqXY+L7caPx7kU34Y=;
	b=h6rkU56wSdlex1ROv1ejE5NQEkOBIFV3sFI2hFwzgJWzj5XWMBxmzc1G4V7qyYTPHj
	ZKotmtmIgeLNn6oIkjiNn4jIai222p2vltlKpbwmrJ8KRGnBorqQP+F5T19TquWSBej8
	xXXHyKMyJbRpkQjjRZv4l0CvHE+rrE+irygU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sjC8ZSxhWmYLsDVp8f+V8Zhg97bqXY+L7caPx7kU34Y=;
	b=YbZz4RPgp5268kr/M9UlSelUynJiWLZh5X+9ilECS4VaP06+QqkcP66EKN6iz/tViQ
	BQxfLlwr3dA2A8A0tyB5fLkbcO3Du9u5JYogNysV3L0HoR3YOR2XKR4IHFQVZzSjoeg2
	xVh457zAy3mrUNFlSsjNNU8Cerz3BSg589OBDRYihciA9HXfGv8RGJISTx9GpFPDrpw9
	Kijn1NRrust45BoYE31ibOyVFkQQ2RoDgMY6Z1VyB819tZrG5OQk7B98J3sJEHpiiykX
	fJ9VMjonxLzNDfobUdGgjtbscnqvtKQBFWfpCfywECAyVG30P3qm26uGymNNx1n5STE9
	SV2g==
X-Gm-Message-State: AKwxytfPjp4B52gopwZ9OEdXT1Ue4qC5srWTJwkZJB/QTI7m5Kl0CyTW
	4jknWXq85nfIp61lJB05Pb2729gbihZTquptx1ZFDZ1X
X-Received: by 10.157.29.130 with SMTP id y2mr12790470otd.335.1516961254920;
	Fri, 26 Jan 2018 02:07:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 02:07:14 -0800 (PST)
In-Reply-To: <707306d7-8ee4-ab6b-2154-290647a72779@linaro.org>
References: <20171218172425.18200-1-richard.henderson@linaro.org>
	<20171218172425.18200-10-richard.henderson@linaro.org>
	<CAFEAcA9Dmdh+u7AZHhjEkS3zc6i4yf+Eo1-NuksgVdo1cqmKFQ@mail.gmail.com>
	<707306d7-8ee4-ab6b-2154-290647a72779@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 10:07:14 +0000
Message-ID: <CAFEAcA9PGHMPeATRHESeUEWaU17OpVw99p-+U9KzOPaitSgEGQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22e
Subject: Re: [Qemu-arm] [PATCH v2 09/11] target/arm: Decode aa64 armv8.3
 fcmla
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
X-TUID: QmHnZ1782Fzn

On 26 January 2018 at 07:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 01/15/2018 10:18 AM, Peter Maydell wrote:
>>> +void HELPER(gvec_fcmlah)(void *vd, void *vn, void *vm,
>>> +                         void *vfpst, uint32_t desc)
>>> +{
>>> +    uintptr_t opr_sz = simd_oprsz(desc);
>>> +    float16 *d = vd;
>>> +    float16 *n = vn;
>>> +    float16 *m = vm;
>>> +    float_status *fpst = vfpst;
>>> +    intptr_t flip = extract32(desc, SIMD_DATA_SHIFT, 1);
>>> +    uint32_t neg_imag = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
>>> +    uint32_t neg_real = flip ^ neg_imag;
>>> +    uintptr_t i;
>>> +
>>> +    neg_real <<= 15;
>>> +    neg_imag <<= 15;
>>> +
>>> +    for (i = 0; i < opr_sz / 2; i += 2) {
>>> +        float16 e0 = n[H2(i + flip)];
>>> +        float16 e1 = m[H2(i + flip)] ^ neg_real;
>>> +        float16 e2 = e0;
>>> +        float16 e3 = m[H2(i + 1 - flip)] ^ neg_imag;
>>
>> This is again rather confusing to compare against the pseudocode.
>> What order are your e0/e1/e2/e3 compared to the pseudocode's
>> element1/element2/element3/element4 ?
>
> The SVE pseudocode for the same operation is clearer than that in the main ARM
> ARM, and is nearer to what I used:
>
>   for e = 0 to elements-1
>     if ElemP[mask, e, esize] == '1' then
>         pair = e - (e MOD 2);  // index of first element in pair
>         addend = Elem[result, e, esize];
>         if IsEven(e) then  // real part
>             // realD = realA [+-] flip ? (imagN * imagM) : (realN * realM)
>             element1 = Elem[operand1, pair + flip, esize];
>             element2 = Elem[operand2, pair + flip, esize];
>             if neg_real then element2 = FPNeg(element2);
>         else  // imaginary part
>             // imagD = imagA [+-] flip ? (imagN * realM) : (realN * imagM)
>             element1 = Elem[operand1, pair + flip, esize];
>             element2 = Elem[operand2, pair + (1 - flip), esize];
>             if neg_imag then element2 = FPNeg(element2);
>         Elem[result, e, esize] = FPMulAdd(addend, element1, element2, FPCR);
>
> In my version, e0/e1 are element1/element2 (real) and e2/e3 are
> element1/element2 (imag).

Thanks. Could we use the same indexing (1/2/3/4) as the final Arm ARM
pseudocode?

thanks
-- PMM
