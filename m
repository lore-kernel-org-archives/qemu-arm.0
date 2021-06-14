Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2095069lff;
        Mon, 14 Jun 2021 08:56:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxh8ZG3XrJLJqo87LUC18HhJSK3ks+lNt4KM85O7opJem6EZRw0nCd9S/2pijJEVsHZLrG
X-Received: by 2002:ab0:2a0e:: with SMTP id o14mr12781459uar.39.1623686194466;
        Mon, 14 Jun 2021 08:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623686194; cv=none;
        d=google.com; s=arc-20160816;
        b=i9hpV7CkhfALaK3jLPaE6HLrnG33jDXzvt1SNuPr4muq8N7vwqzWrQtxtkl2TVp/mf
         Mi2W4utnumqHYBoJN3Qn8ALywKs6u/fh3VFRiYWgaXudC4KR65qdk3hsD0qiabcQs20h
         aY8IIaUFyoQ5lMQ3crnocJSMcmFykIYwV/GmVH2QmddHE5kRHo8ofvEPgkRISuhEovt5
         xTrvxo1pfUf7wgmdLU9RLWWsblQGko/macUfNyqvcM4zADsvXUJo6203w9PYZDsygEYJ
         3nktpfy94T8dm6RI0szIU9P2iRMUYY35HINqQUic3tjHXeoODIac0Jwuq3aPucgUj9iI
         LF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=moWVcNArRP6tVLSHyi7dwt6Flwee5Rg+lZnW6D+iDzQ=;
        b=ObJkWqtXv4KvRJ4XW6EyUeoU+X8S3+dm/3oNgblJ+UYD2cCPXCni/ItwVsKsRrrsL+
         589i9bcIvolvLY34siflzOZCCGlcvNweCzMeS2q/q3yUvYjk8RPNDN3eXfVxZycib8c1
         5h0buyDWfWJPsDdtz4sDhCemRkebVLXieoku2i84YP0TEFnlERjiyo0yKup3DP6quZlp
         Ju/4fCOTWzRB8nklANoXcszMI9690/CgIssILRTMy/Dp79nGK/oJGNBbjlCgx+VW8I6z
         ResJuKZU24wA1KSnwWrQBO7U2YVt064ORBB2kBMAKrdsyFTGCbLrrdQuqzIEim1qALsp
         IkVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w7yWfzQm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19si6714898uan.29.2021.06.14.08.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=w7yWfzQm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsowz-0007YX-PR
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsodR-0002Y8-AM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:36:21 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsodO-0005v2-Cj
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 11:36:20 -0400
Received: by mail-ed1-x534.google.com with SMTP id f5so42094807eds.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 08:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=moWVcNArRP6tVLSHyi7dwt6Flwee5Rg+lZnW6D+iDzQ=;
 b=w7yWfzQmf1ignhTPQcbPIhRPeWh7xlbjujkU86bBH34ULgOSl04CefIk7MqHctC+7D
 sJ87zBPfs6TiJJyzSUqFyN474ulSi4QfVrEYRxWL7BP8i/rECrxAu2d5IMvgXhfdK/pS
 UAq4pR+O6pWy/JsKI/gyOpcHi2aTR8eeUAmAyApJKZehkJ7m9sLDiNq+ZLn2JUOUjwCV
 H33m192qSOoaMyapcKFpshrHfo168yh+cW5KTR30lLJ3oAl/kwTrJoabWyCv7LrjFbD7
 LRuO+pwgPgCTKcerDX/zhv87BNR36mW++imXzQZyu76PMBDm0g5P3kRv4neSqFQMRfki
 164g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=moWVcNArRP6tVLSHyi7dwt6Flwee5Rg+lZnW6D+iDzQ=;
 b=DGVPdyrl/HwhBmGooSluEZZYfAqfdjEIyCjr2NXF34G/czPYBNP+4r3fx2Gn/hd9M9
 pmG8IgvSa4O4Uzb6zhsC9kJJe6BrR/E+0ZAEo5GHAgn2Mkt0C1HgP+Bbp2oju9ZT/8ps
 L3+7HAtlYTKO8gGgqIogLbsO0fomHdp0eCPbRm4SxCrPBCWJH2eLFMdUgn22mhxDme4F
 LM4t2hPAnMMrxC79V3pV9PJLEF1ZdsWBgGwtmKy7pdVoVSxzqbtxPyQZRJ9CCftUO7SI
 ouE30NHslohalq+b6Ab1FzaOGKg3LtMzr6g0PkAcb/nGn5uC6pTIoB5ytPXyouChVJES
 di6A==
X-Gm-Message-State: AOAM532ekGkgbHKbSozanZ9qLimZylc3YsZFpEb6sRaWgp4Sz+cIiVQQ
 4mqaW4nccd42iGEhIqMc9oIMkOkLW1w/Ke1+cfAr7Q==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr17521253edt.100.1623684976656; 
 Mon, 14 Jun 2021 08:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210610183500.54207-1-xypron.glpk@gmx.de>
 <87im2kzwj8.fsf@redhat.com>
In-Reply-To: <87im2kzwj8.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 16:35:42 +0100
Message-ID: <CAFEAcA-MUzrnKe=UzYHuMi16XBiRrkFFLWxKMF+1T3QFy7tEMA@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw: virt: consider hw_compat_6_0
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dENFz7d9kUyY

On Fri, 11 Jun 2021 at 08:32, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Thu, Jun 10 2021, Heinrich Schuchardt <xypron.glpk@gmx.de> wrote:
>
> > virt-6.0 must consider hw_compat_6_0.
> >
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > ---
> >  hw/arm/virt.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Oops, forgot that hunk.
>
> Fixes: da7e13c00b59 ("hw: add compat machines for 6.1")
>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>



Applied to target-arm.next, thanks.

-- PMM
