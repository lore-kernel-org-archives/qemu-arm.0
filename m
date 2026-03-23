Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197A4F46101
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 13:29:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4fKz-0006ms-MU; Mon, 23 Mar 2026 09:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4fJy-0006R0-Bk
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 09:27:57 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4fJg-00013j-Ik
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 09:27:53 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-64aedd812baso192239d50.3
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 06:26:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774272402; cv=none;
 d=google.com; s=arc-20240605;
 b=IV9U+k2XzZYiMaFuHYI8NXQSQzVfnQvZjR+eiupmQqdTOiloDMg+G4pNmPmAEnuQbt
 /PbY2uiugauDW4naiYUvpxLjTiqSb8G+SFD4nS7mp5dNfMAg5Me+xfzvLpdDCG5m8fVU
 9kuwACqOeIyo5zp7MbqT8H/esbsb3+k1gSzkmyxAsZWiM3YU2pE0VmpZ+BRrV+GkI1ua
 g/auoCQf/+WFczcKPhmnZGVWLHxMCk0VFLM5YwUz6I+Q0KyoKsM8HJ5+Q/8YXK6Fa2Kw
 SxKGZFkMbJGfEyeOdcxuyKjTvXD8pHg/cwFqkVYonr+/bSAIiEiZyCBJVdck8T3/9cJl
 zdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZMPhbqAC1qtdpr4ZKzbcLLAslk2BpexcsQvFVErQQ1Y=;
 fh=rug48NcEQK+kcFAlLEouODCcONopcM57WH0ElQfsaNM=;
 b=bG3zxctzMqfleBoL51Ucrej5KKzIZfBr3duww9JI2qq9h7pBpiU0OY7DsLQN9+iZgp
 t7G8A4EsHuOMLbdfsZIVMFY+Cq+L8SDWm47KNEFdoMVeZyV0+UhYYrSt604adgs9HpTn
 UO4eus+nCYHOmwfkkEI0MxGjsIGS8C5/RJR3oDHy9PokTku37bMGUSkj/O0LR6ImwyEW
 3RlKBUJgg6UdtIj6YGiKAtyOkWJ8V+6+tX3eEkNC8FZC5DswNSesqjfpyP+5xamqxRaS
 FYKimW1fzJnCQVJ1V4p+lKxkIT61aO/I1O6LD4IQtTTiJHerSrRQd0pKaATFsa7mqrsK
 yc3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774272402; x=1774877202; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMPhbqAC1qtdpr4ZKzbcLLAslk2BpexcsQvFVErQQ1Y=;
 b=YD6IrMNP5tpm2z1/k+8lbhHXEiNdvsU2au13/fnHEywfDGyc0MvbBIeRdRWNzTx24z
 qWwYaAWL+esutZVsuQTn0botAVT4XvhiGnXYM1LS9D3mDN4qvGy2QJE9HQwm0sXHVYl9
 QdfF3P52i5yOBSm+V2nkcX+ra3O/OQfocXW2UbwxoyNFao+zqelFnkKkgEO9at/C9ku8
 s9xNnqH5Ojv/rZUp5BADNIJzjYvE/GZ79pgF+QII1LrAxSWlebGNLj60+qbvvXbs6iIz
 TBlGFOulrECWtWXXGbmCZVPM35QIe52YUo2nuGNcM/B88Qxxz0j49R9R7a7b1vuYQ/jx
 17yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774272402; x=1774877202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZMPhbqAC1qtdpr4ZKzbcLLAslk2BpexcsQvFVErQQ1Y=;
 b=KK8e2gds5pcuewcsWxkzwrdrUjbKtIUY+ALJsKmPEmb232nkXUGuDDyyFfI7V9p/t4
 NTqPcaH7B5zJ29pxc3JwnLk0+PcKg86qRwDTjHec7dO1sAGNmid4SVRo3yxZ9yW6kvS5
 552gInCoq2/mHOth3ZxSiSBNnRZAGOAtRcB4qqJfsorfFIOxPkpKPKSU/BUJWGuIQGhN
 0KMcvojJ39GgbPRb1fK8yVmo8PmC4/6Cp3B1oF4rqwNFwy+3SoozngfKZ63wGKqjHcl6
 76N3YJ27Gk+wrKDBkWelZuy4SpinAUYP9IGpXdp/hRpGgYiJEB8Ykz2O1NshT/VGqZ4M
 B0Jw==
X-Gm-Message-State: AOJu0YxQsRvywTK6DJzCGWxgpgMi7p8lg+RgEB5cL7Bt3rg5ZKDXlmxd
 D+EFhQ4emDUtT/t5KOHW2pXRVjBV/upBtwjB9nouFXYRA7q7PnTiMplOO/RZC9fvO5Q1xOj1DD+
 fRScOC7JEuTPaKmiq8/s4CCUMaI+vNQSviQlvWseQRg==
X-Gm-Gg: ATEYQzyepX+T09cq/SwcPujZVeYUXtGLpOQAnuBDgXvRLMfuEw1R/mLufosLRCqVHNe
 M8NjoWRugIEJYloTSGTRt1sMI+mYNavERpjLe0gRYx9s/pdyBUZ91JGD5xxqSKXditjFHBgyxvz
 Q120zyzIvE20157lCPqV80WtDxhkEuu2ad8UzsjUX9f1gevacwMMHFSQvO3vWt+MdjvMpQlykJt
 vmj2OoJRE+6uysMTFQ5Np3ozZEJfGiEexV4j0g63M394ADLC1gsv1DKSYoxZt7jIR7b+zjcqnkp
 izw+RN2b8YtdIyEH8vT06VpWJBtSkaqw58GBso8vbSESm6+gAHZ/IrVoaXXSw7Qsm/0=
X-Received: by 2002:a05:690c:e4d5:b0:79a:55f5:a422 with SMTP id
 00721157ae682-79a90aeaea8mr106937857b3.22.1774272402098; Mon, 23 Mar 2026
 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260223170212.441276-1-peter.maydell@linaro.org>
 <20260223170212.441276-2-peter.maydell@linaro.org>
 <8a696b3a-f55d-4c9b-ba0b-34c5391de28b@linaro.org>
In-Reply-To: <8a696b3a-f55d-4c9b-ba0b-34c5391de28b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 13:26:29 +0000
X-Gm-Features: AaiRm53xo-peWTQ0Jy8trZQiQvUueAOKy5akaOcvMNd2czGSk17zUDXnGihWrQw
Message-ID: <CAFEAcA8BqCzbmcLK6D4sGEe6=Vg2+i+GHeqsnGgW2E87d=Osig@mail.gmail.com>
Subject: Re: [PATCH 01/65] hw/core: Permit devices to define an array of link
 properties
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, 21 Mar 2026 at 15:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> (+Kevin / Markus / Mark for previous discussions)
>
> On 23/2/26 18:01, Peter Maydell wrote:
> > Currently we allow devices to define "link properties" with
> > DEFINE_PROP_LINK(): these are a way to give a device a pointer to
> > another QOM object.  (Under the hood this is done by handing it the
> > canonical QOM path for the object.)
> >
> > We also allow devices to define "array properties" with
> > DEFINE_PROP_ARRAY(): these are a way to give a device a
> > variable-length array of properties.
> >
> > However, there is no way to define an array of link properties.  If
> > you try to do it by passing qdev_prop_link as the arrayprop argument
> > to DEFINE_PROP_ARRAY() you will get a crash because qdev_prop_link
> > does not provide the .set and .get methods in its PropertyInfo
> > struct.
> >
> > This patch implements a new DEFINE_PROP_LINK_ARRAY().


> Nitpicking, I'd add object_resolve_and_typecheck() in a preliminary
> patch. Otherwise patch LGTM!
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Thanks. I've split the patch in two (it splits exactly into
"changes to object.[ch]" and "changes to qdev-properties.[ch]")
and added your R-by tag to both the resulting patches.

-- PMM

