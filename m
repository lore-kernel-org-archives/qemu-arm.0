Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4004638lfg;
        Mon, 29 Mar 2021 14:05:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz45rnJTL7n4dlb/oqsE3ZqhzOF0MTeWOvcbCrZqbl02tJWPTjSyucz+PeygWNC1Kv/PQcY
X-Received: by 2002:a5e:990f:: with SMTP id t15mr14601121ioj.180.1617051935419;
        Mon, 29 Mar 2021 14:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617051935; cv=none;
        d=google.com; s=arc-20160816;
        b=lmEZ1wJ1xNPs/r/FAHNDpfS4lhxPbEQbGkRLriyMSSfvO3HmjnDCGATbl87XN0IXbk
         rfNIZH8eUGN5E4K6z81fdgarNRu4c7/bHt2psP5NOHGasAEs5aQZR4CnPa+FBKmFZcml
         LMThLAJfLUr/PneDoUoqSi7i50vPl6oeBcqZ3ROlJNrrqB4fpUhc5iEeO57aP2Svi/eQ
         8dzs8MYoYxx/jYpZ5nw7kvOchAuVIyQ1njn8lswrd4rEYWc+tBNc0U4qeCHl/OrELyEj
         6kqHXrr9RNpe8PDYyKVplFqsGSmZRMTUn8bbqGvvFu6NZaNEQt+Lc5nNd+lbXTla2DHI
         NewA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkjCKrgwLWR6YRViltSxKNkGUgKZ6V1+usGQPPX6UAk=;
        b=KaLK8kNQUv/z6cwhCvo/h1G15Ea5aFGrxPQyp6hF4vac0z1BHOfNixbBmf/bjfgTYR
         NOc3VtoKN3DhS693iTk5lcUiXS45mjoUB3UuGjNRby6iy23pF7ftf7A7EwfKlmLxf0ch
         hx0LoHfWV1/SCjZypgU9uzZmU9M5nbzAGTEu1f+NmRQ9Q0RtD3b+WQSmg4Yc/DBqGv9h
         0Fpt2bHHytecru2/Eyez4CfF6EJPz0uWRG6TmJjGoPOB25vPtvek1CSO/FgsqInRzaSQ
         LcHD4tC05YcwSFDwNQ/Rqgew4zx7RH+aKjjHOWPVg8pQskuTac+hzffESwyQc5mYRsjO
         kznQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J+FjDZNV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16si14960046jam.51.2021.03.29.14.05.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Mar 2021 14:05:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J+FjDZNV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQz4o-00005S-Nc
	for alex.bennee@linaro.org; Mon, 29 Mar 2021 17:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQz4e-00005E-5H
 for qemu-arm@nongnu.org; Mon, 29 Mar 2021 17:05:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQz4c-0001Yp-Ew
 for qemu-arm@nongnu.org; Mon, 29 Mar 2021 17:05:23 -0400
Received: by mail-ed1-x533.google.com with SMTP id z1so15762028edb.8
 for <qemu-arm@nongnu.org>; Mon, 29 Mar 2021 14:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkjCKrgwLWR6YRViltSxKNkGUgKZ6V1+usGQPPX6UAk=;
 b=J+FjDZNVuyNeoGIh0BgmYg+9FKnJFvb1nUmVwlF8fFDrfcpUoNkxGbZsadUQR5wOJJ
 /5FzpVKpOXmTMhPHWocxBZCM5iwBRcbv8YlKcRGZphuI3Ki8CafxVNUzVd1Ku7LbzErh
 2EBjtzBbnRgV3jdRuIAzX6ea2uie8Yh7hbZoPj5L7Cr/feFyqME1GSuPF3drekCuCOJL
 eQ9VYD+BAvbJSYwea336/Rj66yblDypXIvYGLAu3KuxdPGVTJcjHlhWS0qE4Mr4r4AK/
 5I4qO02nVZUYpGwXtGSNbzDAP/8wgMHDrgz2S8S3LBrg39H1gHVnALFWEaPARkEjhHWJ
 9ZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkjCKrgwLWR6YRViltSxKNkGUgKZ6V1+usGQPPX6UAk=;
 b=LzdlZQTyorM7/emaNMN7XwRfuikSG9pMA4P39jOta51ebul76F/wWY04pVR9qxaDJR
 9i8U1R+R77K/sQOQUFtBqkysGhBmHBtUDQDzGZ7xPN3jEEtaT9BNSyJH/1e4XD+QZv5z
 VqkbQLIuKgs3DIB/fvene2ElM3Z4chZOTzZywJFpd8C6rpgFFzmgTKFNJPG3Ckkx99Mp
 4O8bMzI+YlNFRQD5heIvEiv0TZ4Zbpvg8jln8tim8Ueut3Zv+9Chjwlrrso/wg4IGA4J
 lp+gqjivf4bvqmJiIIuqIvXC3kMYsLnvIMq5pnz19urhJ7wRYwGGP6AG7yN/7dMluA/F
 a6sQ==
X-Gm-Message-State: AOAM533xa9tul3SDfHM1yu8c69YuTmhK1hbn5+BtO7bCNnTKaJoYRCbE
 dJL5+84HMZ8E1h40rw1jRCVugQZOuTaRNT8UQutzxQ==
X-Received: by 2002:aa7:c804:: with SMTP id a4mr29774552edt.251.1617051920867; 
 Mon, 29 Mar 2021 14:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
In-Reply-To: <CAJoBWHx5DM=zhj10j1ai5T_LO9ScAhFzUezuhGu6a73vn=4_Rg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 21:04:50 +0000
Message-ID: <CAFEAcA8KCJTwsb2YYoU3d_PbO=KW_ytSJXHLZZTkukVX6YzCPQ@mail.gmail.com>
Subject: Re: AUTIA authentication sometimes fails
To: Derrick McKee <derrick.mckee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "open list:ARM" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /9E63KUHx21+

On Mon, 29 Mar 2021 at 21:07, Derrick McKee <derrick.mckee@gmail.com> wrote:
>
> Hi,
>
> I am running across a scenario where a PAC signed code pointer (using
> pacia) sometimes does not successfully authenticate despite the signed
> pointer and the salt used to sign the pointer are correctly given to a
> autia instruction.  Only one particular pointer fails, while others
> are correctly authenticated.  Unfortunately, I can't provide a simple
> use case, because the behavior is part of a running kernel, and all
> the pointers involved are kernel space pointers.  An example of what I
> am seeing (not guaranteeing correct assembly, just a gist):
>
> mov x9, 0xffff800009200000
> mov x10, 0x20001
> pacia x9, x10  // x9 contains 0xff90800009200000
> ...
> mov x9, 0xff90800009200000
> mov x10 0x20001
> autia x9, x10  // x9 contains invalid pointer
>
> However, this same code with different pointer values correctly
> authenticate.  Is there something specific about the kernel and PAC
> authentication that I am missing?  Thanks.

cc'ing Richard, but I suspect you'll need to provide more detail...

thanks
-- PMM
