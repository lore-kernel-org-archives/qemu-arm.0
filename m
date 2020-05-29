Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp348855lfc;
        Fri, 29 May 2020 03:29:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz15yA88ubPZ7ouv/kjf/m9ThwSgVKlD2R2Afh8xQDuJXpjbpxIft7GVE2m+PXW5qwGPDWM
X-Received: by 2002:a25:ba81:: with SMTP id s1mr12540180ybg.114.1590748164377;
        Fri, 29 May 2020 03:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590748164; cv=none;
        d=google.com; s=arc-20160816;
        b=Ix4GINn65VhOmEQ+KAlmDKc7YVRwdaB2IDu1+VhXK9/jH/hV+jx2InLqremnaaH4+1
         IujPbvnnybAktWbS+xfdEc8GImJeCPexxM6PA3Fb2nsklD56cwyWqQqYYdCPfG2OzoKc
         KG5N6If/DOZ89BnHu2Ob/Io9jWK0SPdkoWjCzJN5FWI8pcoNGqatl6BFJcfm9wInQPy5
         Aqm5W373JAFFCgzuRXMCwsilRoS2q4fExuKs3V7Yf9raQ+i/ffzlJ8rwPiBrLXbUqC2n
         xYdfZpbz4J8CEw5Ciby7cE/aJnk8atgbVR1Lftn3C2SCATRkXvIi6N9+XyfwYnslcWP3
         Yt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OwQhexAqH28RpYFwFIoOCRJDk+PQALWmWutKQyXstaM=;
        b=gq7kNgbfPsgBTYG8TRqzgiF21g2vN9nA41mIof8tZIy4vG8XSxzo3l3OZ/mCwzBQv2
         UUjeHW1bC7sF6cSBtFlxSsMQMI//pq/iHCwtueXvD5PRZOsEQE7L/Vtu2mCmkhQC3lHo
         IxFshbor9a0sxYIXBhERordgPuIl+iuHV0GfXDhziqJGOfPPqn3RRKLKNLonhBuqzw4L
         aRzI24tL2KVD3zpuUmGn8GPDL+qBLqSF2ZELvua5O7xqdicvydycYt1aL2v2jVpEGNRs
         UO/3wFzeG8dXCfC4b5kOuhyGQPrXOyJ2gzLkf/oGamznhc2m6EpbJtcUTenfrTZkbgg3
         9QfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xaoTNXld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si7373592ybk.267.2020.05.29.03.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 May 2020 03:29:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=xaoTNXld;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jecGR-0003aw-Jn
	for alex.bennee@linaro.org; Fri, 29 May 2020 06:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jecGK-0003aE-9c
 for qemu-arm@nongnu.org; Fri, 29 May 2020 06:29:16 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:40077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jecGI-000262-6I
 for qemu-arm@nongnu.org; Fri, 29 May 2020 06:29:16 -0400
Received: by mail-oi1-x234.google.com with SMTP id v128so2125278oia.7
 for <qemu-arm@nongnu.org>; Fri, 29 May 2020 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OwQhexAqH28RpYFwFIoOCRJDk+PQALWmWutKQyXstaM=;
 b=xaoTNXldeeu22OPNodXo23pnWLR4aa4GWe7uOnsovO2xN4AniOJXOFRMJ94zqxp29l
 pqugCZRhvy+q60Jkuea/M0r2/WhGYXYp6nwFPOZR8YqfeIt9PQH73Z3af7VLda6CZDSW
 gIT2ByrvePzNJb7qEOT7FE1j0ZucZ2aW0BRM9cwUJC6o6aLH+D52LY3IX/hzqQVhwdnO
 UOzUeT7NcAQeOPSqh9xg41S1djhWIANcewcXdY8hzWrfPR4H//D3iCpJfRQsSufnfIAk
 2GMx4P92ik9KTnIG5i1QDF+JtH2k8VSqXo9qnwufnQUnRXRkEOlBBvrKdN9uiEUM2pZW
 0Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OwQhexAqH28RpYFwFIoOCRJDk+PQALWmWutKQyXstaM=;
 b=eHy76MguHpHostwhOKJZ7KZHyAN03UyUuK9BfdLQqb/PhWCOZ/9YLPxzSaz5xd9fYC
 XtnfzQq6AtQaA37wT+0HapoHmHkjQ4Y1eNzMGGFASiZvUphdofXoJUEzlk9+y9pztbYz
 NoTNgz9pnb8P+Bm3r33fvIvguSp2e8Bbj9XVqwQz9Cublm8K8jt5IXpKN9Dza35A2H1W
 sxdfkv43af8YxOASwdzC4OV4aDwGIzvncmHRKog0xuk4eaKH4DG+QpIYGANpy+Sb9LYH
 IfkKZLenrmZcerP0hkWAsU1WG9zWWBPAhNeoE1bpJCGgcI4FgwoiZT5qOeYes6qNkPrX
 LCxg==
X-Gm-Message-State: AOAM530wjoh6LL0oy8IYNlmcVHtc0FS9JRM9hxan+21/FA7x8TY4C67s
 GRPMJdpqipJgBBJuFITffmW/OnTiJYT+ZIDkq7TFUQ==
X-Received: by 2002:a54:469a:: with SMTP id k26mr5179512oic.163.1590748152733; 
 Fri, 29 May 2020 03:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200528123609.27362-1-kraxel@redhat.com>
In-Reply-To: <20200528123609.27362-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 May 2020 11:29:02 +0100
Message-ID: <CAFEAcA98OyyyC6gs34e3U03=dXz8GkDn5qf38UaO_XBB679V+g@mail.gmail.com>
Subject: Re: [PULL 00/21] Vga 20200528 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: USpPCsWsQqtg

On Thu, 28 May 2020 at 13:36, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 06539ebc76b8625587aa78d646a9d8d5fddf84f3:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-hw-next-20200526' into staging (2020-05-26 20:25:06 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20200528-pull-request
>
> for you to fetch changes up to fa0013a1bc5f6011a1017e0e655740403e5555d9:
>
>   sm501: Remove obsolete changelog and todo comment (2020-05-28 11:38:57 +0200)
>
> ----------------------------------------------------------------
> hw/dispaly/sm501: bugfixes, add sanity checks.
> hw/display: use tracepoints, misc cleanups.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.1
for any user-visible changes.

Could somebody send a followup patch to fix the indentation
error checkpatch notices, please?

5/21 Checking commit 97f369f2479d (hw/display/cirrus_vga: Use
qemu_log_mask(ERROR) instead of debug printf)
ERROR: suspect code indent for conditional statements (16, 12)
#34: FILE: hw/display/cirrus_vga.c:1038:
                if (s->cirrus_blt_pixelwidth > 2) {
+            qemu_log_mask(LOG_GUEST_ERROR,

-- PMM
