Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4090711ejb;
        Tue, 21 Mar 2023 06:55:24 -0700 (PDT)
X-Google-Smtp-Source: AK7set85OMvnuM63RhyUCIjMm0AguFn0PUU1dJ93X54lyY4IlksWsZShPEaleb5tZvUDeE6EDCnS
X-Received: by 2002:a05:6214:20ad:b0:5c7:fe3f:e33 with SMTP id 13-20020a05621420ad00b005c7fe3f0e33mr3076135qvd.23.1679406924558;
        Tue, 21 Mar 2023 06:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679406924; cv=none;
        d=google.com; s=arc-20160816;
        b=cSgU6reJ0ItD3+0Dcv9nGRxbBQUywT6RpQzLYBhzpKzQpdQqrr8ho/V9zzFQq2uHbY
         w4qDpwpbLSh+ZHvY0puZDOkFiJQgj/4FfPu8a6E3gBLM+Q9MGutVcmzMJ6Wvj0KIdVtu
         OWQol/sXemNCwPE5xTbrur4ICxaaKv/BJSNZDfJaGlEEReZHbjNlIsLHmFQvrMc3NKm8
         G1LvSjcxctL6lq6GFjpt0azOmKmM4Akb8TCP1Z2syESGd4KLL78/vZv5w0Odx1vhp9/R
         lPod35C7icDnVrXaubgHaoj1k8f69gxlZjaiQa8NCAIKSFPlHWnghcfAuxRL4QrjT1nq
         9JcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ChDSX/xieTqXHkr2n2LuVn1Gf13gDU4lZynnBv9cIZY=;
        b=LS7u9oRbBQgryym6cHCVQ2ba4mBiUcPD55jc6oFXi41RYh/cekj0wwhStPvlDMrSEZ
         esiWcqiYIgHPVB16pjKsUOnZgPRWrrLhALB6U3uvXXQ6RgEVVYU19MDj+qzzWJt/5VXQ
         5tWYdY2+s6engvAy3nAiLX+rx/fTggmuzIafkdVX2oiEs/yL4j0DJfxI2Lrhlnv635og
         l58e+LhfUKWfeTSuF+XW/WHb1obArCcekV1p3vVv5pyyyqt5yiyQ9q//qjs62Ue2qCKD
         Pcod416TouiPfDzhEs5A+2PAs4j/FOH9uO7SByNxKf9vBQILyEaVEivOMZG/Ma60B6eF
         Nscw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kiuq4UXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05620a24d300b007468a4b0607si3908132qkn.2.2023.03.21.06.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 06:55:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=kiuq4UXz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pecSG-0001dn-UZ; Tue, 21 Mar 2023 09:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pecSB-0001cv-SP
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:55:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pecSA-0004tW-0P
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:55:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3ec1e8c4cacso20295e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679406904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ChDSX/xieTqXHkr2n2LuVn1Gf13gDU4lZynnBv9cIZY=;
 b=kiuq4UXzai/NUjBE0vdCAStTCnT7fqhWEH93skgoiVNARVTiPoFsi3nP+g0z8nIqfc
 0qUhxtTf/bXm7M5yvpoGbyXtbKT0+HlJIA/ZGMOIQkBrkl0XVerWY/5D1xEbBxgkm3/u
 JiJKT0J8DpkDkDD8dKYMeEw2NnV5Ys6ZXGtXzkGFK9UuiXGMSCZVMrGj6Xb6IcNCh5h3
 HNNx8PYzi4HYtF39zMRDJREjknYAYAlnB2SkZaSQNMjTwskOH+e7VFG2+AerXhoROIE3
 a9EGb8o9FWFsLYUB6rYIykRaRuKhqay5/c9fryqHT2Y0Jtls2Aedl3oAkV58Qj8scJaJ
 UCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679406904;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ChDSX/xieTqXHkr2n2LuVn1Gf13gDU4lZynnBv9cIZY=;
 b=xbKlPqbnZVdLFEnRf6Ho/gyTS99rd3QjQK7Zp3DF/VuPK42eZ87WRVBNCjA+NGJkWH
 W9V+uIv84rZRsDc2NL/75d5U+OoLF0PFjVUGxO/u4qumr0WhCM/mBW63RQDrHp0zbGCs
 Mxn+D2MdiszZIy9GhfG9soBE9S6Uj/PqE/Z2E28s1OnSTJG0HngzmpV4WSl1ymmC9FW5
 eTx/s25SYgzx4d9kGOtJ7BCv1P4f7XWzPRZqKHXYsXh90zsz2tIgzhrgzREehyWNsqUW
 26CnHxgfBQvBjieoi6GHzqL++aC3mw1KLZ42fEbYJ7HT6vwbTJOrvcpEAgdymGEVcWlW
 sVZQ==
X-Gm-Message-State: AO0yUKVQYoqf2AEpGrMlnzxbCqyTyK5pobd3IPjeNM1vltKUGMIWnvZI
 iHd14iym41b3qRIZCvCYnW5WhQ==
X-Received: by 2002:a05:600c:4745:b0:3df:f3cb:e8ce with SMTP id
 w5-20020a05600c474500b003dff3cbe8cemr144780wmo.7.1679406904011; 
 Tue, 21 Mar 2023 06:55:04 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 f26-20020a7bc8da000000b003ed2d7f9135sm13474417wml.45.2023.03.21.06.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:55:03 -0700 (PDT)
Date: Tue, 21 Mar 2023 13:54:59 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, jean-philippe@linaro.org,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Message-ID: <ZBm3M7A8nnBweDE3@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
 <ZBmruj7OME3Pfbh1@google.com>
 <d2e9d8d5-1cf6-67fe-e780-41038fcaa376@redhat.com>
 <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_NZiby7=DWaDBu7b5Dbo5sXF9N7T-0_wskZ46FR9Esxw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: fRDwmKQkHHUo

Hi Peter,

On Tue, Mar 21, 2023 at 01:34:55PM +0000, Peter Maydell wrote:
> > >>> +     */
> > >>> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> > >>> +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> > >> is this working in accelerated mode?
> > > I didn't try with accel, I will give it a try, but from what I see, that
> > > ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
> > > accel/kvm-all.c, so it seems this would work for accelerated mode.
> >
> > yeah I ma not familiar enough with that code but it is worth to be checked.
> 
> I'm a bit unsure about fishing around in the CPU ID registers for this.
> That's not what you would do in real hardware, you'd just say "the
> system is supposed to configure the CPU and the SMMU correctly".
> 
> Also, there is no guarantee that CPU 0 is related to this SMMU in
> particular.
Sorry, missed this point in last email.

So, we leave it this way, or there is a better way to discover PARANGE?

Thanks,
Mostafa

