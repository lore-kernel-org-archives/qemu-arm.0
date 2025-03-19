Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp123736njc;
        Wed, 19 Mar 2025 03:18:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2QXVDAWMhkkrbVkN7p9rvK0wjEGX/ur+Djo35qeXyInHCn4KwQ+KSz49wL5lzkm8C6e2EzaIvEvGnLg==@linaro.org
X-Google-Smtp-Source: AGHT+IGe5EY2ySqvZaYTIAXhHG/IUVIbHw2HYWLSsoheOjUcKbQFOUnAMv3R4Pw9R8MeO+Y5B8fH
X-Received: by 2002:ad4:5d4a:0:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6eb294194e2mr27447126d6.40.1742379535082;
        Wed, 19 Mar 2025 03:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742379535; cv=none;
        d=google.com; s=arc-20240605;
        b=G9QMDCYxrZlUk4aIkTi+Abyq/t6fVy/qKGmoVN3GTc3UCHI6aOezsTX3bFPP039PmM
         lBUdp9Vgll72uyYiChXDcZ/TLAFOoWTADAUAiILzhqUyFlAi693Ih2fqGNWbVDnF/uD6
         Xv/RmrPeDgkd5erfMkVE0MHkp5GVF+jEAqDZYbGtEGdS2envsm9O36pCRYL8+ECYEHuV
         OZNqwFpUIMjBMOgUyJ9+5fGP9DtswmDBuQPKqtReeDAyQ+g6zYcedZhbySD04WEM/rY2
         i1marnZ58MIrBJb6B183N6oU9UqvbqYnY96yccNi2ATF2rxZ3ftgxP4B7BLyjgg87O8L
         f9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=NCh+MqeE19DqyiZ5qyOGqsIvmjuez28QeAt6LJMyB5w=;
        fh=isTWT1DcunJWk9/C8wCZlnvyKjjsb0K969rdZF/qC60=;
        b=hnG6b9Lp7ikmrApqBMACEXGDYfvfOM6bbjt6V3eOZaThaiQAxExZ3cSViIKMDTq2hr
         R9S5vuMtwbtCY8NcvKsL2ug+EsKgrT9k9WVwtCmW7tubPpD9nkPb5HnKzpwXo/nEtsmd
         8GLxxOsgPvLg8gOXFjwHCETBpJdnVwDgV9iyr/Av1WQ8DtAXzbzMGKT8+++i9FNQilto
         yTZVZjBuP2Ooud33RlpfbywOuajjxRKWxahJk04pQ/bR3ENSsY+0EnsXvzE3aKDvOhdy
         nK5HdobQEYXA83dC9noLXL8Yq4eUdH27v5VqU/lunJqEfyfyFs9lNrTH6HFG4j0xHZkT
         VHXQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OeNJVLx9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade36f542si135717686d6.450.2025.03.19.03.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Mar 2025 03:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OeNJVLx9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tuqVP-00071n-BE; Wed, 19 Mar 2025 06:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuqVJ-0006xI-16
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 06:18:30 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tuqVD-0003PO-1I
 for qemu-arm@nongnu.org; Wed, 19 Mar 2025 06:18:28 -0400
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-e637edaa652so5044203276.1
 for <qemu-arm@nongnu.org>; Wed, 19 Mar 2025 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742379500; x=1742984300; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NCh+MqeE19DqyiZ5qyOGqsIvmjuez28QeAt6LJMyB5w=;
 b=OeNJVLx9Ql3xVL4FIrzQUCfmcLGRF9AeZyopMsA8ZUbGCV1Rj3bvI3mfHoSHnJSlZx
 435J8owWdgC/UEuqpDe8FluScLSIRM+AsWrLVjwFqIez/lzBW5ZLqx4w6MWGcSLoTpk/
 9Q2TrhUeZ6uRm6QY/49mbxrx+H1P3kTZco0eJRRnKUIF9HaoferaPNA2UZP/1wCqBNok
 mlhyx3rBiICJeURckZPHWJk0Y9PhPJNiIOoll1upZqB1v85sUwrPxCGW191M6oKp1Do2
 jQLqrsMtxe0tai7pi3YOtx1aLQGa+j5Ey6eAGbtFtoba8dY6snMUYiqyQ7ggIC/pgXme
 ef4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742379500; x=1742984300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NCh+MqeE19DqyiZ5qyOGqsIvmjuez28QeAt6LJMyB5w=;
 b=ET9dfJS25I2uqoGjBEc/YOz3jn97lcuVrJrxbMPuSvi+HYx8WT/gfQNtsHYoC3bTNC
 D5xn35XQjUGdpm8RXRqxQu/8EpxUPDENEwOEQLn+oTemh4rvFghRU558YNy4HgReYADc
 PECrKcH3nlvBIE6ci1nUA3d7BjuhsDpLYnyaP1QhJgyl18Z8/8kizXb9NogQyhuOJ7Ea
 ysaUsRUpORzFcm5jYjYbukYQ6jwmIapHnlrROV9iuvNqouz1lbf3xAZSBfhYrXaD89kx
 PLgedehT4o1juaJaafFew9DrBINMkpAfa+jB0mMRMwN0k5H+XPDlsQR2TXe3+oJVOptj
 u7Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXweq0OZTkjFG6Zuy0V2sy5lx2NGjzrncmDionjI/Vj+edxnV820hziGXNntc3rgcMjwjCspNS6Dw==@nongnu.org
X-Gm-Message-State: AOJu0YwmXek5dIXZyRAZDlggP0LddgCjVzdnUAjRt+C+Fi/e7CiNGdCB
 CkDe/7/QtiVMVdnTcWKCnTgmbFUtqOKikB4VUS0TP2Ta5zMSQF3cEWirPVxPTdiNQS5tDuArMg0
 4PoNX7oUDutDqPmyDNmYTiyAfkGo0WA6ve37ZNA==
X-Gm-Gg: ASbGnctYtQNAsCAjes1BKx0iO9eAMj2FrgzU2G7YuE5fqKf5DAtWAKztGre7CDDMO6B
 WkfyHSvGVFOzI4QCLdZrywDLFzBJFAXPgAkmdf2SDamrEWMH50FvagmYzJTnZp6bMzOFOZrgx0a
 dBNCATgzm8+cOp4EY4DelyYEIe5e8=
X-Received: by 2002:a05:6902:18d0:b0:e60:8e25:f0fb with SMTP id
 3f1490d57ef6-e667b3c7ce2mr2552162276.16.1742379499752; Wed, 19 Mar 2025
 03:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250304124815.591749-1-kraxel@redhat.com>
 <20250304124815.591749-15-kraxel@redhat.com>
 <CAFEAcA9_rb321OBOfv9v84ZLO7aw_8t8pTDMUYxj2SNnSBfRmg@mail.gmail.com>
 <wcpg5idrxwq6fntknc4vubnzaeqqqgqbpo5rdiqhumk745hsu5@tofolnd6v4dt>
In-Reply-To: <wcpg5idrxwq6fntknc4vubnzaeqqqgqbpo5rdiqhumk745hsu5@tofolnd6v4dt>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Mar 2025 10:18:08 +0000
X-Gm-Features: AQ5f1JpUf1mnXqZZWg_nCoV1yenUNRYWCpbIRe3JApjYoLdY-gZVJsE_lKV6JmM
Message-ID: <CAFEAcA_MbaZjv9R0YjfHNuAqqMsHBm3-AeqnVp7w8hTHFMpz5w@mail.gmail.com>
Subject: Re: [PULL 14/24] hw/uefi: add var-service-json.c + qapi for NV vars.
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, 
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yHYHjg9UvVzS

On Wed, 19 Mar 2025 at 08:29, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > Hi; Coverity points out some problems in this code
> > (CID 1593154, 1593157):
>
> I'll send fixes later today.
>
> > Do we absolutely need to be operating on a continuously open
> > filedescriptor here rather than a filename? If we could make
> > these functions use uv->jsonfile each time then we could use
> > the glib functions g_file_get_contents() and
> > g_file_set_contents(), which get all the pesky details of the
> > error handling right for you.
>
> qemu_create() works only once in case libvirt hands us a
> file handle instead of a filename.

If we have to work on a filehandle, we have the problem
that if the host crashes after the ftruncate() and
before the write() of the new data then we just lost
the contents of the var store. Working on filenames
would let us do "write new file and then rename in to
position". If you need to try to operate on a filehandle
in a "don't lose the data for crashes mid-write" that
gets tricky. Do we care ?

-- PMM
