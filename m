Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA95EDA682
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 15:13:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxRQm-0001gb-2J; Tue, 03 Mar 2026 10:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRQk-0001Ox-9v
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:13:02 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxRQi-0004Zr-B7
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 10:13:02 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64c9707fc11so4198169d50.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 07:12:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772550778; cv=none;
 d=google.com; s=arc-20240605;
 b=e2/Ibj+rwrGT48PJQQtj84M0moWesGzVeCpBTuxECSPu6R7mZEFkvwisB96gHqNkE8
 4ocXmxbbdtI9EofV7zvf8xAU/dblfl1I2NuSXufVkk6B91lWFiHpQYyLhXN4dIJH0PC1
 bqRmG49yjlTgz0do5xfHTKP7XnO+tgPhd5flgUx8+vJHRo7bnsVrHuMjgAjLIH5o0p9y
 ys+rF6s0IBaMHK+3BPRED3stPLEmULSbQGl5zi7UgNlTToykUDWFfKUdE7wX9wOQfTbM
 GaK2IgWk8FwsETBMUXyRsibvWtHn4TlmZxoXINRUhxOrmaQnst3CUmMEn8iGs8OrPqOI
 SHCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XFNJONuyhx9fILaHKjiZ06HlxX56FG4QbYLqYDjn9Tc=;
 fh=9JvohhDGcqKOXHtXMYSuuLTu4U/UWQXPJ6ZSc14PYfY=;
 b=kWsGkpPx0ouduG2BLO3jluRBkK6wBOglr85Kw1kLQaz8HR0WX0d6O2SMblnXdadU6E
 AcjXL0i0llDXPrZG7NHbS6EdHd85+m9kXEQ/pG1/kzE4Qnn3LWvilp506VhbGD4VIH/2
 e6sXqKvxztlaqui+nQDV2EVR7wuHewlhEDjy45JN5cUBluakQKbxmB/4ki6VxrGpZ1VF
 nZBIKBGu+AiqZEsG6jRCK7OmF6C0qbdMflyJtKaJrkobz3KA3h2OFA4KiEEzCLcRg4zS
 SFoFwKduV9frGVZbeazJaT8yDyCjpI70OvohTD3vTNArX+CLXjmfs6c8aG31aMD0q8yJ
 grdA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772550778; x=1773155578; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XFNJONuyhx9fILaHKjiZ06HlxX56FG4QbYLqYDjn9Tc=;
 b=Y0SS62kJ2wMENdf/husIwrT8gUPnbRVG2XcaTozYyQqBb28sTtjYgf19UZ5ElKLMJB
 FP6kAXomybj2uC8aZBTcYdOg7f4XfTPxuTYit2KZI07JsT/UnTtqUKsbkhZsP8Yz1gPe
 q+JBYejgsCOGIXuRbKueRQf+LD7Cb4HmfDjWT9p0dk2APySOcK/ogi2HMYW8eMVQW/VD
 +Zi9abCudlbW9OrDlD4nr8hYB0JVQMrebgI11Cyvy7tJytL9IDuH+9xnpDd2y5n8MIC0
 oiLjKDDOl+nov6oFSXQ2Fuhe/fv8glDrx7Zur7gCrGWJdjJ6qcSWtod6TAwFT7whmogU
 889Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772550778; x=1773155578;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XFNJONuyhx9fILaHKjiZ06HlxX56FG4QbYLqYDjn9Tc=;
 b=SobHRXM7rHXiH2Sn4pSZJoW8hqf2QzRwoq0IEvXTE7S/m3GZz3FHlF6cBzPkWkn0+M
 TIOdnxINIqF2KdBEtAkl28rGrR4ix0lxdt1yT4SbgpOi+Yg4z1GpkfG1YZ/CnelHnYkd
 rm73zjr9H+Hri36eLGbHjxJXn7xSxtFDBRhbmup6dSUUeqrhwROtNW86GruurpRBBKZ4
 Moi9WzmjJ8LLL0/9lV42XF8wckIPpXkYPc9QP4z3eZ+k16P0s3FJTDrQZlJBtt8u9Hms
 +pgnCjk+TIS4suTqWd5318DlcAvOPh9sOHU+X0AjFyCHXp526NF++avLhEcwyzghODo5
 scFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvCnYN5WgqTufQ+IiMEDtgmDtu2YqV4ioIWPo9MLU29Q9lQUPvi3pJKpe/u/N0QvVmd2uUtKvTDw==@nongnu.org
X-Gm-Message-State: AOJu0YzBY5TFsZKoBY9lnFqdJuVfJEEUda1Zyny7hPzJuQZSYPZ38/Op
 n2i06QS1i6iY1GsqpI5rEQI7E6ky94kAeJzvPQ2pPWRrDsB0ihsfFIfFQBdKvFv4CzLgw99cMUt
 K0ezx+vwHY2I6aWmzmC4LM3g5th3D+BHZQ+fV2bskfQ==
X-Gm-Gg: ATEYQzwUXOlQZvIqGgrOVH16mTjZK72BuDythO84hLTFC/0QxRYfgmyWbuE18+lnQ2s
 oFjA+pQLymph1ZJPDUE/jGw/rtuHQqOoCamkaKk+uZpj/w0bwrJdH25h+bpgj4Jpo9Ygdi6+6+Q
 uoqtiAlwMKcBzfZToAmzAIQKbr1hX4xBEONrNzdGWaqLDxzAW7sS0KDw2i6azO9GTMKmJajFcl5
 /FI3uhuW37DOHc716Pd10rw648GgIvaNiICNBaqinb8TxT4TJQcO1oakdx006DLsXbA59xtCQ3B
 SpbqMNxHyQfPCPsznn1wT47Y5AI3U3WrE4i23J9kWWxL50icnHY7d9ZcDraPgmknQ6OK74jnQ+3
 xNA==
X-Received: by 2002:a05:690e:4499:b0:649:443f:ab2a with SMTP id
 956f58d0204a3-64cc2183cecmr12815874d50.37.1772550777693; Tue, 03 Mar 2026
 07:12:57 -0800 (PST)
MIME-Version: 1.0
References: <20260303143928.1747116-1-eric.auger@redhat.com>
 <20260303143928.1747116-8-eric.auger@redhat.com>
In-Reply-To: <20260303143928.1747116-8-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 15:12:45 +0000
X-Gm-Features: AaiRm50oLXH1wUDKl3YErBgl7t5X-mXJf6g31-oeCs9GInEqCKfTJYmew7SGxdI
Message-ID: <CAFEAcA9zpPwoHtVkbOxPmqNWm1FGcgFieXMsNU3esuXj0BD2RQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/arm/machine: Fix detection of unknown
 incoming cpregs
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 3 Mar 2026 at 14:40, Eric Auger <eric.auger@redhat.com> wrote:
>
> Currently the check of cpreg index matches fail to detect
> a situation where the length of both arrays is same but
> - destination has an extra register not found in the incoming stream (idx1)
> - source has an extra register not found in the destination (idx2)
>   where idx1 < = idx2
> Normally this should fail but it does not.
>
> Fix the logic to scan all indexes.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Fixes: 721fae12536 ("target-arm: Convert TCG to using (index,value) list for cp migration")
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

