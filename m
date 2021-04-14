Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp6076571lfr;
        Wed, 14 Apr 2021 11:03:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOdS3l6k7gGhppZSEGUurw+/AoCKWd82WG9MVJMdHM6O0QZrYM0LwGM3WSUGuLdX2yt7ej
X-Received: by 2002:a05:6e02:15c6:: with SMTP id q6mr94320ilu.17.1618423426206;
        Wed, 14 Apr 2021 11:03:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618423426; cv=none;
        d=google.com; s=arc-20160816;
        b=U2iQ6wQQFO12dyDvs73+n/a8tc3Z8L4wQ0eDzWBtuu4v9wPxGkS22DKJYpEwxr2AJC
         7m1+cw/7V13uM2Ub9DxHE8Mb8L4uPkyNeDXB3OyQ3P4NcHZ5wX281/kNYDeS9oK7DyUG
         IcpEJgZN5HRANuN8QR5DQ9eDJcVuNKt5VavtAt4GZ+V32QtTUawZ2ro6QbagTbfsJu44
         MwHTMjhJWDS36AQ7qqcYTdkUAHs6B+3u6mLTAmz3SQVMtFNPhxNpQtpnl6G4bNZQAzoV
         5blQ1aFkKzlxQ4oHS4NL6HcSHPCRscBg+ioT1noIMffMhhWBzaWDtkSaNccVvmWizlKT
         3XOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9PpMaVmpFBSpkbfOgdSol8NZIRUiJ5mHBaNBXBU378=;
        b=gv/r8awYI1uz/oE4aCmwnPj+eoMw97AB210oxAW6eppdC6TRZXnwJ4p38jDTyXBuol
         +DVE0l2HZymzLOT7KoGD4tKtzgrPQP55XTD7nTaYcbp06SGkgqTQORi+sVOdsA3kRm3B
         j1G9Gp7/2DapG7IK8jnTPcf+0BTBIlgDSeoFJ1dLTcwRaGj5qKgjFUzQwU7F+9UUs7Jo
         DhxYRDu809AHLB7z86U/zo5i94ABuOYY/3x912AdC3N6N5IYO/4bkI3g+gOfRL7zahKV
         Pba8CfCOi2x5Umu+NbjjGSOH0ZyGwi7Uh4uBsEk0dVcmEiA1HwaQ7MBklTYpXdb8zfmS
         HP5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZZqLmwk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si31347ila.138.2021.04.14.11.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Apr 2021 11:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZZqLmwk6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWjrd-0003yT-F5
	for alex.bennee@linaro.org; Wed, 14 Apr 2021 14:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lWjrS-0003y3-0D; Wed, 14 Apr 2021 14:03:34 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lWjrP-000493-5Y; Wed, 14 Apr 2021 14:03:32 -0400
Received: by mail-ed1-x536.google.com with SMTP id m3so24800147edv.5;
 Wed, 14 Apr 2021 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V9PpMaVmpFBSpkbfOgdSol8NZIRUiJ5mHBaNBXBU378=;
 b=ZZqLmwk6HIAgqElRN4flIIqWUqkiL6MC3L8MoCcJ8zOQlYNj728Sa+66tlpNiTishZ
 WYugGb8LnQCFW7qPP7+I36z/WzluU/njbl+MoBtE770aV8Rtgr7xAgHongXy/iedznNd
 fwUfHn0aY4oXVuSb7RJNG4OmXJemVEjIGSFfbnpaGGaiolaSnTPdHMEW+PCwW2HTZxPc
 0E3B+oUGuZ+ZoDBLZleBckns/Q7k1+nLFxbW7k/Is1K3xAtKOdyvmlsiL6rqVM0kOyG9
 wlt8Ae7jwFpFVtQV8zvdOPLbsvDcOI/l8ZNWWUJEwJLn7GePafM4NaZPk02/erHUXbpm
 ERRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V9PpMaVmpFBSpkbfOgdSol8NZIRUiJ5mHBaNBXBU378=;
 b=dDb7/BouVztJDZJwLL77oFLGL9lI91RkFBAQzg+x4pWOYa4n24EyMe13EtmP0w+vkn
 /kAEiEBmPPqrFuNCrhIGIXuLDI6PW9yHOD3b0JNLtmCPA3FUXCJ7o8ZozBnC7P1g40xL
 E45Fg56BAkuVXZQxKjNGXIFP7Qonb+5Mw3CCiD/2EVSqG6Z3MvGVmZpiAakzXRQvR2Jp
 Z4iwzVVFfPftCnz+p1RuSKjJ/sM7fUFZYk79n5nGLXgWCl1q6/6wQJfnoAqg5kop8GKj
 gselfGSSOP2qqucxRhRlPKNZ5dhqB01zEavh0a+PKYozb4omid4rWu5pUYPvvvkxSPZZ
 lmyw==
X-Gm-Message-State: AOAM5318jn2yu3zcv11oUR3TUFEalkciCxg9JqhxrDx6A6rW1I6iziMy
 SnzII0NFtVfqCWzNnyNm3qwDIdBmS5SJP8IwbM0=
X-Received: by 2002:aa7:dc15:: with SMTP id b21mr137040edu.350.1618423407127; 
 Wed, 14 Apr 2021 11:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210414134112.25620-1-iii@linux.ibm.com>
 <20210414134112.25620-4-iii@linux.ibm.com>
 <d3d690a0-c322-5fbb-26ae-dcbf08173b0a@redhat.com>
 <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
In-Reply-To: <28224ba9d61d0d805a162c00903559f3b99bc722.camel@linux.ibm.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 14 Apr 2021 11:03:15 -0700
Message-ID: <CAMo8Bf+s4OqYJLTkvyPvfnmH=FwxDSFn60TryKfgErxFyB+2yQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] accel/tcg: Assert that tb->size != 0 after
 translation
To: Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MROc99tcTKTb

On Wed, Apr 14, 2021 at 9:51 AM Ilya Leoshkevich <iii@linux.ibm.com> wrote:
> On Wed, 2021-04-14 at 16:48 +0200, David Hildenbrand wrote:
> > Did you double-check the xtensa issue?
>
> Oh, I'm sorry, I completely forgot about that one. I just ran the
> test locally, and apparently it fails because of this new assert, so
> I'll have to write the 4th patch now. Thanks!

Just curious, what xtensa issue?

-- 
Thanks.
-- Max
