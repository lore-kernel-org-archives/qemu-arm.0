Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6500311ejq;
        Mon, 15 May 2023 06:12:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57y+noj4ufq24pS5P5hU4dada+9g1VaI+UK7dBBtA4mVpGZ5iZn17egGlhBC/Xzu4x94VP
X-Received: by 2002:a05:6102:3cd:b0:434:6d2e:d0ac with SMTP id n13-20020a05610203cd00b004346d2ed0acmr12914412vsq.9.1684156332046;
        Mon, 15 May 2023 06:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684156332; cv=none;
        d=google.com; s=arc-20160816;
        b=axIyMzQ7Se5+Pgo+OU4CMjBw5HQ7LWeCcv3ttmk+7ycFpnKa4m8wSkIKfYQT6ZoUzE
         datbkY+z8Vx0hOb1bwAI0q1JN+SV0oSp46vMrogRCy9MTPZeAQG96WuC7AL2+i8Iknhn
         qCXRCFLwusPO8B+uRl4hCsHhaaQkkovCw/u0LsT3ALi4ARQkjRpymd56hr1BtKVtS24w
         9RbEN1jUK9yzpGM1IrnPzlg8OUHojuZ8Ljml4c4hQUz2CALIUjjo4uMh2mmgrFuqLt9F
         g+Z5HhY7AboLMBabSE83whoTeGBffUpFWwg51SHxsuB1Psz9ca9fDccveTRCRG/wW6HW
         uRnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=NTzqxTQdnu4aIMicGFTrnGmIbIuidHOgsEgrDr+sZI8=;
        b=FhLwbgZHBq7bwD8aacEAo2aEksckVjdM+ZZQNHXnkELYKBcC+ou8CWMoXvyenGu4qh
         GoPb9X6nBWSmKX2WBpgGL58AKIQ216iXoWuWkBzc+rX/OYuriYJPcFScaz0TxvngC9gj
         Sv+uvnTI0jIzRpIQUsZf1LHYV3SNs0lLBOjbMYbdsZWQh9VgoMuZvFcnW1xM93nzJDVF
         1hn0ol7esIqrKmSwEyZrWRCCVuXKQ5kpYKShMxOCMf3sv+xt3uqaKZzffBdYc6O2OBFx
         i4ZbC0Y/R2zLaAVte9ck+rmP3eiudPi8qRRociGHuctWfHz4Isc5jXI5FHSABBK2VXhB
         po/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=OKmZh8ef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020ab05f91000000b0077d484b136csi3579240uaj.229.2023.05.15.06.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 06:12:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=OKmZh8ef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyXsd-0000Vy-2W; Mon, 15 May 2023 09:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pyXrZ-0005G1-4D
 for qemu-arm@nongnu.org; Mon, 15 May 2023 09:03:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pyXrV-0001BD-TP
 for qemu-arm@nongnu.org; Mon, 15 May 2023 09:03:40 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f423c17bafso357785e9.0
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684155814; x=1686747814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=NTzqxTQdnu4aIMicGFTrnGmIbIuidHOgsEgrDr+sZI8=;
 b=OKmZh8ef+YxnxgU922+PycX6rRHurbtaonwghxIOCnl08M0hVfOVAtkIwzV+Is4QJp
 AYsT2KzyldF5P+gjHLk/0pd6Kdn2Iuw/9LKHNUGTnqORNvk1RhILo5OWBTc/zWP7EuoX
 sc8Jkx+q1rdNPo3apXqYsz3OOb7plIvMsBL4exzWEf8fP++pRBxuQeIXXKap76L8a8Tr
 Vxs+WUOkw8ikmRlDja4C/IfJqswqbCCMonMJnNajo9+QaaJXiKqVHWEH88YTU8V60PoI
 2j2+CLhOzftYgXcaT6WcgsfKkM4xqbXEYAnTIYevJABrrmtWQfDWh0JZwhXeNhwF+gpf
 Zy2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155814; x=1686747814;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTzqxTQdnu4aIMicGFTrnGmIbIuidHOgsEgrDr+sZI8=;
 b=Cj1ZzeHa/hRKVurz3WBAbtlbZHDJEhXUJo737z2UDq6G+vd34DVaPHK6CfDNg8tJcK
 YpGaUrNxJMRNaObTTXO6e3cAHw+PJr9cMLVotvX/oSVwQhCX+kft9kFfSaSYz3n4448C
 pZ+EfwY3nEYO372w7ddMTwopu/HeYrHQoIXiBSZ0iUSKya6KhHYZSks/xRWoRfAGh37j
 mI9GxTuDOEviSNr63mF4BPqN9N9GBGjaePRCUq44BJZrZHIXKrKR6KHmVR+MvurzL3QN
 DawuSYL74y9QRpDFz90Szc8zfJ+IFByUZAKBFsVqvVlYHdT7dRGybB4nR03rp54VRnIt
 oIaA==
X-Gm-Message-State: AC+VfDyLgXdYr5y8DfjGorxn6PjQZA79gkV8ewIVbfUB6YgwBJQxYfhy
 7sUevbTCwoV1lyFn6cwChd3NGQ==
X-Received: by 2002:a05:600c:3d93:b0:3f1:758c:dd23 with SMTP id
 bi19-20020a05600c3d9300b003f1758cdd23mr788223wmb.7.1684155814202; 
 Mon, 15 May 2023 06:03:34 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d4f11000000b003079986fd71sm23402210wru.88.2023.05.15.06.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:03:33 -0700 (PDT)
Date: Mon, 15 May 2023 13:03:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v3 00/10] Add stage-2 translation for SMMUv3
Message-ID: <ZGItoVA+K8N92SaR@google.com>
References: <20230401104953.1325983-1-smostafa@google.com>
 <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8=sOzRW9QZqrpsLZh6q_erXmj2xfazfKrgg_ESR8Fy9Q@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: 5vsiunT6z1LY

Hi Peter,

On Fri, May 12, 2023 at 03:46:43PM +0100, Peter Maydell wrote:
> 
> Mostafa: is there anything in particular here that means this
> patchset should stay an RFC and isn't ready to go into the tree?
No, I believe the series is in a good shape now.
I will remove RFC when sending v4, if Eric has not major findings.

Thanks,
Mostafa
