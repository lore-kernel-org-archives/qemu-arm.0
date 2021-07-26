Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2951009lfc;
        Mon, 26 Jul 2021 08:01:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDP/30ZeYT+wAWK/epLxr4HP+o1qit7fwGU12V2QYUTVCiiE8rr9f0tBwBnT/OYT4zKOKe
X-Received: by 2002:ab0:64ca:: with SMTP id j10mr6370090uaq.89.1627311690119;
        Mon, 26 Jul 2021 08:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627311690; cv=none;
        d=google.com; s=arc-20160816;
        b=PI3sP91NqDETzj0Qi9AMaCk8bmxXX8izQSfxjwTuJIkMZ6L7gflCHKf7GFeGphv0fU
         eqV1s5uY8IHZ/sHgGiKz0cp13ympVJZZlxRW/blwJ46CHVa1hRU8CiQgIjL98xMwXJwZ
         6LJyMRCgVxckKI9arxkPcQaI1ci2m3H0cEC/50cNVuoS8uX/cZurDp3k8Bhm6SPlhtKG
         RbhSPI1u98vWou/Oq2U64QxRIGDEU9y+w693Iot1t9g3Unvpg6NWnauw4GPCVdpWx04Y
         XRIXUnNX+xywarY7KHiKHsqsGYx9GYX+mEkqaJR8n8Zk72cTIpXdzQGQS/nfodZ1aDfj
         e+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=bVEPeT2fAo+aTHVkGlK+mH5+bLtJzpS16QGQ1PU5LXY=;
        b=b+vCI+n4tP7GMAOPtUEdEgGEnn58o8JrYf0GKvNDKLcREy+ZW/QI67o8EUdtNM4K2i
         lMWcLKixs4QJzz3qkMe8jOiLMTY1AbWU+xArIab0b+ZvsD5w48pEQXYIPrm5aY1Qss/T
         JU9gOi75iLHu6t3arizBZJmUGUn1BVqoAUTxP6Qx5t4FQYeSbHru16W4muOFGbS0Coia
         d+j19Y5cnce3J44XtNxBqVxW0zpRu5/1OdUICJLKyc3yME3NYgExhl6C31eiiDVXeC1S
         30UksjxXwYvQo9I2WAY26ff1ipWl7Ha09lIPNeAzNKbW3seFAvzYONdN57CZFLiD5U3A
         05pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P0sHnRVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12si63186vsh.81.2021.07.26.08.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Jul 2021 08:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=P0sHnRVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m826j-0005Yu-EL
	for alex.bennee@linaro.org; Mon, 26 Jul 2021 11:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m826M-0005Uk-Gi
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 11:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1m826K-0000tt-Do
 for qemu-arm@nongnu.org; Mon, 26 Jul 2021 11:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bVEPeT2fAo+aTHVkGlK+mH5+bLtJzpS16QGQ1PU5LXY=;
 b=P0sHnRVtSv43AEiNWrv4Kq4yEnTbzQnjCkwuN1dUF0qM1fXpyCeiWc1n60/881T7KT4xMo
 ybDoQvvRlx/BckjZ2aXES7g3mFR+jAj5W+9Li4QRUlk7vhu8J2D43H9ODym5xlf+DCVIl2
 Zbcw0Yk8pS/E9qbsf7oc0FuyGDIaeXM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-od4DiQJxN2CtC7IZZwkk1w-1; Mon, 26 Jul 2021 11:01:00 -0400
X-MC-Unique: od4DiQJxN2CtC7IZZwkk1w-1
Received: by mail-qk1-f197.google.com with SMTP id
 w26-20020a05620a129ab02903b9eeb8b45dso9034800qki.8
 for <qemu-arm@nongnu.org>; Mon, 26 Jul 2021 08:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bVEPeT2fAo+aTHVkGlK+mH5+bLtJzpS16QGQ1PU5LXY=;
 b=cFWR5GAtuwwkT4ibPP78TMwJizD6H6fQHf1Fvml8ls44uIwCaIWMvuWgW/wzYWaXyE
 jWwFA/hTXNMb9G1iw9UrNEP05tgk7IMBVhqlUxGwUooK5JFQmzVxRYACo4Ms6OaGgqcI
 Kwr3RbKVaOagvHgXRw8/1yGESa38m26QDS/J/iLbTp+6uMXapq72vNC45PJ5ue8SG/wG
 JjBDbGqji2m5KQZ62y05s1ybZ8Lt/x41lTt1KwxRZVzPCuX8d4Zhfyza0o/2TX3VB8Jp
 SnHyqTXHc13ZHkN4w+eSggD3yveIZD5wdVWc7ytETEpM44VToKUaaNaiKNXFoI0sMie2
 +q3g==
X-Gm-Message-State: AOAM531KyImQ40udjBntetfseKX7KBNPhf4LdA055Sc48c/lWgfX7MG9
 03VhwDw+Iu/KIgKBqJD/m0SK1jwAE1Xiw2c0vZq9zHnOTAx93orhiPiWOvX8mvwf3OTzyc3bJgX
 X8cERsKOJtwAH
X-Received: by 2002:a05:620a:1907:: with SMTP id
 bj7mr14142268qkb.315.1627311659797; 
 Mon, 26 Jul 2021 08:00:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1907:: with SMTP id
 bj7mr14142247qkb.315.1627311659624; 
 Mon, 26 Jul 2021 08:00:59 -0700 (PDT)
Received: from gator ([140.82.166.162])
 by smtp.gmail.com with ESMTPSA id l12sm103027qtx.45.2021.07.26.08.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:00:59 -0700 (PDT)
Date: Mon, 26 Jul 2021 17:00:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 0/3] target/arm: Add sve-default-vector-length cpu
 property
Message-ID: <20210726150056.2sis5ssif2l3xjcf@gator>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
 <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_AKpibWQuX4gapGD+u=KCL9-er-ejPGS_cVyNbsuLJJQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.717, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nPr/gaReIVU1

On Mon, Jul 26, 2021 at 01:42:45PM +0100, Peter Maydell wrote:
> On Fri, 23 Jul 2021 at 21:34, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > This is intended to resolve #482.
> >
> > Changes for v2:
> >   * Split out length bounding fix to new patch.
> >   * Use byte units for sve-default-vector-length.
> >   * Support undocumented -1 "maximum".
> >   * Add documentation.
> 
> I'm going to apply this to target-arm.next with the following
> docs tweak squashed into patch 3:
> 
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 4ff36cc83f0..7b97df442aa 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -379,11 +379,14 @@ example's (1), (4), and (6) exhibit recommended
> uses of the properties.
>  SVE User-mode Default Vector Length Property
>  --------------------------------------------
> 
> -For qemu-aarch64, the cpu property `sve-default-vector-length=N` is
> +For qemu-aarch64, the cpu property ``sve-default-vector-length=N`` is
>  defined to mirror the Linux kernel parameter file
> -`/proc/sys/abi/sve_default_vector_length`.  The default length, `N`,
> -is in units of bytes and must be between 16 and 8192.
> +``/proc/sys/abi/sve_default_vector_length``.  The default length, ``N``,
> +is in units of bytes and must be between 16 and 8192.
>  If not specified, the default vector length is 64.
> 
>  If the default length is larger than the maximum vector length enabled
> -with `sve<N>` properties, the actual vector length will be reduced.
> +with ``sve<N>`` properties, the actual vector length will be reduced.
> +
> +If this property is set to ``-1`` then the default vector length
> +is set to the maximum possible length.

This file is full of single backtick usage. Isn't it better to stay
consistent? Or do we need a patch that converts all the rest now?

Thanks,
drew

> 
> thanks
> -- PMM
> 

