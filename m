Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp492980ejb;
        Thu, 16 Feb 2023 05:27:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/zaxcIUKp7hxEddyHKhJFH07WSE+k3PMpVTi9D6orBgRGDlKDfvexmhMuMN33gPGcmDb3z
X-Received: by 2002:a05:622a:1889:b0:3bb:995c:424c with SMTP id v9-20020a05622a188900b003bb995c424cmr3867202qtc.22.1676554076140;
        Thu, 16 Feb 2023 05:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676554076; cv=none;
        d=google.com; s=arc-20160816;
        b=qgsa2r71bqVue2FQMqclglnehH/4mFArbrWTjYPv0l1pheKX/1r/fuFHUKZWFp4Aq4
         egQJXGIlI3D0f5c0QnlMucDH25E1BGGcV0VEnEBGYtJW8O6I6LwDaOqslml8W/sfObkS
         iOpmu5JiAR09CDAr9T+yx8d+PY8L2RwITTzriaJ1NHFVJLbT5r9zVIUTcE7kI+rJ7MLm
         WSMaRyGdUjQWQfOLRcD87hKWd83ug7P1igtuHrp0vNA2CDySmfu64rJE+XAWPr/vZoIA
         542m/o1wtGETLCU7PJZLAGgoH5e0TpEGT7QkifkK3phb/uoGHSgr+ipLwqwPR2S/70Ew
         kZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Xa29WhiHgsKNKOOaEkGY+UmjKxSvIsu7Et0upEMMDuU=;
        b=hpyZsZoi7hcVRnY6Ek64yh1MODkGheysRDcpoYthO+0m2qVg+uV7rxge8/IpL3IF+Y
         AZf5zzmyIvPYnEy/cHu1ZvDA0G32LoZWNpMrRwhJe7on407rvWXnw7csj2ekfKeqgkqw
         4fsFs3AJZdIGRPU9ekn/sI+TIlCWIDlkT7l0NrI5stxj9QJBytncajSiS9QMthxcZy8g
         L5DSwemlKnfNEB/jh/f0gCMC4cVYSxZBxW+1K4A+okezOqymtr48fVr5cr/G8vSNJXGc
         p1sRlTXQ+H4BGu7aeTiVpwjKaga0Zq/8o0YCwpvMG7OUUzhpPR2916vxQQKEoZcsCia4
         VQDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=duqMpugt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21-20020ac85955000000b003b9c4961c87si1649182qtz.228.2023.02.16.05.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:27:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=duqMpugt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSeID-0001Se-5L; Thu, 16 Feb 2023 08:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeI6-0001IT-2r
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:27:14 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeI4-0006Tn-KD
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:27:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1628443wmb.5
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 05:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xa29WhiHgsKNKOOaEkGY+UmjKxSvIsu7Et0upEMMDuU=;
 b=duqMpugt+xYqKE73yw2kOVRIrs69J7u48dp1kcb1WC0scLapyVo+iuYA7S6migJekJ
 CwlSKTnntFsneapKFAfZW5x7JEmSnyB6HdsOB3BMJij9/JQJ7eTMkF1VT9tG7Ek8kEwL
 jYxMUrW+q6RGymwi/yRi3uNo2DHq9IOlFucG2ZgviTK4u53Lf5p74Dfq6Q87cE1BPUY8
 XId/TEmga4nDEVK2zIiAJhqLKpz3ZaApMxnsRg3w8JjnPGjlqQQgu5WBMKD3uqEUplCr
 kYQvPWSwEJk+RPi+1Iec4hnSu++lUSXyQmJotgdvvQFz8ohnqB75Y1nK44Zaa4MVStiw
 0f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xa29WhiHgsKNKOOaEkGY+UmjKxSvIsu7Et0upEMMDuU=;
 b=YIrQi87THVXhzjwoiVusJS+6Z1ZTTMIQqt6QEOIp3TMgIUvlRnM/HIoqGOh+dPGOCT
 BA92x22Xrde8jAj9TWdVzjWXaynJzmGuZC8085OLrS6DM+U/ZBOBFTG0E666BGa5oh60
 IJB++tnGA+/+1dg8FmmVcx9lS5M91ihxQKHNXfNV0sXAnKQUf7CAUXOHlN9jsEGKCLI4
 ojq7HRaz5C5VyQgTwvIjeACpjMO2VLfmsiJJfKIDm7PbzJGnjiZsT8z/b1ONfUmGeQh2
 /B3JDGR7dZABKR4/95Y4z7knzrl//oTSc2yN/E2MzNQZXQrYAHOhVnV2v76w6sd33R2E
 yszA==
X-Gm-Message-State: AO0yUKUrluXR3HO+x3d7IgNLX62bErAB53BE/WbWONdQzmi7MafG0UOd
 NTYs0yaocKZlQjpS6g/SjrTLTQ==
X-Received: by 2002:a05:600c:1d81:b0:3df:f3ce:be45 with SMTP id
 p1-20020a05600c1d8100b003dff3cebe45mr219810wms.4.1676554030886; 
 Thu, 16 Feb 2023 05:27:10 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfe701000000b002c5526234d2sm1547500wrm.8.2023.02.16.05.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:27:10 -0800 (PST)
Date: Thu, 16 Feb 2023 13:27:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 08/16] hw/arm/smmuv3: Support S2AFFD
Message-ID: <Y+4vKVWenRF5ALcb@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-9-smostafa@google.com>
 <7fa87a34-48ad-5b7d-a034-44b925f0d1c1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fa87a34-48ad-5b7d-a034-44b925f0d1c1@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=smostafa@google.com; helo=mail-wm1-x336.google.com
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
X-TUID: bA9OoZKSv14V

Hi Eric,

On Wed, Feb 15, 2023 at 07:37:52PM +0100, Eric Auger wrote:
> > Parse S2AFFD from STE and use it in stage-2 translation.
> >
> > This is described in the SMMUv3 manual "5.2. Stream Table Entry" in
> > "[181] S2AFFD".
> 
> from a patch structure pov, to me it would make more sense to add the
> STE field decoding in
> [RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2 and use it
> in hw/arm/smmuv3: Add page table walk for stage-2
Yes, as all STE parsing will be in the same patch, it make sense to
remove this one and AFFD in stage-2 PTW.

> > +         * An Access fault takes priority over a Permission fault.
> > +         */
> > +        if (!PTE_AF(pte) && !cfg->s2cfg.affd) {
> > +            info->type = SMMU_PTW_ERR_ACCESS;
> Wondering how you are going to differentiate page faults at S1 versus
> page faults at S2.
> Event number #10 differentiates both and recorded fields are different.
> 
> Do you handle that somewhere?
Yes, this is missing, similar to F_TRANSLATION, we can set
info->u.f_walk_eabt.s2 which would set S2[103] bit in the fault event.


Thanks,
Mostafa
