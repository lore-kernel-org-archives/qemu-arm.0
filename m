Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4039275ejb;
        Tue, 21 Mar 2023 06:06:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set/xxtElSLG6QfBgmJcvDKWgKqGeFspEpax7WV06sA3jGwdzhz5dRTUd8pGgXbDg1ax5tOOl
X-Received: by 2002:a2e:9396:0:b0:28f:8fa4:7c25 with SMTP id g22-20020a2e9396000000b0028f8fa47c25mr914333ljh.25.1679403998098;
        Tue, 21 Mar 2023 06:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679403998; cv=none;
        d=google.com; s=arc-20160816;
        b=fYb17EB8jU+6PKT3gfmQ3eShpb/d2zj0340n+5iHbrI7AbNq1kKSurmkK6Lrs2vJGj
         AKRXM9U0sfmtHNx9fuze1u+wRuAbN1Ta9nYW2/X+Dokdyr/dKZwuBtLz/KK96HkeRYCv
         KU488KD7f533ya+0gYuXfW7JxS1ZKsoCiwGaLdKmqQMvq9UQwDn3URxOZAi/dIVbpu5w
         v5PShSMx+M5ifY8tkjYw+xBRvWT076BcYp9M1eXA2jPvZdX5Q1fbE86P3cJw44jHixWk
         +ebHEOvdx5Pefx0do4Zi0a7l5AAZNOyOFK95NkEEIoofdhDAPcTJiq18tAsUnv/PYgvQ
         XQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=qkXrBRaTmEpyrQrjI+sGA6vdPgiu8xxEwZJ3Y82fQ34=;
        b=HZ3y2THNDlk/zBijAygk0qZVerQzLmmxeUxpxrd878FLUvBpVsYUDn3fg8arsVZppv
         u2rF/W8yBusXYLeY9O+r0ixsSxxKbtTUBxXArkuIKPZx/S9R+MLE8TfTfGxzNk2Syps6
         5MV38FGugZE4idGhGhggEyjosw7Sulzuk4hzAhMyfStgbDi+Qk0GxINf39NC1MOTIYFV
         dr8ADIFP2YRlZN7guOofE1LjKClRuWoyCI4nHeqVcZ00IKZtQNkLIuenHukX+OzY3olu
         y9IeiXJ37dvZtKYljAWwxepaM236U2Eh+DnrJp3TXutZoFaGMOk6L5wqPJ/f98yJIJhA
         os5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=efTE+oXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a2e8550000000b00295a8380eeasi5569228ljj.205.2023.03.21.06.06.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 06:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=efTE+oXK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pebgy-0003i9-KZ; Tue, 21 Mar 2023 09:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pebgp-0003gJ-EC
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:06:12 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pebgn-00065O-7S
 for qemu-arm@nongnu.org; Tue, 21 Mar 2023 09:06:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3ec1e8c4cacso18415e9.1
 for <qemu-arm@nongnu.org>; Tue, 21 Mar 2023 06:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679403967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qkXrBRaTmEpyrQrjI+sGA6vdPgiu8xxEwZJ3Y82fQ34=;
 b=efTE+oXKuNEnOYkrjCHXCLS8eY3dIFMLXHtlfC6Qoo52SATmYBL6ks5i89wMqxnQke
 oMSa5U4T7b+2LAEMv55bZLZS1r/h1UlQ2KF2loVnPsZUZSWHX05J5CD/sxKIBY3JQoh4
 s4+bTDK9wgibjUhPDnta6nZK+XGvTyChE/x1tRTRK1A8UI1v+PhVuaHOY94ZkB7ZTo2O
 L453Wbw2CO1cnJ10sACEp4vN6lWGT2OKikepndTlauIM2pqmxvpinAkekUA/tVIcpQLx
 oXhQ2uqoQ8SE1LP6yTAUzkXg40gT9eXqJJrFXYLtm/3/LKorVwwdnpOQMo6XhC3o/MP2
 tA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679403967;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkXrBRaTmEpyrQrjI+sGA6vdPgiu8xxEwZJ3Y82fQ34=;
 b=WCq2+20g98Lmk0XpKffi15MpJ8jP/He8H04rRBGPkV4rO+M8lriAP+mU1S+ckhPnta
 qydyK7/h7UC/GP44jBtSFA0zHXKymnOHDuNcT4Ojd1u5da9tRCsXlrivk74ekwurJDb1
 rKHbTNFS+mqq/gMm3so873E3om0Hkt7riXci/FdlVW8YSwA388YQXpHTQ/CDdtSM1+32
 9owrP0t60LokxnheDB1J28pxkk2PAbK8fEW8rQTZ8JoE6aD4T2UX214+UROT0pIlR5ks
 kpQXn1UHvX+Rv7JQqidd7B28eun9UK3fJI3l/I4GxxGfQfy2bmpM55C1BC6kl0uuCMzQ
 LV1g==
X-Gm-Message-State: AO0yUKVK4ljRvBkuofaQ52XsqWFGd/zFxHFPMLsVYdfRAQ+hVQsEejFd
 EUElXqaLzmos5a6udGA+TBXNgQ==
X-Received: by 2002:a05:600c:4685:b0:3ee:eb4:b45f with SMTP id
 p5-20020a05600c468500b003ee0eb4b45fmr182422wmo.6.1679403967199; 
 Tue, 21 Mar 2023 06:06:07 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 g18-20020adffc92000000b002cdbb26bb48sm11321612wrr.33.2023.03.21.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 06:06:06 -0700 (PDT)
Date: Tue, 21 Mar 2023 13:06:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 10/11] hw/arm/smmuv3: Populate OAS based on CPU
 PARANGE
Message-ID: <ZBmruj7OME3Pfbh1@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-11-smostafa@google.com>
 <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e6810c3-c01a-5a2f-4fed-64c9391e22ba@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=smostafa@google.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: ysoUpgtxFh2I

Hi Eric,

> > +     * According to 6.3.6 SMMU_IDR5, OAS must match the system physical address
> > +     * size.
> > +     */
> > +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> > +    uint8_t oas = FIELD_EX64(armcpu->isar.id_aa64mmfr0, ID_AA64MMFR0, PARANGE);
> is this working in accelerated mode?
I didn't try with accel, I will give it a try, but from what I see, that
ARM_CPU() is used to get the CPU in traget/arm/kvm.c which is used from
accel/kvm-all.c, so it seems this would work for accelerated mode.

> > +
> >      /**
> >       * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
> >       *       multi-level stream table
> > @@ -265,7 +272,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN16K, 1);
> >      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
> > -    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
> > +    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, oas);
> I am not sure you can change that easily. In case of migration this is
> going to change the behavior of the device, no?

I see IDR registers are not migrated. I guess we can add them in a
subsection and if they were not passed (old instances) we set OAS to
44.
Maybe this should be another change outside of this series.

Thanks,
Mostafa
