Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp179780lfb;
        Thu, 31 Mar 2022 08:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyv9nBkTAvfRIg/2KU5Nep2lteLSXwHOFE8qBLCyzSY1zJpm+Pj8WS+a1jepbylb2MddcsK
X-Received: by 2002:a05:6902:51:b0:61e:1a26:3243 with SMTP id m17-20020a056902005100b0061e1a263243mr4316118ybh.57.1648741667368;
        Thu, 31 Mar 2022 08:47:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648741667; cv=none;
        d=google.com; s=arc-20160816;
        b=yGa1hyYWsSz/9CWgZzkC4zE8wSUI1+OdfjumKGfdHtjHlqTFVOeHKoV7a/TSg71grB
         hUJMiSnm8Ya62MdZLLHbvpF1n2Tcv3WecOGhq/3HEBNmrru9FTykFG1s9BIT97S9lMtn
         nD6II0YgQUYq6QNNEzwcrd7AY803UeQXmOX2NEAgmoJd5CjsV+ELnM8T0NZP/T8lcbEg
         5wZLALdpJTq/VavOmy70OBOWiMMv4wqjwDoBNY7mx6v6gaPV79GCw+sARIrB4OXuvkKf
         Bk/BdYickawcT4pSyMGEakNSHSg7wRKYXTNmEJOvBllxjckQr8LNwDOPoOweRl/SS5FV
         bGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=URLASE+7HN2zOU7ZU7HaqMoPaeFp3IAOi0E+Q4EVzyM=;
        b=BAYeELPaRAE3quylws00v2eONQcArtQLU0hYKhNhcNzWEBo/UeVLviU64/P7ReaSvJ
         G5Ccihh906bSObVg5PB9cxsr2tU8A6TL1ukp9YdG/+/SIiF6O8em71HDBNB1kLqua1hj
         4pcLjhOWu75G3wl1tT+fNE5rRUu7B0H4aBvCCPKdrkQyxCFZw9A7kUMT1qqqvu/jUU1n
         iQYxbYDSCooBNF9PehFDR3rIkNEAiZFGFpL19WiNdexIPkncWE4INKsV1cVafxQIjlec
         pYmv8EVNEz+FLLBRgXq1LFocd95S+pBo8RkeTMzjL5QwygEq/5w78QPVOw82JqF/cgNW
         fxRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PHGgccof;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193-20020a2513ca000000b00633d045c3bdsi95412ybt.660.2022.03.31.08.47.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 08:47:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PHGgccof;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZx1W-0007lC-PK
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 11:47:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nZwzz-0006LT-J8
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nZwzt-0001d5-AQ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648741561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=URLASE+7HN2zOU7ZU7HaqMoPaeFp3IAOi0E+Q4EVzyM=;
 b=PHGgccof12lAqbXggguUTTJqN5Fb6iWMEsedis/eW7nacXH6rzy/IZpZ7wb/V5h1moxKQ/
 0l++Nwf7RajzuCcBFoUjQNvI63k1baI6w3z1avA0z72cM+cmiiEQhRi7VMy6e1Lfq/twM4
 fTreMbU1mHFAvTRbuqja1WkMywyjKd0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-r8fKEGrvMHCQsXN7wbfeSw-1; Thu, 31 Mar 2022 11:46:00 -0400
X-MC-Unique: r8fKEGrvMHCQsXN7wbfeSw-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2e6402f436cso1934007b3.3
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=URLASE+7HN2zOU7ZU7HaqMoPaeFp3IAOi0E+Q4EVzyM=;
 b=W/8zbrVsOXK+PQrO16idL8XulNMjXIEbem7kFgDlXJB/6bms7VfdopGNszzjkDp9DB
 FtW+68f0pznEu4yA1GLhAqc00L4wjhLS+3QzhsPLol9jc59rmKNkXHtvx+S5bPac7qLG
 q5IgShwiczg9idQSMRlwm0Etqy3G6IYeVnXTV0MEj8MHxV8CZr5b41/a1DXIt2zW+33u
 hxkXvHnm10mD9NopzBEA6Sjp67xzQmgZ9M2T3vZWg43Qn5zdh+g5mQWPoCt/vtznFTIo
 TgiKecTQyiVZAJz7y/GLbzhfvxVhQhtmThNXZ3qx7LAurddR9soZq7lKMLoFyyq5IFmz
 rOkA==
X-Gm-Message-State: AOAM531ei/UCztHq7gwbnyBAzrfR4FggXbE+hQaN4xOh2vRX5p14SZxn
 Z0R4kOCXu1QvKl4bnLDkBdu8ZEd1craP5icomaEtS820vu9dr9Y5176XMyh/0WV7IfY7DXinPD1
 QmgwkM4mCjTcMLaMj8EPGygxpiCwRSCw=
X-Received: by 2002:a25:9010:0:b0:63c:ffd6:6f7c with SMTP id
 s16-20020a259010000000b0063cffd66f7cmr4412379ybl.87.1648741559730; 
 Thu, 31 Mar 2022 08:45:59 -0700 (PDT)
X-Received: by 2002:a25:9010:0:b0:63c:ffd6:6f7c with SMTP id
 s16-20020a259010000000b0063cffd66f7cmr4412355ybl.87.1648741559549; Thu, 31
 Mar 2022 08:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
 <20220328084717.367993-2-marcandre.lureau@redhat.com>
 <YkRHzqi0y/dA1Ptw@stefanha-x1.localdomain>
In-Reply-To: <YkRHzqi0y/dA1Ptw@stefanha-x1.localdomain>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 31 Mar 2022 19:45:48 +0400
Message-ID: <CAMxuvawDUbHkPwdgk8SnCFXe4mNDVRo5ah1BtQDGEsJjzNFDQw@mail.gmail.com>
Subject: Re: [PATCH 1/5] trace: fix compilation with lttng-ust >= 2.13
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Beniamino Galvani <b.galvani@gmail.com>,
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/WJiMG0eZYM

Hi

On Wed, Mar 30, 2022 at 4:06 PM Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
>
> On Mon, Mar 28, 2022 at 12:47:13PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > On Fedora 36, with lttng-ust 2.13.1, compilation fails with:
> >
> > In file included from trace/trace-ust-all.h:49085,
> >                  from trace/trace-ust-all.c:13:
> > /usr/include/lttng/tracepoint-event.h:67:10: error: #include expects "F=
ILENAME" or <FILENAME>
> >    67 | #include LTTNG_UST_TRACEPOINT_INCLUDE
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > In lttng-ust commit 41858e2b6e8 ("Fix: don't do macro expansion in
> > tracepoint file name") from 2012, starting from lttng-ust 2.1, the API
> > was changed to expect TRACEPOINT_INCLUDE to be defined as a string.
> >
> > In lttng-ust commit d2966b4b0b2 ("Remove TRACEPOINT_INCLUDE_FILE
> > macro"), in 2021, the compatibility macro was removed.
> >
> > Use the "new" API from 2012, and bump the version requirement to 2.1 to
> > fix compilation with >=3D 2.13.
> >
> > According to repology, all distributions we support have >=3D 2.1 (cent=
os
> > 8 has oldest with 2.8.1 afaict)
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  meson.build                              | 4 ++--
> >  scripts/tracetool/format/ust_events_h.py | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Thank you!
>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Given that there is a dependency bump, would you rather wait for 7.1
or do you think it should be included in 7.0? I think the latter
should be safe.

thanks

