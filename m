Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2506340lfv;
        Mon, 1 Nov 2021 13:21:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfFWpSZk+1c6yr2wM7NodmeVFagyLDutA0KlVq8ZdpJZgGsTTn9rtCqx0suo2EAFNm89OS
X-Received: by 2002:a05:6e02:1086:: with SMTP id r6mr13973663ilj.176.1635798080327;
        Mon, 01 Nov 2021 13:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635798080; cv=none;
        d=google.com; s=arc-20160816;
        b=ieMiD+cQ8XhCc32Y0jbBUb2Iu+yRpP9UexrJAODXy4RPtCBG6OUq14ipaXM7rE6mcN
         EMXHUF+Tys4zfHqFEkeWvIBlu+1t52dKte0HpsNMOiM5uHJZ5tpHOatUkkNEaspJDrvC
         SbsbgZjJMB1cA9HmcldsuZCi8I5hWLYlpkmmLsrW3lfbCJvP6IF5cdpEGuF1FBesxbX0
         P3O0C420gc+tVex1qjcz0y23QzVFqtYDow4snI14VBt5oHTF1gTfplQYg050qWFKWqj5
         /Yx2xbOBBkJbu/8jL5Vab4/LPzGTFoUQYjoudz+8sltSiIU+0H7IUUeutFp7zcY3ULkr
         kxng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Zj+Am4AZyndJH748Ly37KOSkK/B2qx2FzmN3ymN6P2U=;
        b=HXhFUmkV8TmsBmDxHK2/HekUf8gh5pNxooNRpnHbBEyto3MT4pV+y1RSYY+pV54syt
         nX3ZFOEljul6ApAjij4RcjZUm1N4UCpOaH2A5no3y77oufCXbIZg09EvgvfLJZ9EQ6/W
         flpL67jZxeul9MbQcmWvspy3F3UQHT+qB0ZcAoe4zTBCSp5CLXbunTmzkEDTbhgeqSSp
         L4wljDSFvpt+BfpW1wKXgfL4TpK/9iiIJafvHvrHhvxMct3ui9ybhaI45q1szRg4pPQP
         8uNm8DhMhgZ5D7J0+DG3KgCvy7tmPbf65QV4kwVEFq2PaLftoqmOc0MFF8pRPa1KnBdH
         VAVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JESxliRm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si27250873jat.68.2021.11.01.13.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 13:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JESxliRm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhdnz-0002SR-Ih
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 16:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhceg-0001sQ-3l
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:07:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhceY-0005un-In
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 15:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635793649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zj+Am4AZyndJH748Ly37KOSkK/B2qx2FzmN3ymN6P2U=;
 b=JESxliRmMOyETiE2ilRRRQR6Kn2t+BqcQFYpS91cSnPGJPIS8NIMSO7z9nrD56CD0jYGll
 dBc97s5A/HncocKefp6l/zBnuXNkgKnhlI+FGvWoesxBq9rKH1+gl5XZ1GfAf5QyJB36fx
 au6KooPGRbxgAQCtRxr4J9khT0CHKWg=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-AxSVj5sUM_CrPm59NcN5yA-1; Mon, 01 Nov 2021 15:07:28 -0400
X-MC-Unique: AxSVj5sUM_CrPm59NcN5yA-1
Received: by mail-pl1-f197.google.com with SMTP id
 g20-20020a170902869400b0014002b0f5bcso6353655plo.18
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 12:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zj+Am4AZyndJH748Ly37KOSkK/B2qx2FzmN3ymN6P2U=;
 b=oEV9yDd1WH/wnxEYWMI6tjrFlYtweQJO+3KsUmBLQhlOeyqd4c0FIK33yE6JQsHzOd
 hrFQuVpfVQohtq4AQlSmiXPg2/8/DfG/ihoBavmKfYiCYnzAa05Xk21oR7Eia+AzB0iq
 k8bGxth/4ibpzf1XrSbro7u+Oi8suLT4ZwiIzJeYysv3YnPHGdxC+KrlBPmjc7MrmB01
 VF4B5nm2KJpTvGXmE9o0wc+XMEwduLZmDppKXkpeKAL/LXp+5MzQ1LdL42fZhXqrsofJ
 PO66WV4oB6R0LUSTFjJQF/ivVwc7B09xRiHKfwSDV7f6eZ5/gXsCpKAd01q/EgrFkLDM
 xVKA==
X-Gm-Message-State: AOAM530vFUrXQ4Tazpe90lFrGw8jGq4zIlqF3iglJhE/NsUFTCXOPYaO
 VUc2ItK9rokpNBp+HX3imJvwKDgyBwbrGsVCC0ysHQFxG+qTTDT2uAqR3tWNiyJjA5eqmqQukdD
 e2Z7/8pl+sH7T5B3tuSSraKb5aTMHJ1U=
X-Received: by 2002:a63:b204:: with SMTP id x4mr22762548pge.212.1635793647473; 
 Mon, 01 Nov 2021 12:07:27 -0700 (PDT)
X-Received: by 2002:a63:b204:: with SMTP id x4mr22762529pge.212.1635793647203; 
 Mon, 01 Nov 2021 12:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-5-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-5-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 16:07:01 -0300
Message-ID: <CAKJDGDZRxMnw-vEkCg7N=yVUY3myWqr=eT+PPMwDrU=bhw3+rw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] tests/acceptance: Share useful helpers from
 virtiofs_submounts test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Warner Losh <imp@bsdimp.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q8UhsnDg+ULD

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Move the useful has_cmd()/has_cmds() helpers from the virtiofs
> test to the avocado_qemu public class.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/avocado_qemu/__init__.py | 57 ++++++++++++++++++++++
>  tests/acceptance/virtiofs_submounts.py    | 59 +----------------------
>  2 files changed, 59 insertions(+), 57 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

