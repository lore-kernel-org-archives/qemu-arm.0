Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2124671lfg;
        Mon, 23 Aug 2021 11:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyruLt0gZeRUMUyB/fYnTciDx/dcNN9ZtvY6BCsiaTRZwaXPCA7Ccn6Zez9vHKau/uUBVE2
X-Received: by 2002:a02:8549:: with SMTP id g67mr22708011jai.73.1629744847709;
        Mon, 23 Aug 2021 11:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629744847; cv=none;
        d=google.com; s=arc-20160816;
        b=XeDsZb/sO3DZLZtSHcw/BluWwjWdeMswC0bgwt4AwrMbckM/jRnMpRaSZVt/2dPWG6
         jsiQHchqm7K+1upOawTL/luJ2pMwqkKe2oDmUztBZlBvGU/Yai7oGcamEqgQ3asw/nyx
         SR5qPAkQdXK55iOQC5zCldIhFnQnP6+v7VhlJbDXOUabXVldEWmNTNE5VD9uROPYCgLM
         fVGOBxrz/WWm1p9loi7pch4hhX0hQraqceQRESoqz06xELdEzmGMQNkt/kAY8pQFkP9M
         Qd3lV6elqTnJq3k600UpiuDjaHjQvraDi4g4YvwOeYRzvDGDGue1szzAhr66SMf5wy59
         Rl8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=oK0CkQ7Bxe1UqG2Sum95+Ae0794dbAK2OESs5gCjHOA=;
        b=lMI5wuVr4+stvo0+rSjv1cun86vTJ/moK2N3nMSaRxT0mhYTvEq8E6pR5Yq7F4+mEM
         S8P2JhndpjtS+tNb/f4UoGSBGvQ1QG5Z/wZP5uBl5lD+CSfr8aAT6QW6XNiBN+BdFX9b
         wnPSk6ZdASuZI35H76UR46ssGNoswagLlPNRepZ7DzTIedzlIYqueJhjHF/Q+1nAivCD
         GXrjtIxebiQ1SOqc+joeKVoNisWsvW2w7wGfGxXy/NPEyV3uwSkewfrTnOUSBu9SAPoQ
         H4KkFw0yYUvQM71CHUwt4lPKuv5iX/emyDZUI9n19/Qemz54iPfT3xtDAx4H8RNXenJM
         099g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fucPEg78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si16309629ilo.33.2021.08.23.11.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 11:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fucPEg78;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIF5D-0006OI-1v
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 14:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIExN-0006Hk-Ce
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:46:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIExL-0006VE-3S
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:46:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629744358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oK0CkQ7Bxe1UqG2Sum95+Ae0794dbAK2OESs5gCjHOA=;
 b=fucPEg78iiqm8JHNbwlgqHLzfGYCQPTh3Y5+kld2knL7/IUZNuxgG8e1SfsLqBwXk4ko9F
 IhoAFYhXfqH1rAM8mPJcHXXsAlNIwMwPTU+fp76WtbfROqwuInP36GgHV7gKzWLnGfapU2
 Bd9uSzsrVFIjfyXK3ZNd7awtCAtFC5o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-OpQn7ZpVM3ulcrr-Ex7aZg-1; Mon, 23 Aug 2021 14:45:57 -0400
X-MC-Unique: OpQn7ZpVM3ulcrr-Ex7aZg-1
Received: by mail-qv1-f70.google.com with SMTP id
 m10-20020a056214158ab029035a6c1e5f3eso13026715qvw.7
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oK0CkQ7Bxe1UqG2Sum95+Ae0794dbAK2OESs5gCjHOA=;
 b=sAxUbrJDJrh2+KGLNow13FavlNW9ycf9JAC60XqJm5juoAFfvu+CN5GY7xFGCv84Bw
 10UqgRk1o7nHfTK6vpEtHI0e/7+AQS7Qf272A4JaETwnB73feZ2+4mL8YHavuYgILuNM
 R/e7Wh6NjD68qj9O9Vd0nemjydAUDr/RK0zXMem9Ih9r4ZEFRGxGNUBcEEl5cEEIgRiq
 kv4yG0hmHpT+xZovbGrQ4qfRcz1Is77k1cjZtVGuyaYZERKSIlBkUYVizLGLAYbOCTIm
 nXSTnD3svIRHHyX5VQCTPv5HGE+eCPwXlcm+69V7pS4WVr/ejchEd10cL4Ket3KM6L1D
 c/gg==
X-Gm-Message-State: AOAM530TUoXITPINU2oIZ1iVNdjbeA0NUgCZT8kJYZHzGCuv9S+KjzZL
 rUM753PDj6on4LQ6s/PXdOu1GFcQZuLDuKWns5WaG+ikznU0kCVfQqfQ8fEOQv/pRnLzVm/baui
 wgqJk6754TEz4kfw=
X-Received: by 2002:a05:620a:4106:: with SMTP id
 j6mr22761814qko.392.1629744357065; 
 Mon, 23 Aug 2021 11:45:57 -0700 (PDT)
X-Received: by 2002:a05:620a:4106:: with SMTP id
 j6mr22761804qko.392.1629744356871; 
 Mon, 23 Aug 2021 11:45:56 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id w6sm5556034qkw.91.2021.08.23.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:45:56 -0700 (PDT)
Date: Mon, 23 Aug 2021 14:45:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
Message-ID: <YSPs4uVQ9HXNOzdj@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kC0qjPmUjUEH

On Mon, Aug 23, 2021 at 06:41:53PM +0200, Philippe Mathieu-Daudé wrote:
> Remove unuseful local 'result' variables.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

