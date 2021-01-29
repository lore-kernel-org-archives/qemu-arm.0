Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1064836lfo;
        Fri, 29 Jan 2021 04:02:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4SSmRQtXgOVMuNig+Ys3/BmAotmaeV5i6xQ7TDvmiKur3CI5GmZD/VNWH+PGKiX8Avbdg
X-Received: by 2002:a25:ce4b:: with SMTP id x72mr6871042ybe.237.1611921751496;
        Fri, 29 Jan 2021 04:02:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611921751; cv=none;
        d=google.com; s=arc-20160816;
        b=tTK+G0yVkVmlRyEn/VXW90cisYIJvSs01bPSBHdAKpMwYeyGD1c95WG9xXFf4uQOTX
         Q1YWstvrufS1MNpGE8meqBjwjYnYpCpu/rZZRDL2Y6lr/jXulpGXIjgTVyi4Dx9cRROm
         Y0x8AgxTs4bw+l+8SS3djCxyQRGMRD7+fvf4j40EAk+bZnS+0zzd9W745Dijko+OlcY7
         L/8wO8A8INTx3eCjf0r9WNcKn6SfKis+pKOakm0zNMZ1OwgrknnnyaBCRGmjnV1iqY+t
         rHbDwvvRCC+h1A7kvENpKlmw6t5jkQZ/9Mvpy2c9VsVXu+KP5n4mIurrC2Dc85LzJYss
         F2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZJP1TTfy2iOvpEi6sOsJbistrzDMWyxr83a9LBx14g=;
        b=lRnqCRNxOWkkIGwCYipSExb8L1Kp3l1zB9fh1WGgIfSVD5hFs9UB1Rvu5zxFldG8Ja
         IFzvb+Yq2Uj+huMECBoYZvSVY7T1eMT8tE/LlWn1B5Mt6gY4Ejy2v1f7tTbfbJuqvgGq
         Dx+IEiUmIKXuj77rC3Fl5TnPlpZinysAw4aggomTCoPwA01Y8hk3ae2P7FW9d7bK51Ht
         B6+RNFl9WuJD3BkzLdIKlfi5UCco0m3OcjW0+fLxQ8zm2iQBFjNPVCv7tB/LdoPxVJ3/
         ZOh4GxOfHcX0DN3ZjSXS19MIj4vjBcDSWTRdHkkJhjcrjsT9KaSSiZ4QETDfcS2ZdDXJ
         Ln8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYE2dReq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si7960368ybm.126.2021.01.29.04.02.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 04:02:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FYE2dReq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5STu-0004am-KS
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 07:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5STa-0004ZS-PS
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 07:02:10 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5STW-0007fi-Vh
 for qemu-arm@nongnu.org; Fri, 29 Jan 2021 07:02:09 -0500
Received: by mail-ej1-x62c.google.com with SMTP id kg20so12631918ejc.4
 for <qemu-arm@nongnu.org>; Fri, 29 Jan 2021 04:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QZJP1TTfy2iOvpEi6sOsJbistrzDMWyxr83a9LBx14g=;
 b=FYE2dReq777MZIF9ywJbGKaIPUXzo+GntLXRYR6F8SUhLgfX4eL7XQDSvAacPqXbKP
 kXMwDO0VEq/+OBMyouvxkHmrCrkAEnGbCwK1ent362TtXjWEIK3Tzlxeq7Tiy2HNe9Wh
 xWgk3Zrqy3AIvAREIw6yIkrKSBcB5uC7LW/SQJ1yQP0/1i9BlERVXrP/E4c3uIb5tDGB
 LAuXJHBW2AYLOXwWh9rW4Z3Mfz/ZE0CahotoECyut81EkR5F/fe0E1xHSafOT1vXUMz0
 Ah4O4C5qSPWaRaFm3glT6rHiPhJrWv+zWVpWvYkpjh/iXOzljp/u1h6iMr3NlH5tN9lS
 f6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QZJP1TTfy2iOvpEi6sOsJbistrzDMWyxr83a9LBx14g=;
 b=HElJo8dyonNpyvFyB5O7AOOxXVyegu5PqKF1EkCufj5nJ3J7Hd5lbwoN/Jn0HvbbKy
 uRxxa+yPGpTK5ddcPMBPnprirkL8HAMpSGZpTz9lEqOISgE3MRZDuVVuGiTw6SfpH2Tu
 Eprs9oaIDid1HQ1BEIrD1K8WH+bMWUh3McvIzpjN4y5RDG8exjUwWxIY/cMB/Z/BsAeo
 qbxkL9kdDhYZMl2SgHVYd48Vi4od3iDKSggjg5K83Kc/VreqaYgc+QxYLvHq+rRv9r9G
 Rj3ba+kjeKUZI4Osm7J+JyGvZ+rbyM++XL+K3Eq/ZPdb9qV+gv/DEsfBjEdBlhktzy2K
 0wdA==
X-Gm-Message-State: AOAM532xevWBiot9c5AqLf8ajUx/gAAENKW0rMUxUJETFckPKeraIGkZ
 mtjurWWpyL5kCgQkQZ783TMkJgHLUiMeUJoqBjgYKA==
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr4241344ejc.482.1611921725215; 
 Fri, 29 Jan 2021 04:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20210129081519.3848145-1-armbru@redhat.com>
In-Reply-To: <20210129081519.3848145-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jan 2021 12:01:53 +0000
Message-ID: <CAFEAcA_O=48U_3p_mKeRRY99OsJCRSTJmOefDT1gbHVdyE_C0A@mail.gmail.com>
Subject: Re: [PATCH RFC 0/1] QOM type names and QAPI
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe DUBOIS <jcd@tribudubois.net>,
 Qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OxTvsTPYAG12

On Fri, 29 Jan 2021 at 08:15, Markus Armbruster <armbru@redhat.com> wrote:
> 2. We have some 550 type names containing '.'.  QAPI's naming rules
>    could be relaxed to accept '.', but keyval_parse()'s can't.
>
>    Aside: I wish keyval_parse() would use '/' instead of '.', but it's
>    designed to be compatible to the block layer's existing use of
>    dotted keys (shoehorned into QemuOpts).

> Of the type names containing '.' or '+'[**], 293 are CPUs, 107 are
> machines, and 150 are something else.  48 of them can be plugged with
> -device, all s390x or spapr CPUs.
>
> Can we get rid of '.'?

On this one, my vote would be "no". "Versioned machine names
include the QEMU version number" is pretty well entrenched,
and requiring users to remember that when they want version 4.2
they need to remember some other way of writing it than "4.2"
seems rather unfriendly. And 550 uses of '.' is a lot.

thanks
-- PMM
