Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3165491ejb;
        Mon, 20 Mar 2023 12:14:47 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Wxbxtv11tU/0a4jCZRTYTWPlag4oiyMbSmOEVFNDtF8vTlqwjtAL6k3cfMUIorpOw+j0D
X-Received: by 2002:a05:6214:1cc4:b0:5ba:168d:d404 with SMTP id g4-20020a0562141cc400b005ba168dd404mr22903320qvd.34.1679339687290;
        Mon, 20 Mar 2023 12:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679339687; cv=none;
        d=google.com; s=arc-20160816;
        b=Nn16S67YUxFbZZLWiBuDoeHyC+BBD8hd9G4HDAzzlMg6O+Z072xAHd55m5CqnhxvaQ
         RusiYijQjhIEMEjK7LgolSgMtl+H4BQS/AzavzrvMFoXghefmfJMB4iaxUYArLTbzkIh
         QZ/wvkCzhfr5B3hI2cshi74s+zsnQ8l3F8+CsMOZHpKtLlDF3CW8ZwY2g4vlZk0W4gJ1
         FiOiFIWn1OnyV7sphMFmFJ+oe6QxuGSdje2DkpzUoOis137skhaVjYx27iVnQU/teBNM
         MNaS7FrMgQsKMGy9gzkTG+1Rvy4FYYIhQ0/ikQRVluDy8SnvrrHJMUbVU5k6QkOi9Qld
         B7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Z93kpHqC1pQkhOFlIgS+0oWzByMy1Y5V38S8faNaPfw=;
        b=OjyM9LJ9681b/v/9XB2scmGkMWgNhqX48QXUpzM6vVj1KMocG7OSBklC1EQl5YEGWq
         gupdGW4y9W2ps8JjdclkexHQ1L6Pd1BBaEpA5TqHAH3XVR+CS/KzkZ2Zqra66Y/DjZWy
         nbp/WGpy0WwxwfX2RgTEDxb7mNpEh93YDU6eY23vunFbZtQsFrIpe61D0XaqhTEutHvX
         MRgFdlLhgqOgsjJJK/EtcsEY6xMxl1aUGVp0YQblhfSsSu7qvkO956T5wC64auwaZg+A
         5YMr1j+VxET9I7LguOFAWKRVcVLVLKZBJmcdU9GmM5YINK3piQ3Xy3bbThHo8SsgBi/q
         mL4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=b5wDWh2i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19-20020a05620a299300b006fca63f5c9bsi7172923qkp.108.2023.03.20.12.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Mar 2023 12:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=b5wDWh2i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peKxa-0005Dz-1U; Mon, 20 Mar 2023 15:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peKxY-0005D7-44
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:14:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1peKxW-00077h-M9
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 15:14:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3ed2a586c34so173615e9.0
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679339655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z93kpHqC1pQkhOFlIgS+0oWzByMy1Y5V38S8faNaPfw=;
 b=b5wDWh2iK37ooapHzZo1rJZ3ZsVDZLspti/0t+5wJhtvODSLP5Kc4l+ZpXV8sqEw/f
 5xGKjsQeWjtdCcHicTX32K0FJZGmkgin5A1MGKQrUlI3OmAMnl6tzotwCciooAQ8yF/0
 dtGmpHjzskWf3wyqGBSCuMq7ulICTYIXKl+wQxK3Sn3phKDImJneJWfvtilNV13HEd1Z
 /jwsZ7eRXN/RCE7ceozwCHZj9XDp/lTbHpG6R4tiDfC4fxnz24F7xUVUYQ+lys+YgMTv
 Hu/arW3m/xmMEQZgxkall8/AhkO4Q5ZCOqX4k9gup30WGnngDWan59BmVrLYyOT5Eyk7
 2sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679339655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z93kpHqC1pQkhOFlIgS+0oWzByMy1Y5V38S8faNaPfw=;
 b=uvNKP7OZmwlssINUNgl9NdolAV4tXrtQCZ3z51H/5NRLBH5vNTqJ8qrA0G5j3WEs5U
 9Z5HdiskGlTmNQFSivZydSxyfqU0QBAkUDRuixg1dhq/hYQ1HOctrB2c3uJ1CUnUFk38
 prifINbj8OqdcvSChtLx1b0KIk9PQMwi4u47DAc+vwbdgIUQpOEKN8EevdmycCwImlXA
 1+Qmf5K+AonfYZSvjHGIxTyOn67biyJS39tJWRenlitzcT8lieuJXpOLE6n39BKVs3rC
 J5ORNUn4ig38dSRgJHxN1B1hqK8Ubo43SJAcGB5KXQghck1ZnHV4wmxNxRoPgyReS6Dw
 EcDw==
X-Gm-Message-State: AO0yUKXKtVXI+GHQYxaNcrv1zGwheKE3hRpzDoIaE7eyJOQzqq8vztuP
 rZI8K5wT02y039JHk9UgCx/5OrDPIH9mo3Gc2JG9oA==
X-Received: by 2002:a05:600c:45c3:b0:3df:f3ce:be47 with SMTP id
 s3-20020a05600c45c300b003dff3cebe47mr30283wmo.6.1679339654768; 
 Mon, 20 Mar 2023 12:14:14 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 j6-20020a5d5646000000b002d2f0e23acbsm9571365wrw.12.2023.03.20.12.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 12:14:14 -0700 (PDT)
Date: Mon, 20 Mar 2023 19:14:10 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v2 06/11] hw/arm/smmuv3: Make TLB lookup work for
 stage-2
Message-ID: <ZBiwghGmRy51+Q96@google.com>
References: <20230226220650.1480786-1-smostafa@google.com>
 <20230226220650.1480786-7-smostafa@google.com>
 <45961bdc-cd3a-c35a-8f10-bb9a52dd2e33@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45961bdc-cd3a-c35a-8f10-bb9a52dd2e33@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fWQ3/kqxtQHj

Hi Eric,

On Mon, Mar 20, 2023 at 05:05:31PM +0100, Eric Auger wrote:
> > +    /*
> > +     * TLB lookup looks for granule and input size for a translation stage,
> > +     * as only one stage is supported right now, choose the right values
> > +     * from the configuration.
> > +     */
> > +    page_mask = (1ULL << granule_sz) - 1;
> >      aligned_addr = addr & ~page_mask;
> >  
> > -    cached_entry = smmu_iotlb_lookup(bs, cfg, tt, aligned_addr);
> > +    SMMUTransTableInfo temp = {
> Move the declaration at the top. Also rename temp into tt to be more
> explicit about what it is?
I will move it to the top and remove granule_sz and tsz and just assign
values to this struct.
There is a pointer already called tt, I can call it tt_combined as
ideally this will hold the combined attributes for the TLB lookup.

Thanks,
Mostafa
