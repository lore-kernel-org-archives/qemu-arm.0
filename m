Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp3663771lfb;
        Mon, 26 Apr 2021 03:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw80twnfqi5CduRrObvsrcITYkRxBQwzxEFz+QN3DO1Jategmv1uYzZbwDFhhl3PRxKfuoQ
X-Received: by 2002:aa7:c789:: with SMTP id n9mr20574641eds.352.1619431318540;
        Mon, 26 Apr 2021 03:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619431318; cv=none;
        d=google.com; s=arc-20160816;
        b=r6i6KJsheZUrdT4RQ1K6ihAcDX+Neq+TuxVYJPD1jU8ppLpXISMfPxeeFKTViiLKUA
         7OlpPvkshdQLSmga7DNzCU0QuQwwpejTzsXHVuuEqn20LPoDhEV9gDmPJAefoeaaQPjg
         tjxSDS7gVGi6EyppuWxT4HDRZI6vSVWuUk9L7wav/MAZc9HiBXguFXwtvOhN7NTtZqzP
         PcZIdnhEc7YCXg1Lk3+ALK3+N1WI9HoFBTAR6BdWBy0gJonEQxHbcn2kCGMmj1uFhqa4
         fosUUb6Brham3jc2mbVsh8L6fb5GwItannYauYHdrblwcbAMLcWuOAznsJfshqM/3qbv
         7SZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=PA74sfXqj6QSgV1uSz6eLUNwRV4rMujeeQpw07g5tto=;
        b=RB7a8UqtBCnJjyz0hx/2gFXzEzmNWkTvl0iszSERgs1NZp2DWO2xEbxFl0Fukw8wJK
         sWAoRHGiOiLkFqj5TDb/pBWyXm2mozHiIq9JpYhtv9bTBhte+3CavArBzR3vW1l6t5+9
         qNPyHtAISnXGOJdGf3BD7BKYAUpdOyB580wuO8NFoGFbp6K2MhqPSgdtHc2+f33nm1vl
         Aqys+DG4Y64NjdmsuzInoeHxBYfxtE2ywOZo13uDgAYXwm4Sedcft/wv9QatMMvwJVYm
         yzi5nhehMEZduOllLeEZD4hJOJalCe6gsTyNqfaWRAIgnk1p/fThItKXyJax+Pnf5XYs
         Xcfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XwLKaPv/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z4si13243576ejr.490.2021.04.26.03.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Apr 2021 03:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="XwLKaPv/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lay3x-0002bO-Au
	for alex.bennee@linaro.org; Mon, 26 Apr 2021 06:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lay2y-0002Wh-Tn
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 06:01:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lay2v-0000Ff-B9
 for qemu-arm@nongnu.org; Mon, 26 Apr 2021 06:00:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619431250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PA74sfXqj6QSgV1uSz6eLUNwRV4rMujeeQpw07g5tto=;
 b=XwLKaPv/nfRTs1JAP+D691HqrB8lS2dVOVfLyGfin4UUNVabz8O7ZhnjaYfdwxcfqy5DMX
 0Or8hPL7h3YwIK2Y1oK6S6BInPioPtCHfbDFTdU80P74uq8m6SMgUOsBxxWVKR9osEA5fW
 J5JlxR5jYH0jPgjLt9NNUkj0xihLhnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-PwYyZubiOeGYrwyuePTBFQ-1; Mon, 26 Apr 2021 06:00:48 -0400
X-MC-Unique: PwYyZubiOeGYrwyuePTBFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A51C1008062;
 Mon, 26 Apr 2021 10:00:47 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-150.ams2.redhat.com
 [10.36.113.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BE0269FB1;
 Mon, 26 Apr 2021 10:00:41 +0000 (UTC)
Date: Mon, 26 Apr 2021 12:00:38 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 0/4] accel/tcg: Make sure that tb->size != 0 after
 translation
Message-ID: <20210426120038.5919f026.cohuck@redhat.com>
In-Reply-To: <f84d413f-6f25-eca0-e963-dc11e446f38a@linaro.org>
References: <20210416154939.32404-1-iii@linux.ibm.com>
 <20210423123111.0575608e.cohuck@redhat.com>
 <f84d413f-6f25-eca0-e963-dc11e446f38a@linaro.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0PomkUnax26e

On Fri, 23 Apr 2021 10:50:59 -0700
Richard Henderson <richard.henderson@linaro.org> wrote:

> On 4/23/21 3:31 AM, Cornelia Huck wrote:
> > So, what's the way forward here? I can pick this if I get an ack for
> > the arm patch. If someone else wants to take this, I'll just ack the
> > s390x patch.  
> 
> You've volunteered, so that means you get it, I think.  ;-)
> 
> 
> r~
> 

I guessed as much :) Thanks for your review!

