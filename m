Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99089E9A047
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Feb 2026 18:43:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsmVl-0006fx-D6; Wed, 18 Feb 2026 13:42:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vsmVj-0006fE-OP
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 13:42:55 -0500
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vsmVi-0004tX-3A
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 13:42:55 -0500
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-64ad62a294bso73787d50.1
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 10:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771440173; cv=none;
 d=google.com; s=arc-20240605;
 b=WHuOoS+a4n7HhvwEelQjyeEr+HexNErlk2l0j+Xz+JD3WjuMOPhTHhww52X9XyxfMB
 QTcq4jM//bRihQFQys54TbAX3/uyfySifgRR3Zj3zc8cprLWm+Jne7yCCDB3DTwGE5ZU
 UG3+0EGdAWs/RIR5L0TpLgzg/5oUsw1rSeq9J5i9N1r9NjKIl2aqoW7vrYiZdsaC8JkE
 F1g7pWJPIZfpGnFn8+Wlu5e1Vphw+lbErx6OuSt+wD4s+pXCuDzKzgXqHeSgJcfUSppC
 j86GdqZJNRgEhVuhK8SL6pBltKxmvMHOyZKmCkFGT3ltw+PJKiDk5dA3hFY1jqbIQeF1
 zZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hborG1zMlrfzhI5hZFpl3ikakzneJZn01y5QKEh6E20=;
 fh=bs113TFHZLMsCOFeS+4llRzvOX3sgN7QWTkiJHyjM90=;
 b=By96ROtiMy7oHNuqMqP9fi8tlFY096nwJP9kHzw/c0yUMwJkYTtmNqPAAqleQDljIM
 U61XPMQTgzoL0GBeZMbwdrdM2ndq0Z4FCYmbG39atQ/TFx6tfA8zuAh4XAxYPh8xZr43
 S3p6CMcatWUGvDi23X9wZPQARDTaEKd+aMcOPnQUBYBOFE85Pu2DmFvZEPzh6KyU9d1A
 GWTA8vXQYJCeGtQth+ZnxMk0j3inYK3OjsoBDSju97B5ZpoxvikwiXadU6cKAp2TJEP0
 c7CQO0IqW1Aw5KC2KRS7BefU93q9BsNMPz6QtR2l3VI2pY5gUvCqcHhEqkzFrl6c/KYp
 onSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771440173; x=1772044973; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hborG1zMlrfzhI5hZFpl3ikakzneJZn01y5QKEh6E20=;
 b=ZSnqSfFQSmK3d7GTO+/ezIS0lZqXxbextSIkuoKdXv9YW69771yGniMnGC7FcPqjzD
 sQgCBUJJeH8Fx+v21OSs+HYof9LGpQNoSRWmx/bHTfPVRdQndcmxn+gczPS6hcvtr059
 lWTam4bwUs92cSWxFlpH75EbLPE+sIOISE7aBDns1q4GA5c/72O9eZ7Jfb5PaN7Z9neg
 I9aRWcvloYaaeKUxTEmS39/BhKsTSrOP/8YuhQ8Dad0SvcZOQYRJK5igY6Fw2vGhc24s
 b3pTIHXwx68oWTPTVoGRD8u5XT/7UPlau4FakEYWv/eZuIYdFUVgjHn0gFRb1ZmF9eTL
 g1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771440173; x=1772044973;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hborG1zMlrfzhI5hZFpl3ikakzneJZn01y5QKEh6E20=;
 b=tqeoVL9HdLabxPaEMFa1zkEzi6JjVlxQJx1SMLMA4aNsxgugu7hUj5a1XtYMW8AFvq
 /3ZSmoEQmc6U1i3AYts8RuH8eBwKPzjIcAXKxalH5hwXgZy+sjCaj21QZZ+4cacrWI4X
 heGroICLu490QoVtwNuA/huVNSOnZ+mzNOB3YwUSPomtdc9aneLfSdMuL9fh/+slXXVF
 qa4EW4YmphZmw8h14BgwB3xbLdr//43XCGlHi9pIGZyjozj4tky7R7wtaYevZHsTe266
 853JSepecY+i8zNd8EcMrp+R8sg1iEF5sVnqPJ423VbjLjErzTCiGtg0PH7x1RQDlbNi
 Teng==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVGzVe9NnEzhvMxCW0FUMTW0q9cHpRJ7IK7BqHn3PvSVvPzAotxk5zLBtH8eEtDZ+7cMMz79enyA==@nongnu.org
X-Gm-Message-State: AOJu0YwI4F3LQQZ1siHQ/M5f0pSvvLMnhbBAjCzVIFNIwypSy+nu9Cy1
 P3qOxiyuRUfA2wb/l7S/id3LYVy+mTdsF/cSRRAZH+EMwMK9Tl1b1KxCe3AOl9/hJeoo6oDwpHD
 06K0bUZ0POIr+NmJS3Ja1eG1nNGh4/nj8J2Jh5JvvvA==
X-Gm-Gg: AZuq6aLrPUp/lLIf1czpzj7dzCxXnET1GRp23sx5i2Edyy1HISy4PIl3dbZ9bZDxwXC
 vygsUKylYd9U2g9pkDWHsbzUkBQnKXpyT3v4skWmJQaaZRpuZVv2p+iAyPUxgzAObcyt1JYjcfr
 QRZE6PRCYdcsSgoPq77IuacJqSBJeSZ+cnlRFogBWDDsl33KNnCttWQ1VaxchZvMq20iFN/S30/
 IneS0wORboYTpBB7lvvMmD/qJzKSYuJsPIEp44lSmab0h/Gk3h+9+ztHNzw7B2xM7RgP5UqZ2lM
 OCtE6QgJ/evGeFtwlRz27tL9Zo8gNFuUUdoDKoUugCJap2WwYLzblZEqUpf3IhqYa6Q=
X-Received: by 2002:a05:690e:12c3:b0:64a:d672:dafb with SMTP id
 956f58d0204a3-64c21a439a1mr11134454d50.8.1771440172666; Wed, 18 Feb 2026
 10:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20260217204754.101223-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260217204754.101223-1-osama.abdelkader@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 Feb 2026 18:42:41 +0000
X-Gm-Features: AZwV_Qhd17K0aDB7kMfbTNYEreTagOs09xtRQOe7PJetSsK648YCQ6eV8ZlWL7U
Message-ID: <CAFEAcA9f1t89K6sJARCoXJqyd=LD85ric_u-yWWXTAZ6MLrwjw@mail.gmail.com>
Subject: Re: [PATCH] whpx: remove duplicate include
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 17 Feb 2026 at 20:48, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> cpu.h is included twice
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
>  target/arm/whpx/whpx-all.c | 1 -
>  1 file changed, 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

