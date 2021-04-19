Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1349197lfb;
        Mon, 19 Apr 2021 10:07:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLQTip4uW8px81MXlbxmBE9/7RnkNBFLCmL/pSTQcVuRqojWHLztL+KirCsteVedRhzuGU
X-Received: by 2002:a92:cb51:: with SMTP id f17mr19386783ilq.119.1618852067438;
        Mon, 19 Apr 2021 10:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852067; cv=none;
        d=google.com; s=arc-20160816;
        b=bNAgDcIvuwq1H2iLpJDfm6tplNJ80EMfKs2L/HXAn2mJdu5R1KiqVB2Ae+T+2yl7sj
         oeS9Mh0Jj2Kxw799fbDC9bk4NWwGUkrXbIgYl/3BKAbzIGKEQXdtZLZuF6H/C2YD5f2M
         XibkWZugQj2NY2Z7iT/jvHTymfupY2UxAmUkZkr53W9PYwR/3N0INpIYCVMvwP92e78P
         NhEm1lsMKMNG9VMQuwNAzSTDqP8SQWUylGHb03aYYizPpak1zCmzctPuvtNTMwWbVCEO
         Qyi43okXbKqNL9gIxhi081OPrybWtFETYFLUxlZ3gKN48J/J/i5LooX57qY2/l7RIF2j
         lrLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLVje4T3zJgiJ4Ct0hnDjp4CeZhDOX7p+nz3IlOIvBI=;
        b=Sh4/8opkJEINSraeJ5FZrzP4nsUfr/2KN0TwnbBnLY+d3y5XbS+wStg2iy0IOQoMri
         k3jnXZPOCTHy1KNEvkt/MEPMLUYxeuMswQ7j0+1E4C2/bk8P3paSLceRKPNR0CTYG0Xa
         QzQmW89qHyOZuKqITzcoAk3EczAVrvEwdJNK2SJxnNdjJ6boAcpD5b+hwYcKpMjjeabK
         GbVnubB9ODQZAo25j7kVLuUrDsSLisYIUl1kHnEe7bzfBn4LkDbi7gxMx/g1dDdu/kPc
         9/7guF/Mp8mMLRksMXPt/RpqjKdrr+Ip0EuXreRGNJr9+8vCGBJb0sO61CWN7xxRE+58
         mwbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tdRCk17G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si9113795ile.66.2021.04.19.10.07.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:07:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tdRCk17G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXNC-0006cF-MY
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXLO-0004iN-F2
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:54 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXLL-0004py-3A
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u17so54092831ejk.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLVje4T3zJgiJ4Ct0hnDjp4CeZhDOX7p+nz3IlOIvBI=;
 b=tdRCk17GYjHU0/hr7Qn0FOjQs/ZfwCizl840SHbyl+P+MTE9M4ODLEi/6B/KMrCzyR
 E1P4QHLGXxkzCU5YIrQ/FnzqnbcNkHoFkLaLXKJo6F+4kU/S5cTUCrDD3hntxzTwYW8l
 RxvLvvxToLYsJ8igAVmVS2IZ5eOmRV2L2lrYR8KsuqYEx49zdMWlxheOLRf5Jfn1ce3h
 e3ivnJdRVCOWXjju1T0m/oURCAAunugpPJEIaBmoThn/xxcYf/V5/FYWE8jzHlkO2Txb
 bA5nsVedKQONiZon4qL2ZdnYBBAo+aTs/LkNU/y9uBTNAhlEwRusSuvx8U4L6hJzoTUA
 8DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLVje4T3zJgiJ4Ct0hnDjp4CeZhDOX7p+nz3IlOIvBI=;
 b=tdh0kj+JhKVGfbhRtnNZm1375YLKjRwC4Q6A/BIPlJFPYJKfh8niib32Wvh54eE8T6
 4oITgu2HfKFD0vcvu/YnH+TJcTf92U6a5L/ruX6Z1ckC0HgKVtBVzO0wkC2zLU3AMxM8
 eQiOo3OG4jag7IM8z+ZFBITPeOscbeywSZpkGhfZL+fXJKs4r5ZhI6fb/0XGAamcoMoV
 P6K+UDT9LRWd6lrSWAlcRToAofti1kXzXw3kgF+2izy0rzDNkpMD9nzlNBSOfFDLu+Ye
 U62WD9M/UqyoBq5xPBKK1AZ8G58ENTV0d72hWF3GDGIofC6yU5t5eB1pl7Zpg+KPn4Cr
 UGLA==
X-Gm-Message-State: AOAM530Nt3BFK9pWt+sA29LYSDqA6GTM57xk52e0OaadfThOdeWxWh9f
 HVrWbM91XwQAF1TeikfdHUzED8B+2aRAwm2lQHF09w==
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr23699078eje.250.1618851948949; 
 Mon, 19 Apr 2021 10:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-9-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:04:57 +0100
Message-ID: <CAFEAcA8WHe-hhsckBooVACxR+U0FFkYNRALdXCq25hLK8PijqA@mail.gmail.com>
Subject: Re: [PATCH v4 08/30] target/arm: Move TBFLAG_ANY bits to the bottom
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +jk+biXjV/ZL

On Fri, 16 Apr 2021 at 20:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that other bits have been moved out of tb->flags,
> there's no point in filling from the top.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
