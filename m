Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1215538ejm;
        Fri, 22 Sep 2023 03:54:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz2Tq+TFknUj+kzDyeFA/ltzgqQqxD9ql7pL+mk9FmLypraqm3fNq+oL47Nmh8prr7JK6P
X-Received: by 2002:a05:620a:2ae4:b0:774:108a:b537 with SMTP id bn36-20020a05620a2ae400b00774108ab537mr3189694qkb.42.1695380092425;
        Fri, 22 Sep 2023 03:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695380092; cv=none;
        d=google.com; s=arc-20160816;
        b=CaGYtF0yDRtUuGLY8UQYdHuPUxmZ9RepVjaJpDRRgbId+GyMqjqVHmQN5IMvE12CPW
         pG1qjNyCy8D/r/NIsqNHWirvKpu8t++OdhCGADb1TuH/KYv51WWm80CAkJ4gtL0Cr2el
         7/BXFUv1kiYRuwBAZw0ReSnVULimfX3jwl60vu5Iv2oQNWBqJDiUQfWK5tfZtxmobj+u
         8KpgiOJtTUEF/WEFaVkvY29OsGQ+E4p+mkKirAlxmyNLEsUTdBLbHg3Ei6yGwnXj6A4m
         erAJxeXWOubX8D4r3jh3t7U6vbW1FFHxB+MdeFwm0eTHHKOXIO2yogANPgrv+E2AZZOG
         b6Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oaPQ7MmR1Vr1ITNRNCWHhJqSeR8sTNfTIlLBgvGcm1Y=;
        fh=i4ZT/wR0/sRpKOIoafg0efYWsEoWbV0BE3/AvxbFDwg=;
        b=rX7cgGnJ2d4e0I3udS+EbQr3XeyNLekOkQ+MatY9BZy2tBcA7PiXqq9hkocUfr7Pkr
         8T5M9O7WPGCwAQzkrDvv307XpjxODkfeeN3iEJJ0KlhhFlgW045iV6h4wXt8wLjqTIJE
         HBlgmlHqePjDFrK+hugV91RFVBuI7ENekCMDrBhHO//U62+lI/EuhXFMJcze/y6Idm8f
         r0kuSdshY1Ykdf5620dA8adNua1f7D1FFCO/W+grA2HF/6GERi6NJQBpgdPmoUyxDn/Q
         hrQezM5ntAL4z9QCLx51WP+wK4eGvYEsBvv8LhwWIQC5hHb7EjMne16YkMdDMAEj0gzo
         7bkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/9Ia5jt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qr20-20020a05620a391400b00768215851bdsi2120672qkn.329.2023.09.22.03.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 03:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="I/9Ia5jt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjdns-0008HJ-8z; Fri, 22 Sep 2023 06:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qjdnr-0008HA-L4
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:54:31 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qjdnq-0005Ew-5L
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:54:31 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-502e6d632b6so3181798e87.0
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695380068; x=1695984868; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oaPQ7MmR1Vr1ITNRNCWHhJqSeR8sTNfTIlLBgvGcm1Y=;
 b=I/9Ia5jtvMZJtFIZMNehFHj4UGbY4zm21OwyTsi/pGKikiO4QmJ1WNs434Kc6XwsYw
 BFI7OWt0x2+HkJTKayYXbAb+lFCVh6/mJWSbNiDEXYfLoNjbDMBifFaMJ7oayHomN0jF
 QJ87zi0+OIEQgoNB54B3YiV6KOer3C7SvQQp8Dh8zkgU7nDq2eZr7Gq2H99JUsx5TCZk
 Ja2dhySlL6R3ggJhDXJ/ITsXTXb5FVBJfJ3sGBfmYVDmr44ovw19BWPIxzR0c/6fbFy/
 5NR+vXxZ82PodPfDMNstVhAz42h20Z0GI9jvBlzL4nPakKz87NPxLg5dmhT2Cne5FHHO
 wXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695380068; x=1695984868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oaPQ7MmR1Vr1ITNRNCWHhJqSeR8sTNfTIlLBgvGcm1Y=;
 b=SinEVMWio8F2gP3JDUalQd1M9OZM/TIth14VhfuL/Iy0EzY5sFqWJzMde3WfU5Dkd/
 c5ENCep7/z8rhAMyHIQ9UFgnI/9fWPwljgBpeRnPRISanYN200OWFjkkGB0Kgz8NLlLU
 rc+UqzALcyGh+CPVwU6GmthERMkEDYWjy/xPP/Mj5gPh/ZhsylN+rkD8fMyMPoUlPZiq
 Tpkxb1BFP3aRVqvQ5m3z9czMVIHWgfa9BGKi7WA5mhdaROkRzqTSNoqNfjufbCFT5nSa
 Y8zKxUKHA5kkq4n2/wAdNSprHn2ZbXjQBXXDnnZPeyc2fLHQ3Q62ZSu/Wv2TSsi23IIa
 tvwg==
X-Gm-Message-State: AOJu0Yxyom8fp4LffLGKol60do+uxjSWDFxIbGY2MnNvXAAO+S25CXRg
 lKPmjkwQbTO3zBDh8iKIMD6MDrfLXi4sdDg8vMITUtpWTCOiFuI271k=
X-Received: by 2002:a05:6512:3a8e:b0:4fe:1681:9377 with SMTP id
 q14-20020a0565123a8e00b004fe16819377mr9006904lfu.44.1695380066321; Fri, 22
 Sep 2023 03:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
 <20230914145705.1648377-4-peter.maydell@linaro.org>
 <ZQ1tvgUOLga21EkF@google.com>
In-Reply-To: <ZQ1tvgUOLga21EkF@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2023 11:54:06 +0100
Message-ID: <CAFEAcA-uXuU9KGjwrMnppkpnED1XHTsWrz=0gSYvjfFNNpf1eg@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x134.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9ISZbTnMIBBF

On Fri, 22 Sept 2023 at 11:34, Mostafa Saleh <smostafa@google.com> wrote:
>
> Hi Peter,
>
> On Thu, Sep 14, 2023 at 03:57:05PM +0100, Peter Maydell wrote:
> > The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
> > supported, so we should theoretically have implemented it as part of
> > the recent S2P work.  Fortunately, for us the implementation is a
> > no-op.
> >
> > This feature is about interpretation of the stage 2 page table
> > descriptor XN bits, which control execute permissions.
> >
> > For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
> > IOMMUAccessFlags) only indicate read and write; we do not distinguish
> > data reads from instruction reads outside the CPU proper.  In the
> > SMMU architecture's terms, our interconnect between the client device
> > and the SMMU doesn't have the ability to convey the INST attribute,
> > and we therefore use the default value of "data" for this attribute.
> >
> > We also do not support the bits in the Stream Table Entry that can
> > override the on-the-bus transaction attribute permissions (we do not
> > set SMMU_IDR1.ATTR_PERMS_OVR=1).
> >
> > These two things together mean that for our implementation, it never
> > has to deal with transactions with the INST attribute, and so it can
> > correctly ignore the XN bits entirely.  So we already implement
> > FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
> > that we need to.
> >
> > Advertise the presence of the feature in SMMU_IDR3.XNX.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/smmuv3.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > index 94d388fc950..d9e639f7c41 100644
> > --- a/hw/arm/smmuv3.c
> > +++ b/hw/arm/smmuv3.c
> > @@ -279,6 +279,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
> >
> >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> > +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> May be this can be guarded when S2P is present? according the UM
> "In SMMUv3.1 and later, support for this feature is mandatory when
> stage 2 is supported, that is when SMMU_IDR0.S2P == 1."
> So I am not sure what it would mean for XNX and S1P only.

Mmm, I don't suppose it would confuse any guest code, but
it's probably safest to put in the if():

   if (FIELD_EX32(s->idr[0], IDR0, S2P) {
       /* XNX is a stage-2-specific feature */
       s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
   }

thanks
-- PMM
