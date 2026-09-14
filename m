Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B334C88E64
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 11:59:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x65LG-0005HB-0o; Mon, 14 Sep 2026 07:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x65L8-0005Am-RB
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:59:15 -0400
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x65L6-0005oe-CX
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 07:59:14 -0400
Received: by mail-yx2-x10.google.com with SMTP id
 956f58d0204a3-66e4ab19125so1627786d50.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 04:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789387151; cv=none;
 d=google.com; s=arc-20260327;
 b=Xd2Edu4rarUBLuLDaFzeUHgICFwaTnlZm+w46Z4ELyukvzk+CJ6tkiYHVrFBArbRSF
 r2RfH84oPMK/AijeE22d8BQD5OW94ArrulW3U5TLKygmmOtkHo5ORkf4oeoAnhhO2gG1
 QcWGGy+dHnJZ6fUn5FICWcEMyxBa9cdBJwas9fcaKpcR/CHuexx5tXeYS7IkHsnAChFO
 7sis5NwQHT9/aFxxE+EC29kjmz/4SQbc9dEyLkusRVX27meoAktIkGcX/l2tY3HpJAdn
 /2uyNwT9zvnxQMVwgjLQJSKcKvsTdt1HT5duTnvmT4eGLvh0e9zYso7rHs+MXYQxjrCu
 vjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fnhva7LPoYK/D5JF5jHXjPSqq2Iw+hR72RT+YCA2CeM=;
 fh=Sxuui8+LLmLCgTebHxvH/zb6/VAyPPX7wpCShOZPZUA=;
 b=BYcCldUiTNjfcuo0M1flkZGQb3LWS4+kt+NtR+rg+VHJYmawPoo37wn1vCrFDASaYm
 yqZg9/A6/GJMlkJENrZJJtcfx0K5xe4KkKyPNC1MSwmc1jSSji/sPIe/qoNBW4IodrYz
 Ske76w9tA63T5SUJnhAvsafRgavLY8vjF6B4LrEAd07OB4OoLjTauqE08Os7Sk5iZ9v1
 QoarVe9nHkcH/MF4uIiIZV2oC/O6XfTRSwhPnIrUXq4CA/uisEFg5HgOOwgFhXnxb9Ty
 kwpV/flmT+hyhCETKkxQWnPwIcjS5B1/8H3GuXNYsTTs/6Kw3nyrzeBUQjXydOwXexSD
 XX2A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789387151; x=1789991951; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fnhva7LPoYK/D5JF5jHXjPSqq2Iw+hR72RT+YCA2CeM=;
 b=QIWQwVEh5avSKn+GiOlucflyEy1aI11Br4RbJA/eDBluackWaoS1jmokX3zxc2fM2G
 CRz4N3QJB+09etWXbMPptRDVfbGp6WKl/9NuIUDfSd1PPVcZNMUr67O51LnBuaXkYvCU
 KhxIW9R2F5Nj7JexsLmvG/sbhKq61vRSLCYP74gELcyrU9s4ICcO0PYcUEt23kNbU73S
 vPyAGwyiYFv6r4GZDgdjUoZ4isvDvga2LjdOZV5p5YxO7Q6Frd25VLtFrwnYDZ4hY0tf
 3G8M6tvVCdnRBYU81em3dHUubv5P5xxx/wjyUyHP9KqLUSCESZYWWljtbw6LAlly5tzK
 gJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789387151; x=1789991951;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fnhva7LPoYK/D5JF5jHXjPSqq2Iw+hR72RT+YCA2CeM=;
 b=ARyVW3rhMPpltvymcN7jtSHi1R0l1wRUXuZikjWuD23g79fj3dIzgk4VQFp2a7t254
 /Ldq3h8xuGI43wDx9T4rzKe+MFxvW2F5kaxPU+lifdgjIJloHUSh6sJSgJUHs/VRoifh
 JVUtqvyRHwUkvZXqtxQ1I6i7PMU36y/f53GKwTdzwi3y6TyU+YZh7l+/4tAwNGmgldgF
 6rxp3/NbaoyVw13KrSWFxsn0d5ZGarJuGNe/DaesrwWcXSt6LrtGuV+oiUs/8tWFo3O+
 sAcgSiexV71yH0B2eIm6C+GBTNskgaEEVneNhaOwqI+tPLEN5YQl6TyOq6z5wQQ6vQE3
 zWtg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIDXcswwnT/eBtJ02/fJQEw9EVw/j+3dgbHWZfHYscSMmL0DgEmMmKSlPEXy3hC7bewOzq5wdC+g==@nongnu.org
X-Gm-Message-State: AFuF++kOqQJP+7y1i1VIzYviNG95ILV1kRYoKM2PcKdRjNF7KpMGmuGl
 jMOtbwEdw1OmYZXSCopKr+ainAFn/jI0juYTbvvg2nqr8G8Js72xiHw5xClq96UqQmaN/wW3/SS
 D8AF9dscIQPJetfFN05rtb6gVovF+KhZU3GxD1Nhf1Q==
X-Gm-Gg: AYBFou2+BDLqdnc7jGbzt3/KVsu1jNdO8fbQ+iddHyEgSdl3qTcvNkjM5gV2h/PWJo2
 0X3YZHBnUxvvmI8tjvbNwiv5gH7IALnxcPrPy/FhkTkowF2cuH3c/zCojFYt1g2jS5D+JuA5buY
 GVUWDwjRQGbe7nKl6McYQmL7Of25sGD68jgcLDBVOYrhJdqJW3ApHGgKEw/MJMzIl1WYppNgMeO
 SywmPl80oDJ0kXd1gZYdtg9XC1Su+RyA/bbd2wxq6M4JDCQXz7Yyys05s+ibBVCyCL6KowAKZi7
 sKVUWRDwRPjQRMm7nPl+tceETYVMh+g4n4oooHK4zhZE3RUms6bYxEHDfAojA5qhbkh6d8P8ZGb
 aRwt9XZDcHNGdtn0yvNBe9Wk1IraPHS4cXPnjpHI=
X-Received: by 2002:a05:690e:480c:b0:66d:13ee:2daf with SMTP id
 956f58d0204a3-6714e18f7b4mr537519d50.43.1789387150809; Mon, 14 Sep 2026
 04:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-qdev-v4-0-93f849b4865c@rsg.ci.i.u-tokyo.ac.jp>
 <20260914-qdev-v4-1-93f849b4865c@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260914-qdev-v4-1-93f849b4865c@rsg.ci.i.u-tokyo.ac.jp>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Sep 2026 12:58:57 +0100
X-Gm-Features: AcwNN1UwreZnlRRIv6P19W509TmiY_Pgb7aRWLozzU6JkzCi0_cHY4qtftDjFQ8
Message-ID: <CAFEAcA-txsTd=QnpnemTd0hkfOmSgCmk938JWDWb7MJAkwq63Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] qdev: Clarify instantiation and realization
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, 
 FangSheng Huang <FangSheng.Huang@amd.com>,
 Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Nicholas Piggin <npiggin@gmail.com>, Aditya Gupta <adityag@linux.ibm.com>, 
 Glenn Miles <milesg@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 qemu-ppc@nongnu.org, Alex Williamson <alex@shazbot.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Hendrik Brueckner <brueckner@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 Luc Michel <luc@lmichel.fr>, 
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::10;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x10.google.com
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

On Mon, 14 Sept 2026 at 10:33, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> The distinction of instantiation and realization was vague in the old
> documentation so this change clarifies it.
>
> The old documentation said:
> > The former may not fail (and must not abort or exit, since it is
> > called during device introspection already), and the latter may return
> > error information to the caller and must be re-entrant.
> > Trivial field initializations should go into #TypeInfo.instance_init.
> > Operations depending on @props static properties should go into
> > @realize.
>
> The first problem with the old documentation is that it is unclear what
> "trivial field initializations" means and why triviality makes
> initialization appropriate for #TypeInfo.instance_init. Another problem
> is that the documentation is not comprehensive enough; for example, it
> mentions @props static properties, but it does not say anything about
> the other properties.
>
> The keys to distinguish instantiation and realization are instance
> property setting and device introspection. The fact that initial
> instance property setting happens after #TypeInfo.instance_init and
> before realization implies that operations depending on properties
> should go into @realize.
>
> The fact that instantiation happens during device introspection but
> realization does not implies:
> - Instance properties may be added in #TypeInfo.instance_init.
> - Instantiation must not have any side effect not contained in the
>   instance.
> - Any operations without special requirements should go into @realize so
>   that they can be skipped during device introspection.
> - Instance properties added during realization will not be configurable
>   or introspectable before realization.
>
> Note these two facts to guide appropriate instantiation and realization.
>
> We also omit mention of the realized property because it is a QOM
> interface detail, not part of the device API.
>
> The statements regarding a future prospect to propagate the realization
> state change are removed. Device realization is propagated to child
> buses, but not to the devices on those buses. The proposed recursive
> propagation to child devices has not been achieved after 13 years, has
> been questioned [1], and is not relevant with the current API usage.
>
> [1] https://lore.kernel.org/qemu-devel/878syd84s3.fsf@dusky.pond.sub.org/
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  include/hw/core/qdev.h | 42 ++++++++++++++++++++----------------------
>  1 file changed, 20 insertions(+), 22 deletions(-)
>
> diff --git a/include/hw/core/qdev.h b/include/hw/core/qdev.h
> index f054a214fc6a..b1c5f4780a90 100644
> --- a/include/hw/core/qdev.h
> +++ b/include/hw/core/qdev.h
> @@ -23,27 +23,27 @@
>   * Realization
>   * -----------
>   *
> - * Devices are constructed in two stages:
> + * Devices are constructed in the following order:
>   *
> - * 1) object instantiation via object_initialize() and
> - * 2) device realization via the #DeviceState.realized property
> + * 1) #TypeInfo.instance_init
> + * 2) pre-realize property value setting
> + * 3) device realization
>   *
> - * The former may not fail (and must not abort or exit, since it is called
> - * during device introspection already), and the latter may return error
> - * information to the caller and must be re-entrant.
> - * Trivial field initializations should go into #TypeInfo.instance_init.
> - * Operations depending on @props static properties should go into @realize.
> - * After successful realization, setting static properties will fail.
> + * #TypeInfo.instance_init may not fail. #DeviceClass.realize can
> + * fail, returning error information to the caller, and must be re-entrant.
> + *
> + * #TypeInfo.instance_init should add instance properties but must not
> + * have any side effect not contained in the instance, since it happens
> + * during device introspection already. Any operations without special

Delete "already".

> + * requirements should go into @realize so that they can be skipped
> + * during device introspection. It is possible to add properties
> + * during realization, but they will not be introspectable or
> + * configurable before realization.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

