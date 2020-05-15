Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp365432lfb;
        Fri, 15 May 2020 03:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHLiNkriu0NcomPY75CWC0Npe1m73MSHIKZzRZrs+h+wCoTjJb+m0XN0ZaAtDT5JJpPcv1
X-Received: by 2002:a05:620a:7c1:: with SMTP id 1mr2607323qkb.227.1589538252387;
        Fri, 15 May 2020 03:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589538252; cv=none;
        d=google.com; s=arc-20160816;
        b=pe3E8d98+9d+mlcvq44AjQ/R4gKajAveoZwN2vx6/7L9njiTZO9SOudQ9bjMZNjeXn
         ujUnABzN4TzgKRP/1SyZJcWPYbA0cYhFJjuDNQjyE3xUpgOoj/rRWO1VTQgQD39oZzCg
         KuGRZzpaa9nEMoRVSdWA3cu3ie8I/Ufy0OJWPoAcXC9jxo34uQOPhp8ia/0jBMlcyUTJ
         8nU4n3zEnzkyiMDnSTo68Xa3P6zMpbtipiLb3KX4N6kF/RGYU3kdAywezqTZrzFg6Y2M
         1Y7msdsU00wf5EaeDxAhiz0lVs8JCOJjiU2xndaQXh4iboNkkYvh5oO6spxHLmkIjmcf
         trfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=I+CVRVNoW6KiRzqyNKlO+Y9DXrgjEYbM8n9WCNzSQAw=;
        b=BAFf95oqTVFjtalvzHfFwOF24SXjS7nGAa/6Sz9IGwP8sjVR9ghuHWTIBywqm1/om1
         lb3v55qS9h4ezOZkIXzMU7YcQiI2+qvaa/fCQ6vmJvWKLjxokQ1zkLph7v0Y6atEBG6v
         /ayVRkNwWxrMD0dPo/Hu7Grj2MG/sOiq6x8hc9SHRj4R2IZdccBYPQR101jTAlNEHMJf
         E9npMQoe9jEtadk0hzKHTV09rt/mXEQky7sKhr60TCD/6ocUhbc5HVhj6TbWbf/xGdQ3
         VyUiUWmvTR5fyG4sPI8ekaZYmc4L+JgpWBn+E+2CEU8/3zh7Av6Q7odBhP2v1eOasUXS
         Pcew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwKN1W3q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si717514qvb.77.2020.05.15.03.24.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 May 2020 03:24:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CwKN1W3q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jZXVj-0006n3-OH
	for alex.bennee@linaro.org; Fri, 15 May 2020 06:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZXV5-00062S-FI
 for qemu-arm@nongnu.org; Fri, 15 May 2020 06:23:31 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jZXV3-0005Ar-K1
 for qemu-arm@nongnu.org; Fri, 15 May 2020 06:23:31 -0400
Received: by mail-ot1-x343.google.com with SMTP id d26so1483496otc.7
 for <qemu-arm@nongnu.org>; Fri, 15 May 2020 03:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I+CVRVNoW6KiRzqyNKlO+Y9DXrgjEYbM8n9WCNzSQAw=;
 b=CwKN1W3qrJJ2mYq9rICOdl3QWYXeLY4i6/AfG+ggRxMMe2m9TkqIhR/Q25pUViYBF5
 82VdByNWZlUSgx+xZ5Lru3NVIE7q9ZZkYK5T2FbM1Ah7Eqp8FU2NSxNRrcQ+5T6/w95H
 R7egQcI44zNHLo1ou8h4cxX6SeiA+RYyi1iyjeR7WMtlMykZ0f0xo1hvLZ3gFAosiC9i
 z46l/cIHnMWr/G/m0SG7vPX4jwysS1Zf9bA4JIEobjvofWUFDVbMm4e4DNepvfh18/ZS
 F4igSp9NQR/akkRye5ZbIhmrMgoeroj7P2Mbwb6HuloSGCKvOlfVV0+YdgEQT8SCsBQI
 r2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I+CVRVNoW6KiRzqyNKlO+Y9DXrgjEYbM8n9WCNzSQAw=;
 b=drfTqe9f+0AC1xcZkiJwc+JBJgJvFvhdj2OQqK36AF+QO/2a+tuBEPYXFl11zztJAe
 VM/xsFBl+vOrkmHtENUvuCLy0NZ5xELRCFJkDbfJcqpdqZDeK8yrC4GIA9Ow4hsa8Xix
 3shii5a01gxeFnb/2rjE3jwUjkMfTfGRwpZyKaAuC98TpKPRb18yRDSoEZBf7g6x0PM0
 wl8Duz1/6QjGJiBb7N2X/D95YfMoBOUw+UiC5Ev52u/dIRdGX9rp6cQ7SwZOZN2NfHu7
 es6SEzP3r05d2AvGG/cQlCd7QTeKj8KmHYH6t8FnU9OYcP09VYi8bxgD8wwKJpmePSNm
 DwOA==
X-Gm-Message-State: AOAM530ZoVmJ2ZqZ9r123q8Rm22ZAHTfvwkYVVOWw+oeUr9V8yqE0mx+
 l7R5JAULlnbLA+dPGxO/YO3EaksA8CEpxtG5g9fgNg==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr1677156otj.91.1589538208134; 
 Fri, 15 May 2020 03:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <CAFEAcA_p1x6S10yswHgOkMd=KrxcTGh9TD47+k1LRKM0xy5x+Q@mail.gmail.com>
 <567755c6-3bb1-b16e-af26-431dec4616ba@redhat.com>
 <CAFEAcA-67uGcwSu7mJ+w26xYqpTm4C0t3Yrr8gWCsA1VtHeaLg@mail.gmail.com>
 <49f4fc6f-329b-9afc-92db-c59dd1ce67ea@redhat.com>
In-Reply-To: <49f4fc6f-329b-9afc-92db-c59dd1ce67ea@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 May 2020 11:23:17 +0100
Message-ID: <CAFEAcA93bQOh12CPS8xp9Qc45YrPTVSLo6yQ6raQ0WitHR184A@mail.gmail.com>
Subject: Re: [PATCH 0/5] docs/system: Document some arm board models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h/P3fCkXVHy0

On Fri, 15 May 2020 at 10:05, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Sphinx consumes docs/system/$arch/$machine.rst files committed to the
> repository, and we don't need to build various qemu-system-arch to
> generate the documentation.
>
> If you work on a particular board, you might end up only building its
> corresponding qemu-system-ARCH. Maybe we can add an extra-pass once a
> binary is linked, and re-generate the docs/system/ARCH/$machine.rst
> files, so if you modified a board and its documentation placeholder in
> the code, when commiting your code change, you also have to commit the
> rst changes.

I'm not a huge fan of committing generated files to source control...
I think I'd prefer an approach that worked via some kind of
kerneldoc comments that we pull out and parse using the Sphinx
plugin we have for that. (There's more complication than that
but roughly I think that would be the kind of approach I'd like
to see.)

thanks
-- PMM
