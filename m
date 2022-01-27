Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4379103lfk;
        Thu, 27 Jan 2022 13:12:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwuFw6wmMY6WUQ1PGGbsw9J4tajXLjCj2cgseXVciALACVyJDsGokfTgMrc0l6GQ/B0Gzod
X-Received: by 2002:a05:6638:215b:: with SMTP id z27mr2975761jaj.114.1643317970423;
        Thu, 27 Jan 2022 13:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643317970; cv=none;
        d=google.com; s=arc-20160816;
        b=BHcJm7R8YH8GqR+P1DeZV5pn8IHyXMb6p6G+pm4Ru83p8zh1pZ9bIOOs8VxVt9y2ZY
         ej8pbaF7xQ9Iyvf5NJculOE6JaExDhrFdaQXRtWMHtdbMzaNNNyDTK926HagV4EwAHRN
         BlEaduekDJmQyaPobvGXcxqn06t34lgbce37I8cjfrhR4dNSA0f1Am/rcqnZdbXDXmXB
         csQe4SdwDpBVuPpqRbYIRdu1eMSxqxh0DFJcRHq/HfP9ZSWe2+anJ5d55FP6e0NsfR/j
         tCZReHSpUZefYMoybRqNJkr0DDWC3TdHaToh+i6TsZ04r375iNhatrvoqnnTPYPAekC8
         gtnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=l9lO1OklyoDmPOBdmBi2tJI2IFnDDbuqGS8Madrj3lE=;
        b=uMms9cnN+lWOKsC4XlbUm8JyFhng4Xct0MTUfMbMhhCLvGi8xGdWWuDQI3wfCCe2L+
         AepthskfYMjjW2m4KX7AhR0e19s7ZFULmyEcaN/eZri1MjE+zt2qcym6TP5WcOuTe4AL
         YXhvW4/zxU1TZni5T+CfJgR7RlMLG8iCbRF7saVgvW5zSpMDcs8HojGtlm4b6WbKHUR+
         IsGkVUyemg1DRq+ozzmW4Dsq5FAZKy4/nXvr+STSdKWcQJqMmALd/A2qdzAfQpoRIXFX
         ONVUQXZZ8cNakNJwYY0NupUSKORLiw3ZgrzCQqUEQUPpXLrSvl1HqBwMIloPoL8fvRMO
         jlcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DQ4wpApD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si1185151jas.120.2022.01.27.13.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 13:12:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=DQ4wpApD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:58070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDC4X-0001uc-Q9
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 16:12:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nDBu0-0006jq-SX
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 16:01:56 -0500
Received: from [2a00:1450:4864:20::12c] (port=43630
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nDBtz-0006Bb-2G
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 16:01:56 -0500
Received: by mail-lf1-x12c.google.com with SMTP id u6so7708404lfm.10
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 13:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9lO1OklyoDmPOBdmBi2tJI2IFnDDbuqGS8Madrj3lE=;
 b=DQ4wpApDLOOD4jiZAr5PsCDVKBtDlbPOKQkOLp4miSg95JHGeZHfIRU5/tA4e1Wl49
 IPPIzuysTcujyXOKFAWuLWeBEDZxvE444CeBNvVhYxK2jJNkd2TrCUuJXNbEiXbahW1P
 U5jcaayf0TTHUtjWbugbsbDRJKQUE8AtJkGQaInjIB9ks2AXBGw4i0qgr3mqxH2QdHYJ
 DRrX9aeDTW9bUmkeLYhkCG1ifEN5VUNZEJJ1DJhc5xC9b3TOtI/zNJChacBKKJDFOcvu
 KH7GoybpHSBuwhlvzbR9B3X0ikI6eQR4l4QzO3Qn8pAKH7Isi317UB4CFNGRwbER+/HJ
 dNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9lO1OklyoDmPOBdmBi2tJI2IFnDDbuqGS8Madrj3lE=;
 b=us2su1TJ0Lp2SBGP5e5InborLYCMC7T/CEyje+5wwSXkuHtvKJT4571gm5FBBmY3uw
 3VbwfC6wGMJsBZFDa6M9Xam615sM+5KN5M86x6ko+W5LxNUrtaeZ3JZm2UUeXQjyS3BN
 J4VRjIRLERp80HpAtHk7LkIh56IvTufDg3cSlbl/J1VzS+l445lpwVEZkvN/YR+cR6ol
 WaqZVoXVfZao0EJHt23gTPRGj5MDtmGWsJxlCXMvViVdXy5bgSEmBm6APN25NDOXN/IG
 DnLjcLIakU14ljElgKutKKEvUdFrEWGGcu0A07XjNA0/WSiqWUxBuVKnn/prWQly60Y1
 hYyg==
X-Gm-Message-State: AOAM530bSfEEs705fvUF883t6y7Zl8wLLEHrT81Gp2ovucMF+lG6u5Fp
 XGbmXsh371JyJsOpznbRWO3S5uFzbr80/pCmJcgKL2V4ilg=
X-Received: by 2002:a17:907:2d8e:: with SMTP id
 gt14mr4292037ejc.509.1643316897297; 
 Thu, 27 Jan 2022 12:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-4-titusr@google.com>
 <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
In-Reply-To: <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
From: Titus Rwantare <titusr@google.com>
Date: Thu, 27 Jan 2022 12:54:20 -0800
Message-ID: <CAMvPwGoSXYOJnUnDz1jdKWXmGKS3wdvjZ+oV-Pdrk1Z-AXF+Ww@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/sensor: add Intersil ISL69260 device model
To: Peter Maydell <peter.maydell@linaro.org>
Cc: f4bug@amsat.org, minyard@acm.org, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, venture@google.com, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=titusr@google.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +IIIWqUoM7K4

On Thu, 27 Jan 2022 at 11:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 6 Jan 2022 at 23:19, Titus Rwantare <titusr@google.com> wrote:
> >

> > +static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
> > +{
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: reading from unsupported register: 0x%02x\n",
> > +                  __func__, pmdev->code);
> > +    return 0xFF;
> > +}
> > +
> > +static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> > +                              uint8_t len)
> > +{
> > +    qemu_log_mask(LOG_GUEST_ERROR,
> > +                  "%s: write to unsupported register: 0x%02x\n",
> > +                  __func__, pmdev->code);
> > +    return 0xFF;
> > +}
>
> This device appears to have no implemented guest visible
> interface at all, and yet it has a lot of object properties.
> What's going on here ?
>
> thanks
> -- PMM

This device relies on read_byte and write_data implemented in
pmbus_device.c. Those generic implementations fall through to the
device specific implementations for registers not in the standard.
This qemu model happens not to include additional registers. However,
I must change these to LOG_UNIMP which is more appropriate to what's
going on.

Thanks,
Titus
